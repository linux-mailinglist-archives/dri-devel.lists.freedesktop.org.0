Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78DAAD07E3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 20:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDF910E150;
	Fri,  6 Jun 2025 18:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQAYsHBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3FD10E150
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 18:09:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9DBm001885;
 Fri, 6 Jun 2025 18:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=/ZHxNCn0ASjpoZsm8EDb4R7TZHvAGipfQ1i
 V2ifWK/w=; b=TQAYsHBlAqXtBbVyYwjCeltjyWSMbs8ojuhGACGC7J7j4Gg/ksT
 8XtqUfl6ZFQEdL2Ig1LJSc78TOl6q7iFnxAlCpXLyEFqdR4qpLh2VTwb9rhGbBl9
 +uNa5QJt6bJKK8WGWbUL1l4roGTR7a/PAvpKSdYIHQTUA9s8FyYoVHNJSGjgmhzx
 PNT/2LqijnNofmbrKAw1G/mS0fSs5Q/hR/VqXVZlx1xbyY+4cdRnFuUv4eXODlpw
 jZ1rnWQYhUqTG3RbZghDXis/CSqBg8XtGWhYYcX/Zl7QxIdW2Sw5s/S7DrlmknEY
 UaePl9LyHvkiClygTD/witPvegZHr6QtRgw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me4wg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jun 2025 18:09:43 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 556I9hsI010479; 
 Fri, 6 Jun 2025 18:09:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 473w9x2qg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jun 2025 18:09:42 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556I9gqL010474;
 Fri, 6 Jun 2025 18:09:42 GMT
Received: from hu-devc-lv-u22-a.qualcomm.com (hu-zmckevit-lv.qualcomm.com
 [10.81.27.230])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 556I9g8o010473
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jun 2025 18:09:42 +0000
Received: by hu-devc-lv-u22-a.qualcomm.com (Postfix, from userid 4696302)
 id BBB7953E; Fri,  6 Jun 2025 11:09:42 -0700 (PDT)
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
To: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, Liviu.Dudau@arm.com,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Subject: [RFC PATCH] drm: Add support for io_uring's uring_cmd in DRM/accel
Date: Fri,  6 Jun 2025 11:08:08 -0700
Message-Id: <20250606180806.2193463-1-zachary.mckevitt@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: F4ssrwwsapd5cF0V9z7bh82Q6iLRN_vw
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=68432ee7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=J3XXspt5h5sK_Z4aD1MA:9
X-Proofpoint-GUID: F4ssrwwsapd5cF0V9z7bh82Q6iLRN_vw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1OCBTYWx0ZWRfX4TqdMGtPlaR0
 0MKdNVszsDT+ce16TGKFRXxfK8XD7Q4NdwUlQ10/QQOO55BBj9nKZZL0efmEAdGk1i/G6xSSkNC
 KjGMAAM3V46Q/xrAiQ9VcZKFOOj7xGHo9TIMg/7BJFu9w3//Me2plH/5kKpi1n2YP2gzTjtCJd1
 tv5mDtS4TGETW/NX6va+R+ov+CUa7eNWIwYC0DZgvh4p3FlplLuCG+0iHlczoe4iNyOyPVs4cwU
 CfQxQbEdhCHC/TBeMPqPw3W+T7oqIxLvI7cBNmDjfKoL9oR27qVf5dHqnJUvJWM9EbgHZqlxdEM
 BHTa73zU75QbQI1xI6P3fUD3dAmZSyj4Y6o2G6I3pCMfLlmhkIu4l/oznV/W0eojpjMpwpAyt3P
 gHX/DM7tTu2ixkMQakv5brZ0fR9BY+YF1/1SK+kJGd2nAkBz248A0oxYH9ekmIpM7pCMU9lO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060158
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
ioctls seamlessly for DRM/accel devices without requiring any
updates to existing drivers.

Initial benchmarks on our Qualcomm Cloud AI 100 device show
speedups of 50% in ioctl execution time in the best case for
large batches of ioctls (128) issued together via drm_uring_cmd()
compared to issuing these ioctls directly.

Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
---

When issuing a batch of ioctl commands to a device, many context
switches are performed. To minimize this overhead, we propose using
io_uring to submit large batches of ioctl commands to a device all
at once. Instead of calling ioctls directly, io_uring provides a
uring_cmd calback that may be specified within any file or device's
file_operations structure that may be invoked by the ring.

For DRM devices that may need to issue large amounts of ioctls, we
believe performance can be improved by placing uring_cmds to issue
these ioctls in the ring and submitting them all at once.

This patch does not update the file_operations to include the
uring_cmd callback function for all DRM devices. However, this may
be easily done in the future without requiring modifications to
existing drivers. Furthermore, this design could be extended
to define new op codes within the drm_uring_cmd() callback which
would allow for more customized handling, assuming individual
driver support.

This patch was inspired by the talk "io_uring for DRM" at XDC 2024.

Thanks in advance for any feedback.
Zack

 drivers/gpu/drm/drm_ioctl.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_accel.h     |  3 ++-
 include/drm/drm_ioctl.h     |  3 +++
 include/uapi/drm/drm.h      | 22 ++++++++++++++++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f593dc569d31..c57c21cc16ec 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -39,6 +39,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
+#include <uapi/drm/drm.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -936,3 +937,32 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
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
index 038ccb02f9a3..4f923e101a06 100644
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
index e63a71d3c607..9316470f1286 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1385,6 +1385,28 @@ struct drm_event_crtc_sequence {
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

