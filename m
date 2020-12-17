Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342402DDF99
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2177889AE6;
	Fri, 18 Dec 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8336E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m25so59782350lfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WXjXizUjsg5w3O7R5vXqqgqwgNlcEIO/0hxLGcLi20=;
 b=oDYRBmT4f9BXGGF1qH9XbXM0SDEIliCuMBcsk9a0TpWrcT2n3YifuqbSYV5VmZOzP7
 v6j1GZk/S9LAH+MC429g9DjYNGSc5YFsub51dTb3Xq5nYrv+T2gIOecawbDUKiYH95Hv
 cqxii5YbkWCET5EYaXo5mS4stQK/rTYM0lJT12TqJhxGutPkKWJuZ0jzQyMLededZ2/0
 xO3REVj3PYX39o8Hw7aULKePNY4KOAuL8BhePo5zZk2/YhzFQpbyaFPnyJnt4TbGejnl
 LpE7W9u3f4rS4zr6kOCGDZZ+Dc+LO5h60X7B8XXasfLO4dvC9ZAEvy/5hJOdCcCWYNGs
 l2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WXjXizUjsg5w3O7R5vXqqgqwgNlcEIO/0hxLGcLi20=;
 b=YfRweoco9rEjKpc40Vp0Y4WZYumZOw5vFRDVTm3vDhr0HM3vrP9NFdysm1CDlt4SSY
 awgIsuy+GJWEuZjFxi304fVkjl3EmulwLAU462rHW1pusuyO2QcMkYTjNaRVa62MOyOM
 FWUk16iA2hDcxGgrEBp3kh82rQ96IeWHtp1bSCCFBigthjrSWqfBQJhyA8fo1msKr58+
 zZ4LFV1AuRgcZpBuSalh97xOGIoEnrUuDg1F+pu+a0VKw6cPwCobf0df5N9ajXut00Et
 VCHd5EJKKxkT5HxZNnZzajM5uPA1a6GwcEFZKqWYgZagrO+p0DsEqZSxG+sqgRXR3bPB
 lQXw==
X-Gm-Message-State: AOAM530TceDCudw7TPH1F9rDkYPDUQch21TPYMGLuS3pipW59KkTUON1
 isE5QbrDHxZdETyRgVVuteI=
X-Google-Smtp-Source: ABdhPJxiXSt4u8WL5UkXhdZnJ3XmhVkUqHbinsCdjQMAu5GJImS8J4Mh7HjU5F3dtquP+5koDmMqDA==
X-Received: by 2002:a19:c18c:: with SMTP id
 r134mr14956539lff.428.1608228477044; 
 Thu, 17 Dec 2020 10:07:57 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:56 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 32/48] clk: tegra: Support runtime PM, power domain and OPP
Date: Thu, 17 Dec 2020 21:06:22 +0300
Message-Id: <20201217180638.22748-33-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Clock-and-Reset controller resides in a "core" power domain on
NVIDIA Tegra SoCs. In order to support voltage scaling of the core power
rail, we need to hook up some clocks (which can't operate properly on a
lower voltages above certain clock rates) to the core power domain in
order to ensure that a proper core voltage is maintained.

The clocks are registered very early during kernel boot when the driver
core isn't available yet. Hence clk-device can't be created very early
and we need to split the registration of the clocks in two phases:

  1. Register all essential clocks which don't use RPM and may be needed
     during early boot.

  2. Register all clocks that use RPM (and not needed early) at a later
     boot time, once driver core is available.

That's the reason why this patch reshuffles registration of a few clocks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/Makefile           |   1 +
 drivers/clk/tegra/clk-device.c       | 222 +++++++++++++++++++++++++++
 drivers/clk/tegra/clk-divider.c      |   2 +-
 drivers/clk/tegra/clk-periph-gate.c  |   2 +-
 drivers/clk/tegra/clk-periph.c       |   2 +-
 drivers/clk/tegra/clk-pll.c          |   2 +-
 drivers/clk/tegra/clk-super.c        |   4 +-
 drivers/clk/tegra/clk-tegra-periph.c | 140 ++++++++++++-----
 drivers/clk/tegra/clk-tegra114.c     |   1 +
 drivers/clk/tegra/clk-tegra124.c     |   1 +
 drivers/clk/tegra/clk-tegra20-emc.c  |   2 +-
 drivers/clk/tegra/clk-tegra20.c      | 123 ++++++++-------
 drivers/clk/tegra/clk-tegra210.c     |   1 +
 drivers/clk/tegra/clk-tegra30.c      | 133 ++++++++--------
 drivers/clk/tegra/clk.c              |  89 +++++++++++
 drivers/clk/tegra/clk.h              |   7 +
 16 files changed, 568 insertions(+), 164 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-device.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index 7b1816856eb5..a0715cdfc1a4 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y					+= clk.o
 obj-y					+= clk-audio-sync.o
+obj-y					+= clk-device.o
 obj-y					+= clk-dfll.o
 obj-y					+= clk-divider.o
 obj-y					+= clk-periph.o
