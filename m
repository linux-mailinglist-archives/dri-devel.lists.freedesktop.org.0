Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE33375A9C
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A416EDAE;
	Thu,  6 May 2021 18:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0136ECE4;
 Thu,  6 May 2021 18:57:10 +0000 (UTC)
IronPort-SDR: B5SIad+3KYCzB6EWsCcsJ8tRaaeZ8meA7Pf31z2ORvK7O+xISpznzG5uVYxt6QDZ/RZgtnVdk0
 /jGqN/0jJkLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530987"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
IronPort-SDR: 7Ve8uUnN+3tX2VgmmJgSGgrL7n9vNfbLLApBuXvHF/C/5vLIS//VoB2YLk4xWMX5/aY6NRdUkm
 40acVsU1u1WA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583381"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 09/97] drm/i915/guc: Stop using fence/status from CTB
 descriptor
Date: Thu,  6 May 2021 12:13:23 -0700
Message-Id: <20210506191451.77768-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Stop using fence/status from CTB descriptor as future GuC ABI will
no longer support replies over CTB descriptor.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gt/uc/abi/guc_communication_ctb_abi.h     |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 72 ++-----------------
 2 files changed, 6 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index ebd8c3e0e4bb..d38935f47ecf 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -71,8 +71,8 @@ struct guc_ct_buffer_desc {
 	u32 head;		/* offset updated by GuC*/
 	u32 tail;		/* offset updated by owner */
 	u32 is_in_error;	/* error indicator */
-	u32 fence;		/* fence updated by GuC */
-	u32 status;		/* status updated by GuC */
+	u32 reserved1;
+	u32 reserved2;
 	u32 owner;		/* id of the channel owner */
 	u32 owner_sub_id;	/* owner-defined field for extra tracking */
 	u32 reserved[5];
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 25618649048f..4cc8c0b71699 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -90,13 +90,6 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
 	desc->owner = CTB_OWNER_HOST;
 }
 
-static void guc_ct_buffer_desc_reset(struct guc_ct_buffer_desc *desc)
-{
-	desc->head = 0;
-	desc->tail = 0;
-	desc->is_in_error = 0;
-}
-
 static int guc_action_register_ct_buffer(struct intel_guc *guc,
 					 u32 desc_addr,
 					 u32 type)
@@ -315,8 +308,7 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
 static int ct_write(struct intel_guc_ct *ct,
 		    const u32 *action,
 		    u32 len /* in dwords */,
-		    u32 fence,
-		    bool want_response)
+		    u32 fence)
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs[CTB_SEND];
 	struct guc_ct_buffer_desc *desc = ctb->desc;
@@ -360,8 +352,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	 * DW2+: action data
 	 */
 	header = (len << GUC_CT_MSG_LEN_SHIFT) |
-		 (GUC_CT_MSG_WRITE_FENCE_TO_DESC) |
-		 (want_response ? GUC_CT_MSG_SEND_STATUS : 0) |
+		 GUC_CT_MSG_SEND_STATUS |
 		 (action[0] << GUC_CT_MSG_ACTION_SHIFT);
 
 	CT_DEBUG(ct, "writing %*ph %*ph %*ph\n",
@@ -390,56 +381,6 @@ static int ct_write(struct intel_guc_ct *ct,
 	return -EPIPE;
 }
 
-/**
- * wait_for_ctb_desc_update - Wait for the CT buffer descriptor update.
- * @desc:	buffer descriptor
- * @fence:	response fence
- * @status:	placeholder for status
- *
- * Guc will update CT buffer descriptor with new fence and status
- * after processing the command identified by the fence. Wait for
- * specified fence and then read from the descriptor status of the
- * command.
- *
- * Return:
- * *	0 response received (status is valid)
- * *	-ETIMEDOUT no response within hardcoded timeout
- * *	-EPROTO no response, CT buffer is in error
- */
-static int wait_for_ctb_desc_update(struct guc_ct_buffer_desc *desc,
-				    u32 fence,
-				    u32 *status)
-{
-	int err;
-
-	/*
-	 * Fast commands should complete in less than 10us, so sample quickly
-	 * up to that length of time, then switch to a slower sleep-wait loop.
-	 * No GuC command should ever take longer than 10ms.
-	 */
-#define done (READ_ONCE(desc->fence) == fence)
-	err = wait_for_us(done, 10);
-	if (err)
-		err = wait_for(done, 10);
-#undef done
-
-	if (unlikely(err)) {
-		DRM_ERROR("CT: fence %u failed; reported fence=%u\n",
-			  fence, desc->fence);
-
-		if (WARN_ON(desc->is_in_error)) {
-			/* Something went wrong with the messaging, try to reset
-			 * the buffer and hope for the best
-			 */
-			guc_ct_buffer_desc_reset(desc);
-			err = -EPROTO;
-		}
-	}
-
-	*status = desc->status;
-	return err;
-}
-
 /**
  * wait_for_ct_request_update - Wait for CT request state update.
  * @req:	pointer to pending request
@@ -483,8 +424,6 @@ static int ct_send(struct intel_guc_ct *ct,
 		   u32 response_buf_size,
 		   u32 *status)
 {
-	struct intel_guc_ct_buffer *ctb = &ct->ctbs[CTB_SEND];
-	struct guc_ct_buffer_desc *desc = ctb->desc;
 	struct ct_request request;
 	unsigned long flags;
 	u32 fence;
@@ -505,16 +444,13 @@ static int ct_send(struct intel_guc_ct *ct,
 	list_add_tail(&request.link, &ct->requests.pending);
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
-	err = ct_write(ct, action, len, fence, !!response_buf);
+	err = ct_write(ct, action, len, fence);
 	if (unlikely(err))
 		goto unlink;
 
 	intel_guc_notify(ct_to_guc(ct));
 
-	if (response_buf)
-		err = wait_for_ct_request_update(&request, status);
-	else
-		err = wait_for_ctb_desc_update(desc, fence, status);
+	err = wait_for_ct_request_update(&request, status);
 	if (unlikely(err))
 		goto unlink;
 
-- 
2.28.0

