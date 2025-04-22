Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1344A96B17
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 14:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE310E590;
	Tue, 22 Apr 2025 12:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c0MKeG0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D53010E590
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 12:55:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C76444DB6;
 Tue, 22 Apr 2025 12:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF79C4CEE9;
 Tue, 22 Apr 2025 12:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745326525;
 bh=5J5vS+tSTeC2z4T6bEh4qSkSbF4o4ICwzhXYHWtnIoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0MKeG0i9UB1rJMZhVnH1wFUcNcgQXUdMCCFUNcuFJzt85/QZH+ittf0htZg4cFSF
 zp8erxnPGi2pOrvKMLF5aBDtOGxqWr6/7ZsWv7igYe4rFDTJvoDfxvk8ixAMs4Auk7
 aCWet/lbt2351cFk8n1dg5LUfOO9ez7Mu/jsVCvRCGl7CgukrhN5EXWfVQYP7PipCA
 N/y53TKsuY11paq2Lz5R8KweS+rdnG+vSqmNwqw550FL8dG0vYTeGRZxRdMxexyPeC
 FonJtKBeOh2yKCTOU/DhfQhIB0fA9IvUuewD0tzPo1Gmmu4sxPEh6XeAxZlshg5RUu
 03dak/v+xBmeA==
Date: Tue, 22 Apr 2025 07:55:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: imx: convert ldb.txt to
 yaml format
Message-ID: <174532652176.960722.2664945532929851168.robh@kernel.org>
References: <20250417145742.3568572-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417145742.3568572-1-Frank.Li@nxp.com>
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


On Thu, 17 Apr 2025 10:57:41 -0400, Frank Li wrote:
> Convert ldb.txt to yaml format.
> 
> Additional changes
> - fix clock-names order to match existed dts file.
> - remove lvds-panel and iomuxc-gpr node in examples.
> - fsl,imx6q-ldb fail back to fsl,imx53-ldb.
> - add fsl,panel property to match existed dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> - use oneof in clock-names. imx6dl use imx6q-ldb comaptible string, but
> the clock-names is the same as imx53. To reduce dts impact, use oneof to
> allow two group clock-names list
> - fix typo pannel
> ---
>  .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 194 ++++++++++++++++++
>  .../devicetree/bindings/display/imx/ldb.txt   | 146 -------------
>  2 files changed, 194 insertions(+), 146 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt
> 

Applied, thanks!

