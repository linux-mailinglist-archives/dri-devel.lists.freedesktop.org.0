Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E149DFAE1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 07:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDD110E1D1;
	Mon,  2 Dec 2024 06:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EClH382l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2808F10E1D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 06:48:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B21ufd0015990;
 Mon, 2 Dec 2024 06:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=pViOy2kXUO0v1zVrZeadHW
 GjToPcySQoy/Cj7VWaDfA=; b=EClH382lG9yxxiizY39gfDPzDPOOUK+vvohEcY
 37cTZYihG3AKQiJi8UflvttVGoe6YGVhRsmrBJlNVI5oGil5Rdk1fJJ/+ElQsqi2
 lHsgKCllLkfxb13i3ES8xHgXxK8z4SDEy8g/QyS4jWp2YzqcUe6q5v6bIlzoPvA1
 WwLhEetYtMGqvDORUxKhmJy0HoCuWRxLFq5jhKscUPLoqv5gRRWbYtYAMzpj52KB
 lNhQcroDLSyO7H38lFxz5Bx79V25wy2zWaxiCwtnbVhUW49Es3PTAR8AEvBbNl5B
 qVHQspQkKEqOZJIYxJN0XkH5m0GCMYipfjzhpkpJ1vDqfC5Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mp8jns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2024 06:48:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B26mHrU016168
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Dec 2024 06:48:17 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 1 Dec 2024 22:48:14 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v5 0/2] Add changes to use session index as identifier
Date: Mon, 2 Dec 2024 12:18:04 +0530
Message-ID: <20241202064806.1164800-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: giMYcr789_GRqNqaJHHYgwZ007z_yHf4
X-Proofpoint-GUID: giMYcr789_GRqNqaJHHYgwZ007z_yHf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=862
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020058
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

This patch series carries changes to use a masked session index
as an identifier instead of process tgid to support mutiple PDs
from same process.
Patch [v4]: https://lore.kernel.org/all/20241121084713.2599904-1-quic_ekangupt@quicinc.com/

Changes in v5:
  - Remove mask and just modify session index.
Changes in v4:
  - Use GENMASK for client ID mask
  - Add a new patch to rename tid and pgid as client ID.
Changes in v3:
  - Modified commit text.
  - Removed idr implementation.
  - Using session index for client id.
Changes in v2:
  - Reformatted commit text.
  - Moved from ida to idr.
  - Changed dsp_pgid data type.
  - Resolved memory leak.

Ekansh Gupta (2):
  misc: fastrpc: Add support for multiple PD from one process
  misc: fastrpc: Rename tgid and pid to client_id

 drivers/misc/fastrpc.c | 57 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

-- 
2.34.1

