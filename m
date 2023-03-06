Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715D86ABDFD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA7210E203;
	Mon,  6 Mar 2023 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC1910E0B0;
 Mon,  6 Mar 2023 11:17:12 +0000 (UTC)
Received: from fsav412.sakura.ne.jp (fsav412.sakura.ne.jp [133.242.250.111])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 326BH2Mm029087;
 Mon, 6 Mar 2023 20:17:02 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav412.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp);
 Mon, 06 Mar 2023 20:17:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav412.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 326BH2xd029081
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 6 Mar 2023 20:17:02 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b67894b5-6bdd-fb1c-d85e-8a00a39a6276@I-love.SAKURA.ne.jp>
Date: Mon, 6 Mar 2023 20:17:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915: avoid flush_scheduled_work() usage
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <32df5def-ad1a-e1aa-d2fe-f3c37cb01032@I-love.SAKURA.ne.jp>
 <87sfeita1p.fsf@intel.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <87sfeita1p.fsf@intel.com>
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

On 2023/03/06 20:05, Jani Nikula wrote:
> On Fri, 03 Mar 2023, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
>> On 2023/03/03 19:11, Tetsuo Handa wrote:
>>> @@ -79,6 +81,7 @@ static int __init i915_init(void)
>>>  {
>>>  	int err, i;
>>>  
>>> +	i915_wq = alloc_workqueue("i915", 0, 0);
>>
>> Oops. I forgot to add
>>
>> 	if (!i915_wq)
>> 		return -ENOMEM;
>>
>> here. But I'd like to wait for your response for a while before submitting v2 patch.
> 
> Looks like accounting for every schedule_work() and friends that we have
> is pretty difficult at this point, so I agree going for a local
> workqueue and flushing that is probably the way to go. Work specific
> cleanups can follow.
> 
> However, we really don't want to add new module globals, not for this,
> not for anything. So for most things it would have to be i915 device
> specific. And that, in turn, would have to be two workqueues, one for
> display, one for other stuff. Don't want to mix the two.
> 

Thank you for responding. Please go that way.
(I'm not familiar enough to propose a patch.)

