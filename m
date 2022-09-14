Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC65B8C3F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 17:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E231510E03F;
	Wed, 14 Sep 2022 15:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4739A10E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 15:50:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E27EFB811C1;
 Wed, 14 Sep 2022 15:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E45C433C1;
 Wed, 14 Sep 2022 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663170635;
 bh=S28EkrNLwS69diRhkX+rhYqUGi8w409B1c6Xk4uXdA4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=C1M6MQGrR9MJB1trIJC+waXGVZ4KZTTS+JTEOpiEsWCK7+PWOVMNeHPvSp5Zl4s8J
 hHMEIylwNYQu3JpzME1k3+hI7h8ay3mg8Fyq4l/C+ahofwmf0Rn3jdPCSzhKqsnDrx
 kysQUItpAD3rBHGQLray2SjAX1d2+eCxXKLh3tDQHNB9cyN3oCMEsDVHIY4mDkxNH6
 anaFqGtVu5W6ZNvtaBld6rImlbyjnnJ9hJP5j/LOhvlg2dlMMqaT5gS/zFChRTCGrh
 1ShOEbmH3O+HVdVPwSmLqlIKfrr+nNcBJclbNQrjDOz8WoD/FudG4ZvVFX0Tv2SM7J
 CrNyxNvTJ96EQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
From: Stephen Boyd <sboyd@kernel.org>
To: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Date: Wed, 14 Sep 2022 08:50:33 -0700
User-Agent: alot/0.10
Message-Id: <20220914155035.88E45C433C1@smtp.kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-08-15 08:31:24)
> @@ -254,6 +255,33 @@ static int raspberrypi_fw_dumb_determine_rate(struct=
 clk_hw *hw,
>         return 0;
>  }
> =20
> +unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
> +{
> +       const struct raspberrypi_clk_data *data;
> +       struct raspberrypi_clk *rpi;
> +       struct clk_hw *hw;
> +       u32 max_rate;
> +       int ret;
> +
> +       if (!clk)
> +               return 0;
> +
> +       hw =3D  __clk_get_hw(clk);

Ideally we don't add more users of this API. I should document that :/

It begs the question though, why do we need this API to take a 'struct
clk'?  Can it simply hardcode the data->id value for the clk you care
about and call rpi_firmware_property() directly (or some wrapper of it)?

Furthermore, I wonder if even that part needs to be implemented.  Why
not make a direct call to rpi_firmware_property() and get the max rate?
All of that can live in the drm driver. Making it a generic API that
takes a 'struct clk' means that it looks like any clk can be passed,
when that isn't true. It would be better to restrict it to the one use
case so that the scope of the problem doesn't grow. I understand that it
duplicates a few lines of code, but that looks like a fair tradeoff vs.
exposing an API that can be used for other clks in the future.

> +       if (!hw)
> +               return 0;
> +
> +       data =3D clk_hw_to_data(hw);
> +       rpi =3D data->rpi;
> +       ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +                                        RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
> +                                        &max_rate);
