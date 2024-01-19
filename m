Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A079832F87
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 20:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F9510E9FD;
	Fri, 19 Jan 2024 19:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5C110E1CC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 19:51:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AC5E2CE2752;
 Fri, 19 Jan 2024 19:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB04C433F1;
 Fri, 19 Jan 2024 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705693913;
 bh=V/giPsLnDjrj1zV7DERx2IXZKAyhH88rKKkf5QFcqUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MM2M331sZCqze2pBHsSkXYXRwFFz+7F13kgvKu8biiY3cZoImBNdsLDtQVpOFlK1p
 +Szq70+Q4GmioBk5W1BC34gr/z4wheZ6OCJ2Bmcj7MBaoso/yTbf630iIPDj9643gS
 ilHqJeQdFLF8lvBudaYjWpyIlMBkHG5I9fWzg9lhd5daZHla2oHwkfXGEzGA84uEjt
 sDlfFUkV34VFBQSdTXkP/t02fnQ6BMWMP4ydsU5yVjCMUqzV0ZGGDRPXJb669zxPX0
 sPOrTcK1LxKGpVfO2SmPe/pfILd08TaHie75ZHIS7U9FqYBXwgtefpOzyXsYVpEmFu
 TFrFSybHeB9PA==
Date: Fri, 19 Jan 2024 13:51:51 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/3] Convert Microchip's HLCDC Text based DT bindings
 to JSON schema
Message-ID: <20240119195151.GB938671-robh@kernel.org>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118193040.GA223383@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118193040.GA223383@ravnborg.org>
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
Cc: linux4microchip@microchip.com, linux-pwm@vger.kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, lee@kernel.org,
 Dharma Balasubiramani <dharma.b@microchip.com>, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 08:30:40PM +0100, Sam Ravnborg wrote:
> Hi Dharma et al.
> 
> On Thu, Jan 18, 2024 at 02:56:09PM +0530, Dharma Balasubiramani wrote:
> > Converted the text bindings to YAML and validated them individually using following commands
> > 
> > $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> > $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/
> > 
> > changelogs are available in respective patches.
> > 
> > Dharma Balasubiramani (3):
> >   dt-bindings: display: convert Atmel's HLCDC to DT schema
> >   dt-bindings: atmel,hlcdc: convert pwm bindings to json-schema
> >   dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
> 
> I know this is a bit late to ask - sorry in advance.
> 
> The binding describes the single IP block as a multi functional device,
> but it is a single IP block that includes the display controller and a
> simple pwm that can be used for contrast or backlight.
> 
> If we ignore the fact that the current drivers for hlcdc uses an mfd
> abstraction, is this then the optimal way to describe the HW?
> 
> 
> In one of my stale git tree I converted atmel lcdc to DT, and here
> I used:
> 
> +  "#pwm-cells":
> +    description:
> +      This PWM chip use the default 3 cells bindings
> +      defined in ../../pwm/pwm.yaml.
> +    const: 3
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    maxItems: 2
> +    items:
> +      - const: lcdc_clk
> +      - const: hclk
> 
> This proved to be a simple way to describe the HW.
> 
> To make the DT binding backward compatible you likely need to add a few
> compatible that otherwise would have been left out - but that should do
> the trick.
> 
> The current atmel hlcdc driver that is split in three is IMO an
> over-engineering, and the driver could benefit merging it all in one.
> And the binding should not prevent this.

I agree on all this, but a conversion is not really the time to redesign 
things. Trust me, I've wanted to on lots of conversions. It should be 
possible to simplify the driver side while keeping the DT as-is. Just 
make the display driver bind to the MFD node instead. After that, then 
one could look at flattening everything to 1 node.

Rob
