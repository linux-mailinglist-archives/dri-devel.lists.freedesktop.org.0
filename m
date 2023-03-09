Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F06B30CF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 23:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB3910E901;
	Thu,  9 Mar 2023 22:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893D10E901
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 22:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tW8Jr8PrZ/39YvJQ/hIugo55QkLvCHWlHWxzXtj1Z+o=; b=RpttlW4i5JN82N76BI13tRDYyt
 wcn1Ede8liwpsldG3dyi+d7K76Nt49sCLZ8jzxOrlGRcTWFsIdIBt1JlptVyBgUmFeg9fj4r5VTqG
 /ROS2Hi/Y6yP5RXw82B2OkncurSJp0zogelD65GZ2AhBSLcEXmS/fuYJ1b5Um0btQoKJqGbhuXHJL
 TvEMAiVvX3349EelESba09QAXRd75jAkxACzcCfddx1htB7ZU5mlRG/4s4g4qWL93k27SIjSYoU4J
 prm81JlngamclJOxjzYfFd1w5+EqqQ5MAoBe9lAcr3M2bL2ipIcarPT3l/jTBnwsfjjmrvRHMrEOb
 1rNm7muA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1paOqY-002ATD-SN; Thu, 09 Mar 2023 23:34:50 +0100
Message-ID: <cd7c5dfa-0650-05c0-96ac-baf1fd397e3c@igalia.com>
Date: Thu, 9 Mar 2023 19:34:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] drm/format-helper: Make conversion_buf_size() support
 sub-byte pixel fmts
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230307215039.346863-1-javierm@redhat.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230307215039.346863-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/23 18:50, Javier Martinez Canillas wrote:
> There are DRM fourcc formats that have pixels smaller than a byte, but the
> conversion_buf_size() function assumes that pixels are a multiple of bytes
> and use the struct drm_format_info .cpp field to calculate the dst_pitch.
> 
> Instead, calculate it by using the bits per pixel (bpp) and divide it by 8
> to account for formats that have sub-byte pixels.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
> Tested by making sure that the following command still succeeds:
> 
> ./tools/testing/kunit/kunit.py run \
> --kunitconfig=drivers/gpu/drm/tests/.kunitconfig
> 
> Changes in v2:
> - Drop an unused variable, that was pointed out by the kernel robot.
> 
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 9536829c6e3a..84b5cc29c8fc 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -409,12 +409,15 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
>   				  const struct drm_rect *clip)
>   {
>   	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
> +	unsigned int bpp;
>   
>   	if (!dst_fi)
>   		return -EINVAL;
>   
> -	if (!dst_pitch)
> -		dst_pitch = drm_rect_width(clip) * dst_fi->cpp[0];
> +	if (!dst_pitch) {
> +		bpp = drm_format_info_bpp(dst_fi, 0);
> +		dst_pitch = DIV_ROUND_UP(drm_rect_width(clip) * bpp, 8);
> +	}
>   
>   	return dst_pitch * drm_rect_height(clip);
>   }
