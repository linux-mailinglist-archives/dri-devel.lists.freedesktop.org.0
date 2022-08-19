Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E4959A292
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 18:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0436910F059;
	Fri, 19 Aug 2022 16:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB5710EBB3;
 Fri, 19 Aug 2022 16:41:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JF6ZiL029782;
 Fri, 19 Aug 2022 16:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=XcK45ZOfuC4y80OyCD3xppdyX0meI1HDbswTi7C7fyY=;
 b=K9h2fqRdUTQ6EyPE/EvpiZZ4w6urC7j6vk0cH5AY9qQhrHb4Q5mCkuLOm7YfP/elnpDF
 kodek4mJiJ75vCp6nmilIFPNjqOyIKPcSHGLihe0ytlBIqRetXLrnqCB/LqrVgbv0IT+
 jliFM0d7L3iQCANDzTitoPDITjAwAr4JjWVItyEhrQderAywGZvJyyvrjN8JyVO1DS93
 Z1VnxUlC1M8NDCNxrZKGnRBIrX5WQ6tP1mCjSmA/BRrjDk+CVyZmYWUYCsWTQT/7qVV2
 0hkdxgL4Hb7GdtENvrh/YcHvrQbJ9gDT4dea59Ya0Q+B/y7+ciTtzGw+fpdTb9xn2wm1 sQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j253khnwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:41:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JGfJUX008904
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 16:41:19 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 19 Aug 2022 09:41:14 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 3/6] clk: qcom: gdsc: Add a reset op to poll gdsc collapse
Date: Fri, 19 Aug 2022 22:10:42 +0530
Message-ID: <20220819221017.v4.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -K3AawZt1W2rZdSvT_PAqLVDyzzqCj6O
X-Proofpoint-ORIG-GUID: -K3AawZt1W2rZdSvT_PAqLVDyzzqCj6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190060
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
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a reset op compatible function to poll for gdsc collapse.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v2)

Changes in v2:
- Minor update to function prototype

 drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
 drivers/clk/qcom/gdsc.h |  7 +++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 44520ef..2d0f1d1 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -17,6 +17,7 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include "gdsc.h"
+#include "reset.h"
 
 #define PWR_ON_MASK		BIT(31)
 #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
@@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
 	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
 }
 
-static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
+static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
+		s64 timeout_us, unsigned int interval_ms)
 {
 	ktime_t start;
 
@@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
 	do {
 		if (gdsc_check_status(sc, status))
 			return 0;
-	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
+		if (interval_ms)
+			msleep(interval_ms);
+	} while (ktime_us_delta(ktime_get(), start) < timeout_us);
 
 	if (gdsc_check_status(sc, status))
 		return 0;
@@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 		udelay(1);
 	}
 
-	ret = gdsc_poll_status(sc, status);
+	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
 	if (!ret && status == GDSC_OFF && sc->rsupply) {
@@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
 		 */
 		udelay(1);
 
-		ret = gdsc_poll_status(sc, GDSC_ON);
+		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
 		if (ret)
 			return ret;
 	}
@@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
+
+int gdsc_wait_for_collapse(void *priv)
+{
+	struct gdsc *sc = priv;
+	int ret;
+
+	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
+	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index ad313d7..d484bdb 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -12,6 +12,7 @@
 struct regmap;
 struct regulator;
 struct reset_controller_dev;
+struct qcom_reset_map;
 
 /**
  * struct gdsc - Globally Distributed Switch Controller
@@ -79,6 +80,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 		  struct regmap *);
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
+int gdsc_wait_for_collapse(void *priv);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,
@@ -88,5 +90,10 @@ static inline int gdsc_register(struct gdsc_desc *desc,
 }
 
 static inline void gdsc_unregister(struct gdsc_desc *desc) {};
+
+static int gdsc_wait_for_collapse(void *priv)
+{
+	return  -ENOSYS;
+}
 #endif /* CONFIG_QCOM_GDSC */
 #endif /* __QCOM_GDSC_H__ */
-- 
2.7.4

