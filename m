Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880858CC37D
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 16:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661F110E1FA;
	Wed, 22 May 2024 14:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cRZxpegG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A04B10E1FA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 14:48:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-420104e5336so5471265e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716389291; x=1716994091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xPsuD4fZJWaOvckyqtS50exhDAnEUIl9m+MkVDUOvd4=;
 b=cRZxpegGiApVt0ZYOhdafRVbk9c0AJlM8MciOWnIrmaXACspcEB1Gmk5wnyDE0swY/
 oELKfq8OMctOyBLkPy+Yls2TmUbFmFRpYmO7wbxNjiT2LUY07uisu/TFGR/hbiVDA37U
 MK71FN0tqyRCy6f6OWF1Z28Ls4Y/qbeNOpt3cF8qtAE4TVpAIfU/Pewec0eVKWpgr/aU
 bIpeOJaIB21ZIwlP59Aio1pdWu1z+AorySojp5eHfrprai6DjJgMxodFxQ5wqL9upAQW
 omNE6KRC9V3X6UghmjIUXOqhBBhjqR7Snm2s1jUIWXfqdZ1cO3RbMDzm8EdoYgR33us4
 4/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716389291; x=1716994091;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xPsuD4fZJWaOvckyqtS50exhDAnEUIl9m+MkVDUOvd4=;
 b=xCHaaeES/lSa5FrWhFMSblwelSyJPud3DG4lIGaN9E/Wa+YnsUnQ2mJq2whvUuCuFL
 5w3YJHQjygyTt9DfagszvRqyC0myWR1O/0i8YUzNTIT6Sxh+EDDQxDofB0LAzmi3TMnX
 nulucri/THaQvItJRMDE0ATPXpbpYABb9PvL2H8hD8+FyAzV6dDDSkbH0lTGYvYj9xAD
 r5yX21u5RVqsqZ5HZTOniDO/WDcoxMTUGSoKrTKPzOwQwoo0ZK4zbJIs2WihMBhkmCFQ
 qwLfBnbHdLF2Y89jPez6R37ioJYHDbvBNXdDcfV869j7RhGPMt0XyDPHcZiJd9l1eVPY
 49aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZzbEML9/s9y9f2/G3TO5ZRSn2ERRiFGZqyJjWvNseURZlZBMksaoXUcMDaLB3QVXSGScS5DBgy/SP4CgwDtXifElUrRNuc2gP6EcpeC0O
X-Gm-Message-State: AOJu0YzPkD57S3LNao7YKrAQtYNcd6xbQgjVe7XuNi0kzzufXHcA2mrv
 CfyDjYXXuDljEO9K9lFk58vsJlMA0nGHoj2yy/gvjUHHk6ilV6Fx
X-Google-Smtp-Source: AGHT+IGwx/GdGNYjlfC3GGBGIHJR2veib6YybEoxGNT5Qgi7TqYjRa+sO8i9l1uNsrT9q2aUGlfWAw==
X-Received: by 2002:a05:600c:4f56:b0:418:9d4a:1ba5 with SMTP id
 5b1f17b1804b1-420e19d56b1mr103855175e9.6.1716389290896; 
 Wed, 22 May 2024 07:48:10 -0700 (PDT)
Received: from [192.168.1.127] ([185.77.198.11])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420149b1c24sm393676565e9.41.2024.05.22.07.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 07:48:10 -0700 (PDT)
Message-ID: <df115f89-2979-42a5-b521-4bc4f8f4a335@gmail.com>
Date: Wed, 22 May 2024 16:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: remove all usages of of_node_put()
From: Amer Al Shanawany <amer.shanawany@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Julia Lawall <julia.lawall@inria.fr>, Shuah Khan <shuah@kernel.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
References: <20240427134044.38910-1-amer.shanawany@gmail.com>
Content-Language: en-US
In-Reply-To: <20240427134044.38910-1-amer.shanawany@gmail.com>
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

