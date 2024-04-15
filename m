Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F48A4FC6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E20311253F;
	Mon, 15 Apr 2024 12:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OVXH+CBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF88511253F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:54:25 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so35252941fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185664; x=1713790464; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
 b=OVXH+CBPog1XD7GKjMePbi2e97S/qe7cTvi7M4EYNuKb+j5Q9XeZkd468wlE5GBaEO
 ZOlZQQZV9G3jJv7L7efZIoBhxM727kGGSIKB81NwDKTBb2jjxsjdEDTUGvhEFEqM/tsq
 UkqaldmRA80oqs1CI59sjAeKKlzIJKoGU6dsWXWUsNsQs+yu9SBS/8V7+DnUDIw4Ru/k
 NiKDVrjt/WprBeJ8hl+3vodKLoNGh7c2SpS5I6ixLWFFxjXzlC2QtcyF5k4Nt7m2jdQI
 eMYcY98tDDDX4NQDEnpzbJqFkKF55/BW1ZX0TC424ymKfAipRf3zteeoOIxs/DXyxvwr
 1QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185664; x=1713790464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
 b=BRIn6PCBKG9HaSPQhrbd1RwGQ2XphebLZ78qzjMnLIDZczrIzbfuowo2G1KOT3H60i
 lxaIm0iV6gQbLOYVgO5CMniIDe3TsQDv/f9BxTsF48ij9b+NOE4gHnAm1yK6zLwGpFyU
 3x1g2Ei5K5kaYxFxLT40cfE76aObVzT1+fj79FxOK4pzRw/ir2v6bqm4OZLejeKJL+n+
 +GT+zvRldalEYkUi8//K7rQVljwvyzXmUriZU81KTKi2PYecvueOS0GGgqBInwIO3YgH
 rGEoYAm5J7ujNS97GsRoIbNSC53m+aS1W9RF/RuHr9tp5sFQnP+5VX9cqPrT2TQwf5JL
 s+2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlqoU9kAIbnzWGj/bsk1qZ42cyuXM3PJi8qngPFFI8CTjO9igqUkLh3hzY2B4PAJ4vuJKBwtKFSoY9V5mBoIr0L01+jxQV+HzF03bSDq9L
X-Gm-Message-State: AOJu0YxfowIkD0VznUsdBxFHN1luX1K7A2/HwU6aCGqDcyGRzwLxWPN7
 WqFUTz+vdz79wJ+yqyvwPFfv4SogxIR3BoA5FaXIAih9oXuecwbvyAvUehsWUfM=
X-Google-Smtp-Source: AGHT+IHWAIlGaPkDWCdPgAXfWq/+MLUcSYotiH9LGBzmKnQ4SFxdrNrzwncOrZpKE9P8st08sqCGFg==
X-Received: by 2002:a2e:7a16:0:b0:2d2:4637:63f with SMTP id
 v22-20020a2e7a16000000b002d24637063fmr5787093ljc.45.1713185663909; 
 Mon, 15 Apr 2024 05:54:23 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b004181ed7c033sm9730638wmq.24.2024.04.15.05.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:54:23 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 10/18] backlight: lms501kf03: Constify lcd_ops
Message-ID: <20240415125421.GJ222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-10-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-10-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:08PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
