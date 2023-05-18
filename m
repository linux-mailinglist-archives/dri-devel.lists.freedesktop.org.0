Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2D708071
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 13:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9846010E081;
	Thu, 18 May 2023 11:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A703C10E081
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 11:52:06 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-561bd0d31c1so16416627b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 04:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684410725; x=1687002725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvfUXuQLdcRRFK6mLXbSp6TuokWZaIj2pmBfTn+gwLw=;
 b=NxDa+2Q4bWlEhVfVP+HUsVkISRhHFxaytK65rO1w+EzNppVqwLhxiPJ+hELw0myAX/
 dxDAZ5Gkox6VQmWtTDoJnI/DxxkYdL+aIvnfx9fv4iL8Fhd0utymtgXI63QTgzB02dCa
 gZ0GskpxYgJXJwBkfBV1ogWjD5NubeCuPQz8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684410725; x=1687002725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvfUXuQLdcRRFK6mLXbSp6TuokWZaIj2pmBfTn+gwLw=;
 b=Hd3OuIW9MkHEDFuBQ83U/IFJFy1azih0+Bqejz0IOraB0v4BmhOYH9oNCOIKEfNHdf
 G6NCUsNFNTeuSi/YifgwTQoBVzaxqR11HCFQY2Apk2tiyrFNiCY/nzhLmE/Zz6QurMQt
 x12LxC97Vo2EwChQZc73p+z2jH+NxNxADl0zqsOcxTosCrfCueKusKww/xhwzIRE5b4y
 Yfpuv0cQuPpT8QOyzxsZK5CTyYreqGjOsZW+m1yrrDq9dxD19uMKMdwJu3G4Iu8nsMIf
 1nWKAdAeCSc9aPGjc5WuP7pJaleCKm41EUS6HZowh7brVQ3BSQ4uFl0X7CCIUS31yab6
 fBmw==
X-Gm-Message-State: AC+VfDwR9+6Agbgdp5xS7Zc1FztcXoWioH+IICwnzuQ3fe8saWMcK8RT
 10JOPYD8+uR/zuNDkYaf04+4XwwhbymzqvjeZm3SJw==
X-Google-Smtp-Source: ACHHUZ77dNBKDAmEmByXJaKmA+9QpHEGry6uMH+jKnRdFQghZZSSaOQYgAqJHFxN0xVC7BXjZo4ohG+1pfqASYSuW1Q=
X-Received: by 2002:a81:a211:0:b0:556:ea38:eb07 with SMTP id
 w17-20020a81a211000000b00556ea38eb07mr1055451ywg.50.1684410724873; Thu, 18
 May 2023 04:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-2-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-2-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 18 May 2023 17:21:52 +0530
Message-ID: <CAMty3ZCoJP=Mk20_O_Y0Vpuuayz3k3J_dA2zg1Ls0YmU6eL0Fw@mail.gmail.com>
Subject: Re: [PATCH V6 1/6] drm: bridge: samsung-dsim: fix blanking packet
 size calculation
To: Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> From: Lucas Stach <l.stach@pengutronix.de>
>
> Scale the blanking packet sizes to match the ratio between HS clock
> and DPI interface clock. The controller seems to do internal scaling
> to the number of active lanes, so we don't take those into account.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
