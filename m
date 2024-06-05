Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5818FCAB6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 13:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69C910E349;
	Wed,  5 Jun 2024 11:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="5jRk+jKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150F510E26A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 11:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717587814;
 bh=CWJ8m9k7WusE+fmG21wSlZT3rCg6sq0zH32IpWyuQ0U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=5jRk+jKcJEPA+o+9Boiu2p7P90UpgwbELQXXpYvVnKNho6f+uiWYAjsCkOlcaMXJr
 bzsIskYtljB6UeTDiqaLr2TzWjF7uxGT7GX7fzKww31DJel4RvMxO0N8pqNBQnuctv
 DpDRq6DdgIInmQ3KOZWkVrCZYdlIWlWQrq4YFtt60M/BTcBUNWQYAJrkqly/H7zkS4
 UK9Eu5ofLxO/+l9e0jymAePv9bhmn7B4QcjjmYKMZxXK9GN1akLS0ATYP4JCYl3Aaf
 yPPFdOWAMyyR6ixGQTA0hwVQE13YVqIXEn3lJsazBdFa5FxhhndEMhdYDq9EeiSckd
 WNbmKtgBLLQVA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AF1FC3781139;
 Wed,  5 Jun 2024 11:43:33 +0000 (UTC)
Message-ID: <6dee4870-3ca2-46d7-a30b-014a7d34135a@collabora.com>
Date: Wed, 5 Jun 2024 13:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panfrost: Add support for Mali on the MT8188
 SoC
To: Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
 <20240604123922.331469-3-angelogioacchino.delregno@collabora.com>
 <f44611fd-523a-4b4d-accd-20fdfbac178a@arm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f44611fd-523a-4b4d-accd-20fdfbac178a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 05/06/24 11:18, Steven Price ha scritto:
> On 04/06/2024 13:39, AngeloGioacchino Del Regno wrote:
>> MediaTek MT8188 has a Mali-G57 MC3 (Valhall-JM): add a new
>> compatible and platform data using the same supplies and the
>> same power domain lists as MT8183 (one regulator, three power
>> domains).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index ef9f6c0716d5..4e2d9f671a0d 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -777,6 +777,14 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
>>   	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>>   };
>>   
>> +static const struct panfrost_compatible mediatek_mt8188_data = {
>> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
>> +	.supply_names = mediatek_mt8183_b_supplies,
> 
> I think this is a little confusing. Ideally we'd drop the existing
> mediatek_xxx_supplies which are the same as default_supplies and just
> use that instead.
> 
>> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>> +	.pm_domain_names = mediatek_mt8183_pm_domains,
> 
> We'd want at least a comment explaining that this isn't a typo (i.e. /*
> mt8188 uses the same pm domains as mt8183 */). But I'm also wondering if
> it would be sensible to simply have one domain list, something like:
> 
> --->8---
> static const char * const mediatek_pm_domains[] = { "core0", "core1",
> 						    "core2", "core3",
> 						    "core4" };
> 
> static const struct panfrost_compatible mediatek_mt8183_data = {
> 	...
> 	.num_pm_domains = 3,
> 	.pm_domain_names = mediatek_pm_domains,
> };
> ...
> static const struct panfrost_compatible mediatek_mt8186_data = {
> 	...
> 	.num_pm_domains = 2,
> 	.pm_domain_names = mediatek_pm_domains,
> };
> ...
> static const struct panfrost_compatible mediatek_mt8188_data = {
> 	...
> 	.num_pm_domains = 3,
> 	.pm_domain_names = mediatek_pm_domains,
> };
> ...
> static const struct panfrost_compatible mediatek_mt8192_data = {
> 	...
> 	.num_pm_domains = 5,
> 	.pm_domain_names = mediatek_pm_domains,
> };
> --->8---
> 
> OTOH what you've got it no worse than what we already had, so it's up to
> you whether you want to tidy this up or just add a comment so it doesn't
> look like there's a typo.
> 

I didn't disclose my plan, but you've already shown part of it, so seeing that
you preventively agree with at least part of that is fun :-)

I surely won't be able to do what I want to do for *this* cycle as I'm mostly
sure that I won't have time for this in the next 3 weeks - but anyway....

What I was thinking is that we should either look for a number of power domains
limited by a max power domains definition (that should already be present somewhere
in panfrost if I recall correctly) without even caring about the actual power
domain names, or we should look for a number of PDs having any name matching,
in a for loop, snprintf(*something, sizeof(something), "core%d", i).

This means that, with the snprintf idea, we don't even have to set any
pm_domain_names list anymore, at all, and we can either reuse num_pm_domains
or just get the number of PDs limited by the binding - but that's a problem for
the future me/us I guess...

But since we're there...

Please, I'd like to hear your opinion about the core%d idea :-)

Anyway, I think that for now I'm choosing the "comment shortcut" for this patch.

P.S.: Thanks for the feedback!

Cheers,
Angelo

> Steve
> 
>> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>> +};
>> +
>>   static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
>>   static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
>>   							   "core3", "core4" };
>> @@ -808,6 +816,7 @@ static const struct of_device_id dt_match[] = {
>>   	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
>>   	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
>>   	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>> +	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>>   	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>>   	{}
>>   };
> 



