Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF937CB0DE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 19:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CD410E22F;
	Mon, 16 Oct 2023 17:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BADA10E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 17:01:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39GEr0qQ017791; Mon, 16 Oct 2023 17:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=OBd4V5hf/K0aQmlnEM0rgc9o+3OV4tlUJLQp4MOREps=;
 b=ZxTJiXmy82S+thVrQXw6Hm1vdWOlcpYHDYWI+DejZQjpmLC4HCPrjSUWeIqLyISR4BIt
 kROqoR98dROSb1ft0rWbHPcA1x02td9Sh6qy0aKHmsFqgZPo6Do1x1aIImpGOFPjjV5g
 kdM0T9eNhM0jU0uD2PmLgCO3oirUXSggaSDUBT7irgtfaKUFJa1jmHxtK7bbHgW1v/G7
 iw2mkBn7BNh7LqS6StvWGKFjdzaW+N/5TBXnI1FiRtlWd8ur1YGeQxd3hjl6f0B3jvSe
 WvOqLBE7vTOc6QlfysOBMljmXRtlL7RCsXI8Q5aTe0s5YRtjGDP38NGUe1ZGLU2QF2qF Eg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tqm9f4p1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 17:01:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GH1VqF022048
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Oct 2023 17:01:31 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 16 Oct 2023 10:01:30 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <ogabbay@kernel.org>
Subject: [PATCH v2 0/2] accel/qaic: Add support for host/device timesync
Date: Mon, 16 Oct 2023 11:01:12 -0600
Message-ID: <20231016170114.5446-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 75fS4OoNCLInyzANamDbV8QJksnDSIij
X-Proofpoint-ORIG-GUID: 75fS4OoNCLInyzANamDbV8QJksnDSIij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310160148
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AIC100 supports a timesync mechanism that allows AIC100 to timestamp
device logs with a host based time. This becomes useful for putting host
logs in a unified timeline with device logs for debugging and performance
profiling. The mechanism consists of a boot-time initialization and a
runtime perodic resync to counteract the effects of time source drift
over time between the host and device.

v2:
- Fix readq usage on 32-bit powerpc
- Fix doc warning due to trailing "_"

Ajit Pal Singh (1):
  accel/qaic: Add support for periodic timesync

Pranjal Ramajor Asha Kanojiya (1):
  accel/qaic: Support MHI QAIC_TIMESYNC channel

 Documentation/accel/qaic/aic100.rst |   6 +-
 Documentation/accel/qaic/qaic.rst   |   5 +
 drivers/accel/qaic/Makefile         |   3 +-
 drivers/accel/qaic/mhi_controller.c |  36 ++-
 drivers/accel/qaic/qaic.h           |   4 +
 drivers/accel/qaic/qaic_drv.c       |  17 ++
 drivers/accel/qaic/qaic_timesync.c  | 395 ++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_timesync.h  |  11 +
 8 files changed, 473 insertions(+), 4 deletions(-)
 create mode 100644 drivers/accel/qaic/qaic_timesync.c
 create mode 100644 drivers/accel/qaic/qaic_timesync.h

-- 
2.40.1

