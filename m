Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C0CA30CD
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E4810E1CC;
	Thu,  4 Dec 2025 09:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="giklFLO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906710E1CC;
 Thu,  4 Dec 2025 09:42:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 68A8D43FAB;
 Thu,  4 Dec 2025 09:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E91C113D0;
 Thu,  4 Dec 2025 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764841320;
 bh=kD+qJAqVxFMhhe2jPl9GIafOGfGtCPN4iVsdl++V/HY=;
 h=From:To:Cc:Subject:Date:From;
 b=giklFLO4ISSaFeZIx89BIbiPz18a7qKOiaSW+RYLdgFIk6Y/BtMm6WBqGmgh2t4Km
 6/b+Or1bMPWvagS72zeN/ydWN4FLq7SqZddkbOb/PH8oXdnSNLY8TK+8DQLi9Qz6Z6
 wQkVIrPR31r3pM10NMLYDH8eNDUMLvmEACEsLO7uK9deh/5bl9OyNMLE3KqSs8f3Oa
 aawLySIb7CbddEBQS/NFEvnFuvKKufVsJ+I/FQ5l0nNKBpfwighCVRyaclA/5ZmybK
 jcmewIxgxMtfOoGZ7VcI53dH6L19m0Qwor2LkZDnaSnFxGycYGdUdFmwfTFkvTuCe6
 rKbRnwVed68uQ==
From: Arnd Bergmann <arnd@kernel.org>
To: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <demarchi@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/pf: fix VFIO link error
Date: Thu,  4 Dec 2025 10:41:36 +0100
Message-Id: <20251204094154.1029357-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

The Makefile logic for building xe_sriov_vfio.o was added incorrectly,
as setting CONFIG_XE_VFIO_PCI=m means it doesn't get included into a
built-in xe driver:

ERROR: modpost: "xe_sriov_vfio_stop_copy_enter" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_stop_copy_exit" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_suspend_device" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_wait_flr_done" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_error" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_resume_data_enter" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_resume_device" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_resume_data_exit" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_data_write" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
ERROR: modpost: "xe_sriov_vfio_migration_supported" [drivers/vfio/pci/xe/xe-vfio-pci.ko] undefined!
WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)

Check for CONFIG_XE_VFIO_PCI being enabled in the Makefile to decide whether to
include the the object instead.

Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index dfc2ded01455..e5f3c2ec9e9a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -185,8 +185,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf_sysfs.o \
 	xe_tile_sriov_pf_debugfs.o
 
-ifeq ($(CONFIG_PCI_IOV),y)
-	xe-$(CONFIG_XE_VFIO_PCI) += xe_sriov_vfio.o
+ifdef CONFIG_XE_VFIO_PCI
+	xe-$(CONFIG_PCI_IOV) += xe_sriov_vfio.o
 endif
 
 # include helpers for tests even when XE is built-in
-- 
2.39.5

