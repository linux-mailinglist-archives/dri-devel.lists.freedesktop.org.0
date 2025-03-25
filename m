Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64A3A6F776
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CD510E554;
	Tue, 25 Mar 2025 11:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpoTKfse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB18710E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742903227; x=1774439227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BE4W5CIEeCUAQLerKm/j9es9LpqKQ7M9tjBCHlvmR3w=;
 b=bpoTKfseDf8qNdSZoxT4LcZMdpuokKwlUwGX+shGsJ2mwbDWCIKgwR+Q
 U+ZBtbhhUJfPfmWZCF296T7Kzv6Hb6AeFvf3sH0i5bDlAMdmAqOl8N/p2
 L+hYpgLzdJcuEekk9Fx3C7Jl9q8xLkjjcsADT2InqA40+njnYMq/B+pue
 bKqR9KwTK4ks6Fq+GlS5pYah2WfYQvmuROOxOy1/xO8w65uJGcagKKWrf
 6jN19khmZPeHR58tv+SV2UM6oGiYnx0kMWd+VgBswrQAuSC9FM2c32w1h
 RfRbDuD7QdAyyXqjo6biYJAgw/txfbyZcUTmd12A6AHd/iZieTYh28jPc g==;
X-CSE-ConnectionGUID: HLeu/MNjQDe/qGGJZtV45g==
X-CSE-MsgGUID: rcVExjKFQjWO3o8u4iI74g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47927679"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47927679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:47:07 -0700
X-CSE-ConnectionGUID: qVge1cvASqOh9SJpRedJig==
X-CSE-MsgGUID: pNiVBXTXRn+p4XpMn1cDNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124162141"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:47:05 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 stable@vger.kernel.org, Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 1/2] accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
Date: Tue, 25 Mar 2025 12:43:05 +0100
Message-ID: <20250325114306.3740022-2-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
References: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Fix deadlock in ivpu_ms_cleanup() by preventing runtime resume after
file_priv->ms_lock is acquired.

During a failure in runtime resume, a cold boot is executed, which
calls ivpu_ms_cleanup_all(). This function calls ivpu_ms_cleanup()
that acquires file_priv->ms_lock and causes the deadlock.

Fixes: cdfad4db7756 ("accel/ivpu: Add NPU profiling support")
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
index ffe7b10f8a76..eb485cf15ad6 100644
--- a/drivers/accel/ivpu/ivpu_ms.c
+++ b/drivers/accel/ivpu/ivpu_ms.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_file.h>
+#include <linux/pm_runtime.h>
 
 #include "ivpu_drv.h"
 #include "ivpu_gem.h"
@@ -281,6 +282,9 @@ int ivpu_ms_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *
 void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
 {
 	struct ivpu_ms_instance *ms, *tmp;
+	struct ivpu_device *vdev = file_priv->vdev;
+
+	pm_runtime_get_sync(vdev->drm.dev);
 
 	mutex_lock(&file_priv->ms_lock);
 
@@ -293,6 +297,8 @@ void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
 		free_instance(file_priv, ms);
 
 	mutex_unlock(&file_priv->ms_lock);
+
+	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
 void ivpu_ms_cleanup_all(struct ivpu_device *vdev)
-- 
2.43.0

