Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F79B522C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 19:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000AD10E0B9;
	Tue, 29 Oct 2024 18:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="OtcjIpzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2656 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2024 18:53:45 UTC
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DD710E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=iT1KZstrKnsyqYo4dg3x0+KOMpIG9DHct4TKVU+Hs3Y=; b=OtcjIpzEOO5bIe4gAfLT5afCNt
 8vvMDAm8BhZplOlA4E5itIHKdRjAhF95wte24BJT6A97atK3LXtUcgH+h7egt+YrexjOfKhEh+PbL
 wDFJLiAo7RJKAIKUm32mfdkLNpKQmqee2ckHjJNcrQ946OZqMvgiOcLkGYY7zIAfu3yygi9+lRGt2
 YEpMFibNW6QuQzMXWMwK0bejU1V/EG0rKbXmhruHQHDEu8lRDafJLVAxq+rbXE8jZMzcN9X88ti9J
 RuhSK2FwjrnhDctFLQb9JaCFeEara1/zXkwqUsUT4O+rHwFm1UuFCK6B/89W6Lg41/M6kvsADya+H
 KuqqEptw==;
Date: Tue, 29 Oct 2024 19:09:19 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, marex@denx.de, a.fatoum@pengutronix.de,
 kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
Message-ID: <20241029190919.4c615621@akair>
In-Reply-To: <20241029120236.299040-2-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
 <20241029120236.299040-2-festevam@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Am Tue, 29 Oct 2024 09:02:35 -0300
schrieb Fabio Estevam <festevam@gmail.com>:

> From: Fabio Estevam <festevam@denx.de>
> 
> imx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> 
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
> 
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.
> 
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
> "fsl,imx28-lcdif";
> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll. 
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Newly introduced.
> 
>  .../devicetree/bindings/display/fsl,lcdif.yaml     | 14
> +++++++++++++- 1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> 836955de3bc9..08ce19638fbd 100644 ---
> a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml +++
> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml @@ -32,11
> +32,23 @@ properties:
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
> +      - items:
> +          - const: fsl,imx6sl-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
> +      - items:
> +          - const: fsl,imx6sll-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sl-lcdif
> +              - fsl,imx6sll-lcdif
> +          - const: fsl,imx28-lcdif

What do we need this for? Either imx6sx-lcdif is a useful fallback
compatible or not.  But not sometimes. Looking at the kernel driver: It
is. So IMHO only the three element variants should be allowed.

Regards,
Andreas
