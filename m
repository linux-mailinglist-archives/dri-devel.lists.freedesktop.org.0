Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E681E965C0A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B2810E8C2;
	Fri, 30 Aug 2024 08:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Pd7OI6sU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDF610E8C2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:46:08 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-716609a0e2bso490832b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725007568; x=1725612368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0MSD/vKECgZ6ipsqTjNJm7AvSs0y8L2jz9lADbJGXw=;
 b=Pd7OI6sUeFdpuvfLtAqHZbqMO/hqYK6svZwiagoSsX57xwle3NHX2resnkpjAAUumc
 oX8so8I2fCLyqvdKhMqwJr2Z6RezdL5a2qiogQxFhM97Yt2kGQ0si5WD3aajk5qmKMtQ
 kGfZkkZtlhgWCgIFFdnutCnGz8Lh9zVxd7Uz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725007568; x=1725612368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0MSD/vKECgZ6ipsqTjNJm7AvSs0y8L2jz9lADbJGXw=;
 b=MAAW15FVtz5WjP2eqKzZdPgRRjYolCii4jTQ/svVPr9k6g9K4L+JtKce3GcJjPXGFM
 x75kaJaTjWHtmcDfALlOwVqcPbxB+bCTxZ4gcHqBZPoq2gtRh9KsCNTCLJiApdZppW6z
 3GPUxUUw9MOI/Y09cTDxh5SA2DyuEWJnjZlYObzU6pNq0kVaGhftTILe5yi+Zu4KVQdd
 IHKZv0YzppKiQil0HA2FHQKcolMu755OfpjZctR66hqxePQxdfwztNKtwxFR2H/vMwM7
 t0dtAAW1YxtZoUzIo0Lisz9FfVbu/VTqD6GxQD3Rt4BB+7v7Y3LvpOpJM1T3DhuuqH35
 P4/A==
X-Gm-Message-State: AOJu0YzvPEWW77ON7Tm6SmqJlJHG0Bkl52O995BOjx7EoxNvJYRUzJ9x
 AtaixUL+wSEx3GSWOx4bcf7hXrWAYDpRe6N5fnmup+jvARuhm/5W4awSUsn1zA==
X-Google-Smtp-Source: AGHT+IF/Ev+xp5G1M+ToeusxjN0ThDIfMD72jH6J5Y7yXu9dlnTUI7Td1DwM8MVKcLVb5RSdY4uPIQ==
X-Received: by 2002:a05:6a20:4386:b0:1c4:214c:cc0d with SMTP id
 adf61e73a8af0-1cce10ab1ccmr4853891637.36.1725007567866; 
 Fri, 30 Aug 2024 01:46:07 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com.
 [34.142.196.117]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-715e55a3a7bsm2288304b3a.47.2024.08.30.01.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:46:07 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: mediatek: mt8186: Add svs node
Date: Fri, 30 Aug 2024 08:45:44 +0000
Message-ID: <20240830084544.2898512-4-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240830084544.2898512-1-rohiagar@chromium.org>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 85b77ec033c1..3bd023cdcac0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1372,6 +1372,18 @@ lvts: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		svs: svs@1100bc00 {
+			compatible = "mediatek,mt8186-svs";
+			reg = <0 0x1100bc00 0 0x400>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names = "main";
+			nvmem-cells = <&svs_calibration>, <&lvts_efuse_data1>;
+			nvmem-cell-names = "svs-calibration-data", "t-calibration-data";
+			resets = <&infracfg_ao MT8186_INFRA_PTP_CTRL_RST>;
+			reset-names = "svs_rst";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1695,6 +1707,10 @@ lvts_efuse_data2: lvts2-calib@2f8 {
 				reg = <0x2f8 0x14>;
 			};
 
+			svs_calibration: calib@550 {
+				reg = <0x550 0x50>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
-- 
2.46.0.469.g59c65b2a67-goog

