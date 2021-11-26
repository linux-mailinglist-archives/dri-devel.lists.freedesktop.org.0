Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FD45F1B6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA606F968;
	Fri, 26 Nov 2021 16:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1A96F91D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:20:02 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id j18so6527444ljc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=oTcerw3jboBSgaI5lBASiQ0+yvoxajfozbWkKUsSmofKDE934IXHDdxNhB8W9inQH8
 Deth1OvQaNwgcuyT1EYOl7z37XeRTOtofk3rfAARsYrFqOpJrZaMP2yWgRj3wWz8rhOS
 c9Dce6wjkImXLFLe+QdB7nP22gzehsMpGLBEEMDo0XSy8AW6kq9BhVWDy3FC77Jlsbrv
 NXnqGvMr1srJooL0mlDZs8j2QAzGmCQDiJde7E6dgpDRF550dE9c1UQxnnqLqUJtU5t6
 jyg7JecYzESPBU3YZ5QeRjpyQX3JKtntQB7xj3ORrmWmqbKeewF4FQ6LCWyGzgfuLizK
 K0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEN8lxqzB5PkjPszcdUxNpJc6epYJF7n5YUfahDhZts=;
 b=jyW5jVPDodvJ60fbBHZB4FTlBRyMXFyyDObqbeegGUVjDLLuEYaijyH2hPBeW85rI8
 9AIZIL81nVw4iHt2ORTPQeEmSGQ/+IuxzTVrjJB15xDAIpO7JBVxJv9TWqVuCccoRNTk
 ygvda5E1tsas+z+RV7hZgJWIu9e/CwCPrH2qKZY5m9kibdD2HZcngDQikWdlBjF6V3Ng
 +RdSJaZ9xAFkkdoUBxKi2d8RpC7kujA8iXUmuK+x/KVmxhlSBALTVGnEiclyWWa2wV+q
 lv120deWYetD4eH+DZlmeK88IAtXRsWQ/zcSXxppWDZcxxY0Z+yhQGoflWmX8NVVxUGR
 DBfg==
X-Gm-Message-State: AOAM530vgzenbiTk+/+dW5BGd42exqLrJOPBdEtyZEAD2Ij5jCXmpgbp
 fv6ZwmqMIEiQvor84R3jMDY=
X-Google-Smtp-Source: ABdhPJzz5wBDSCE4Eo1QRQj2umu9yNSwj9Kxjmg73qAOgEls3WYa2Hilna7xfBmiFLf2MVj1rIyQ9w==
X-Received: by 2002:a2e:a792:: with SMTP id c18mr32236469ljf.443.1637943601285; 
 Fri, 26 Nov 2021 08:20:01 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:20:00 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 20/20] ARM: tegra: paz00: Enable S/PDIF and HDMI audio
Date: Fri, 26 Nov 2021 19:18:07 +0300
Message-Id: <20211126161807.15776-21-digetx@gmail.com>
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

