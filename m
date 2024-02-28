Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7086AD95
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4A810E5BB;
	Wed, 28 Feb 2024 11:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lOsTVqbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A2510E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:37:49 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7c76a566218so252334939f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709120268; x=1709725068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjHmD27Zn5f9qcl1J3ud5c045eXb4S8qmKaQOkxlviQ=;
 b=lOsTVqbqk9zjyPXY90V6zrqbWQAM2dRsINGjWGq+9/Jrqlj0l7VrQ/MMF8ewPEEGz2
 WTJLGDuREEBRXgbPOL6XWhJf3E0TXNS70gQPSLYGMDRRPLwMpyu6hxEPMZEBtBh7CwUf
 BmqadQIIR4QEx03GlMJOQrY1vfYEWPJGjmqceBJu5/pOvRC2k8ERbaqp+t4HyUEfuzn0
 RmwSCTX2YzkoK6Fz8Cc7bsLG0yaXaqJ4EMyQ8Ilzq0tOUgXJMRtxgcEjesdnNmahn7kK
 HZbQiPY5He5E8quyXqWjIkhgzke39nYWlLEev78T1cDAuw+b86SgCfhdZHf64VzkgwGL
 SoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709120268; x=1709725068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjHmD27Zn5f9qcl1J3ud5c045eXb4S8qmKaQOkxlviQ=;
 b=v3HzPOa9vPbM1fC5DLdDG/ttGK5cAyTfdkHNcQ1JYJWlnALb7eRmp/UJ3DoFjqrW9a
 YSVMNPSULD4pjJWFMY6IttvO34Cbwx1VtoFuOfFrE1ytcv3iEXOuOG7ov00kreA8dKYZ
 1y82jtjxEVaoOK8vaLqlfwIuIi3c+GIC4vpGx1y/DHQ2XHR/FGptygfUPeSOF9cc/lLh
 IArdtMtV537hM3ivAzf6SGLT/SksKI0Py9ghqJzreAIkA9ek3K+bospCX4Jjy4nZePhX
 xzi5HhixW5jrYKMet51Pi0DC2yex5f1OC1Xh8HPW784SwoaKCAjPZkaPEP4vFdtobGW1
 iHiw==
X-Gm-Message-State: AOJu0YwJtEKzwA6RyBh6lfESPfHZvnAVyWEQTFNnPNEXiecOMHkWFQwO
 edY7au5/IYiLuaBAgWcTMpJnb+seJ99LIxu3DvJMcKk1mpOHcauM954YHMHgwK7POpK3
X-Google-Smtp-Source: AGHT+IGw+AwPTdvF2K2zzuaTTuvgEgfn6uZbhI7INlVZj/9AQPcv5DRB1Uszb8mE8Xlc7RpERydtsA==
X-Received: by 2002:a6b:7219:0:b0:7c7:8b50:fedf with SMTP id
 n25-20020a6b7219000000b007c78b50fedfmr14907652ioc.4.1709120268020; 
 Wed, 28 Feb 2024 03:37:48 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:abe6:89f4:1061:8343])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a02c646000000b004747d876aefsm1833147jan.6.2024.02.28.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 03:37:47 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Rob Herring <robh@kernel.org>,
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
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
Date: Wed, 28 Feb 2024 05:37:36 -0600
Message-ID: <20240228113737.43434-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228113737.43434-1-aford173@gmail.com>
References: <20240228113737.43434-1-aford173@gmail.com>
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

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 8de4dd268908..d854c94ec997 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -405,6 +405,8 @@ adv_bridge: hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
 		reg-names = "main", "cec", "edid", "packet";
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
 
-- 
2.43.0

