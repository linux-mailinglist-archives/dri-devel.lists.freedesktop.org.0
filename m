Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B82466806
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897136FB32;
	Thu,  2 Dec 2021 16:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BA96FB3B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m27so72711366lfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=aKbm0jqGqQBKRzqfDuhiE2xlT+R/vzJkmwWjfb0+xzKDh2xzPr1ZfXV7WFc1B976eD
 HSDFQVKr6YO/RZ72cNMOeNe9A6b/djeWPHQMIs4TruQEfzydiQrAfIWUgeXdSAXshrjR
 OcPeBvZTdCHWFXCAdtckkkezCVu/zJ7qR8feARLU5smSOj6qhmFeij2/T9cJSsVjTkZj
 AyKzfJSPOQh+9+sv2BovQgXLHYwUua5+RKzNc8CAs/zummyK5XnFCGhkYSrTFkNaZcH5
 yRRritoCYLKakaJSROkodMyCkG4oRzayGmZDZg9EX5QDr5fqJtJLMlzGcLRqd1TDAi28
 tSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=wm8AjX2WXGbgzIsE9FQ3MMRDJt9AKvpUywuvVi0H4YAK9fCwe3nP93L/Til/15GzSH
 fhy7ELXaVbxaIerYlybiU371zd7AKojKA6eFagDuD10e9fs+jgm2HT7O2v/mp9LmDUsH
 1dVUYjrz1ZqiSULJGJAGullnxkH0Ydj2vom9LLUEcuyaCPPpLT8Pf9WkYi/cFy00AVHu
 sjUU32fwLp9fd9prWw0lY3cr85f41ZMD8nXP0LjY921YMvhlKsTBJb35mngRIRZg6Qt2
 eQatnZ5oCyKkbnv85h7n0NpOtv8juYiYKxj8eOUNJDjDEja5vfnSC25hW5aVBWYyDyDv
 dlmA==
X-Gm-Message-State: AOAM530HyU3H357/lqrjrTSffwHx1QD9xDIobizH+vqhYojDuyYlr8CH
 iBg/tdn4DdhFY4rA/1mXs7g=
X-Google-Smtp-Source: ABdhPJxXWxkCEMsMgkvRWBk1cYAY6zm9sVWn+2iUZaxbe2VVIoDxFrkZckmO5aqHg1U1HX9z4kkfEw==
X-Received: by 2002:a05:6512:519:: with SMTP id
 o25mr12609268lfb.422.1638462331745; 
 Thu, 02 Dec 2021 08:25:31 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 17/20] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date: Thu,  2 Dec 2021 19:23:38 +0300
Message-Id: <20211202162341.1791-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
audio support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 63c2c2f8c0ce..72cbe32d0c1d 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -197,6 +197,7 @@ hdmi@54280000 {
 			reset-names = "hdmi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&hdmi_dvfs_opp_table>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
 
@@ -396,6 +397,23 @@ tegra_ac97: ac97@70002000 {
 		status = "disabled";
 	};
 
+	tegra_spdif: spdif@70002400 {
+		compatible = "nvidia,tegra20-spdif";
+		reg = <0x70002400 0x200>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>,
+			 <&tegra_car TEGRA20_CLK_SPDIF_IN>;
+		clock-names = "out", "in";
+		resets = <&tegra_car 10>;
+		dmas = <&apbdma 3>, <&apbdma 3>;
+		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_A_OUT0>;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
-- 
2.33.1

