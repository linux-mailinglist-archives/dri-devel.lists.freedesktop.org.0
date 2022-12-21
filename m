Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C66534CD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 18:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591FF10E46E;
	Wed, 21 Dec 2022 17:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA5210E46C;
 Wed, 21 Dec 2022 17:14:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLGnphm011216; Wed, 21 Dec 2022 17:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=SFm4sYMp/c3P2qEYhneJ47yxJuztQysWAUYzINhpWsw=;
 b=nbThkgGfnr/hDxuQZA6CLIEsqT80aXNWs0kBDnIAbQRZV0AUhb/LLkBI8DPg77Fby7f+
 aPhC7OlWly/h7f6yKRux29fJmKqeijuqiYajlmMBFhGUp7wcEdFwD0W2HZezHyj4dqQ2
 GD8ZvUz2eXX3zDh2s0NBvgSnCFnDnF3aALrfF0kXREOiTP4tM/tQTcRDSmqFl9nwFasV
 IrQlL7fEHeA0CKVCM2OzvqCSm3Xyu+/8s+xg18SDfm8nFOwEIOfERPUxtUQclppyGdt4
 TenQjFkiUgPZpTYdSbXPl/jjEscsbT7uJTWktV2vQDFUAi0yUwerVDMTqVKY+B/7qa1d tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm4xkr6ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:14:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLHEYH1022866
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 17:14:34 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 09:14:30 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 2/5] clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
Date: Wed, 21 Dec 2022 22:44:00 +0530
Message-ID: <20221221224338.v4.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a6rJ0FJEmWy7j7LoqvQEdWLJ-f2Uw8Np
X-Proofpoint-ORIG-GUID: a6rJ0FJEmWy7j7LoqvQEdWLJ-f2Uw8Np
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_10,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212210144
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the newly added 'synced_poweroff' genpd flag. This allows
some clients (like adreno gpu driver) to request gdsc driver to ensure
a votable gdsc (like gpucc cx gdsc) has collapsed at hardware.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v3)

Changes in v3:
- Rename the var 'force_sync' to 'wait (Stephen)

 drivers/clk/qcom/gdsc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 9e4d6ce891aa..5358e28122ab 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -136,7 +136,8 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
 	return 0;
 }
 
-static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
+static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
+		bool wait)
 {
 	int ret;
 
@@ -149,7 +150,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 	ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
 
 	/* If disabling votable gdscs, don't poll on status */
-	if ((sc->flags & VOTABLE) && status == GDSC_OFF) {
+	if ((sc->flags & VOTABLE) && status == GDSC_OFF && !wait) {
 		/*
 		 * Add a short delay here to ensure that an enable
 		 * right after it was disabled does not put it in an
@@ -275,7 +276,7 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 		gdsc_deassert_clamp_io(sc);
 	}
 
-	ret = gdsc_toggle_logic(sc, GDSC_ON);
+	ret = gdsc_toggle_logic(sc, GDSC_ON, false);
 	if (ret)
 		return ret;
 
@@ -352,7 +353,7 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	if (sc->pwrsts == PWRSTS_RET_ON)
 		return 0;
 
-	ret = gdsc_toggle_logic(sc, GDSC_OFF);
+	ret = gdsc_toggle_logic(sc, GDSC_OFF, domain->synced_poweroff);
 	if (ret)
 		return ret;
 
@@ -392,7 +393,7 @@ static int gdsc_init(struct gdsc *sc)
 
 	/* Force gdsc ON if only ON state is supported */
 	if (sc->pwrsts == PWRSTS_ON) {
-		ret = gdsc_toggle_logic(sc, GDSC_ON);
+		ret = gdsc_toggle_logic(sc, GDSC_ON, false);
 		if (ret)
 			return ret;
 	}
-- 
2.7.4

