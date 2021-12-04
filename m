Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FA469398
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2C67A3F0;
	Mon,  6 Dec 2021 10:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A1C6E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id k37so13824121lfv.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=UacBb1E5+o5jnYkAbQY/LstAz1dq1wXZlTJ9nXprj0kabeLY0GpeOaoFNI4Ko8bUbb
 I5ijch3w9RajEmDpe38OcdNA0pc89lro9SOPsUnu6kOfQdryIogs1wXkcezKIKRv0lOZ
 n9B7Db5+P+S1m6YptZd1BtdlzEStuOg1aODg0eJRFMTD+zngUlO+EorP9Cj3ohgQUwFi
 6VynchlLIfLkAnoLp+6lh6hwIesEVooX5rBWaNF80T+ryJVaSR7nHVtrnCVcIT9FieEF
 kSmj1ghUOiST/oEcvCBL2XqCkiq89IFYWBapaXu+ZUvPdjsx3vuD/jFZv/VUaHADS77x
 JOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=spCAqQN+awnf+vARe99clGv+vEG0syHxPzpMlzFcAcl8WOY8WaezOrTLQgfNu6RkVj
 Kkxhd8UzvqipnfdfcJKQOiy5rhSKxfHfC5yeLGZtND1HjEyUoQrSwQQYrrKSlVrnd1ZJ
 0eG2tbPAReecEyyy7XGMnVeatw5RYREdUf2UrYHP49/lL6eTKy02IyXnHyrT5vU+Ck4B
 9tVhZCOJmk3Ah0ZeXXDF2q+iALdLgsF/iVr4JY4CrHkXXJyTfFdOvHbbk57Bov6Vyjsc
 TAt9I1A/JPhTOIrXah2AWV7hbWaGc2FKxIxXoNvL2wmb1/KwtL+BPSba6hcFfZTEf2X3
 LPPQ==
X-Gm-Message-State: AOAM53091RksyIYM0v4fVM7+HsfjXpk4Z1thdLittuQwjDc5AWMHzmCO
 mRjbPILGKz8hNowOYYfEE34=
X-Google-Smtp-Source: ABdhPJwNw7tkzPZmngP9ATpz6Aqmnw4XwSr8wqcSLqr4AoEI0Q+9EtWOQ5FopwgNaf1mdEz7Fn1MUA==
X-Received: by 2002:a05:6512:b8f:: with SMTP id
 b15mr24260516lfv.443.1638628668340; 
 Sat, 04 Dec 2021 06:37:48 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 21/22] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date: Sat,  4 Dec 2021 17:37:24 +0300
Message-Id: <20211204143725.31646-22-digetx@gmail.com>
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

Enable S/PDIF controller to enable HDMI audio support on Acer A500.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index db388ddd062f..f47b946627c3 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -376,8 +376,16 @@ pta {
 		};
 	};
 
+	tegra_spdif: spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	uartb: serial@70006040 {
-- 
2.33.1

