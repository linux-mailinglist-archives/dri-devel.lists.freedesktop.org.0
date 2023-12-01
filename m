Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BC28000D9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 02:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD4E10E794;
	Fri,  1 Dec 2023 01:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2182A10E07E;
 Fri,  1 Dec 2023 01:08:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B10sa4j011035; Fri, 1 Dec 2023 01:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=S6M8nEPOrFcZoYBRUnK/QHXgxoC6LrftMDDaXulwOgY=;
 b=HdxyHUjq4kgU9xaBmhislNlf6B2+XpaxqIf9Xh2NDMcy1nLfTJwuh5fwerKkGC1nJHnD
 y8X3F8udcaTHKSneurs659ZPc6IKUtVktEXd8MEBMv0IxgMCDdSQcvQ4Ju4iy7uVrlri
 S8bKRFCpJuPzTv7QI/k1C2Ic1IbeoCzBkNsB0Bi2cm6LFp/hNjsxaMB1b3kXDo978NXX
 Nv4YK7F0a0rTHuTvz8z9S+RMvt4Z7SAz5wTD5xOmNdXpgqM94dHxsw2AkNEr3KN2rRRh
 k6OW4E30PZIusdb4e6hLgWrdWZKWjMQGpm1NqhUIRE0IdLuK5RDJFyFAkrNz7PO9kneX +A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upjsqu069-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 01:08:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B118Hhe007675
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 01:08:17 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:08:16 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 0/2] Stabilize use of vblank_refcount
Date: Thu, 30 Nov 2023 17:07:52 -0800
Message-ID: <20231201010758.1703-1-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gaKZ8S6RD8NylGberkW40qDDCi_c-qZx
X-Proofpoint-ORIG-GUID: gaKZ8S6RD8NylGberkW40qDDCi_c-qZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=566 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010006
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, steev@kali.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is currently a race condition occuring when accessing
vblank_refcount. Therefore, vblank irq timeouts may occur.

Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.

Paloma Arellano (2):
  drm/msm/dpu: Modify vblank_refcount if error in callback
  drm/msm/dpu: Add mutex lock in control vblank irq

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++--
 4 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.39.2

