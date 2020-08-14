Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4A245D21
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC45C6E4CD;
	Mon, 17 Aug 2020 07:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D726EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:04 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id k13so3961942lfo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzwPBWKoPZ93pmT563Pm8pvnNRCDr3XhtwSAAffNp+g=;
 b=vW8RyoKXC5N6mmAV8wm0TZ8yPsu/Ji7O2Cn13Bd79Cd42Pb5GaNBLUjJmyc6waWyzc
 WazNsjrYQQwh6Zxn9fuMfDsIoixjwivKaTv+9Grqarjo4WpmNZHX/sJgxqpZtvPKZhju
 lzlD8dkqJaUA5Tmm3q2mWvRg2plL3Pge0W20QBJCUc3AsZ44Yv6owL1CZmziVOdpkAh8
 BnFXQ4/nhwNwSOS0aN3cIsQtrs9S3F6sp57UTuCX0ZE+ohNxhsUTSgxCUzDfrXSs4xo9
 Fn80+b2XW/Wg0Nh1Gcqgr01NUljvYVRy2AxyZnTDSIreIwxQ8SoYZYBnpe2TrObBw42u
 9eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzwPBWKoPZ93pmT563Pm8pvnNRCDr3XhtwSAAffNp+g=;
 b=GVvsOfX7hs9+zWRLbnpTPE5ruKCYfHBoy0Su546pqZOaRfPTL3PuljHU7U0fr03Rbu
 ConkvpmPQCd6tYRL2w1ghf14YzwmS1C/0SQFarnGg1HhDJZ4EdJnrMsilv6/rkM81UoX
 XCXGiXb/9vaJqUcclaDur0TkN7tlMd77+WkHi7tVGfTOKnGJl4alAsgT/OwF0DU9sH1S
 vDvZseB8h4i/XbAJTvMKPdxLl+BlPk8kHCdLCCFFy8CwzpaAwgk5Xf+ooBIK4Hf1hWUH
 xKxk8ZhBspwv/OHHQAlJDYQ/Re32Sitl/+LuQ528qOp+pHMaxIqweFzGfkOAjPihX9gd
 meDQ==
X-Gm-Message-State: AOAM530lUsTZox+MxQb15Q5A2qq5ExsiCGlSfLv7J6DkyaVIwpuQRkAD
 nXrR6tdsiUA4N3KhYO2AGEg=
X-Google-Smtp-Source: ABdhPJyzug7TO+hMI9vCnuMuqXozGMwz0dka1d8pWNh3nWAb7JbR6TfWED153vnUZj7rM65tQ/DdRw==
X-Received: by 2002:a19:8295:: with SMTP id e143mr425088lfd.95.1597363623205; 
 Thu, 13 Aug 2020 17:07:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:02 -0700 (PDT)
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
Subject: [PATCH v5 02/36] clk: tegra: Remove Memory Controller lock
Date: Fri, 14 Aug 2020 03:05:47 +0300
Message-Id: <20200814000621.8415-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

The shared Memory Controller lock isn't needed since the time when
Memory Clock was made read-only. The lock could be removed safely now.
Hence let's remove it, this will help a tad to make further patches
cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-divider.c  | 4 ++--
 drivers/clk/tegra/clk-tegra114.c | 6 ++----
 drivers/clk/tegra/clk-tegra124.c | 7 ++-----
 drivers/clk/tegra/clk-tegra20.c  | 3 +--
 drivers/clk/tegra/clk-tegra30.c  | 3 +--
 drivers/clk/tegra/clk.h          | 2 +-
 6 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 38daf483ddf1..56adb01638cc 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -177,10 +177,10 @@ static const struct clk_div_table mc_div_table[] = {
 };
 
 struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
-				  void __iomem *reg, spinlock_t *lock)
+				  void __iomem *reg)
 {
 	return clk_register_divider_table(NULL, name, parent_name,
 					  CLK_IS_CRITICAL,
 					  reg, 16, 1, CLK_DIVIDER_READ_ONLY,
-					  mc_div_table, lock);
+					  mc_div_table, NULL);
 }
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index bc9e47a4cb60..ca8d9737d301 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -134,7 +134,6 @@ static DEFINE_SPINLOCK(pll_d_lock);
 static DEFINE_SPINLOCK(pll_d2_lock);
 static DEFINE_SPINLOCK(pll_u_lock);
 static DEFINE_SPINLOCK(pll_re_lock);
-static DEFINE_SPINLOCK(emc_lock);
 
 static struct div_nmp pllxc_nmp = {
 	.divm_shift = 0,
@@ -1050,10 +1049,9 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
 			       CLK_SET_RATE_NO_REPARENT,
 			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
+			       29, 3, 0, NULL);
 
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
+	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC);
 	clks[TEGRA114_CLK_MC] = clk;
 
 	clk = tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_base,
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index e931319dcc9d..0c956e14b9ca 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -126,7 +126,6 @@ static DEFINE_SPINLOCK(pll_d_lock);
 static DEFINE_SPINLOCK(pll_e_lock);
 static DEFINE_SPINLOCK(pll_re_lock);
 static DEFINE_SPINLOCK(pll_u_lock);
-static DEFINE_SPINLOCK(emc_lock);
 static DEFINE_SPINLOCK(sor0_lock);
 
 /* possible OSC frequencies in Hz */
@@ -1050,8 +1049,7 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA124_CLK_DSIB] = clk;
 
-	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
+	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC);
 	clks[TEGRA124_CLK_MC] = clk;
 
 	/* cml0 */
@@ -1518,8 +1516,7 @@ static void __init tegra124_132_clock_init_post(struct device_node *np)
 				  tegra124_reset_deassert);
 	tegra_add_of_provider(np, of_clk_src_onecell_get);
 
-	clks[TEGRA124_CLK_EMC] = tegra_clk_register_emc(clk_base, np,
-							&emc_lock);
+	clks[TEGRA124_CLK_EMC] = tegra_clk_register_emc(clk_base, np, NULL);
 
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 3efc651b42e3..2f8b6de4198f 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -802,8 +802,7 @@ static void __init tegra20_periph_clk_init(void)
 
 	clks[TEGRA20_CLK_EMC] = clk;
 
-	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
-				    NULL);
+	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC);
 	clks[TEGRA20_CLK_MC] = clk;
 
 	/* dsi */
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 37244a7e68c2..88e8c485f8ae 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1042,8 +1042,7 @@ static void __init tegra30_periph_clk_init(void)
 
 	clks[TEGRA30_CLK_EMC] = clk;
 
-	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
-				    NULL);
+	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC);
 	clks[TEGRA30_CLK_MC] = clk;
 
 	/* cml0 */
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 6b565f6b5f66..5ed8b95d331c 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -136,7 +136,7 @@ struct clk *tegra_clk_register_divider(const char *name,
 		unsigned long flags, u8 clk_divider_flags, u8 shift, u8 width,
 		u8 frac_width, spinlock_t *lock);
 struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
-				  void __iomem *reg, spinlock_t *lock);
+				  void __iomem *reg);
 
 /*
  * Tegra PLL:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
