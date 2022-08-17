Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B087459669D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 03:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A4210E16E;
	Wed, 17 Aug 2022 01:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA2D10E282
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:22:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27H1FN8h025958;
 Wed, 17 Aug 2022 01:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=DbH/Gs+eznGn/bnTGliaNfotD1SP1UNDB7aB2feUYzA=;
 b=UuZExw97JE2Mnx40PnL040RtnDfToMayNgQo4BM66C9r8alvnwi3qdu24iv0DciHNPn5
 7+ZlB074e4r9t72CG3LHuQTNM2zrFKPtgnqG8TX5DXcsT/yGjGd2ZhDfUWzp0hX7EOUL
 p2weQUB9rrfEwLwtJCq91ep2xyI4sOBj5pEQn8sC6cJz4vKUaPJpZzKXYW7VapCd4PyE
 gRxnWKc7VvioLznzIthsRncQxek0Mv1Ywf25BM+TWiVZbmsA6p1MHHtxOKKBuSWyFr5G
 lyRHvHl7jEXivww14v2MmF/0gNas5Uc1lbQhI6ObqNLSYqBFI57r1ZRL08jzCR1BDr6H 2Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j08wmb753-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 01:22:13 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27H1MCQZ010574
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 01:22:12 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 18:22:11 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v3 0/2] Add Writeback Support for Modetest
Date: Tue, 16 Aug 2022 18:21:59 -0700
Message-ID: <20220817012201.162-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SH69xvNbWddN0VITBV2L6y8DWjFEXxSl
X-Proofpoint-GUID: SH69xvNbWddN0VITBV2L6y8DWjFEXxSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=913 impostorscore=0
 clxscore=1011 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170004
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
Cc: quic_abhinavk@quicinc.com, qdmitry.baryshkov@linaro.org,
 hoegsberg@google.com, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add writeback support to modetest with the below options:

- Passing in -c will now also show the writeback connector

- Test a built-in mode on writeback connector

- Test a custom mode from user input on writeback connector
  Usage: "./modetest -M msm -x <connector_id>:<mode_parameters>
            -a -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24."
  Refer to --help for exact syntax

- Dump the writeback output buffer to bitstream
  Usage: "./modetest -M msm -s <connector_id>:<widthxheight>
          -a -o <filepath>
          -P <plane_id>@<crtc_id>:<widthxheight>+0+0@RG24"

This currently supports a singular writeback connector.
This patch also fixes a bug for running modetest with the atomic flag.

Changes made in V2:
- Added helper method that checks if user pipe has writeback connector
- Added error message for dump flag if no writeback connector is found
- Polls on the writeback fence fd until writeback is complete

Changes made in V3:
- Resolved compiler warnings
- Defined ETIME to ETIMEDOUT in cases where ETIME is undefined

Rohith Iyer (2):
  tests/modetest: Allocate drmModeAtomicReq before setting properties
  tests/modetest: Add support for writeback connector

 tests/modetest/buffers.c  |  19 ++++
 tests/modetest/buffers.h  |   1 +
 tests/modetest/modetest.c | 187 ++++++++++++++++++++++++++++++++++----
 3 files changed, 187 insertions(+), 20 deletions(-)

--
2.35.1

