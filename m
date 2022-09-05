Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5715AD607
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37EA10E40F;
	Mon,  5 Sep 2022 15:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2103610E40F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:17:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8849E61326;
 Mon,  5 Sep 2022 15:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA5AC433D6;
 Mon,  5 Sep 2022 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662391076;
 bh=+1JZVikczD6oMQstBHmmQ6IUy+FzfgWRuCZFth/S+Dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yqo0TLPTEI46myyss+uHeRcfU8jMlNl/nWSkBHabM+hWfliZo8rDKXYcZM1EFORBW
 oD0h5vJio83AnqAsoUp8raLAV7S1JNFk86UJc2drDU5jNz6D4QksFJPm/f7l6Zaj9w
 /fBzFW3F8yu+Kqb4oHJvOaXpu2JJ1o6Z0/d9wjL8x2M2Cp2zaRDjoxZmc2hvauq7jy
 gBsa3txjSmNd6aJDnmHFR2ofz3hBDJFO8M10YVzOVofQrrusETDUOUv2Cza8FqJrdh
 Si5ltT72oPZY9MFr1MpNovq3zDX+hjQjm0iNUCfzwMnBeqLFXZy5HfPaWRiHQqZ+SN
 BGexnGAQEKK7Q==
Date: Mon, 5 Sep 2022 16:17:38 +0100
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v9 10/10] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <YxYR2/knZTsy9Uh8@google.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-11-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830034042.9354-11-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alice_chen@richtek.com, linux-iio@vger.kernel.org, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, pavel@ucw.cz, linux-leds@vger.kernel.org,
 daniel.thompson@linaro.org, deller@gmx.de, linux-pm@vger.kernel.org,
 andy.shevchenko@gmail.com, devicetree@vger.kernel.org,
 mazziesaccount@gmail.com, szunichen@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, sre@kernel.org, robh+dt@kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Aug 2022, ChiaEn Wu wrote:

> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
> 
> Add support for the MediaTek MT6370 backlight driver.
> It controls 4 channels of 8 series WLEDs in
> 2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
> current steps (30 mA) in exponential or linear mapping curves.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v9
> - Revise the format of the comments.
> ---
>  drivers/video/backlight/Kconfig            |  13 ++
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/mt6370-backlight.c | 351 +++++++++++++++++++++++++++++
>  3 files changed, 365 insertions(+)
>  create mode 100644 drivers/video/backlight/mt6370-backlight.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
