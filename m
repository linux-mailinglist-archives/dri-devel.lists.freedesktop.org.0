Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD43DCB423E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 23:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6B310E698;
	Wed, 10 Dec 2025 22:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7F110E698
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 22:24:15 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id E7BC11F80044
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 22:24:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id B9A32B127DD; Wed, 10 Dec 2025 22:24:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=FSL_HELO_NON_FQDN_1,
 HELO_NO_DOMAIN,RDNS_NONE autolearn=no autolearn_force=no version=4.0.0
Received: from collins (unknown [192.168.1.64])
 by laika.paulk.fr (Postfix) with ESMTP id 5A35BB12723;
 Wed, 10 Dec 2025 22:23:44 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Randy Dunlap <rdunlap@infradead.org>,
 Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] drm: Remove remaining DRM_KMS_DMA_HELPER users
Date: Wed, 10 Dec 2025 23:23:37 +0100
Message-ID: <20251210222337.3751485-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.52.0
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

The DRM_KMS_CMA_HELPER config option was removed in commit 09717af7d13d
("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option") but two drivers were
later merged with the option still selected.

The dangling option was later renamed to DRM_KMS_DMA_HELPER with commit
6bcfe8eaeef0 ("drm/fb: rename FB CMA helpers to FB DMA helpers").

Remove the entries in the two drivers, which already select
DRM_GEM_DMA_HELPER (that was previously selected via DRM_KMS_CMA_HELPER).

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/adp/Kconfig     | 1 -
 drivers/gpu/drm/logicvc/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/Kconfig b/drivers/gpu/drm/adp/Kconfig
index 9fcc27eb200d..acfa21ee06d2 100644
--- a/drivers/gpu/drm/adp/Kconfig
+++ b/drivers/gpu/drm/adp/Kconfig
@@ -6,7 +6,6 @@ config DRM_ADP
 	select DRM_KMS_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_HELPER
-	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
index 579a358ed5cf..11aae1626199 100644
--- a/drivers/gpu/drm/logicvc/Kconfig
+++ b/drivers/gpu/drm/logicvc/Kconfig
@@ -4,7 +4,6 @@ config DRM_LOGICVC
 	depends on OF || COMPILE_TEST
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
-	select DRM_KMS_DMA_HELPER
 	select DRM_GEM_DMA_HELPER
 	select REGMAP
 	select REGMAP_MMIO
-- 
2.52.0

