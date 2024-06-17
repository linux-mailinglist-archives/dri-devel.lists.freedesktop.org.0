Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAC90BC22
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E4410E4DF;
	Mon, 17 Jun 2024 20:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="Ij22bNSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 20:25:13 UTC
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE22410E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:25:13 +0000 (UTC)
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1718655474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6nJ2AJoxxGOzx8FlzxjSHQ63pZJ01vIWAcBtW0WpNeE=;
 b=Ij22bNShaPPe/gdzZ0oHStjzEKfSKZ1tehWFhhbe9x/419UocSw+CG6QsGDr4qrLjKu8O8
 FnFSHoDI9D18TseRQM/gTKU53h06vpEUQh5rAiaAHPL+FYaXP/geIPr4rEONABCM2qpuBe
 k9uVHwUn2iiQ25Qd5Qo5ihOdtPnm/pOIpgauGkBma5vMG84/dFND/frm8mzUp6hdlAufFj
 AGdDnzF2yQ64ZfCoyOPk0fSAZ8kBr+ODbVcrOd0g9gd32y0Gz6/Y/IcDrzs4xz6m65iYCW
 wF/Z+iYgm9SmhTJ/X0AnhN98lgPFCnTTxruOp8OPqIqJqD6J2BTeU/jbsRKA3Q==
To: dri-devel@lists.freedesktop.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Furkan Kardame <f.kardame@manjaro.org>, stable@vger.kernel.org
Subject: [PATCH] drm/panfrost: Mark simple_ondemand governor as softdep
Date: Mon, 17 Jun 2024 22:17:48 +0200
Message-Id: <4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Panfrost DRM driver uses devfreq to perform DVFS, while using simple_ondemand
devfreq governor by default.  This causes driver initialization to fail on
boot when simple_ondemand governor isn't built into the kernel statically,
as a result of the missing module dependency and, consequently, the required
governor module not being included in the initial ramdisk.  Thus, let's mark
simple_ondemand governor as a softdep for Panfrost, to have its kernel module
included in the initial ramdisk.

This is a rather longstanding issue that has forced distributions to build
devfreq governors statically into their kernels, [1][2] or has forced users
to introduce some unnecessary workarounds. [3]

For future reference, not having support for the simple_ondemand governor in
the initial ramdisk produces errors in the kernel log similar to these below,
which were taken from a Pine64 RockPro64:

  panfrost ff9a0000.gpu: [drm:panfrost_devfreq_init [panfrost]] *ERROR* Couldn't initialize GPU devfreq
  panfrost ff9a0000.gpu: Fatal error during GPU init
  panfrost: probe of ff9a0000.gpu failed with error -22

Having simple_ondemand marked as a softdep for Panfrost may not resolve this
issue for all Linux distributions.  In particular, it will remain unresolved
for the distributions whose utilities for the initial ramdisk generation do
not handle the available softdep information [4] properly yet.  However, some
Linux distributions already handle softdeps properly while generating their
initial ramdisks, [5] and this is a prerequisite step in the right direction
for the distributions that don't handle them properly yet.

[1] https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/linux61/config?ref_type=heads#L8180
[2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/1066
[3] https://forum.pine64.org/showthread.php?tid=15458
[4] https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=49d8e0b59052999de577ab732b719cfbeb89504d
[5] https://github.com/archlinux/mkinitcpio/commit/97ac4d37aae084a050be512f6d8f4489054668ad

Cc: Diederik de Haas <didi.debian@cknow.org>
Cc: Furkan Kardame <f.kardame@manjaro.org>
Cc: stable@vger.kernel.org
Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ef9f6c0716d5..149737d7a07e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -828,3 +828,4 @@ module_platform_driver(panfrost_driver);
 MODULE_AUTHOR("Panfrost Project Developers");
 MODULE_DESCRIPTION("Panfrost DRM Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_SOFTDEP("pre: governor_simpleondemand");
