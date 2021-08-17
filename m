Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D33EE308
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0D56E0D5;
	Tue, 17 Aug 2021 01:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E86E0CB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:31 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h11so30163997ljo.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTCou3UurEHV7YLdOGz19ZZUGkyul1DSrpGiIEhL7OQ=;
 b=oZOWmSQ6Yi/kpa5FA17tchIXai6cZ6FYXfi5VUcDWhbSwAt1HSWn008MgM/aiICsg8
 zHM1PvsZHwO2A3BGEfjuiklVFkD7GHeU6PGa/lQRRBon8BE3ugSrQd82YHE3DZgJEzVf
 AqC7Kas9Ry7PlGhUKUxjswrs2FoHfOCkiB3lgxkPFblOe9m6Ww+4c+RF6E0fHmRtyKtA
 +LkOFOQGIKphhmvQ5rwUGitl/Z8mtfKwiV8NnTSzBUVP6inaNczYN81VEktoGAtsNKH+
 zlBj9IkOQgExUC/AYQtAPz6whT8Hpvd8Mmw6aTrIIGSmnFvVfJJCKiYtfPZZP7aM1e0i
 y5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTCou3UurEHV7YLdOGz19ZZUGkyul1DSrpGiIEhL7OQ=;
 b=RpC+Oy3TAFDP4EQHPINj5UwlYEtcjAZ2dPuk7eSbrldLRqvZ7UPs0uyBxVXcOXi+HP
 Hm1ctuBUKTu0cXTz0P3bUKTPi5WxiU+xgyEo7Znq3/zuGcSX97dv91QbRXZZl0r9TggZ
 d9kXXOBATuBj4gVrQUsb9KxuKoTV9tRCW09AwGVoYsI0kLFFr56cKK66udo+YBWmCfIs
 y40dTv3qcK51qsQLzwnzSWLfmAy9+VQ2AcNzFXJ4kNUzvPJ41WioF28HgCoug6HKjHLS
 OmWCDPFjNv4er6MLNh3aIy4NZPaJpKgpy44Q/N/o4KB8gNjAY6Pdm+N8s6BNqGGYrHjj
 X+Bw==
X-Gm-Message-State: AOAM5307t3zRvx+f5KkC3ZZtyJoIvxwJc27RWMy1AV7SA14zDmu82j/r
 KgpI1Brvt+15JMgNXR4OIVM=
X-Google-Smtp-Source: ABdhPJwmXv43Hy5YpglFUbKUv/JYz+Oo4m0Sl5Pv0TPgaWv+ts8g0lRrsP7oeNzONedoSB1l81a35Q==
X-Received: by 2002:a05:651c:160f:: with SMTP id
 f15mr859411ljq.43.1629163830104; 
 Mon, 16 Aug 2021 18:30:30 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:29 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v8 24/34] media: dt: bindings: tegra-vde: Document OPP and
 power domain
Date: Tue, 17 Aug 2021 04:27:44 +0300
Message-Id: <20210817012754.8710-25-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new OPP table and power domain properties of the video decoder
hardware.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.yaml  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
index 3b6c1f031e04..0b7d4d815707 100644
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
@@ -68,6 +68,16 @@ properties:
     description:
       Phandle of the SRAM MMIO node.
 
+  operating-points-v2:
+    description:
+      Should contain freqs and voltages and opp-supported-hw property,
+      which is a bitfield indicating SoC speedo or process ID mask.
+
+  power-domains:
+    maxItems: 1
+    description:
+      Phandle to the SoC core power domain.
+
 required:
   - compatible
   - reg
@@ -104,4 +114,6 @@ examples:
       reset-names = "vde", "mc";
       resets = <&rst 61>, <&mem 13>;
       iommus = <&mem 15>;
+      operating-points-v2 = <&dvfs_opp_table>;
+      power-domains = <&domain>;
     };
-- 
2.32.0

