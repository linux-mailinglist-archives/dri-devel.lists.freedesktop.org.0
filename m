Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80018959718
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 11:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1DA10E472;
	Wed, 21 Aug 2024 09:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="F/QdrFJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB86A10E472
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:27:29 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-76cb5b6b3e4so4415127a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724232449; x=1724837249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
 b=F/QdrFJbqfcAfPi6O/UBPL/QAjiPqJgiMiF8J5JFnblI/tbKz/DprxX4I0VZfiwcUU
 9k0Q0nC+0gzseGnCeSfpV1y/40o+EhrUvCq/Z9c0/aQkZni6LeeIPZDLyE0cNr3BvvCA
 wZmxsXa5dTE5XxSJGMhDtfa8ASx8ezbvuraz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724232449; x=1724837249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
 b=EiJCK4YVhvg7NAwGTRhrWina0aT3YIv3kPrmJJWD0BE4NgYDz99N/4I+jqV79mjEAp
 P73xETk1FP5G2619eL5uACkP3k8A6eL1dc69f8I12RimgrUu9fswmdj2O12P+6MOB4yV
 sUCmQilh29MT+Ff/KEz70ot7b7n8Zqs9Tgc8a2yaUIXtYIaqC14hkV7WxWA7a7Y+W8Tl
 pVSQdXXqd0fGmWnQqqG0IJXYm2QNcwsbM3stKbfl0GccyKIpKh659YXGLU8XOGCgN//b
 ChfgBXKky61qBjZ2MAYGLT52vxeEzyF4a/r3C5VQrJ3TcdGJun7Mk2j+aH9oqT1cMA8v
 ihYg==
X-Gm-Message-State: AOJu0YyaITWOd0GGOEjWDW+u1C5iSWrui8XQjx8RePkBFhqGHXS/b5E6
 rIpg4xZagFLqziVFBrAXvUu1+9YO2+YGN5uoG6F450HX3Db9iml56KsiqsI8mQ==
X-Google-Smtp-Source: AGHT+IFnfIrNiUomfEp1ttryB9uQgWfxL55rhoeddUhSzpcz4uk60NiwIgmgyqLVCB/iQ59t6moGxQ==
X-Received: by 2002:a05:6a20:4392:b0:1c4:b302:ad14 with SMTP id
 adf61e73a8af0-1cad8160aa4mr2007740637.24.1724232449282; 
 Wed, 21 Aug 2024 02:27:29 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f0300844sm89985195ad.47.2024.08.21.02.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 02:27:29 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8186: Add svs node
Date: Wed, 21 Aug 2024 09:26:59 +0000
Message-ID: <20240821092659.1226250-4-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240821092659.1226250-1-rohiagar@chromium.org>
References: <20240821092659.1226250-1-rohiagar@chromium.org>
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

Add clock/irq/efuse setting in svs nodes for mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index e27c69ec8bdd..a51f3d8ce745 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1361,6 +1361,18 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		svs: svs@1100b000 {
+			compatible = "mediatek,mt8186-svs";
+			reg = <0 0x1100b000 0 0x400>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>, <&lvts_e_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg_ao MT8186_INFRA_PTP_CTRL_RST>;
+			reset-names = "svs_rst";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1676,6 +1688,14 @@ efuse: efuse@11cb0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			lvts_e_data1: data@1cc {
+				reg = <0x1cc 0x14>;
+			};
+
+			svs_calibration: calib@550 {
+				reg = <0x550 0x50>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
-- 
2.46.0.295.g3b9ea8a38a-goog

