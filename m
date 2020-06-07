Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90BE1F0F26
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529DE6E42C;
	Sun,  7 Jun 2020 19:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3886E19A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x18so1287948lji.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GpFtIVnKnNndfebpkGzqwkaxd/wyRN7pW9EKTYyaD+o=;
 b=dVzKPShw4KgOD+DsB7SciXodU7w9VUVFbPFuBaWR1s1z0scCvNhSx+hpw7DAJwTx/O
 YXrQ3c7MVoaaRHpVLS7AvmJvyu/ZpsNv0KE89n0nu0ifIdn9S7AruNCHTTpTzT33pB6U
 Ka4/FclAqOgc6eMWkhNE2AefzhqucIaXMO8JtuxQZC6PM/6fmHERV+dTjkKyTnBEUZ4P
 WXfUE3bmKN7JQF+8kpAnyMy9DpCKvYHxvacGsSaMssAinTqBr6DnxGfYTw+Rb43NX8/X
 CH6zbNCCOfnGM54v56VMS5BzpkU8HArHeCfU6yGw/GtdGDo+XW3kYwyA1/suXSHcuQCD
 6/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpFtIVnKnNndfebpkGzqwkaxd/wyRN7pW9EKTYyaD+o=;
 b=lKTa37tlIlhKgdwK9m7XnS5wEaIQrqSy7VGsN8dPLwwRzEgLz5t6l13OXBWuNx0iRx
 ajt3fxef0gSeorgQS1sUMTniE9PBJejvuu9UWFr6iQm2jGbrFKtje2u4jZFjDB8vvzTG
 BRV0FUmFuPrHTsdptv/SfVaqvZfiDzfZcbPmt0yojGkvwsc+BJO/vTTF31x1aHwp1xgS
 3JDPhpAXpvVH+mmCA/RFfoqLSAIxogPXr29a2kVW58eUVlfqp9uq9MeQcxMdGBp5oqLA
 SIiJ9LmgyJtjcEMdIqCz15IEDwCPWXc/37Cjl8GMXdI0KTuHPClON+/cSnzsyCB3HeG0
 d+Lw==
X-Gm-Message-State: AOAM531B14qk2zxPpRrcPyxgr2W+9Og0TJlyNxHBM3z3U+Lznsty+Xs2
 xfYNLfsjYnjLV/0FKv+eCsQ=
X-Google-Smtp-Source: ABdhPJx9HQOg7T9G9DNZloItTqEpDE+zxBogAZlWstcxnU5tM6I+j0lUX/A4nl13lbKimVaBTwXU5g==
X-Received: by 2002:a2e:6f13:: with SMTP id k19mr10267726ljc.364.1591556233270; 
 Sun, 07 Jun 2020 11:57:13 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:12 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v3 03/39] clk: tegra: Export Tegra20 EMC kernel symbols
Date: Sun,  7 Jun 2020 21:54:54 +0300
Message-Id: <20200607185530.18113-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to modularize Tegra EMC drivers and some of the EMC clk driver
symbols need to be exported, let's export them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20-emc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
index 03bf0009a33c..dd74b8543bf1 100644
--- a/drivers/clk/tegra/clk-tegra20-emc.c
+++ b/drivers/clk/tegra/clk-tegra20-emc.c
@@ -13,6 +13,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/tegra.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
@@ -235,6 +236,7 @@ void tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_cb,
 		emc->cb_arg = cb_arg;
 	}
 }
+EXPORT_SYMBOL_GPL(tegra20_clk_set_emc_round_callback);
 
 bool tegra20_clk_emc_driver_available(struct clk_hw *emc_hw)
 {
@@ -291,3 +293,4 @@ int tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tegra20_clk_prepare_emc_mc_same_freq);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
