Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E786FA2D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 07:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B051510FD3D;
	Mon,  4 Mar 2024 06:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jxriXqJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E7710FD3F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 06:36:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F246ACE0D92;
 Mon,  4 Mar 2024 06:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2FBC433F1;
 Mon,  4 Mar 2024 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709534208;
 bh=Lxit3tCPkuMKtuJFSH+dJUeNvHqA7L8OYQppQC6rPNY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=jxriXqJbBviYoORKOQcXJDUwyJsaZY0CPgW6Oe8TttKAmSvfyE4BQuW25aT/hQlip
 EycujU65LIlA+jvjSZY2ZFc2IA3AZ63veV7cNkFfzAqebsXNMM25mAA0ujeDDnVhRP
 rOSIkqhGdiHG3XvfyG3VMIIydikTnGfAupeIzWZNZ0caug7zTU1TtQDmT7h43pJ+Sq
 jwPiEzucalG88tLoMPULbKYiPL2+V5tsY1ZRNY/L938nJVJhd0CmKXUpSQxmfGvjeC
 fakbtsn35UIpcUtJ1iirJGZURsxYp2sUxGrHFDwHX6m2aQ2+CT1qDAyeMtb5QNaoue
 Lepbx/p3VrHzw==
Date: Mon, 04 Mar 2024 00:36:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com>
References: <20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com>
Message-Id: <170953420588.3592333.10799403141422424018.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: atmel,lcdc: convert to dtschema
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


On Mon, 04 Mar 2024 11:06:39 +0530, Dharma Balasubiramani wrote:
> Convert the atmel,lcdc bindings to DT schema.
> Changes during conversion: add missing clocks and clock-names properties.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> This patch converts the existing lcdc display text binding to JSON schema.
> The binding is split into two namely
> lcdc.yaml
> - Holds the frame buffer properties
> lcdc-display.yaml
> - Holds the display panel properties which is a phandle to the display
> property in lcdc fb node.
> 
> These bindings are tested against the existing at91 dts files using
> dtbs_check.
> ---
> Changes in v2:
> - Run checkpatch and remove whitespace errors.
> - Add the standard interrupt flags.
> - Split the binding into two, namely lcdc.yaml and lcdc-display.yaml.
> - Link to v1: https://lore.kernel.org/r/20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com
> ---
>  .../bindings/display/atmel,lcdc-display.yaml       | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/display/atmel,lcdc.txt     | 87 -------------------
>  .../devicetree/bindings/display/atmel,lcdc.yaml    | 70 ++++++++++++++++
>  3 files changed, 168 insertions(+), 87 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: display0: 'atmel,dmacon' is a required property
	from schema $id: http://devicetree.org/schemas/display/atmel,lcdc-display.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: display0: 'atmel,lcdcon2' is a required property
	from schema $id: http://devicetree.org/schemas/display/atmel,lcdc-display.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: display0: 'atmel,guard-time' is a required property
	from schema $id: http://devicetree.org/schemas/display/atmel,lcdc-display.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: display0: 'fsl,pcr', 'model' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/atmel,lcdc-display.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240304-lcdc-fb-v2-1-a14b463c157a@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

