Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A30789B114
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 15:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F143D10E3FE;
	Sun,  7 Apr 2024 13:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nuv96dqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1910E526;
 Sun,  7 Apr 2024 13:13:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F47C60C1C;
 Sun,  7 Apr 2024 13:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F14EC43390;
 Sun,  7 Apr 2024 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712495584;
 bh=oWCzXN+vCCpyVNvZ5+D/zJUDwJXHUttz1Y7S2CW20QA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nuv96dqYDUMBjFLenYi3+hNkO8RbpZayPFxsoCGbGOfw0gZoGKuyiNssoOnnVs13b
 Tpo4LB1bYJVoYFePIzKY0My65PtxldWt8UqZRzRRKRBaeAjsc/f+UZzAg+Wm1AMVI8
 9158ECT6WaWMoDPujaoejQ8UK90zcq02R7v/KhJRrsUI5qaASyYNTiH90AwxDQhzpj
 m5Xqrlupn5q9CCE8yFlOcbunODsoOPEDMdBas5FP3U/77nbIrXLMWvemItStQEQPdI
 RQTWTe0S7hM1Jh0/CL1qEbfAlJwRh1zL2xAax14cdAkTc88yaeJ9bA+YOPEqAr8Eg6
 f58jN06aUD8aQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jonathan Kim <Jonathan.Kim@amd.com>, Jonathan Kim <jonathan.kim@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 19/22] drm/amdkfd: range check cp bad op exception
 interrupts
Date: Sun,  7 Apr 2024 09:12:18 -0400
Message-ID: <20240407131231.1051652-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240407131231.1051652-1-sashal@kernel.org>
References: <20240407131231.1051652-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.25
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

From: Jonathan Kim <Jonathan.Kim@amd.com>

[ Upstream commit 0cac183b98d8a8c692c98e8dba37df15a9e9210d ]

Due to a CP interrupt bug, bad packet garbage exception codes are raised.
Do a range check so that the debugger and runtime do not receive garbage
codes.
Update the user api to guard exception code type checking as well.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
Tested-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/amdkfd/kfd_int_process_v10.c    |  3 ++-
 .../gpu/drm/amd/amdkfd/kfd_int_process_v11.c    |  3 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c |  3 ++-
 include/uapi/linux/kfd_ioctl.h                  | 17 ++++++++++++++---
 4 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
index a7697ec8188e0..f85ca6cb90f56 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c
@@ -336,7 +336,8 @@ static void event_interrupt_wq_v10(struct kfd_node *dev,
 				break;
 			}
 			kfd_signal_event_interrupt(pasid, context_id0 & 0x7fffff, 23);
-		} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE) {
+		} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE &&
+			   KFD_DBG_EC_TYPE_IS_PACKET(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0))) {
 			kfd_set_dbg_ev_from_interrupt(dev, pasid,
 				KFD_DEBUG_DOORBELL_ID(context_id0),
 				KFD_EC_MASK(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0)),
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
index 2a65792fd1162..3ca9c160da7c2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
@@ -325,7 +325,8 @@ static void event_interrupt_wq_v11(struct kfd_node *dev,
 		/* CP */
 		if (source_id == SOC15_INTSRC_CP_END_OF_PIPE)
 			kfd_signal_event_interrupt(pasid, context_id0, 32);
-		else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE)
+		else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE &&
+			 KFD_DBG_EC_TYPE_IS_PACKET(KFD_CTXID0_CP_BAD_OP_ECODE(context_id0)))
 			kfd_set_dbg_ev_from_interrupt(dev, pasid,
 				KFD_CTXID0_DOORBELL_ID(context_id0),
 				KFD_EC_MASK(KFD_CTXID0_CP_BAD_OP_ECODE(context_id0)),
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index 27cdaea405017..8a6729939ae55 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -385,7 +385,8 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
 				break;
 			}
 			kfd_signal_event_interrupt(pasid, sq_int_data, 24);
-		} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE) {
+		} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE &&
+			   KFD_DBG_EC_TYPE_IS_PACKET(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0))) {
 			kfd_set_dbg_ev_from_interrupt(dev, pasid,
 				KFD_DEBUG_DOORBELL_ID(context_id0),
 				KFD_EC_MASK(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0)),
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index eeb2fdcbdcb70..cd924c959d732 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -909,14 +909,25 @@ enum kfd_dbg_trap_exception_code {
 				 KFD_EC_MASK(EC_DEVICE_NEW))
 #define KFD_EC_MASK_PROCESS	(KFD_EC_MASK(EC_PROCESS_RUNTIME) |	\
 				 KFD_EC_MASK(EC_PROCESS_DEVICE_REMOVE))
+#define KFD_EC_MASK_PACKET	(KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_DIM_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_GROUP_SEGMENT_SIZE_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_CODE_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_RESERVED) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_UNSUPPORTED) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_WORK_GROUP_SIZE_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_DISPATCH_REGISTER_INVALID) |	\
+				 KFD_EC_MASK(EC_QUEUE_PACKET_VENDOR_UNSUPPORTED))
 
 /* Checks for exception code types for KFD search */
+#define KFD_DBG_EC_IS_VALID(ecode) (ecode > EC_NONE && ecode < EC_MAX)
 #define KFD_DBG_EC_TYPE_IS_QUEUE(ecode)					\
-			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_QUEUE))
+			(KFD_DBG_EC_IS_VALID(ecode) && !!(KFD_EC_MASK(ecode) & KFD_EC_MASK_QUEUE))
 #define KFD_DBG_EC_TYPE_IS_DEVICE(ecode)				\
-			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_DEVICE))
+			(KFD_DBG_EC_IS_VALID(ecode) && !!(KFD_EC_MASK(ecode) & KFD_EC_MASK_DEVICE))
 #define KFD_DBG_EC_TYPE_IS_PROCESS(ecode)				\
-			(!!(KFD_EC_MASK(ecode) & KFD_EC_MASK_PROCESS))
+			(KFD_DBG_EC_IS_VALID(ecode) && !!(KFD_EC_MASK(ecode) & KFD_EC_MASK_PROCESS))
+#define KFD_DBG_EC_TYPE_IS_PACKET(ecode)				\
+			(KFD_DBG_EC_IS_VALID(ecode) && !!(KFD_EC_MASK(ecode) & KFD_EC_MASK_PACKET))
 
 
 /* Runtime enable states */
-- 
2.43.0

