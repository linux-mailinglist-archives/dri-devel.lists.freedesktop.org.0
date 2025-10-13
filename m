Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0310CBD643F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 22:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349EB10E516;
	Mon, 13 Oct 2025 20:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XUOOGFhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F246410E516
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:52:25 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-33082aed31dso4807982a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760388745; x=1760993545; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRJbkM4wepO56t2Jx9Mj/0XBiWzZWPdz2VVmdtIvIJA=;
 b=XUOOGFhu2+ZydzfQn550ccW8FxfOLDU5Kdg9tlX5BHU1OB961O8eRXoyJbgA+oAF5a
 v+GI6qT+Qyzh9+TYlg7lPHbqP69TtzRG69qK0OA2wmOno7Kw0pCEqa2PIKM829qFpfcI
 kRoZntE59uV6tc4tg/MOGYFkzEYbuySQ4yR6Zs/tduAbkAXg4D3Va9m7quRqhSnMe5wi
 75kEcrVXAaFt4+aIwFggKzn5yJzQ+z3wDbVjA9u20OmCXpAPmH/E3NqbozhF87dLBCUE
 CVDbzz5Z7ENq5UFw6djKz7UwYL6ACn7iMhinDe1eHIRPZm/td0fo9igcAoKtfdWKVqzH
 PMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760388745; x=1760993545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRJbkM4wepO56t2Jx9Mj/0XBiWzZWPdz2VVmdtIvIJA=;
 b=PlZMl5MdtRYu8PsFkiTPIpAr1zuFLoTflxmuCSE3/MG77zQ2wNN9NfaBcZ8iYdF9kl
 +H/ZHdqTIwqHQ99rbz1LVq6q9/cCJJ+l7uoNh/ALcaMYCiTB2IR1KKk6hJDt26gNbjzi
 fNHIJWOojTqIAFM6cpC7gfnVfnkoUKJfa4adj9Vp5M1iAVLF1zeD0g3C2yje9ErS1und
 RfmWvRCNbV7NYtCMxhXUYz05sxb8T6/kr4FfRt2/cpCLEj4qGWm1If9llqrGjzlBv1HO
 vR88xtfsmiQMk0yoeS47DTMLw1RcuLR17OLnNA3J9xhnrQ4z7zchSSuvPHvxCZOJLVq5
 8OuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDFN8C0sCQVBI35NdWOhUe3XWRHTrvYkb+JK57BeDIIgTCnF78ixS2heqgZReciRGa6YQfwPdRH1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbWJnAdxNqxsI66vO+E8sABlrajrXWKs/fqmYISq8m0V5nEmZ3
 i9L6RUl1dZf2Ztyjk5hBwpTWifRUf4vTFoxQ+SgXdXWmpu49g+gxe/gC
X-Gm-Gg: ASbGnctZxmGsetPaWjYsAMXg0pevuWxUj5LBnwM30RlfVjxbVkuc68pC5Gp13qafjX7
 mYyD02FWDag+gFDuxvDH6EU1fuR7BwFnmHmkdlvfJCkdgWwcfAY1z0C42MJgWZ8EadJ6c+kQ8dX
 7EEx7CGwB7czetv4FbwRteHOeJ0j0q1DYweQA4KsZqFxGW2MqgWqn+7Z0YX93wU9trjokLdMUMS
 AgTHtdsVVZgzXZfzM7HLco0bK06r+w76GZaOa5lBOQy/4auTI4JVoXCth7HAlRTDzFGo+RrtEmd
 STI+LLGdhy0fjrJr6B+OGxVTrHnJJWbgmOp6eXozay0oV/N6DELwrhxOo8za9UK1ZpBI4kgdJLd
 Xh4KDzEyuAnmTpus++E4b2AErxoqnglXRpdxTx2U/AS8d0G45WCsj7qI=
X-Google-Smtp-Source: AGHT+IEbc0HqY8CLIHs2k8aq/yJ+qGsFrnOrDj32getTUXol/oijADm5b/7xs/AL3ljfJbDbndG3kw==
X-Received: by 2002:a17:90b:4b04:b0:32e:8c14:5d09 with SMTP id
 98e67ed59e1d1-33b51105bbfmr33280515a91.7.1760388745433; 
 Mon, 13 Oct 2025 13:52:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:52:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif
 compatible
Date: Mon, 13 Oct 2025 17:51:55 -0300
Message-Id: <20251013205155.1187947-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013205155.1187947-1-festevam@gmail.com>
References: <20251013205155.1187947-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 7381fb7f8912..074c48b04519 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -776,7 +776,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..745f3640e114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1

