Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A849469377
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E15473F9F;
	Mon,  6 Dec 2021 10:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05EE6E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id n12so13844818lfe.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=RzfaFRXrQ7CuSKPzd5O+0D9Mbq84hRoijgOs6hXD+7GKiG52l/xbQwHLkkUHWt8wo/
 EruzOPP9GeQjoxbrO3uLPWtZkWT1O3F15sjMxxf35CdGZ0vsxrdKYrmGDRYeoaOTO2EZ
 G7HhLN+0R++d1G7lRodBHCzl9BhdQSEl0bVdOpM9tiRtt8LoSIyvlci8SBbOeKXNCGr8
 rGso9XNmd7XdPBAgwbdctGo9CKcY5gi9hMHF4PHnghRk+mNMYnFG98LIwqfg3/Nb+Quz
 ud0jPN/6fTWgNYWOumT/WxHTQ4hxmxT3s2lkhBaPMqajlFTqRbOi7H03sqNM2A+qFWq2
 4Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=wOlxArsL+iyidQFLeAHfuwrvolywOe8zq8Jtd797X5UiV0D6TZq5ZYLA7BHCB3uW+j
 /DEwVFS2ET/EVGKbjDU0yDBOKJOO0zgkF9hZQAqM9SHR0YkO2q5nIwPUmVuFAEeGrxeb
 0is0MWMn0iuQy+TARrkI0Fd6yY7f9vzgBdRKl1eEO5YZkd9tMKdqsy3gy0t1RabB94Kn
 Kuschu0OuUIfh5n0HShGpiUIDx8uHCGAmrr16XsfZ+pXV+x8+CELtvCVkSKZOjHT4vtP
 rzQs6Ox3jgd8WdznfoA5mMB97uKxQlzTas8jXroNF7hozs+FVQwIZrnC6S7L6FOiGuIs
 bUcw==
X-Gm-Message-State: AOAM533QgsbTA5rERNzWm9dLcXq7gOuJf41jbRvwiSGqs9hwV7LsWZD5
 M4bP9wKJKDG2Nv2cN8R7iVk=
X-Google-Smtp-Source: ABdhPJwf+GX/2emTs7+L59bwUSAf7ewn6GK+Tt7M5lTMPClzxfZokayjRS6DmCd3RSP5aXksQpYJwA==
X-Received: by 2002:ac2:4c47:: with SMTP id o7mr24822014lfk.558.1638628669123; 
 Sat, 04 Dec 2021 06:37:49 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 22/22] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date: Sat,  4 Dec 2021 17:37:25 +0300
Message-Id: <20211204143725.31646-23-digetx@gmail.com>
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

Enable S/PDIF controller to enable HDMI audio support on Toshiba AC100.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Tested-by: Agneli <poczt@protonmail.ch>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 5b2260f61f05..921a811632a1 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -264,8 +264,16 @@ conf_ld17_0 {
 		};
 	};
 
+	spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	serial@70006000 {
-- 
2.33.1

