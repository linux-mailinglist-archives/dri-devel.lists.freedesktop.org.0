Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F86880A8F7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3950310EAC8;
	Fri,  8 Dec 2023 16:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91AE10EAC8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:31:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8Ef7w4021088; Fri, 8 Dec 2023 16:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=qmj8Gji5Tp9SderlcWjqsJ3GBy/p9DnSfDidoyQDdIc=;
 b=d3/GQon/yc0GRJYrTozUFmUrl2CoFRYi038w+kw1cdovlcVo4hqkQlp4XIL36+icL+8w
 z9lC50QO6NkBJfufz9lK9LQnK1qw1rXdnZq35qa7KEEAiz0DZRIdIWA/ZCBdJG9oaStr
 jXw8lsJPM1pfcpfEU4O+iPmxuf7dk0tIWAVqFuqTbzaoGmQDkHpRzxuMlIc9UdqJnbcw
 KN5qmL39EjF6eSKh7rALctbs6dezgudYqFbnjBMwrXqxqZB87RWKPfePDTAm8T/8mv3G
 wEvNmDZcsjSxwMyu8wrk+cfzWpPsmsbwFTDAsPWsv13Sdd8YYUYawEc/SEls5Tp9+6z5 tw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuphg9ysg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 16:31:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GVPBN008966
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 16:31:25 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:31:24 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/2] qaic fixes for 6.7
Date: Fri, 8 Dec 2023 09:30:59 -0700
Message-ID: <20231208163101.1295769-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ULj2zqULdyoMJaEnjoCttfmyZixgkz4y
X-Proofpoint-GUID: ULj2zqULdyoMJaEnjoCttfmyZixgkz4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=733 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A pair of fixes to the driver. First one is an improvement to dma_buf
handling based on a greater understanding of that framework. The second
is a reliability fix that allows some cards to boot.

Jeffrey Hugo (1):
  accel/qaic: Implement quirk for SOC_HW_VERSION

Pranjal Ramajor Asha Kanojiya (1):
  accel/qaic: Fix GEM import path code

 drivers/accel/qaic/mhi_controller.c | 15 ++++++++++++++-
 drivers/accel/qaic/qaic_data.c      |  6 ++----
 2 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.34.1

