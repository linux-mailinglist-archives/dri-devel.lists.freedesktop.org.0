Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC81F4F22
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ACC6E3DA;
	Wed, 10 Jun 2020 07:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0666E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:30 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y11so23348307ljm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GpFtIVnKnNndfebpkGzqwkaxd/wyRN7pW9EKTYyaD+o=;
 b=ffYgl05pncbdubAvxWR63NSZaAmUmQNPcFogjQbb+PcGJRKuP8Iq/ynaiJSynit/xg
 keR+9mZfb+LT6ii5FdCO/lBy9nE/++3QDwTMdUwltsZ5pAKMoT9XYkt3z4nHItDpv3Ir
 0qmVkGd6cqv+vkib9r0Xd+yR8tOef58QmS/0k4be7cUsNgxeZ/jn+0LFdn6PFu6n14nt
 q7hPh1Jugmrq4m4erOiKWDXBLb2SCJylG30nC61UA3EcVkxpjArkVw8FpOrzQRtlghtI
 rtLoYVULmY1s8AakiUWvvvk9Pcm179rk9SFjhpkTk6vQCIKeL6zHGKzo+Ek/dkRR2DNB
 JG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpFtIVnKnNndfebpkGzqwkaxd/wyRN7pW9EKTYyaD+o=;
 b=Io7dw3RwfF814lsq36rqNTPN/wrsOzBxg9bJIzxns+A9EwEUQllkxUIru5Uqk7L59l
 ZX83hHDM3S7Wm3uGSZ2Q16DYajOOC8zFhmoi46gzi1ixzgpbj+0wC+jtRdErupxHbHTg
 ads3jr1eyszk1YyqRPwOphqk3lFscTJebA6HCR4wFqRht1l+DfMGRaeJTOcauhXb3HHd
 sya0ZK0TurmbRN5fWsJ3Kzn4a0wXXTdyvGtlVcjE4gT3SPJbXnSSgRV0HD8rTxIxItgC
 APIrKzbykTUKkjM/nIjnEOYRA2DHBkygoVPI0CS0+wUKR02pG8hZUtXNzstXmY0CiXKe
 H3/w==
X-Gm-Message-State: AOAM5316Bk0EujLL0ofjT96/WfPSHFRwuFj2G1vVFiZCcvQCpuCwhytO
 As8hEBARFixlZl7NxXHoCfg=
X-Google-Smtp-Source: ABdhPJxejwOTAdW+uqBjAbDKAokXmYlrwzxZ/NkKhjhobM21Hk8tYt+VAfsUsH4qHeMB+LmaIWHrgQ==
X-Received: by 2002:a2e:b003:: with SMTP id y3mr13797412ljk.78.1591708468663; 
 Tue, 09 Jun 2020 06:14:28 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:28 -0700 (PDT)
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
Subject: [PATCH v4 03/37] clk: tegra: Export Tegra20 EMC kernel symbols
Date: Tue,  9 Jun 2020 16:13:30 +0300
Message-Id: <20200609131404.17523-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
