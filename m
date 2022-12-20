Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8CF651BE7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 08:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3825E10E346;
	Tue, 20 Dec 2022 07:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069310E2DE;
 Tue, 20 Dec 2022 07:44:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BK6UxW9029669; Tue, 20 Dec 2022 07:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=dD5fd0RtHrHNhif1UBrHQOWx+cDpnFGgfdPgO33KGd0=;
 b=XPokzInzp1Mshb6xQqbJZ4l11Zx3SjC56iIOfa5rlAk00em6MWsDvL9cu5Vj4Pn7WQGq
 6rMth/agrWNE0IqfHcocvSBTLuat/K9A3puHZEGhvTpIAGLL5BLPoCbn4ALcTWecFF/q
 8AfdB85QsNlpKegp0eon982v9yJ9ykKFrxEq9eOFLVLhg8l94cz2wzNHEXLl8vwcDeg3
 9QG2ZsVM9Uh8eK9iCohhvS8J0yuKXtWVZcz1lBk7l9UUxXZcordKQv32KdZd9fewEi3/
 fErSdnFC56ZOQyTRQHSA1OhCKOIirxhhkvxiE7RRXslCqMsl4U1J24Zbkjitjo3nSxZ3 vA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mh65epecj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 07:44:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BK7ilnf026730
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 07:44:48 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 19 Dec 2022 23:44:43 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 2/5] clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
Date: Tue, 20 Dec 2022 13:14:14 +0530
Message-ID: <20221220131255.v3.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671522257-38778-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1671522257-38778-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nz766BrNBAgf3mFiF7_uWsv99iaaM7Oh
X-Proofpoint-ORIG-GUID: nz766BrNBAgf3mFiF7_uWsv99iaaM7Oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200063
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

