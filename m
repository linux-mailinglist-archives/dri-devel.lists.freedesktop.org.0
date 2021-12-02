Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159F46680A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8274F6FB48;
	Thu,  2 Dec 2021 16:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAE06FB41
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:35 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z7so38453607lfi.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=aAmo87x7MKY0+QkIiV1iYDAGkJpjUtS0nLp1b76Wocjq5LssoGlpY86GAohlboJ8Xx
 PpEV5/ex7E5NW1eoaI3yz6HBQt6qke3IzgiWVpYQOrfDVPLMcWsLt4fZ/SCvocWuWqbP
 kEv+h49CXlKWcQhzjoXBthjasMcdyBUZNY3N4mVCPj707UAa9TToCOvF0yX1+hVoAk1N
 hH7A3ZmokIyA0KxpI/ka5AQp5I8+9P7u3sNOoscPnwd9sk1F1SmALlJkWw4N9Pl//x2T
 yrFfMoKYJGCgMRH4Qh/iOVBKDWY8VdMjsg+kKpjl+HGy0oZblGHVebwNkkG0cLEURfVe
 p3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=MWFd4q6XxBs/rI7OYs9Zl+urh3LvWfkvlj8hVMYM4CRcg1Wtf7jYjYk1Ol4o4XhzkC
 g1Rej+KRcgeBL/5emTwnKL70OTUHtR+aCHs27aqYnc+uzWaYYeDbipstkJukLRrm0bpJ
 uFllI+jEo88y7w7nnj5EPDvc10bIoPpFzuBJVMk6qnQu9e0IMn8wpxuO9oveJ9zdkXO7
 QT1fhDl09LTaQFcPpdiGj2PQPglv1osyD4Wg85CZCcZ73s0wM2NUATrs/RjaNLud8Ikb
 F47uZx+DRe4GF+ndGwUYd6PhG37QGZ9lT0JiM2OzCtcNeTSp/6WyQJ4+WvCvzr4y928F
 dRUg==
X-Gm-Message-State: AOAM533WgzzMd8swIaHz8R86qewUkJJguKMwnAR4BvinmSr7BqCt5DHa
 tNNvF6HKQ2YHNmlOemdIB8g=
X-Google-Smtp-Source: ABdhPJxCY0oVQ8aH83x+4OlvUDxHC37p5YyeIHFpmCbaFqheC4dbnYNMwVyp5NGlNDxLxHNpXrhAQw==
X-Received: by 2002:a05:6512:138a:: with SMTP id
 p10mr13129433lfa.508.1638462333467; 
 Thu, 02 Dec 2021 08:25:33 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:33 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 19/20] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date: Thu,  2 Dec 2021 19:23:40 +0300
Message-Id: <20211202162341.1791-20-digetx@gmail.com>
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

