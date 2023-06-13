Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C1D72EF10
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 00:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9506510E3E8;
	Tue, 13 Jun 2023 22:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EF510E3E4;
 Tue, 13 Jun 2023 22:19:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DJoLxE017479; Tue, 13 Jun 2023 22:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=K0qNhIIXKK45Ts/N5IbalZI9W7UKiRSCw61qaqks+Nk=;
 b=UpV4xpdowtGziZTyYi13w6OVRxVKR7wl02OP0S1Ud6qdnDs2e2yKzk6Oce4vTtvhABq5
 K9piJOEpwUikhrkrTNQxGqcVCGjGoNlOfbNE9pGHMLU/OWzkxkYRfhOREVW4LqHBGnt3
 noHLc4ybyZ94F9D2PjGt5DN6DotvHJyA7+s237RREXh3eB0Z1r0uadardSKr+RZ2asEH
 aJc7xAQJ5I9bxOPawdRCSqwEJPBihXKHNzke2OjkJ76Op8QP8cep0fzGA2Fw0xSo4XFU
 08Um54pFQlvmIgyN7ikP4KoAUea3R3XP5AVWbh2jvsoxEzkhFYkHWVy70hvS7ZdYxGxD Mg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r6q4r1fgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 22:19:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35DMJBaW010330
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 22:19:11 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 13 Jun 2023 15:19:10 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v3 0/2] retrieve DSI DSC through priv-dsi[0]
Date: Tue, 13 Jun 2023 15:19:00 -0700
Message-ID: <1686694742-20862-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C5bLhjiTzgaxPOO9kVp_kXOBYMopu24a
X-Proofpoint-ORIG-GUID: C5bLhjiTzgaxPOO9kVp_kXOBYMopu24a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_22,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=925 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306130196
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

moving retrieving struct drm_dsc_cofnig from setup_display to
atomic_enable() and delete struct drm_dsc_config from
struct msm_display_info.

Kuogee Hsieh (2):
  drm/msm/dpu: retrieve DSI DSC struct through priv->dsi[0]
  drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 --
 3 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.7.4

