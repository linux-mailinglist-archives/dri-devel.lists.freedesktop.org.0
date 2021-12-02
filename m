Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8F466808
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082F26FB46;
	Thu,  2 Dec 2021 16:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4710D6FB40
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:34 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id i63so765956lji.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=PJS5NAphD8TMG13iWbjMT5Rvd0gBYlUTq3SvIbF/78W43Bl3rA3Jzqx03+4R2FKkuW
 QX5+9/OHFFtwo47h0GMJWQ8u+MGzEs/x1gDGKRNEDMBnayGFJuHhHA4uJSaugJIgUxSx
 hf18OYwSYZY43aGoXqzYOplCl6uOUAOkoPKouEcTNwkhOFrQMo+6oyw0cCZSFEYz6x0f
 KS48Lyto0JhjGWClc6WCbPuAFCkfeUARvdE+O9v1/I9T40gmsT+9ufErgcHwL1jpdZ+g
 x0cSUMSamn2a0xVPPXbTtCtdmbc1jpO6BsDfcLsLCCeIilr4nw4p+Eazzo4VEDab2IZK
 IXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=N3zMI1PVkbN055bZY9gYWsFoS2qc2TBWc6dX8lZWSMs4rN767gq0WrYQM966rzXY4Y
 q34W506VV20ggieDSrvEWJVvqTHWGHLBF7HPplKBW5LWimKJ7D9denUW1X6hOS5wOvdG
 IzUwiWGrrFoATG73vIgzhoI0glNLz2Wc5q4gFK9Z4HD0ALPzi1elVXxm3+5aXWU36B53
 FkOg8m1iRGgZmVqqFiyu796LnpHMyhUAgzFzwgYN7llHbKGmj0VCKuLTaTBT1Yq7gi32
 Lo5T4p1HAuv+tMG2W9m1JzTYQ0/Wu+cL4SjulqcdfskAhZB+23liyqdVhC/wXvQDrrNp
 OtzQ==
X-Gm-Message-State: AOAM532u/LDXE1yQTKgTRXGA5Rgq0aiSSStu6LCJebPB9DrzyDpBYjOl
 0DkbRQmhdiYdvPhnQCY3q/M=
X-Google-Smtp-Source: ABdhPJx97fEFBmRZTMoe4ceEqyDWsJCVc6i11HIbIt8I0RAFW/psqD4Gy32WAxA2oWW7diz92ZbKUw==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr12623406ljg.125.1638462332604; 
 Thu, 02 Dec 2021 08:25:32 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:32 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 18/20] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Date: Thu,  2 Dec 2021 19:23:39 +0300
Message-Id: <20211202162341.1791-19-digetx@gmail.com>
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

Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
Tegra20 devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 72cbe32d0c1d..dde228bcbbff 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -186,7 +186,7 @@ rgb {
 			};
 		};
 
-		hdmi@54280000 {
+		tegra_hdmi: hdmi@54280000 {
 			compatible = "nvidia,tegra20-hdmi";
 			reg = <0x54280000 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -1063,4 +1063,24 @@ pmu {
 		interrupt-affinity = <&{/cpus/cpu@0}>,
 				     <&{/cpus/cpu@1}>;
 	};
+
+	sound-hdmi {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "NVIDIA Tegra20 HDMI";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+
+			cpu {
+				sound-dai = <&tegra_spdif>;
+			};
+
+			codec {
+				sound-dai = <&tegra_hdmi>;
+			};
+		};
+	};
 };
-- 
2.33.1

