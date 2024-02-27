Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96308687DF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB2410F2B1;
	Tue, 27 Feb 2024 03:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z066j77N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3F810F2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:46:01 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3657d1d4516so13604865ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 19:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709005560; x=1709610360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFyPT0505OQhdGJk2meFYZ2auxbPN2hQffBG52zYkHM=;
 b=Z066j77Nb0cVbx87R1/ZYXuJincKE+nyH65NxsJzvXo+Mr8+qPLJWA3kRmEWHsZeWJ
 5LD2hRznCYAJ8SWuK8mO7peMhjU0L4TzzY1ytB14yhjVNFxiK7xQDmi/Jj2t64tG1ghA
 MYQH8b93rn+DCUtpV/S0gVGrDvQXg5WSTPT2/sRWvweu/EszAKovKiC1THPaK5ApEKbx
 7IhmlLRiWWOGPfrvlV+6nT3Zza/JXquGQpPlDafNLCnyeuJajC5e2nHnCb85QSABqHaG
 ip7SrgwT9HUf5qJpOxt3w/ekG1QiSZZ0q/5UK2Fn++G2xZt8iWaU9uoH1v7zDd/o8RBi
 oc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709005560; x=1709610360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TFyPT0505OQhdGJk2meFYZ2auxbPN2hQffBG52zYkHM=;
 b=eNhQMhx7MUu48KzuDkZkvlqZQbtuXqaSMd+UtgugtUvpkGfgCpLqgGXz61bEd+clD1
 PUwmrsGaUFti1eE/dglSJr04681Xb0tNddzl/hxgxqIpniqAB8M5JjXFm6fTDRrF5VwF
 mtIopfmkVyA2Q4zzIzgMaR7R+D35mzt5J1h2tpNb/cN79JQd+RD1riUqX7fdha0AaNQu
 8NZ/cXAp5U8s2WPrqWh0OYG1dVLGUhs0ZexmtyZMUwOQBU65rsdGasgpVBr2+3nwqmed
 mzVkzajOsGvtBRgcMsFuY7RbTnTDejN4+joA4/UlQjP8d7650WFPTqy5aJKdSKcR17J9
 dT3Q==
X-Gm-Message-State: AOJu0Yyl1B5WoK0HvVvVdY7y/AZj2mD8ZhWDCowweKbIRavkBeMWh4I0
 QPawSTpPtBHik+Dfh7GnDG5Qxbzh9hnCfo1RDBfqIYSRI9olTtQXEEdFC8eXpywrd/np
X-Google-Smtp-Source: AGHT+IF/j0iIPL7V2P2BUiJXLUpppCmaVzcpbY0QBgp5dSUNNZbLSyTfL1NORWHj1+f4qH0v24U45g==
X-Received: by 2002:a92:dc86:0:b0:365:13af:84ba with SMTP id
 c6-20020a92dc86000000b0036513af84bamr9402827iln.5.1709005560378; 
 Mon, 26 Feb 2024 19:46:00 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:1712:c48b:aaa0:cd8b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a92ad04000000b00362b4d251a5sm1891566ilh.25.2024.02.26.19.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 19:46:00 -0800 (PST)
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
Subject: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Date: Mon, 26 Feb 2024 21:45:32 -0600
Message-ID: <20240227034539.193573-3-aford173@gmail.com>
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

The GPU on the RZ/G2M is a Rogue GX6250 which uses firmware
rogue_4.45.2.58_v1.fw available from Imagination.

When enumerated, it appears as:
  powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.fw
  powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index a8a44fe5e83b..8923d9624b39 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2352,6 +2352,16 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a774a1-gpu", "img,img-axe";
+			reg = <0 0xfd000000 0 0x20000>;
+			clocks = <&cpg CPG_MOD 112>;
+			clock-names = "core";
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc R8A774A1_PD_3DG_B>;
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a774a1",
 				     "renesas,pcie-rcar-gen3";
-- 
2.43.0