diff --git a/drivers/clk/tegra/clk-device.c b/drivers/clk/tegra/clk-device.c
new file mode 100644
index 000000000000..be4143c4c99a
--- /dev/null
+++ b/drivers/clk/tegra/clk-device.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <soc/tegra/common.h>
+
+#include "clk.h"
+
+struct tegra_clk_device {
+	struct notifier_block clk_nb;
+	struct device *dev;
+	struct clk_hw *hw;
+	struct mutex lock;
+};
+
+static int tegra_clock_set_pd_state(struct tegra_clk_device *clk_dev,
+				    unsigned long rate)
+{
+	struct device *dev = clk_dev->dev;
+	struct dev_pm_opp *opp;
+	unsigned int pstate;
+
+	opp = dev_pm_opp_find_freq_ceil(dev, &rate);
+	if (opp == ERR_PTR(-ERANGE)) {
+		dev_dbg(dev, "failed to find ceil OPP for %luHz\n", rate);
+		opp = dev_pm_opp_find_freq_floor(dev, &rate);
+	}
+
+	if (IS_ERR(opp)) {
+		dev_err(dev, "failed to find OPP for %luHz: %pe\n", rate, opp);
+		return PTR_ERR(opp);
+	}
+
+	pstate = dev_pm_opp_get_required_pstate(opp, 0);
+	dev_pm_opp_put(opp);
+
+	return dev_pm_genpd_set_performance_state(dev, pstate);
+}
+
+static int tegra_clock_change_notify(struct notifier_block *nb,
+				     unsigned long msg, void *data)
+{
+	struct clk_notifier_data *cnd = data;
+	struct tegra_clk_device *clk_dev;
+	int err = 0;
+
+	clk_dev = container_of(nb, struct tegra_clk_device, clk_nb);
+
+	mutex_lock(&clk_dev->lock);
+	switch (msg) {
+	case PRE_RATE_CHANGE:
+		if (cnd->new_rate > cnd->old_rate)
+			err = tegra_clock_set_pd_state(clk_dev, cnd->new_rate);
+		break;
+
+	case ABORT_RATE_CHANGE:
+		err = tegra_clock_set_pd_state(clk_dev, cnd->old_rate);
+		break;
+
+	case POST_RATE_CHANGE:
+		if (cnd->new_rate < cnd->old_rate)
+			err = tegra_clock_set_pd_state(clk_dev, cnd->new_rate);
+		break;
+
+	default:
+		break;
+	}
+	mutex_unlock(&clk_dev->lock);
+
+	return notifier_from_errno(err);
+}
+
+static int tegra_clock_sync_pd_state(struct tegra_clk_device *clk_dev)
+{
+	unsigned long rate;
+	int ret;
+
+	mutex_lock(&clk_dev->lock);
+	if (clk_hw_is_enabled(clk_dev->hw)) {
+		rate = clk_hw_get_rate(clk_dev->hw);
+		ret = tegra_clock_set_pd_state(clk_dev, rate);
+	}
+	mutex_unlock(&clk_dev->lock);
+
+	return ret;
+}
+
+static int tegra_clock_probe(struct platform_device *pdev)
+{
+	struct tegra_core_opp_params opp_params = {};
+	struct tegra_clk_device *clk_dev;
+	struct device *dev = &pdev->dev;
+	struct clk *clk;
+	int err;
+
+	if (!dev->pm_domain)
+		return -EINVAL;
+
+	clk_dev = devm_kzalloc(dev, sizeof(*clk_dev), GFP_KERNEL);
+	if (!clk_dev)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	clk_dev->dev = dev;
+	clk_dev->hw = __clk_get_hw(clk);
+	clk_dev->clk_nb.notifier_call = tegra_clock_change_notify;
+	mutex_init(&clk_dev->lock);
+
+	platform_set_drvdata(pdev, clk_dev);
+
+	err = clk_notifier_register(clk, &clk_dev->clk_nb);
+	if (err) {
+		dev_err(dev, "failed to register clk notifier: %d\n", err);
+		return err;
+	}
+
+	err = devm_tegra_core_dev_init_opp_table(dev, &opp_params);
+	if (err) {
+		clk_notifier_unregister(clk, &clk_dev->clk_nb);
+		return err;
+	}
+
+	/*
+	 * The driver is attaching to a potentially active clock, hence we
+	 * need to sync the power domain state in a accordance to the clock
+	 * state.
+	 */
+	err = tegra_clock_sync_pd_state(clk_dev);
+	if (err) {
+		clk_notifier_unregister(clk, &clk_dev->clk_nb);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_clock_runtime_suspend(struct device *dev)
+{
+	return dev_pm_genpd_set_performance_state(dev, 0);
+}
+
+static int __maybe_unused tegra_clock_runtime_resume(struct device *dev)
+{
+	struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
+	unsigned long rate = clk_hw_get_rate(clk_dev->hw);
+
+	return tegra_clock_set_pd_state(clk_dev, rate);
+}
+
+static __maybe_unused int tegra_clock_pm_suspend(struct device *dev)
+{
+	struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
+
+	/*
+	 * Power management of the clock is entangled with the Tegra PMC
+	 * GENPD because it uses these clocks for toggling PD on/off state.
+	 *
+	 * The PMC GENPD is resumed in NOIRQ phase, before RPM of the clocks
+	 * becomes available, hence PMC can't use clocks at the early resume
+	 * phase.
+	 *
+	 * In order to solve this problem, we will keep the clock resumed.
+	 * This doesn't matter in regards to a power consumption because all
+	 * SoC devices are power-gated, PLLs are disabled and even core power
+	 * rail is completely turned off in a deepest suspend mode.
+	 */
+
+	return clk_prepare(clk_dev->hw->clk);
+}
+
+static __maybe_unused int tegra_clock_pm_resume(struct device *dev)
+{
+	struct tegra_clk_device *clk_dev = dev_get_drvdata(dev);
+
+	clk_unprepare(clk_dev->hw->clk);
+
+	return 0;
+}
+
+static void tegra_clock_shutdown(struct platform_device *pdev)
+{
+	struct tegra_clk_device *clk_dev = platform_get_drvdata(pdev);
+
+	clk_prepare(clk_dev->hw->clk);
+}
+
+static const struct dev_pm_ops tegra_clock_pm = {
+	SET_RUNTIME_PM_OPS(tegra_clock_runtime_suspend,
+			   tegra_clock_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_clock_pm_suspend,
+				tegra_clock_pm_resume)
+};
+
+static const struct of_device_id tegra_clock_match[] = {
+	{ .compatible = "nvidia,tegra20-clock", },
+	{ .compatible = "nvidia,tegra30-clock", },
+	{ }
+};
+
+static struct platform_driver tegra_clock_driver = {
+	.driver = {
+		.name = "tegra-clock",
+		.of_match_table = tegra_clock_match,
+		.pm = &tegra_clock_pm,
+		.suppress_bind_attrs = true,
+	},
+	.probe = tegra_clock_probe,
+	.shutdown = tegra_clock_shutdown,
+};
+builtin_platform_driver(tegra_clock_driver);
diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 38daf483ddf1..b11d47afc798 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -163,7 +163,7 @@ struct clk *tegra_clk_register_divider(const char *name,
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	divider->hw.init = &init;
 
-	clk = clk_register(NULL, &divider->hw);
+	clk = tegra_clk_register(&divider->hw);
 	if (IS_ERR(clk))
 		kfree(divider);
 
diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index 3c4259fec82e..b0bebf597b33 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -176,7 +176,7 @@ struct clk *tegra_clk_register_periph_gate(const char *name,
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	gate->hw.init = &init;
 
-	clk = clk_register(NULL, &gate->hw);
+	clk = tegra_clk_register(&gate->hw);
 	if (IS_ERR(clk))
 		kfree(gate);
 
diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 79ca3aa072b7..f7affeba829b 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -195,7 +195,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 	periph->gate.regs = bank;
 	periph->gate.enable_refcnt = periph_clk_enb_refcnt;
 
-	clk = clk_register(NULL, &periph->hw);
+	clk = tegra_clk_register(&periph->hw);
 	if (IS_ERR(clk))
 		return clk;
 
diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d709ecb7d8d7..eee2e64e251b 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1911,7 +1911,7 @@ static struct clk *_tegra_clk_register_pll(struct tegra_clk_pll *pll,
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	pll->hw.init = &init;
 
-	return clk_register(NULL, &pll->hw);
+	return tegra_clk_register(&pll->hw);
 }
 
 struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 6099c6e9acd4..b2db6cf7d9db 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -226,7 +226,7 @@ struct clk *tegra_clk_register_super_mux(const char *name,
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	super->hw.init = &init;
 
-	clk = clk_register(NULL, &super->hw);
+	clk = tegra_clk_register(&super->hw);
 	if (IS_ERR(clk))
 		kfree(super);
 
@@ -266,7 +266,7 @@ struct clk *tegra_clk_register_super_clk(const char *name,
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	super->hw.init = &init;
 
-	clk = clk_register(NULL, &super->hw);
+	clk = tegra_clk_register(&super->hw);
 	if (IS_ERR(clk))
 		kfree(super);
 
diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 60cc34f90cb9..c401e5f6d504 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -612,13 +612,6 @@ static struct tegra_periph_init_data periph_clks[] = {
 	I2C("i2c4", mux_pllp_clkm, CLK_SOURCE_I2C4, 103, tegra_clk_i2c4),
 	I2C("i2c5", mux_pllp_clkm, CLK_SOURCE_I2C5, 47, tegra_clk_i2c5),
 	I2C("i2c6", mux_pllp_clkm, CLK_SOURCE_I2C6, 166, tegra_clk_i2c6),
-	INT("vde", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde),
-	INT("vi", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi),
-	INT("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp),
-	INT("host1x", mux_pllm_pllc_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x),
-	INT("mpe", mux_pllm_pllc_pllp_plla, CLK_SOURCE_MPE, 60, 0, tegra_clk_mpe),
-	INT("2d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d),
-	INT("3d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d),
 	INT8("vde", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_8),
 	INT8("vi", mux_pllm_pllc2_c_c3_pllp_plla_pllc4, CLK_SOURCE_VI, 20, 0, tegra_clk_vi_9),
@@ -629,7 +622,6 @@ static struct tegra_periph_init_data periph_clks[] = {
 	INT("tsec", mux_pllp_pllc_clkm, CLK_SOURCE_TSEC, 83, 0, tegra_clk_tsec_8),
 	INT8("host1x", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x_8),
 	INT8("host1x", mux_pllc4_out1_pllc_pllc4_out2_pllp_clkm_plla_pllc4_out0, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x_9),
-	INT8("se", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se),
 	INT8("se", mux_pllp_pllc2_c_c3_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se_10),
 	INT8("2d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d_8),
 	INT8("3d", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d_8),
@@ -641,10 +633,8 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("i2s2", mux_pllaout0_audio2_2x_pllp_clkm, CLK_SOURCE_I2S2, 18, TEGRA_PERIPH_ON_APB, tegra_clk_i2s2),
 	MUX("i2s3", mux_pllaout0_audio3_2x_pllp_clkm, CLK_SOURCE_I2S3, 101, TEGRA_PERIPH_ON_APB, tegra_clk_i2s3),
 	MUX("i2s4", mux_pllaout0_audio4_2x_pllp_clkm, CLK_SOURCE_I2S4, 102, TEGRA_PERIPH_ON_APB, tegra_clk_i2s4),
-	MUX("spdif_out", mux_pllaout0_audio_2x_pllp_clkm, CLK_SOURCE_SPDIF_OUT, 10, TEGRA_PERIPH_ON_APB, tegra_clk_spdif_out),
 	MUX("spdif_in", mux_pllp_pllc_pllm, CLK_SOURCE_SPDIF_IN, 10, TEGRA_PERIPH_ON_APB, tegra_clk_spdif_in),
 	MUX8("spdif_in", mux_pllp_pllc_clkm_1, CLK_SOURCE_SPDIF_IN, 10, TEGRA_PERIPH_ON_APB, tegra_clk_spdif_in_8),
-	MUX("pwm", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_PWM, 17, TEGRA_PERIPH_ON_APB, tegra_clk_pwm),
 	MUX("adx", mux_plla_pllc_pllp_clkm, CLK_SOURCE_ADX, 154, TEGRA_PERIPH_ON_APB, tegra_clk_adx),
 	MUX("amx", mux_plla_pllc_pllp_clkm, CLK_SOURCE_AMX, 153, TEGRA_PERIPH_ON_APB, tegra_clk_amx),
 	MUX("hda", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_HDA, 125, TEGRA_PERIPH_ON_APB, tegra_clk_hda),
@@ -652,18 +642,12 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("hda2codec_2x", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_HDA2CODEC_2X, 111, TEGRA_PERIPH_ON_APB, tegra_clk_hda2codec_2x),
 	MUX8("hda2codec_2x", mux_pllp_pllc_plla_clkm, CLK_SOURCE_HDA2CODEC_2X, 111, TEGRA_PERIPH_ON_APB, tegra_clk_hda2codec_2x_8),
 	MUX("vfir", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VFIR, 7, TEGRA_PERIPH_ON_APB, tegra_clk_vfir),
-	MUX("sdmmc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1),
-	MUX("sdmmc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC2, 9, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc2),
-	MUX("sdmmc3", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3),
-	MUX("sdmmc4", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC4, 15, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc4),
 	MUX8("sdmmc1", mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1_9),
 	MUX8("sdmmc3", mux_pllp_pllc4_out2_pllc4_out1_clkm_pllc4_out0, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3_9),
 	MUX("la", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_LA, 76, TEGRA_PERIPH_ON_APB, tegra_clk_la),
 	MUX("trace", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_TRACE, 77, TEGRA_PERIPH_ON_APB, tegra_clk_trace),
 	MUX("owr", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_OWR, 71, TEGRA_PERIPH_ON_APB, tegra_clk_owr),
 	MUX("owr", mux_pllp_pllc_clkm, CLK_SOURCE_OWR, 71, TEGRA_PERIPH_ON_APB, tegra_clk_owr_8),
-	MUX("nor", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NOR, 42, 0, tegra_clk_nor),
-	MUX("mipi", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_MIPI, 50, TEGRA_PERIPH_ON_APB, tegra_clk_mipi),
 	MUX("vi_sensor", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI_SENSOR, 20, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor),
 	MUX("vi_sensor", mux_pllc_pllp_plla, CLK_SOURCE_VI_SENSOR, 20, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor_9),
 	MUX("cilab", mux_pllp_pllc_clkm, CLK_SOURCE_CILAB, 144, 0, tegra_clk_cilab),
@@ -676,20 +660,8 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("dfll_ref", mux_pllp_clkm, CLK_SOURCE_DFLL_REF, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_ref),
 	MUX("dfll_soc", mux_pllp_clkm, CLK_SOURCE_DFLL_SOC, 155, TEGRA_PERIPH_ON_APB, tegra_clk_dfll_soc),
 	MUX("i2cslow", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_I2CSLOW, 81, TEGRA_PERIPH_ON_APB, tegra_clk_i2cslow),
-	MUX("sbc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC1, 41, TEGRA_PERIPH_ON_APB, tegra_clk_sbc1),
-	MUX("sbc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC2, 44, TEGRA_PERIPH_ON_APB, tegra_clk_sbc2),
-	MUX("sbc3", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC3, 46, TEGRA_PERIPH_ON_APB, tegra_clk_sbc3),
-	MUX("sbc4", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC4, 68, TEGRA_PERIPH_ON_APB, tegra_clk_sbc4),
-	MUX("sbc5", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC5, 104, TEGRA_PERIPH_ON_APB, tegra_clk_sbc5),
-	MUX("sbc6", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC6, 105, TEGRA_PERIPH_ON_APB, tegra_clk_sbc6),
-	MUX("cve", mux_pllp_plld_pllc_clkm, CLK_SOURCE_CVE, 49, 0, tegra_clk_cve),
-	MUX("tvo", mux_pllp_plld_pllc_clkm, CLK_SOURCE_TVO, 49, 0, tegra_clk_tvo),
-	MUX("tvdac", mux_pllp_plld_pllc_clkm, CLK_SOURCE_TVDAC, 53, 0, tegra_clk_tvdac),
-	MUX("ndflash", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash),
 	MUX("ndspeed", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NDSPEED, 80, TEGRA_PERIPH_ON_APB, tegra_clk_ndspeed),
-	MUX("sata_oob", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SATA_OOB, 123, TEGRA_PERIPH_ON_APB, tegra_clk_sata_oob),
 	MUX("sata_oob", mux_pllp_pllc_clkm, CLK_SOURCE_SATA_OOB, 123, TEGRA_PERIPH_ON_APB, tegra_clk_sata_oob_8),
-	MUX("sata", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SATA, 124, TEGRA_PERIPH_ON_APB, tegra_clk_sata),
 	MUX("sata", mux_pllp_pllc_clkm, CLK_SOURCE_SATA, 124, TEGRA_PERIPH_ON_APB, tegra_clk_sata_8),
 	MUX("adx1", mux_plla_pllc_pllp_clkm, CLK_SOURCE_ADX1, 180, TEGRA_PERIPH_ON_APB, tegra_clk_adx1),
 	MUX("amx1", mux_plla_pllc_pllp_clkm, CLK_SOURCE_AMX1, 185, TEGRA_PERIPH_ON_APB, tegra_clk_amx1),
@@ -711,7 +683,6 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX("sbc4", mux_pllp_pllc_clkm, CLK_SOURCE_SBC4, 68, TEGRA_PERIPH_ON_APB, tegra_clk_sbc4_9),
 	MUX8("ndflash", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash_8),
 	MUX8("ndspeed", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDSPEED, 80, TEGRA_PERIPH_ON_APB, tegra_clk_ndspeed_8),
-	MUX8("hdmi", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_HDMI, 51, 0, tegra_clk_hdmi),
 	MUX8("extern1", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN1, 120, 0, tegra_clk_extern1),
 	MUX8("extern2", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN2, 121, 0, tegra_clk_extern2),
 	MUX8("extern3", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN3, 122, 0, tegra_clk_extern3),
@@ -727,9 +698,7 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("clk72mhz", mux_pllp_out3_pllp_pllc_clkm, CLK_SOURCE_CLK72MHZ, 177, TEGRA_PERIPH_NO_RESET, tegra_clk_clk72Mhz_8),
 	MUX_FLAGS("csite", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite, CLK_IGNORE_UNUSED),
 	MUX_FLAGS("csite", mux_pllp_pllre_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite_8, CLK_IGNORE_UNUSED),
-	NODIV("disp1", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1, NULL),
 	NODIV("disp1", mux_pllp_plld_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1_8, NULL),
-	NODIV("disp2", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2, NULL),
 	NODIV("disp2", mux_pllp_plld_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2_8, NULL),
 	UART("uarta", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTA, 6, tegra_clk_uarta),
 	UART("uartb", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTB, 7, tegra_clk_uartb),
@@ -769,6 +738,40 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("dmic3", mux_dmic3, CLK_SOURCE_DMIC3, 197, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_dmic3),
 };
 
+static struct tegra_periph_init_data rpm_periph_clks[] = {
+	INT("vde", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_VDE, 61, 0, tegra_clk_vde),
+	INT("vi", mux_pllm_pllc_pllp_plla, CLK_SOURCE_VI, 20, 0, tegra_clk_vi),
+	INT("epp", mux_pllm_pllc_pllp_plla, CLK_SOURCE_EPP, 19, 0, tegra_clk_epp),
+	INT("host1x", mux_pllm_pllc_pllp_plla, CLK_SOURCE_HOST1X, 28, 0, tegra_clk_host1x),
+	INT("mpe", mux_pllm_pllc_pllp_plla, CLK_SOURCE_MPE, 60, 0, tegra_clk_mpe),
+	INT("2d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_2D, 21, 0, tegra_clk_gr2d),
+	INT("3d", mux_pllm_pllc_pllp_plla, CLK_SOURCE_3D, 24, 0, tegra_clk_gr3d),
+	INT8("se", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_SE, 127, TEGRA_PERIPH_ON_APB, tegra_clk_se),
+	MUX("nor", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NOR, 42, 0, tegra_clk_nor),
+	MUX("spdif_out", mux_pllaout0_audio_2x_pllp_clkm, CLK_SOURCE_SPDIF_OUT, 10, TEGRA_PERIPH_ON_APB, tegra_clk_spdif_out),
+	MUX("pwm", mux_pllp_pllc_clk32_clkm, CLK_SOURCE_PWM, 17, TEGRA_PERIPH_ON_APB, tegra_clk_pwm),
+	MUX("sdmmc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC1, 14, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc1),
+	MUX("sdmmc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC2, 9, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc2),
+	MUX("sdmmc3", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC3, 69, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc3),
+	MUX("sdmmc4", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SDMMC4, 15, TEGRA_PERIPH_ON_APB, tegra_clk_sdmmc4),
+	MUX("mipi", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_MIPI, 50, TEGRA_PERIPH_ON_APB, tegra_clk_mipi),
+	MUX("sbc1", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC1, 41, TEGRA_PERIPH_ON_APB, tegra_clk_sbc1),
+	MUX("sbc2", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC2, 44, TEGRA_PERIPH_ON_APB, tegra_clk_sbc2),
+	MUX("sbc3", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC3, 46, TEGRA_PERIPH_ON_APB, tegra_clk_sbc3),
+	MUX("sbc4", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC4, 68, TEGRA_PERIPH_ON_APB, tegra_clk_sbc4),
+	MUX("sbc5", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC5, 104, TEGRA_PERIPH_ON_APB, tegra_clk_sbc5),
+	MUX("sbc6", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SBC6, 105, TEGRA_PERIPH_ON_APB, tegra_clk_sbc6),
+	MUX("cve", mux_pllp_plld_pllc_clkm, CLK_SOURCE_CVE, 49, 0, tegra_clk_cve),
+	MUX("tvo", mux_pllp_plld_pllc_clkm, CLK_SOURCE_TVO, 49, 0, tegra_clk_tvo),
+	MUX("tvdac", mux_pllp_plld_pllc_clkm, CLK_SOURCE_TVDAC, 53, 0, tegra_clk_tvdac),
+	MUX("ndflash", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash),
+	MUX("sata_oob", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SATA_OOB, 123, TEGRA_PERIPH_ON_APB, tegra_clk_sata_oob),
+	MUX("sata", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_SATA, 124, TEGRA_PERIPH_ON_APB, tegra_clk_sata),
+	MUX8("hdmi", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_HDMI, 51, 0, tegra_clk_hdmi),
+	NODIV("disp1", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1, NULL),
+	NODIV("disp2", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2, NULL),
+};
+
 static struct tegra_periph_init_data gate_clks[] = {
 	GATE("rtc", "clk_32k", 4, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_rtc, 0),
 	GATE("timer", "clk_m", 5, 0, tegra_clk_timer, CLK_IS_CRITICAL),
@@ -782,18 +785,13 @@ static struct tegra_periph_init_data gate_clks[] = {
 	 * from LP1 system suspend and as part of CCPLEX cluster switching.
 	 */
 	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CLK_IS_CRITICAL),
-	GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
 	GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, 0),
 	GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif, 0),
 	GATE("hda2hdmi", "clk_m", 128, TEGRA_PERIPH_ON_APB, tegra_clk_hda2hdmi, 0),
 	GATE("bsea", "clk_m", 62, 0, tegra_clk_bsea, 0),
 	GATE("bsev", "clk_m", 63, 0, tegra_clk_bsev, 0),
 	GATE("mipi-cal", "clk72mhz", 56, 0, tegra_clk_mipi_cal, 0),
-	GATE("usbd", "clk_m", 22, 0, tegra_clk_usbd, 0),
-	GATE("usb2", "clk_m", 58, 0, tegra_clk_usb2, 0),
-	GATE("usb3", "clk_m", 59, 0, tegra_clk_usb3, 0),
 	GATE("csi", "pll_p_out3", 52, 0, tegra_clk_csi, 0),
-	GATE("afi", "mselect", 72, 0, tegra_clk_afi, 0),
 	GATE("csus", "clk_m", 92, TEGRA_PERIPH_NO_RESET, tegra_clk_csus, 0),
 	GATE("dds", "clk_m", 150, TEGRA_PERIPH_ON_APB, tegra_clk_dds, 0),
 	GATE("dp2", "clk_m", 152, TEGRA_PERIPH_ON_APB, tegra_clk_dp2, 0),
@@ -801,12 +799,10 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("xusb_host", "xusb_host_src", 89, 0, tegra_clk_xusb_host, 0),
 	GATE("xusb_ss", "xusb_ss_src", 156, 0, tegra_clk_xusb_ss, 0),
 	GATE("xusb_dev", "xusb_dev_src", 95, 0, tegra_clk_xusb_dev, 0),
-	GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IS_CRITICAL),
 	GATE("sata_cold", "clk_m", 129, TEGRA_PERIPH_ON_APB, tegra_clk_sata_cold, 0),
 	GATE("ispa", "isp", 23, 0, tegra_clk_ispa, 0),
 	GATE("ispb", "isp", 3, 0, tegra_clk_ispb, 0),
 	GATE("vim2_clk", "clk_m", 11, 0, tegra_clk_vim2_clk, 0),
-	GATE("pcie", "clk_m", 70, 0, tegra_clk_pcie, 0),
 	GATE("gpu", "pll_ref", 184, 0, tegra_clk_gpu, 0),
 	GATE("pllg_ref", "pll_ref", 189, 0, tegra_clk_pll_g_ref, 0),
 	GATE("hsic_trk", "usb2_hsic_trk", 209, TEGRA_PERIPH_NO_RESET, tegra_clk_hsic_trk, 0),
@@ -824,6 +820,15 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("adsp_neon", "aclk", 218, 0, tegra_clk_adsp_neon, 0),
 };
 
+static struct tegra_periph_init_data rpm_gate_clks[] = {
+	GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
+	GATE("usbd", "clk_m", 22, 0, tegra_clk_usbd, 0),
+	GATE("usb2", "clk_m", 58, 0, tegra_clk_usb2, 0),
+	GATE("usb3", "clk_m", 59, 0, tegra_clk_usb3, 0),
+	GATE("afi", "mselect", 72, 0, tegra_clk_afi, 0),
+	GATE("emc", "emc_mux", 57, 0, tegra_clk_emc, CLK_IS_CRITICAL),
+	GATE("pcie", "clk_m", 70, 0, tegra_clk_pcie, 0),
+};
 static struct tegra_periph_init_data div_clks[] = {
 	DIV8("usb2_hsic_trk", "osc", CLK_SOURCE_USB2_HSIC_TRK, tegra_clk_usb2_hsic_trk, 0),
 };
@@ -888,6 +893,33 @@ static void __init periph_clk_init(void __iomem *clk_base,
 	}
 }
 
+static void __init rpm_periph_clk_init(void __iomem *clk_base,
+				struct tegra_clk *tegra_clks)
+{
+	int i;
+	struct clk *clk;
+	struct clk **dt_clk;
+
+	for (i = 0; i < ARRAY_SIZE(rpm_periph_clks); i++) {
+		const struct tegra_clk_periph_regs *bank;
+		struct tegra_periph_init_data *data;
+
+		data = rpm_periph_clks + i;
+
+		dt_clk = tegra_lookup_dt_id(data->clk_id, tegra_clks);
+		if (!dt_clk)
+			continue;
+
+		bank = get_reg_bank(data->periph.gate.clk_num);
+		if (!bank)
+			continue;
+
+		data->periph.gate.regs = bank;
+		clk = tegra_clk_register_periph_data(clk_base, data);
+		*dt_clk = clk;
+	}
+}
+
 static void __init gate_clk_init(void __iomem *clk_base,
 				struct tegra_clk *tegra_clks)
 {
@@ -913,6 +945,31 @@ static void __init gate_clk_init(void __iomem *clk_base,
 	}
 }
 
+static void __init rpm_gate_clk_init(void __iomem *clk_base,
+				struct tegra_clk *tegra_clks)
+{
+	int i;
+	struct clk *clk;
+	struct clk **dt_clk;
+
+	for (i = 0; i < ARRAY_SIZE(rpm_gate_clks); i++) {
+		struct tegra_periph_init_data *data;
+
+		data = rpm_gate_clks + i;
+
+		dt_clk = tegra_lookup_dt_id(data->clk_id, tegra_clks);
+		if (!dt_clk)
+			continue;
+
+		clk = tegra_clk_register_periph_gate(data->name,
+				data->p.parent_name, data->periph.gate.flags,
+				clk_base, data->flags,
+				data->periph.gate.clk_num,
+				periph_clk_enb_refcnt);
+		*dt_clk = clk;
+	}
+}
+
 static void __init div_clk_init(void __iomem *clk_base,
 				struct tegra_clk *tegra_clks)
 {
@@ -1032,3 +1089,10 @@ void __init tegra_periph_clk_init(void __iomem *clk_base,
 	gate_clk_init(clk_base, tegra_clks);
 	div_clk_init(clk_base, tegra_clks);
 }
+
+void __init tegra_periph_clk_rpm_init(void __iomem *clk_base,
+				      struct tegra_clk *tegra_clks)
+{
+	rpm_periph_clk_init(clk_base, tegra_clks);
+	rpm_gate_clk_init(clk_base, tegra_clks);
+}
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index bc9e47a4cb60..9d90f1300370 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1069,6 +1069,7 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 
 	tegra_periph_clk_init(clk_base, pmc_base, tegra114_clks,
 				&pll_p_params);
+	tegra_periph_clk_rpm_init(clk_base, tegra114_clks);
 }
 
 /* Tegra114 CPU clock and reset control functions */
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 934520aab6e3..0ca82f7e4628 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1081,6 +1081,7 @@ static __init void tegra124_periph_clk_init(void __iomem *clk_base,
 	}
 
 	tegra_periph_clk_init(clk_base, pmc_base, tegra124_clks, &pll_p_params);
+	tegra_periph_clk_rpm_init(clk_base, tegra124_clks);
 }
 
 static void __init tegra124_pll_init(void __iomem *clk_base,
diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
index dd74b8543bf1..d2da6412775c 100644
--- a/drivers/clk/tegra/clk-tegra20-emc.c
+++ b/drivers/clk/tegra/clk-tegra20-emc.c
@@ -270,7 +270,7 @@ struct clk *tegra20_clk_register_emc(void __iomem *ioaddr, bool low_jitter)
 	emc->hw.init = &init;
 	emc->want_low_jitter = low_jitter;
 
-	clk = clk_register(NULL, &emc->hw);
+	clk = tegra_clk_register(&emc->hw);
 	if (IS_ERR(clk)) {
 		kfree(emc);
 		return NULL;
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 3efc651b42e3..c29d5af517c3 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -624,11 +624,6 @@ static void tegra20_pll_init(void)
 {
 	struct clk *clk;
 
-	/* PLLC */
-	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, NULL, 0,
-			    &pll_c_params, NULL);
-	clks[TEGRA20_CLK_PLL_C] = clk;
-
 	/* PLLC_OUT1 */
 	clk = tegra_clk_register_divider("pll_c_out1_div", "pll_c",
 				clk_base + PLLC_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
@@ -638,11 +633,6 @@ static void tegra20_pll_init(void)
 				0, NULL);
 	clks[TEGRA20_CLK_PLL_C_OUT1] = clk;
 
-	/* PLLM */
-	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, NULL,
-			    CLK_SET_RATE_GATE, &pll_m_params, NULL);
-	clks[TEGRA20_CLK_PLL_M] = clk;
-
 	/* PLLM_OUT1 */
 	clk = tegra_clk_register_divider("pll_m_out1_div", "pll_m",
 				clk_base + PLLM_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
@@ -685,11 +675,6 @@ static void tegra20_pll_init(void)
 				clk_base + PLLA_OUT, 1, 0, CLK_IGNORE_UNUSED |
 				CLK_SET_RATE_PARENT, 0, NULL);
 	clks[TEGRA20_CLK_PLL_A_OUT0] = clk;
-
-	/* PLLE */
-	clk = tegra_clk_register_plle("pll_e", "pll_ref", clk_base, pmc_base,
-			     0, &pll_e_params, NULL);
-	clks[TEGRA20_CLK_PLL_E] = clk;
 }
 
 static const char *cclk_parents[] = { "clk_m", "pll_c", "clk_32k", "pll_m",
@@ -710,13 +695,6 @@ static void tegra20_super_clk_init(void)
 			      NULL);
 	clks[TEGRA20_CLK_CCLK] = clk;
 
-	/* SCLK */
-	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
-			      ARRAY_SIZE(sclk_parents),
-			      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
-			      clk_base + SCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
-	clks[TEGRA20_CLK_SCLK] = clk;
-
 	/* twd */
 	clk = clk_register_fixed_factor(NULL, "twd", "cclk", 0, 1, 4);
 	clks[TEGRA20_CLK_TWD] = clk;
@@ -787,9 +765,7 @@ static struct tegra_periph_init_data tegra_periph_nodiv_clk_list[] = {
 
 static void __init tegra20_periph_clk_init(void)
 {
-	struct tegra_periph_init_data *data;
 	struct clk *clk;
-	unsigned int i;
 
 	/* ac97 */
 	clk = tegra_clk_register_periph_gate("ac97", "pll_a_out0",
@@ -797,26 +773,10 @@ static void __init tegra20_periph_clk_init(void)
 				    clk_base, 0, 3, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_AC97] = clk;
 
-	/* emc */
-	clk = tegra20_clk_register_emc(clk_base + CLK_SOURCE_EMC, false);
-
-	clks[TEGRA20_CLK_EMC] = clk;
-
 	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
 				    NULL);
 	clks[TEGRA20_CLK_MC] = clk;
 
-	/* dsi */
-	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-				    48, periph_clk_enb_refcnt);
-	clk_register_clkdev(clk, NULL, "dsi");
-	clks[TEGRA20_CLK_DSI] = clk;
-
-	/* pex */
-	clk = tegra_clk_register_periph_gate("pex", "clk_m", 0, clk_base, 0, 70,
-				    periph_clk_enb_refcnt);
-	clks[TEGRA20_CLK_PEX] = clk;
-
 	/* dev1 OSC divider */
 	clk_register_divider(NULL, "dev1_osc_div", "clk_m",
 			     0, clk_base + MISC_CLK_ENB, 22, 2,
@@ -839,21 +799,6 @@ static void __init tegra20_periph_clk_init(void)
 				    clk_base, 0, 93, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_CDEV2] = clk;
 
-	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
-		data = &tegra_periph_clk_list[i];
-		clk = tegra_clk_register_periph_data(clk_base, data);
-		clks[data->clk_id] = clk;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(tegra_periph_nodiv_clk_list); i++) {
-		data = &tegra_periph_nodiv_clk_list[i];
-		clk = tegra_clk_register_periph_nodiv(data->name,
-					data->p.parent_names,
-					data->num_parents, &data->periph,
-					clk_base, data->offset);
-		clks[data->clk_id] = clk;
-	}
-
 	tegra_periph_clk_init(clk_base, pmc_base, tegra20_clks, &pll_p_params);
 }
 
@@ -1111,6 +1056,70 @@ static struct clk *tegra20_clk_src_onecell_get(struct of_phandle_args *clkspec,
 	return clk;
 }
 
+static void __init tegra20_clock_core_rpm_init(void)
+{
+	struct tegra_periph_init_data *data;
+	struct clk *clk;
+	unsigned int i;
+
+	/* PLLC */
+	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, NULL, 0,
+			    &pll_c_params, NULL);
+	clks[TEGRA20_CLK_PLL_C] = clk;
+
+	/* PLLE */
+	clk = tegra_clk_register_plle("pll_e", "pll_ref", clk_base, pmc_base,
+			     0, &pll_e_params, NULL);
+	clks[TEGRA20_CLK_PLL_E] = clk;
+
+	/* PLLM */
+	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, NULL,
+			    CLK_SET_RATE_GATE, &pll_m_params, NULL);
+	clks[TEGRA20_CLK_PLL_M] = clk;
+
+	/* SCLK */
+	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
+			      ARRAY_SIZE(sclk_parents),
+			      CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			      clk_base + SCLK_BURST_POLICY, 0, 4, 0, 0, NULL);
+	clks[TEGRA20_CLK_SCLK] = clk;
+
+	/* dsi */
+	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
+				    48, periph_clk_enb_refcnt);
+	clk_register_clkdev(clk, NULL, "dsi");
+	clks[TEGRA20_CLK_DSI] = clk;
+
+	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
+		data = &tegra_periph_clk_list[i];
+		clk = tegra_clk_register_periph_data(clk_base, data);
+		clks[data->clk_id] = clk;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tegra_periph_nodiv_clk_list); i++) {
+		data = &tegra_periph_nodiv_clk_list[i];
+		clk = tegra_clk_register_periph_nodiv(data->name,
+					data->p.parent_names,
+					data->num_parents, &data->periph,
+					clk_base, data->offset);
+		clks[data->clk_id] = clk;
+	}
+
+	/* pex */
+	clk = tegra_clk_register_periph_gate("pex", "clk_m", 0, clk_base, 0, 70,
+				    periph_clk_enb_refcnt);
+	clks[TEGRA20_CLK_PEX] = clk;
+
+	/* emc */
+	clk = tegra20_clk_register_emc(clk_base + CLK_SOURCE_EMC, false);
+
+	clks[TEGRA20_CLK_EMC] = clk;
+
+	tegra_periph_clk_rpm_init(clk_base, tegra20_clks);
+	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA20_CLK_CLK_MAX);
+	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
+}
+
 static void __init tegra20_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -1146,12 +1155,10 @@ static void __init tegra20_clock_init(struct device_node *np)
 	tegra20_periph_clk_init();
 	tegra20_audio_clk_init();
 
-	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA20_CLK_CLK_MAX);
-
 	tegra_add_of_provider(np, tegra20_clk_src_onecell_get);
-	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_clk_apply_init_table = tegra20_clock_apply_init_table;
+	tegra_clk_apply_rpm_clocks = tegra20_clock_core_rpm_init;
 
 	tegra_cpu_car_ops = &tegra20_cpu_car_ops;
 }
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 68cbb98af567..c3fb0c98ee44 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3131,6 +3131,7 @@ static __init void tegra210_periph_clk_init(struct device_node *np,
 	}
 
 	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params);
+	tegra_periph_clk_rpm_init(clk_base, tegra210_clks);
 
 	/* emc */
 	clk = tegra210_clk_register_emc(np, clk_base);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 98923c4674bf..3d48fd1e034a 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -812,11 +812,6 @@ static void __init tegra30_pll_init(void)
 {
 	struct clk *clk;
 
-	/* PLLC */
-	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, pmc_base, 0,
-				     &pll_c_params, NULL);
-	clks[TEGRA30_CLK_PLL_C] = clk;
-
 	/* PLLC_OUT1 */
 	clk = tegra_clk_register_divider("pll_c_out1_div", "pll_c",
 				clk_base + PLLC_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
@@ -826,11 +821,6 @@ static void __init tegra30_pll_init(void)
 				0, NULL);
 	clks[TEGRA30_CLK_PLL_C_OUT1] = clk;
 
-	/* PLLM */
-	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, pmc_base,
-			    CLK_SET_RATE_GATE, &pll_m_params, NULL);
-	clks[TEGRA30_CLK_PLL_M] = clk;
-
 	/* PLLM_OUT1 */
 	clk = tegra_clk_register_divider("pll_m_out1_div", "pll_m",
 				clk_base + PLLM_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
@@ -880,9 +870,6 @@ static void __init tegra30_pll_init(void)
 			       ARRAY_SIZE(pll_e_parents),
 			       CLK_SET_RATE_NO_REPARENT,
 			       clk_base + PLLE_AUX, 2, 1, 0, NULL);
