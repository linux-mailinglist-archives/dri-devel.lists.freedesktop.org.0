Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68E8D472F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CA110F63F;
	Thu, 30 May 2024 08:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MK3uoMQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D0410EDDC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:35:41 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-6f693fb0ad4so556516b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717058141; x=1717662941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3dPYP7w2xcwwD4ezxBwzChfzLxfVatZgNqWhWYFewg=;
 b=MK3uoMQfRIZlwvnU6wt6HJOI0zrnq4zE3UeU7QnqNj+256CgW13ebVoX9teCDg1izF
 2qSClJc7uyivWru95vEeK4ju/LZT39uS4s3odASLfY5o4h6e154495cQB9dTbms9WKYy
 yx3VYp7MycP6L4OJeKtnnnU7eLXD2WtMws/Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717058141; x=1717662941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3dPYP7w2xcwwD4ezxBwzChfzLxfVatZgNqWhWYFewg=;
 b=YatKEk9yeKdNrJ6aKaCHPoYW9C4melaY2wgesnpuF7oo4KWJSo6P2NG5WJXlmu4bm4
 7a9jpc1KynWzWgQGuhOyZR/t8MnrMsVylZwsjGWN+mxp/IHTC9/jNWYXERk6WWmqgwEK
 NAv5vXX/dMtepYDFM+K30HfB8qThm9DC0FwJ+VyfQtueCaP9YcIWXtN6gGl9V949W4AW
 WWIEo9mog8X1eucM8u9bJG2xnO9R9bHJzCoDMN43iUrPAQwxfWp7FhCi9t4t9uVnSorM
 1f0lD/7wwYdHM0qDxKEcqx1xoR/zSjlnH3TaK6wRepu5TKuMXhWwKecSkCLH4yUzGg7L
 i+Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo9raIRVFgYFbkN/NmPCKXV4RjkaQKLkDDXzt9e2boVj2B4T4YQwyODubJS5IycccWt9ONChfEGBdPmfqV1Itv70nJdeZj7OveVVbDEQjP
X-Gm-Message-State: AOJu0Yzc3p0VY4DL4KEYGIf8q0s93z3ae/+y9bjYDVDpHYHGHaHKSger
 nAsWQ9w/WiFsHxuLEaMuYayidAp371ytKXcua1BQVs8T4nnrzC3oybakDq3eNA==
X-Google-Smtp-Source: AGHT+IFl9n7DktKEcpEJ4WGQz7AcjFouxFiRzMPk6dDKBcDqPpXqbxbt5Utw0hXKMF4XUXofIeg46w==
X-Received: by 2002:a05:6a21:99a3:b0:1b1:ec17:e59c with SMTP id
 adf61e73a8af0-1b264618a95mr1679425637.61.1717058141165; 
 Thu, 30 May 2024 01:35:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:35:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Thu, 30 May 2024 16:35:05 +0800
Message-ID: <20240530083513.4135052-7-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 136b28f80cc2..3d7b9cc20a16 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -993,6 +993,30 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,powervr-6xt";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&mfgtop>;
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.45.1.288.g0e0cd299f1-goog

