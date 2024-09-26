Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630AE9873F2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 14:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93C10E114;
	Thu, 26 Sep 2024 12:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PuqBPQBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8B710E114
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 12:57:49 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f74e468aa8so11152601fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727355467; x=1727960267; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vM4riqznf53XEshqaMI3LvYoXS/N4+2mM9WtOrWMb8o=;
 b=PuqBPQBcDSHeSGFdPbsoWcLzTFavfPBPUm9I8OsZzGNqY6pAMNqf2jPZBH7a2QJRCE
 R9p0wuQClr3+8NMJCy4JNLFY1Eh3FaEHK0dOd1jeODyqm9fVjvoOESsif5QMMLcn/7hK
 g3kQdK//eK6TssUHV1stT+L8kWSbByGFJwb5zmjX5bw7hMdL5jtzv7oTdi9phDxiT6Pp
 2TTpv4DoA37ZG0cG2o2zowySHEgpfD6TePB2QK6uXlxIJasN875dDxnK02PTPlYe7DVK
 ctWQdlrCP02EW6cAS+tOtt9zHVuGJwRUnB7OVu8nZIcIebcEBl4Hi+tmVzgMLFKF3fn8
 0Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727355467; x=1727960267;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vM4riqznf53XEshqaMI3LvYoXS/N4+2mM9WtOrWMb8o=;
 b=arduTAEAfn5CWOL2cVXzSJLTYittFsasjaoHt753DzK4AqsVXimQ81P5FI5e3zyAuD
 EFmdNvERQxPkKe7OviEIzGCagjvyZakYrRnNE0NDGttv20Nssl6+O9PsPsjPk19xwMps
 rJBqCBBN9hlujBhyN6NC4wZn3cUKXql/cG3CRWyCE+QDKCy9yF9NSDUttEuoZqCLSLqO
 4qMmJOq6VLT+WFoHTRu1Ln2GJ/ghp6DOEZillxGYcTNDfw6fylsS9VXpE1n+i3GflOka
 yqov5TMOfjbXLVNaDZv1ouhT6oGv/k4Aa7SQO7PkB272w4meRLiev+6wXiO/dpvfRSdt
 q4Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXig/4/c0rGo5M9Dv7GQ1DDz9Z18ptcuAxk8lzjphCQlHPWqddpR6A8MDAyhejw0yv+MFFQg2GJspU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvP0nvDuV5KHaPKf4BzXiBr4R4Qtzbf3ndtlTu7J+pWnJV3PNA
 18zATMfQ7SPXNU9CnCFfgCQxKn4pjHO82JvZc9VCY+xYxw7vOCtRrp6iF8IBUcY=
X-Google-Smtp-Source: AGHT+IGACxAZbt+YnAz82WrzOPNhqNGcFBiNcJqqzSjSkXYYarhKI+vR0hYRRNk/L+HWs70Vy0mDew==
X-Received: by 2002:a05:651c:1027:b0:2f3:a06a:4c5 with SMTP id
 38308e7fff4ca-2f91ca6fb6dmr31821781fa.29.1727355467473; 
 Thu, 26 Sep 2024 05:57:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d288e0dfsm7981491fa.77.2024.09.26.05.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 05:57:46 -0700 (PDT)
Date: Thu, 26 Sep 2024 15:57:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Kenneth Hung <Kenneth.hung@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 11/11] drm/bridge: it6505: Add aux i2c functionality
Message-ID: <loulf3p74x3p6dinublo6xenwjoyssm2f5rk5g3env54abhath@37i4vlvxjn3f>
References: <20240926075134.22394-1-Hermes.Wu@ite.com.tw>
 <20240926075134.22394-2-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926075134.22394-2-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:51:34PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> Add aux-i2c operaction in order to support the MCCS function.

Brevity is the soul of wit. However in the commit message we appreciate
more details. Is it enough to get monitor control to work? Or is there
anything left to be implemented?

> 
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")

This is definitely not a fix.

> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 177 +++++++++++++++++++++++++++-
>  1 file changed, 175 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
