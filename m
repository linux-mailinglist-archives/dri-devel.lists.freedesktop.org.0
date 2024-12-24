Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE69FC148
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 19:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3A10E03A;
	Tue, 24 Dec 2024 18:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ngO6/DPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5322F10E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735065352;
 bh=9FiNisxucwZIdoJgoGQTYnT3v03hfXl00vE6LZp/gqs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ngO6/DPPRSVCciWZ//VpwEh/4D3d+NO3iOXuexJtzpR3+Tp2NBGnBPIHnn8I04cRG
 qgVfYRRBqMDf2rbDJkqxHaz/7/Q9ff4HFlhQ4E1MgyUSTmrFlQiTTySYenBHFeuICg
 4P+VCF6tSXy0ZjbZwCtreEbh2wozUGknF/mJEEGhjDq+XHDcKDv5ZjU3bi80NI2q0b
 bmx2WvCtf/mrHaz4WvULBh8oyb06bbCw/pf4dkBCXnlLmgUx1FgVjb+lLHBTCxRWFx
 b9UZAkXuxGG/3AV8e7J0mG+gxU/JJrQarEyig9MKGzxssX7YOChKDOlbvNM5+OjjUp
 BH/B3dGU4h0Mw==
Received: from [192.168.1.90] (unknown [84.232.140.38])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 413BF17E15B0;
 Tue, 24 Dec 2024 19:35:52 +0100 (CET)
Message-ID: <646893af-fea8-473f-ba1a-0980d770d81e@collabora.com>
Date: Tue, 24 Dec 2024 20:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/connector: hdmi: Validate supported_formats
 matches ycbcr_420_allowed
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
 <20241217-bridge-conn-fmt-prio-v3-2-3ecb3c8fc06f@collabora.com>
 <20241217-positive-elephant-of-resistance-f4b0ee@houat>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20241217-positive-elephant-of-resistance-f4b0ee@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/24 5:25 PM, Maxime Ripard wrote:
> On Tue, Dec 17, 2024 at 12:54:08AM +0200, Cristian Ciocaltea wrote:
>> Ensure HDMI connector initialization fails when the presence of
>> HDMI_COLORSPACE_YUV420 in the given supported_formats bitmask doesn't
>> match the value of drm_connector->ycbcr_420_allowed.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_connector.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index fc35f47e2849ed6786d6223ac9c69e1c359fc648..ca7f43c8d6f1b31ef9d3a1ee05f4df930ecffac4 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -507,6 +507,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>>  	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
>>  		return -EINVAL;
>>  
>> +	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(HDMI_COLORSPACE_YUV420)))
>> +		return -EINVAL;
>> +
>>  	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
>>  		return -EINVAL;
> 
> The patch looks fine to me, but we need to have unit tests to cover this case.

Unit tests added in v4:

https://lore.kernel.org/lkml/20241224-bridge-conn-fmt-prio-v4-4-a9ceb5671379@collabora.com/

Thanks,
Cristian
