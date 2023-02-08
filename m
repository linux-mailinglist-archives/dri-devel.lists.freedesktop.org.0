Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A068EFF7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 14:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54AC10E221;
	Wed,  8 Feb 2023 13:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E806C10E051;
 Wed,  8 Feb 2023 13:42:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318BDHPZ001389; Wed, 8 Feb 2023 13:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=NkCxbS78vLly3nZijdZogjZfs3u+YMXxzwdQ7R3OUzQ=;
 b=EMDg5q7XXXgWFAqDVeHA9O4iiVRb6lFHeH/fgACLcu1iZJNRde5OnAkDjIxqF+g6qABH
 27oGZ5gxdDGtPDQNg3O4nN2+StTRh5l59Aq8xdrDEqi9xh0dlPdZqq8pM3jcjtN/DwUm
 Lb3Y6vqNRpERndC22dCje2OHTeHQa8p8Do5mbOKmfY3GygYggesMaTKLwHW3qERKhGUT
 GHk33k7bOO18SFETkWeMNRJ/odA1VLN+WGNY4fGwAGlh/Gr49l3Lo3h8Zk5dyKzD6CBd
 cPoQzWCXRlICou9ZlqzOpNMtmcnSVtS8gSV4Xga2EFiN2eksILUdc2SZmS6aoBBCnhpI mg== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm1yf1gt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 13:42:14 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 318DgArt025358; 
 Wed, 8 Feb 2023 13:42:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3nhgekjeqn-1;
 Wed, 08 Feb 2023 13:42:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318DgAkL025338;
 Wed, 8 Feb 2023 13:42:10 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 318Dg9Rq025333;
 Wed, 08 Feb 2023 13:42:10 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 4B7614BE0; Wed,  8 Feb 2023 05:42:09 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] Reserve DSPPs based on user request
Date: Wed,  8 Feb 2023 05:42:00 -0800
Message-Id: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: d6N19kcpsjKIYG4VmY40cCy2Xg6iyyVG
X-Proofpoint-GUID: d6N19kcpsjKIYG4VmY40cCy2Xg6iyyVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_05,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 mlxlogscore=693 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080120
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series will enable color features on sc7280 target which has 
primary panel as eDP

The series removes DSPP allocation based on encoder type and allows 
the DSPP reservation based on user request via CTM.

The series will release/reserve the dpu resources when ever there is 
a topology change to suit the new requirements.

Kalyan Thota (4):
  drm/msm/dpu: clear DSPP reservations in rm release
  drm/msm/dpu: add DSPPs into reservation upon a CTM request
  drm/msm/dpu: avoid unnecessary check in DPU reservations
  drm/msm/dpu: reserve the resources on topology change

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 58 ++++++++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 +
 3 files changed, 37 insertions(+), 25 deletions(-)

-- 
2.7.4

