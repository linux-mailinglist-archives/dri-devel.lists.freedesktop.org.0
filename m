Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC48687E5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF81710F2B5;
	Tue, 27 Feb 2024 03:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDTeQwZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6544710F2B5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:46:08 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-365138d9635so13268855ab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 19:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709005567; x=1709610367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJfm+NHY1Z+Lw1sZYXXZ3jyQox+hLwhKq3O8TxYABL8=;
 b=gDTeQwZVi6PBjBC+KbGKm5NCN5ZnJJGb1sqn9dnNH4kbRITQ2IAcj/+u+5B5eWiZK+
 CxrB7ufb/BHeK3qQ6a8wCFVr8FoJWSALU18VGOoWIa46mXMAQHlr2uoSRjUNHQ3XI3Kf
 Pn6TrevQJUh88tnVnmONET39balPAM/KLn4/LEBJRD+xmGTZ+Pa3awD5KItn7jNrJTXu
 4qI/i1NhztxJbCDZIussUwQht+YTpO0oXsmV0qkYDMKXeA5Qsir+/x+a0iscybB4X8Au
 n2oK9wDzufP6jAJpZr4bPi9VII7uZNPyszPiSQNOjaqNwaLvC5WfoHgQfO1qkVxptG26
 QASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709005567; x=1709610367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJfm+NHY1Z+Lw1sZYXXZ3jyQox+hLwhKq3O8TxYABL8=;
 b=CgAajryPA2HgO8QhDqgC3hJ6xKKVarcklKD2lEGz0istymoWfFVek31+xFy6xIXs2z
 Uf59fZ067P6bjKepeDWsrak5jhN3ULBPbFdSYt6HNRR49ZVBL0HWcVBKQBCEkH3p77NF
 uEaynI0+PZifsE5rG5Dnc9FO2M9uGzpZYdBt3dnYsKYc0GPqXzJtpqeuTQeb9C+MPdAF
 Tqve0v6LRJpDFUczGq2N5Hl1MpwdRNuZ8urY4fDJQgwnpu36Lwh8wSdkthby7QeqKLgE
 mMYlZscr8Uzfy0kRlgCawnXJu1jRPIvKmQYno0LO0VhBdGpFVuF0v4ii8VlUeXG/Ntvm
 Z+qg==
X-Gm-Message-State: AOJu0YyvhU3uzIolnRz35A//kfBwcVlAYWiqfA1OZQ81W5erHuujelE1
 Hhm6V43g6ernQi1Nhyvwy63273iyDaR3x9kpMIJMPPJM3IONhgGioaibtbygczSNMo84
X-Google-Smtp-Source: AGHT+IHL1bo8nIvPJXhU/N96DuypsbyD1/7pheO1VuJUDwHDG0U2xYsyb1SRuUQCwpJMqpKqxuW6vA==
X-Received: by 2002:a05:6e02:1bce:b0:365:24d9:9477 with SMTP id
 x14-20020a056e021bce00b0036524d99477mr12614317ilv.15.1709005567198; 
 Mon, 26 Feb 2024 19:46:07 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:1712:c48b:aaa0:cd8b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a92ad04000000b00362b4d251a5sm1891566ilh.25.2024.02.26.19.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 19:46:06 -0800 (PST)
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
Subject: [PATCH 6/6] arm64: dts: renesas: r8a77961: Enable GPU
Date: Mon, 26 Feb 2024 21:45:36 -0600
Message-ID: <20240227034539.193573-7-aford173@gmail.com>
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

The GPU on the R-Car M3-W+ is a Rogue GX6250 which uses firmware
rogue_4.45.2.58_v1.fw available from Imagination.

When enumerated, it appears as:
powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.fw
powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 58f9286a5ab5..cc17e624c069 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2438,6 +2438,16 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77961-gpu", "img,img-axe";
+			reg = <0 0xfd000000 0 0x20000>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A77961_PD_3DG_B>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77961",
 				     "renesas,pcie-rcar-gen3";
-- 
2.43.0

