Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC894C8C197
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001B110E717;
	Wed, 26 Nov 2025 21:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvcAH9sO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BB310E6ED;
 Wed, 26 Nov 2025 21:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764193674; x=1795729674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+h5WXPfjqj3jW0WNzc7SQieKs/MYTkWn4gPhUUFsDY8=;
 b=ZvcAH9sOTPE5SnupVXoDSaBfNbZD9jE4yBJW1yPuL46JQH47gvCcd+Gq
 /1Lt1sNzY8Eq7vUoa04eRLLjTxOHiYHTWFHKIIUJUG+N1hwmMDl92MwfH
 gPvD4pOkA6cUCozF23V8b3gvUFJFouxUObhjtiwtIYi/nI5A+7Ve3IW+I
 TpCQOqsW0hb3W1ISxVKA+Bsk73TkV6ZoAr5Hv4z3ArE1fqDsG910UlvGq
 rPEhE/SPKQYAZ1XatzOV5ugYS87POqr5G3E/NOsQNL15zai1Qbm1nISqP
 Ia+PcUMci3nGyS2S8MpOIwlpujA8KBmy2mv5mTQKDrDttCApDO5KQAF+v A==;
X-CSE-ConnectionGUID: dzrXHboTRKiwtHGqA60i/g==
X-CSE-MsgGUID: 27jQWnqLS6qNGXn+v8mGpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="91721900"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="91721900"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:47:53 -0800
X-CSE-ConnectionGUID: GbJWuo8XQHaHosAaJdXufg==
X-CSE-MsgGUID: yXNSb9AWSGaj6YIkS1jbPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193281177"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:47:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 5/8] drm/xe: Only toggle scheduling in TDR if GuC is running
Date: Wed, 26 Nov 2025 13:47:45 -0800
Message-Id: <20251126214748.650107-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126214748.650107-1-matthew.brost@intel.com>
References: <20251126214748.650107-1-matthew.brost@intel.com>
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

If the firmware is not running during TDR (e.g., when the driver is
unloading), there's no need to toggle scheduling in the GuC. In such
cases, skip this step.

v4:
 - Bail on wait UC not running (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4166b4ec6a67..693e3a892639 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1274,7 +1274,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (exec_queue_reset(q))
 			err = -EIO;
 
-		if (!exec_queue_destroyed(q)) {
+		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
 			/*
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
@@ -1309,6 +1309,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		 */
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
+					 !xe_uc_fw_is_running(&guc->fw) ||
 					 !exec_queue_pending_disable(q) ||
 					 xe_guc_read_stopped(guc) ||
 					 vf_recovery(guc), HZ * 5);
-- 
2.34.1

