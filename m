Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF78687E7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087D010F2B6;
	Tue, 27 Feb 2024 03:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D6mrImgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49D010F2B5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:46:06 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7c794deb6cdso176570739f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 19:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709005565; x=1709610365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3StZ/L4nuFpFQDzbrXKyCvxa0NGv/xoSnCZP+Jf5BgY=;
 b=D6mrImgnkeOebRE6KWnQEeY+O3GyLrHJZdM3Jhqu5RybDHJxSxPqGZM0qEmUhKHZcR
 pAdUEhC5ExK9wrius3iRNtmkrUPIOEwom1xCmbUIGw1c8zsgETksJdBb1oiaU5BnrelF
 QO7X+5ORCajdtreFrPONA7aeSJO5Jfo+yg5pl6uEbgYBmsfhY1aQOiFfK8ePRD8233a3
 4XwLktODZ9yowcyMWtFmocMqxakmnKYIHoBfNOC9TeR78H2ahABZLBQDjn3CqSKKnYAE
 JyJ3eoSvmsjXFI15QAXXFKbfuIDK//IciYPesdqPCPi+3SO2SCItEA8raocFRSPJibcd
 4NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709005565; x=1709610365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3StZ/L4nuFpFQDzbrXKyCvxa0NGv/xoSnCZP+Jf5BgY=;
 b=VjJ3gro8OrXcY1fQTs4lLh+jhUA7kEoGzfLp1US5lB4AbqObCbjmoGL5CJKSv5GDDt
 pVeSOSpB7qWLEq0rVqPb7dhz4XHyg1lQjRxsSO47qlskAWxbUB7dz8luylCtCQiGCLZi
 gTxHhhDUkZ/2lxRCSn2ZErJ/r2peBpeOMz0hJj+I4ZkSLX2i8bYOuUb+1go6skgnTwrV
 e7H2sk189e6vICeXPIauUpfnZduDxEVfv9n79hNnaCg5mp6IdE3DORGfRyytJnkRWATB
 mwSXfq05hhGQLFxOhyzoLjWiNRSpYP7KUP3AJKi4lh172ELCtamrB0b5brqI/8d8SGoE
 6hsw==
X-Gm-Message-State: AOJu0YzswEpZI4OB2S1Iv7fhx8BURRRmRvVuenhgSd6bYXTJVIRr6q0t
 ohjk+ntADDJ+Wm6hQl/PmlehUwGaTv0BN1RjniVpuKfKgex29ytlK3ShRmoN6ayAiunS
X-Google-Smtp-Source: AGHT+IGknTA/wjq0GgL2gXiP0e5BIWFd6q9cFl4c3fjpz3qCOZ+8Z0cNOWFM54PRsvcU7URA2vl92A==
X-Received: by 2002:a92:4a03:0:b0:363:b95a:b55a with SMTP id
 m3-20020a924a03000000b00363b95ab55amr10583339ilf.16.1709005565596; 
 Mon, 26 Feb 2024 19:46:05 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:1712:c48b:aaa0:cd8b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a92ad04000000b00362b4d251a5sm1891566ilh.25.2024.02.26.19.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 19:46:05 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: renesas: r8a77960: Enable GPU
Date: Mon, 26 Feb 2024 21:45:35 -0600
Message-ID: <20240227034539.193573-6-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227034539.193573-1-aford173@gmail.com>
References: <20240227034539.193573-1-aford173@gmail.com>
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

The GPU on the R-Car M3-W is a Rogue GX6250 which uses firmware
rogue_4.45.2.58_v1.fw available from Imagination.

When enumerated, it appears as:
powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.fw
powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 7846fea8e40d..0f17bc3f2d9a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2558,6 +2558,16 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77960-gpu", "img,img-axe";
+			reg = <0 0xfd000000 0 0x20000>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A7796_PD_3DG_B>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7796",
 				     "renesas,pcie-rcar-gen3";
-- 
2.43.0

