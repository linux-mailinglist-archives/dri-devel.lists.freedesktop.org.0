Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168897E322
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 22:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A67810E009;
	Sun, 22 Sep 2024 20:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YQUMnjcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822810E009
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 20:14:22 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5356ab89665so4363205e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727036060; x=1727640860; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hXnO0dAhio8cKR7ZLjPPkbdRt1uauj4aZsdYTjUljaA=;
 b=YQUMnjcGHqkDNKOuUhIv2IKAdk5BSpbDTZfhtZrZsNPH+3ghD/Hneqz9RtKDCjq7T9
 /hXjzNoLGr7aQNoYhdLmINK55ZlGKF7FvUPUPyQ+CHoI0+qO1dX6x6S+CEvVrheYZyaQ
 XepJATY46JBWZkshemXvRb6hiSfYx+nGXUS2FPqcJaZqm/dYzJuJ/7pYm80hG5xlC2mS
 e/+hvczAyhk4B/6OaCNXfGYMHXCnL1jrhhk6tsX5KqBCKKjzC8r/FizH+8eV+faZ+PzV
 5fQ0i0V0x8FDUh3ABQTP7IDQsV7hETB2PZnGolggzVBsnPpd2u1ywqu6sEmAolnJGky+
 ulmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727036060; x=1727640860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXnO0dAhio8cKR7ZLjPPkbdRt1uauj4aZsdYTjUljaA=;
 b=oGl5486coB8Pn56aFircsKv+kD68u3uhZXYkVu/E06i4N3SwBAABFuCEMrZ2mp30l6
 INsqmV4ABGWEFxloPnDJhyRLEHwGEp/KpqFel7SY47SxkLU4EQZilBkS41PdDFkK3qLZ
 VA/DvWik1azkdyE5e4ea5Lt3N313TMFk5CrXXQ5VGopBQJ3chVrRuz82QHMOZ49QO+E6
 TaX2OTf1a5KIgll57gG4iJyV5Syw+9ppgf27mvRHLUq8CR2YFMr7+XcZHp8BZjl0oUgC
 00eE2nSsTJzLTm9fjX9zdZppAocm8wrv9Eg5viqqZs9L9QqCEG3dqYjheP9p0tTdl98G
 1o5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmWGl2Q52vCmpqVkikvlxGFFzVL3vwYGqSV/VWvXyK4w+Jdpfe2v7VtSqraDWHduD/OcaBptI6CtI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO8HpMGxDBVbgUMpDkNaQI8HPUg49+Y4/Z4fIHmW/bln8E60vW
 0QjF/cQ2vS/vnOMYE2/QuhFbimfylI0GVXOd8+tUqw0pYXZGAzzxztP4dhZEx3k=
X-Google-Smtp-Source: AGHT+IHNntfHeoqZClLotGkHewiODZdHeP2Ru6UbyB/4XkBdQbNOsyJ6quJdr+0d7MsOdO94wbCHTg==
X-Received: by 2002:a05:6512:3f04:b0:52c:e1cd:39b7 with SMTP id
 2adb3069b0e04-536acf6a527mr4485424e87.5.1727036059628; 
 Sun, 22 Sep 2024 13:14:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704665bsm3052672e87.55.2024.09.22.13.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 13:14:19 -0700 (PDT)
Date: Sun, 22 Sep 2024 23:14:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <5brnhm3yqqbsnukllo4l53ohaeqmxum53mwq7dme74ny5dsnjq@shjoravp6beg>
References: <20240905124432.834831-3-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905124432.834831-3-lanzano.alex@gmail.com>
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

On Thu, Sep 05, 2024 at 08:44:00AM GMT, Alex Lanzano wrote:
> Add support for the monochrome Sharp Memory LCDs.
> 
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
>  MAINTAINERS                         |   6 +
>  drivers/gpu/drm/tiny/Kconfig        |  20 +
>  drivers/gpu/drm/tiny/Makefile       |   1 +
>  drivers/gpu/drm/tiny/sharp-memory.c | 682 ++++++++++++++++++++++++++++
>  4 files changed, 709 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please sort out the review tags for dt bindings (either as a v7 or as a
reply to the corresponding patch). Then the series can be applied.

-- 
With best wishes
Dmitry
