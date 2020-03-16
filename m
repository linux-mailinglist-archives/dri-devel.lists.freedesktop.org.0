Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C16151861F4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 03:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C136C6E312;
	Mon, 16 Mar 2020 02:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56066E326
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:35:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA9612073C;
 Mon, 16 Mar 2020 02:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326129;
 bh=x+FTAAyhFq6TVGlwzx7by7EMdoDZnaysRDkXNvrL3Pw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=siXuNFSrQoWaVm0ZAiEWR58pMwIvthp22j1rUehcoQu91vqVocQFLJ32n/CEwq3Km
 NElTS8h+ux7nbD/4dKFV3DYKxBuHEGQvl9H2QvM3fjZlgb+bF88/Tlf+D7uahw9Ea8
 xVi0g26eowkci42SeETKLvtnXHCWizqkKVBII3zA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 08/15] drm/exynos: dsi: fix workaround for the
 legacy clock name
Date: Sun, 15 Mar 2020 22:35:12 -0400
Message-Id: <20200316023519.2050-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023519.2050-1-sashal@kernel.org>
References: <20200316023519.2050-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit c0fd99d659ba5582e09625c7a985d63fc2ca74b5 ]

Writing to the built-in strings arrays doesn't work if driver is loaded
as kernel module. This is also considered as a bad pattern. Fix this by
adding a call to clk_get() with legacy clock name. This fixes following
kernel oops if driver is loaded as module:

Unable to handle kernel paging request at virtual address bf047978
 pgd = (ptrval)
 [bf047978] *pgd=59344811, *pte=5903c6df, *ppte=5903c65f
 Internal error: Oops: 80f [#1] SMP ARM
 Modules linked in: mc exynosdrm(+) analogix_dp rtc_s3c exynos_ppmu i2c_gpio
 CPU: 1 PID: 212 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200219 #326
 videodev: Linux video capture interface: v2.00
 Hardware name: Samsung Exynos (Flattened Device Tree)
 PC is at exynos_dsi_probe+0x1f0/0x384 [exynosdrm]
 LR is at exynos_dsi_probe+0x1dc/0x384 [exynosdrm]
 ...
 Process systemd-udevd (pid: 212, stack limit = 0x(ptrval))
 ...
 [<bf03cf14>] (exynos_dsi_probe [exynosdrm]) from [<c09b1ca0>] (platform_drv_probe+0x6c/0xa4)
 [<c09b1ca0>] (platform_drv_probe) from [<c09afcb8>] (really_probe+0x210/0x350)
 [<c09afcb8>] (really_probe) from [<c09aff74>] (driver_probe_device+0x60/0x1a0)
 [<c09aff74>] (driver_probe_device) from [<c09b0254>] (device_driver_attach+0x58/0x60)
 [<c09b0254>] (device_driver_attach) from [<c09b02dc>] (__driver_attach+0x80/0xbc)
 [<c09b02dc>] (__driver_attach) from [<c09ade00>] (bus_for_each_dev+0x68/0xb4)
 [<c09ade00>] (bus_for_each_dev) from [<c09aefd8>] (bus_add_driver+0x130/0x1e8)
 [<c09aefd8>] (bus_add_driver) from [<c09b0d64>] (driver_register+0x78/0x110)
 [<c09b0d64>] (driver_register) from [<bf038558>] (exynos_drm_init+0xe8/0x11c [exynosdrm])
 [<bf038558>] (exynos_drm_init [exynosdrm]) from [<c0302fa8>] (do_one_initcall+0x50/0x220)
 [<c0302fa8>] (do_one_initcall) from [<c03dd02c>] (do_init_module+0x60/0x210)
 [<c03dd02c>] (do_init_module) from [<c03dbf44>] (load_module+0x1c0c/0x2310)
 [<c03dbf44>] (load_module) from [<c03dc85c>] (sys_finit_module+0xac/0xbc)
 [<c03dc85c>] (sys_finit_module) from [<c0301000>] (ret_fast_syscall+0x0/0x54)
 Exception stack(0xd979bfa8 to 0xd979bff0)
 ...
 ---[ end trace db16efe05faab470 ]---

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index aef18f807e383..366c975cde5b7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1754,9 +1754,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
 		if (IS_ERR(dsi->clks[i])) {
 			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
-				strcpy(clk_names[i], OLD_SCLK_MIPI_CLK_NAME);
-				i--;
-				continue;
+				dsi->clks[i] = devm_clk_get(dev,
+							OLD_SCLK_MIPI_CLK_NAME);
+				if (!IS_ERR(dsi->clks[i]))
+					continue;
 			}
 
 			dev_info(dev, "failed to get the clock: %s\n",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
