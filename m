Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7C9A546C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 15:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7575110E094;
	Sun, 20 Oct 2024 13:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dQcdvqcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE8610E094
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 13:53:26 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f8490856so3820279e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729432405; x=1730037205; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/dcZocbQAxMZJMuRQMBhMQ2acDaQQYkZv0genuOW6so=;
 b=dQcdvqcVJK4vxpyTEdPaYV8U0ZISYRXuJJ2yWca57d+BUkVaVZzhqLHgJWPeBOmz1F
 DPOFkGE84s80vDw577nZxzdHOXf6s3enECRZ00qrf5Dc5bAnh0BPjJO3wiSq7aKxZ8A7
 9FcT+RLMgTaiWnR+C/+EN/lEsw+c8yYDvrINS1F/baSYjd3pZJCVFduz6J1ZoId1x2hL
 kGXLwsdgnTKTv3A3RFf8IuR4DmtagcpFHGDwQzVrlJFp1vSM/VCI2ke+UrWgorvMqR9g
 ArxzBipYdX5Bd8UytrsXO7WTRYS5f3A/8/g1sWtjQMcQItu/GzWTPH2SKpFRkxzdYUiK
 nnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729432405; x=1730037205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dcZocbQAxMZJMuRQMBhMQ2acDaQQYkZv0genuOW6so=;
 b=ZyUge3yVasOV4sElFZHX1qyOwXT2ZMHyqiy1wpXw1InbycqjrZYgfVVQkBtL5xB44A
 XHDTMhAB0ojfd3zBJEmR/zC8U2Bs2SHbNFrcbY0NK9qMN6VqCWMRGB5qqI+p9hxbUAPZ
 j+YgfWSXrrUa/4JwRNR7AcaHdg5kGHFD46ScCjzvcAWopTro7K+M7ToTRsjvoI7Vp8Zy
 JVkFLYiNv/R/hsz9JNJGo0rD4z3zcEBF6OwX0207WkjC72YFOtI5qc4CBlsG8cME8qrH
 0tYJbJQdk4YpztsnrhTE7m5hlKa7BapUzdNI3YqiK4+diEGAODL6yl0Puau5MZ9ObeRx
 Q4nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnel4sQ3Txcj8Y/cqqyfcGVy7RjmdM2yejCB65eDg6mM5PhE3tls/0y9XiDV/R8+QyHloAwealEkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwYQnDDDHEu2GDn7ZfE2+oBylAApbBWuQuP5xsQu7yx9oxNaR+
 jCoLMs0PspN2trO0WqCMeUQcmiq0eGjRUo9P5soNrzfiMP3Msgo9+j1xSCDHkhU=
X-Google-Smtp-Source: AGHT+IExkPAoH6vcrB6ciPGIESblnBskG+VZiXEozUG0W7ri0WIjDPZ44I7+RixVz9rzjj9APfG7Dw==
X-Received: by 2002:a05:6512:3d88:b0:539:fd33:abd2 with SMTP id
 2adb3069b0e04-53a154989aamr4051319e87.25.1729432404693; 
 Sun, 20 Oct 2024 06:53:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a223e5951sm232241e87.58.2024.10.20.06.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 06:53:23 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:53:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>
Subject: Re: [PATCH v6 02/10] drm/bridge: it6505: improve AUX operation for
 edid read
Message-ID: <bs7oewydwrzotmaqrlruwztwbx52lo26j6h62odq7j2rmijzmk@h3pbqq2e6s34>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <20241016-upstream-v6-v6-2-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-2-4d93a0c46de1@ite.com.tw>
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

On Wed, Oct 16, 2024 at 03:54:14PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The original AUX operation using data registers is limited to 4 bytes.
> The AUX operation command CMD_AUX_I2C_EDID_READ uses AUX FIFO and
> is capable of reading 16 bytes.
> This improves the speed of EDID read.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
