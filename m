Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0CD90BC2B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F1B10E4E3;
	Mon, 17 Jun 2024 20:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="ijh+uWnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 20:30:13 UTC
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DBD10E076;
 Mon, 17 Jun 2024 20:30:13 +0000 (UTC)
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1718655735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KE0itf7SPq2y4IgF/9FfRchQi+X27+0vxz0kqB+YZMM=;
 b=ijh+uWnh8LENHexsTozHC6SCsZIJn8G4mw7xG0hs93oJN1KIgpWNCrQ67kUjpTIq8E+K2G
 lbJPkDV0kis73ZrBp0t/RC2PvLK5IyiPq2a4ZDeBxcbTUeD71na3sUM+X3Wu/xeSbVf6J3
 2o4eZVyURX04DEc4qpGkAdxAmhasS6WyyYbbcZq+GDt6sTAnwMXXfZfUUnrs/cwiaEUXiZ
 mG4rSG7QBXwqWLoFsvJ5JusfPzew6UIw6yXaKRHTk9FRB/0e7Zydl8BujE2WPcmFy2hS5L
 G7GHchrWa0t8/mPid2Vj2P8Ebxul08P+4FTC8gwPdIUQRblg+GHU0mjSe+H5eQ==
To: dri-devel@lists.freedesktop.org,
	lima@lists.freedesktop.org
Cc: yuq825@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, Philip Muller <philm@manjaro.org>,
 Oliver Smith <ollieparanoid@postmarketos.org>,
 Daniel Smith <danct12@disroot.org>, stable@vger.kernel.org
Subject: [PATCH] drm/lima: Mark simple_ondemand governor as softdep
Date: Mon, 17 Jun 2024 22:22:02 +0200
Message-Id: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Lima DRM driver uses devfreq to perform DVFS, while using simple_ondemand
devfreq governor by default.  This causes driver initialization to fail on
boot when simple_ondemand governor isn't built into the kernel statically,
as a result of the missing module dependency and, consequently, the required
governor module not being included in the initial ramdisk.  Thus, let's mark
simple_ondemand governor as a softdep for Lima, to have its kernel module
included in the initial ramdisk.

This is a rather longstanding issue that has forced distributions to build
devfreq governors statically into their kernels, [1][2] or may have forced
some users to introduce unnecessary workarounds.

Having simple_ondemand marked as a softdep for Lima may not resolve this
issue for all Linux distributions.  In particular, it will remain unresolved
for the distributions whose utilities for the initial ramdisk generation do
not handle the available softdep information [3] properly yet.  However, some
Linux distributions already handle softdeps properly while generating their
initial ramdisks, [4] and this is a prerequisite step in the right direction
for the distributions that don't handle them properly yet.

[1] https://gitlab.manjaro.org/manjaro-arm/packages/core/linux-pinephone/-/blob/6.7-megi/config?ref_type=heads#L5749
[2] https://gitlab.com/postmarketOS/pmaports/-/blob/7f64e287e7732c9eaa029653e73ca3d4ba1c8598/main/linux-postmarketos-allwinner/config-postmarketos-allwinner.aarch64#L4654
[3] https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=49d8e0b59052999de577ab732b719cfbeb89504d
[4] https://github.com/archlinux/mkinitcpio/commit/97ac4d37aae084a050be512f6d8f4489054668ad

Cc: Philip Muller <philm@manjaro.org>
Cc: Oliver Smith <ollieparanoid@postmarketos.org>
Cc: Daniel Smith <danct12@disroot.org>
Cc: stable@vger.kernel.org
Fixes: 1996970773a3 ("drm/lima: Add optional devfreq and cooling device support")
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/lima/lima_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 739c865b556f..10bce18b7c31 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -501,3 +501,4 @@ module_platform_driver(lima_platform_driver);
 MODULE_AUTHOR("Lima Project Developers");
 MODULE_DESCRIPTION("Lima DRM Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_SOFTDEP("pre: governor_simpleondemand");
