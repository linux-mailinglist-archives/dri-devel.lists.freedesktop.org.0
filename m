Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578CBA03B82
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA60110E3C4;
	Tue,  7 Jan 2025 09:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="O72XPt3n";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Z5smUcNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C7010E3C4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736243419; x=1767779419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QzP2L75tY0s4FayK+dDFBr6ag0IirIKPS04LmEz6Ta8=;
 b=O72XPt3na9wG5s46LvySomFgTUYJKjjCGRe9txhDDDNHEvdgViT2e1g/
 /+13NoibrFGq9GKJW/PMhVXSheEf7RM4GQRnAc8wNaExWS6o8YboudCEa
 l2YMixCXjxFLJWJSPQDPe4xWV9x8H5CqouKI/npInebjtkNmbpFHHevvy
 kcCJj3VTL0Baxy0T9wXPKBBsQecQ0KJRasYaWhdHH9LLNHgCV76uYy1OM
 AAoEVqIB2zYCmr0pi0giOy3+fjzUJOmW/OQa9/n7l5q/qhZmqsnB+WY4H
 TM0SScyCaBtLf2HGah35JKYNXTK8o6IuBivbX2F324FkwnJAeEvec48M2 w==;
X-CSE-ConnectionGUID: Kew2XeO4QOOMJUerIB5xZA==
X-CSE-MsgGUID: G9WjVQx0RXG03kFOLwwcrA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; d="scan'208";a="40889027"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:17 +0100
X-CheckPoint: {677CF8D9-8-DDBC2A76-F469E51C}
X-MAIL-CPID: 0A25C61B0BAAEF839FD7A44E474FE128_0
X-Control-Analysis: str=0001.0A682F26.677CF8D9.007F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50C2F163CCE; Tue,  7 Jan 2025 10:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736243412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzP2L75tY0s4FayK+dDFBr6ag0IirIKPS04LmEz6Ta8=;
 b=Z5smUcNpRQkb2oKHkcLoUQXNeYAtAEovHnKQNFM1HxqwL5Uw2iJvL+tBjPS2tQZ/tJpCn6
 DyIYhmaOKTo33GTAj8GacS1ig3QgACh8TcMf1uVQRWueIn3M5gCEiEUCUsTOIpGyqDqLXA
 dT1p+vO3Oz25GBoG8d/Yjb4JfEzG0tUaT71FoUYliRRdaUVkGPD3OAv+l1c4ui2LUMZaGL
 VqC1S1abM3VqDQGoDAXCFCNZ58yy9DVvtJ6QPmemR/CWJ2MeDm+YEsJ4NN5IP2094gc18b
 xb0U4tp/TDIGqCahr0gRDQ5aPKk60MdooTdkiZp6K05q0Ju2SZ/kmgbx5/ml4A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: samsung,
 mipi-dsim: Add imx7d specific compatible
Date: Tue,  7 Jan 2025 10:49:42 +0100
Message-Id: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

This add a imx7(d) specific compatible which is compatible to imx8mm.
This silences the dtbs_check warning:
arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneOf' conditional failed, one must be fixed:
 ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 4ed7a799ba26b..e43fec5609417 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -27,7 +27,9 @@ properties:
           - fsl,imx8mm-mipi-dsim
           - fsl,imx8mp-mipi-dsim
       - items:
-          - const: fsl,imx8mn-mipi-dsim
+          - enum:
+              - fsl,imx7d-mipi-dsim
+              - fsl,imx8mn-mipi-dsim
           - const: fsl,imx8mm-mipi-dsim
 
   reg:
-- 
2.34.1

