Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CFD597CEE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 06:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7CFB572E;
	Thu, 18 Aug 2022 04:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5290DB5B2E;
 Thu, 18 Aug 2022 04:17:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HN9W9A005180;
 Thu, 18 Aug 2022 04:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ZA6GSbOg6/OVN3zBulWfK7wmYSnrjkBIdqp9oJj7Mkc=;
 b=nao33Gg5NwVaaJjgMJnrK/BbyLOsPgJ4aoWzXQDxUyc8sKObeeLRb8xw+y8leDOhzUWz
 8/i1tA0edhEuAQEIIEmzxFgGGf/my5es1+eGSXpOJVPLkFcgqEh7aOAutk4JEVsFoIwJ
 IHiywl/3WO/NeQ8K0XREXrdkiIc5lRwIXNnUOl9ZB/TeNm4BFcmLOsW+CTYH8a4VGo3h
 VkxICeTe5PReQAobx4VHNqrj4qlvrzGk394bSgs3zzYMfRnzvidIc7ELxCCe/5tpEMzy
 bwYW+3jwgR1HjKKXYt4qtRNuQZGlaTsxsSsFy4lxSrkvoUfGiHnJEsojiY8UdwtpUUQw eA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j0wynkv18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 04:17:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27I4HJl9018189
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 04:17:21 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 17 Aug 2022 08:14:29 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/7] Improve GPU Recovery
Date: Wed, 17 Aug 2022 20:44:13 +0530
Message-ID: <1660749261-7602-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LOQav7krhjtGmHFgyBz___NDZFi2EfAX
X-Proofpoint-GUID: LOQav7krhjtGmHFgyBz___NDZFi2EfAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180014
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
Cc: Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Douglas Anderson <dianders@chromium.org>,
 Wang Qing <wangqing@vivo.com>, David Airlie <airlied@linux.ie>,
 Matthias Kaehlcke <mka@chromium.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Recently, I debugged a few device crashes which occured during recovery
after a hangcheck timeout. It looks like there are a few things we can
do to improve our chance at a successful gpu recovery.

First one is to ensure that CX GDSC collapses which clears the internal
states in gpu's CX domain. First 5 patches tries to handle this.

Rest of the patches are to ensure that few internal blocks like CP, GMU
and GBIF are halted properly before proceeding for a snapshot followed by
recovery. Also, handle 'prepare slumber' hfi failure correctly. These
are A6x specific improvements.

This series is rebased on top of v2 version of [1] which is based on
linus's master branch.

[1] https://patchwork.freedesktop.org/series/106860/

Changes in v4:
- Keep active_submit lock across the suspend & resume (Rob)
- Clear gpu->active_submits to silence a WARN() during runpm suspend (Rob)

Changes in v3:
- Use reset interface from gpucc driver to poll for cx gdsc collapse
  https://patchwork.freedesktop.org/series/106860/
- Use single pm refcount for all active submits

Changes in v2:
- Rebased on msm-next tip

Akhil P Oommen (7):
  drm/msm: Remove unnecessary pm_runtime_get/put
  drm/msm: Take single rpm refcount on behalf of all submits
  drm/msm: Correct pm_runtime votes in recover worker
  drm/msm: Fix cx collapse issue during recovery
  drm/msm/a6xx: Ensure CX collapse during gpu recovery
  drm/msm/a6xx: Improve gpu recovery sequence
  drm/msm/a6xx: Handle GMU prepare-slumber hfi failure

 drivers/gpu/drm/msm/adreno/a6xx.xml.h |  4 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 83 ++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 ++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c         | 21 ++++++---
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ++
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  4 --
 6 files changed, 114 insertions(+), 45 deletions(-)

-- 
2.7.4

