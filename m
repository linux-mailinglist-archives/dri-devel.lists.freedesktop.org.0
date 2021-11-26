Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344745F1B4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F6D6F96C;
	Fri, 26 Nov 2021 16:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ED96F900
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:20:01 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 207so19670691ljf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=kzlqHTAdAhqx9uMFzd+CS4o7MQx3tt2NukcjKGssEu7kZMdW6fHarWUCrdqGzEAwPl
 fpuAPJ+zod57zNo+qtkm16mdGqs0Lh7iJJmFsIz6PMJ8AdXsA79F7/qVESlXK84AuKM1
 jATo9QykkskeMCYiqB+uKO0bxgT5WZL1Ni6iXRzMNQG1pph0oy763E1aOMuKM2wmLvQ5
 8ktA43IdTnoWWp/YlUGc4H9Jx+6+if72dzmi747LiVxyMPDfwsw+Wwj37c/TWmviZiFy
 1r77P+bQkb8YTtwu0AV9LbDAZQpvvyPyHhjYNAgOY211JJBMx6WUp/3/uGtrlDrdpbf5
 8t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
 b=qvEMPF0idw/Y4tbs+zJFbXY4ftfHiGiFNp8o8Yh3wuQa5NHCByyVvby5EvYDajD0b9
 vKvQEL5OnaNZJekzpjS1LldWmiAT/l6pkyEJ1FGBqAjqqRUQH6PyMCleKLRoYwgk11Ci
 m0HKMAWdCZISbQtJkxbqxsPdzFiTQAKXT364QVjEpcDp/Ceyn13uFeqCQYqfwjRuEca+
 6F52BMXry9lqGZxlitFzMMTF2wAMgiewL1EsEz1hq2BlkE5F9MLXz4SbbHzBUi3F5LVU
 ujqV6wFjrLxe+eDUOr/Yl2UnNYst/5S1xkIEBXOGpSPC7uk+Ro5WYb2GvF1zHBoE3kJH
 CR7w==
X-Gm-Message-State: AOAM532uYejhJcDaQpGFScZ4hZzB6MhNEqfAeneM08GL1ovsKIfBwf2c
 VJSTQDJFL5EVSWUvYIs0vu0=
X-Google-Smtp-Source: ABdhPJzxsTtZB9drLrB4WxixNDRQ7Fx6NNECUmkUX+4V5l25QUsz4gPwn3zgWqi6R9W+ucTu1kGc3w==
X-Received: by 2002:a2e:8991:: with SMTP id c17mr30947654lji.361.1637943599494; 
 Fri, 26 Nov 2021 08:19:59 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:58 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 19/20] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date: Fri, 26 Nov 2021 19:18:06 +0300
Message-Id: <20211126161807.15776-20-digetx@gmail.com>
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

