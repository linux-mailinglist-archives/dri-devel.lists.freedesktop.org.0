Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED9A5AA382
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 01:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241C510E397;
	Thu,  1 Sep 2022 23:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E14010E36C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 23:10:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281N9Vf4015097;
 Thu, 1 Sep 2022 23:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=zzEDn2gG4eEN+SuetViKysC73T6CtsSoXhWh3JdeakU=;
 b=j/YpL2nhZqTp10K597/z1ajYoRdFA5qSkYmpi0GWU7xS+LXHnVCzl3OU3NWU5LdwsLX3
 pZiwhJHhxa3rBuIZoO4bhTyaHC4m+QO/6cvaLaI3gurqUlyh+dFQ01xgyqG81bxD1p/w
 TCDQA0lMC31AeVtxsND5Q8PcAhKRnTpGehsD5fMC5ojis7ePOTKVA1kBGczb40YdrTwC
 d18lpakz6k6Ltp50hddlfZFq6wvqnCDIhJeLorkQiythUJUak4fAOK6Nfp7yXLgYh+rY
 hC4uT8l4SoEl62ZAqsmQYRuYk9G50CHpDwRXGYTdzpXzVyxSwVd1x0TY3jXYxrLPgIIs DA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jb3u8ga0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 23:09:51 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 281N9oRr028825
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 23:09:50 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 1 Sep 2022 16:09:50 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND PATCH libdrm v3 0/2] Add Writeback Support for Modetest
Date: Thu, 1 Sep 2022 16:09:22 -0700
Message-ID: <20220901230924.145-1-quic_jesszhan@quicinc.com>
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
X-Proofpoint-GUID: P_xnb-R2BihIwbk7h9deYu4wVrEh24oF
X-Proofpoint-ORIG-GUID: P_xnb-R2BihIwbk7h9deYu4wVrEh24oF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=900
 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209010102
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
Cc: quic_abhinavk@quicinc.com, hoegsberg@google.com,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resending to correct typo in email list and adding "Signed-off-by" to
Patch [1/2] ("tests/modetest: Allocate drmModeAtomicReq before setting
properties"

---

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
2.31.0

