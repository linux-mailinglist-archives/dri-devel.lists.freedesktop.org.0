Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4CD99C994
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B716710E447;
	Mon, 14 Oct 2024 11:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ClFJ83Eq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EAD10E447
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:58:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so4748786e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728907085; x=1729511885; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDXxdgxZ7Ma3MW/R3VAkR8+WvVIPMHEYqKawEAYgO5M=;
 b=ClFJ83EqSgMrBOPKN1x+cikxnoxC9yPuX7JsF+IhInFERzI2t61K5pCF3XWDQMgmdl
 LZsENTMqtlsljl9u/SSPavuriTjVxaj1PZCI33XHLt+g1CAWcHLQFJWNMeQY+WVeclVF
 6OFKoLAXwOrPG+J2csQy+y2Yh7GguuZSUYBpbfiBbgRnaozvSULufy6EJ29WK9sdsrup
 VMJc68dj86Gc0BCR1lRtLaraF8kAheISQvCHaJygCmzNwoYLTHGYwW4B3Gz1OtzkoGIS
 ckHRiSGABcWeS1MA2bddpKyunj+OMMyCpsQs7TY/yMGmLjrAwqbXFyqXgydSoYOiH3o8
 rxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728907085; x=1729511885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDXxdgxZ7Ma3MW/R3VAkR8+WvVIPMHEYqKawEAYgO5M=;
 b=rHNB+7iKONOVEh8V224o0miw5rpk2X+S093W+l9SJDaWViaELCSIOyW0qTUzcJbQ02
 SEa1/ovwk304Wodk6ebqoUvCuk2tzcnMWwVHu/oc/+rxr1OU/pGQ2132mkZtMAe+L8Bg
 1sk+C1i+MZg/hV4eDyQb9BcO3zK4BsLFDzFAwkYvfBFWVUWtM+6RrhMGMcDQIveRWxtW
 E/jkato/2bOVtqyQ6iPKBUlaHpGiP2iD3MC1xm1Hm6+GaAScKH6Stpdb3qvursKysAmk
 42Cf8iV1btB6kus0d/QX6Yu7fvTXk0n5E4IuqmV/up3sz3f6QErQksDdngOywvMhk0XK
 xtLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5BB0khqDKcxMTjYsvNfR8bWvA6vAoR2xXCupEJHPclCJRCYlSqtXHD74MSbr0HXpkXs6y3t+dQNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyOmb9pEE0hkfJ3+cf5VC42Yqa/eX7jJqlzWlug7SHvvqNhq8A
 weYgJ7PpbORgC5kEsICSvdpsenB55ZP0nLmnh8iAaq6mYndiFzIKjwa4y3bnUL4=
X-Google-Smtp-Source: AGHT+IGpKf2Jj53ywJPZ7vdG/vfbYbMz3qeVmODq89yS2wggv0OB2B9rq7/JAAy4YSsa7bjVk2K5ew==
X-Received: by 2002:a05:6512:b21:b0:539:9524:92bc with SMTP id
 2adb3069b0e04-539da57b1ebmr5294838e87.55.1728907084604; 
 Mon, 14 Oct 2024 04:58:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539fbfe4324sm108550e87.113.2024.10.14.04.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:58:03 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:58:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 10/10] drm/bridge: it6505: add I2C functionality on AUX
Message-ID: <3s2bl6zruppjldqrjyfcn2pkrwptbwxo2rkrludczvtbnivdiw@6cy7523bmaww>
References: <20241001064550.32375-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001064550.32375-1-Hermes.Wu@ite.com.tw>
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

On Tue, Oct 01, 2024 at 02:45:50PM +0800, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> DisplayPort AUX protocol supports I2C transport which is capable of reading EDID or supports MCCS.
> 
> In drm_dp_helper, drm_dp_i2c_xfer() packs I2C requests into a sequence of AUX requests.
> it6505_aux_i2c_operation() is implemented to match drm_dp_i2c_xfer() behavior.
> it6505_aux_i2c_transfer() adds I2C functionality for  it6505_aux_transfer().
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 177 +++++++++++++++++++++++++++-
>  1 file changed, 175 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
