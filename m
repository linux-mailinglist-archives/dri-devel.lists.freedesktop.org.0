Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FB4693A9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697947A45A;
	Mon,  6 Dec 2021 10:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305146E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:49 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id v15so12068317ljc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=leSChBds958mAfUMY9jeuuqD5Qn6lvxbEB6QV5qCZ0n0CsKze78eor5z0bN9rj/7Vw
 h7/tlsyatSb4Rnn4aadHj9eKx3Hufmh5E1AfSh5sxzyV+r76EZLz4xGtHt/Upcn83GRk
 VlmvlBxwI9IrqnFSd36xJr7Sj1OUvD1LYMjcmuDTUgiYSK1yb5hTeoP7IWcrLVmEe8Vq
 ABkcKxWz8+fCJmaobjrWsaQaOyL68eh9YEuSyfNpUr0lL4ZpAvMCkfWw+ME8czOM9IQG
 5rwGwfIae8P3ENqoKLVdn2qIscFlew1Y0QtLEW09HYlSN5ZtDmEBLi/dLcE2RWXmINFP
 Ns6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=6U0ywaPt4G6teTL+52P8RU3jDLCPwLm+vckJM4yvjUpFaueIAATdGxuDmYXuoxK2Ve
 uMI/dHZUaRpYz0o0vRcQbVnwwotKlZTqhXvaAEjlNuRsoCm7Xma/EOjIANgevdb7fYe0
 iPTcEOsx0PaxmQZPqUVsibcsX+EbtpRGSKSbMqYkfisHHBnsAKRV+DbAFdHSLTrjg0ez
 r7bZR4nhglI+wF4pl1E8MtK+i17cD7ALo7N1MxgnZ1rseknCOMRQv0oIDTOOHmSjD4Rw
 dUJbvS3rGUPMzJjdzUuMKvB1bhTsbHxVctIHPY4dNOmGquADOJdzQlUjiqtfVSAf5PuW
 BJ/A==
X-Gm-Message-State: AOAM533xQYAUZ/DRmbFEGVSVbIw5iKlI/OwJ7k1+IRfEyd+L1lpfPPg5
 S9uqztsmFBBxNkSf+ffjvJw=
X-Google-Smtp-Source: ABdhPJyDeO75xIBk/QZj5qYQSqZV15+DMrRsbXBSrSANn3YT8kCBPAn11GIEkBQ9rFB2qoWlosH3Fw==
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr24932955ljp.297.1638628667574; 
 Sat, 04 Dec 2021 06:37:47 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 20/22] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Date: Sat,  4 Dec 2021 17:37:23 +0300
Message-Id: <20211204143725.31646-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

