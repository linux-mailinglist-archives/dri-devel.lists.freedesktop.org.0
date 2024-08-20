Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89879580BB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F07910E502;
	Tue, 20 Aug 2024 08:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RLH6tzfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C6710E4E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:07:27 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7106cf5771bso4239664b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724141247; x=1724746047;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
 b=RLH6tzfrJxiwwR4ZE4Tbb7OT96a/Y0TFUKX4A35KwGDCxI3ZtryhxyxrY0sklkZNA8
 Vlcjdl4BCH1L6w5NLE8CKGtg6Bs4JGuvs2reK+7NqdOYMIbn/OFTRRfQcCjhQOZzxAsg
 h+eU6t036oKEYDDYQaHjE1azwHBta9q2i43HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724141247; x=1724746047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF9PjinJER9wjMA+9D6wXT2j5101Rcr5iAVO00wcnuk=;
 b=ZKyGFqXpBTKYY/Uve8IN5T8dOwfZiSWoH5x4a36vxmumPS94OuRc16lpmgvyjkU/3h
 QkW4q8d1xSeOc7zBEWDLtJF1IMngkxy9LwV6/X1dyNlre1OdB836qFeBE0LzB2bUQIT9
 jSeiCbuK3MsMVpo4AyGR11UqQJ4tJxnk4axLjAk6b0UPuNVNsPoFDhwA0QW7HiO80a7g
 MsIXylgGKNCkghxihLWITE7EnFvQXG9NQaodyTrjWEwJhI0GAYK4C0f96L1UCYry58iQ
 r1zS1kMh6sdLmgZqC26V61NRhuJ4LDhQxvTo6MKEtk6dWU9qbVTIx4VRMIrMBxXcnbQf
 aQHw==
X-Gm-Message-State: AOJu0YwZUsq1YJ8TNyrHynJ01uA8DQ32FqMyqiwQazqMFIYi1Q79jcZb
 4uVcaYjJuHQLfuUBeO+sNkEOa+DKQ6GZjDFm3o2PSCSbVJoQQBY+/uf2+FK7lw==
X-Google-Smtp-Source: AGHT+IEPf1X/OGkNUtPINTfo4AoKkECt270oSCWZe/9fyUNP+Ezk7UPgYKjiJPWONz6oyBub6ygygA==
X-Received: by 2002:a05:6a00:1a8f:b0:714:1310:15dc with SMTP id
 d2e1a72fcca58-71413101623mr287077b3a.17.1724141246957; 
 Tue, 20 Aug 2024 01:07:26 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7141556ad97sm250991b3a.167.2024.08.20.01.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:07:26 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8186: Add svs node
Date: Tue, 20 Aug 2024 08:06:59 +0000
Message-ID: <20240820080659.2136906-4-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240820080659.2136906-1-rohiagar@chromium.org>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 08:19:19 +0000
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

