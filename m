Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23CA7BBCC7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 18:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3201810E537;
	Fri,  6 Oct 2023 16:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3865910E535
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 16:32:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 396EOtPu004344; Fri, 6 Oct 2023 16:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=HXPKL6sAIKxyt5aLJOBFWambGx0/ZP4dbw2HCLmlOYo=;
 b=heazUP4V8i560hmLzYvYXjVe/DlccBCTcieZHrqdyNE9lObX7jC/i9KLuHI252KRb601
 XZae0qc/RE9nC2IVOh8QwQXSr1kakdNaaGsKZ8bvVSK38FOKAsarL55amxf/P8KRfenI
 9pM6WDZEz7hPT2G5GuUOcSi9kk+dqbZctmJhl1DM1hVB2oepaE2SkgKw4gcPOrOAtThR
 ayjRcA71rsygD+8jDxckkvMh1uJMxiiWdVn9SC3lMEgb+ljzTFv9jG0zYxeKdP26Av9C
 0HOL6Thf0XkDdMEwEliUeYC+8BvDA3OavAXC3b52qTmKrE2aiD+vbOP+2ZxGWSDIYiwp 1Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tjgc68why-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Oct 2023 16:32:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 396GWT2m018322
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Oct 2023 16:32:29 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 6 Oct 2023 09:32:28 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_ajitpals@quicinc.com>, <quic_carlv@quicinc.com>,
 <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <ogabbay@kernel.org>
Subject: [PATCH 0/2] accel/qaic: Add support for host/device timesync
Date: Fri, 6 Oct 2023 10:32:08 -0600
Message-ID: <20231006163210.21319-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xO1-aiUx61WfRmMDSfnjHKCQupj4E40S
X-Proofpoint-GUID: xO1-aiUx61WfRmMDSfnjHKCQupj4E40S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_12,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060124
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
 drivers/accel/qaic/qaic_timesync.c  | 379 ++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_timesync.h  |  11 +
 8 files changed, 457 insertions(+), 4 deletions(-)
 create mode 100644 drivers/accel/qaic/qaic_timesync.c
 create mode 100644 drivers/accel/qaic/qaic_timesync.h

-- 
2.40.1

