Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E3D984E54
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C53010E8E2;
	Tue, 24 Sep 2024 23:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="d5Na4m6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B4510E768;
 Tue, 24 Sep 2024 23:00:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIlh1p022296;
 Tue, 24 Sep 2024 22:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KYVnxGYGHS9AyjjqurWn8yz0tz8iUM55Xap6+Awa6Gw=; b=d5Na4m6b8ruGq/18
 GeqfSLSvupbkGEnEOWgtFB9uKZbptJTqlZfabJxlAu5sxRXAx+m0W1+DcHKOAjk6
 LAN2P5Ukud2NboED5rtELQJbL63Nm/OM6So12RC4gUIYxX93RoTwt6uMoJLNGR4K
 jMDCz4n7cvBjCOIIAnGvvNFcaQrn0oG+iOl7T/1ntAbu6gJASDUqtr/rcq2WU3jc
 QqKFbapZTPt2YZYHnv9IfEpYTitAdcTH1WuX268X9V+eIyv1hwH/3e1j96C7eofI
 B8/OvKEikkXYdfc2TlRu9k7dNEWokS0Zawq71zUz14fouUKGthFzxyfkq8ENxGtZ
 R5q6LQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwesx1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxu0h027320
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2024 22:59:56 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:56 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:25 -0700
Subject: [PATCH v2 09/22] drm/msm/dpu: add devcoredumps for cwb registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-9-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=1094;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=2rsP3u3enycrNIgv6cRl4ii0K028j81PzAnFLtOhVtQ=;
 b=JtcYmrqlkKtPzw7ks0XPy4nHL9+927iYEAppNggNzoL3aOnP0r9qTMKzXjqpm39IIZxt5/iG+
 uuS83uLQcUcAYqjUU1IzhyIdzqNtf+Xl3haC7k6cUNemg4lY3URbxoG
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UoWIsTMpF6i37TOLAMfxgR41-2WUNNp_
X-Proofpoint-ORIG-GUID: UoWIsTMpF6i37TOLAMfxgR41-2WUNNp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160
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

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Implement instance of snapshot function to dump new registers used
for cwb

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9bcae53c4f45..47e304b357e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -989,6 +989,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 				dpu_kms->mmio + cat->mdp[0].base, "top");
 	}
 
+	/* dump CWB sub-blocks HW regs info */
+	for (i = 0; i < cat->cwb_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->cwb[i].len,
+					    dpu_kms->mmio + cat->cwb[i].base, cat->cwb[i].name);
+
 	/* dump DSC sub-blocks HW regs info */
 	for (i = 0; i < cat->dsc_count; i++) {
 		base = dpu_kms->mmio + cat->dsc[i].base;

-- 
2.34.1

