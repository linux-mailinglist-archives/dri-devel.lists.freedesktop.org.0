Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57AAB506E2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 22:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950E310E7F4;
	Tue,  9 Sep 2025 20:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzQu9OT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF7410E7F2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 20:20:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HT4C4024400;
 Tue, 9 Sep 2025 20:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=VGJxv4QBupBwSHm+I1zvtHMMgD0kvp1zR6k
 VGMeNJKE=; b=JzQu9OT+lzc3bNIMbAlbwiLAeSCb1izST+jPJIeZzHbzTdP0PmO
 tgYCQnP+FNWL+UN/PdXiREpfPdAJzIeVgL+uQFWuUs21z1zncVntti0+yeWJSCxr
 jL9E4DqoevBV6ktQmhFlwo69EM1ICFXkyr7n3p5IV2GNl9HxY1dF17h46hfbBDVQ
 ecg7SjaH+49lB1MzDaiTk0xtWZgBfyAgO+xVZz793wJUagBEGLgRnY/irCCWijrq
 VaqowxgX+kmP6LXaEH5ZkXNlyy+Ddu7io+CIcwKCtCoWI9N78TO03wXiXYfw6RXl
 VRp73e+Aej6cQNOwbTDLCzbBs0chn0uT2Iw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by91m54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 20:20:05 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 589KK5wH031845; 
 Tue, 9 Sep 2025 20:20:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 492kpp3wd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 20:20:05 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 589KK4Qc031836;
 Tue, 9 Sep 2025 20:20:04 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com
 [10.81.26.129])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 589KK4eo031833
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Sep 2025 20:20:04 +0000
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
 id B6EED5AC; Tue,  9 Sep 2025 13:20:04 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, jeff.hugo@oss.qualcomm.com,
 Liviu.Dudau@arm.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [PATCH v2] drm: Add support for ioctl dispatch with io_uring's
 uring_cmd
Date: Tue,  9 Sep 2025 13:10:38 -0700
Message-Id: <20250909201035.2037460-1-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c08bf6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=J3XXspt5h5sK_Z4aD1MA:9
X-Proofpoint-GUID: cPL3F5Q2IviLooKyiCc_dUrovLEEj1Tl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXzhkJKkPKf0eU
 ngb1rcGbiMJEKdaCgz8XiUBKLlgkYgGIlrEvyVy3nBMNAocnsgVBid7YR9RA01fVvXt6t19gjOK
 uRwwKfFp0blS3CaV3wRVnZjQtFYp+TGgCgwbP8+HBeT8Jxeqr8/gtZ8fRP4Mb4G6Vqk3J9+na9k
 LbnipAhx+IpEXVkaEHELqaaztErUsJXNMYJvaCNB4OPlvwOpuEkvwYnTVdvyR6SZ95YpgdAx6B7
 f/1fmn0cIJfINTV1b0ufNa+XHlOelo5gST6xSrLg6QpusD/pOtla2yB38chcMOizDl/w6vbXb6c
 yaY59G81h+oKdJBkZjXSGXy3+KAotgLWGk4V472sDdwDNeYw0BDdztEyHoiUIqdOqJk5DHfq0mE
 9sztZrhb
X-Proofpoint-ORIG-GUID: cPL3F5Q2IviLooKyiCc_dUrovLEEj1Tl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

Add a callback function for uring_cmd to support the io_uring
interface in DRM devices. The drm_uring_cmd() function allows
for dispatching ioctls to DRM devices. If the uring_cmd
callback is specified in the device's file_operations structure,
the SQE cmd_op field can be set to DRM_URING_CMD_IOCTL to issue
ioctls to that device from the ring.

Additionally, create a 16 byte drm_uring_cmd_ioctl struct that
contains traditional ioctl argument values, such as the device
specific ioctl command and an optional argument pointer, that
can be passed directly to the callback function through the SQE's
16 byte command field. This design allows io_uring to handle
ioctls seamlessly for DRM devices without requiring any updates
to existing drivers.

Initial benchmarks on our Qualcomm Cloud AI 100 device show
speedups of 50% in ioctl execution time in the best case for
large batches of ioctls (128) issued together via drm_uring_cmd()
compared to issuing these ioctls directly.

Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---

