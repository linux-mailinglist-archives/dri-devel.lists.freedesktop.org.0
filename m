Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654F47EEA9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 12:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449EB10E429;
	Fri, 24 Dec 2021 11:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E916510E39C;
 Fri, 24 Dec 2021 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640347029; x=1671883029;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LxVz7M5AL6EhCB7v4ybLJncnuXrwzGaXS5gRd0wej/k=;
 b=F+z4POblYOIP0FA0eHVEJPiAATj9QjFv+fuU8f4O8HH4ZCZYPevlgl4b
 dN4+ykIFNJhC7IEZVqXvZQUYmevoJroutoLiN4EJVFkKLMYlra8G+kNdc
 gcC27IHeQ72435I77FzlmNkd3ZLQL4cNcZ0qySIlK9JAO4UuVbe3ZdPxw
 P+zy91T70Ankx4V8SLJniog0Acq2cok5DxuKxfcOv4PuXeMNQL9yLhVMb
 qlon9NR+7htQ1ajFmEUX1q5w/66rHDmrqiRJPMRp09e2ckG8PMN/mT4SV
 6zcJNufnQwkUtSkp1DGm9wV7gew8ZO1ax013wZWZDlKyEzlnynZE+l0Xe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="304337165"
X-IronPort-AV: E=Sophos;i="5.88,232,1635231600"; d="scan'208";a="304337165"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 03:57:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,232,1635231600"; d="scan'208";a="468824730"
Received: from conorgex-mobl.ger.corp.intel.com (HELO [10.213.229.158])
 ([10.213.229.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 03:57:08 -0800
Message-ID: <d025bad6-da69-e51e-7bc7-3d65968d5d21@linux.intel.com>
Date: Fri, 24 Dec 2021 11:57:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
 <20211217162254.GA22048@jons-linux-dev-box>
 <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
 <1c3b1b53-0e9e-a89c-1a77-90cbc229c637@intel.com>
 <01320c8c-a9c9-8c21-7601-75860bf11838@linux.intel.com>
 <1d78552e-8a7c-84c5-a9e6-7c7476a5e2e5@intel.com>
 <5921ac11-1286-1062-f702-f33bc55e4a0e@linux.intel.com>
 <a00f0ff4-83ef-e267-1f0a-06e6953083f9@intel.com>
 <f860344e-2ef4-99f2-c498-9cbe9ea3b1c0@linux.intel.com>
 <73fa5b6e-d5a7-b988-8bef-4251b7e40027@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <73fa5b6e-d5a7-b988-8bef-4251b7e40027@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/12/2021 17:35, John Harrison wrote:

[snip]

>>> On the other hand, the GuC log is useful for debugging certain issues 
>>> and it is included automatically in the sysfs error capture along 
>>> with all the other hardware and software state that we save.
>>>
>>> There is intended to be a publicly released tool to decode the GuC 
>>> log into a human readable format. So end users will be able to see 
>>> what engine scheduling decisions were taken prior to the hang, for 
>>> example. Unfortunately, that is not yet ready for release for a 
>>> number of reasons. I don't know whether that would be released as 
>>> part of the IGT suite or in some other manner.
>>
>> Okay, it would be handy if it was part of IGT, maybe even 
>> intel_error_decode being able to use it to show everything interesting 
>> to kernel developers in one go. Or at least the log parsing tool being 
>> able to consume raw error capture.
> I have some wrapper scripts which can do things like take a raw error 
> capture, run intel_error_decode, extract the GuC log portion, convert it 
> to the binary format the decoder tool expects, extract the GuC firmware 
> version from the capture to give to the decoder tool and finally run the 
> decoder tool. The intention is that all of the helper scripts will also 
> be part of the log decoder release.
> 
> If you want to try it all out now, see the GuC log decoder wiki page 
> (internal developers only).

Thanks, I'll see after the holiday break where we are with certain project in terms of are we still hitting hangs.

[snip]

>>>>>>> My view is that the current message is indeed woefully 
>>>>>>> uninformative. However, it is more important to be reporting 
>>>>>>> context identification than engine instances. So sure, add the 
>>>>>>> engine instance description but also add something specific to 
>>>>>>> the ce as well. Ideally (for me) the GuC id and maybe something 
>>>>>>> else that uniquely identifies the context in KMD land for when 
>>>>>>> not using GuC?
>>>>>>
>>>>>> Not sure we need to go that far at this level, but even if we do 
>>>>>> it could be a follow up to add new data to both backends. Not sure 
>>>>>> yet I care enough to drive this. My patch was simply a reaction to 
>>>>>> noticing there is zero information currently logged while 
>>>>>> debugging some DG2 hangs.
>>>>> In terms of just reporting that a reset occurred, we already have 
>>>>> the 'GPU HANG: ecode 12:1:fbffffff, in testfw_app [8177]' message. 
>>>>> The ecode is a somewhat bizarre value but it does act as a 
>>>>> 'something went wrong, your system is not happy' type message. 
>>>>> Going beyond that, I think context identification is the next most 
>>>>> useful thing to add.
>>>>>
>>>>> But if you aren't even getting the 'GPU HANG' message then it 
>>>>> sounds like something is broken with what we already have. So we 
>>>>> should fix that as a first priority. If that message isn't 
>>>>> appearing then it means there was no error capture so adding extra 
>>>>> info to the capture won't help!
>>>>
>>>> The issue I have is that "GPU HANG ecode" messages are always "all 
>>>> zeros". It thought that was because GuC error capture was not there, 
>>>> but maybe its something else.
>>> Hmm. All zeros including the platform and engine class part or just 
>>> the instdone part?
>>
>> Class and instdone - all we were seeing was "[drm] GPU HANG: ecode
>> 12:0:00000000".
>>
>> Even on the CI run for this patch I see in the logs:
>>
>> <5>[  157.243472] i915 0000:00:02.0: [drm] rcs0 GuC engine reset
>> <6>[  157.254568] i915 0000:00:02.0: [drm] GPU HANG: ecode 12:0:00000000
>>
>> So there seem circumstances when the GPU HANG line somehow misses to 
>> figure out the engine class.
> Class zero is render. So it is correct.

It's a bitmask, so not quite correct, something is missing:

		for (cs = gt->engine; cs; cs = cs->next) {
			if (cs->hung) {
				hung_classes |= BIT(cs->engine->uabi_class);

>>> The instdone value is engine register state and will have been 
>>> cleared before i915 can read it if the reset was handled by GuC. That 
>>> comes under the heading of state we need the new error capture API 
>>> for. However, the context should be correctly identified as should 
>>> the platform/engine class.
>>>
>>> Currently, the recommended w/a is to set i915.reset=1 when debugging 
>>> a hang issue. That will disable GuC based resets and fall back to old 
>>> school i915 based (but full GT not engine) resets. And that means 
>>> that i915 will be able to read the engine state prior to the reset 
>>> happening and thus produce a valid error capture / GPU HANG message.
>>
>> Ah.. that's the piece of the puzzle I was missing. Perhaps it should 
>> even be the default until error capture works.
> Decision was taken that per engine resets are of real use to end users 
> but valid register state in an error capture is only of use to i915 
> developers. Therefore, we can take the hit of less debuggability. Plus, 
> you do get a lot of that information in the GuC log (as debug prints, 
> essentially) if you have the verbosity set suitably high. So it is not 
> impossible to get the information out even with GuC based engine resets. 
> But the reset=1 fallback is certainly the easiest debug option.

It's tricky, error capture is useful for developers but when debugging issues reported by end users. And DG1 is available on the shelves to buy. You say data is available in GuC logs but there is no upstream tool to read it. Luckily DG1 is behind force probe so we get away with it for now.

Regards,

Tvrtko
