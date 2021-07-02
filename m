Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6B3BA0FD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 15:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A64F6E17E;
	Fri,  2 Jul 2021 13:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CC26E17C;
 Fri,  2 Jul 2021 13:12:35 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9332E5FF3F;
 Fri,  2 Jul 2021 15:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1625231554;
 bh=vKUM2f1Cw/W/uNwyZOwCq0u1SM1S7vnk+jenXPOPh3c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MA3M9rghZtdIeCSraQN7EgQdKLPUoH0cqhwwEDs5p4+hDQjPV+fhIafFJzPvohke5
 /KCriOnAzznOlrkGjkl0Eo1cjVRvCu5TntcPu3HOxNUlQ2AGvW5nfDx+KQSp7f8idA
 Q9wJiEc+yoi0G7EbIrr8k7corACi+PYNP48l+05k5/F6a0Zqc6A9ApCHO4nt3wRneC
 3dkWX6e8QEItoCJ91zvvk+b13SOYs50s6VnsX4THWVbf5x/dhQIfosnq2cRM8etbqd
 WZja12cglcWEoqHcSRf6f7qw+tDUwcxSbnOLQRTjFtXQ8j+L6Q/kMDn/19N3Oork29
 YIT/lPYcGPd7A==
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <20210630180052.GA8283@sdutt-i7>
 <7c3e1d46-74eb-6f2d-53ca-d73ce9e61c03@free.fr>
 <d9e31651-dd97-fb39-0045-7cd62650bd03@free.fr>
 <2d649c1a-82fc-cced-4020-f7d9d96c3bc4@intel.com>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <040272cf-cbd5-73ef-c763-71948474be82@free.fr>
Date: Fri, 2 Jul 2021 16:12:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2d649c1a-82fc-cced-4020-f7d9d96c3bc4@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 16:06, Michal Wajdeczko wrote:
> 
> 
> On 02.07.2021 10:13, Martin Peres wrote:
>> On 01/07/2021 21:24, Martin Peres wrote:
>> [...]
>>>>
>>>>>
>>>>>> +        i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Default: enable HuC authentication and GuC submission */
>>>>>> +    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC |
>>>>>> ENABLE_GUC_SUBMISSION;
>>>>>
>>>>> This seems to be in contradiction with the GuC submission plan which
>>>>> states:
>>>>>
>>>>> "Not enabled by default on any current platforms but can be enabled via
>>>>> modparam enable_guc".
>>>>>
>>>>
>>>> I don't believe any current platform gets this point where GuC
>>>> submission would be enabled by default. The first would be ADL-P which
>>>> isn't out yet.
>>>
>>> Isn't that exactly what the line above does?
>>
>> In case you missed this crucial part of the review. Please answer the
>> above question.
> 
> I guess there is some misunderstanding here, and I must admit I had
> similar doubt, but if you look beyond patch diff and check function code
> you will find that the very condition is:
> 
> 	/* Don't enable GuC/HuC on pre-Gen12 */
> 	if (GRAPHICS_VER(i915) < 12) {
> 		i915->params.enable_guc = 0;
> 		return;
> 	}
> 
> so all pre-Gen12 platforms will continue to have GuC/HuC disabled.

Thanks Michal, but then the problem is the other way: how can one enable 
it on gen11?

I like what Daniele was going for here: separating the capability from 
the user-requested value, but then it seems the patch stopped half way. 
How about never touching the parameter, and having a AND between the two 
values to get the effective enable_guc?

Right now, the code is really confusing :s

Thanks,
Martin

> 
> Thanks,
> Michal
> 
