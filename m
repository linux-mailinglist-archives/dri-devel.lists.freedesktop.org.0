Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305243A233E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 06:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034A66E834;
	Thu, 10 Jun 2021 04:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAF76E453;
 Thu, 10 Jun 2021 04:19:01 +0000 (UTC)
IronPort-SDR: RkkwezSFFyH6nWGwo1mVa/2TYccTp2GQjbqXImaCOSLfPRi+Hpya4dyg8rb9AyxhFRxLucBJt5
 X203MMBF/UpQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203373010"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203373010"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:00 -0700
IronPort-SDR: xbXsEk5RuWTe8pIvsNKnvA1SEWswG3XB6RhW70SLrVtIZTg6CGlLFdVSioFUic3QTgqF4oNyV+
 nbboVd0ULusw==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="485997262"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/13] drm/i915/guc: Add flag for mark broken CTB
Date: Wed,  9 Jun 2021 21:36:41 -0700
Message-Id: <20210610043649.144416-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210610043649.144416-1-matthew.brost@intel.com>
References: <20210610043649.144416-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Once CTB descriptor is found in error state, either set by GuC
or us, there is no need continue checking descriptor any more,
we can rely on our internal flag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 13 +++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 3f7f48611487..63056ea0631e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -123,6 +123,7 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
 
 static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
 {
+	ctb->broken = false;
 	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
 }
 
@@ -387,9 +388,12 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
-	if (unlikely(desc->is_in_error))
+	if (unlikely(ctb->broken))
 		return -EPIPE;
 
+	if (unlikely(desc->is_in_error))
+		goto corrupted;
+
 	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
 		     (tail | head) >= size))
 		goto corrupted;
@@ -451,6 +455,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
 		 desc->addr, desc->head, desc->tail, desc->size);
 	desc->is_in_error = 1;
+	ctb->broken = true;
 	return -EPIPE;
 }
 
@@ -632,9 +637,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	unsigned int i;
 	u32 header;
 
-	if (unlikely(desc->is_in_error))
+	if (unlikely(ctb->broken))
 		return -EPIPE;
 
+	if (unlikely(desc->is_in_error))
+		goto corrupted;
+
 	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
 		     (tail | head) >= size))
 		goto corrupted;
@@ -698,6 +706,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
 		 desc->addr, desc->head, desc->tail, desc->size);
 	desc->is_in_error = 1;
+	ctb->broken = true;
 	return -EPIPE;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index cb222f202301..7d3cd375d6a7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -32,12 +32,14 @@ struct intel_guc;
  * @desc: pointer to the buffer descriptor
  * @cmds: pointer to the commands buffer
  * @size: size of the commands buffer
+ * @broken: flag to indicate if descriptor data is broken
  */
 struct intel_guc_ct_buffer {
 	spinlock_t lock;
 	struct guc_ct_buffer_desc *desc;
 	u32 *cmds;
 	u32 size;
+	bool broken;
 };
 
 
-- 
2.28.0

