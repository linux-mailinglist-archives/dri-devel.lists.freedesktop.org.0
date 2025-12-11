Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B849CB74F9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6886C10E113;
	Thu, 11 Dec 2025 22:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jGz99nO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C736010E113
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:41:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47755de027eso4724265e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765492864; x=1766097664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oc1kTCaPU/Up3VBWwNqeucLbtfTNSR3ZKTbW8ftdd+s=;
 b=jGz99nO84ABhAg0PLwAZ562tzPYn5gx/Qj7MlrZtfvHO6MZeNMuyW6diBWfHwGDAuL
 sgayqcNz+7PeWl3CeVa348ahrP7FFFB2/HTe0fsNuTWEicasXw2CpXy07hrQnE5WLpIs
 sOb3QORVhNTchtHVd7KBDhPr1NcVpB+QeFBAHGmMsII0n8oN5ay04E2vmvJHEuCaYS+8
 LIhqCyqvqDyjEw0UNnfrS+IPSf2L2AkNwc6le+dVZEpjdbRxthfqkrV6IeCLKGggKBR7
 l0k2rVf4k/wP/2JXz9r05awUn0Y3+m81kKe/tOZV4iwPinYDIzfMVJyLUM9kdiRgUeqW
 YGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765492864; x=1766097664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oc1kTCaPU/Up3VBWwNqeucLbtfTNSR3ZKTbW8ftdd+s=;
 b=RLzuMCsTBQoaEtSdflpYMMLZMvllkLgc3Mwf1ax++Ozqxv1h0n9i9h6u+/wp5beXnZ
 QfkAqvT0jPoOgcZ0+PrHOaAL+z5roegyVUCm5U0/Vbo4wXbbApM9KGKXpuX/aGhZ0uR3
 EunvpippLRkVTEiSE8Ac9NZzDJNiw12AJp4PIbMcUWQX2YiKVCamD6+hVFjKHxob4t+T
 sW+I+/TZ+/bYNWiBiPJs7n8roSw0d84jIK9iP3Qpd30KMgNhLby2+RYJsA/lM0FxpSzv
 Mqi5z8E/y1xZvDFF7cc/g4BGrgRgAyPeD6IS0gog1bW6mW+x6UF3wuiZ0ZuyMC5AtMoB
 GwsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNXMYnCxJ4WBV/OmSqY4ugJjJ7umt5ZF0TDjJPftj0KO9H2DvrixhF7Sbm4SqQHehG4/SqbkRkMew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym06RqeNeYPrFCf2JmJbiUi0s+b7y5ZlJxrY9lWEiVf8Lr5x0X
 XtbsMqrUuuiKvCBZMSwcxfdeuA/S5uw54dUW7XAuLIWwkDk0hGG2/upD
X-Gm-Gg: AY/fxX6tKvt/yfgyZHPkv5qZXsKr/U5IuJOq+2WDquT/8Lm4uh5fslynT+W3otGkPBj
 ztddSd/JlJR2QEOPMCFkRyws4tZsvqvxAlISAzc1TdYyi/Wc16/xDASvI9uCAzOAb1kdOKleF7L
 +ygNluIf6n3iE9ig+xuF6Liy8o8hNYfEtSdnyZPcWV3st1Mk7rZk+njf6y/xsNaR4zG7aewlPHc
 sCR0RFOP75j6njf8VnR0FOuKE0vpQaAtW+FHhkzs/pHwGkmgGlIzTe2l6TXqb3oOq6qf+y9mDc0
 1ON1GhA3P2SvjaRb3KPHQ+HSaYSJtBn/EBVzsPrvPQc5YqAqzd5DwcLHn0Q150YPKkrQzq/DC6y
 sNGYUf2S8eQcvcwK2MT/VY5SOH/pqU6oY+Pmnqlhiz2N6+istIdHmOq3b4gqxJ6z8iLjoUPgCip
 pgT33k3puwyd/TNxnJGn0tSbl7yLcKfuYcL30UPg3W4hCIeBvO+b0O
X-Google-Smtp-Source: AGHT+IG1bTT2BZs5zspIv+MpSidSuvbOeyRhbmBxmTJnjzWF8kBNNUW7JY1Buz+51tBubecYulXc/w==
X-Received: by 2002:a05:600c:1991:b0:47a:80f8:82ab with SMTP id
 5b1f17b1804b1-47a83843776mr80137805e9.24.1765492864263; 
 Thu, 11 Dec 2025 14:41:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4c624esm326205e9.15.2025.12.11.14.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:41:04 -0800 (PST)
Date: Thu, 11 Dec 2025 22:41:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel
 Stone <daniels@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v4 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
Message-ID: <20251211224102.5e079d70@pumpkin>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-2-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-2-5d50eda26bf8@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 11 Dec 2025 21:40:32 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> From: Daniel Stone <daniels@collabora.com>
> 
> We already clip the plane to the display bounds in atomic_check, and
> ensure that it is sufficiently sized. Instead of trying to catch this
> and adjust for it in atomic_update, just assert that atomic_check has
> done its job.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 29 +++++++++-------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 20b49209ddcd..81b3eba07095 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1214,28 +1214,17 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>  	src_w = drm_rect_width(src) >> 16;
>  	src_h = drm_rect_height(src) >> 16;
>  	dsp_w = drm_rect_width(dest);
> -
> -	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
> -		dsp_w = adjusted_mode->hdisplay - dest->x1;
> -		if (dsp_w < 4)
> -			dsp_w = 4;
> -		src_w = dsp_w * src_w / drm_rect_width(dest);
> -	}
> -
>  	dsp_h = drm_rect_height(dest);
>  
> -	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
> -		dsp_h = adjusted_mode->vdisplay - dest->y1;
> -		if (dsp_h < 4)
> -			dsp_h = 4;
> -		src_h = dsp_h * src_h / drm_rect_height(dest);
> -	}
> +	/* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
> +	 * us, which keeps our planes bounded within the CRTC active area
> +	 */
> +	WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay);
> +	WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay);
> +	WARN_ON(dsp_w < 4);
> +	WARN_ON(dsp_h < 4);
> +	WARN_ON(src_w < 4);
> +	WARN_ON(src_h < 4);

You need to do something when the tests fail.
Carrying on regardless is never right.

	David



>  
>  	/*
>  	 * This is workaround solution for IC design:
> 

