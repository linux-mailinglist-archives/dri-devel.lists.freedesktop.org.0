Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48818711F5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 01:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D146A1127AD;
	Tue,  5 Mar 2024 00:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cbib4TY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98A01127AD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 00:49:12 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-36576b35951so651885ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 16:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709599751; x=1710204551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+BHVxrlI9al90zgfzMAMYGXo6UILvOU2ILHGRC0OBw=;
 b=Cbib4TY67u+m2ax7mFbQXuEoOwFPOX/GYZfovLm1OEXEWBTmESDaZopD1hfIsVXNTK
 jF0sHh+JlLJ1ZIWElzlMnUiQNLJV7TeQSsCM/b6mKVwBo+Pguy8r+yswJya3sjxAXfhA
 DZg/BAA5X4sI6HdDbBgZlE/JP30eAoA99Bceol1/tuMak9utp9JtKkJuBef8wEr/qgta
 HMOZ2NiRRPeW+0OGa3pLvB8uTWmPhCbAagUT+uRdmfVMi9MPTCiys/nEx0FDwpuFpAFA
 QBIwJu5PX5AWFtFVPZFEN8pXAA8k5xLiEbu1amPNOM6oKIwDLKw8DHnq557iiSZRA0pF
 ncNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709599751; x=1710204551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+BHVxrlI9al90zgfzMAMYGXo6UILvOU2ILHGRC0OBw=;
 b=d4rVsIIvRbezNoYSU7Hqmfxi7IFuMSTyf/eML0CeUNp4bHHxhvLmGKMVvVLj7YveZB
 AfIfh9Ulg/BfE5a3GLmrol9Z2CSrJZVt4Q+APuTkvCK5liaq7VizCB86Ee5gBMFSDvnf
 E5uhADF9On6O0CaQw/MN+HLWJ7ExjukJ5/QssRxThGOc8jjgrb0+94DUmlhAnyPiYuSz
 fw7L4fiXJJmH94BBRL//oob0xNeq39RdCPC40k+yqQzITYbG7/BNlb84e9siM/IlXg2s
 0bZK71QAAABWI46QfEXAQK8oHTfwjOHnaeqAOyTR60kxV8wGsK7VYikKgXbhtGYGLhlk
 nFJw==
X-Gm-Message-State: AOJu0Yxsx/yOXsPLL51Y2UoLoTGbU9NRmN1oZ9Afbg+BRUQMussnFp8s
 kUDtzmAwJARibODnJRTz65K8YZtp2EpobNnttKtRaD8pbTz80J5oOdlMHGGVa1oFkg==
X-Google-Smtp-Source: AGHT+IFcwi9gaoZxVBmlUA/f4yh+4E16WuLN4gryhMWjZuOM6lWeIU9uwmOYkkJrmY/3PWsDYKmleQ==
X-Received: by 2002:a05:6e02:1c24:b0:365:1555:9fe1 with SMTP id
 m4-20020a056e021c2400b0036515559fe1mr15026004ilh.1.1709599751378; 
 Mon, 04 Mar 2024 16:49:11 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:8c4f:ad40:e7e2:538])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a02cc54000000b00474d40f8381sm1931209jaq.122.2024.03.04.16.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 16:49:10 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, laurent.pinchart@ideasonboard.com,
 Adam Ford <aford173@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
Date: Mon,  4 Mar 2024 18:48:58 -0600
Message-ID: <20240305004859.201085-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305004859.201085-1-aford173@gmail.com>
References: <20240305004859.201085-1-aford173@gmail.com>
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

The DSI to HDMI bridge supports hot-plut-detect, but the
driver didn't previously support a shared IRQ GPIO.  With
the driver updated, the interrupt can be added to the bridge.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
V2:  No Change

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index a08057410bde..fba8fd04398d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -304,6 +304,8 @@ adv_bridge: hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
 		reg-names = "main", "cec", "edid", "packet";
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
 
-- 
2.43.0

