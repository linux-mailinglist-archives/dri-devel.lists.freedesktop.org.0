Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F48687E8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A88C10F2B7;
	Tue, 27 Feb 2024 03:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jiSkHnBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1142510F2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:46:05 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7c7c984699fso76816539f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 19:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709005564; x=1709610364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JQWVgvsVSAXBFHOY8s9spMi4UJ0tFbH9CvikIMLXfY=;
 b=jiSkHnBBtKZhoRohcL0d1AbtlFvl1iwaP3qabCHMRm0seytp/cpuX2qo0W3T4z9/1p
 dZhT6gOdhre2FvPZGKDIlWOAHdXGpxc/S3/Zk6KT6a6SMwCswVnK3ekFiyzESXq8GWCD
 HVfe8PdxiebwN9M2luo3IW2fUFGXD1C8CCupg99A5zIAB1oGKABtp8PkKc/jDnZtB9rx
 oxO2LMMlD6lW421FduQOKIiBfACLrYBbY5zLnK3xrnu1nIsWGiPl2Z5i6kBt1/w0NH4J
 0fqylyH+FgLVOYEYo9uQ5hPNHT8BPzMdJqmM4ASAj5TZy2wjzei7oRVDamwTHqlNm5C0
 fAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709005564; x=1709610364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JQWVgvsVSAXBFHOY8s9spMi4UJ0tFbH9CvikIMLXfY=;
 b=OcglTpzICJwCBpcBmgJ16EcuuwaznYyYpeSHu3CyGE5L50zP3hMY5Iw82gjzAInD+S
 zJi8K4aDxWOZ7qR2kuzKJgHzHJYluw9Gte6tBUb5M5354jo/oxk9RmoMqTzu6WOPoJd+
 iQ+lgzBOSilcdNXD/dEaK/icKSUUQICed5LXqHfYFG87h7Qv/dRPzU9EdK+1niq/9KVf
 9ALYZad71sndlVjJ+iMonkUKJAAd3cATXO2Mtwf4BhgmJnkf48YKa28jRwvJPBYP8wSF
 NoCyaN162PXCf6NJfUAJbSn4J6X/hBdOrEGo64ngGBYyOGpwnPIAq1/IJ84oU880p3VO
 9Few==
X-Gm-Message-State: AOJu0Yzi/vdymTpt08NM5NQgkIUloTW+tcTlkNGAcKJBN8/YGk1gfRZN
 O0i76TyZWXaruztlVLEi7TBkgZO98UNu4NL07Gq7dJhDuNRniX20HxquwSd69vfoK5KP
X-Google-Smtp-Source: AGHT+IEvUosRcO3cAs604DIvzG8GjuAYhfLZpRke5iMYbs0MEdBufngZycVwxslAbjglBaiBIvbwKA==
X-Received: by 2002:a92:d448:0:b0:363:b8fb:fcb7 with SMTP id
 r8-20020a92d448000000b00363b8fbfcb7mr9849922ilm.16.1709005563780; 
 Mon, 26 Feb 2024 19:46:03 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:1712:c48b:aaa0:cd8b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a92ad04000000b00362b4d251a5sm1891566ilh.25.2024.02.26.19.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 19:46:03 -0800 (PST)
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
Subject: [PATCH 4/6] arm64: dts: renesas: r8a77951: Enable GPU
Date: Mon, 26 Feb 2024 21:45:34 -0600
Message-ID: <20240227034539.193573-5-aford173@gmail.com>
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

The GPU on the R-Car H3 is a Rogue GX6650 which uses firmware
rogue_4.46.6.61_v1.fw available from Imagination.

When enumerated, it appears as:
powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.46.6.62_v1.fw
powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index bea4edd17d53..3e9defaeb00f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2771,6 +2771,16 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77951-gpu", "img,img-axe";
+			reg = <0 0xfd000000 0 0x20000>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A7795_PD_3DG_E>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7795",
 				     "renesas,pcie-rcar-gen3";
-- 
2.43.0

