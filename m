Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261B2CD0DD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007AB6E098;
	Thu,  3 Dec 2020 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20CD36EA24
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 11:54:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE750101E;
 Wed,  2 Dec 2020 03:54:04 -0800 (PST)
Received: from [10.57.0.85] (unknown [10.57.0.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAEFA3F718;
 Wed,  2 Dec 2020 03:54:01 -0800 (PST)
Subject: Re: [PATCH v2 3/5] thermal: devfreq_cooling: add new registration
 functions with Energy Model
To: Ionela Voinescu <ionela.voinescu@arm.com>
References: <20201118120358.17150-1-lukasz.luba@arm.com>
 <20201118120358.17150-4-lukasz.luba@arm.com> <20201202102439.GA1639@arm.com>
 <ef641466-cf86-85aa-925a-3de9e1eed501@arm.com>
 <20201202114909.GA1198@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <a152499a-e486-10b6-3f69-cc3704807767@arm.com>
Date: Wed, 2 Dec 2020 11:54:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201202114909.GA1198@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, rui.zhang@intel.com, orjan.eide@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/2/20 11:49 AM, Ionela Voinescu wrote:
> On Wednesday 02 Dec 2020 at 11:14:02 (+0000), Lukasz Luba wrote:
>> Hi Ionela,
>>
>> On 12/2/20 10:24 AM, Ionela Voinescu wrote:
>>> Hi Lukasz,
>>>
>>> On Wednesday 18 Nov 2020 at 12:03:56 (+0000), Lukasz Luba wrote:
>>
>> [snip]
>>
>>>> +	struct device_node *np = NULL;
>>
>> [snip]
>>
>>>> +
>>>> +	if (dev->of_node)
>>>> +		np = of_node_get(dev->of_node);
>>>> +
>>>
>>> Should np be checked before use? I'm not sure if it's better to do the
>>> assign first and then the check on np before use. It depends on the
>>> consequences of passing a NULL node pointer later on.
>>
>> The np is actually dev->of_node (or left NULL, as set at the begging).
>> The only meaning of the line above is to increment the counter and then
>> decrement if CONFIG_OF_DYNAMIC was used.
>> The devfreq_cooling_register() has np = NULL and the registration can
>> handle it, so we should be OK here as well.
>>
> 
> Yes, I just wanted to make sure later registration can handle np = NULL,
> or whether we need to bail out.
> 
> In this case, you can drop both ifs - for (dev->of_node) before get and
> for np before put below, as of_node_get/of_node_put can handle NULL
> pointers themselves.

Right. I agree, I will resend this patch with that small change.
Thank you for having a look at it.

Lukasz

> 
> Thanks,
> Ionela.
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
