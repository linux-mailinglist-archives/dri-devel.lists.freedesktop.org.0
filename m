Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72392A323
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053E810E33D;
	Mon,  8 Jul 2024 12:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fpC5Wq5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A4B10E349
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720442833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlM1eJm3P9WsXHxaBSOZ8byC8Y8vzpMTDCzq8EILHzA=;
 b=fpC5Wq5uEcFPXvccJSjhWXn1GsY7gjm653BQXQ1TEhTmQFAVQUY1xDuXd0yA+IBAth9qAp
 N4047ck954QFZttFVx4715/kEMd5OK2DlifnAXvRRwBJI3bsvh9JB1KQNg+gr95a5Qvp1q
 iGAiKxjbHth8YZP6njGwzY773HvniO8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-CidmKex0NImUYPK8sZaoCQ-1; Mon, 08 Jul 2024 08:47:11 -0400
X-MC-Unique: CidmKex0NImUYPK8sZaoCQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-426654e244dso10306515e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442830; x=1721047630;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FlM1eJm3P9WsXHxaBSOZ8byC8Y8vzpMTDCzq8EILHzA=;
 b=AS1MXeTYxeBIVVSFM3n/qxBS1+OpuHbExFU6N62q73kJfM3OMzP/NuYHKYH0gQkrFn
 fUZQs+uhA2dzBl10Vfz4YchpdCpy9uoJn1Nck7evq6GitPbTd+eUWuOeMaTWlWj43CLt
 cdgl3Jyu+7JwlnpSI8hs9WCrlrTRMT6M4a5YPmXyc0NX6MpbK1bsKlLNXrSekJtuOPfa
 8CL6VGwthU4LJuFlSzUZ+IFIseq43orjcBMg5yZRI4IehAaMwKmzdu+X5E/obhoUmvZW
 bfpbyfb9wNzAnD5vgwUR8rmzQdNfHmAzwg0VeeYD4T3Hu4+3OaTDPkty66SQqd+s7ukn
 g/9A==
X-Gm-Message-State: AOJu0YzqK6InKNw4UNAqJLnzuGgabVgnP+mhPV2rUTUTa/J7DO7whq4O
 p3suicoW59a7Q8Y5LmmeNq+ioEGnLhl/fWp8oPE5fMmB7D0wW1hazs/QtCDbWxv2BIUd/xonw9D
 T1Ac4VDvRLGvFvARqJyHbEzMvzJjiCEwBppN8VEQyu54zLObLdl48gvRHbdKHty2reS4fUcUnBw
 ==
X-Received: by 2002:a05:600c:4da5:b0:426:6099:6ea4 with SMTP id
 5b1f17b1804b1-42660997099mr37932255e9.38.1720442830527; 
 Mon, 08 Jul 2024 05:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSIKebXC9O7lJ6RjwNWrSzHeagTsdiaWEFOwS9mHEgMDb0GJtguvWiGJm4Ik0RsebRMMrfXQ==
X-Received: by 2002:a05:600c:4da5:b0:426:6099:6ea4 with SMTP id
 5b1f17b1804b1-42660997099mr37932155e9.38.1720442830302; 
 Mon, 08 Jul 2024 05:47:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d5116sm165870405e9.10.2024.07.08.05.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:47:09 -0700 (PDT)
Message-ID: <e2429ef7-9b0f-4ca1-965e-4d01d290aaa8@redhat.com>
Date: Mon, 8 Jul 2024 14:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] drm/mgag200: Implement struct
 drm_crtc_funcs.get_vblank_timestamp
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240705114900.572-1-tzimmermann@suse.de>
 <20240705114900.572-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240705114900.572-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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



On 05/07/2024 13:47, Thomas Zimmermann wrote:
> Implement struct drm_crtc_funcs.get_vblank_timestamp with the DRM
> helper drm_crtc_vblank_helper_get_vblank_timestamp() with its helper
> get_scanout_position. Read the scanout position from the MGAREG_VCOUNT
> register.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.h  | 10 ++++++++--
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 25 +++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index f7b22b195016..acfa05335b09 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -410,13 +410,18 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
>   void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
>   void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
>   void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state);
> +bool mgag200_crtc_helper_get_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
> +					      int *vpos, int *hpos,
> +					      ktime_t *stime, ktime_t *etime,
> +					      const struct drm_display_mode *mode);
>   
>   #define MGAG200_CRTC_HELPER_FUNCS \
>   	.mode_valid = mgag200_crtc_helper_mode_valid, \
>   	.atomic_check = mgag200_crtc_helper_atomic_check, \
>   	.atomic_flush = mgag200_crtc_helper_atomic_flush, \
>   	.atomic_enable = mgag200_crtc_helper_atomic_enable, \
> -	.atomic_disable = mgag200_crtc_helper_atomic_disable
> +	.atomic_disable = mgag200_crtc_helper_atomic_disable, \
> +	.get_scanout_position = mgag200_crtc_helper_get_scanout_position
>   
>   void mgag200_crtc_reset(struct drm_crtc *crtc);
>   struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
> @@ -432,7 +437,8 @@ void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
>   	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
>   	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state, \
>   	.enable_vblank = mgag200_crtc_enable_vblank, \
> -	.disable_vblank = mgag200_crtc_disable_vblank
> +	.disable_vblank = mgag200_crtc_disable_vblank, \
> +	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp
>   
>   void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode);
>   void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index ec6fb1277d6e..fb03422c763b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -718,6 +718,31 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
>   		funcs->enable_vidrst(mdev);
>   }
>   
> +bool mgag200_crtc_helper_get_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
> +					      int *vpos, int *hpos,
> +					      ktime_t *stime, ktime_t *etime,
> +					      const struct drm_display_mode *mode)
> +{
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
> +	u32 vcount;
> +
> +	if (stime)
> +		*stime = ktime_get();
> +
> +	if (vpos) {
> +		vcount = RREG32(MGAREG_VCOUNT);
> +		*vpos = vcount & GENMASK(11, 0);
> +	}
> +
> +	if (hpos)
> +		*hpos = mode->htotal >> 1; // near middle of scanline on average
> +
> +	if (etime)
> +		*etime = ktime_get();
> +
> +	return true;
> +}
> +
>   void mgag200_crtc_reset(struct drm_crtc *crtc)
>   {
>   	struct mgag200_crtc_state *mgag200_crtc_state;

