Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB98A615DC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 17:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8523C10E1C1;
	Fri, 14 Mar 2025 16:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="c/I5hwSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFBC10E1C1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741968568; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LMIiKlEFRL7N9+/imfQ/ARMtn9JFru4merPBSfWzCSvqgh21dPEhUykHGsEGxqLoaPEQnWgmX+iOoG4VbSBjUuR+YmRtQ5aFe+F/3EZKX+rZqFP4CH3pzdtJnDJ0+Y1FMUUpY+yFt99yXwRHxVeJbUCvFgQHdk7mW7u0xp3bK+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741968568;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rsYUkunEA14LX5hAkIEL3nskHcxyQjfpTSg9UpldL1Y=; 
 b=JO5QXbBXLKDMz+mJxUHm1HnQjcNm3DIiNTk4C2rtLXrYkvAEXu6a9fxhTKJxCFmW2hnyczWiQxE8zzBwAfSQaNakleoXRwgnXMbAuACsamFtSshk1OBYDyTcz8Hr53f6zsBQRgr6u1DlBNteFWjUSRPDNxQKPG4ABfRkHUAM2xE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741968568; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rsYUkunEA14LX5hAkIEL3nskHcxyQjfpTSg9UpldL1Y=;
 b=c/I5hwSlMs2R24pybQ1fYH9SEpXp07ix8hd3P/fSCBH4OZSnqcisjn4WP4DvTcTF
 006odrCwTyuofuinr5ZjX8JfjURc32Hs9PWHYCi29olNVWIGitlSpAeynEdpVwWC2Ya
 ssASjlNX9w4uW5TbZwLqO02ZAj5zw/xIVw5Ld/vA=
Received: by mx.zohomail.com with SMTPS id 1741968564767949.3760976982635;
 Fri, 14 Mar 2025 09:09:24 -0700 (PDT)
Message-ID: <2c82edc7-fd39-4e81-95b5-f43467fd166f@collabora.com>
Date: Fri, 14 Mar 2025 13:09:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table format
 on mediatek_mt8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-6-ariel.dalessandro@collabora.com>
 <55b8bc40-0a29-46c2-ba5d-c7cc7742cf5f@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <55b8bc40-0a29-46c2-ba5d-c7cc7742cf5f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Angelo,

On 3/11/25 6:09 AM, AngeloGioacchino Del Regno wrote:
> Il 10/03/25 20:59, Ariel D'Alessandro ha scritto:
>> Now that Panfrost supports AARCH64_4K page table format, let's enable it
>> on Mediatek MT8188.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/ 
>> drm/panfrost/panfrost_drv.c
>> index 0f3935556ac76..d7b8bded6d784 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -824,6 +824,7 @@ static const struct panfrost_compatible 
>> mediatek_mt8188_data = {
>>       .num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>>       .pm_domain_names = mediatek_mt8183_pm_domains,
>>       .pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>> +    .gpu_configs = BIT(GPU_CONFIG_AARCH64_4K),
>>   };
>>   static const char * const mediatek_mt8192_supplies[] = { "mali", 
>> NULL };
> 
> Didn't that work on MT8195/8395 as well? I also recall hearing that it 
> was somewhat
> giving ever-so-slightly better performance?

Running glmark2-es2-drm [0] benchmark, reported the same performance 
("glmark2 Score") on both configurations, before and after this 
patchset. Tested on a Mediatek Genio 1200 EVK board.

To avoid holding this longer, I'll add it to patchset v2, and let's 
continue discussion there in any case.

[0] https://github.com/glmark2/glmark2

> 
> If it does, please enable it on 8195 as well :-)
> 
> also s/mediatek_mt8188/MediaTek MT8188/g

Ack.

> 
> ...and btw
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

