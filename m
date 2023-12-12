Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A23780FB10
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 00:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D3910E0D4;
	Tue, 12 Dec 2023 23:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E82410E0D4;
 Tue, 12 Dec 2023 23:11:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCMdNS5023439; Tue, 12 Dec 2023 23:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=qcppdkim1; bh=bc1VBvE
 RnN5p7LrCrbgx8yugGZNtrXgEF0a51g3axDw=; b=Jul0L/w7443sKHpnjOGFiaL
 ICS9A8WBC5NRT8PfmMswY5MtE0to3hrUzYGKNRKMY4cLlzKW5Q2K+GE6NiYs4N9o
 QHbrIDVne6euwmC4lyhA/AKC5I0DAt19h0Wh75+GRjyZqUwZXUN5ApAFRkcPxymQ
 NvD06QcI+k9c3gBZxrMy4YEsuVeT5mo69yEUVJ6Dv2lBPzzWuzq/3Q5wBgogxsj4
 RZqxpKmcLJV5kPZgEW1HGV9Y0UqfgB/AA2ELEQ7woCc2/BQta5905SuAsHiJKgNE
 rzwnQOcv6LGpD+kXmdBvaZR+rZtF2nVJwE1en1pbYCS4bTj9CvhZfL3sUF/tXQQ=
 =
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxru2h7mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 23:11:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCNBB30006338
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 23:11:11 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 15:11:11 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v4 0/1] Stabilize use of vblank_refcount
Date: Tue, 12 Dec 2023 15:10:57 -0800
Message-ID: <20231212231101.9240-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QyF4EiTAa2ZvYRkx57gVjPzgIGt91W3f
X-Proofpoint-ORIG-GUID: QyF4EiTAa2ZvYRkx57gVjPzgIGt91W3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=907 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120181
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, quic_bjorande@quicinc.com, seanpaul@chromium.org,
 steev@kali.org, quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is currently a race condition occuring when accessing
vblank_refcount. Therefore, vblank irq timeouts may occur.

Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.

Changes from prior versions:
   v4: - Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
         parameter of dpu_encoder_phys.
       - Switch from atomic refcnt to a simple int counter as mutex has
         now been added
   v3: - Mistakenly did not change wording of patch #2 in last version.
         It is done now.
   v2: - Slightly changed wording of patch #2 commit message

Paloma Arellano (1):
  drm/msm/dpu: Add mutex lock in control vblank irq

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 ++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 33 ++++++++++++-------
 4 files changed, 47 insertions(+), 23 deletions(-)

-- 
2.39.2

