Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468B28CB35
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 11:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6986E0FE;
	Tue, 13 Oct 2020 09:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801406E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 09:52:06 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C079C2072D;
 Tue, 13 Oct 2020 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602582725;
 bh=4hV24SHAfY5SL8uf1EAQ98qqN7m/73Ea0qvYhOy9PeI=;
 h=From:To:Cc:Subject:Date:From;
 b=skhGfj6+mycCZkwf132QtLbELnW6d4XD0DzS5JwCqH4wgfgKXkoopvCenSBeFSCmq
 IWgprmIjqkFI9j0X9V90argHAyGfLG8BR2wsWv/+pOg69Xh79sgXjKjG74i+4KsCpj
 qyUzo8VPMMait2EoV7umfNIqOfNVDnTHav+goakc=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=hot-poop.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kSGyR-000n74-Ns; Tue, 13 Oct 2020 10:52:03 +0100
From: Marc Zyngier <maz@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: sor: Ensure regulators are disabled on teardown
Date: Tue, 13 Oct 2020 10:51:58 +0100
Message-Id: <20201013095158.311137-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Tegra SOR driver uses the devm infrastructure to request regulators,
but enables them without registering them with the infrastructure.

This results in the following splat if probing fails for any odd resaon
(such as dependencies not being available):

[    8.974187] tegra-sor 15580000.sor: cannot get HDMI supply: -517
[    9.414403] tegra-sor 15580000.sor: failed to probe HDMI: -517
[    9.421240] ------------[ cut here ]------------
[    9.425879] WARNING: CPU: 1 PID: 164 at drivers/regulator/core.c:2089 _regulator_put.part.0+0x16c/0x174
[    9.435259] Modules linked in: tegra_drm(E+) cec(E) ahci_tegra(E) drm_kms_helper(E) drm(E) libahci_platform(E) libahci(E) max77620_regulator(E) xhci_tegra(E+) sdhci_tegra(E) xhci_hcd(E) libata(E) sdhci_pltfm(E) cqhci(E) fixed(E) usbcore(E) scsi_mod(E) sdhci(E) host1x(E)
[    9.459211] CPU: 1 PID: 164 Comm: systemd-udevd Tainted: G S    D W   E     5.9.0-rc7-00298-gf6337624c4fe #1980
[    9.469285] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[    9.475202] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
[    9.480784] pc : _regulator_put.part.0+0x16c/0x174
[    9.485581] lr : regulator_put+0x44/0x60
[    9.489501] sp : ffffffc011d837b0
[    9.492814] x29: ffffffc011d837b0 x28: ffffff81dd085900
[    9.498141] x27: ffffff81de1c8ec0 x26: ffffff81de1c8c10
[    9.503464] x25: ffffff81dd085800 x24: ffffffc008f2c6b0
[    9.508790] x23: ffffffc0117373f0 x22: 0000000000000005
[    9.514101] x21: ffffff81dd085900 x20: ffffffc01172b098
[    9.515822] ata1: SATA link down (SStatus 0 SControl 300)
[    9.519426] x19: ffffff81dd085100 x18: 0000000000000030
[    9.530122] x17: 0000000000000000 x16: 0000000000000000
[    9.535453] x15: 0000000000000000 x14: 000000000000038f
[    9.540777] x13: 0000000000000003 x12: 0000000000000040
[    9.546105] x11: ffffff81eb800000 x10: 0000000000000ae0
[    9.551417] x9 : ffffffc0106fea24 x8 : ffffff81de83e6c0
[    9.556728] x7 : 0000000000000018 x6 : 00000000000003c3
[    9.562064] x5 : 0000000000005660 x4 : 0000000000000000
[    9.567392] x3 : ffffffc01172b388 x2 : ffffff81de83db80
[    9.572702] x1 : 0000000000000000 x0 : 0000000000000001
[    9.578034] Call trace:
[    9.580494]  _regulator_put.part.0+0x16c/0x174
[    9.584940]  regulator_put+0x44/0x60
[    9.588522]  devm_regulator_release+0x20/0x2c
[    9.592885]  release_nodes+0x1c8/0x2c0
[    9.596636]  devres_release_all+0x44/0x6c
[    9.600649]  really_probe+0x1ec/0x504
[    9.604316]  driver_probe_device+0x100/0x170
[    9.608589]  device_driver_attach+0xcc/0xd4
[    9.612774]  __driver_attach+0xb0/0x17c
[    9.616614]  bus_for_each_dev+0x7c/0xd4
[    9.620450]  driver_attach+0x30/0x3c
[    9.624027]  bus_add_driver+0x154/0x250
[    9.627867]  driver_register+0x84/0x140
[    9.631719]  __platform_register_drivers+0xa0/0x180
[    9.636660]  host1x_drm_init+0x60/0x1000 [tegra_drm]
[    9.641629]  do_one_initcall+0x54/0x2d0
[    9.645490]  do_init_module+0x68/0x29c
[    9.649244]  load_module+0x2178/0x26c0
[    9.652997]  __do_sys_finit_module+0xb0/0x120
[    9.657356]  __arm64_sys_finit_module+0x2c/0x40
[    9.661902]  el0_svc_common.constprop.0+0x80/0x240
[    9.666701]  do_el0_svc+0x30/0xa0
[    9.670022]  el0_svc+0x18/0x50
[    9.673081]  el0_sync_handler+0x90/0x318
[    9.677006]  el0_sync+0x158/0x180
[    9.680324] ---[ end trace 90f6c89d62d85ff6 ]---

