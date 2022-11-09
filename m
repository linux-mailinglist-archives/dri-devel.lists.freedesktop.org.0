Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C28623292
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 19:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AE110E624;
	Wed,  9 Nov 2022 18:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC55010E614;
 Wed,  9 Nov 2022 18:35:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9H8dY6014528; Wed, 9 Nov 2022 18:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=aDApacFSAmqJBFeDFqfQKzNcNqwbf9jFQAmhhxbD5i4=;
 b=g3zRpz2ReP4Kak8w1SffHdTP8nhDh+q01vWfBZfDffWpPDSWDNVVgId5ZssFcVHPO/4h
 k0c0H774+38Wdotipo06T7M/DzJesXBhaXClBq2HbTDWWUgcvRjXl7IaRdLn23H0z3sJ
 gLdOfP8uviSDX9QTNMRc9ECs2lNVr+aaVj3De8jVlKEzLGF0hqcLEx8jVp2dOLZbmynS
 Uahibic6DM2s7JbsyIrGZctU9Hn26+jc1nhIa6SUPaYGLpkgsCvac8od1BKWKCrUe4ZY
 qr8KriS3aMFaBMMnsGWyPgCSLe62DQMyDYlqxBD2sngPcIw6l4XgPlKZGZ/4k5Sp+XJN pg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3krgbk87k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 18:35:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A9IZ4If009104
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 9 Nov 2022 18:35:05 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 9 Nov 2022 10:35:04 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/2] Add DP max link rate  support
Date: Wed, 9 Nov 2022 10:34:53 -0800
Message-ID: <1668018895-29023-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gWGKDKILRYmaLZ4JN1O0Clfbc4c6nEum
X-Proofpoint-ORIG-GUID: gWGKDKILRYmaLZ4JN1O0Clfbc4c6nEum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=794 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211090139
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dd DP link-frequencies property to DTS file and support function to DP driver.

Kuogee Hsieh (2):
  arm64: dts: qcom: Add link-frequencies property to specify the max
    link rate allowed
  drm/msm/dp: add support of max dp link rate

 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c            | 1 +
 drivers/gpu/drm/msm/dp/dp_panel.c              | 5 ++---
 drivers/gpu/drm/msm/dp/dp_panel.h              | 1 +
 drivers/gpu/drm/msm/dp/dp_parser.c             | 8 ++++++++
 drivers/gpu/drm/msm/dp/dp_parser.h             | 1 +
 6 files changed, 14 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

