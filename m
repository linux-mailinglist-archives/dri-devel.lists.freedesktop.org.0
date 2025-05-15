Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC76AB86AB
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 14:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5611010E864;
	Thu, 15 May 2025 12:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O6RRyUKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E0810E864
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747313060;
 bh=3dlSMLkE5eysI1Q7wOsUof6VrGPy5tGwHiOqA9GfYyo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O6RRyUKtj5NWRw3FZOAnkrUQMxnt+Ut1Fm3NvwkN7GXDV35QvfbXtWrbV7nsNzrPW
 r+ZF/a3i0ozamFbTAkxNVTnaHiuFc/OSl0PElmtP0N7ccMZVF0l+j3Xs5kVuoW7qBC
 9N9g1W+2PVOlLVxQHl+m6ZxAvpuQA4yIqPOcZTOok5Ujd+44URnhRyoYAI+g1MitMI
 Xz9mtNYj6ktSgSKw32sJqdLHRjJzGJYYQzMsEUslPBkUTDOadfX2yDT2Jdc5Vjpebz
 bUKmdkdQwRNewZ2XGcLFYlEH3W1H5ywh+hmlTu4Xefs2ol32AmIJIDiSJ9zk5VnOaT
 TkjBwaE4WqXpw==
Received: from [192.168.1.90] (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E51217E0202;
 Thu, 15 May 2025 14:44:19 +0200 (CEST)
Message-ID: <7729efd6-fa88-4022-b8d8-b32fe49bf4aa@collabora.com>
Date: Thu, 15 May 2025 15:44:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-6-5e55e2aaa3fa@collabora.com>
 <amnwcb3sxo7nbfobag3v2ojowqvrpqqkqykg3qfhxwxzp5olur@fibxgdcs2mee>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <amnwcb3sxo7nbfobag3v2ojowqvrpqqkqykg3qfhxwxzp5olur@fibxgdcs2mee>
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

Hi Maxime,

On 5/13/25 4:35 PM, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Apr 25, 2025 at 01:26:57PM +0300, Cristian Ciocaltea wrote:
>> Try to make use of YUV420 when computing the best output format and
>> RGB cannot be supported for any of the available color depths.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 22 +++++++++++++++++-----
>>  1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index 9e0a468073acbb2477eff1abef1c09d63620afaa..1fba10b92a6baa49150b6ff1e96bf2c2739bf269 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -648,14 +648,26 @@ hdmi_compute_config(const struct drm_connector *connector,
>>  				       8, connector->max_bpc);
>>  	int ret;
>>  
>> -	/*
>> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
>> -	 * devices, for modes that only support YCbCr420.
>> -	 */
>>  	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>>  				      HDMI_COLORSPACE_RGB);
>> +	if (!ret)
>> +		return 0;
> 
> Sorry, I missed it on the previous iteration, but this condition
> inversion compared to the rest of the function is throwing me off :)
> 
> I believe something like
> 
> If (ret) {
>    if (connector->ycbcr_420_allowed) {
>       hdmi_compute_format_bpc(..., HDMI_COLORSPACE_YUV420)
>    } else {
>      drm_dbg_kms("Can't use YUV420")
>    }
> }
> 
> Would be more natural

Yep, will do.

Please let me know if I can start preparing v5, as I'm not sure if you
managed to also check the test-related patches.

Thanks,
Cristian
