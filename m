Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yACFB72aqWm7AgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:01:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CF21411E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAD910E1FF;
	Thu,  5 Mar 2026 15:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="AmsJmiQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6E110E1FF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:01:11 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6255wbH82293529; Thu, 5 Mar 2026 15:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=9eddT8zc17b+Mmj2Mkub0TW
 eld1hNZPxjE6+hEIaxDE=; b=AmsJmiQVREC15ZgTzhyootDMuO57NRv0GOfO4LQ
 HFTNaCcqmSx3526nf316sgxXcB/BMNPnJZYgTyBaLkyw6OGaaUBo8TUnBUNivWaP
 tk3kn9UDddd/z1hae0ChyPruggxWEgt9MdtCmk0cDKcEI5eSfj3SekTxcd6YhGcn
 PcgK1gXZ68OFPrPfvo5UIJ9KiVHMJ31regcdxR0q9wHIDOibfDrmEVPCNkfrx9y4
 hoFUXWgyeZkceiXrXruOaacs/sAqZrzl9bMvmHE1AnbsBfcGoDT6pmdFwu/Bb4tX
 RbDaVP6WaE56JZ5wuZ/2UIXfgYvn+kELv2PM6FpN2inDhjA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4ckqgrv4yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2026 15:00:57 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.37) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 5 Mar
 2026 15:00:55 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Thu, 5 Mar 2026 17:00:39 +0200
Subject: [PATCH] drm/imagination: Implement handling of context reset
 notification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260305-b4-firmware-context-reset-notification-handling-v1-1-46e2ce8d46ef@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAJaaqWkC/x2NQQrCMBAAv1L27EJa26B+RXpI0k1d0EQ2ixZK/
 +7icQ4zs0MjYWpw63YQ+nDjWgz6UwfpEcpKyIsxDG7w7uwmjCNmltc3CGGqRWlTFGqkWKpy5hT
 UEmju8uSyor+OoY8T+XhJYNW3UObtf7zPx/ED5+oE04EAAAA=
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Alessio Belle" <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772722855; l=7959;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=PS9sBRiA2ZxPJV852s/6zBsR8kbLyTczwzLocvxMF3I=;
 b=jX9GkFKoNaKrkylajACDqFjVDGjnMzeOKeWXK8zLv13x4FmeykzakBNpB4xBCxxgDQlSqSFGS
 47JcqJkFXe7BOrSXaXMG8KIad0LtUbDbJYTGP8WoQv/oE9U1gUDXUYI
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Originating-IP: [172.25.10.37]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyMCBTYWx0ZWRfXzMva2x8S3C2B
 E25vTQuvfEAoD1TBRdpS/F2N6QUddQUL7O6DNEk5yLStXrVQG7JqoJDDvm1bzJv9kUJvg/DGM/P
 CjIaY+6rFUAJK6LElhstsaLZidZ9P+UG7+5/WE3Xui4sm25ViPUDxsLam5Bz4/cvxbS9F7tlX0Q
 3GyKZXWKCg7sUP2N9v00Lz+mD1aFaiOTmfWiH1yav/KSloYUB9co8x76cDFP6noq3zpGNLEKAbe
 DROx2MxzyjDI8ZJYKwXWlQeeLO/pl06TpYQi4Fpbtpzf05iCJ4ANlrOrHdhj+ZjA+xfRyD+qb4P
 /u4t6b+nRTh/Hddne+TJyIfFI+Pyx5L2rRSxSh6PXMcvTFIktnxhGy+YLamzWOkPEZWGGmV1Vog
 uSos0GqZU2107gg/3pBh+lU0Wm3z8RJnPeOuE2TB48kzxPaDvhzGSla0nrxXD6N9zof7m95fki5
 zVH4N2ZyCRohQSmFjLA==
X-Proofpoint-ORIG-GUID: UWi9GfiIJXHwvhszXFE6zMe71r44CfjL
X-Authority-Analysis: v=2.4 cv=GbAaXAXL c=1 sm=1 tr=0 ts=69a99aa9 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=7IANbbwssFwA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=ClZQo3t5Yuar91FTdAMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: UWi9GfiIJXHwvhszXFE6zMe71r44CfjL
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
X-Rspamd-Queue-Id: 971CF21411E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:alessio.belle@imgtec.com,m:brajesh.gupta@imgtec.com,m:sarah.walker@imgtec.com,m:alexandru.dadu@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexandru.dadu@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexandru.dadu@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:dkim,imgtec.com:email,imgtec.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The firmware will send the context reset notification message as
part of handling hardware recovery (HWR) events. This commit decodes
the message and prints via drm_info(). This eliminates the  "Unknown
FWCCB command" message that was previously printed.

