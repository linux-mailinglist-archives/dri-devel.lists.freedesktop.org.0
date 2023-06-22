Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890B73A72C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 19:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A2410E58F;
	Thu, 22 Jun 2023 17:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B747110E58F;
 Thu, 22 Jun 2023 17:25:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MCsx7H001363; Thu, 22 Jun 2023 17:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=K0qNhIIXKK45Ts/N5IbalZI9W7UKiRSCw61qaqks+Nk=;
 b=W0RB08jYhJhp82KgmuOG2ztt7r+O4PpalIrz8ka2wBIGodG+vtK1vaBDIu+xk4EjSt/t
 nqsM7sj/+mh9AIeraDxueTFQXMg1g253cxzJTieDaBpEk6xAy4P9gF7tTx0tBXd4iGvk
 GN+sViHYK7BPVt5f2TQw40hVJXWVHJ7h5m6xGpZil/4wjOtGOnimIZe0kgP95Tv42kGs
 rjBjdKRwlS1VVO0HpqsHI9b/CFJWJsyof4sdKBjkU5hDv9m890Zq4UHmVyleGeWUQHj8
 Xr7OR0dub0ciW5CyzIYYGiIfgmuYaCI6xUhH7FIajIOw2fXc6C4J5T97QHGxKSDJXd4C nQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rbvr1m80m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 17:25:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MHOwXl029864
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 17:24:59 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Jun 2023 10:24:57 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v5 0/2] retrieve DSI DSC through priv-dsi[0]
Date: Thu, 22 Jun 2023 10:24:44 -0700
Message-ID: <1687454686-10340-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BEagMbqq05WaAmV-viF5K_gDhD7hWwpC
X-Proofpoint-ORIG-GUID: BEagMbqq05WaAmV-viF5K_gDhD7hWwpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_11,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=924 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220147
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