-	clk = tegra_clk_register_plle("pll_e", "pll_e_mux", clk_base, pmc_base,
-			     CLK_GET_RATE_NOCACHE, &pll_e_params, NULL);
-	clks[TEGRA30_CLK_PLL_E] = clk;
 }
 
 static const char *cclk_g_parents[] = { "clk_m", "pll_c", "clk_32k", "pll_m",
@@ -971,14 +958,6 @@ static void __init tegra30_super_clk_init(void)
 			      NULL);
 	clks[TEGRA30_CLK_CCLK_LP] = clk;
 
-	/* SCLK */
-	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
-				  ARRAY_SIZE(sclk_parents),
-				  CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
-				  clk_base + SCLK_BURST_POLICY,
-				  0, 4, 0, 0, NULL);
-	clks[TEGRA30_CLK_SCLK] = clk;
-
 	/* twd */
 	clk = clk_register_fixed_factor(NULL, "twd", "cclk_g",
 					CLK_SET_RATE_PARENT, 1, 2);
@@ -1018,29 +997,7 @@ static struct tegra_periph_init_data tegra_periph_nodiv_clk_list[] = {
 
 static void __init tegra30_periph_clk_init(void)
 {
-	struct tegra_periph_init_data *data;
 	struct clk *clk;
-	unsigned int i;
-
-	/* dsia */
-	clk = tegra_clk_register_periph_gate("dsia", "pll_d_out0", 0, clk_base,
-				    0, 48, periph_clk_enb_refcnt);
-	clks[TEGRA30_CLK_DSIA] = clk;
-
-	/* pcie */
-	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
-				    70, periph_clk_enb_refcnt);
-	clks[TEGRA30_CLK_PCIE] = clk;
-
-	/* afi */
-	clk = tegra_clk_register_periph_gate("afi", "clk_m", 0, clk_base, 0, 72,
-				    periph_clk_enb_refcnt);
-	clks[TEGRA30_CLK_AFI] = clk;
-
-	/* emc */
-	clk = tegra20_clk_register_emc(clk_base + CLK_SOURCE_EMC, true);
-
-	clks[TEGRA30_CLK_EMC] = clk;
 
 	clk = tegra_clk_register_mc("mc", "emc", clk_base + CLK_SOURCE_EMC,
 				    NULL);
@@ -1056,21 +1013,6 @@ static void __init tegra30_periph_clk_init(void)
 				1, 0, &cml_lock);
 	clks[TEGRA30_CLK_CML1] = clk;
 
