Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79425A8223A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 12:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E9010E83B;
	Wed,  9 Apr 2025 10:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEyY/BPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D4B10E83B;
 Wed,  9 Apr 2025 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744194840; x=1775730840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5g4K5yO5TsniZ7IMNh0B2hhLNYraKLVSmKpjG/QApGE=;
 b=XEyY/BPOzYwegJvaOLWAXoffGrnXRhIY0S8evfS/v3dnST2RlEpNPSMm
 LwsFKJRVYwUkVGKKTkYelFZ8YN2W/pzhXCJz9rf6cl9Au67GUIzqTBE81
 JRRszENryimjS+D6cRpoT2PgToNSXN0LYt/w22ROomLrL0IKplU1y+KOU
 PtKKXG/dT+sM0qsKIPdabYdMX9lk+xz7thRXefiCFtwhSrRDxcFO1ksUo
 d4mxnLGzbBURyPdATrtvM/dcXTEg/lnVxKMHL+yX4dtvjMmiIsgfjoicW
 wTczqlLJdTbD8TWQScZPmRDUJxSlKqZpKejsJegnZjS5JhHcCaHis9u6Z Q==;
X-CSE-ConnectionGUID: lKS+fdhMTzW30CJjpBYTWg==
X-CSE-MsgGUID: JtYmaPKCRGm0zX07O3W/9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45792991"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="45792991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 03:33:59 -0700
X-CSE-ConnectionGUID: OHwJ2eF2TvShuNbMZfZWMw==
X-CSE-MsgGUID: UpCrYee0RjeZzVDlJ5qQPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128527903"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 03:33:57 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id C391E11FB1F;
 Wed,  9 Apr 2025 13:33:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
 (envelope-from <sakari.ailus@linux.intel.com>) id 1u2Skk-00FMYJ-2M;
 Wed, 09 Apr 2025 13:33:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 1/1] drm/nouveau/disp: Use dev->dev to get the device
Date: Wed,  9 Apr 2025 13:33:44 +0300
Message-Id: <20250409103344.3661603-1-sakari.ailus@linux.intel.com>
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

The local variable dev points to drm->dev already, use dev directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi folks,

The background is that I'll be using a Coccinelle spatch soon to remove
(most) pm_runtime_mark_last_busy() calls. That won't work if the arguments
aren't the same.

- Sakari

 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index add006fc8d81..c50ec347b30a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -495,7 +495,7 @@ nouveau_display_hpd_work(struct work_struct *work)
 	if (first_changed_connector)
 		drm_connector_put(first_changed_connector);
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
+	pm_runtime_mark_last_busy(dev->dev);
 noop:
 	pm_runtime_put_autosuspend(dev->dev);
 }
-- 
2.39.5

