Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4C71F5A4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 00:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488DC10E04C;
	Thu,  1 Jun 2023 22:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EB010E04C;
 Thu,  1 Jun 2023 22:09:30 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351Lq0th007693; Thu, 1 Jun 2023 22:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=imJcHdUPlXDBoCqG9a/BhfyE1Qcc+zecm0QutRPyjO0=;
 b=kJXrovA3w65mGpM7Ulx7lhLM+6Wwv+WTasX6k0ae5YSRjaoTfggvfTkLrGqyusOicnEh
 im0Gh1mv32lTRYUEIp0027DnUA+zQGRJGG7xmupWRfZzsBTip9HTdxKhXY9x8CNs0Qs0
 iJypXXT5tEpADMhngy+xfu3rbbG6YPFYPsiBmJIzrH8JFH/0LiM1iBeCnzWd49SOuFMr
 uE+Q28N2rUD9gyuhDUpMGiW73YNcD8Btwsreozuirn4GcOPP5vlHduVZyj2Jd1vS/1ey
 SYEBL6IzjNrEajvvKXtYBH8HwqUAQ2r45CbTbJNQyiD9DHnJFFz2BwDr/Yki3CntyT7S hA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qy1bcg8e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 22:09:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 351M90vL023502
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Jun 2023 22:09:00 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 1 Jun 2023 15:08:59 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2 0/2] retrieve DSI DSC through DRM bridge
Date: Thu, 1 Jun 2023 15:08:49 -0700
Message-ID: <1685657331-23280-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: azCt6zEaKs_4PlDP8-uOhAbHMoq4b0kY
X-Proofpoint-GUID: azCt6zEaKs_4PlDP8-uOhAbHMoq4b0kY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=907 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306010191
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

move retrieving DSC from setup_display to atomic_check() and delete struct drm_dsc_config
from struct msm_display_info.

Kuogee Hsieh (2):
  drm/msm/dpu: retrieve DSI DSC struct at atomic_check()
  drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 --
 3 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.7.4

