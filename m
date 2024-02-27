Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2652A8687E2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D4F10F2B2;
	Tue, 27 Feb 2024 03:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uhf8xn76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443EE10F2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:46:03 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3650df44657so10652735ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 19:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709005562; x=1709610362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tA/OqBDxHzMzuOM7arRYERa2rELcIZBY7XfgMgE4ynA=;
 b=Uhf8xn76r/sPSH0D4hoj9P+d8hw9XX1cyte+Lfdt5RrWqceHHXZDI7FdN8bHNMg+6/
 Vzd/PMLGQpEqMapbTeuOlErQUrJ2WF2jJyFvlpvzrjpIbEAqslsuJNWatqRCvPjNpKK2
 3AZM9QSfnSxUQOXKSGumhC9o/cS2QD5UCtFjW9cLkT3Yj/v3GLvBGRXSchqmR1/yUaYr
 MyF/fNvOATCTaCqPhll/fwQblek8sOjKITfKz24+C0TRpY2f6wgQh3PgY6SErkX2lhSj
 jwoi8LXt7qCfytV99U/ESHAYRRaBf5mhiuNhc2AlmuKF67eCsaAX7XwZFCls62bIemJr
 N3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709005562; x=1709610362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tA/OqBDxHzMzuOM7arRYERa2rELcIZBY7XfgMgE4ynA=;
 b=cf6HkrkrhbaZ32MwEB5YPiCJPH+XF0xVi6O3JJT+heRUeKUc8WivKDVIOl4fVOAHOz
 R6qk+Z9t9oHl94Z0GqPEEWKVrAv3zx6bz1RiqEAOC2kTaFtq5gKD8hROwOcpPFKQqMrw
 lVRnp/wlcVgRmMFpJvHO2x+CM0hVCnMNdUbko72A2MbDnF4NPg8sq8DPfwksHb3Yjj3W
 kQ3kEVw+rKDejebaM5Fv+HeW7rhECo4f3hqgeAFiPjkjDaj1HFodvo+NSkZKA8njRMWJ
 vK7VRrSzYjvWiJc6GuFYMXAEZVAS4eh7wkpnmZDxda1mG97Rh6HVdM5Vo5lHYqtDb3hn
 GgjQ==
X-Gm-Message-State: AOJu0Yy30YsYvbPjPEb7K+0gYKu8e1XatJkgmOO6RpmqeMH/RtI/+ApC
 4qhMDnPUFLM4L+p+H24pBOu7+d0s+T9saT4Kh6KOR6pYxrDbFUuewg69J4jlvvE39/R3
X-Google-Smtp-Source: AGHT+IGQczT/wDuY+Cr9M1yRRAPJftGBz/LLp0J3qOzY2+JJTzEk6HQsjw4c+SqdK+MXfA2bjYuM9A==
X-Received: by 2002:a05:6e02:11aa:b0:365:85c:58f8 with SMTP id
 10-20020a056e0211aa00b00365085c58f8mr8612657ilj.13.1709005562006; 
 Mon, 26 Feb 2024 19:46:02 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:1712:c48b:aaa0:cd8b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a92ad04000000b00362b4d251a5sm1891566ilh.25.2024.02.26.19.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 19:46:01 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: renesas: r8a774e1: Enable GPU
Date: Mon, 26 Feb 2024 21:45:33 -0600
Message-ID: <20240227034539.193573-4-aford173@gmail.com>
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

The GPU on the RZ/G2H is a Rogue GX6650 which uses firmware
rogue_4.46.6.62_v1.fw available from Imagination.

When enumerated, it appears as:
 powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.46.6.62_v1.fw
 powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index be55ae83944c..398c9df1577b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2464,6 +2464,16 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a774e1-gpu", "img,img-axe";
+			reg = <0 0xfd000000 0 0x20000>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A774E1_PD_3DG_E>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a774e1",
 				     "renesas,pcie-rcar-gen3";
-- 
2.43.0

