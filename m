Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5D3910B1
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 08:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290A26EC12;
	Wed, 26 May 2021 06:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1466EBAC;
 Wed, 26 May 2021 06:24:51 +0000 (UTC)
IronPort-SDR: czX0jGAxeebsTxSMMu7xZiN2rilLR6tiGTGArTyuUvl+0IvOZSUqwDgp/KnjyVjf07fBLapFfw
 l39TYdkGtu1g==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182033749"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="182033749"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:50 -0700
IronPort-SDR: hevj83R/UB8ap6UtSN8FolnHPZjwOmogjuxz40voMiPueP3bcXEg7Nlb2QjmWsNj0iXIEZt7DZ
 nD6gTzOOXLVg==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="633376839"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/18] drm/i915/guc: Stop using mutex while sending CTB
 messages
Date: Tue, 25 May 2021 23:42:35 -0700
Message-Id: <20210526064237.77853-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210526064237.77853-1-matthew.brost@intel.com>
References: <20210526064237.77853-1-matthew.brost@intel.com>
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
Cc: Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

We are no longer using descriptor to hold G2H replies and we are
protecting access to the descriptor and command buffer by the
separate spinlock, so we can stop using mutex.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 42063e1c355d..b183c70cdd5c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -552,7 +552,6 @@ static int ct_send(struct intel_guc_ct *ct,
 int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		      u32 *response_buf, u32 response_buf_size)
 {
-	struct intel_guc *guc = ct_to_guc(ct);
 	u32 status = ~0; /* undefined */
 	int ret;
 
@@ -561,8 +560,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		return -ENODEV;
 	}
 
-	mutex_lock(&guc->send_mutex);
-
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
 	if (unlikely(ret < 0)) {
 		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
@@ -572,7 +569,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 			 action[0], ret, ret);
 	}
 
-	mutex_unlock(&guc->send_mutex);
 	return ret;
 }
 
-- 
2.28.0

