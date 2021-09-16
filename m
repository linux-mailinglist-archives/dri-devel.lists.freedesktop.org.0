Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6BB40DEDC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 18:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC816EE23;
	Thu, 16 Sep 2021 16:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669ED6EE23
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=poq1zO2Bl/l/ybLTkI3WLEwIqPRH03ab3lPgSttIMsU=; b=XrGaQ5LBgBhsZhj58Hos5aaHdL
 t+U6/ckqI3ohk0a0EzoU4uZir/O746OwQ4/Mb9AwxSU4a+upTalhCxR8X+H0668/IQyKjyo+fHpiz
 mY+8ee5jgYc4SQzaPIgjhwxNiumT98Y9QwCSrI3IQtSD7s7PV9zeLbPA9qd55CaxETIot56B3v4/5
 uTIts0BXrZG0qnrzj4XLmo5hY+QJ9y4e8jG1NBJbxwuG98J1N1D4BWVtQ+p63ewwnE4MQbSS8YNaW
 Bm1DInmsNizBUKe2B2pzuKR5UH+2mrg+Ts6A9Actg4dUmYWYtjfFnwOfHtBuVqd7p/Isb5E0PfQox
 LMdvrMOA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mQtoG-0002hn-0l; Thu, 16 Sep 2021 19:00:24 +0300
Subject: Re: [PATCH] drm/tegra: Use correct property for BO size
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210916141307.2010255-1-mperttunen@nvidia.com>
 <458e09d5-dba0-8c80-a58e-f2ce27973b18@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <a6fdd1c1-a1a6-0887-bdb4-b870504e0644@kapsi.fi>
Date: Thu, 16 Sep 2021 19:00:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <458e09d5-dba0-8c80-a58e-f2ce27973b18@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 9/16/21 6:56 PM, Dmitry Osipenko wrote:
> 16.09.2021 17:13, Mikko Perttunen пишет:
>> The size property is not always populated, while the gem.size
>> property is.
>>
>> Fixes: d7c591bc1a3f ("drm/tegra: Implement new UAPI")
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/gpu/drm/tegra/uapi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
>> index dc16a24f4dbe..690a339c52ec 100644
>> --- a/drivers/gpu/drm/tegra/uapi.c
>> +++ b/drivers/gpu/drm/tegra/uapi.c
>> @@ -222,7 +222,7 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
>>   		mapping->iova = sg_dma_address(mapping->sgt->sgl);
>>   	}
>>   
>> -	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
>> +	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->gem.size;
>>   
>>   	err = xa_alloc(&context->mappings, &args->mapping, mapping, XA_LIMIT(1, U32_MAX),
>>   		       GFP_KERNEL);
>>
> 
> Did something bad happened to [1]? Thierry fetched patches, but didn't
> make the fixes-PR yet, AFAICS.

Oh, didn't remember you had already fixed it. Let's disregard my patch then.

Thanks,
Mikko

> 
> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20210817020153.25378-3-digetx@gmail.com/
> 
