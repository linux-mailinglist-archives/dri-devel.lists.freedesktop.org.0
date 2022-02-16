Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F534B8D43
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 17:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FDE10E66B;
	Wed, 16 Feb 2022 16:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A959B10E66B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 16:06:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23D8CD6E;
 Wed, 16 Feb 2022 08:06:40 -0800 (PST)
Received: from [10.57.38.29] (unknown [10.57.38.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18A413F70D;
 Wed, 16 Feb 2022 08:06:38 -0800 (PST)
Message-ID: <c7331489-ad04-0f35-224e-164f144fb819@arm.com>
Date: Wed, 16 Feb 2022 16:06:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] drm/panfrost: Handle HW_ISSUE_TTRX_3076
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-5-alyssa.rosenzweig@collabora.com>
 <9eac9ce6-3bd8-0dc2-4686-9ea1e623b1c4@arm.com> <YgqMEqpgFxrrb8uX@maud>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <YgqMEqpgFxrrb8uX@maud>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2022 17:06, Alyssa Rosenzweig wrote:
> On Mon, Feb 14, 2022 at 04:23:18PM +0000, Steven Price wrote:
>> On 11/02/2022 20:27, alyssa.rosenzweig@collabora.com wrote:
>>> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>
>>> Some Valhall GPUs require resets when encountering bus faults due to
>>> occlusion query writes. Add the issue bit for this and handle it.
>>>
>>> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>> (although one nit below)
>>
>> Just in case any one is wondering - these bus faults occur when
>> switching the GPU's MMU to unmapped - it's not a normal "bus fault" from
>> the external bus. This is triggered by an attempt to read unmapped
>> memory which is completed by the driver by switching the entire MMU to
>> unmapped.
> 
> Ouch, that's subtle.
> 
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
>>> index a66692663833..058f6a4c8435 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
>>> @@ -128,6 +128,10 @@ enum panfrost_hw_issue {
>>>  	/* Must set SC_VAR_ALGORITHM */
>>>  	HW_ISSUE_TTRX_2968_TTRX_3162,
>>>  
>>> +	/* Bus fault from occlusion query write may cause future fragment jobs
>>> +	 * to hang */
>>
>> NIT: Kernel comment style has the "/*" and "*/" on lines by themselves
>> for multi-line comments. checkpatch will complain!
> 
> Yes, I am aware (and checkpatch did complain). The existing multi-line
> comments in that file do not have the extra lines. Consistency within
> the file seemed like the lesser evil. If you think it's better to
> appease checkpatch, I can reformat for v2.
> 
> (I can also throw in a patch fixing the rest of that file's multiline
> comments but that seems a bit extra.)

Nah! I've never been very keen on that style rule myself, but I usually
try to keep checkpatch happy when working on the kernel. Lets just
follow the rest of the file for now.

Thanks,

Steve