-	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
-		data = &tegra_periph_clk_list[i];
-		clk = tegra_clk_register_periph_data(clk_base, data);
-		clks[data->clk_id] = clk;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(tegra_periph_nodiv_clk_list); i++) {
-		data = &tegra_periph_nodiv_clk_list[i];
-		clk = tegra_clk_register_periph_nodiv(data->name,
-					data->p.parent_names,
-					data->num_parents, &data->periph,
-					clk_base, data->offset);
-		clks[data->clk_id] = clk;
-	}
-
 	tegra_periph_clk_init(clk_base, pmc_base, tegra30_clks, &pll_p_params);
 }
 
@@ -1315,6 +1257,77 @@ static struct clk *tegra30_clk_src_onecell_get(struct of_phandle_args *clkspec,
 	return clk;
 }
 
+static void __init tegra30_clock_core_rpm_init(void)
+{
+	struct tegra_periph_init_data *data;
+	struct clk *clk;
+	unsigned int i;
+
+	/* PLLC */
+	clk = tegra_clk_register_pll("pll_c", "pll_ref", clk_base, pmc_base, 0,
+				     &pll_c_params, NULL);
+	clks[TEGRA30_CLK_PLL_C] = clk;
+
+	/* PLLE */
+	clk = tegra_clk_register_plle("pll_e", "pll_e_mux", clk_base, pmc_base,
+				      CLK_GET_RATE_NOCACHE, &pll_e_params, NULL);
+	clks[TEGRA30_CLK_PLL_E] = clk;
+
+	/* PLLM */
+	clk = tegra_clk_register_pll("pll_m", "pll_ref", clk_base, pmc_base,
+				     CLK_SET_RATE_GATE, &pll_m_params, NULL);
+	clks[TEGRA30_CLK_PLL_M] = clk;
+
+	/* SCLK */
+	clk = tegra_clk_register_super_mux("sclk", sclk_parents,
+					   ARRAY_SIZE(sclk_parents),
+					   CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+					   clk_base + SCLK_BURST_POLICY,
+					   0, 4, 0, 0, NULL);
+	clks[TEGRA30_CLK_SCLK] = clk;
+
+	/* dsia */
+	clk = tegra_clk_register_periph_gate("dsia", "pll_d_out0", 0, clk_base,
+					     0, 48, periph_clk_enb_refcnt);
+	clks[TEGRA30_CLK_DSIA] = clk;
+
+	/* dsib */
+	for (i = 0; i < ARRAY_SIZE(tegra_periph_nodiv_clk_list); i++) {
+		data = &tegra_periph_nodiv_clk_list[i];
+		clk = tegra_clk_register_periph_nodiv(data->name,
+						      data->p.parent_names,
+						      data->num_parents,
+						      &data->periph,
+						      clk_base, data->offset);
+		clks[data->clk_id] = clk;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
+		data = &tegra_periph_clk_list[i];
+		clk = tegra_clk_register_periph_data(clk_base, data);
+		clks[data->clk_id] = clk;
+	}
+
+	/* pcie */
+	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
+					     70, periph_clk_enb_refcnt);
+	clks[TEGRA30_CLK_PCIE] = clk;
+
+	/* afi */
+	clk = tegra_clk_register_periph_gate("afi", "clk_m", 0, clk_base, 0, 72,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA30_CLK_AFI] = clk;
+
+	/* emc */
+	clk = tegra20_clk_register_emc(clk_base + CLK_SOURCE_EMC, true);
+
+	clks[TEGRA30_CLK_EMC] = clk;
+
+	tegra_periph_clk_rpm_init(clk_base, tegra30_clks);
+	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA30_CLK_CLK_MAX);
+	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
+}
+
 static void __init tegra30_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -1355,12 +1368,10 @@ static void __init tegra30_clock_init(struct device_node *np)
 			     tegra30_audio_plls,
 			     ARRAY_SIZE(tegra30_audio_plls), 24000000);
 
