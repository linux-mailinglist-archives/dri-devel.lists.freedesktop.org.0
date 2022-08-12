Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E83591797
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 01:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94BD97B88;
	Fri, 12 Aug 2022 23:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86D497863
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 23:18:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CMUHrd029696;
 Fri, 12 Aug 2022 23:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=pVPPQ8NW2gVsMwKvE0LhjsGRtoqnmrCerKx0jF1Z1Bo=;
 b=ZwC/1envJWdrDM9eiBarUQqDwrJK7KmoHjJdf+5egNbRv5AZgHHdvxvfFkyZSfMZMM0i
 J9D0+6SoWsH4lp8DwalC0V7vXTaO7yG9gv2HSJ8OyGfvlqgTKVUWa1tmUL+3AXx0Xiyx
 AiWJ0WRYw2WerqhQOhyigQN6YH8uTyB9Og0hR2DLNjA2yGMlX0IyCiKNPdVbIiMnvd/T
 yPsRWgYH4C7EQC87H68RNWOgDkJwZDkdDIZJ+0sk9FL/rSrxB1pNhoPWDVEML/Cm7417
 it3+qY8yeumsx11yaZtLHWRxDDHz7mNPvyCGCL0UEiarYkBxZckbV7kqtZgdJXILWQcH ng== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hwf72b9b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 23:18:10 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27CNI9pI013920
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 23:18:09 GMT
Received: from hu-rohiiyer-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 12 Aug 2022 16:18:08 -0700
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH libdrm v2 0/2] Add Writeback Support for Modetest
Date: Fri, 12 Aug 2022 16:17:55 -0700
Message-ID: <20220812231757.1454-1-quic_rohiiyer@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: d9qLMNQt8Es_y2q8Bks4ABDRnkyXKqpg
X-Proofpoint-GUID: d9qLMNQt8Es_y2q8Bks4ABDRnkyXKqpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=777 phishscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120063
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
Cc: Rohith Iyer <quic_rohiiyer@quicinc.com>, quic_abhinavk@quicinc.com,
 hoegsberg@google.com, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
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

Rohith Iyer (2):
  tests/modetest: Allocate drmModeAtomicReq before setting properties
  tests/modetest: Add support for writeback connector

 tests/modetest/buffers.c  |  19 +++++
 tests/modetest/buffers.h  |   1 +
 tests/modetest/modetest.c | 165 +++++++++++++++++++++++++++++++++-----
 3 files changed, 165 insertions(+), 20 deletions(-)

-- 
2.17.1

