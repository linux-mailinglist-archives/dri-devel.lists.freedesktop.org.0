Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773AB183E59
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 02:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990286EB63;
	Fri, 13 Mar 2020 01:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5586EB63
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 01:09:38 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 641AA20637;
 Fri, 13 Mar 2020 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584061778;
 bh=UYPz1qlE+Zrh/CUYv1EYC2BXtJL9mTAshrMUYOFb/20=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cchNDvcp5xxo+4kktYIBl1aqjS0gJMnOJdEn09uE/82+DBNyz/X+RrSZl8jq0lPZP
 r9l0+uvv43KujDYCuDIIy/Gj9Kal/SYN6PFHv2j+siPAqv4/S3bn01YeBUYwCBH5aL
 XtueSHO0lPPwNI7yQWREmyFbDeAqdarMEvLibcKE=
MIME-Version: 1.0
In-Reply-To: <5a02a46e899abfca7257a725678f1131490e6b11.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <5a02a46e899abfca7257a725678f1131490e6b11.1582533919.git-series.maxime@cerno.tech>
Subject: Re: [PATCH 17/89] clk: bcm: rpi: Pass the clocks data to the firmware
 function
From: Stephen Boyd <sboyd@kernel.org>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Thu, 12 Mar 2020 18:09:37 -0700
Message-ID: <158406177763.149997.8595594316904810473@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2020-02-24 01:06:19)
> The raspberry_clock_property only takes the clock ID as an argument, but
> now that we have a clock data structure it makes more sense to just pass
> that structure instead.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index e796dabbc641..3b2da62a72f5 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -67,11 +67,12 @@ struct raspberrypi_firmware_prop {
>         __le32 disable_turbo;
>  } __packed;
>  
> -static int raspberrypi_clock_property(struct rpi_firmware *firmware, u32 tag,
> -                                     u32 clk, u32 *val)
> +static int raspberrypi_clock_property(struct rpi_firmware *firmware,
> +                                     struct raspberrypi_clk_data *data,

Can data be const?

> +                                     u32 tag, u32 *val)
>  {
>         struct raspberrypi_firmware_prop msg = {
> -               .id = cpu_to_le32(clk),
> +               .id = cpu_to_le32(data->id),
>                 .val = cpu_to_le32(*val),
>                 .disable_turbo = cpu_to_le32(1),
>         };
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
