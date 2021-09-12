Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF9840804A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 22:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A176E088;
	Sun, 12 Sep 2021 20:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106776E07B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 20:10:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id s24so5122186wmh.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ao2JLfYPSHHhEgaGHBXF51D99ohQhpgr3//KrDL4XpQ=;
 b=lWr1BZMsQFhLRFeww+1EbgaiAZfdEBAlsJ+q7UzPSwRPRzUGDi1UvRu4KFXI4181iB
 3PlmOXnMArR9hUZ+R2s9NHXWtGeFF7kQwZbwJq5ALGDyjvUZuMyMDnimgqArhr3DEJ9q
 n1B5QxO1ze8GdEmhj7/8FGZ1BMmwvkACQTmQ90ljeJRPE9gZb+TDWtiAujReQNwltain
 IG1TYrMJad6lUvgKZSM2vTbTVoyTt4Xs+Lp1ja1sl09t5zumoudYfeIJQNTjHztk41UM
 Ky5QAweKds8uXRf6jFq8ohav+Z6SA7AWGxE7cp/AQg6lj6tnZI771ICGTFvH3jBT2U4q
 HOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ao2JLfYPSHHhEgaGHBXF51D99ohQhpgr3//KrDL4XpQ=;
 b=nKOHzMPMyIZAzG8vtLMopNodAQUlMRxrLBoTzpINk8uEp3dde2ZYzGTtZ8IIOGS6Jt
 7qpHAAiaFduHxzcL1UuXDimx3PKWkU2XEtYKswM2XtHVwsbpd3irIpKH2RrgvfMKd9fm
 qrgL4FOxJGsPt8L0bv7n32BqboqAbUlCI5jdeWbQqriaKxzubDxa6RxIjn7eHbwZCS6V
 SNMddx3tx33b7+IpaWnM+egfHK+2hEKNi6H0WYhhfcYmbl8KP+yL9DkdsK6dg6VleFjm
 PYxH7xsgzUIYI/hWRUMeAbSfdu/hpADshUclMluRg4Z/qd36YMae+7RAV6K6EQH8g5FP
 pSqg==
X-Gm-Message-State: AOAM532h13/j2y7J3xtzPP4AxoKZB7pR5JXk6nRgoOXCA6wfTt0WKRO1
 fl34miz1USI5O6DG8QLU4Ts=
X-Google-Smtp-Source: ABdhPJxiTWVhMfeZS/h25YxKr2llCYFvBBkDVrFSwBLm3k+8OQnbUTToI/nSW0TNOI0vksqz7r9BAg==
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr1301416wmm.133.1631477439531; 
 Sun, 12 Sep 2021 13:10:39 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:10:39 -0700 (PDT)
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
Subject: [PATCH v11 27/34] soc/tegra: regulators: Prepare for suspend
Date: Sun, 12 Sep 2021 23:08:25 +0300
Message-Id: <20210912200832.12312-28-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912200832.12312-1-digetx@gmail.com>
References: <20210912200832.12312-1-digetx@gmail.com>
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

Depending on hardware version, Tegra SoC may require a higher voltages
during resume from system suspend, otherwise hardware will crash. Set
SoC voltages to a nominal levels during suspend.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/regulators-tegra20.c |  99 ++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c | 122 +++++++++++++++++++++++++
 2 files changed, 221 insertions(+)

diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
index b8ce9fd0650d..6a2f90ab9d3e 100644
--- a/drivers/soc/tegra/regulators-tegra20.c
+++ b/drivers/soc/tegra/regulators-tegra20.c
@@ -16,7 +16,9 @@
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/suspend.h>
 
+#include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
 struct tegra_regulator_coupler {
@@ -25,9 +27,12 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *cpu_rdev;
 	struct regulator_dev *rtc_rdev;
 	struct notifier_block reboot_notifier;
+	struct notifier_block suspend_notifier;
 	int core_min_uV, cpu_min_uV;
 	bool sys_reboot_mode_req;
 	bool sys_reboot_mode;
+	bool sys_suspend_mode_req;
+	bool sys_suspend_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -105,6 +110,28 @@ static int tegra20_core_rtc_max_spread(struct regulator_dev *core_rdev,
 	return 150000;
 }
 
+static int tegra20_cpu_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	case 0:
+		return 1100000;
+	case 1:
+		return 1025000;
+	default:
+		return 1125000;
+	}
+}
+
+static int tegra20_core_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	default:
+		return 1225000;
+	case 2:
+		return 1300000;
+	}
+}
+
 static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 				   struct regulator_dev *core_rdev,
 				   struct regulator_dev *rtc_rdev,
