Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72CD177B9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5EA10E484;
	Tue, 13 Jan 2026 09:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ox6ckTon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94A310E484
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:06:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso66614345e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295167; x=1768899967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqK787/zdRuNWrcsacNL83Odl0czet1nnm2tIHnOZP8=;
 b=ox6ckTont6IjlPwJpAx96BMfvVqmttJDg8xEMzglYbcxT27YNCL5ATALoH4u417ajo
 GC+q0JmsxNN6zu2j8fmJN4imvPYu5QoJARpkxDLkg+L4clNV+UNnLKwzwf/jigcMrejY
 ANZ2tPi9RXw/gMZLsc1fUha0uvz7k5hRRsJyW3sHYi2FHxtNfLm3wcmINvr99utbXX9y
 I8geVXo3pRH3S/xRqxcyDwpFtHmqKKEaFqqD629Rh7roxNgOcqFvH9rxP8y2DYV5MZ2Q
 s9bOUgjOXS0hKN1OLRHPIId+UWHM2eBd9imDEElp6IJPn2RgpFMyXMr97wEF8OmeWGDZ
 Deog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295167; x=1768899967;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AqK787/zdRuNWrcsacNL83Odl0czet1nnm2tIHnOZP8=;
 b=GXQRQHtFdVt7sIkcGfrb+YSOnGu60aUee8rqD+qrIjNRUcJJJv6oF8bl5FLnOI8PMh
 YQRE9m4ZhqwLEsXxc6WngPcEBYrVvlBWODgtLTlGN4PkdSinSdgrp70ba70gBGX9OOkT
 UYHP/sIsWimJUSaNywAR/a8jnpuOQb4MX8zqYU7XQayHsZLAWF2ki3ISNeBUnVor2YMZ
 XjT62aBM+LG1kFybJYYxryAes28ROgAboVVbXGX2yCIKuZpQeNdgxwNb2jJwnX3CQiYv
 8LcNwFEPrWVDmQA42Qla5BhkhUULUQbl/5S4UQ+ZC9n9aapeH/D65Bjjir0+cZ/ziKLH
 Q9rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb8Kq5lizFVxe0jnjglC9+fAMokScoMjeQNZZcNiBXgGoggVVDTXMuuJHZmuzr6Q45wn1BxPDYs28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfkeCllWKYyUJUD1P24B/DZy3bcvP9ev2BIItPOpcYp3ZHk0FL
 tVthakjyHhaTv3ZYf1s4c0TZT2r9AQvINlxawlK0Z4QHhPq/UDQ277/wREEGuZLlVsAWP5yamd1
 2sXJj
X-Gm-Gg: AY/fxX7OnrpH1FCE970SninjvZRtAFihCBDRhjEDmhKHXoi227Tegoqtje0KimwIbBc
 ROpsFb9kpYj2BmMw3yrDDhY+w8RCl94S6h6QVwynT0EYz1bimADl2JOlaFLWmeoEtfnXsWPmmBu
 omDrbwb2t0w1hlh3njPQIYYkxfN8b0y0g4Bx/2jPljO7/+JWjmAq+NjCYHSEOWwBcXcNP9V4api
 17spvJ2mYZnTvNVahJ/v8ES7Rf+9K5ciHCCXKOcjYk91poG//BEhXF1zhoGorOnqpZwhDy4v6Kw
 3fObQnutcacSLbD0wNSVWrpSMwab3nVp2VFbxFQlD2gBW/ZV4ISfDXsa3tMFQ6K/lp115HobdRv
 2dkPWmLJG04/igBTpruibtjbNDu9VDwb7z0D/3vwPIU1va6JFkaID71F5mWG1fc7z06oNgzituz
 H6AoHbCIcYm0BqDc6/GCY=
X-Google-Smtp-Source: AGHT+IH32H7DrrJfDznDfer6T6NKmAqU+johaMZVkksiLwoI48BInzNHabUE4o/kQTVaIzlRBQ8ewg==
X-Received: by 2002:a05:600c:a08:b0:477:63b5:6f39 with SMTP id
 5b1f17b1804b1-47d84b3477amr212210935e9.19.1768295167091; 
 Tue, 13 Jan 2026 01:06:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed9fe7ac3sm11118635e9.4.2026.01.13.01.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:06:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Vladimir Yakovlev <vovchkir@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251208161613.3763049-1-vovchkir@gmail.com>
References: <20251208161613.3763049-1-vovchkir@gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83102: change to
 gpiod_set_value_cansleep
Message-Id: <176829516629.3839584.1563715741397294916.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 10:06:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Hi,

On Mon, 08 Dec 2025 19:16:13 +0300, Vladimir Yakovlev wrote:
> It's better to use gpiod_set_value_cansleep because the panel can be
> connected via i2c/spi expander or similar external devices
> 
> for reference see Documentation/driver-api/gpio/consumer.rst
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: himax-hx83102: change to gpiod_set_value_cansleep
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4a768c544f64eaa2fc7cfa91e46f43aa4aad0c40

-- 
Neil

