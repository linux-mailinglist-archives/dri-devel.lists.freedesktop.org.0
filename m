Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F665AFCA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D846810E306;
	Mon,  2 Jan 2023 10:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68F510E305;
 Mon,  2 Jan 2023 10:49:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3029f4CQ032142; Mon, 2 Jan 2023 10:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=gJFZaBKm1J2oTYrnsJYWMaEEuU4OU/XOBGD0euxe2zc=;
 b=F7sUMv0//AfzwdssG5weyD+4c9NDcuLhXHqhyW3JG7jgkV/f0yy/erxbBRtz+Pyj39CT
 jAaLpVHZnFAXC2FWzLIFGbpmgCfoIvcrfa6zxttkE15al7Ar8vHizPzRK4GKUEHANzgK
 77XjtB9ET9IkWsKWkea32qCC5gpRG7ZjsNNCv5wXQf6p6ZQ8e+S5JGoYpc8WfQ/fyq3n
 6S7dRcKsTgLgI5mg2WQVaUkWz34f8ViCtp4uYBxgygNncL7DYf77MV8VNws1ZUA9g1yk
 IQaJrhORHadd7tyQf+aqWJNT1U/fes2ofsBOEPfgLmio7jqe3ccbkHI2jFpthxTW3Urt 5Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mtd61avtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jan 2023 10:49:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 302AmxF4007356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Jan 2023 10:49:00 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 2 Jan 2023 02:48:55 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 2/5] clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
Date: Mon, 2 Jan 2023 16:18:28 +0530
Message-ID: <20230102161757.v5.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VICx3pDz2fGaX6a4ZJRdP0V79wLzPK5W
X-Proofpoint-ORIG-GUID: VICx3pDz2fGaX6a4ZJRdP0V79wLzPK5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_06,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020098
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
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
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

