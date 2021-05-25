Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014B390AF0
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 22:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EABC6EB24;
	Tue, 25 May 2021 20:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2046EADD;
 Tue, 25 May 2021 20:57:57 +0000 (UTC)
IronPort-SDR: ydt5kL0q0boCVugCFwzZIuwEc8YdoP5onj4Vb56OCz7jBzfHjGYcs23LZcuHgp+fKy6TRr8buB
 x5IG7gcf8Bhg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="287876023"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="287876023"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:55 -0700
IronPort-SDR: w85Bq5I2afLuRgW4L1bFoQQkuSnMKs/OQWxOx8QEppBlP+1p7BzsQ9OvCTUKNwNtJAvP3mzcMg
 57nvSKi9Po1w==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443603561"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/17] drm/i915/guc: Start protecting access to CTB descriptors
Date: Tue, 25 May 2021 14:15:37 -0700
Message-Id: <20210525211541.87696-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210525211541.87696-1-matthew.brost@intel.com>
References: <20210525211541.87696-1-matthew.brost@intel.com>
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

We want to stop using guc.send_mutex while sending CTB messages
so we have to start protecting access to CTB send descriptor.

For completeness protect also CTB receive descriptor.

Add spinlock to struct intel_guc_ct_buffer and start using it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 14 ++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 ++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 62b9b581ce03..e44f06fbf87a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -89,6 +89,8 @@ static void ct_incoming_request_worker_func(struct work_struct *w);
  */
 void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 {
+	spin_lock_init(&ct->ctbs.send.lock);
+	spin_lock_init(&ct->ctbs.recv.lock);
 	spin_lock_init(&ct->requests.lock);
 	INIT_LIST_HEAD(&ct->requests.pending);
 	INIT_LIST_HEAD(&ct->requests.incoming);
@@ -476,17 +478,22 @@ static int ct_send(struct intel_guc_ct *ct,
 	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
 	GEM_BUG_ON(!response_buf && response_buf_size);
 
+	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
+
 	fence = ct_get_next_fence(ct);
 	request.fence = fence;
 	request.status = 0;
 	request.response_len = response_buf_size;
 	request.response_buf = response_buf;
 
-	spin_lock_irqsave(&ct->requests.lock, flags);
+	spin_lock(&ct->requests.lock);
 	list_add_tail(&request.link, &ct->requests.pending);
-	spin_unlock_irqrestore(&ct->requests.lock, flags);
+	spin_unlock(&ct->requests.lock);
 
 	err = ct_write(ct, action, len, fence);
+
+	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
+
 	if (unlikely(err))
 		goto unlink;
 
@@ -822,6 +829,7 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
 void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
 {
 	u32 msg[GUC_CT_MSG_LEN_MASK + 1]; /* one extra dw for the header */
+	unsigned long flags;
 	int err = 0;
 
 	if (unlikely(!ct->enabled)) {
@@ -830,7 +838,9 @@ void intel_guc_ct_event_handler(struct intel_guc_ct *ct)
 	}
 
 	do {
+		spin_lock_irqsave(&ct->ctbs.recv.lock, flags);
 		err = ct_read(ct, msg);
+		spin_unlock_irqrestore(&ct->ctbs.recv.lock, flags);
 		if (err)
 			break;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index fc9486779e87..bc52dc479a14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -27,11 +27,13 @@ struct intel_guc;
  * record (command transport buffer descriptor) and the actual buffer which
  * holds the commands.
  *
+ * @lock: protects access to the commands buffer and buffer descriptor
  * @desc: pointer to the buffer descriptor
  * @cmds: pointer to the commands buffer
  * @size: size of the commands buffer
  */
 struct intel_guc_ct_buffer {
+	spinlock_t lock;
 	struct guc_ct_buffer_desc *desc;
 	u32 *cmds;
 	u32 size;
-- 
2.28.0

