Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267008D2F04
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBAF10EEB9;
	Wed, 29 May 2024 08:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e+WAVCil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186EA113430
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:00:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C5696CE1177;
 Wed, 29 May 2024 08:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94165C32781;
 Wed, 29 May 2024 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716969617;
 bh=/qEGEon/wPSrrv2hvhLpEbTxhGP7PPwaY7kIIbfcbMA=;
 h=From:To:Cc:Subject:Date:From;
 b=e+WAVCilmEF8Fkegz6QQk0dPw7wLGGK78VpVIrjKdXS10GxSs4fY3WX/4e9ZQ2C3E
 DxC22yi6WvTGFIAUWw3PpSbYjBBwUE1X2RHQ5BxT1b1BrAYNKcI/PFmMzH0UquxUUd
 HyslV9OabhxCdj0TvXpZZNvdXFG4hVNM40MEcIU1MlIralTm6pAvJDxWt2LOecAuQ7
 3vLUwuPG6T11OvlbD2xDX4g4xJq0Zqaijc/imz775+7gOegOUa+o0UgwCp4ApBIpPX
 1dvZB5wJVKgGgEZ/tHM0llERKEEI1NQzC+abIBYfPWDxHTya5i6Ph9cri1BuPEJ7gd
 ejMXQIa5MA5hw==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/display: Fix HDMI state helper dependency
Date: Wed, 29 May 2024 10:00:13 +0200
Message-ID: <20240529080013.2325748-1-mripard@kernel.org>
X-Mailer: git-send-email 2.45.0
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

During the life of the series that introduced the
DRM_DISPLAY_HDMI_STATE_HELPER option, we reworked the Kconfig option
dependency setup to rely on depends on with commit f6d2dc03fa85 ("drm:
Switch DRM_DISPLAY_HDMI_HELPER to depends on") which got reverted later
on because it was creating too many issues by commit d7c128cb775e
("Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"").

However, since the series was out of tree at that time,
DRM_DISPLAY_HDMI_STATE_HELPER wasn't properly updated to take the revert
into account and is now creating build issues.

Let's switch the depends on to a select to fix this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405290332.Sqtt0ix0-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202405290438.TOYhXMIn-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202405290803.c3178DYT-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202405291109.PQdqc46g-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202405291221.a0NStxHE-lkp@intel.com/
Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 14114b597ef4..479e62690d75 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -72,8 +72,8 @@ config DRM_DISPLAY_HDMI_HELPER
 	  DRM display helpers for HDMI.
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
-	depends on DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
-- 
2.45.0

