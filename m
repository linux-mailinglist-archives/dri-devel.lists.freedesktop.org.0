Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF66A00E0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 02:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5139210E498;
	Thu, 23 Feb 2023 01:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF7910E498
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 01:51:20 +0000 (UTC)
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 31N1pDD2024309;
 Thu, 23 Feb 2023 10:51:13 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Thu, 23 Feb 2023 10:51:13 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 31N1pDqV024305
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 23 Feb 2023 10:51:13 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3d82949d-9951-abf3-134a-8734ec81af3b@I-love.SAKURA.ne.jp>
Date: Thu, 23 Feb 2023 10:51:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] How is the progress for removing
 flush_scheduled_work() callers?
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <e170edc2-e5b9-4c8b-4ed3-7e2d7a2850dc@I-love.SAKURA.ne.jp>
 <877czv2ov8.fsf@intel.com> <Y3TgO7pHo9z9FINO@intel.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Y3TgO7pHo9z9FINO@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/11/16 22:06, Ville Syrjälä wrote:
> On Wed, Nov 16, 2022 at 12:08:27PM +0200, Jani Nikula wrote:
>> On Sun, 06 Nov 2022, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
>>> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
>>> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
>>> We are on the way for removing all flush_scheduled_work() callers from
>>> the kernel, and there are only 4 callers remaining as of linux-20221104.
>>>
>>>   drivers/gpu/drm/i915/display/intel_display.c:8997:      flush_scheduled_work();
>>
>> Thanks for the reminder, I've pinged folks to get someone working on
>> this. We do schedule quite a bunch of work, so it's not immediately
>> obvious (at least to me) what exactly needs flushing.
> 
> Here's my earlier cursory analysis of the subject:
> https://lore.kernel.org/intel-gfx/Yy3byxFrfAfQL9xK@intel.com/

Now that a patch for mptscsih.c was proposed as
https://lkml.kernel.org/r/0b9ebcfb-b647-1381-0653-b54528a64a86@I-love.SAKURA.ne.jp ,
intel_display.c is going to become the last flush_scheduled_work() user.

If fixing the hpd disable path takes more time, should we start with moving
related works from system_wq to a local workqueue dedicated for intel_display.c ?

> 
>>
>> https://gitlab.freedesktop.org/drm/intel/-/issues/7546
>>
>>>   drivers/gpu/drm/i915/gt/selftest_execlists.c:88:        flush_scheduled_work();
>>
>> Removed by commit 7d33fd02dd94 ("drm/i915/selftests: Remove
>> flush_scheduled_work() from live_execlists") in drm-next.
>>
>> BR,
>> Jani.
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
> 

