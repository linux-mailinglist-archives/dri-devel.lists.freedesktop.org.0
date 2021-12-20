Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B947A7EF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 11:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06A010F72E;
	Mon, 20 Dec 2021 10:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319F810F73C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 10:49:06 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c4so19145715wrd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 02:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrFL+333nutm+Hk0ekrxwdiYsKgWdK607ZfAuwXbC20=;
 b=T7I3MoFImxEfb2R1yvjGm629QFBhXTIbLj5TKWBHvBHRVeOkJ9cX2VoDfgSOpAGfg4
 r5f+XusVW6sFrPPmKl6OtDKgMDWUot3HhheJJZUeAQWrDHVtFCy1LJTE0ydKsaGwy3xA
 AKMOgmn15LQ35KSamW+j84sa+QRXMHe3EC1T3fa3WdmbellxHdRx/JMjINwxz0Kbmi18
 wn6aPlGnVOT05Eu14zlmC8IBNwLU5vaVWZ+6D72dyI+QiG64Q+nQNd/VvO0yieKKH5l1
 FjObcdanpreB9OnfuijM8Z9P2jaBk5DTpwXnQixaFPpX+7MvzNz0qkcSZZ4Tv/bR80C0
 dbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrFL+333nutm+Hk0ekrxwdiYsKgWdK607ZfAuwXbC20=;
 b=35xYGzSbfwYbRW0K688ZhOEQpjNboRFX0HUfWr3ELp6UopPXQsc9WEd+YatXAFiEtp
 MdNYbx37s4i3cgp9oI67+qQEfhg3dScT/+YBs141bM2FcWUozpX3wtPLrT0yXtYV9x0/
 E5bEt3Q/YhT4bsEFLwRxRFefzEUOtA6nGnMUPh0wbTIPoBN8AHD4mJGe2pNPgos+ohEF
 3HSdfSLRKE/9sJ2XBXRKs0V468cmAc4LSzKyBc/V7fqQS+yzydfrrPS5fAirheocpmF/
 wem3XgfPFXuIkFj8hM7IsJgn8l/sWIY/zn3SRQncMEzbfSolB7IYCA7Xj9ZKNv1rIxrC
 yuJA==
X-Gm-Message-State: AOAM53150IzW0pazXpraZkQjU8zfFcU7UBI5K5toyWNOr6icSZGATika
 vCFYDsY9ALq7/6t7wBs3AS0=
X-Google-Smtp-Source: ABdhPJwm5fpVKZp2T9VwXhSqDzKTLAGT0rtcfVRzy+CgaArOgHBbpKMHLhpwsY/JKyEc/VoqaV9fnQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr277449wrz.350.1639997344760;
 Mon, 20 Dec 2021 02:49:04 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id 138sm18125767wma.17.2021.12.20.02.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 02:49:04 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
Date: Mon, 20 Dec 2021 11:48:55 +0100
Message-Id: <20211220104855.428290-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220104855.428290-1-thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Move the eDP panel on Venice 2 and Nyan boards into the corresponding
AUX bus device tree node. This allows us to avoid a nasty circular
dependency that would otherwise be created between the DPAUX and panel
nodes via the DDC/I2C phandle.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
 arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
 arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 1d2aac2cb6d0..fdc1d64dfff9 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -13,12 +13,15 @@ / {
 		     "google,nyan-big-rev1", "google,nyan-big-rev0",
 		     "google,nyan-big", "google,nyan", "nvidia,tegra124";
 
-	panel: panel {
-		compatible = "auo,b133xtn01";
-
-		power-supply = <&vdd_3v3_panel>;
-		backlight = <&backlight>;
-		ddc-i2c-bus = <&dpaux>;
+	host1x@50000000 {
+		dpaux@545c0000 {
+			aux-bus {
+				panel: panel {
+					compatible = "auo,b133xtn01";
+					backlight = <&backlight>;
+				};
+			};
+		};
 	};
 
 	mmc@700b0400 { /* SD Card on this bus */
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
index 677babde6460..abdf4456826f 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
@@ -15,12 +15,15 @@ / {
 		     "google,nyan-blaze-rev0", "google,nyan-blaze",
 		     "google,nyan", "nvidia,tegra124";
 
-	panel: panel {
-		compatible = "samsung,ltn140at29-301";
-
-		power-supply = <&vdd_3v3_panel>;
-		backlight = <&backlight>;
-		ddc-i2c-bus = <&dpaux>;
+	host1x@50000000 {
+		dpaux@545c0000 {
+			aux-bus {
+				panel: panel {
+					compatible = "samsung,ltn140at29-301";
+					backlight = <&backlight>;
+				};
+			};
+		};
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 232c90604df9..6a9592ceb5f2 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -48,6 +48,13 @@ sor@54540000 {
 		dpaux@545c0000 {
 			vdd-supply = <&vdd_3v3_panel>;
 			status = "okay";
+
+			aux-bus {
+				panel: panel {
+					compatible = "lg,lp129qe";
+					backlight = <&backlight>;
+				};
+			};
 		};
 	};
 
@@ -1080,13 +1087,6 @@ power {
 		};
 	};
 
-	panel: panel {
-		compatible = "lg,lp129qe";
-		power-supply = <&vdd_3v3_panel>;
-		backlight = <&backlight>;
-		ddc-i2c-bus = <&dpaux>;
-	};
-
 	vdd_mux: regulator-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_MUX";
-- 
2.34.1

