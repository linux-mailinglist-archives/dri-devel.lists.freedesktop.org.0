Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38E56899A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12680113AAB;
	Wed,  6 Jul 2022 13:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408CD113A33
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:34:53 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10c0d96953fso7799271fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxuLumhCwznNZcI7GXJpC/L4mRfNizaGC/XbqUh/5Cc=;
 b=AqUniGBmIEOL+tLXImG0kxgTzaHAcBgZIbmsAqJmlfD/1+CCSQQQ7fOFUyBwJOfH7O
 /hN00Tl01eYwBZF4e1pZ7Q+tApZ1qiK+RK4Ru+2hq6o5tgGK+lln1NNTwENYUlgkbC1K
 rdyupyZE5Mha3b82G4Jfrh5ZlgVF3GO/3HD/KbdcP1tlke7SyICrOMH352c5DVDr/9TM
 iWT9Lb1fVshNkcAR/pZ6tt8AWpNk6ZjjzOa1bTA8P9eO4ZXpukNXRCv8JEiLkEnj1Y+L
 wpC0B4Pl75FW+tjLmBQQe70vIu14NhnmepHDNd0ceQkG9FzoIf/vCb39baBBba1LEGT4
 L63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxuLumhCwznNZcI7GXJpC/L4mRfNizaGC/XbqUh/5Cc=;
 b=UO5J2Skm4+1bwiQykGIERC+AeIIT71uNsuJhAJytmXh+08NNhQXko/g4EfugKctX3Y
 zgDaVv/G9M231zsbc4U4ywOcT7Zxw92fQMO/w7OwVZNALW6HAjaYTZLHFhucPZNE5HcS
 l35g/sBAs69kgcBnh8BFLwDVZJZNUo+x8SD06sCSR9eAb5Ula9hhDn1FeycCQ59PXkUo
 JJurlhr9gyHYJCnWbXnSLaapuRjuYocFS0takbELPSKoJcmQKXqT8WJKJisKqLKmGzKt
 K7rCXpAOMPUnAtQa+gZc7m2c8kLHdQhQMEoI2X6epBhNk3xWKj6/5q7EGWv27UtLg+ao
 rg7w==
X-Gm-Message-State: AJIora+Zx1GTBCL3t6cY0hHao7e1g2m8zwQRcmulVbrnBzGNqbVihYAi
 Mrm+1y3bQeDAZZ40fAvHgNu8ZI+ZpxG9irF+2ef/cg==
X-Google-Smtp-Source: AGRyM1vHdnhl8q3DuApTpUlCTFeXaNxX7B0xLQkj5wv6yAKOaA3nem0reFJL6DuiqrgxWKvNo1Oja+FRy4Kflu4g/3Y=
X-Received: by 2002:a05:6870:65a4:b0:10b:f0a4:17d2 with SMTP id
 fp36-20020a05687065a400b0010bf0a417d2mr11636243oab.241.1657114492343; Wed, 06
 Jul 2022 06:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220701065634.4027537-1-victor.liu@nxp.com>
 <20220701065634.4027537-2-victor.liu@nxp.com>
 <201c6bb7-ad86-5b89-e9a1-20a5740b8869@denx.de>
In-Reply-To: <201c6bb7-ad86-5b89-e9a1-20a5740b8869@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Jul 2022 15:34:40 +0200
Message-ID: <CAG3jFyun7NkLCy+bM0XHNRPrk6_kt7z8aB4Ud+4HdeNhffQydA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: fsl-ldb: Fix mode clock rate validation
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: jernej.skrabec@gmail.com, narmstrong@baylibre.com,
 Liu Ying <victor.liu@nxp.com>, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Jul 2022 at 13:00, Marek Vasut <marex@denx.de> wrote:
>
> On 7/1/22 08:56, Liu Ying wrote:
> > With LVDS dual link, up to 160MHz mode clock rate is supported.
> > With LVDS single link, up to 80MHz mode clock rate is supported.
> > Fix mode clock rate validation by swapping the maximum mode clock
> > rates of the two link modes.
> >
> > Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied 1-2/3 to drm-misc-next. Picked Mareks patch for 3/3 since it
was submitted first and is identical.
