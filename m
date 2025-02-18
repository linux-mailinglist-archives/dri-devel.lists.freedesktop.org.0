Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF7A3A8AE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB0D10E759;
	Tue, 18 Feb 2025 20:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShyI/V+I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14710E754;
 Tue, 18 Feb 2025 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910268; x=1771446268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XPtuJe4Y9EUQQ0JqA9XMR0i/FJdOfWaIxB2yobegmDg=;
 b=ShyI/V+IY7CAce4dYizKPBbyzrWRog5y/6GV2SZFnbggxIPjncrDdmde
 0/PnP/G6eKvXWthJWBHZEC8vp7TUGK026N2nWw7TN9yM+4GKWojsramyN
 Et4pfceWNlMLM0btbdUzSvYYd4pjV7BT+GjMgSqxGT8CPO6DmbfT14UCI
 zUJGBsffa0gIZMQFbslbj2C4Jaz6ULTCgr2t0kmna74IgXgqJ4Pzm0l+h
 Fb/ryRAIWt9xrGbKQH1beEtEEgRhl0CmNoXucEyOkS3aeB3HXiNfK7eQL
 CmfmU7vzQyz8DjlqtUYgaap6+nO/ranaumf+fv6bEQJsFbcHiiyM/lUuH Q==;
X-CSE-ConnectionGUID: aODotk8kSRmeXqS2PZ0wjg==
X-CSE-MsgGUID: Uq1BU0RgQZa9FD6KP9Kucg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40836895"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40836895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:24:28 -0800
X-CSE-ConnectionGUID: lVWmXKd9T56RKhu5nMw40A==
X-CSE-MsgGUID: gDzdJDAdQoWXpZcW8XPRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114431721"
Received: from dut4066lnl.fm.intel.com ([10.105.8.64])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:24:29 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 lucas.demarch@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v2 4/6] drm/xe/xe_drm_client: Add per drm client reset stats
Date: Tue, 18 Feb 2025 20:24:24 +0000
Message-ID: <20250218202426.103151-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218202426.103151-1-jonathan.cavitt@intel.com>
References: <20250218202426.103151-1-jonathan.cavitt@intel.com>
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

Add a counter to xe_drm_client that tracks the number of times the
engine has been reset since the drm client was created.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index b3d9b279d55f..6579c4b60ae7 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -59,6 +59,8 @@ struct xe_drm_client {
 	 * @blame_len: length of @blame_list
 	 */
 	unsigned int blame_len;
+	/** @reset_count: number of times this drm client has seen an engine reset */
+	atomic_t reset_count;
 #endif
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d9da5c89429e..8810abc8f04a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1988,7 +1988,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		return -EPROTO;
 
 	hwe = q->hwe;
-
+#ifdef CONFIG_PROC_FS
+	atomic_inc(&q->xef->client->reset_count);
+#endif
 	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
 		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
-- 
2.43.0

