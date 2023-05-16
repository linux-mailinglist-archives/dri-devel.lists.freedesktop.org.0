Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412927058A0
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 22:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814E710E369;
	Tue, 16 May 2023 20:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDBA10E369
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 20:20:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GJhgVC003299; Tue, 16 May 2023 20:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding : to : cc; s=qcppdkim1;
 bh=kR5TCiEa5MllJPNlVWhj+SL9BKVA0Z7agn6JZnDl+h8=;
 b=NesegK4Dkii9ThhycrdkdOyvVW/mgJBeQJDy+5Tzf8EsH2cdt0dlg/VSnPpPOLQYD6SV
 12EwElvOTVZgfNHAeLYWlMGii7sDXx3V+YGuHtGQwkj39yaMURC6hMyqWV6lB5vaH6D7
 At9KxPe0W2dVRNF5e0/0jWCKDkW3nF2FphRREHEPrWwSdBhrxe+K3oFEogSeokGnh7Oj
 CfkRv/UOwvIZ3gJLgIXu7OZUVMM5RQI7tjXF6WesFf0npjlqmk8cRQPjIE5ME6EJatzE
 qH7s0AH4q4GMgLaLjYPKhbW83lZquA7fJm9PkYGxqmEYa+3Bd9itPUB93aYa0GO3pXJ9 Vg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkkq9c21x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 20:20:42 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34GKKfVX004670
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 20:20:41 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 16 May 2023 13:20:40 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 0/2] Add support for Visionox R66451 AMOLED DSI panel
Date: Tue, 16 May 2023 13:20:29 -0700
Message-ID: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3lY2QC/x2NQQrDIBAAvxL23AU16qFP6BNaetC4JkK0YU1DI
 OTvNT0OzDAHVOJEFe7dAUxbqulTGshbB8PkykiYQmNQQvXCSIteI1urjcTFFZoxcNqI0UehvYm
 +D0ZBi72rhJ5dGaYrfzwx14yF9hXnb3bj5SxMMe3/+et9nj/L5/NbjAAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684268440; l=916;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=TIK06iBsalB3cLSs0Jw8kpX9qcMYo62ffcyZLkU85P0=;
 b=Tby9eyGmX0IxeQE4qRmsa/hOtrZN8G6iFKalZnfBCSYvQL2RRQJANinaM0tnGeQk3qkbm+oR5
 PF413VoPGRhDEO+uMPZo3liFcwbG38XAKiSIJg/gJqJSkBR+qLueBhk
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vh0EtcikGUFWYaLVeWDmzKXtpyehTz32
X-Proofpoint-ORIG-GUID: vh0EtcikGUFWYaLVeWDmzKXtpyehTz32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_12,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=753 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 adultscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160171
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
Cc: devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
comes with the Qualcomm HDK8350 display expansion pack.

The driver will come with display compression (DSC v1.2) enabled by
default.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Jessica Zhang (2):
      dt-bindings: display: panel: Add Visionox R66451 AMOLED DSI panel bindings
      drm/panel: Add driver for Visionox r66451 panel

 .../bindings/display/panel/visionox,r66451.yaml    |  59 +++
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-r66451.c      | 395 +++++++++++++++++++++
 4 files changed, 463 insertions(+)
---
base-commit: a5abc0900af0cfb1b8093200a265d2791864f26b
change-id: 20230516-b4-r66451-panel-driver-bf04b5fb3d52

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

