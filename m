Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E345F1AB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AE56F927;
	Fri, 26 Nov 2021 16:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AF46F910
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t26so25466819lfk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
 b=o1DWMEb1T5JGVr+QWfi0T8rJPO9ShLpM0eQbXgMMr1Ed0qb2n7CzvFC7hCAawvCPjx
 FV77MEtaOndwrCgVn5Sl4KDEhJsbBKzAxNGNRXVBjPaL/LmhyrnWk260AE3Kij5qsMxv
 WaEC377zdSgBY0l6XBQdtMnvb65ENAdKn+3FvcPi/297odNW3wdI6m3NJI+lf72WHljj
 EVyvLb6/gON+hYDViwFpZGMAbtDN6k8BbdmGS2dSfkwbEVaklbvQsAgfgDnwTBcx6lTG
 HnR5BI5gcu1hbvTRG2a3Rbio74zanVGBd4Pj8kVpHVZ9Er58G3FegIsKtV4ByQChJjjw
 EDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
 b=RmX0h+kjhIeXEiWTMAygvlgNX6y+iNTipP7vJviRTRZfStRzcxlvmZkQ/a2yMxrQRT
 rmQvVERtLO0hjr9rTypXiVC6ZmhjAx2sfor321Al/Svtg5fjWTUc1tBdzotMo1aqukG/
 eC8QylXb4ZPyAGVMDi9Z2SGM0Aiji61d20H8rJngCjgmjJJ0Cn2v8aMvKhfFQIinama9
 TDroMwj04SSB1PsNGCCs8EypFrLAwQoHcyO79fyd58GAf1tloma2qCaMac+XJuB2rFGd
 QYTO1ciKmeMl21qx1sTA5PGSh3U68yQY+V72RYl4oZp6rHTzzK+833i2+bTPR8Mqq+6N
 jWrw==
X-Gm-Message-State: AOAM532D6iEES3RKXkZgcyePpdfOglJuGH0U2IHLYHE1a7DyPtnUY4do
 OyrLltL/5ojqDRuFq27ljSg=
X-Google-Smtp-Source: ABdhPJxufa09SdYBqo/kYgmkWvAdAZeSGh63a/rnmEQbEH51oFmeKfaB2ac9qq451gtYc6UF3a/UoQ==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr29916266lfm.631.1637943598334; 
 Fri, 26 Nov 2021 08:19:58 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:57 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 18/20] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Date: Fri, 26 Nov 2021 19:18:05 +0300
Message-Id: <20211126161807.15776-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
index 799da7dc929b..a2cdc591b4be 100644
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

