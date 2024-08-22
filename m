Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07295B34D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 12:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F81810E07B;
	Thu, 22 Aug 2024 10:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="F/oymJhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2CC10E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 10:59:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M9WWKi007555;
 Thu, 22 Aug 2024 10:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=uchlU7Co3j6QPK5uI9GwWr
 cRPa058bIwAtkQL0OyCaY=; b=F/oymJhZS+2KcwaiCt2uewZjYvFdIzQU2JPUOS
 De/OzZ6JAb7EMU+vZcd7P33oahbU3+FmAPtE9ugzNhf0pnBWy0SwPf3pxIkBLXgR
 c4rrFILy4O61+N1dsey3dxfbESZF/hYru8D2uL3oqtbU3BEIVbSxc491dOvBg1jM
 YDvwvO3e7uxBextYlNNL4woN9WbA1zZw7z/MQRCuRbm/RurdyAw9d7O/dc2kIhaR
 fil/L/pO6gePU5nV/ztPFbCkjsOF5cIHADKUuLjo4+9AvzsJdRjJG9oWq7Nxry8m
 gvvPLrbY158M0wMVKYVECrQlDHkLY1vVAFHBXB9zIy2tTiWA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415gsd314w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 10:59:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MAxixi018481
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2024 10:59:44 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 03:59:41 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 0/3] Add missing fixes to FastRPC driver
Date: Thu, 22 Aug 2024 16:29:30 +0530
Message-ID: <20240822105933.2644945-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: vErizSZqHKQ69PmlrxSt0sZxNrF4z7uq
X-Proofpoint-ORIG-GUID: vErizSZqHKQ69PmlrxSt0sZxNrF4z7uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=794 clxscore=1015 lowpriorityscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408220081
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

This patch series adds the listed bug fixes that have been missing
in upstream fastRPC driver.
- Store actual size of map and check it against the user passed size.
- Consider map user VA and actual size for map lookup.
- Skip refcount increment for DMA handles.

Ekansh Gupta (3):
  misc: fastrpc: Save actual DMA size in fastrpc_map structure
  misc: fastrpc: Fix fastrpc_map_lookup operation
  misc: fastrpc: Skip reference for DMA handles

 drivers/misc/fastrpc.c | 54 ++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

-- 
2.34.1

