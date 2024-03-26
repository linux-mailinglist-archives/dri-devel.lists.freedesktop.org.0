Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB988CAF5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 18:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E06210F16C;
	Tue, 26 Mar 2024 17:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C2D10F17C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:32:16 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4V3xgy6jy3z4x0JM
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 18:32:14 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by laurent.telenet-ops.be with bizsmtp
 id 3VYD2C00H0SSLxL01VYDYl; Tue, 26 Mar 2024 18:32:14 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rpAeM-0053li-UA;
 Tue, 26 Mar 2024 18:32:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rpAej-001ZOf-Nq;
 Tue, 26 Mar 2024 18:32:13 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: DRM_DEBUG_MODESET_LOCK should depend on DRM
Date: Tue, 26 Mar 2024 18:32:12 +0100
Message-Id: <80bb56a361c3a4f7567f1d8a8adb050fdff62462.1711474310.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

There is no point in asking the user about enabling DRM debug tracing
when configuring a kernel without DRM support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2e1b23ccf30423a9..a24c48acf235449a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -119,9 +119,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 
 config DRM_DEBUG_MODESET_LOCK
 	bool "Enable backtrace history for lock contention"
-	depends on STACKTRACE_SUPPORT
-	depends on DEBUG_KERNEL
-	depends on EXPERT
+	depends on DRM && STACKTRACE_SUPPORT && DEBUG_KERNEL && EXPERT
 	select STACKDEPOT
 	default y if DEBUG_WW_MUTEX_SLOWPATH
 	help
-- 
2.34.1

