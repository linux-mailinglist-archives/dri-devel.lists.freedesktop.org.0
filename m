Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81294A488B7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 20:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC3F10EB6C;
	Thu, 27 Feb 2025 19:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnLLDrhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EA810EB6C;
 Thu, 27 Feb 2025 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683703; x=1772219703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kdx43vBPxQuJgAnPefatV3H8gKQrTpuV5MOzEF/ZEe8=;
 b=AnLLDrhHLRGwjlHRQxSty6MqfLP9hRz279d8iPpWA1jWGGNNHnpZCPfm
 YAW56q2DKBQCaRGfXC25bu6XfC7OXlWYYqtQhPUfKAC9Ecp1Y9ai8EvyT
 k8Li2pMux7p8TVv7S6aElmloKwXnFJxs1t81+YbfcGEzBS13A5VUkI9UW
 t1A6cBGEk6Zwfo3ZK+3PV6j8Mc/EqwevXV+AI43ShQobsCpTm/FfNg9iD
 Ls0RMbbse5pQzyoJhaWhNrjM2cTXrichpmN4K0Y21H3oz9Tp4xulNRWMP
 OW2ljlB9rm1lEZsnrf5B2BTFzpqqnFPsZucrP5jAlY1jkiL/qVElzyU20 w==;
X-CSE-ConnectionGUID: vENC0brQQpW26qGIv4mKtA==
X-CSE-MsgGUID: TsYNegYZQQC/7MiNXS2rJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41850055"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41850055"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
X-CSE-ConnectionGUID: AQXZ/OMTTCa2bP1kFUfvAw==
X-CSE-MsgGUID: rP0mIqMqSWidSGn+qmFaqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117775285"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm/xe/xe_exec_queue: Add ID param to exec queue struct
Date: Thu, 27 Feb 2025 19:14:51 +0000
Message-ID: <20250227191457.84035-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227191457.84035-1-jonathan.cavitt@intel.com>
References: <20250227191457.84035-1-jonathan.cavitt@intel.com>
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

