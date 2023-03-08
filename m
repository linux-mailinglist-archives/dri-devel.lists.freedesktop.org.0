Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7E6B1291
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 21:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE79010E704;
	Wed,  8 Mar 2023 20:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A6A10E715;
 Wed,  8 Mar 2023 20:03:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 328JutMj023205; Wed, 8 Mar 2023 20:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=nMxjjnPSwfFAKxJPvgOonuQ7wRmjI2Qr3fReR4+Kh0w=;
 b=LT1qRITEoa+NBq3yt5XJJeM/tvfbEhHfgCXq5X2p8UjPo9P3rPCsl5Pt84OkQLA7DeTZ
 6VdhDYHmotJTQr/x9BdTiYx+l0XsXhZdWoBReFQAsScwLwtu9dybhExSeNpnBIEtneLt
 Ez7qE59tvVhn32540tXM7+ZFKw0ksuiD9TM9hanCUThuMdo4m/RVpVbIPYfWplwRSJRM
 vau9fQSw1jNR1eGKfdsPbjpkAnfwNEbDt93FYDKnKyfXThoMFqD5i9l20pcsMhiO5uaK
 0xbdtkplWx8WYUZcXq02gMw3m5Auu2lNM/V78YbkkkBr1o7tn79rx3slGugctunyHwsW 1w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6wcmgkwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 20:02:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 328K2uY6013127
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Mar 2023 20:02:56 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 12:02:56 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC] drm: property: use vzalloc() instead of kvzalloc() for large
 blobs
Date: Wed, 8 Mar 2023 12:02:42 -0800
Message-ID: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: F6vysVz5vf5tUboSO8FnVc9dDHZFEdX3
X-Proofpoint-ORIG-GUID: F6vysVz5vf5tUboSO8FnVc9dDHZFEdX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080168
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For DRM property blobs created by user mode using
drm_property_create_blob(), if the blob value needs to be updated the
only way is to destroy the previous blob and create a new one instead.

For some of the property blobs, if the size of the blob is more
than one page size, kvzalloc() can slow down system as it will first
try to allocate physically contiguous memory but upon failure will
fall back to non-contiguous (vmalloc) allocation.

If the blob property being used is bigger than one page size, in a
heavily loaded system, this causes performance issues because
some of the blobs are updated on a per-frame basis.

To mitigate the performance impact of kvzalloc(), use it only when
the size of allocation is less than a page size when creating property
blobs

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_property.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index dfec479830e4..40c2a3142038 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -561,7 +561,11 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
 	if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
 		return ERR_PTR(-EINVAL);
 
-	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
+	if (sizeof(struct drm_property_blob) + length > PAGE_SIZE)
+		blob = vzalloc(sizeof(struct drm_property_blob)+length);
+	else
+		blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
+
 	if (!blob)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.7.4

