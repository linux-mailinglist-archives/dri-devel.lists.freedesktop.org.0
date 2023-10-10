Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355DE7C0213
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7D10E3AF;
	Tue, 10 Oct 2023 16:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B962310E3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 16:58:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3594DB81C0C;
 Tue, 10 Oct 2023 16:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B384C433C7;
 Tue, 10 Oct 2023 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696957120;
 bh=/LHw5iS5T1DOAAuPqfF8kJ9Zsl2upHRUk96aB7oEHhc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kT5NIxTENWFPyPrWrV3LnYsZq1zwrIvNNeJhuIVgpBtx06ko9DB3bvFg284xIzkL3
 RZDERaqVbpLfy4m7/t7PS3B1LciYnMSXebiPGdQwdLvGOnViIKkwMLyIxdh7ovbnIU
 X3aOEyvf6ahrUPhts52SdlKhQxRrB80X/PNiDQW21tSVxng+TQRmCnb7rKlp1/H7oM
 p9ebJ9cXRylXNqA8+F47ZiPxAifH0j4PjnyVqkAQROnbxlQLcv4s8raBmcwGBRsn28
 7Lgq8dewc292M/XcjWQE4YXR3I39yMyQ/PZZDqyGu2Gkt5C24/EYb5iRZr+Z/gX5r9
 vcWIzXmCVdhaQ==
Received: (nullmailer pid 1045754 invoked by uid 1000);
 Tue, 10 Oct 2023 16:58:38 -0000
Date: Tue, 10 Oct 2023 11:58:38 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 8/8] dt-bindings: display: Add SSD132x OLED controllers
Message-ID: <20231010165838.GA1039918-robh@kernel.org>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-9-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009183522.543918-9-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 08:34:22PM +0200, Javier Martinez Canillas wrote:
> Add a Device Tree binding schema for the OLED panels based on the Solomon
> SSD132x family of controllers.

Looks like the same binding as solomon,ssd1307fb.yaml. Why a different 
binding? Why does that binding need a slew of custom properties and here 
you don't?

> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../bindings/display/solomon,ssd132x.yaml     | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> new file mode 100644
> index 000000000000..b64904703a3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd132x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Solomon SSD132x OLED Controllers
> +
> +maintainers:
> +  - Javier Martinez Canillas <javierm@redhat.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - solomon,ssd1322
> +          - solomon,ssd1325
> +          - solomon,ssd1327
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  # Only required for SPI
> +  dc-gpios:
> +    description:
> +      GPIO connected to the controller's D/C# (Data/Command) pin,
> +      that is needed for 4-wire SPI to tell the controller if the
> +      data sent is for a command register or the display data RAM
> +    maxItems: 1
> +
> +  solomon,height:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Height in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.
> +
> +  solomon,width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Width in pixel of the screen driven by the controller.
> +      The default value is controller-dependent.

Don't define the same properties twice. Either share the binding or 
split out the common properties into their own schema file.

Rob