-	tegra_init_dup_clks(tegra_clk_duplicates, clks, TEGRA30_CLK_CLK_MAX);
-
 	tegra_add_of_provider(np, tegra30_clk_src_onecell_get);
-	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
 	tegra_clk_apply_init_table = tegra30_clock_apply_init_table;
+	tegra_clk_apply_rpm_clocks = tegra30_clock_core_rpm_init;
 
 	tegra_cpu_car_ops = &tegra30_cpu_car_ops;
 }
diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index f6cdce441cf7..02f3db424376 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -9,14 +9,19 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/clk/tegra.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
+#include <linux/string.h>
 
 #include <soc/tegra/fuse.h>
 
 #include "clk.h"
 
 /* Global data of Tegra CPU CAR ops */
+static struct device_node *tegra_car_np;
 static struct tegra_cpu_car_ops dummy_car_ops;
 struct tegra_cpu_car_ops *tegra_cpu_car_ops = &dummy_car_ops;
 
@@ -320,6 +325,8 @@ void __init tegra_add_of_provider(struct device_node *np,
 {
 	int i;
 
+	tegra_car_np = np;
+
 	for (i = 0; i < clk_num; i++) {
 		if (IS_ERR(clks[i])) {
 			pr_err
@@ -372,6 +379,66 @@ struct clk ** __init tegra_lookup_dt_id(int clk_id,
 		return NULL;
 }
 
+static struct device_node *tegra_clk_dt_node(struct clk_hw *hw)
+{
+	struct device_node *np, *root;
+
+	if (!tegra_car_np)
+		return NULL;
+
+	root = of_get_child_by_name(tegra_car_np, "clocks");
+	if (!root)
+		return NULL;
+
+	for_each_child_of_node(root, np) {
+		if (strcmp(np->name, hw->init->name))
+			continue;
+
+		if (!of_device_is_compatible(np, "nvidia,tegra20-clock") &&
+		    !of_device_is_compatible(np, "nvidia,tegra30-clock"))
+			continue;
+
+		return np;
+	}
+
+	of_node_put(root);
+
+	return NULL;
+}
+
+struct clk *tegra_clk_register(struct clk_hw *hw)
+{
+	struct platform_device *pdev;
+	struct device *dev = NULL;
+	struct device_node *np;
+	const char *dev_name;
+
+	np = tegra_clk_dt_node(hw);
+
+	if (!of_device_is_available(np))
+		goto reg_clk;
+
+	dev_name = kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->name);
+	if (!dev_name) {
+		of_node_put(np);
+		goto reg_clk;
+	}
+
+	pdev = of_platform_device_create(np, dev_name, NULL);
+	if (!pdev) {
+		pr_err("%s: failed to create device for %pOF\n", __func__, np);
+		kfree(dev_name);
+		of_node_put(np);
+		goto reg_clk;
+	}
+
+	dev = &pdev->dev;
+	pm_runtime_enable(dev);
+
+reg_clk:
+	return clk_register(dev, hw);
+}
+
 tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
 
 static int __init tegra_clocks_apply_init_table(void)
@@ -384,3 +451,25 @@ static int __init tegra_clocks_apply_init_table(void)
 	return 0;
 }
 arch_initcall(tegra_clocks_apply_init_table);
+
+tegra_clk_apply_rpm_init_table_func tegra_clk_apply_rpm_clocks;
+
+/*
+ * Clocks that use runtime PM can't be created at the CLK_OF_DECLARE
+ * stage because drivers base isn't initialized yet, and thus platform
+ * devices can't be created for the clocks.  Hence we need to split the
+ * registration of the clocks into two phases.  The first phase registers
+ * essential clocks which don't require RPM and are actually used during
+ * early boot.  The second phase registers clocks which use RPM and this
+ * is done when drivers base is ready.
+ */
+static int __init tegra_clocks_apply_core_rpm(void)
+{
+	if (!tegra_clk_apply_rpm_clocks)
+		return 0;
+
+	tegra_clk_apply_rpm_clocks();
+
+	return 0;
+}
+postcore_initcall_sync(tegra_clocks_apply_core_rpm);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index c3e36b5dcc75..d45f36237cc0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -869,6 +869,9 @@ void tegra_periph_clk_init(void __iomem *clk_base, void __iomem *pmc_base,
 			struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
 
+void tegra_periph_clk_rpm_init(void __iomem *clk_base,
+			       struct tegra_clk *tegra_clks);
+
 void tegra_fixed_clk_init(struct tegra_clk *tegra_clks);
 int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 		       unsigned long *input_freqs, unsigned int num,
@@ -907,6 +910,8 @@ void tegra114_clock_deassert_dfll_dvco_reset(void);
 
 typedef void (*tegra_clk_apply_init_table_func)(void);
 extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
+typedef void (*tegra_clk_apply_rpm_init_table_func)(void);
+extern tegra_clk_apply_rpm_init_table_func tegra_clk_apply_rpm_clocks;
 int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll);
 u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
 int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
@@ -931,4 +936,6 @@ struct clk *tegra20_clk_register_emc(void __iomem *ioaddr, bool low_jitter);
 struct clk *tegra210_clk_register_emc(struct device_node *np,
 				      void __iomem *regs);
 
+struct clk *tegra_clk_register(struct clk_hw *hw);
+
 #endif /* TEGRA_CLK_H */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
