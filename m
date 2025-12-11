Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB5CB74F0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 23:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C283210E021;
	Thu, 11 Dec 2025 22:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QV12dOb0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3BC10E021
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 22:38:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so6778385e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765492705; x=1766097505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJB9vsPJhBGqG1y/+P5/s4l3WFLRuJ78lA6bLowUWtk=;
 b=QV12dOb0CDVksv9t6AFCiUCLV4VQ9tGv97UVf9CnvBmBK25s8R60BCa4qEDFXSAM5f
 2Yjw9yZxEzZG9jZB6v/jk41YVZdiY9HsODkDKwYI6tmWR89dRCadwe4FeVvB22/WOQiA
 3mro2ofsrEUqh5NAH+ypCSKPkCbjG4zCdGShTpbieVBzsAP0/22cND2XbKBJpcw9mC9U
 YPQ1pJ/ePTe3sI6PKSL6urfhJZ8+DezqhEfX5mxgOXDP244jEqNougNggVWsoGY31CLY
 CszlzguSxQ7SETg9K/yanNsMSyfSo3BIWm43+se/NYrqDDBzr4UpXyw8xuwNTEYWeOxW
 K/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765492705; x=1766097505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hJB9vsPJhBGqG1y/+P5/s4l3WFLRuJ78lA6bLowUWtk=;
 b=xEKNKk4sbbilERt4Rpcj0Z+tR2Faz2PGBWX+2huwJjMdER6VOrVrLFXLmVo8q6OW7x
 YunQd9d9K6Kv61T44rRNAPwL1wVc/+vFzdzRjYSEgmdCIKP0BJw4CrwSfSXJNdnXaoLI
 KbG0tJhTcjWTDpqFjt+pOV1wbNjBPn5vB3EJU3BgLh74lE98SJ0uRql0rmXjMEF7HZBF
 zIFxnfx6HPOoFnxcP7KmrD+SH1BNgISnDhI9NibDwAFNLRr1ivaBXo+rJC6HI0LNm9mn
 CJnf21kACqdWkjk/QSRNxUXxeawl2gdQMb/adZtCrV0CaT5/7Yg6dTwJpm2SiPxfowOX
 MXyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwLhmuTuWHCZKoJEBx6mEMHfXrojo4deZTka5Vm2wnc8ApqTLL0/Zkj1FlzjVzJHGmS9QD8KdRll0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF2o6pf68fg3Z1IsRGe2r+vsP3BGSPyej5oL0CvLWKd7jch1R+
 m4SzRxFq8eQyCo03VrAsJULVqEK7T4xaqxkc/xalWnlnbnNq2q45FPje
X-Gm-Gg: AY/fxX6lQGnGQ2kHR+D1ONs427/jAcQhLX48IVxrTCSVBZoIl1+uLaLSmcEmihpBMXS
 Ca0W7CtH+nMsLrtNmTPwp1ADjF6dhaqvsdhrI6jO1BVwTTLZ98B/6v88XvaQtqsMBlWjL7Ufkbk
 Y7pIuTJoYLH6Mazp9Io0iWD3MHfJo5Y2yG5F6Eidbtr4x+nqQibqK3M5SUysxwXIVvCSy/1kAKX
 kkL6yiy2KFws0QwwXiAQwV3nCI3favWLyTrZiQHawFhvPcuNPdbBpAbbb3Se/alfEdI/DhY6ohe
 NCycQF0YazbBsoJeBIllut/jlTdwooAV0ko65OSgz2gR2mp1CYKoONYYA3UH0qdy6j6KHtj8juK
 Kv7yUxCWCNnXPDCgpalRrd2o39/tWz1NT5AGy8vY0qgI8LsLE2PFAnA2nJnLkotqw0MJhDJGRO0
 rRUpM7YTRQqa2Rs7OFxFAsN6mEc6tsgkZMOQPrfRVJe5qvAJ3j9jPU
X-Google-Smtp-Source: AGHT+IHLwdFc72oZ+XpABv665DoqMI2joXHmdbmUSRJgh1kVpg1rJGVTxEvlCZOJHg/L9U83lkVLTQ==
X-Received: by 2002:a05:600c:a06:b0:475:e007:bae0 with SMTP id
 5b1f17b1804b1-47a8375362emr95622175e9.16.1765492704852; 
 Thu, 11 Dec 2025 14:38:24 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f3a20c2sm508975e9.6.2025.12.11.14.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:38:24 -0800 (PST)
Date: Thu, 11 Dec 2025 22:38:22 +0000
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
Subject: Re: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
Message-ID: <20251211223822.6eeabb4d@pumpkin>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
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

On Thu, 11 Dec 2025 21:40:31 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> From: Daniel Stone <daniels@collabora.com>
> 
> We should never be able to create a framebuffer with an unsupported
> format, so throw a warning if this ever happens, instead of attempting
> to stagger on.

It doesn't look like you've changed the behaviour.
Except that all the systems with PANIC_ON_WARN set will panic.
I believe that is somewhere over 90% of systems.

	David

> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..20b49209ddcd 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>  		return 0;
>  
>  	format = vop2_convert_format(fb->format->format);
> -	if (format < 0)
> +	/* We shouldn't be able to create a fb for an unsupported format */
> +	if (WARN_ON(format < 0))
>  		return format;
>  
>  	/* Co-ordinates have now been clipped */
> 

