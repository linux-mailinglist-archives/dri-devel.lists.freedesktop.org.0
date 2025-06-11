Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82685AD601E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 22:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63DE10E282;
	Wed, 11 Jun 2025 20:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mdYqRlii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB610E282
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yBeueHbTYJOWIkhsKF/t4yANYBvUvRfE0BdboNfA6eQ=; b=mdYqRliivDc/rDRsNnyY+2FF6R
 CYTx2TVIRuNVQqr76f830Rkz1+JreWeiTGLMwld7ifCMC/+F4c+groP1KDdKfS/MkIXYTZQA92caZ
 0iS213cioMMCxEmnrQhiJt0Zzsp+17Zc6KYTmKnHtCNj9zaZ4Wsb8mcR1tXqoYLgBIaz7vu0zQRbB
 p1D+65Fdjin4BsvhIJF8bhuu3op7WsE/W0/kPonh9/q0uMdgMkJ1Aw0+/PeEY6+3zzW5xPBaQQHde
 DLrB4NOplIpe+l3rqLEk2hcqs+E97BH4FMdFiMpSrdkgotlWsZFhfAXyMKS1Lz6UgcUFAXcIQo0tx
 sV6IOaNw==;
Received: from [187.36.208.198] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPSAI-002MGU-UF; Wed, 11 Jun 2025 22:35:19 +0200
Message-ID: <38316713-26f8-4533-b1a5-49417efd724a@igalia.com>
Date: Wed, 11 Jun 2025 17:35:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/vkms: Change YUV helpers to support u16 inputs
 for conversion
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
 <20250530-b4-new-color-formats-v4-6-ef5f9f48376c@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20250530-b4-new-color-formats-v4-6-ef5f9f48376c@bootlin.com>
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

Hi Louis,

