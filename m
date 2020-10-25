Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C482987BF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04F86E83D;
	Mon, 26 Oct 2020 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959736E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d24so7704740ljg.10
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8WUsWu+WDkJcn4CeG8tWfLig6GMVsRbCZOtSjwc5GA=;
 b=uOiJ83Ab/HUSvRlO5J2M7nAN56/Fkm/YLCjuQB4FNn+rI+eMKxxQgtnWzeuzRAq5tA
 rCTGY4mOJNfJXFlA+6mOUNR8kMdxGsMO5HywGojjtkkVjnsJyLBd/2n/nu/IG3iEqJd8
 VISEJp5k89hHlTwknTwfEIyAMDJdI6J0vKMj0rjdpnaAkYVIyzsWmbsPQuKoniJ4ZHY/
 ybS1wcn+Ij2OFA5opFnvWFb5Gitg7bjREx50SnbwWo4/mfn6M7byfKlAec3fw7bRftO8
 3X6HdhQQDxu/NM4r8lzUNr86Q/usHhVhhQ8sUaN9eKUDuiyTW3KQaBER6yrr8zGdyqvG
 S6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8WUsWu+WDkJcn4CeG8tWfLig6GMVsRbCZOtSjwc5GA=;
 b=A8pA94w5tnyUifFag3NuZzWcy1doLGIgl8bSgSBdAkEBu/9V/p2Nmw8yI9ctZn0zE0
 g5CrwepvcvypCSJm4ypXHXnL4bdpEeaAaQVgFGrFGwuFfxYU9406FWQgIv8ExwsPw1rv
 MUa7SkeyFW9CXmkofk9ITxt40HVTHbwVkA7B+wH2BoG1pkhmAngX4P/1Fl+s1GTqOh+c
 mffcWhaxp2It0EN/zZCryPN2sb/hqEijTAtVfSxBeicDpsrQmDtRsOAlqqOc/ly8PBPB
 o8Or5ZcWZW6i6XFQkn0QIbX8VleUm+IaRO1PMCba/AD2erlUSEX76jCCIaJIBWCuLxVZ
 SOjg==
X-Gm-Message-State: AOAM533lx5+nTzPHiXMv35zfqsaPc4r/W8UVgLHQenSTdTmpCjndixVI
 shwuCPd19A70J3P4Ei1wUtM=
X-Google-Smtp-Source: ABdhPJwHKIyuwDeTFmyp2q3zTLbU7HZciLx18JOBVb3ayyd5qKamxiFgAe+YEQNLOvbrCHzupiN4jA==
X-Received: by 2002:a05:651c:1307:: with SMTP id
 u7mr4495342lja.39.1603664270018; 
 Sun, 25 Oct 2020 15:17:50 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:49 -0700 (PDT)
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
Subject: [PATCH v6 01/52] clk: tegra: Export Tegra20 EMC kernel symbols
Date: Mon, 26 Oct 2020 01:16:44 +0300
Message-Id: <20201025221735.3062-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