Changes in V2:
- Add uring_cmd callback for drm gem devices.
- Link to v1: https://lore.kernel.org/all/20250606180806.2193463-1-zachary.mckevitt@oss.qualcomm.com/

 drivers/gpu/drm/drm_ioctl.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_accel.h     |  3 ++-
 include/drm/drm_gem.h       |  3 ++-
 include/drm/drm_ioctl.h     |  3 +++
 include/uapi/drm/drm.h      | 22 ++++++++++++++++++++++
 5 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d8a24875a7ba..6e90a55bee15 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -39,6 +39,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
+#include <uapi/drm/drm.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -937,3 +938,32 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
 	return true;
 }
 EXPORT_SYMBOL(drm_ioctl_flags);
+
+/**
+ * drm_uring_cmd - Implement uring_cmd callback for io_uring
+ * @cmd: pointer to io_uring_cmd struct
+ * @issue_flags: flags specified by io_uring's issue implementation
+ *
+ * This function implements the uring_cmd file operation to incorporate
+ * arbitrary io_uring functionality for drm. Currently, it acts as a way
+ * for io_uring to issue ioctls to a drm device, so this function
+ * dispatches ioctls to the standard drm ioctl interface.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int drm_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
+{
+	switch (cmd->cmd_op) {
+	case DRM_URING_CMD_IOCTL:
+		const struct drm_uring_cmd_ioctl *drm_cmd = io_uring_sqe_cmd(cmd->sqe);
+		unsigned int ioctl_cmd = drm_cmd->ioctl_cmd;
+		unsigned long ioctl_arg = drm_cmd->arg;
+		struct file *filp = cmd->file;
+
+		return drm_ioctl(filp, ioctl_cmd, ioctl_arg);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(drm_uring_cmd);
diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index 20a665ec6f16..79c5bdef5dd3 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -29,7 +29,8 @@
 	.read		= drm_read,\
 	.llseek		= noop_llseek, \
 	.mmap		= drm_gem_mmap, \
-	.fop_flags	= FOP_UNSIGNED_OFFSET
+	.fop_flags	= FOP_UNSIGNED_OFFSET, \
+	.uring_cmd	= drm_uring_cmd
 
 /**
  * DEFINE_DRM_ACCEL_FOPS() - macro to generate file operations for accelerators drivers
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 8d48d2af2649..dda9b915c4a7 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -470,7 +470,8 @@ struct drm_gem_object {
 	.read		= drm_read,\
 	.llseek		= noop_llseek,\
 	.mmap		= drm_gem_mmap, \
-	.fop_flags	= FOP_UNSIGNED_OFFSET
+	.fop_flags	= FOP_UNSIGNED_OFFSET, \
+	.uring_cmd      = drm_uring_cmd
 
 /**
  * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 171760b6c4a1..cbb474254e1c 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -34,6 +34,7 @@
 
 #include <linux/types.h>
 #include <linux/bitops.h>
+#include <linux/io_uring/cmd.h>
 
 #include <asm/ioctl.h>
 
@@ -171,4 +172,6 @@ int drm_noop(struct drm_device *dev, void *data,
 int drm_invalid_op(struct drm_device *dev, void *data,
 		   struct drm_file *file_priv);
 
+int drm_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags);
+
 #endif /* _DRM_IOCTL_H_ */
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3cd5cf15e3c9..36c1fe4ae1db 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1424,6 +1424,28 @@ struct drm_event_crtc_sequence {
 	__u64			sequence;
 };
 
+/**
+ * enum drm_uring_cmd_op - Opcodes for io_uring based drm_uring_cmd callback
+ * DRM_URING_CMD_IOCTL - issue DRM ioctl from drm_uring_cmd
+ */
+enum drm_uring_cmd_op {
+	DRM_URING_CMD_IOCTL = 1,
+};
+
+/**
+ * struct drm_uring_cmd_ioctl - arguments for DRM_URING_CMD_IOCTL
+ */
+struct drm_uring_cmd_ioctl {
+	/* Device specific ioctl number */
+	__u32 ioctl_cmd;
+
+	/* Pad to 16 byte SQE cmd */
+	__u32 pad;
+
+	/* Opaque ioctl argument pointer */
+	__u64 arg;
+};
+
 /* typedef area */
 #ifndef __KERNEL__
 typedef struct drm_clip_rect drm_clip_rect_t;
-- 
2.34.1