On 5/30/25 11:06, Louis Chauvet wrote:
> Some YUV format uses 16 bit values, so change the helper function for
> conversion to support those new formats.
> 
> Add support for the YUV format P010
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/tests/vkms_format_test.c | 103 +++++++++++++-------------
>   drivers/gpu/drm/vkms/vkms_formats.c           |  26 ++++---
>   drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
>   3 files changed, 68 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> index 2e1daef94831..272e18a82f9c 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -23,7 +23,7 @@ MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
>    *     machine endianness
>    */
>   struct pixel_yuv_u8 {

I forgot about this nit. I believe you should changed it to
`pixel_yuv_u16` now.

Best Regards,
- Maíra

> -	u8 y, u, v;
> +	u16 y, u, v;
>   };
>   
>   /*
> @@ -64,7 +64,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   	 *                     in_bits = 16,
>   	 *                     in_legal = False,
>   	 *                     in_int = True,
> -	 *                     out_bits = 8,
> +	 *                     out_bits = 16,
>   	 *                     out_legal = False,
>   	 *                     out_int = True)
>   	 *
> @@ -76,13 +76,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   		.range = DRM_COLOR_YCBCR_FULL_RANGE,
>   		.n_colors = 6,
>   		.colors = {
> -			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> -			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> -			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> -			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> -			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> -			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> -		},
> +			{ "white",	{ 0xffff, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",	{ 0x8080, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black",	{ 0x0000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",	{ 0x4c8b, 0x54ce, 0xffff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green",	{ 0x9645, 0x2b33, 0x14d1 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",	{ 0x1d2f, 0xffff, 0x6b2f }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		}
>   	},
>   	/*
>   	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> @@ -90,7 +90,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   	 *                     in_bits = 16,
>   	 *                     in_legal = False,
>   	 *                     in_int = True,
> -	 *                     out_bits = 8,
> +	 *                     out_bits = 16,
>   	 *                     out_legal = True,
>   	 *                     out_int = True)
>   	 * Tests cases for color conversion generated by converting RGB
> @@ -101,13 +101,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
>   		.n_colors = 6,
>   		.colors = {
> -			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> -			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> -			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> -			{ "red",   { 0x51, 0x5a, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> -			{ "green", { 0x91, 0x36, 0x22 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> -			{ "blue",  { 0x29, 0xf0, 0x6e }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> -		},
> +			{ "white",	{ 0xeb00, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",	{ 0x7dee, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black",	{ 0x1000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",	{ 0x517b, 0x5a34, 0xf000 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green",	{ 0x908e, 0x35cc, 0x2237 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",	{ 0x28f7, 0xf000, 0x6dc9 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		}
>   	},
>   	/*
>   	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> @@ -115,7 +115,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   	 *                     in_bits = 16,
>   	 *                     in_legal = False,
>   	 *                     in_int = True,
> -	 *                     out_bits = 8,
> +	 *                     out_bits = 16,
>   	 *                     out_legal = False,
>   	 *                     out_int = True)
>   	 * Tests cases for color conversion generated by converting RGB
> @@ -126,21 +126,21 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   		.range = DRM_COLOR_YCBCR_FULL_RANGE,
>   		.n_colors = 6,
>   		.colors = {
> -			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> -			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> -			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> -			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> -			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> -			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> -		},
> +			{ "white",	{ 0xffff, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",	{ 0x8080, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black",	{ 0x0000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",	{ 0x366d, 0x62ac, 0xffff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green",	{ 0xb717, 0x1d55, 0x0bbd }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",	{ 0x127c, 0xffff, 0x7443 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		}
>   	},
>   	/*
>   	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
>   	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
>   	 *                     in_bits = 16,
> -	 *                     int_legal = False,
> +	 *                     in_legal = False,
>   	 *                     in_int = True,
> -	 *                     out_bits = 8,
> +	 *                     out_bits = 16,
>   	 *                     out_legal = True,
>   	 *                     out_int = True)
>   	 * Tests cases for color conversion generated by converting RGB
> @@ -151,13 +151,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
>   		.n_colors = 6,
>   		.colors = {
> -			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> -			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> -			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> -			{ "red",   { 0x3f, 0x66, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> -			{ "green", { 0xad, 0x2a, 0x1a }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> -			{ "blue",  { 0x20, 0xf0, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> -		},
> +			{ "white",	{ 0xeb00, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",	{ 0x7dee, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black",	{ 0x1000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",	{ 0x3e8f, 0x6656, 0xf000 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green",	{ 0xaca1, 0x29aa, 0x1a45 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",	{ 0x1fd0, 0xf000, 0x75bb }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		}
>   	},
>   	/*
>   	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> @@ -165,7 +165,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   	 *                     in_bits = 16,
>   	 *                     in_legal = False,
>   	 *                     in_int = True,
> -	 *                     out_bits = 8,
> +	 *                     out_bits = 16,
>   	 *                     out_legal = False,
>   	 *                     out_int = True)
>   	 * Tests cases for color conversion generated by converting RGB
> @@ -176,13 +176,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   		.range = DRM_COLOR_YCBCR_FULL_RANGE,
>   		.n_colors = 6,
>   		.colors = {
> -			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> -			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> -			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> -			{ "red",   { 0x43, 0x5c, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> -			{ "green", { 0xad, 0x24, 0x0b }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> -			{ "blue",  { 0x0f, 0xff, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> -		},
> +			{ "white",	{ 0xffff, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",	{ 0x8080, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black",	{ 0x0000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",	{ 0x4340, 0x5c41, 0xffff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green",	{ 0xad91, 0x23bf, 0x0a4c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",	{ 0x0f2e, 0xffff, 0x75b5 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		}
>   	},
>   	/*
>   	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> @@ -190,7 +190,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   	 *                     in_bits = 16,
>   	 *                     in_legal = False,
>   	 *                     in_int = True,
> -	 *                     out_bits = 8,
> +	 *                     out_bits = 16,
>   	 *                     out_legal = True,
>   	 *                     out_int = True)
>   	 * Tests cases for color conversion generated by converting RGB
> @@ -201,13 +201,13 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
>   		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
>   		.n_colors = 6,
>   		.colors = {
> -			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> -			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> -			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> -			{ "red",   { 0x4a, 0x61, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> -			{ "green", { 0xa4, 0x2f, 0x19 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> -			{ "blue",  { 0x1d, 0xf0, 0x77 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> -		},
> +			{ "white",	{ 0xeb00, 0x8000, 0x8000 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",	{ 0x7dee, 0x8000, 0x8000 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black",	{ 0x1000, 0x8000, 0x8000 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",	{ 0x4988, 0x60b9, 0xf000 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green",	{ 0xa47b, 0x2f47, 0x1902 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",	{ 0x1cfd, 0xf000, 0x76fe }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		}
>   	},
>   };
>   
> @@ -236,7 +236,8 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
>   		get_conversion_matrix_to_argb_u16
>   			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
>   
> -		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
> +		argb = argb_u16_from_yuv161616(&matrix, color->yuv.y, color->yuv.u,
> +					       color->yuv.v);
>   
>   		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 0x1ff,
>   				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 5106441f916b..261e822e9618 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -279,16 +279,17 @@ static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
>   	return out_pixel;
>   }
>   
> -VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> -							    const struct conversion_matrix *matrix)
> +VISIBLE_IF_KUNIT
> +struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
> +					      u16 y, u16 channel_1, u16 channel_2)
>   {
>   	u16 r, g, b;
>   	s64 fp_y, fp_channel_1, fp_channel_2;
>   	s64 fp_r, fp_g, fp_b;
>   
> -	fp_y = drm_int2fixp(((int)y - matrix->y_offset) * 257);
> -	fp_channel_1 = drm_int2fixp(((int)channel_1 - 128) * 257);
> -	fp_channel_2 = drm_int2fixp(((int)channel_2 - 128) * 257);
> +	fp_y = drm_int2fixp((int)y - matrix->y_offset * 257);
> +	fp_channel_1 = drm_int2fixp((int)channel_1 - 128 * 257);
> +	fp_channel_2 = drm_int2fixp((int)channel_2 - 128 * 257);
>   
>   	fp_r = drm_fixp_mul(matrix->matrix[0][0], fp_y) +
>   	       drm_fixp_mul(matrix->matrix[0][1], fp_channel_1) +
> @@ -310,7 +311,7 @@ VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1,
>   
>   	return argb_u16_from_u16161616(0xffff, r, g, b);
>   }
> -EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
> +EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv161616);
>   
>   /**
>    * READ_LINE() - Generic generator for a read_line function which can be used for format with one
> @@ -504,8 +505,8 @@ static void semi_planar_yuv_read_line(const struct vkms_plane_state *plane, int
>   	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
>   
>   	for (int i = 0; i < count; i++) {
> -		*out_pixel = argb_u16_from_yuv888(y_plane[0], uv_plane[0], uv_plane[1],
> -						  conversion_matrix);
> +		*out_pixel = argb_u16_from_yuv161616(conversion_matrix, y_plane[0] * 257,
> +						     uv_plane[0] * 257, uv_plane[1] * 257);
>   		out_pixel += 1;
>   		y_plane += step_y;
>   		if ((i + subsampling_offset + 1) % subsampling == 0)
> @@ -549,8 +550,9 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
>   	const struct conversion_matrix *conversion_matrix = &plane->conversion_matrix;
>   
>   	for (int i = 0; i < count; i++) {
> -		*out_pixel = argb_u16_from_yuv888(*y_plane, *channel_1_plane, *channel_2_plane,
> -						  conversion_matrix);
> +		*out_pixel = argb_u16_from_yuv161616(conversion_matrix,
> +						     *y_plane * 257, *channel_1_plane * 257,
> +						     *channel_2_plane * 257);
>   		out_pixel += 1;
>   		y_plane += step_y;
>   		if ((i + subsampling_offset + 1) % subsampling == 0) {
> @@ -690,9 +692,9 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   	case DRM_FORMAT_BGRX8888:
>   		return &BGRX8888_read_line;
>   	case DRM_FORMAT_RGB888:
> -		return RGB888_read_line;
> +		return &RGB888_read_line;
>   	case DRM_FORMAT_BGR888:
> -		return BGR888_read_line;
> +		return &BGR888_read_line;
>   	case DRM_FORMAT_ARGB16161616:
>   		return &ARGB16161616_read_line;
>   	case DRM_FORMAT_ABGR16161616:
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index b4fe62ab9c65..eeb208cdd6b1 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -14,8 +14,8 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
>   				       struct conversion_matrix *matrix);
>   
>   #if IS_ENABLED(CONFIG_KUNIT)
> -struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
> -					   const struct conversion_matrix *matrix);
> +struct pixel_argb_u16 argb_u16_from_yuv161616(const struct conversion_matrix *matrix,
> +					      u16 y, u16 channel_1, u16 channel_2);
>   #endif
>   
>   #endif /* _VKMS_FORMATS_H_ */
> 

