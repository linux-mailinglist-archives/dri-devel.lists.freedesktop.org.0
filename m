Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2516878A7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE9B10E1A5;
	Thu,  2 Feb 2023 09:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2AB10E1A5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675329704; x=1706865704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NdYd3eayCKm3QRwYu4qJcPo6A7pvGvjwU40SaEuquqE=;
 b=epDpFwLs1cclj2UTNdvWZ7x0nH7gyr623Zg81XeLijgs6LIV5EQ3coHU
 s2eBoMqW7A1yU9gKwfHiOpaqxbbUXxSDj8Aw0tVltcg3pOjv/f72BAJLm
 WHmdgxdOZdj0QS91dtKOrezLYyx9k/C2gEYWwSp0ANg6+WapJjqagwxDj
 1ed3oSiyCPk/mRsacTOh0R6H/yJ+VK6nTDUNv5s3yyE9iI25KEmCJdreZ
 7WJIOdMuOYLgLfLTN48FShwA0qkrV+fhm4L9F1XSW2eIJnYp/leAb3xdA
 V2xg24pVdtVdkmHJa1he9eYiXnSrnifqMSie8CvuBfMFV/iDKIFFun89h g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390791433"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="390791433"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="665216047"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="665216047"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:21:42 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting
 context
Date: Thu,  2 Feb 2023 10:21:12 +0100
Message-Id: <20230202092114.2637452-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

The VPU_JSM_MSG_CONTEXT_DELETE will remove any resources associated
with the SSID, that included any blobs create by the user space
application.

The command can also remove doorbell registrations, but since this
does not work in HW scheduling case, we do not depend on this
capability and unregister the doorbells explicitly.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     |  1 +
 drivers/accel/ivpu/ivpu_jsm_msg.c | 11 +++++++++++
 drivers/accel/ivpu/ivpu_jsm_msg.h |  2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index a29e8ee0dce6..70c104851c6d 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -90,6 +90,7 @@ static void file_priv_release(struct kref *ref)
 
 	ivpu_cmdq_release_all(file_priv);
 	ivpu_bo_remove_all_bos_from_context(&file_priv->ctx);
+	ivpu_jsm_context_release(vdev, file_priv->ctx.id);
 	ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
 	drm_WARN_ON(&vdev->drm, xa_erase_irq(&vdev->context_xa, file_priv->ctx.id) != file_priv);
 	mutex_destroy(&file_priv->lock);
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index af77dafac97e..831bfd2b2d39 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -167,3 +167,14 @@ int ivpu_jsm_trace_set_config(struct ivpu_device *vdev, u32 trace_level, u32 tra
 
 	return ret;
 }
+
+int ivpu_jsm_context_release(struct ivpu_device *vdev, u32 host_ssid)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_SSID_RELEASE };
+	struct vpu_jsm_msg resp;
+
+	req.payload.ssid_release.host_ssid = host_ssid;
+
+	return ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_SSID_RELEASE_DONE, &resp,
+				     VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+}
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.h b/drivers/accel/ivpu/ivpu_jsm_msg.h
index 1a3e2e2740bd..ab50d7b017c1 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.h
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.h
@@ -19,5 +19,5 @@ int ivpu_jsm_trace_get_capability(struct ivpu_device *vdev, u32 *trace_destinati
 				  u64 *trace_hw_component_mask);
 int ivpu_jsm_trace_set_config(struct ivpu_device *vdev, u32 trace_level, u32 trace_destination_mask,
 			      u64 trace_hw_component_mask);
-
+int ivpu_jsm_context_release(struct ivpu_device *vdev, u32 host_ssid);
 #endif
-- 
2.25.1

