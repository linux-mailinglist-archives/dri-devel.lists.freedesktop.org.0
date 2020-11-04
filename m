Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616DE2A78E2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568966E9C7;
	Thu,  5 Nov 2020 08:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE316E239
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:50:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y184so26066387lfa.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XpnLgrE/KIZ6J0eMhnY4ffyEk5qfjR4pbUa1URS1+kQ=;
 b=eT9AdSwY6QmiNL/vh22cX2gun3H6hYmlPxQL21b8k+N8lGwXf8hg+x01H6hGJJeSD2
 9EUrNpzI68qPfbP7bk+MnfoB63VGTSIdAMnZzp3WubJ1CTvOv/OfOLyBokFQIwsehqB8
 ULSI7PNCmlN7nmqhypp5A72fF2k2sTJhCXh99djwo5UGum+j4isMp46NypiO+NSbi9/t
 8QlRzYPcWiw2iHnSmCYHCWPfulcYnIvR/UMJLgI9MiJg8p1U7OzO8qzrvOkDXel1O+JO
 wgnvfAyIz//nPWaC2agyavBrK6rLDeIESmugfMPjEAp8BuUyXRArlh/HsYZQBZPiHhtl
 cPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XpnLgrE/KIZ6J0eMhnY4ffyEk5qfjR4pbUa1URS1+kQ=;
 b=ozGDhdFt/TE3fxizjdugAX05WtG2OFL7Ocdl5T0IDiyHMKzczDbpi4xZwU4XfklwXp
 lgOXatBNBq+iAJlpdfcfcs2XuvQbeHERirKtw2f0VOAuK9eRn7qAOfJv0tzEDT1HSKnO
 Uj8TqwtYin/lQJGDf5e7IyOYG8K1afX2F2/87TgY644ZQygxaClHBWRy5HqenYPjXyi+
 FjWaDLm+L+dfAs3pd1FLEMKeZPas/jna8xaYyHHxuk2opLq0J76+12a6RXHvpRBKrcCP
 ICdnzK/dw8oB59kmuas1QgHW1WdIVza61rISHaL4Wy3xlYU9mqcle6UC+FFcLZH9Lh8r
 zpGg==
X-Gm-Message-State: AOAM531vom/dV35tZUKDpe/lFaOYUSRQspPyq3JUDEVboSX4jp29hODf
 PsdZUxdxvpG8/LrMvWb2UK4=
X-Google-Smtp-Source: ABdhPJwi0Z2sWnIE3B1pjc2HPoqa6Q3lOJz48bunHlnvZxcpP08LOm7VVfPYpiy7FyQK5rHj4Z6xiQ==
X-Received: by 2002:ac2:5b50:: with SMTP id i16mr1164553lfp.586.1604508606218; 
 Wed, 04 Nov 2020 08:50:06 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:50:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 30/47] memory: tegra: Remove superfluous error messages
 around platform_get_irq()
Date: Wed,  4 Nov 2020 19:49:06 +0300
Message-Id: <20201104164923.21238-31-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:03 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform_get_irq() prints error message telling that interrupt is
missing, hence there is no need to duplicated that message in the drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c          | 4 +---
 drivers/memory/tegra/tegra20-emc.c | 1 -
 drivers/memory/tegra/tegra30-emc.c | 5 ++---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a72cdcafc933..998f9148ecb8 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -707,10 +707,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	}
 
 	mc->irq = platform_get_irq(pdev, 0);
-	if (mc->irq < 0) {
-		dev_err(&pdev->dev, "interrupt not specified\n");
+	if (mc->irq < 0)
 		return mc->irq;
-	}
 
 	WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 5ba4e495bfc3..c9fe58a724ee 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -665,7 +665,6 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(&pdev->dev, "interrupt not specified\n");
 		dev_err(&pdev->dev, "please update your device tree\n");
 		return irq;
 	}
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index c58cf31cb27b..1be28e28ec34 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1299,10 +1299,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 
 	err = platform_get_irq(pdev, 0);
-	if (err < 0) {
-		dev_err(&pdev->dev, "interrupt not specified: %d\n", err);
+	if (err < 0)
 		return err;
-	}
+
 	emc->irq = err;
 
 	err = devm_request_irq(&pdev->dev, emc->irq, tegra_emc_isr, 0,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
