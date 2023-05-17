Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A471706EDD
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDE010E22C;
	Wed, 17 May 2023 16:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21E910E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:56:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HGVB3I000606; Wed, 17 May 2023 16:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=XughtEUspHfgU669yLfCX1SyL04SgRLhqAMGwN/BM2Y=;
 b=C61BbnKU+JzQHa3bHhf75+ebiV7CRZjKiD7VCuczrUP0uZoKzyLwZl7tQiZ0tgaYcoH0
 nRuQi2H2ovIWPX+yGCTPYa6RTjymtht7WgrJfvGWn0O7eWvP61lRtOq8lWBenEtMqOgT
 YGx1LWxCO3Nj/Pj2E9AyJrj/r1nmjfFDSGn8DmpQSSGBd5xpCSGNbdNX656KtPXkMCWt
 TO+F/jPY7HaLOCjp+MMngBSSM8oFkiYDEAfak5oz/LAQEwL4bqkor9XckVSqcrJgqYDj
 +6pde4MqgqHnOx4nRCA0eneTsINcWV4lU0CHQhaNOzx+8o6exZbrYQp522fDPp/z7I0/ VA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmbk7b4b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 16:56:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HGuUkU002903
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 16:56:30 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 09:56:29 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <trix@redhat.com>, <ogabbay@kernel.org>, <nathan@kernel.org>,
 <ndesaulniers@google.com>, <jacek.lawrynowicz@linux.intel.com>,
 <quic_carlv@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <quic_pkanojiy@quicinc.com>
Subject: [PATCH v2] accel/qaic: initialize ret variable to 0
Date: Wed, 17 May 2023 10:56:05 -0600
Message-ID: <20230517165605.16770-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IagSNZbJVzCCjD0k8azwN8yeQiIQfR7F
X-Proofpoint-ORIG-GUID: IagSNZbJVzCCjD0k8azwN8yeQiIQfR7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170138
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis reports
drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
  value returned to caller [core.uninitialized.UndefReturn]
        return ret;
        ^~~~~~~~~~

From a code analysis of the function, the ret variable is only set some
of the time but is always returned.  This suggests ret can return
uninitialized garbage. However BO allocation will ensure ret is always
set in reality.

Initialize ret to 0 to silence the warning.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Tom Rix <trix@redhat.com>
[jhugo: Reword commit text]
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 8ab26e64b231..e42c1f9ffff8 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 	struct qaic_bo *bo = to_qaic_bo(obj);
 	unsigned long offset = 0;
 	struct scatterlist *sg;
-	int ret;
+	int ret = 0;
 
 	if (obj->import_attach)
 		return -EINVAL;
-- 
2.40.1

