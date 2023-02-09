Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920A691083
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D742510E26F;
	Thu,  9 Feb 2023 18:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D6910E26C;
 Thu,  9 Feb 2023 18:44:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319II4OQ002516; Thu, 9 Feb 2023 18:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=QMgMNNmivbUTOtle53nFqUlW1lrejd9pLXZRaxB59CE=;
 b=WPj2oq6+2dLhZYAcyT0aYSj0eBpNf7GwluZn3B9UJwVlzImBEicqijDinxJmnzS0TuoS
 dk08ViV6QW4m5+7iFo+zLpVrUds+gBg8IkNXejeL8ZbjnknhtYVjTkUPc9lEXg5uHql6
 UD75zmAKkrolQ466ykhCt+PSLkkFc1j8Hp3l1yQj5Yq9K2Ia1NQo2j5vjx1DwmYH+nvO
 G131LR1RIaFGyf2Jr93KDdeD8p2tX8Yg7fjr/LM7TW57j8vsnKEV4aY7HJ4piIOzhCKX
 uKsdjU5FGPrOF7xylTvKtyGB79R5kIbbqe6Xz7kPYffPWmwtGir2tqDTLLyA738Xsnxa cA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nn5ek84hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 18:44:46 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 319IijNo009160
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Feb 2023 18:44:45 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 10:44:44 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH v2 0/4] Move TE setup to prepare_for_kickoff()
Date: Thu, 9 Feb 2023 10:44:22 -0800
Message-ID: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rPN1FOYROn6pBrh_WO84Nhgda63bkTO2
X-Proofpoint-GUID: rPN1FOYROn6pBrh_WO84Nhgda63bkTO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=795 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090176
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

Jessica Zhang (4):
  drm/msm/dpu: Move TE setup to prepare_for_kickoff()
  drm/msm: Check for NULL before calling prepare_commit()
  drm/msm/dpu: Remove empty prepare_commit() function
  drm/msm/mdp4: Remove empty prepare_commit() function

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 74 ++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 ------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 --
 drivers/gpu/drm/msm/msm_atomic.c              |  3 +-
 6 files changed, 40 insertions(+), 89 deletions(-)

--
2.39.1

