Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054A561423
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 10:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3864B112F4D;
	Thu, 30 Jun 2022 08:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBCF112F42;
 Thu, 30 Jun 2022 08:06:27 +0000 (UTC)
Received: from fsav113.sakura.ne.jp (fsav113.sakura.ne.jp [27.133.134.240])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25U86JDk084885;
 Thu, 30 Jun 2022 17:06:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav113.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp);
 Thu, 30 Jun 2022 17:06:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav113.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25U86Jfo084879
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 30 Jun 2022 17:06:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c379bbe5-a416-7757-b0e3-1b767bb5a775@I-love.SAKURA.ne.jp>
Date: Thu, 30 Jun 2022 17:06:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: How to convert drivers/gpu/drm/i915/ to use local workqueue?
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <bdf23a1c-0d89-c395-4a7a-2840ce5f639a@I-love.SAKURA.ne.jp>
 <98c6d61e-0c0f-e385-6100-6b7ebe6874b1@linux.intel.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <98c6d61e-0c0f-e385-6100-6b7ebe6874b1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/06/30 16:46, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 10/06/2022 15:57, Tetsuo Handa wrote:
>> Hello.
>>
>> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using
>> a macro") explains, we are removing flush_scheduled_work() calls. And now
>>
>>    drivers/gpu/drm/i915/display/intel_display.c
>>    drivers/gpu/drm/i915/gt/selftest_execlists.c
>>
>> are the last flush_scheduled_work() callers which have no patch proposed.
>> I want to make a patch like
>> https://lkml.kernel.org/r/e9b95132-89cd-5cfc-1a09-966393c5ecb0@I-love.SAKURA.ne.jp
>> but I couldn't understand how to interpret drivers/gpu/drm/i915/ part.
> 
> Could you provide some more context please? I did not immediately understand
> whether the goal is remove flush_schedule_work helper with no arguments, or
> actually stop drivers using the system work queues.

The goal is to remove flush_schedule_work().

Any kernel module is expected to stop using system workqueues if that module
needs to call flush_scheduled_work() or flush_workqueue(system_*_wq).
Continuing use of system workqueues is OK as long as that module does not
need to call flush_scheduled_work() nor flush_workqueue(system_*_wq).

All in-tree kernel modules stopped calling flush_workqueue(system_*_wq) in 5.19.

Many of in-tree kernel modules already have patches for stop calling
flush_scheduled_work(). But gpu/drm/i915 is one of in-tree kernel modules
which do not have patches for stop calling flush_scheduled_work().

I want help from those who are familiar with this module.

Regards.

