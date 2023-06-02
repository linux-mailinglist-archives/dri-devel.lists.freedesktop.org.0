Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FAA720AC6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 23:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CEA10E066;
	Fri,  2 Jun 2023 21:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDE310E066
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 21:05:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352KpI9g023773; Fri, 2 Jun 2023 21:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=JDsKUkudTOVPnFV6lGZmAh2PHZmLniFHfVmLTDS0sew=;
 b=CUvAe8u6jZdzPToEP3GS71IrDeYG53aFT8AVWjNYy6dnTFzb0CHEIN9WC90j3KNVbAAg
 l6dDbEqBOyg20Tz0pOU/mxRwb01/4Af3LartZnAsV2j6US7ZTl66m6I5jcvGtR5rEZfJ
 s8IJWdWc9w1/aKuCbV4HPlW1rSXH/28TQZP8bCDNAogjPw358emTZoLxPA2EayrLlMJl
 3nOaV+LFcTFoT72uMDN41nZk2yCYeWN97Gz7rilQasHV5QYIYPcsXyPvIFD+G+TWbBKf
 cEg+1Yk/m9x05fxNKq7XwQKy6QpkaB9H0YbJO34k5fjY3ABb/dUovSF9rlI5TYSw6TG5 cQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qydr5hg96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 21:04:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352L4uPW018136
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 21:04:56 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 2 Jun 2023 14:04:55 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] accel/qaic fixes for 6.4 part 2
Date: Fri, 2 Jun 2023 15:04:38 -0600
Message-ID: <20230602210440.8411-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aBa6h4MQHwcigrHHYITiEqiLNfVmHktC
X-Proofpoint-GUID: aBa6h4MQHwcigrHHYITiEqiLNfVmHktC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_16,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=557 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020163
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, linux-kernel@vger.kernel.org, quic_ajitpals@quicinc.com,
 stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two additional fixes for corner cases found during development when
buggy userspace or firmware ends up subjecting the KMD to error
scenarios.

Carl Vanderlip (1):
  accel/qaic: Free user handle on interrupted mutex

Jeffrey Hugo (1):
  accel/qaic: Fix NULL pointer deref in qaic_destroy_drm_device()

 drivers/accel/qaic/qaic_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.40.1

