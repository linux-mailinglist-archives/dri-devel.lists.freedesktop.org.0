Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582E7C6D5D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 13:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C751210E03C;
	Thu, 12 Oct 2023 11:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C1610E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 11:52:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2B4B7B8233B;
 Thu, 12 Oct 2023 11:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F49C43391;
 Thu, 12 Oct 2023 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697111538;
 bh=zxYzsLXBKi9s0aN++GqRyQ6VlVpbSThbWxRR+wmwfGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vq+KzigLw0Dmc7f85IW9YQoiIq6p75obwZf/IvldPobgKpjN5dqHAlY8OrhlF9Xkr
 Ukxuycx6olO8h4TK+xKnRQJNytu+hi0HMlGtOQcWCQe3/ZfKh6hE18UDmcNJqnf2x6
 xac4gqXgXkIDSW3WnpgRJMaB5qoXnt7bgo4/JASK/S6ZHkv6+g5gY0UUSMhdbqNlRd
 HSupGDrQKYENlRddgSQJmRDkxWXKwqTaGK0p4h0pTZORbyM5yIwOzPtTiEQlCv6cxs
 IUr8US4nW6bVorCK3/GVTuVepCeskzbAtGxydaURAylrmB55GRtXAf0hOz2k8yuGUZ
 9OR1lenPnHEjQ==
Received: (nullmailer pid 285059 invoked by uid 1000);
 Thu, 12 Oct 2023 11:52:16 -0000
Date: Thu, 12 Oct 2023 06:52:16 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: display: Split common Solomon
 properties in their own schema
Message-ID: <20231012115216.GA266951-robh@kernel.org>
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-6-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012065822.1007930-6-javierm@redhat.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 08:58:14AM +0200, Javier Martinez Canillas wrote:
> There are DT properties that can be shared across different Solomon OLED
> Display Controller families. Split them into a separate common schema to
> avoid these properties to be duplicated in different DT bindings schemas.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  .../bindings/display/solomon,ssd-common.yaml  | 42 +++++++++++++++++++
>  .../bindings/display/solomon,ssd1307fb.yaml   | 28 +------------
>  MAINTAINERS                                   |  1 +
>  3 files changed, 44 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml b/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
> new file mode 100644
> index 000000000000..677fd2b90960
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common properties for Solomon OLED Display Controllers
> +
> +maintainers:
> +  - Javier Martinez Canillas <javierm@redhat.com>
> +
> +properties:
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
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +additionalProperties: true
> \ No newline at end of file

With this fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
