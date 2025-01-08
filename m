Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4101AA05254
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 05:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C6110EB78;
	Wed,  8 Jan 2025 04:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PERRbEet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509D10E1DC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 04:48:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507KG4KG029142;
 Wed, 8 Jan 2025 04:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=YA1TZQ1QJ2O6CROrHQWhWU
 KB1vh7qq1IzNZPfuIjbRE=; b=PERRbEetpOObzvLureLkM3B7UXxcIpmCdlPn3t
 Noa5TCfe5q/Bg2+CQ3RodmpRSkO63lzfMH/B6uqLWunrxUWbjPbBAg8FzhIdY/z4
 lt8BmUGzKlkt/qEJXQtoWryRbMuhnlo5WhrDRhcrBHmd2CDwhERllZL5UoLcRa8J
 SqHcQivhoBXa6+Z1Kh3780OMu3VLx0phpw86f7CwoiX3oIFoLfqWxPwFUUt9jG2p
 aBWuZi/7rAicix+IcAOj2QonpvfgBWpL7iSGKuTR4eB9XmVjV05ysoQgk7dF20X3
 wcwBeSCgZ4DLPq47teW/MnmJjJJfCK9PmueE0QU3hbhZ4neA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441b588xrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 04:48:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5084mW5M012587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 04:48:32 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 20:48:29 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <amahesh@qti.qualcomm.com>,
 <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH] misc: fastrpc: Fix race condition in MUNMAP
Date: Wed, 8 Jan 2025 10:18:02 +0530
Message-ID: <20250108044802.3829060-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: R_kVIKju3ECdlEMzHyT1c2oCHbqIVOzB
X-Proofpoint-GUID: R_kVIKju3ECdlEMzHyT1c2oCHbqIVOzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=918
 clxscore=1011 lowpriorityscore=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080036
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

fastrpc_req_munmap involves two steps to unmap memory, first to locates
a matching fastrpc buf in the list and second is to send request to DSP
to unmap. There is a potential race condition between two operations
which can lead to user-after-free scenario.
Lock unmap request to avoid use-after-free.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..9ad092d3a705 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2117,7 +2117,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 		err = fastrpc_req_mmap(fl, argp);
 		break;
 	case FASTRPC_IOCTL_MUNMAP:
+		mutex_lock(&fl->mutex);
 		err = fastrpc_req_munmap(fl, argp);
+		mutex_unlock(&fl->mutex);
 		break;
 	case FASTRPC_IOCTL_MEM_MAP:
 		err = fastrpc_req_mem_map(fl, argp);
-- 
2.34.1

