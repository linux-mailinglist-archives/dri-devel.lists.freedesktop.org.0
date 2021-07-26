Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233613D55FC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 10:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A31F6E89A;
	Mon, 26 Jul 2021 08:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F126E86D;
 Mon, 26 Jul 2021 08:57:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="192464505"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="192464505"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 01:57:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="436703204"
Received: from jdonohue-mobl.ger.corp.intel.com (HELO [10.213.215.117])
 ([10.213.215.117])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 01:57:09 -0700
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification
To: Daniel Stone <daniel@fooishbar.org>
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <20210715091820.1613726-7-tvrtko.ursulin@linux.intel.com>
 <CAPj87rMxvq2c9uQ-ArvsLo2M7rXq=7LiJZ_XJwST=1VDhhNXRA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4e192c14-c7ba-cb65-966e-589c09e0e80b@linux.intel.com>
Date: Mon, 26 Jul 2021 09:57:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rMxvq2c9uQ-ArvsLo2M7rXq=7LiJZ_XJwST=1VDhhNXRA@mail.gmail.com>
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
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/07/2021 17:43, Daniel Stone wrote:
> Hi Tvrtko,
> Thanks for typing this up!
> 
> On Thu, 15 Jul 2021 at 10:18, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> +Mandatory fully standardised keys
>> +---------------------------------
>> +
>> +- drm-driver: <str>
>> +
>> +String shall contain a fixed string uniquely identified the driver handling
>> +the device in question. For example name of the respective kernel module.
> 
> I think let's be more prescriptive and just say that it is the module name.

I liked the drm_driver.name the other Daniel made so I'll go with that.

>> +Optional fully standardised keys
>> +--------------------------------
>> +
>> +- drm-pdev: <aaaa:bb.cc.d>
>> +
>> +For PCI devices this should contain the PCI slot address of the device in
>> +question.
> 
> How about just major:minor of the DRM render node device it's attached to?

I don't have a strong opinion on this one. I can add it, but might keep 
the drm-dev tag under the optional list because it is handy for 
intel_gpu_top multi-device support. Or maybe the lookup to pci device is 
easier than I think now so okay, on my todo list to check.

>> +- drm-client-id: <uint>
>> +
>> +Unique value relating to the open DRM file descriptor used to distinguish
>> +duplicated and shared file descriptors. Conceptually the value should map 1:1
>> +to the in kernel representation of `struct drm_file` instances.
>> +
>> +Uniqueness of the value shall be either globally unique, or unique within the
>> +scope of each device, in which case `drm-pdev` shall be present as well.
>> +
>> +Userspace should make sure to not double account any usage statistics by using
>> +the above described criteria in order to associate data to individual clients.
>> +
>> +- drm-engine-<str>: <uint> ns
>> +
>> +GPUs usually contain multiple execution engines. Each shall be given a stable
>> +and unique name (str), with possible values documented in the driver specific
>> +documentation.
>> +
>> +Value shall be in specified time units which the respective GPU engine spent
>> +busy executing workloads belonging to this client.
>> +
>> +Values are not required to be constantly monotonic if it makes the driver
>> +implementation easier, but are required to catch up with the previously reported
>> +larger value within a reasonable period. Upon observing a value lower than what
>> +was previously read, userspace is expected to stay with that larger previous
>> +value until a monotonic update is seen.
> 
> Yeah, that would work well for Mali/Panfrost. We can queue multiple
> jobs in the hardware, which can either be striped across multiple
> cores with an affinity mask (e.g. 3 cores for your client and 1 for
> your compositor), or picked according to priority, or ...
> 
> The fine-grained performance counters (e.g. time spent waiting for
> sampler) are only GPU-global. So if you have two jobs running
> simultaneously, you have no idea who's responsible for what.
> 
> But it does give us coarse-grained counters which are accounted
> per-job-slot, including exactly this metric: amount of 'GPU time'
> (whatever that means) occupied by that job slot during the sampling
> period. So we could support that nicely if we fenced job-slot updates
> with register reads/writes.
> 
> Something I'm missing though is how we enable this information. Seems
> like it would be best to either only do it whilst fdinfo is open (and
> re-read it whenever you need an update), or on a per-driver sysfs
> toggle, or ... ?

Presumably there is non-trivial cost for querying this data on your driver?

Would it be workable to enable tracking on first use and stop some time 
after last? Just a thought which may have significant downsides from 
driver to driver.

>> +- drm-memory-<str>: <uint> [KiB|MiB]
>> +
>> +Each possible memory type which can be used to store buffer objects by the
>> +GPU in question shall be given a stable and unique name to be returned as the
>> +string here.
>> +
>> +Value shall reflect the amount of storage currently consumed by the buffer
>> +object belong to this client, in the respective memory region.
>> +
>> +Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>> +indicating kibi- or mebi-bytes.
> 
> I'm a bit wary of the accounting here. Is it buffer allocations
> originating from the client, in which case it conceptually clashes
> with gralloc? Is it the client which last wrote to the buffer? The
> client with the oldest open handle to the buffer? Other?

Haven't looked into AMD code here so know what they export.

Gralloc allocates buffer from it's own drm client and shares them or it 
is just a library which runs from a client context?

Regards,

Tvrtko



