Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3AC310B7F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4536E28A;
	Fri,  5 Feb 2021 13:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58B6E252;
 Fri,  5 Feb 2021 13:03:22 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23797864-1500050 
 for multiple; Fri, 05 Feb 2021 13:03:08 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Autoselect CONFIG_CHECKPOINT_RESTORE for SYS_kcmp
Date: Fri,  5 Feb 2021 13:03:07 +0000
Message-Id: <20210205130307.8294-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gallium (iris) depends on os_same_file_description() to disambiguate
screens and so avoid importing the same screen fd twice as two distinct
entities (that share all the kernel resources, so actions on screen
affect the other and would cause random faiure). As they depend on it,
so must we. os_same_file_description() uses SYS_kcmp to check the file
tables for the equivalent struct file, but SYS_kcmp is hidden behind
CONFIG_CHECKPOINT_RESTORE. As this is not default, we must select it for
ourselves to ensure that our userspace is fully supported.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3046
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 1e1cb245fca7..470a5214bd33 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -21,6 +21,7 @@ config DRM_I915
 	select ACPI_VIDEO if ACPI
 	select ACPI_BUTTON if ACPI
 	select SYNC_FILE
+	select CHECKPOINT_RESTORE # gallium depends on SYS_kcmp
 	select IOSF_MBI
 	select CRC32
 	select SND_HDA_I915 if SND_HDA_CORE
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
