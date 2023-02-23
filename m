Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279D6A0B48
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB0F10EB87;
	Thu, 23 Feb 2023 13:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6116A10E4C7;
 Thu, 23 Feb 2023 13:57:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NCuYCb008027; Thu, 23 Feb 2023 13:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=9zXnT+AjDH6c5Z86MTt3SgnursdwLqZhSOijlDEUw3c=;
 b=Ra7TuHs+rMoLUUAw83Vo5pk4jUsc33rpP3dU5Ye6YSkZNl//1bal7N2axoLjoRXHkBiY
 e/pELjWT10+VcNKUyccMqrc2DxztosC1Lxw2MIWfojKwCo/ycUt4+pSeNNCA1aFV0ENj
 5A1sJv5whT3uI4j+WA2RW80uW+WKdAzOPnW2+KCFwwK0sE3XUHKzZGHK+AI7qHfBM1WL
 VycX+nqDl22i5rhrSJo0FEMB81pSoj2RpcpYZOQ5SGfOnCm9gsy7xwbxuhnD3eP6eBZx
 Xf/3dZElZTCqQA9iyv6sfQRBmrRS6C8qMfGWe+m6BISmuw/xR6FgHDwfkb0WV6YTwk6j Bw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwybm1h2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:57:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NDv3sB017304
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:57:03 GMT
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 23 Feb 2023 05:56:57 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 0/2] drm/msm/dp: refactor the msm dp driver resources
Date: Thu, 23 Feb 2023 19:26:33 +0530
Message-ID: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: j_H_hQolhHrqyGz5Of4dKgracEP44EsI
X-Proofpoint-GUID: j_H_hQolhHrqyGz5Of4dKgracEP44EsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=805
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230114
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, quic_bjorande@quicinc.com, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DP driver resources are currently enabled and disabled directly based on code flow.
As mentioned in bug 230631602, we want to do the following:

1) Refactor the dp/edp parsing code to move it to probe (it is currently done in bind).

2) Then bind all the power resources needed for AUX in pm_runtime_ops.

3) Handle EPROBE_DEFER cases of the panel-eDP aux device.

4) Verify DP functionality is unaffected.

These code changes will parse the resources and get the edp panel during probe.
All the necessary resources required for the aux transactions are moved to pm_runtime ops.
They are enabled or disabled via get/put sync functions.

This is a RFC to verify with the community if the approach we are taking is correct.

https://partnerissuetracker.corp.google.com/issues/230631602

Sankeerth Billakanti (2):
  drm/msm/dp: enumerate edp panel during driver probe
  drm/msm/dp: enable pm_runtime support for dp driver

 drivers/gpu/drm/msm/dp/dp_aux.c     | 155 +++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_catalog.c |  12 ++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 185 ++++++++++++++--------------
 drivers/gpu/drm/msm/dp/dp_power.c   |   7 --
 5 files changed, 250 insertions(+), 110 deletions(-)

-- 
2.39.0