@@ -144,6 +171,11 @@ static int tegra20_core_rtc_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		core_min_uV = clamp(tegra20_core_nominal_uV(),
+				    core_min_uV, core_max_uV);
+
 	core_uV = regulator_get_voltage_rdev(core_rdev);
 	if (core_uV < 0)
 		return core_uV;
@@ -279,6 +311,11 @@ static int tegra20_cpu_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (tegra->sys_reboot_mode)
 		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		cpu_min_uV = clamp(tegra20_cpu_nominal_uV(),
+				   cpu_min_uV, cpu_max_uV);
+
 	if (cpu_min_uV > cpu_uV) {
 		err = tegra20_core_rtc_update(tegra, core_rdev, rtc_rdev,
 					      cpu_uV, cpu_min_uV);
@@ -320,6 +357,7 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	}
 
 	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+	tegra->sys_suspend_mode = READ_ONCE(tegra->sys_suspend_mode_req);
 
 	if (rdev == cpu_rdev)
 		return tegra20_cpu_voltage_update(tegra, cpu_rdev,
@@ -334,6 +372,63 @@ static int tegra20_regulator_balance_voltage(struct regulator_coupler *coupler,
 	return -EPERM;
 }
 
+static int tegra20_regulator_prepare_suspend(struct tegra_regulator_coupler *tegra,
+					     bool sys_suspend_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->rtc_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	/*
+	 * All power domains are enabled early during resume from suspend
+	 * by GENPD core.  Domains like VENC may require a higher voltage
+	 * when enabled during resume from suspend.  This also prepares
+	 * hardware for resuming from LP0.
+	 */
+
+	WRITE_ONCE(tegra->sys_suspend_mode_req, sys_suspend_mode);
+
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra20_regulator_suspend(struct notifier_block *notifier,
+				     unsigned long mode, void *arg)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret = 0;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     suspend_notifier);
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		ret = tegra20_regulator_prepare_suspend(tegra, true);
+		break;
+
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = tegra20_regulator_prepare_suspend(tegra, false);
+		break;
+	}
+
+	if (ret)
+		pr_err("failed to prepare regulators: %d\n", ret);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra20_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
 					    bool sys_reboot_mode)
 {
@@ -444,6 +539,7 @@ static struct tegra_regulator_coupler tegra20_coupler = {
 		.balance_voltage = tegra20_regulator_balance_voltage,
 	},
 	.reboot_notifier.notifier_call = tegra20_regulator_reboot,
+	.suspend_notifier.notifier_call = tegra20_regulator_suspend,
 };
 
 static int __init tegra_regulator_coupler_init(void)
@@ -456,6 +552,9 @@ static int __init tegra_regulator_coupler_init(void)
 	err = register_reboot_notifier(&tegra20_coupler.reboot_notifier);
 	WARN_ON(err);
 
+	err = register_pm_notifier(&tegra20_coupler.suspend_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra20_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
index e74bbc9c7859..8fd43c689134 100644
--- a/drivers/soc/tegra/regulators-tegra30.c
+++ b/drivers/soc/tegra/regulators-tegra30.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/coupler.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/suspend.h>
 
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
@@ -25,9 +26,12 @@ struct tegra_regulator_coupler {
 	struct regulator_dev *core_rdev;
 	struct regulator_dev *cpu_rdev;
 	struct notifier_block reboot_notifier;
+	struct notifier_block suspend_notifier;
 	int core_min_uV, cpu_min_uV;
 	bool sys_reboot_mode_req;
 	bool sys_reboot_mode;
+	bool sys_suspend_mode_req;
+	bool sys_suspend_mode;
 };
 
 static inline struct tegra_regulator_coupler *
@@ -113,6 +117,52 @@ static int tegra30_core_cpu_limit(int cpu_uV)
 	return -EINVAL;
 }
 
+static int tegra30_cpu_nominal_uV(void)
+{
+	switch (tegra_sku_info.cpu_speedo_id) {
+	case 10 ... 11:
+		return  850000;
+
+	case 9:
+		return  912000;
+
+	case 1 ...  3:
+	case 7 ...  8:
+		return 1050000;
+
+	default:
+		return 1125000;
+
+	case  4 ...  6:
+	case 12 ... 13:
+		return 1237000;
+	}
+}
+
+static int tegra30_core_nominal_uV(void)
+{
+	switch (tegra_sku_info.soc_speedo_id) {
+	case 0:
+		return 1200000;
+
+	case 1:
+		if (tegra_sku_info.cpu_speedo_id != 7 &&
+		    tegra_sku_info.cpu_speedo_id != 8)
+			return 1200000;
+
+		fallthrough;
+
+	case 2:
+		if (tegra_sku_info.cpu_speedo_id != 13)
+			return 1300000;
+
+		return 1350000;
+
+	default:
+		return 1250000;
+	}
+}
+
 static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 				  struct regulator_dev *cpu_rdev,
 				  struct regulator_dev *core_rdev)