Co-authored-by: Sarah Walker <sarah.walker@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/Makefile               |   1 +
 drivers/gpu/drm/imagination/pvr_ccb.c              |   6 ++
 drivers/gpu/drm/imagination/pvr_dump.c             | 111 +++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_dump.h             |  17 ++++
 .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  12 +++
 5 files changed, 147 insertions(+)

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index f5072f06b4c4..1222a14262e4 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -8,6 +8,7 @@ powervr-y := \
 	pvr_device.o \
 	pvr_device_info.o \
 	pvr_drv.o \
+	pvr_dump.o \
 	pvr_free_list.o \
 	pvr_fw.o \
 	pvr_fw_meta.o \
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 9294b4ba1de7..95d91cde7241 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -4,6 +4,7 @@
 #include "pvr_ccb.h"
 #include "pvr_device.h"
 #include "pvr_drv.h"
+#include "pvr_dump.h"
 #include "pvr_free_list.h"
 #include "pvr_fw.h"
 #include "pvr_gem.h"
@@ -150,6 +151,11 @@ process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *c
 		pvr_free_list_process_grow_req(pvr_dev, &cmd->cmd_data.cmd_free_list_gs);
 		break;
 
+	case ROGUE_FWIF_FWCCB_CMD_CONTEXT_RESET_NOTIFICATION:
+		pvr_context_reset_notification(pvr_dev,
+					       &cmd->cmd_data.cmd_context_reset_notification);
+		break;
+
 	default:
 		drm_info(from_pvr_device(pvr_dev), "Received unknown FWCCB command %x\n",
 			 cmd->cmd_type);
