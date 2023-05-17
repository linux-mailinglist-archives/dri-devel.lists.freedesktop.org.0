Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A970723B
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E51B10E285;
	Wed, 17 May 2023 19:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8570810E285
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:36:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HJTOfD030115; Wed, 17 May 2023 19:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=xA3BaMUdhySYpdcyg3JhGlNzUW+7jCWQoxSWw8L+Tow=;
 b=ItiNPow8PqGn5Skr/Su7577RBhd5gdxFJ8Yl2EWr3Lbr2MRaBzAMjNCELj3TRLZdWOAr
 DIVvOwRhRKN+ZAY3pD0Smbgh2N89O8NWHN6ep7d6tGj1YDxFlUC9fczOgeIxxsUMAIs4
 ohlhqb4D7TXLz2FJSgTF8RKTeCg+V4gLJ0y/Oz/IvbO81ggis/n7dZSJO3WrNJ7wAEXc
 kXwWOJn74RU1iOvcP2lJFmdVdkmtacx4T7YsLPHnmApMrmjWr9+JWWu9Go4Ds4CY1Gdo
 R6oZE03k20dAdj5pUd36lvFt1vhN3dcvLic1R5htBZsoK5AllOqOa9nrAXnJaLcf+bY5 ng== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn3fsg8xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 19:36:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HJa3X7004882
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 19:36:03 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 12:36:02 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>
Subject: [PATCH 0/5] accel/qaic fixes for 6.4
Date: Wed, 17 May 2023 13:35:35 -0600
Message-ID: <20230517193540.14323-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: I76tEy0jDJsr931TU_XuZ0JDXpayV1tt
X-Proofpoint-GUID: I76tEy0jDJsr931TU_XuZ0JDXpayV1tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 mlxlogscore=912 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170162
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During development of new features, we noticed some spots in the code that
could be improved based on review feedback from the initial driver series.

Also two race condition fixes, one found during stress testing and another
via code inspection.

Jeffrey Hugo (1):
  accel/qaic: Fix NNC message corruption

Pranjal Ramajor Asha Kanojiya (4):
  accel/qaic: Validate user data before grabbing any lock
  accel/qaic: Validate if BO is sliced before slicing
  accel/qaic: Flush the transfer list again
  accel/qaic: Grab ch_lock during QAIC_ATTACH_SLICE_BO

 drivers/accel/qaic/qaic_control.c | 41 ++++++++------
 drivers/accel/qaic/qaic_data.c    | 91 +++++++++++++++----------------
 2 files changed, 70 insertions(+), 62 deletions(-)

-- 
2.40.1

