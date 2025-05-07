Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DBAAECEA
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D44510E8A8;
	Wed,  7 May 2025 20:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X0z3H4wL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA5910E8AB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:43 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-72bc3987a05so188927a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649362; x=1747254162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9qj4UpUWDjLwg05OrZxsWUBu7HdjL4SGnQbRsqq/XY=;
 b=X0z3H4wL6Dy1iKGQ5VHqSWlGNKGACzEXWE26yszonrWYp8wnmWLm42krKG/4qzbKdR
 jK0r+kRKhDgVBjcRYn95dqwtPjFySsEnG3iyqEGIWZi/m/busxqC7MJeUJMCBFWBGOCB
 wwzEpk55LsFgLuJzK/asEQV6Fkzi6zhqqsI3hq8sETm9YI0pvA477+XHBv1wC9pCn8C3
 7cMr23WskwiAU2X1G9b/na2JnJQLd6ysq/8y5U8r49awWi+9zvsmt754dXkvceza6ZIy
 MDTXQ9vRVSqLXBEZgp7Rl5JpdqXaGWBf709E8YvKPCbYVYE3G2SbUyGZOGlSvC3Y6pja
 Xq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649362; x=1747254162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f9qj4UpUWDjLwg05OrZxsWUBu7HdjL4SGnQbRsqq/XY=;
 b=MtOJpmuUmkM8OXEygz10AISUY+Lc9t4sLdXjZ3WmjG30JEx/Ej/Mi0CWOWbeQPmtcL
 tgbh9WnksCPP/TxP+Q0yj+XDQceceTJDRtoeiff/70/CkotVAyuWmzCWsC/YGgYW1Zs/
 s16LyrfXVHirZ4wUAFRS3i+tfbv+unnrRtCjdhcZBHL5xhk0Ikbyj5bdFwxcxUg1qdw+
 ZUIUkJ0xUGVJgkeeObpgUaJMxAbvcllqnoYgpKQGVycvd+Lcox6w4yVtTuSHAItx96+c
 UEyJMNQ1X+cZ8uPFdeSewz6rT2LlaqworC4g/H3XLzPCauIYqkoa6vrIuNW46L5MzmSr
 Zrag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXefy0Mocr0S80ncqR4SM+FtsWOKb4L52i47g1GFWuDdvRfPNArG5Qw3BbotTnZguEGdSZx1Cplgr0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiXF9aky08OqS71yuQbNfTiZoaYTj6spAL97pNJHPyR/vpYb9k
 fdpIGGMCCrHtyQ91CktT6mcgWB6dPh/4oqc3uiLPParnCUdbR5p5
X-Gm-Gg: ASbGncvkR2MzVYj0hqIaFIJvFKL2jGb4rXbLQ0v4K39Zx7OlEzyd6jWRPY6Ecv4kzTn
 t63/JEy9+f4L2PQUemleRdqCFMopD8BCJW062IvRIRqEFLBxOSiCqn5EyOZfuxLvJIud2cG8EDk
 OzFN4AhfpvSqmGMa07L3z7S7hxZXy230BYOH8mWo7Jt5DT0E9ky5lt1lDWpvDpHw2LqSohm+nWQ
 NBEGvBqhy0tyRxLePq9pqxyIJvU8F1aPzRPyvkzbcWn6H9boiYXD/uU+XDUOZNdMyCn+8WSYXDl
 KWdq0YPGfkX9GKf75XD2+UIQDGn8skawuS3445WyYXGDB4EGyqIdgdX5vcOuvKnsnWZ6sYk=
X-Google-Smtp-Source: AGHT+IH2oJBKfv/nX9XV+zQRIfTXfUhPN5oWVBe/V5dWv4ffki8mMMLkvqKCrOJpZoakFoKnhSq/+g==
X-Received: by 2002:a05:6830:46:b0:72c:4023:aa19 with SMTP id
 46e09a7af769-7321b400a55mr605713a34.7.1746649362625; 
 Wed, 07 May 2025 13:22:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:42 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 20/24] arm64: dts: allwinner: h616: add display engine,
 bus and mixer nodes
Date: Wed,  7 May 2025 15:19:39 -0500
Message-ID: <20250507201943.330111-21-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and variants (H618, H700 and T507) have a new display
engine variant (DE33). Support has been added to the existing DE2/DE3
sun4i driver in a previous patch series (x). The variant is selected via
the appropriate mixer device tree compatible string.

Add the respective device-tree nodes for the DE, bus, clock and mixer to
the H616 DTSI, and the matching SRAM section for the DE.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index cdce3dcb8ec0..542d129da9c3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -94,6 +94,13 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h616-display-engine",
+			     "allwinner,sun50i-h6-display-engine";
+		allwinner,pipelines = <&mixer0>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -150,6 +157,52 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		bus: bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&de33_sram 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
+				clock-names = "bus", "mod";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			mixer0: mixer@100000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x100000 0x100000>,
+				      <0x8100 0x40>,
+				      <0x280000 0x20000>;
+				reg-names = "layers", "top", "display";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+				iommus = <&iommu 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+		};
+
 		crypto: crypto@1904000 {
 			compatible = "allwinner,sun50i-h616-crypto";
 			reg = <0x01904000 0x800>;
@@ -173,6 +226,12 @@ sram_c: sram@28000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				ranges = <0 0x00028000 0x30000>;
+
+				de33_sram: sram-section@0 {
+					compatible = "allwinner,sun50i-h616-sram-c",
+						     "allwinner,sun50i-a64-sram-c";
+					reg = <0x0000 0x1e000>;
+				};
 			};
 		};
 
-- 
2.43.0