diff --git a/drivers/gpu/drm/imagination/pvr_dump.c b/drivers/gpu/drm/imagination/pvr_dump.c
new file mode 100644
index 000000000000..4b7ea38a83bd
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_dump.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. */
+
+#include <drm/drm_print.h>
+#include <linux/types.h>
+#include "pvr_device.h"
+#include "pvr_dump.h"
+#include "pvr_rogue_fwif.h"
+
+static const char *
+get_reset_reason_desc(enum rogue_context_reset_reason reason)
+{
+	switch (reason) {
+	case ROGUE_CONTEXT_RESET_REASON_NONE:
+		return "None";
+	case ROGUE_CONTEXT_RESET_REASON_GUILTY_LOCKUP:
+		return "Guilty lockup";
+	case ROGUE_CONTEXT_RESET_REASON_INNOCENT_LOCKUP:
+		return "Innocent lockup";
+	case ROGUE_CONTEXT_RESET_REASON_GUILTY_OVERRUNING:
+		return "Guilty overrunning";
+	case ROGUE_CONTEXT_RESET_REASON_INNOCENT_OVERRUNING:
+		return "Innocent overrunning";
+	case ROGUE_CONTEXT_RESET_REASON_HARD_CONTEXT_SWITCH:
+		return "Hard context switch";
+	case ROGUE_CONTEXT_RESET_REASON_WGP_CHECKSUM:
+		return "CDM Mission/safety checksum mismatch";
+	case ROGUE_CONTEXT_RESET_REASON_TRP_CHECKSUM:
+		return "TRP checksum mismatch";
+	case ROGUE_CONTEXT_RESET_REASON_GPU_ECC_OK:
+		return "GPU ECC error (corrected, OK)";
+	case ROGUE_CONTEXT_RESET_REASON_GPU_ECC_HWR:
+		return "GPU ECC error (uncorrected, HWR)";
+	case ROGUE_CONTEXT_RESET_REASON_FW_ECC_OK:
+		return "Firmware ECC error (corrected, OK)";
+	case ROGUE_CONTEXT_RESET_REASON_FW_ECC_ERR:
+		return "Firmware ECC error (uncorrected, ERR)";
+	case ROGUE_CONTEXT_RESET_REASON_FW_WATCHDOG:
+		return "Firmware watchdog";
+	case ROGUE_CONTEXT_RESET_REASON_FW_PAGEFAULT:
+		return "Firmware pagefault";
+	case ROGUE_CONTEXT_RESET_REASON_FW_EXEC_ERR:
+		return "Firmware execution error";
+	case ROGUE_CONTEXT_RESET_REASON_HOST_WDG_FW_ERR:
+		return "Host watchdog";
+	case ROGUE_CONTEXT_GEOM_OOM_DISABLED:
+		return "Geometry OOM disabled";
+
+	default:
+		return "Unknown";
+	}
+}
+
+static const char *
+get_dm_name(u32 dm)
+{
+	switch (dm) {
+	case PVR_FWIF_DM_GP:
+		return "General purpose";
+	case PVR_FWIF_DM_2D:
+		return "2D";
+	case PVR_FWIF_DM_GEOM:
+		return "Geometry";
+	case PVR_FWIF_DM_FRAG:
+		return "Fragment";
+	case PVR_FWIF_DM_CDM:
+		return "Compute";
+	case PVR_FWIF_DM_RAY:
+		return "Raytracing";
+	case PVR_FWIF_DM_GEOM2:
+		return "Geometry 2";
+	case PVR_FWIF_DM_GEOM3:
+		return "Geometry 3";
+	case PVR_FWIF_DM_GEOM4:
+		return "Geometry 4";
+
+	default:
+		return "Unknown";
+	}
+}
+
+/**
+ * pvr_context_reset_notification() - Handle context reset notification from FW
+ * @pvr_dev: Device pointer.
+ * @data: Data provided by FW.
+ *
+ * This will decode the data structure provided by FW and print the results via drm_info().
+ */
+void
+pvr_context_reset_notification(struct pvr_device *pvr_dev,
+			       struct rogue_fwif_fwccb_cmd_context_reset_data *data)
+{
+	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
+
+	if (data->flags & ROGUE_FWIF_FWCCB_CMD_CONTEXT_RESET_FLAG_ALL_CTXS) {
+		drm_info(drm_dev, "Received context reset notification for all contexts\n");
+	} else {
+		drm_info(drm_dev, "Received context reset notification on context %u\n",
+			 data->server_common_context_id);
+	}
+
+	drm_info(drm_dev, "  Reset reason=%u (%s)\n", data->reset_reason,
+		 get_reset_reason_desc(data->reset_reason));
+	drm_info(drm_dev, "  Data Master=%u (%s)\n", data->dm, get_dm_name(data->dm));
+	drm_info(drm_dev, "  Job ref=%u\n", data->reset_job_ref);
+
+	if (data->flags & ROGUE_FWIF_FWCCB_CMD_CONTEXT_RESET_FLAG_PF) {
+		drm_info(drm_dev, "  Page fault occurred, fault address=%llx\n",
+			 (unsigned long long)data->fault_address);
+	}
+}
diff --git a/drivers/gpu/drm/imagination/pvr_dump.h b/drivers/gpu/drm/imagination/pvr_dump.h
new file mode 100644
index 000000000000..450e8b9ebab8
--- /dev/null
+++ b/drivers/gpu/drm/imagination/pvr_dump.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/* Copyright (c) 2026 Imagination Technologies Ltd. */
+
+#ifndef __PVR_DUMP_H__
+#define __PVR_DUMP_H__
+
+/* Forward declaration from pvr_device.h. */
+struct pvr_device;
+
+/* Forward declaration from pvr_rogue_fwif.h. */
+struct rogue_fwif_fwccb_cmd_context_reset_data;
+
+void
+pvr_context_reset_notification(struct pvr_device *pvr_dev,
+			       struct rogue_fwif_fwccb_cmd_context_reset_data *data);
+
+#endif /* __PVR_DUMP_H__ */
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
index 6c09c15bf9bd..f622553cdc11 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif_shared.h
@@ -236,6 +236,18 @@ enum rogue_context_reset_reason {
 	ROGUE_CONTEXT_RESET_REASON_INNOCENT_OVERRUNING = 4,
 	/* Forced reset to ensure scheduling requirements */
 	ROGUE_CONTEXT_RESET_REASON_HARD_CONTEXT_SWITCH = 5,
+	/* CDM Mission/safety checksum mismatch */
+	ROGUE_CONTEXT_RESET_REASON_WGP_CHECKSUM = 6,
+	/* TRP checksum mismatch */
+	ROGUE_CONTEXT_RESET_REASON_TRP_CHECKSUM = 7,
+	/* GPU ECC error (corrected, OK) */
+	ROGUE_CONTEXT_RESET_REASON_GPU_ECC_OK = 8,
+	/* GPU ECC error (uncorrected, HWR) */
+	ROGUE_CONTEXT_RESET_REASON_GPU_ECC_HWR = 9,
+	/* FW ECC error (corrected, OK) */
+	ROGUE_CONTEXT_RESET_REASON_FW_ECC_OK = 10,
+	/* FW ECC error (uncorrected, ERR) */
+	ROGUE_CONTEXT_RESET_REASON_FW_ECC_ERR = 11,
 	/* FW Safety watchdog triggered */
 	ROGUE_CONTEXT_RESET_REASON_FW_WATCHDOG = 12,
 	/* FW page fault (no HWR) */

---
base-commit: 68b271a3a94cfd6c7695a96b6398b52feb89e2c2
change-id: 20260305-b4-firmware-context-reset-notification-handling-694a1b5e6b8c

Best regards,
-- 
Alexandru Dadu <alexandru.dadu@imgtec.com>

