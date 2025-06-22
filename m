Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F24AE3022
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jun 2025 15:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C95210E328;
	Sun, 22 Jun 2025 13:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Vard2IVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4853510E328
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 13:41:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MAZKmb026783;
 Sun, 22 Jun 2025 13:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QVPcesTHipTdGKpkbL8rnQ0tTkSObsJN0xNEHqVU/2w=; b=Vard2IVJMYqskkJX
 5XbTxVkgk7lwQxGrmrs0b0L5VMSL3+VovIsr4AGbnsxTy6mprne3wBUyo+nTJr6t
 J5OyMoMSSNiSyihDOHN9slHToQlT+AnGVvuqZh9+0tJFaiuuscTyUHNAtR/q/GbS
 RcEu4XfWIm2Tli56vBXtWChJMmWG1TrjpOfx0BDpT4D+xorWmJA4i6pSDLKOKS6S
 v9vimzjjctM7a9niivMQWbrfcOUkfvgFoxWdPGsL90th+oRBtt++I8sdf3WVRlsH
 azOJQ/Nx62fxcJ9dRyI5x2KlvMWfjBxFaM+HQYGmxgLikZcOH1+blzPa4+nYvuYx
 IFviBQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eg70r5c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Jun 2025 13:41:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55MDexGa024450
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Jun 2025 13:40:59 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Jun 2025 06:40:56 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
Date: Sun, 22 Jun 2025 19:08:20 +0530
Message-ID: <20250622133820.18369-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250622133820.18369-1-quic_lxu5@quicinc.com>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: X2w0ghu33Z_GnLPgg0I8pjVBIkZzZlfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA4NSBTYWx0ZWRfX/gAcLJdeFm2k
 +BNmHXhq7DS927Wplyc0OgrEgUYt8SXrW+0Z1Dow9HlOzwXbreHGm1UB+G9YfCFJ4HaoyU07SsX
 vEfW73FjJxjpd/OFyJjXAcO/tdklex7b/2PmAlv+eWZsQ5hf4Z2GXY/BzOVgCYfECjleH0mRXvq
 SGQ8JzDLZqtv6VuJq5m8LZXEKlDWRHlYYndvTF725m1yBSdZu+hv0/4g9dRuFqJuitq7xseqRu0
 0didcEP8JvL9ao83WUiLgIpujBqv7FcTM8kirxAAtBiPwN7D7OqYR0lAB7nI3B+qVOHA1RAHTfL
 l6j3bjDxDytdj37CXJ/u68oN3I5QiXzlxAWbDOMDT4kFy+L/M2lWTyzBycnZdmz7GneSYewtedD
 TC2meRk8/BdlRED9unqPgGzhAGdj+yGAw9nkwJNgUWQBz/nYLBK7FxfOMGYGEl85z0rnovn/
X-Proofpoint-GUID: X2w0ghu33Z_GnLPgg0I8pjVBIkZzZlfn
X-Authority-Analysis: v=2.4 cv=ccHSrmDM c=1 sm=1 tr=0 ts=685807ec cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=c6LfSGLPLEd2mbsvFOMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_04,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220085
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

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. Add changes to support
GDSP remoteprocs.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c      | 57 ++++++++++++++++---------------------
 include/uapi/misc/fastrpc.h | 11 +++++--
 2 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..cd3063bc64f2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -23,12 +23,6 @@
 #include <uapi/misc/fastrpc.h>
 #include <linux/of_reserved_mem.h>
 
-#define ADSP_DOMAIN_ID (0)
-#define MDSP_DOMAIN_ID (1)
-#define SDSP_DOMAIN_ID (2)
-#define CDSP_DOMAIN_ID (3)
-#define CDSP1_DOMAIN_ID (4)
-#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -106,8 +100,6 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
-static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
-						"sdsp", "cdsp", "cdsp1" };
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -1723,7 +1715,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	uint32_t attribute_id = cap->attribute_id;
 	uint32_t *dsp_attributes;
 	unsigned long flags;
-	uint32_t domain = cap->domain;
 	int err;
 
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -1741,7 +1732,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
-			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
+			 "Warning: DSP capabilities not supported\n");
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
@@ -1769,17 +1760,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 		return  -EFAULT;
 
 	cap.capability = 0;
-	if (cap.domain >= FASTRPC_DEV_MAX) {
-		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
-			cap.domain, err);
-		return -ECHRNG;
-	}
-
-	/* Fastrpc Capablities does not support modem domain */
-	if (cap.domain == MDSP_DOMAIN_ID) {
-		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
-		return -ECHRNG;
-	}
 
 	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
 		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
@@ -2255,6 +2235,22 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
 	return err;
 }
 
+static int fastrpc_get_domain_id(const char *domain)
+{
+	if (strncmp(domain, "adsp", 4) == 0)
+		return ADSP_DOMAIN_ID;
+	else if (strncmp(domain, "cdsp", 4) == 0)
+		return CDSP_DOMAIN_ID;
+	else if (strncmp(domain, "mdsp", 4) == 0)
+		return MDSP_DOMAIN_ID;
+	else if (strncmp(domain, "sdsp", 4) == 0)
+		return SDSP_DOMAIN_ID;
+	else if (strncmp(domain, "gdsp", 4) == 0)
+		return GDSP_DOMAIN_ID;
+
+	return -EINVAL;
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2272,15 +2268,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return err;
 	}
 
-	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
-		if (!strcmp(domains[i], domain)) {
-			domain_id = i;
-			break;
-		}
-	}
+	domain_id = fastrpc_get_domain_id(domain);
 
 	if (domain_id < 0) {
-		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
+		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
 		return -EINVAL;
 	}
 
@@ -2330,21 +2321,21 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
+		/* Unsigned PD offloading is only supported on CDSP and GDSP */
 		data->unsigned_support = false;
-		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
 			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
-	case CDSP1_DOMAIN_ID:
+	case GDSP_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
-		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
 			goto err_free_data;
 
-		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
 			goto err_deregister_fdev;
 		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..ebef9ddcd184 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -18,6 +18,14 @@
 #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
 #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
 
+#define ADSP_DOMAIN_ID (0)
+#define MDSP_DOMAIN_ID (1)
+#define SDSP_DOMAIN_ID (2)
+#define CDSP_DOMAIN_ID (3)
+#define GDSP_DOMAIN_ID (4)
+
+#define FASTRPC_DOMAIN_MAX    4
+
 /**
  * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
  * @FASTRPC_MAP_STATIC: Map memory pages with RW- permission and CACHE WRITEBACK.
@@ -134,10 +142,9 @@ struct fastrpc_mem_unmap {
 };
 
 struct fastrpc_ioctl_capability {
-	__u32 domain;
 	__u32 attribute_id;
 	__u32 capability;   /* dsp capability */
-	__u32 reserved[4];
+	__u32 reserved[5];
 };
 
 #endif /* __QCOM_FASTRPC_H__ */
-- 
2.34.1

