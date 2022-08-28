Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04DB5A3F4C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 21:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B940910EFC3;
	Sun, 28 Aug 2022 19:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E8010EFB6;
 Sun, 28 Aug 2022 19:22:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27SJLwXD032638;
 Sun, 28 Aug 2022 19:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=NN0hANgOTosS67AZM7qStNdWjz7PM0mNu/rAh+RRKaQ=;
 b=c20v2l0I3wZcgXrfyR4lhPmpwpxFAfVpA01wBfxCHanQuOqGek80nyz2aXhHavjZZdNR
 hMRCtsNBskc8jVPQMB+zDm383RRDclzOTtz9WZMdW/Tc2DGc0Ckt9IrV9pva8t0EIIaS
 BB3aCcunmAtSL/1JLeeIw5TC2g/ZW1A6wrVddFDnaLHqBhqgjreCAV6eeD+r4CZ3ZWNn
 vvuEPKU7YxiiKayQvc16NS6jOH7YUv4WEr2ikosGc15GhhpxNWjm0uEcCwFSDIr1gGMc
 7V8ULSQ2QArEFDWPH73DnhFdox4k50p2vbd60TvEA5g63RQ4xigs2k45hE5spPPof8df bw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7bndttd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Aug 2022 19:21:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27SJLu3k016820
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Aug 2022 19:21:56 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 28 Aug 2022 12:21:51 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 2/6] clk: qcom: Allow custom reset ops
Date: Mon, 29 Aug 2022 00:51:15 +0530
Message-ID: <20220829005035.v5.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bLq1jTHRB1vL9LkUNhTCNjRFP9BZlQzD
X-Proofpoint-ORIG-GUID: bLq1jTHRB1vL9LkUNhTCNjRFP9BZlQzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-28_12,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208280080
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
 Stephen Boyd <sboyd@kernel.org>, krzysztof.kozlowski@linaro.org, Andy
 Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow soc specific clk drivers to specify a custom reset operation. We
will use this in an upcoming patch to allow gpucc driver to specify a
differet reset operation for cx_gdsc.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

(no changes since v3)

Changes in v3:
- Use pointer to const for "struct qcom_reset_ops" in qcom_reset_map (Krzysztof)

Changes in v2:
- Return error when a particular custom reset op is not implemented. (Dmitry)

 drivers/clk/qcom/reset.c | 27 +++++++++++++++++++++++++++
 drivers/clk/qcom/reset.h |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index 819d194..b7ae4a3 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -13,6 +13,21 @@
 
 static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
 {
+	struct qcom_reset_controller *rst;
+	const struct qcom_reset_map *map;
+
+	rst = to_qcom_reset_controller(rcdev);
+	map = &rst->reset_map[id];
+
+	if (map->ops && map->ops->reset)
+		return map->ops->reset(map->priv);
+	/*
+	 * If custom ops is implemented but just not this callback, return
+	 * error
+	 */
+	else if (map->ops)
+		return -EOPNOTSUPP;
+
 	rcdev->ops->assert(rcdev, id);
 	udelay(1);
 	rcdev->ops->deassert(rcdev, id);
@@ -28,6 +43,12 @@ qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
 
 	rst = to_qcom_reset_controller(rcdev);
 	map = &rst->reset_map[id];
+
+	if (map->ops && map->ops->assert)
+		return map->ops->assert(map->priv);
+	else if (map->ops)
+		return -EOPNOTSUPP;
+
 	mask = BIT(map->bit);
 
 	return regmap_update_bits(rst->regmap, map->reg, mask, mask);
@@ -42,6 +63,12 @@ qcom_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
 
 	rst = to_qcom_reset_controller(rcdev);
 	map = &rst->reset_map[id];
+
+	if (map->ops && map->ops->deassert)
+		return map->ops->deassert(map->priv);
+	else if (map->ops)
+		return -EOPNOTSUPP;
+
 	mask = BIT(map->bit);
 
 	return regmap_update_bits(rst->regmap, map->reg, mask, 0);
diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 2a08b5e..f3147eb 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -8,9 +8,17 @@
 
 #include <linux/reset-controller.h>
 
+struct qcom_reset_ops {
+	int (*reset)(void *priv);
+	int (*assert)(void *priv);
+	int (*deassert)(void *priv);
+};
+
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
+	const struct qcom_reset_ops *ops;
+	void *priv;
 };
 
 struct regmap;
-- 
2.7.4

