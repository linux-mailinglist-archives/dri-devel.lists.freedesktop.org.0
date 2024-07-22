Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21814938AA3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1957710E3CA;
	Mon, 22 Jul 2024 08:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KcWruL/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615D110E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:02:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LN8Vt9010739;
 Mon, 22 Jul 2024 08:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=2eyP4sRbVVroVRA32CWP7I
 LpEu/jQmEIcmRb8dnHgM8=; b=KcWruL/niVgKvFFmudCBYfv1M3Hncm4c1bF1NI
 y8BDYqoKeRwBBe1EIfNokOpREDSVhVG88ZLx215xyz5ET42GwERfyfdEMt65U21x
 CmDRSh6spdT+aKGZEwMTlm3sYNb63/G3tF7/weVDTJw171wwW0HuqBjQ2oHjZItZ
 mL+KaoEfROkpyT+fAvOs1SrHWULCg96izc7nSYj9Lort7OWXv1cHy6Md17alCu9F
 uEy9hgcbf7LThFCeI1CWSG109L5BSBMbCEw3BoGHBvxBbMBK6y7UTtetP8Pl9mJG
 53ofGdSl/UzQFmD3AhOd5DqeLzvqYOzWkRvogqH3+QoGOOFQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgu14y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 08:02:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46M82CIm008389
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 08:02:12 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 22 Jul 2024 01:02:09 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v6 0/2] Fix user PD inimem requirements
Date: Mon, 22 Jul 2024 13:31:58 +0530
Message-ID: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VNNRwTWudnOiOoGXLteWK6nNioWaXMP_
X-Proofpoint-GUID: VNNRwTWudnOiOoGXLteWK6nNioWaXMP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=603
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220061
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series fixes the incorrect initmem size assumptions for
signed and unsigned user PD.
Previous single patch[v4]: https://lore.kernel.org/all/20240719085708.1764952-1-quic_ekangupt@quicinc.com/

Changes in v2:
  - Modified commit text.
  - Removed size check instead of updating max file size.
Changes in v3:
  - Added bound check again with a higher max size definition.
  - Modified commit text accordingly.
Changes in v4:
  - Defined new initmem specific MACROs.
  - Adding extra memory for unsigned PD.
  - Added comment suggesting the reason for this change.
  - Modified commit text.
Changes in v5:
  - Splitted the change into separate patches.
Changes in v6:
  - Changed Unsigned extra length macro name.
  - Add comment in proper format.

Ekansh Gupta (2):
  misc: fastrpc: Define a new initmem size for user PD
  misc: fastrpc: Increase unsigned PD initmem size

 drivers/misc/fastrpc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.34.1