@@ -168,6 +218,11 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (err)
 		return err;
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		core_min_uV = clamp(tegra30_core_nominal_uV(),
+				    core_min_uV, core_max_uV);
+
 	core_uV = regulator_get_voltage_rdev(core_rdev);
 	if (core_uV < 0)
 		return core_uV;
@@ -223,6 +278,11 @@ static int tegra30_voltage_update(struct tegra_regulator_coupler *tegra,
 	if (tegra->sys_reboot_mode)
 		cpu_min_uV = max(cpu_min_uV, tegra->cpu_min_uV);
 
+	/* prepare voltage level for suspend */
+	if (tegra->sys_suspend_mode)
+		cpu_min_uV = clamp(tegra30_cpu_nominal_uV(),
+				   cpu_min_uV, cpu_max_uV);
+
 	if (core_min_limited_uV > core_uV) {
 		pr_err("core voltage constraint violated: %d %d %d\n",
 		       core_uV, core_min_limited_uV, cpu_uV);
@@ -292,10 +352,68 @@ static int tegra30_regulator_balance_voltage(struct regulator_coupler *coupler,
 	}
 
 	tegra->sys_reboot_mode = READ_ONCE(tegra->sys_reboot_mode_req);
+	tegra->sys_suspend_mode = READ_ONCE(tegra->sys_suspend_mode_req);
 
 	return tegra30_voltage_update(tegra, cpu_rdev, core_rdev);
 }
 
+static int tegra30_regulator_prepare_suspend(struct tegra_regulator_coupler *tegra,
+					     bool sys_suspend_mode)
+{
+	int err;
+
+	if (!tegra->core_rdev || !tegra->cpu_rdev)
+		return 0;
+
+	/*
+	 * All power domains are enabled early during resume from suspend
+	 * by GENPD core.  Domains like VENC may require a higher voltage
+	 * when enabled during resume from suspend.  This also prepares
+	 * hardware for resuming from LP0.
+	 */
+
+	WRITE_ONCE(tegra->sys_suspend_mode_req, sys_suspend_mode);
+
+	err = regulator_sync_voltage_rdev(tegra->cpu_rdev);
+	if (err)
+		return err;
+
+	err = regulator_sync_voltage_rdev(tegra->core_rdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int tegra30_regulator_suspend(struct notifier_block *notifier,
+				     unsigned long mode, void *arg)
+{
+	struct tegra_regulator_coupler *tegra;
+	int ret = 0;
+
+	tegra = container_of(notifier, struct tegra_regulator_coupler,
+			     suspend_notifier);
+
+	switch (mode) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		ret = tegra30_regulator_prepare_suspend(tegra, true);
+		break;
+
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		ret = tegra30_regulator_prepare_suspend(tegra, false);
+		break;
+	}
+
+	if (ret)
+		pr_err("failed to prepare regulators: %d\n", ret);
+
+	return notifier_from_errno(ret);
+}
+
 static int tegra30_regulator_prepare_reboot(struct tegra_regulator_coupler *tegra,
 					    bool sys_reboot_mode)
 {
@@ -395,6 +513,7 @@ static struct tegra_regulator_coupler tegra30_coupler = {
 		.balance_voltage = tegra30_regulator_balance_voltage,
 	},
 	.reboot_notifier.notifier_call = tegra30_regulator_reboot,
+	.suspend_notifier.notifier_call = tegra30_regulator_suspend,
 };
 
 static int __init tegra_regulator_coupler_init(void)
@@ -407,6 +526,9 @@ static int __init tegra_regulator_coupler_init(void)
 	err = register_reboot_notifier(&tegra30_coupler.reboot_notifier);
 	WARN_ON(err);
 
+	err = register_pm_notifier(&tegra30_coupler.suspend_notifier);
+	WARN_ON(err);
+
 	return regulator_coupler_register(&tegra30_coupler.coupler);
 }
 arch_initcall(tegra_regulator_coupler_init);
-- 
2.32.0

