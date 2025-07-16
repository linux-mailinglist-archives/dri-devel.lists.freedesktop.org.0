Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED48B076F5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ECD10E72B;
	Wed, 16 Jul 2025 13:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FnoME18f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8947610E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:29:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD7p2V020748;
 Wed, 16 Jul 2025 13:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 14q04gf4fzv+dKpNp2BtEhm9YcLHNdKkIxGKHLV2BRk=; b=FnoME18fT9NVycrL
 JRFDLxmZclHeyAZ7FdudMpvBtNZ4pRiKsIlLvACCKsQqC9dlIwCOM+ec8lIrWZzl
 TCN9yxZhpSD9QkPP60Xh0BJrg3beQZf7QT0oFJhXAkRg92vsNBnsmOFrl6dgFhBp
 F5UadC0U5hrSK3XWxATiINqd1+OcjcQkVCOUh2YeXaJqJGnjf+aIYn1hdVdgwOos
 z0/KAnvFSEflE9vB/X4L1XVTNhFg9d+TpAsg9Ql3AP1e9RVKiGxpaIvjUWf/0dVf
 ZlxJMBdmuXrWWMKeDIYD2JfmhuOAqS7MSFfuThAPOQDFmcmGBbvsb9tnLD6qzzJn
 r5eLqA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy3vs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jul 2025 13:29:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56GDTRZ2026903
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jul 2025 13:29:27 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 06:29:23 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks from
 capability ioctl
Date: Wed, 16 Jul 2025 18:58:34 +0530
Message-ID: <20250716132836.1008119-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyMSBTYWx0ZWRfX3jREg1QB62Nc
 ibxov0TwYSCmw3Sw6IcqmbD7of0qMALHR9zsgr2glpbAEM9bYBUWvcKjO2ZcOx1bbqJpDgLwu9T
 +Js0x2Co/K4KM2i9BO1o+wnQu9vuzUq3Kw/qB4cbLboXZ5324xJt0PFGK4dtne2/Ozb5eAaZvse
 2afxzKOLyUkJX6E8/oRT8VF2tHDFWoUhB+5HRNe6SvKGBYqmXYo9S83VcGeMzra8YIG5SGx0Egs
 92xk7kd693b5FHzE9jNARnlAEAd/M6Ew4WjpaWiM1j6+2BZwo6NjJbTCYFpCfxF5QAE68pSyhyY
 J1VdFJgm3a7vNv87MUk+tHPYDa4EaaFdNGBav7jAKSYZOR40+D7VMbjnu6lKUDBwxCQYzMIgeKL
 9JWGXganoVGpz61jCsHXDXo9nYCDjG8J/mHpTZK63Tf+NuRiVZS56OxnbNtTevwZuGxLCv7e
X-Proofpoint-GUID: _t2Hdo8EmtXAZeQgLm9IHD4T3xdTnjlI
X-Proofpoint-ORIG-GUID: _t2Hdo8EmtXAZeQgLm9IHD4T3xdTnjlI
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6877a938 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=AVwB9L8OO_vht6zXYJ0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160121
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

Domain ID in the uAPI is misleading. Remove checks and log messages
related to 'domain' field in capability structure. Update UAPI to
mark the field as unused.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c      | 14 +-------------
 include/uapi/misc/fastrpc.h |  2 +-
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..495ac47e7f90 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1723,7 +1723,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	uint32_t attribute_id = cap->attribute_id;
 	uint32_t *dsp_attributes;
 	unsigned long flags;
-	uint32_t domain = cap->domain;
 	int err;
 
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -1741,7 +1740,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
-			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
+			 "Warning: DSP capabilities not supported\n");
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
@@ -1769,17 +1768,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
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
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..c6e2925f47e6 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
 };
 
 struct fastrpc_ioctl_capability {
-	__u32 domain;
+	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
 	__u32 capability;   /* dsp capability */
 	__u32 reserved[4];
-- 
2.34.1