Instead, let's register a callback that will disable the regulators
on teardown. This allows for the removal of the .remove callbacks,
which are not needed anymore.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/tegra/sor.c | 59 +++++++++++++++----------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 45b5258c77a2..39e6b32f6c10 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -397,7 +397,6 @@ struct tegra_sor;
 struct tegra_sor_ops {
 	const char *name;
 	int (*probe)(struct tegra_sor *sor);
-	int (*remove)(struct tegra_sor *sor);
 	void (*audio_enable)(struct tegra_sor *sor);
 	void (*audio_disable)(struct tegra_sor *sor);
 };
@@ -2942,6 +2941,24 @@ static const struct drm_encoder_helper_funcs tegra_sor_dp_helpers = {
 	.atomic_check = tegra_sor_encoder_atomic_check,
 };
 
+static void tegra_sor_disable_regulator(void *data)
+{
+	struct regulator *reg = data;
+
+	regulator_disable(reg);
+}
+
+static int tegra_sor_enable_regulator(struct tegra_sor *sor, struct regulator *reg)
+{
+	int err;
+
+	err = regulator_enable(reg);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(sor->dev, tegra_sor_disable_regulator, reg);
+}
+
 static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 {
 	int err;
@@ -2953,7 +2970,7 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 		return PTR_ERR(sor->avdd_io_supply);
 	}
 
-	err = regulator_enable(sor->avdd_io_supply);
+	err = tegra_sor_enable_regulator(sor, sor->avdd_io_supply);
 	if (err < 0) {
 		dev_err(sor->dev, "failed to enable AVDD I/O supply: %d\n",
 			err);
@@ -2967,7 +2984,7 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 		return PTR_ERR(sor->vdd_pll_supply);
 	}
 
-	err = regulator_enable(sor->vdd_pll_supply);
+	err = tegra_sor_enable_regulator(sor, sor->vdd_pll_supply);
 	if (err < 0) {
 		dev_err(sor->dev, "failed to enable VDD PLL supply: %d\n",
 			err);
@@ -2981,7 +2998,7 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 		return PTR_ERR(sor->hdmi_supply);
 	}
 
-	err = regulator_enable(sor->hdmi_supply);
+	err = tegra_sor_enable_regulator(sor, sor->hdmi_supply);
 	if (err < 0) {
 		dev_err(sor->dev, "failed to enable HDMI supply: %d\n", err);
 		return err;
@@ -2992,19 +3009,9 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 	return 0;
 }
 
-static int tegra_sor_hdmi_remove(struct tegra_sor *sor)
-{
-	regulator_disable(sor->hdmi_supply);
-	regulator_disable(sor->vdd_pll_supply);
-	regulator_disable(sor->avdd_io_supply);
-
-	return 0;
-}
-
 static const struct tegra_sor_ops tegra_sor_hdmi_ops = {
 	.name = "HDMI",
 	.probe = tegra_sor_hdmi_probe,
-	.remove = tegra_sor_hdmi_remove,
 	.audio_enable = tegra_sor_hdmi_audio_enable,
 	.audio_disable = tegra_sor_hdmi_audio_disable,
 };
@@ -3017,7 +3024,7 @@ static int tegra_sor_dp_probe(struct tegra_sor *sor)
 	if (IS_ERR(sor->avdd_io_supply))
 		return PTR_ERR(sor->avdd_io_supply);
 
-	err = regulator_enable(sor->avdd_io_supply);
+	err = tegra_sor_enable_regulator(sor, sor->avdd_io_supply);
 	if (err < 0)
 		return err;
 
@@ -3025,25 +3032,16 @@ static int tegra_sor_dp_probe(struct tegra_sor *sor)
 	if (IS_ERR(sor->vdd_pll_supply))
 		return PTR_ERR(sor->vdd_pll_supply);
 
-	err = regulator_enable(sor->vdd_pll_supply);
+	err = tegra_sor_enable_regulator(sor, sor->vdd_pll_supply);
 	if (err < 0)
 		return err;
 
 	return 0;
 }
 
-static int tegra_sor_dp_remove(struct tegra_sor *sor)
-{
-	regulator_disable(sor->vdd_pll_supply);
-	regulator_disable(sor->avdd_io_supply);
-
-	return 0;
-}
-
 static const struct tegra_sor_ops tegra_sor_dp_ops = {
 	.name = "DP",
 	.probe = tegra_sor_dp_probe,
-	.remove = tegra_sor_dp_remove,
 };
 
 static int tegra_sor_init(struct host1x_client *client)
@@ -3769,7 +3767,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		if (err < 0) {
 			dev_err(&pdev->dev, "failed to probe %s: %d\n",
 				sor->ops->name, err);
-			goto output;
+			goto remove;
 		}
 	}
 
@@ -3950,9 +3948,6 @@ static int tegra_sor_probe(struct platform_device *pdev)
 rpm_disable:
 	pm_runtime_disable(&pdev->dev);
 remove:
-	if (sor->ops && sor->ops->remove)
-		sor->ops->remove(sor);
-output:
 	tegra_output_remove(&sor->output);
 	return err;
 }
@@ -3971,12 +3966,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	if (sor->ops && sor->ops->remove) {
-		err = sor->ops->remove(sor);
-		if (err < 0)
-			dev_err(&pdev->dev, "failed to remove SOR: %d\n", err);
-	}
-
 	tegra_output_remove(&sor->output);
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
