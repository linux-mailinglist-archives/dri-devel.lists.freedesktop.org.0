Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57E09BA3E4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 05:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A7A10E345;
	Sun,  3 Nov 2024 04:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oKJ45teB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18D910E345
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 04:10:48 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f84907caso3374356e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 21:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730607047; x=1731211847; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oKjiI7+uYVjpcP4rbI91KyK4/aPOFwXr9jwYzxTPDbI=;
 b=oKJ45teBcHbftXJv3VtwMMM9IlGzBV4k/GZA5jYlcuxsw+GPVWoRgSima020cWe7xe
 mH83vuNhMBbMuBaF299M1B2OvP7xsvoHv4+EHUuwOnCY9C6B3jdHt/oBMlXl5rBzq5j4
 PvitsyEMq2AwVeO4H5p2qcuKjITe7pdTUIW8ZsXzd2CnPMmPGnKBZY2D7y2em5pQq67D
 G2ySaEuWiRsnhjuSkaZGUq1Zma+OB+yB+lbl2/PMKx6sIP3hIZAujc+TgVcwe47DSqf8
 UkcQOXV11d/CGv7u5st5HiEGgKXfFknnktCdJOqEs3Dljz4GstNggdQzXtuoZYfyWLh4
 Lxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730607047; x=1731211847;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oKjiI7+uYVjpcP4rbI91KyK4/aPOFwXr9jwYzxTPDbI=;
 b=ulyg1GFwXn9PmUMzUNr28n4v6QRnPZwIecRC7appCCc7dYvLpPO/7mR+gAUXYNyu0N
 1F8uWbWmb/1zfeeKZ8I+kLSNl39UYLUfbUFb1U1VGK0UbIiEsKZuu/R3OEpPTV0QUg+2
 fjYtZEtvbtiqcoGQhTAOWFle64+fOp7LNomO7VEFQ4eGiJNd5T742hnutgEcYH4SJdsY
 pC8bvybz3asWU8ESktl+rgWIQCIfZ4WKYbBRkII8FN4VlZM4WaMPzveA7HhLbMykVBe4
 AOjxrkbb0mhS2oA+0wjVxX+CN78Fl4KueehpSCgSkQEx4QToICC9Fe8v0rsPboa36Kca
 Yspg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVh2o8+dyB7xOu6qZFycFQo+DzCtDHDlzKdMLIZ/QTu/Gx7oAgtDcOm2yWSaTfhOX15F8x2Ggxsjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6eFH/QlNpQC+TpRyX6bBmrSspo1lyr2TPb2lr7uwsk8bAHtAQ
 xUG5bEdOehtvSOtWXisuOXPmGVoEheqFacU4wGic9/+U38EIznJ2by/gBzFPMlY=
X-Google-Smtp-Source: AGHT+IH+dE8vbDtbk0g6KIFdQcvtei8xABv2NfChEkDMcDEuOiARbNNzwR5IRL8abnQAuzmweQTt3g==
X-Received: by 2002:a05:6512:2256:b0:539:edea:9ed9 with SMTP id
 2adb3069b0e04-53b348ec028mr13441328e87.1.1730607046651; 
 Sat, 02 Nov 2024 21:10:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9598dsm1155053e87.22.2024.11.02.21.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 21:10:45 -0700 (PDT)
Date: Sun, 3 Nov 2024 06:10:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Simon Ser <contact@emersion.fr>, 
 joshua@froggi.es, Xaver Hugl <xaver.hugl@gmail.com>, 
 Daniel Stone <daniel@fooishbar.org>, ville.syrjala@linux.intel.com,
 kernel-dev@igalia.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH RESEND v9 1/2] drm/atomic: Let drivers decide which
 planes to async flip
Message-ID: <y5vxaa3mwuhhrwn4etuxdvr6xemu4vprinp6lb75ch7a4amkdf@jajgfjczii7s>
References: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
 <20241101-tonyk-async_flip-v9-1-681814efbfbe@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101-tonyk-async_flip-v9-1-681814efbfbe@igalia.com>
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

On Fri, Nov 01, 2024 at 03:23:47PM -0300, André Almeida wrote:
> Currently, DRM atomic uAPI allows only primary planes to be flipped
> asynchronously. However, each driver might be able to perform async
> flips in other different plane types. To enable drivers to set their own
> restrictions on which type of plane they can or cannot flip, use the
> existing atomic_async_check() from struct drm_plane_helper_funcs to
> enhance this flexibility, thus allowing different plane types to be able
> to do async flips as well.
> 
> In order to prevent regressions and such, we keep the current policy: we
> skip the driver check for the primary plane, because it is always
> allowed to do async flips on it.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> Changes from v8:
> - Rebased on top of 6.12-rc1
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
