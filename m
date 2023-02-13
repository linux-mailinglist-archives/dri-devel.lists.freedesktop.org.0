Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465246950FD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 20:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3628810E6EF;
	Mon, 13 Feb 2023 19:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2C910E0B1;
 Mon, 13 Feb 2023 19:48:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DJlIrq003238; Mon, 13 Feb 2023 19:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=jI+rsN3MvsUzPQnymixEyK3FROSE7FeaesKlEpJ+KBw=;
 b=D65zKyuZBcuxST2wTOaFentiGQb+mIMWvn1znI1OgCdrx7x5mI+RUHOhwI/89823tBeM
 DZFHwEKZTtP6EoRkoCb3P7mqegyoQyqBLkKCJ4dc/GGW3pBFB0MnWUq/iwyewqF17Igz
 LiT8VN4OCjHn2IyLrLsBjih1SeAn0eX5fQDJiwxBcHxjs3lXLl0Nd8KoXlc5PYx5bxzk
 qXGr0lKO4297dKlkb4FCvK5l+jdnXXNrO5cJU3JIX6Hvn492lR2qXkuSxx1fGbRKoh8p
 xIuc2scyqiqNyz667HNNTmTswiWLCbx42uVDEALa6Xz4sLbvHXC0UO0bSo6Ipgl2J0qy Fw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqtv083hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 19:48:33 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31DJmWXN032400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 19:48:32 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 13 Feb 2023 11:48:31 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH v3 0/4] Move TE setup to prepare_for_kickoff()
Date: Mon, 13 Feb 2023 11:48:15 -0800
Message-ID: <20230213194819.608-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sIE14evwrLngFsZRxk7Fi3R_ygGu6rkZ
X-Proofpoint-ORIG-GUID: sIE14evwrLngFsZRxk7Fi3R_ygGu6rkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=894 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130173
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
functions in both MDP4 and DPU drivers.

Changes in V2:
- Added changes to remove empty prepare_commit() functions

Changes in V3:
- Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for 
  clarity
- Fixed spelling mistakes and wording issues
- Picked up "Reviewed-by" tags for patches [2/4] and [4/4]

Jessica Zhang (4):
  drm/msm/dpu: Move TE setup to prepare_for_kickoff()
  drm/msm: Check for NULL before calling prepare_commit()
  drm/msm/dpu: Remove empty prepare_commit() function
  drm/msm/mdp4: Remove empty prepare_commit() function

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 -----
 drivers/gpu/drm/msm/msm_atomic.c              |  3 ++-
 6 files changed, 9 insertions(+), 56 deletions(-)

-- 
2.39.1

