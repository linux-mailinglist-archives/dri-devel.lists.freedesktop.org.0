Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E226D990A78
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 19:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C0410E1D3;
	Fri,  4 Oct 2024 17:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="RZ83lulQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C0B10EA51;
 Fri,  4 Oct 2024 17:55:50 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id wmVksyfpFTdlvwmVlsjM8t; Fri, 04 Oct 2024 19:54:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1728064487;
 bh=5/9qc1wj5VBrWaCuWdDjCcwU0H/Qapv4qLyWjHhEANA=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=RZ83lulQI7hSHE6j6QNSb9hXP5VJ601NGIFBkt464weGSSU9KICkhe71UYPaC4PVz
 yXXL3vPRu/5IfDEBnVB1a8q7wDeeTI6wShTvP/znJY1fBKkA6dRDwzFLfmjptl/kR6
 25auBgnY/yow3MOvMOHf8V+x+AKcdY/g3b0B/oy80x3Id6DJuk1kplLVSswCF+r+Rn
 KqCq3q3L67euPpj8Tp581uRR81sQyFU5bBOaz1Px0jvYqU+x+0FjZoxgzI4o4qtRF2
 O3ELFtYJNX9SM+8g/glhoDVY8tjT/VVGMcVM4X4L6gkJLvVWKaWowXyBivqr2omwIM
 L66FEyH+4eFsw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 04 Oct 2024 19:54:47 +0200
X-ME-IP: 90.11.132.44
Message-ID: <6673435f-250a-4fb7-9843-20f050e85c7c@wanadoo.fr>
Date: Fri, 4 Oct 2024 19:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Remove kstrdup_const() and
 kfree_const() usage
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr>
 <87h69srz1q.fsf@intel.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <87h69srz1q.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 04/10/2024 à 11:35, Jani Nikula a écrit :
> On Thu, 03 Oct 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
>> kstrdup_const() and kfree_const() can be confusing in code built as a
>> module. In such a case, it does not do what one could expect from the name
>> of the functions.
>>
>> The code is not wrong by itself, but in such a case, it is equivalent to
>> kstrdup() and kfree().
>>
>> So, keep thinks simple and straightforward.
>>
>> This reverts commit 379b63e7e682 ("drm/i915/display: Save a few bytes of
>> memory in intel_backlight_device_register()")
> 
> Sorry, I guess I'm confused here. Or I just didn't read the commit
> message to [1] properly. Or both.
> 
> So the whole point of [1] was that the _const versions can be confusing
> if i915 is builtin? But not wrong?

I'll try to explain the whole story and (try to) be clearer.


[2] the intent of this initial patch was a micro-optimization which was 
expected to save a few bytes of memory. The naming of the function 
looked promising. However kstrdup_const() only saves the allocation 
within the rodata section of the kernel [5,6]. The mechanism does not 
work for code built as module.

This patch *is not* broken by itself, it is just pointless most of the 
time. So keeping it as-is is just fine, from my point of view.

If built as a module, kstrdup_const() is just a plain kstrdup() and 
kfree_const() is just kfree().



[3] was a variation that tried to avoid the allocation in all cases, 
should it be built as a module or not.
Being a micro-optimization of a slow path, your argument of keeping 
things simple is just fine for me.



[4] just revert [2].
[2] was not broken, so [4] does not fix anything. It just makes things 
simpler and as before.


So the whole point of [1,3] was that the _const versions can be 
confusing if i915 is *NOT* builtin.
But it *is* not wrong, just likely useless in such a case.

So, from my point of view, keeping [2] as is, or applying [3] or [4] on 
top of it does not change things much, and each solution is correct.



The idea behind removing some usage of _const() function in modules is 
related to the patch proposal [7] and more precisely the response of 
Christoph Hellwig [8]. The patch [7] will not be applied because it 
breaks things.
So, should this API be removed one day, or at least removed for modules, 
the more preparation work is already done (up to now: 4,9,10] the better 
it is.

CJ



[2]: 379b63e7e682 ("drm/i915/display: Save a few bytes of memory in 
intel_backlight_device_register()")

[3]: 
https://lore.kernel.org/all/3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr/

[4]: 
https://lore.kernel.org/all/f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr/

[5]: https://elixir.bootlin.com/linux/v6.12-rc1/source/mm/util.c#L84
[6]: 
https://elixir.bootlin.com/linux/v6.12-rc1/source/include/asm-generic/sections.h#L177

[7]: 
https://lore.kernel.org/all/20240924050937.697118-1-senozhatsky@chromium.org/
[8]: https://lore.kernel.org/all/ZvJfhDrv-eArtU8Y@infradead.org/

[9]: 
https://lore.kernel.org/all/63ac20f64234b7c9ea87a7fa9baf41e8255852f7.1727374631.git.christophe.jaillet@wanadoo.fr/
[10]: 
https://lore.kernel.org/all/06630f9ec3e153d0e7773b8d97a17e7c53e0d606.1727375615.git.christophe.jaillet@wanadoo.fr/

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr
> 
> 
> 
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/gpu/drm/i915/display/intel_backlight.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
>> index 9e05745d797d..3f81a726cc7d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
>> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
>> @@ -949,7 +949,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>>   	else
>>   		props.power = BACKLIGHT_POWER_OFF;
>>   
>> -	name = kstrdup_const("intel_backlight", GFP_KERNEL);
>> +	name = kstrdup("intel_backlight", GFP_KERNEL);
>>   	if (!name)
>>   		return -ENOMEM;
>>   
>> @@ -963,7 +963,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>>   		 * compatibility. Use unique names for subsequent backlight devices as a
>>   		 * fallback when the default name already exists.
>>   		 */
>> -		kfree_const(name);
>> +		kfree(name);
>>   		name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
>>   				 i915->drm.primary->index, connector->base.name);
>>   		if (!name)
>> @@ -987,7 +987,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>>   		    connector->base.base.id, connector->base.name, name);
>>   
>>   out:
>> -	kfree_const(name);
>> +	kfree(name);
>>   
>>   	return ret;
>>   }
> 

