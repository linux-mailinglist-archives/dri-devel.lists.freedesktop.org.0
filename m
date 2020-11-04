Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9202A78D3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026616E9B9;
	Thu,  5 Nov 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3D489D9B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:33 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l2so28077843lfk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=crJJm+NJzX9nNGfEw3yeviT1h3BYRo8BzSQA7+fLOns=;
 b=GIW9qAMdCMH2xtWA68F2XwDqytaBnWVGD1ga01N0NTSOrl8CxFhZbSLz8FlPcfkY4K
 bxTV5U0FHL8cHzww8fIOe8gSlFw/OLqA3ZpsoY409KGElyH+1hlYCoraDe34iD1UD6R5
 wwS184NUI/ja1ZjaVJ6YMG2H6jFK9vLQbEAJc9gSwL6Scp8P6H94gezgbYiX6Nk8ZD6J
 3UuP+REx+n65fzrGi4UjHJynleoqj1NAnotzHg79F9IUHz+bCPkmM7DBtenNvsEsszkI
 QoMas1l7Z27AQ8YN7AONii81cQbJBeladQanNyUuzDn1hUY9lRjzOSPlxEfAoqwr30qS
 4P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=crJJm+NJzX9nNGfEw3yeviT1h3BYRo8BzSQA7+fLOns=;
 b=dbddp4j1qyRGCPL0jL3hSCyj0DLOv2gzFpE7zWRQWLbs9gWT7S894ycHhbgUhtso1T
 jyiv0Oxm6N5+pYR07D17+UDfZiNh5LJnR7KqYOY+R1kqSYYYzjZAi6gaee8hqlYMJ4z2
 4k7+1rFMGBRJA1J78PMr+8slnaivP7Nz6fon/6SMNkuJZvYzaYIzdIceg7Knvqt9wXme
 BJGqcTMSpHFBx5C6aENjA437jLS9oTfgw8P0LpTAZW60Sr/TLaulxWxOxM7pMLn2U0M0
 Spurr3Doc9J+/AHlG/+FpF9RsU/oC8xoXEs6n6eJjV4LKqigOUWr32pZl42JqtiFNv2t
 JNjA==
X-Gm-Message-State: AOAM530fXxhdcMlcpxTTyQ6cSBC9teYZ4XjaC5SFDOM9aN1G+25S0ppx
 hVeKBeiyGMl5h9Bm5SE7H0Q=
X-Google-Smtp-Source: ABdhPJxOl7/JqZ7qhE8E22tCWDcsvDG+RX5n/zXPK169JDaNrnMVeePskTl+GlbctB+qjSNT8+N+vQ==
X-Received: by 2002:ac2:5938:: with SMTP id v24mr9168385lfi.228.1604508571556; 
 Wed, 04 Nov 2020 08:49:31 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:31 -0800 (PST)
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
Subject: [PATCH v7 01/47] clk: tegra: Export Tegra20 EMC kernel symbols
Date: Wed,  4 Nov 2020 19:48:37 +0300
Message-Id: <20201104164923.21238-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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

We're going to modularize Tegra EMC drivers and some of the EMC-clock
driver symbols need to be exported, let's export them.

Acked-by: Thierry Reding <treding@nvidia.com>
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
