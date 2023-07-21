Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3075C708
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE82910E0F2;
	Fri, 21 Jul 2023 12:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EBA10E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVLFFVGqgepj9fnd+xRxXjnYzNgDp2tqHvxJxRshvWiHMziw+qq6cksZ9JZoxjzDXgACnHQTnAG2G2aI5Q0x9b/ASC1mt/x2+RmyANcJGJtA4+IE74s3t0WJvC7qcL/820TMmoVyfOOInv9phDHPH/UO89pe4VvCv7Lp0JR8LFsykFuTKISUE1CUyQYF1055QluLwQKtZ0yqOSXoCxSvbrX0yWDV1GEPaDaE0K7ub7NphqT3waOJ13dgfM8KngDGRX59koQwpAOIbFHHU1cINkdgk+U/bXvm+llbrC+sBsj63lTNoVyqP5GaERDb0e4xAqoLGekYK400p9Uy9i1A4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd3p91/7kWZoxq9hmlHH653KMLEf8Flo16kKp5jq/7k=;
 b=CbR3nQen6lP9sPmiAEguS707rCFhl+Pxo2TVblRqByZyzsl4vcHG5Lt5GTYXnL4lkTRCS+9L6KNbR9fHZRf1ilTLirMau5+ZdlmS2LdtWptn4FE1AEEUsvLf7UzOnHaPk09FlSgR0fD9ncylIwhsbnP8cB5E6SwCenk5GnQwo8RmXZ0ktLWD+y6P7lMgwRykSbUo6aDljlaOFJn1sqDln3f/1PEXW3YLe2KrLBybBex700aihVMQnESRxr7jdTxaq+TKqu9h7IlCFRyP5AFQbkZ0u8tlDTgZiQ4pMQ4jR4YcSi2Xoic4KiihlBB5SOeKnCRfFMnTsUuEUwtn3Irdhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vd3p91/7kWZoxq9hmlHH653KMLEf8Flo16kKp5jq/7k=;
 b=lFT/ohaHt13o5fKBx6D+9pPGEJt4miqI01VcbE7I8W6Jpzz0sUvzZUs2+CqXfBM42WL2JfFLXEa8h5MnuuPP5dP1lepP/MCkm7T9o7tKYljdx0cp2bBAF+shIz7FKCYFBxPN1YE9PI+Rfvog9LOvHMJU199WDVHXV0eJDONbNZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB8645.eurprd04.prod.outlook.com (2603:10a6:10:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 12:45:06 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 12:45:06 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 u.kleine-koenig@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: dw_hdmi: Add cec suspend/resume functions
Date: Fri, 21 Jul 2023 20:44:15 +0800
Message-Id: <20230721124415.1513223-1-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: e76da41d-452a-4458-1d3c-08db89e84fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QencDHjLQZM27FGAHlL8E1FMcFbsm6SEJ1uuf9qJ66tD/YaAPoMxok692BZ99BYKtAYmBjB37KK9aurtMonAOIBHq4nUU52kHQ56gKuN+/LmOS0zwdk8mlNn1PJfbHnaY2gmmkB/CwPLvPLFfyRApc1WW4Blxc4i1u1mCwjWSfqD3grzOaETAkNeBzZXrR3lU/PBuNRCustc01gUrSBibRNRz00k2fZm/ykdVft0WDrFzLlCo0CM46hLGE8q+1ju4N85DhqqmcWYXZlgNITb6drkFhDfuwjfTn67j9hbpvXgs/ilZL2MERVJs2Gcju5ta2aYBnSFv9S+QfCyMLrMGT5bglh/aSj8FTy689sq2yN37B++IKSeNsBKRStHKjGRwswuCrehrV9/p+mHn+6fZuaiyyP4AEIokRJG8TRdONsgvigqtE/axkqgk5iFeGE3+ZtWTrm1VhPpuDjyd2SNIXetQQl29rZHlXKWsxmgwXhVuIrRcuNK4Y5gpqGsLWlzGJ28Hm41BdTxdxLOdbJLu8RmYHdxS61hZM36eNoOPLqC3w1RJnJnJkH9U5l/qpcvEA9uq57vMd+naEQ7En69Enj5as5mRJNYt936bqjuuWG9PeJx2Q6Pmj41R4XtNiTKhL4I24jBbQ6g90z0s8SziA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(921005)(86362001)(478600001)(8936002)(316002)(41300700001)(66556008)(66946007)(66476007)(8676002)(4326008)(186003)(7416002)(2906002)(1076003)(26005)(6506007)(83380400001)(15650500001)(38100700002)(38350700002)(2616005)(36756003)(52116002)(6486002)(6666004)(6512007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vdLq/lB26jzQpU4XSFSA3Xeu4tfIwEdzZDPgKzDBKCr/4T0UwRGwLmBA+NS7?=
 =?us-ascii?Q?cTqUZMKyQAqx547uj1sI+w1NhG3CD+kaV3x0N9xhKGSZl7uymVha1T5hKsbs?=
 =?us-ascii?Q?nPoDa1mWAmnZaXRhXZ9AWC+tRq7Isd+s3zcg6GyCbFaNkAniAHoKYP4S2YO3?=
 =?us-ascii?Q?ipompYPMZXieJVKl6V0PLSfl4AfztZDBva2SdPJDHJKoNpMyKHHqcBDghdw3?=
 =?us-ascii?Q?yovJAk3NfsovRzpf6aD1JeRnReVO/EqBnNGdTnI9PC+otKQg/oxnSiLqHxDn?=
 =?us-ascii?Q?otfxp5Iz1p2guoH8X/m+JBIrnYvqs6KLJ+xIN3IHm2UQi/dR85+xKG7zhiRd?=
 =?us-ascii?Q?sXI9O9EPtiJtiNL+q0dtmf0LsOhsI6ovc3PuLc5/QcRZ5t3hFhQZ73d4CeDJ?=
 =?us-ascii?Q?jfz2Udm2wN7swfYownWsqa4H1eymrZFNJFeS9otmZjr7G1r3u0UjVdrA220m?=
 =?us-ascii?Q?XrIlor+Zc+F1hrLHc4mH6jb7Fn+vBWKPSLhiPdUDzErxlC4VpA44kB/xIsmm?=
 =?us-ascii?Q?WcLRNi9hNzAnlrrgu40fJ5P9q/UmpPlGBuZn7QO5LRfv1VHiJQkYFdAtOAbl?=
 =?us-ascii?Q?Dm/6jStQTVdqZnnUyZ937GZwg4bXaT5XzdydrSM1Sij1CirQI9ABP/ZP1y2f?=
 =?us-ascii?Q?tfPTW8HPDQYhRht5HsgRdMWy45XMAthz9gwvAeOo19Kuuqr/pn2d1PT6Ir6S?=
 =?us-ascii?Q?0/JPuAefQLx9nSI1FO7LyMCinMIkrFZyDSiVaUHKPQK4uG20NVHu/VRcVARc?=
 =?us-ascii?Q?Qgzz2iWzoXFs/iWDyA+BgACy7QjCPrO0BKzkYTwS+L722fOzIWCqGJQHY79l?=
 =?us-ascii?Q?eJgrsAkk955HnXWAOkEN6G5bOdBpxveePN8YedOt/kjTHpFvdZ6n2Ff/dSVZ?=
 =?us-ascii?Q?jQtVqa15XuaZFSoLPL1R38qGEwEXVEqg3s1+YmT0NCYgN1PMKzMlMnlc+EZ4?=
 =?us-ascii?Q?Z3GQxlnRIKwnr59KHYbmOyT8BnybOSfrJuoh6dRjXdYKFVbe8pvEGI7wSx6N?=
 =?us-ascii?Q?m/H4VzJNs3sXYO0kdBGIKUfFfKywxg5/qf6V68aFE8fpGQhF1WRbCbLRq09J?=
 =?us-ascii?Q?80OBjY6dhzt4gc/BRadsdvtlV9F35Fg4tqvdNmeITGvdUYPm4zEEPLH4jbaf?=
 =?us-ascii?Q?6tPwr+xiMaLe7ZFLT/u4f83fEMGT2Ia1YJb25Zq/jQy1l+FbmjrhQqPh/m1J?=
 =?us-ascii?Q?DT3TS1yhNNmj34F+P5cdQwYhm92Kiio3c7eJlGifacPhc66/3xxvTUK/ZPmt?=
 =?us-ascii?Q?palJvobU3erFNS8eRa04hWbbIdqt5dvsEz8sQmpGhdO3cV56hkPhUAAK2wk+?=
 =?us-ascii?Q?Wz1KiOqbO2hd4iUwmLElMG+SfPnXXOCwXq9PGgpu5wqlNjqhpA1NexZHy6Bn?=
 =?us-ascii?Q?x2GrgeAzJQFv9jq/t8ZPhy1t4ISx0Wy1RCmKICd38/1eAb2KXJPM9xFkhIcs?=
 =?us-ascii?Q?AVPq+aR6OYlFChN97zmwyyoK21MDc07XsjnM90Buco3fKp0A6/Gq+Vaymqt9?=
 =?us-ascii?Q?OgxVXEpZ8jTRXWjhBzvC7dZpU0vpwbceJK5nEmGK/tbTZIQUZ0ImOvyLXWP5?=
 =?us-ascii?Q?3mQi0i6yUCr7OOxrnbxvqU8AD5fRBBeTpnzIteRP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76da41d-452a-4458-1d3c-08db89e84fa2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 12:45:06.6231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HAzXkBz8rM/EKZM6HwHhZj274gX/pg0ltSdzsO6lQf45vtleC37JUE9nPJszB3vQb54+jCkq/DFS7+FltelNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8645
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
Cc: Sandor.yu@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CEC interrupt status/mask and logical address registers
will be reset when device enter suspend.
It will cause cec fail to work after device resume.
Add CEC suspend/resume functions, reinitialize logical address registers
and restore interrupt status/mask registers after resume.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 9389ce526eb13..be21c11de1f2a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -62,6 +62,10 @@ struct dw_hdmi_cec {
 	bool rx_done;
 	struct cec_notifier *notify;
 	int irq;
+
+	u8 regs_polarity;
+	u8 regs_mask;
+	u8 regs_mute_stat0;
 };
 
 static void dw_hdmi_write(struct dw_hdmi_cec *cec, u8 val, int offset)
@@ -304,11 +308,44 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
 	cec_unregister_adapter(cec->adap);
 }
 
+static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
+{
+	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
+
+	/* Restore logical address */
+	dw_hdmi_write(cec, cec->addresses & 255, HDMI_CEC_ADDR_L);
+	dw_hdmi_write(cec, cec->addresses >> 8, HDMI_CEC_ADDR_H);
+
+	/* Restore interrupt status/mask registers */
+	dw_hdmi_write(cec, cec->regs_polarity, HDMI_CEC_POLARITY);
+	dw_hdmi_write(cec, cec->regs_mask, HDMI_CEC_MASK);
+	dw_hdmi_write(cec, cec->regs_mute_stat0, HDMI_IH_MUTE_CEC_STAT0);
+
+	return 0;
+}
+
+static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
+{
+	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
+
+	/* store interrupt status/mask registers */
+	 cec->regs_polarity = dw_hdmi_read(cec, HDMI_CEC_POLARITY);
+	 cec->regs_mask = dw_hdmi_read(cec, HDMI_CEC_MASK);
+	 cec->regs_mute_stat0 = dw_hdmi_read(cec, HDMI_IH_MUTE_CEC_STAT0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dw_hdmi_cec_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
+};
+
 static struct platform_driver dw_hdmi_cec_driver = {
 	.probe	= dw_hdmi_cec_probe,
 	.remove_new = dw_hdmi_cec_remove,
 	.driver = {
 		.name = "dw-hdmi-cec",
+		.pm = &dw_hdmi_cec_pm,
 	},
 };
 module_platform_driver(dw_hdmi_cec_driver);
-- 
2.34.1

