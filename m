Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229BB9BB93E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 16:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9669410E464;
	Mon,  4 Nov 2024 15:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ic9jv7Dm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A3110E464
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 15:43:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DD987A43081;
 Mon,  4 Nov 2024 15:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80928C4CECE;
 Mon,  4 Nov 2024 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730735025;
 bh=7Q2U9oss2EM4iM3PMEeL4JsDBihXmtIIsux04111JkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ic9jv7DmA9iiQEJ/OSVpnEdHDhlMOqfFU2nHWthRPkYDGX5yCQYB3iTbneJjq+Og5
 rHEvIm0lzo/2tcuA0TQtO0arblv7UMeSIfL/FjM/X/ruKQ/9YgWV1p9lgTY2zn2bld
 kbt+awZpSfPJ4NXKc6opPsuArC4xfQEi6uAPYLJPFb9eN5nZXtl+voH1rvYfqQ2MSs
 0vQKjppQknbrmDpG2X/z+MgOfuyCF0ou63aFt9KKk9xkkhHjaduPvXuf6vh51SvrpH
 vEMTKUFxn1smD8qPS+KkffHKfoGta2/aBhSgz7UnV3BnGF7hH+v1Q+TCkvmcN9iYQC
 kdT1vOO0izLdg==
Date: Mon, 4 Nov 2024 09:43:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, linux-arm-kernel@lists.infradead.org,
 marex@denx.de, shawnguo@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 a.fatoum@pengutronix.de, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, andreas@kemnade.info
Subject: Re: [PATCH v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
Message-ID: <173073502322.211813.8204501104230548664.robh@kernel.org>
References: <20241101135406.47836-1-festevam@gmail.com>
 <20241101135406.47836-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101135406.47836-2-festevam@gmail.com>
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


On Fri, 01 Nov 2024 10:54:05 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
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
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - None.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

