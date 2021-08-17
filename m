Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C813EE23C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 03:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0496E09F;
	Tue, 17 Aug 2021 01:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F4A6E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 01:30:07 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id q21so8672516ljj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wojn7XneOlcjLQTZlMLpcmbGjIOEPaqexo+f2WGyphI=;
 b=Xq17kIc6GM80MD2xhnYjU7c3bLn4H5tuMTvcdBwNy9/g5psmoz3S1gVRRgj0w10xku
 S/OHY+MF1OPdTYbYPPJFPFeY4WU63WLX4lpEqf+XHRBxzSyKtJkRoLEZsNrLQUD3aJsJ
 hyYwTr0Z48Wws5sZA3cunYGug92vOCdPP0286zyvF+xLx0QRLRMNonrX8WWxK9M03w18
 x2KNq+2YuwXI/DgRg4TCi8S5zBrr/YRsvFRqgRHtf1EkBhMZn+P2C2QCgMgcjYbkv0RV
 MYPdW+7zuuviGgSMO06r+pSAqvsVA5K8VmFJ2RBZodvpwXKzfElGK+ZIvdNgJ/4RFBSg
 0SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wojn7XneOlcjLQTZlMLpcmbGjIOEPaqexo+f2WGyphI=;
 b=nwqymVOPXBQGkjyx+a9J8vc7dtrYfyH7KCXIfzcOS0N+TqHKFOYe5FeciGeZI5D0LD
 +OAhjKAOfJtKd/lPu32BPBcfUNtpvw5HxHy9HAR3pAe/JjiOKqxGEq6ukQq1xudRYNvV
 96oAKdpw8b4Ag7us/S+ljRJ6wWXSlhCvxsBF4blu/fPF1vckN3MkB/0fFty92Gx/yzno
 clWAgHjc7uG8tMOeQnH4aTwokAFbLs0T/kDEkc7B3VXaqSu0lwt8ExYEfL0fW53ZKms5
 5RXZ8yYJFoOggSBGAUxbYoapS9Rf9+0iqoRxEBxGGyyvIcKwt5xSnDoAbqJJ7C2T7fZi
 5CIA==
X-Gm-Message-State: AOAM533bxIypHXqnPcFvOpvN7DIyQH/zppbzIoR2fz1uSSx1A+7naFUl
 TTn8HMrl1l3Jd6F4B7HQwdg=
X-Google-Smtp-Source: ABdhPJzrAiKknpayvUXn0AhIlpxoa1tdB8UGRkYEeNvPAIQMKmclxsnV8VxQdGuN29ZUiGnqlWbG1A==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr848215ljl.23.1629163806184;
 Mon, 16 Aug 2021 18:30:06 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:30:05 -0700 (PDT)
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
Subject: [PATCH v8 04/34] soc/tegra: Add
 devm_tegra_core_dev_init_opp_table_simple()
Date: Tue, 17 Aug 2021 04:27:24 +0300
Message-Id: <20210817012754.8710-5-digetx@gmail.com>
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

Only couple drivers need to get the -ENODEV error code and explicitly
initialize the performance state. Add new helper that allows to avoid
the extra boilerplate code in majority of drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/soc/tegra/common.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index af41ad80ec21..265ad90e45a2 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -39,4 +39,17 @@ devm_tegra_core_dev_init_opp_table(struct device *dev,
 }
 #endif
 
+static inline int
+devm_tegra_core_dev_init_opp_table_simple(struct device *dev)
+{
+	struct tegra_core_opp_params params = {};
+	int err;
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &params);
+	if (err != -ENODEV)
+		return err;
+
+	return 0;
+}
+
 #endif /* __SOC_TEGRA_COMMON_H__ */
-- 
2.32.0

