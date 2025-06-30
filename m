Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F56AED7C0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F43D10E3C4;
	Mon, 30 Jun 2025 08:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="sW7c/vjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8F310E1BF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:49:23 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 352F660010B0;
 Mon, 30 Jun 2025 09:49:22 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id lFGc8b20zh81; Mon, 30 Jun 2025 09:49:20 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 27DB960010BE;
 Mon, 30 Jun 2025 09:49:20 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1751273360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbuZIaiUZ/TPxBIJxa3P/rM8RLDDfzWbp1fZ/k7vOnc=;
 b=sW7c/vjLWZmlM5fFF4juvq3hX9uuNjhJ3OK3zHkh3R+vskfkfG4Fx3JIsWG/qZqGhBTn2e
 HAe28bJDH4aGLbII0ZNw13kIxa+VNE1/JmeReZYjG2CPbZNVAHE8mnBbbxLPJPHsp1UUiX
 p+y+r3ncwyMmWRAS40KFbO/8F36Wv7w=
Received: from [192.168.1.69] (unknown [92.56.11.86])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 03A3E360075;
 Mon, 30 Jun 2025 09:49:18 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 30 Jun 2025 09:48:43 +0100
Subject: [PATCH v3 2/3] arm64: tegra: Add Tegra210 NVJPG power-domain node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-diogo-nvjpg-v3-2-a553c7e91354@tecnico.ulisboa.pt>
References: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
In-Reply-To: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751273350; l=1004;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=chM11/GkMxF6/oP2OjFNYxiSrrm8U/oPxe3ozxChvpI=;
 b=226RwB/APcrq4aDrPYsjbhXbkO8lbDtFFcDIdHldWvhksUsnYUb5nzqm1bFxG9WKnR1Vhaflz
 qBmNqnsvA9oAN/bI2ApXL/b1i4Ov0xpx8gkxzkIIhHZ6Kkh5wOa2EXq
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
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

Add the NVJPG power-domain node in order to support the NVJPG
accelerator in Tegra210 platforms.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

---
v1->v2:
- Collect R-b from Mikko
- Explicitly mention Tegra210 in commit subject
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 402b0ede1472af625d9d9e811f5af306d436cc98..6f8cdf012f0f12a16716e9d479c46b330bbb7dda 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -947,6 +947,12 @@ pd_xusbhost: xusbc {
 				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
 				#power-domain-cells = <0>;
 			};
+
+			pd_nvjpg: nvjpg {
+				clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
+				resets = <&tegra_car 195>;
+				#power-domain-cells = <0>;
+			};
 		};
 	};
 

-- 
2.50.0

