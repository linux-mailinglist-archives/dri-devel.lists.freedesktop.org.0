Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9A187CF72
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 15:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460BB1122D0;
	Fri, 15 Mar 2024 14:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KpG9bzaO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FE31122D1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 14:51:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42FEh4A9015326; Fri, 15 Mar 2024 14:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=YwRoGYZ/Oyz+mYtH8l3dbcPpq98R8O7d5CoLQQ3UeVs=; b=Kp
 G9bzaOQdYLRVOYeq7DDBdXOrZ033RuKAIVOHRG//BqdZait/oy/anyQ8JY0Yihuo
 QROt/hXp74ZAPecL9u2+8tNLel+2T6+iSpoc2XzjFg8yknEEW/Eu2YR01hVBdlXv
 Ihz7OYi9ZTZae0ZV7dx15FRpnPJnOm/HqlOhBl9oBgPbfmK2Wrpb98T8yse9Tg2J
 uZfog05nO2uwXnoZAqU2fLz8fVnPIuCnbioxLglVpySOreA0NKZ1JXLZ4W7v+svN
 oNbAPkfJT0jt+6EmN27es7pSS/GqaXBo2IbbMmoii5VDC2zuYhY8tFci41NMbMJ7
 TeaVIwgsMtivepGx7hfA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wvj82rm3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Mar 2024 14:50:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42FEormg017165
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Mar 2024 14:50:53 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 07:50:52 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <daniel@ffwll.ch>, <jiasheng@iscas.ac.cn>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <ogabbay@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH 1/2] drm: Add DRM-managed alloc_workqueue() and
 alloc_ordered_workqueue()
Date: Fri, 15 Mar 2024 08:50:33 -0600
Message-ID: <20240315145034.3972749-2-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315145034.3972749-1-quic_jhugo@quicinc.com>
References: <20240315145034.3972749-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5Xc64evmlZJAaZ905iitsGOEohBuu1G9
X-Proofpoint-GUID: 5Xc64evmlZJAaZ905iitsGOEohBuu1G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_02,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403150120
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

From: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Add drmm_alloc_workqueue() and drmm_alloc_ordered_workqueue(), the helpers
that provide managed workqueue cleanup. The workqueue will be destroyed
with the final reference of the DRM device.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
[jhugo: fix API to return the alloc'd workqueue]
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/gpu/drm/drm_managed.c | 82 +++++++++++++++++++++++++++++++++++
 include/drm/drm_managed.h     |  8 ++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 7646f67bda4e..d5135a471ff2 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -310,3 +310,85 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
 	mutex_destroy(lock);
 }
 EXPORT_SYMBOL(__drmm_mutex_release);
+
+static void drmm_destroy_workqueue(struct drm_device *dev, void *res)
+{
+	struct workqueue_struct *wq = res;
+
+	destroy_workqueue(wq);
+}
+
+/**
+ * drmm_alloc_workqueue - &drm_device-managed alloc_workqueue()
+ * @dev: DRM device
+ * @wq: workqueue to be allocated
+ *
+ * Returns:
+ * Valid pointer on success, NULL on error.
+ *
+ * This is a &drm_device-managed version of alloc_workqueue().
+ * The initialized lock is automatically destroyed on the final
+ * drm_dev_put().
+ */
+struct workqueue_struct *drmm_alloc_workqueue(struct drm_device *dev,
+					      const char *fmt, unsigned int flags,
+					      int max_active, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+	int ret;
+
+	va_start(args, max_active);
+	wq = alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+
+	if (!wq)
+		return NULL;
+
+	ret = drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
+	if (ret) {
+		destroy_workqueue(wq);
+		return NULL;
+	}
+
+	return wq;
+}
+EXPORT_SYMBOL(drmm_alloc_workqueue);
+
+/**
+ * drmm_alloc_ordered_workqueue - &drm_device-managed
+ * alloc_ordered_workqueue()
+ * @dev: DRM device
+ * @wq: workqueue to be allocated
+ *
+ * Returns:
+ * Valid pointer on success, NULL on error.
+ *
+ * This is a &drm_device-managed version of alloc_ordered_workqueue().
+ * The initialized lock is automatically destroyed on the final
+ * drm_dev_put().
+ */
+struct workqueue_struct *drmm_alloc_ordered_workqueue(struct drm_device *dev,
+						      const char *fmt,
+						      unsigned int flags, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+	int ret;
+
+	va_start(args, flags);
+	wq = alloc_ordered_workqueue(fmt, flags, args);
+	va_end(args);
+
+	if (!wq)
+		return NULL;
+
+	ret = drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
+	if (ret) {
+		destroy_workqueue(wq);
+		return NULL;
+	}
+
+	return wq;
+}
+EXPORT_SYMBOL(drmm_alloc_ordered_workqueue);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index f547b09ca023..cb42fb252648 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -127,4 +127,12 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
 })									     \
 
+struct workqueue_struct *drmm_alloc_workqueue(struct drm_device *dev,
+					      const char *fmt, unsigned int flags,
+					      int max_active, ...);
+
+struct workqueue_struct *drmm_alloc_ordered_workqueue(struct drm_device *dev,
+						      const char *fmt,
+						      unsigned int flags, ...);
+
 #endif
-- 
2.34.1

