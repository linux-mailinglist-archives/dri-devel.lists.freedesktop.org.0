Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFD3CFD62
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084B06E429;
	Tue, 20 Jul 2021 15:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265316E429;
 Tue, 20 Jul 2021 15:22:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="191535496"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="191535496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 08:22:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="657573547"
Received: from ekearns1-mobl.amr.corp.intel.com (HELO [10.213.195.253])
 ([10.213.195.253])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 08:22:21 -0700
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: Always call i915_globals_exit()
 from i915_exit()
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210719183047.2624569-1-jason@jlekstrand.net>
 <20210719183047.2624569-4-jason@jlekstrand.net>
 <6ecf6891-67c2-94ac-32ce-28c1a1a7db0b@linux.intel.com>
 <CAOFGe96CemtS4hBoOR8g+V-6synP_WNdHj3ed0MgRaNasV24Xw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <680ab018-920b-dccf-56b1-511868f6a017@linux.intel.com>
Date: Tue, 20 Jul 2021 16:22:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe96CemtS4hBoOR8g+V-6synP_WNdHj3ed0MgRaNasV24Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/07/2021 15:53, Jason Ekstrand wrote:
> On Tue, Jul 20, 2021 at 3:25 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 19/07/2021 19:30, Jason Ekstrand wrote:
>>> If the driver was not fully loaded, we may still have globals lying
>>> around.  If we don't tear those down in i915_exit(), we'll leak a bunch
>>> of memory slabs.  This can happen two ways: use_kms = false and if we've
>>> run mock selftests.  In either case, we have an early exit from
>>> i915_init which happens after i915_globals_init() and we need to clean
>>> up those globals.  While we're here, add an explicit boolean instead of
>>> using a random field from i915_pci_device to detect partial loads.
>>>
>>> The mock selftests case gets especially sticky.  The load isn't entirely
>>> a no-op.  We actually do quite a bit inside those selftests including
>>> allocating a bunch of mock objects and running tests on them.  Once all
>>> those tests are complete, we exit early from i915_init().  Perviously,
>>> i915_init() would return a non-zero error code on failure and a zero
>>> error code on success.  In the success case, we would get to i915_exit()
>>> and check i915_pci_driver.driver.owner to detect if i915_init exited early
>>> and do nothing.  In the failure case, we would fail i915_init() but
>>> there would be no opportunity to clean up globals.
>>>
>>> The most annoying part is that you don't actually notice the failure as
>>> part of the self-tests since leaking a bit of memory, while bad, doesn't
>>> result in anything observable from userspace.  Instead, the next time we
>>> load the driver (usually for next IGT test), i915_globals_init() gets
>>> invoked again, we go to allocate a bunch of new memory slabs, those
>>> implicitly create debugfs entries, and debugfs warns that we're trying
>>> to create directories and files that already exist.  Since this all
>>> happens as part of the next driver load, it shows up in the dmesg-warn
>>> of whatever IGT test ran after the mock selftests.
>>
>> Story checks out but I totally don't get why it wouldn't be noticed
>> until now. Was it perhaps part of the selfetsts contract that a reboot
>> is required after failure?
> 
> No.  They do unload the driver, though.  They just don't re-load it.

I guess that does mean behaviour is reboot after first selftests 
failure, which would explain why it wasn't caught until now. I was 
running selftests and I know why I did not see it but that shall not be 
mentioned here. :)

>>> While the obvious thing to do here might be to call i915_globals_exit()
>>> after selftests, that's not actually safe.  The dma-buf selftests call
>>> i915_gem_prime_export which creates a file.  We call dma_buf_put() on
>>> the resulting dmabuf which calls fput() on the file.  However, fput()
>>> isn't immediate and gets flushed right before syscall returns.  This
>>> means that all the fput()s from the selftests don't happen until right
>>> before the module load syscall used to fire off the selftests returns
>>> which is after i915_init().  If we call i915_globals_exit() in
>>> i915_init() after selftests, we end up freeing slabs out from under
>>> objects which won't get released until fput() is flushed at the end of
>>> the module load.
>>
>> Nasty. Wasn't visible while globals memory leak was "in place". :I
>>
>>> The solution here is to let i915_init() return success early and detect
>>> the early success in i915_exit() and only tear down globals and nothing
>>> else.  This way the module loads successfully, regardless of the success
>>> or failure of the tests.  Because we've not enumerated any PCI devices,
>>> no device nodes are created and it's entirely useless from userspace.
>>> The only thing the module does at that point is hold on to a bit of
>>> memory until we unload it and i915_exit() is called.  Importantly, this
>>> means that everything from our selftests has the ability to properly
>>> flush out between i915_init() and i915_exit() because there are a couple
>>> syscall boundaries in between.
>>
>> When you say "couple of syscall boundaries" you mean exactly two (module
>> init/unload) or there is more to it? Like why "couple" is needed and not
>> just that the module load syscall has exited? That part sounds
>> potentially dodgy. What mechanism is used by the delayed flush?
>>
>> Have you checked how this change interacts with the test runner and CI?
> 
> By the end of the series, a bunch of tests are fixed.  In particular,
> https://gitlab.freedesktop.org/drm/intel/-/issues/3746

Wait but that means CI does reload the driver. So again I totally don't 
understand why this is only popping up now.

Regards,

Tvrtko