On 27/04/2024 15.40, Amer Al Shanawany wrote:
> Use the scope-based cleanup feature to clean up 'struct device_node *'
> when they go out of scope, and remove all instances of of_node_put()
> within the same scope, to simplify function exit and avoid potential
> memory leaks.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Amer Al Shanawany <amer.shanawany@gmail.com>
> ---
>   drivers/gpu/drm/vc4/vc4_drv.c  | 14 ++++++--------
>   drivers/gpu/drm/vc4/vc4_hdmi.c |  4 +---
>   drivers/gpu/drm/vc4/vc4_hvs.c  |  4 +---
>   3 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index c133e96b8aca..bb0bb052e595 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -289,7 +289,6 @@ static int vc4_drm_bind(struct device *dev)
>   	struct rpi_firmware *firmware = NULL;
>   	struct drm_device *drm;
>   	struct vc4_dev *vc4;
> -	struct device_node *node;
>   	struct drm_crtc *crtc;
>   	bool is_vc5;
>   	int ret = 0;
> @@ -302,11 +301,10 @@ static int vc4_drm_bind(struct device *dev)
>   	else
>   		driver = &vc4_drm_driver;
>   
> -	node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
> -					       NULL);
> +	struct device_node *node __free(device_node) =
> +		of_find_matching_node_and_match(NULL, vc4_dma_range_matches, NULL);
>   	if (node) {
>   		ret = of_dma_configure(dev, node, true);
> -		of_node_put(node);
>   
>   		if (ret)
>   			return ret;
> @@ -341,10 +339,10 @@ static int vc4_drm_bind(struct device *dev)
>   			goto err;
>   	}
>   
> -	node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
> -	if (node) {
> -		firmware = rpi_firmware_get(node);
> -		of_node_put(node);
> +	struct device_node *np __free(device_node) =
> +		of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
> +	if (np) {
> +		firmware = rpi_firmware_get(np);
>   
>   		if (!firmware) {
>   			ret = -EPROBE_DEFER;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index d30f8e8e8967..915e8da3f41a 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -3661,7 +3661,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>   	struct drm_device *drm = dev_get_drvdata(master);
>   	struct vc4_hdmi *vc4_hdmi;
>   	struct drm_encoder *encoder;
> -	struct device_node *ddc_node;
>   	int ret;
>   
>   	vc4_hdmi = drmm_kzalloc(drm, sizeof(*vc4_hdmi), GFP_KERNEL);
> @@ -3699,14 +3698,13 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>   	if (ret)
>   		return ret;
>   
> -	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
> +	struct device_node *ddc_node __free(device_node) = of_parse_phandle(dev->of_node, "ddc", 0);
>   	if (!ddc_node) {
>   		DRM_ERROR("Failed to find ddc node in device tree\n");
>   		return -ENODEV;
>   	}
>   
>   	vc4_hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
> -	of_node_put(ddc_node);
>   	if (!vc4_hdmi->ddc) {
>   		DRM_DEBUG("Failed to get ddc i2c adapter by node\n");
>   		return -EPROBE_DEFER;
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 04af672caacb..6e3613e06e09 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -845,15 +845,13 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>   
>   	if (vc4->is_vc5) {
>   		struct rpi_firmware *firmware;
> -		struct device_node *node;
> +		struct device_node *node __free(device_node) = rpi_firmware_find_node();
>   		unsigned int max_rate;
>   
> -		node = rpi_firmware_find_node();
>   		if (!node)
>   			return -EINVAL;
>   
>   		firmware = rpi_firmware_get(node);
> -		of_node_put(node);
>   		if (!firmware)
>   			return -EPROBE_DEFER;
>   
Hi,

This patch is marked as new/archived on patchwork[1], however it didn't 
receive any feedback, and a similar patch has been already merged [2].


[1]: 
https://patchwork.kernel.org/project/dri-devel/patch/20240427134044.38910-1-amer.shanawany@gmail.com/

[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d65bfb9546eb627e3c578336355c5b81797f2255

Thank you

Amer

