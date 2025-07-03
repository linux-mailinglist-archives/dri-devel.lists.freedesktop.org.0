Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19140AF8149
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 21:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723E310E8CF;
	Thu,  3 Jul 2025 19:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiMdVhIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA8710E8CF;
 Thu,  3 Jul 2025 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751570824; x=1783106824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IlroywlKbJTxbgFXfvixBNi1PxBQUvaIHsJkVuBe1aM=;
 b=AiMdVhINlsF9vV8PtO5Ub1URz7ke4X/oAOLgVQBqUi4lO5xElSUiOQzc
 CuFXqRrq4KcvRYbrlEHvMpQQRe8SnLnJ1zou4HiBnoY09roVPU82pd5AC
 SoX7rOoUulPfefoFMclB5KFDHQQHGTp3OOUC+km1ORgYHq0aH4cRlyhOQ
 8rOkPH/At4JKaNbbBhF8U97Ajh8SkqeURXd2j+0h7LvjghcYASqi2SFNZ
 YvFIlLL9Cukowtjv2wveIqOYJefyU23ZmyPV8+Uw1FnQx26HSD8JnRqsE
 rcVVczHC/5ETcDEhq2xFsgX6YrhAy9Qzm7Wg6H3WcV6X/XmMN8lsuTrJw w==;
X-CSE-ConnectionGUID: i34ONx8XQ7CthrjjckO3qQ==
X-CSE-MsgGUID: WVkz+H9YS8GsL5qv+mEJNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65362016"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="65362016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:27:04 -0700
X-CSE-ConnectionGUID: Ot3QpFn2QPWjwczOGpdDBA==
X-CSE-MsgGUID: 9k49KdGKQIuEI1z7vnArxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="191624662"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:27:02 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v6 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw
 during system resume
Date: Fri,  4 Jul 2025 01:01:03 +0530
Message-Id: <20250703193106.954536-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703193106.954536-1-badal.nilawar@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
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

Reload late binding fw during resume from system suspend

v2:
  - Unconditionally reload late binding fw (Rodrigo)
  - Flush worker during system suspend

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 734fe259600e..13afaf97d831 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -127,6 +127,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -205,6 +207,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

