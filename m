Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB779D1BE4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F46810E2EA;
	Mon, 18 Nov 2024 23:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghziqzlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA7710E040;
 Mon, 18 Nov 2024 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973044; x=1763509044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=poahaFFlyliF7Ds8FoyFTl1+7yOcxw9tdG8AI0fNJNU=;
 b=ghziqzlPV735j3HI7HLEbcSeW6wg2bEWOz0SDFkH2LTp4MYzl6AhlA+x
 m8qj3hauJXwHoy+vz1qFNOdLk+e4Eeyqu5QVhDQX1If4jAgsPU1Uc5lN/
 4Tl70Y+SmK75Q+UzhaxQ0rpn/gou0b89yNt3uWlWh4ZMCYomGJzbp2Y8l
 mEvteJAtN/vQJkc/vgvrfdUVmg/iMV8UKm/ztZQ/CQF9l7yAQ6XPaPix2
 xl1QauFKz5oo0P/ofElt2BxJAAUkqB/inAUuhAM8oASH8dXg9A0PDYCyR
 mh/UUx4Mve6D8QOfouuKex2vdTzAIEe5lowfFjwkeT78SKOls53MJupmr w==;
X-CSE-ConnectionGUID: WmFEgl8DTOWuaWvk+xoGNQ==
X-CSE-MsgGUID: SL2RHoopQvSrfhDBiQe+4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878877"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:24 -0800
X-CSE-ConnectionGUID: A6gWdVU2SRmxsqfuUmLYag==
X-CSE-MsgGUID: EEJmAh2WSOSLqAxpPjv5NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521686"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 05/29] drm/xe: Add doorbell ID to snapshot capture
Date: Mon, 18 Nov 2024 15:37:33 -0800
Message-Id: <20241118233757.2374041-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Useful for debugging hangs with doorbells.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cc7a98c1343e..c226c7b3245d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2227,6 +2227,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		return NULL;
 
 	snapshot->guc.id = q->guc->id;
+	snapshot->guc.db_id = q->guc->db.id;
 	memcpy(&snapshot->name, &q->name, sizeof(snapshot->name));
 	snapshot->class = q->class;
 	snapshot->logical_mask = q->logical_mask;
@@ -2321,6 +2322,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	drm_printf(p, "\tClass: %d\n", snapshot->class);
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
 	drm_printf(p, "\tWidth: %d\n", snapshot->width);
+	drm_printf(p, "\tDoorbell ID: %d\n", snapshot->guc.db_id);
 	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
 	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
 	drm_printf(p, "\tTimeslice: %u (us)\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..12fef7848b78 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -113,6 +113,8 @@ struct xe_guc_submit_exec_queue_snapshot {
 		u32 wqi_tail;
 		/** @guc.id: GuC id for this exec_queue */
 		u16 id;
+		/** @guc.db_id: Doorbell id */
+		u16 db_id;
 	} guc;
 
 	/**
-- 
2.34.1

