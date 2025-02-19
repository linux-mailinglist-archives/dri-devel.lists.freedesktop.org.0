Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A15A3C9B4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76A610E365;
	Wed, 19 Feb 2025 20:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzJ+coWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330610E892;
 Wed, 19 Feb 2025 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739996929; x=1771532929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kdx43vBPxQuJgAnPefatV3H8gKQrTpuV5MOzEF/ZEe8=;
 b=FzJ+coWt4+ippL5YWfVvA0WDCZlGiWd8ahRQkLM7PP3FLS6sDUml7uqL
 IwVhjXIuhdoquk0dk+NnDFtCGnTAGrchgOi7QxXbwDaIPJ6BW31Ab1lGH
 15qe+mVeu4hlM6QAMKSb/FLbYfjXoiHGeqkuG83Ykriar3FQOQi/r2+Z5
 4nsQw0nJmStI4TGBaIfWjNJntFLOWx5xkpW6XytbquN1K1Ert+/F3lo+4
 LiwndgVhdbs3687I7Fd6yKvgq7Sf75GLgvytK2nADl0jI58FnPIrlWCCB
 XrePWDFKAPu3/9YxZL6SrzTcBnRqiwMGaaESiRcz/D6EZwHXFi0Y7y+HS g==;
X-CSE-ConnectionGUID: VAMdxxYESFmteRt/ZCdbIg==
X-CSE-MsgGUID: hrVIFiiSRbi1Vwbbv6g/Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41012235"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="41012235"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:28:47 -0800
X-CSE-ConnectionGUID: YQa4z64jQ++2IFyUtInrCw==
X-CSE-MsgGUID: TbmbTKOLSTavpPhFyW/bpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119765720"
Received: from dut4410lnl.fm.intel.com ([10.105.8.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:28:47 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v4 1/6] drm/xe/xe_exec_queue: Add ID param to exec queue struct
Date: Wed, 19 Feb 2025 20:28:41 +0000
Message-ID: <20250219202847.127425-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219202847.127425-1-jonathan.cavitt@intel.com>
References: <20250219202847.127425-1-jonathan.cavitt@intel.com>
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

Add the exec queue id to the exec queue struct.  This is useful for
performing a reverse lookup into the xef->exec_queue xarray.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 23a9f519ce1c..4a98a5d0e405 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -709,6 +709,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto kill_exec_queue;
 
+	q->id = id;
 	args->exec_queue_id = id;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6eb7ff091534..088d838218e9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -55,6 +55,8 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
+	/** @id: exec queue ID as reported during create ioctl */
+	u32 id;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
-- 
2.43.0

