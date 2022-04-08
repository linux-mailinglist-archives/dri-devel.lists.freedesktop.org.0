Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C2B4F930A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3968410F14D;
	Fri,  8 Apr 2022 10:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B216810F14E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:33:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKB7BDJgTk9la2eELYxVOcBCDHDc6ETZXtkG8xe2zBc/5NhTa1KtHGMJL6Fa+QLCH8E33Eiv/qH6YszaMr/KN97Em+ZvXM+k8vtgCo0XmYaokQx7aTxhySAAnP5AnOoIAavVXdzraSKtFLlcCqVpjXoQNB2GW5WkXxtx7Q8sIhv/lF0ON0frJZCxfm93pscX26+xvp0PYVX95vSG0vaKeh47yGsY3r9tvPg/HOdKIq7e9UGGqAxmu9HpzVyEvWd31MAZC7FF9FLM6kwAXN7jv4U75GkI5sMsJ7rM3BM02duQRFlA0oRD7UmdCM735usxhJkrbG4R56JuZ/8RyrV7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/UinYkAx6YLN/H678GMQTXmItd+HI/0hnc5JsCgZSA=;
 b=j0VWrEmjVDuk6sosemt7YCwcAQIJR7id9zrdmxSYh9eUvakr0pcdBM9l6xHQZaD5Els1h5Kg1HADXeRcsObE0T3TIxwn9AXHSLIERj0qCUiEDEzZMsNpozthd08VuBqMpG3qjOFjbPJN0tIyZN6GNOTNDV2RFtgITPiyoPh/0Q0RREWc6BbXxs+706W2l3umYtC/PCaWNAnnbu/5jinuTKIOA2R8doFJ4kZXXou/Qa+ZLtvW5JCiSqzKT9mtyYIIH5xh2HUtceLL/5D0pSnhb7hNZeYmEkEQpEQHWJCHysDyhZggUrZL56qvTjiPpyEP55mWP6HcsPsRluaeiJCc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/UinYkAx6YLN/H678GMQTXmItd+HI/0hnc5JsCgZSA=;
 b=H7d4kl+yQupeLNxTiN62UlZJcV431QOBUCxIHAlacr+u63qf0N6P29SzlbA49OnPZwCCrG1PryQ3KYjAeepkyd5kUabWjh8o1uz5YE8nhVj+CIiJxdd4y5kFaSDE6NXHr/zvTkAs8X+0wcCDWE6a8bXla3RlGhkgM9943Nvq3eI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:33:06 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 10:33:05 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 1/5] drm: bridge: dw_hdmi: cec: Add cec suspend/resume
 function
Date: Fri,  8 Apr 2022 18:32:24 +0800
Message-Id: <45739041a743cd435415ca53264678e57a653147.1649412256.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649412256.git.Sandor.yu@nxp.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To DB7PR04MB5450.eurprd04.prod.outlook.com
 (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18941857-4ec3-4330-abc2-08da194b2ab3
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3405B56C617863B026E06792F4E99@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PpLvTSw2XNeTv80dFNp8x4hQ1yxcUX09phvDZKJbWFzbPJIXWXmnH59mz31uRUDShNu/tKB8i329jVbgmid4JrO+TFOU4AUACwR7TsZxKfFZ9aquJhAKaW3OV7vccRvKD2zYuJatw7Sx65OKVRDm/VRZqdU7qNfCvzQuTSiyb6xdCsfGm02qJWmsK+Vl5zT6aWNAg/HWtPu0eM6IJGY8Eno5MOiQHQHOLpR0sqTlvbWzf01qauhyFAy0v0lVZggSAas/oVJCyRurn8rIBKdHiaKEIaHRV8jQgrhIw2+w7jykGOzJRJ3yC4oBXsQsCoz39SOycvBJQyhHNDxOFK9+po52RQqIUmzUEbAL9sywJYRggleXPNAlTbg6fiqRNosmaVwMBp1Dn1kFy2C80YigSkR1C9Cs9b8+ir4er+ftr4tX66Zzugnp13nGuZO9dgoiFzCh0OV7UC+zdW79DUGmGi2MZv2GJ8qvpHu3186pPlNy7vaeG8mVsLptLV57IOXMqCNS7PzIOtY0A9xuavEuQq2RSbujGsLkexLirZh9rOZ+50zhrMzoJ0aLyuvPtrI9jtsmi8sSHqsBx3oBDsWhfXRqZx9xQayuEyJf6DekNg3kG1uikXQebWQeMtOePMV6FhqDVxoIwR7WWq0BINGjN/f2EyYozYFZ3s/oF22KndjglksBPiGYO/L4MXjDN56oVnicByCS0hGdHnE0+OJMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(52116002)(66476007)(15650500001)(6666004)(83380400001)(8676002)(86362001)(508600001)(66556008)(66946007)(38350700002)(4326008)(7416002)(2906002)(186003)(316002)(5660300002)(6506007)(26005)(36756003)(6512007)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YeIUHj3/NB80GLYqCKsknM7ML3qfXHQ6a9kji9IqoXbXs6nxk1tAgigAbT6s?=
 =?us-ascii?Q?1DSryu483n4Q5anYCvHRpTKb4fgnNs9jlS8WYudzMr5TOR0PUc3GKRJDRUO/?=
 =?us-ascii?Q?jLgPckm7ISOfYuwSriQtTzc0oT4CO8Jm+LkHInB6/v1Xl4nwBCNqJ3x8At00?=
 =?us-ascii?Q?Bt8EyOEKH5wRWc7vfrCLfCcV6iy/p/R5ESIpKfrbyAZzgPMGMzGdn3/mwkaK?=
 =?us-ascii?Q?5eLGes+gBWFjukGT8na+pD9Dwsmo7nsMJK+3DS2kmASDS2eIUDSTi2jr+oJi?=
 =?us-ascii?Q?eXrztfEbCf2MOmOxQdvw0yMx32V2guVFQe3v80oTdLjRHRmpLVDzKszDbkMR?=
 =?us-ascii?Q?5T20+JCiAnnAQMfMhXgTXxyydArWigaTt0jS0KWJshFExOrGH/96NLEigr6K?=
 =?us-ascii?Q?0iEJTH5n/RcM4WDYe4dTApnJGVb91Oq30zqOwVOLSI4sPY4POw5q/eS7wjS2?=
 =?us-ascii?Q?/EDERwXhr0Ipz0Rk3OOaetCDMOq5xeP1vyCbei9oNS/SlCEKZRLx3WYeVeav?=
 =?us-ascii?Q?eMgtDPuDNkwxf9c1bMC77u03FSg6krPrMlQp7bWEK8VJQEVf8SBYQrP4lbY7?=
 =?us-ascii?Q?KldArmpdPy+N7kXoBYgkP1u0e9AwU925zn/69ceFKyaJp1zGB4MwomliH0ri?=
 =?us-ascii?Q?SvmVq6DF9x6fbNUJjROXN0eUOy4vHOWOfCQO+v7KTf3xjyNPjjXZD1H9W0Za?=
 =?us-ascii?Q?SRfCBxKrC8qQpbnJFmNVHgh7YR+z13LBQ6cswBuBi3184AKb83anqW3W5wyg?=
 =?us-ascii?Q?ny+MN9sS4YgIXm3fS6cvoViM78NSduPIuF4H5Jxt+IdY/31DZj7TG4bDIX2f?=
 =?us-ascii?Q?LkMRczgskkMytHTI5z9UKFMR7nlIgU8/ZsQUs8JkfkeqB9GmQxjLWySMhV59?=
 =?us-ascii?Q?zBsxBDkUgbTrvT8oyoEKlv1m2l4NhYiUHB6gu/JyuGPOpYEsM7k7XO/E1lH6?=
 =?us-ascii?Q?2vgEKp9ZWdq4RRqSk2RBP1BtJD5qXS9yLw1QRpmSnLHhPnf7mUxU3FkWshs2?=
 =?us-ascii?Q?XuzcS7SbDansARgLH3pQUL+T2QxHqXDzsvh8NjSuzDpPDR6sABDxaYdEjvoS?=
 =?us-ascii?Q?iop/kiYn8/mg/7GVtpieQCREx09iCf4bjsBXqG9scLjPxE9YjL67gVK4xi94?=
 =?us-ascii?Q?SXfQ1EsX4nXyK4EDGlfVZXNdkjFRXlZQfqLH8VkdojKjvz3FUrB0eHfTBKuV?=
 =?us-ascii?Q?eYjJyItffEs7oiHkxs3QJbRYwG+n21d0vZO26Mg9nrSvk7PoxubbiyHw0GFn?=
 =?us-ascii?Q?xtYJ6pMtd6+z7H7NDv1/JjDeDGMHUdOA1OSyRkbqxV760WQu4dJgFit78+58?=
 =?us-ascii?Q?77nqjti3dTzu4uNzgSfjNBdrnO/et5rGX6HksUTHdF/uHR6sRAmFyrocU/Jy?=
 =?us-ascii?Q?0R8T3Y11DvA52d7BbSHAs0/Y1x4lZ+bU8tvNzWXnGNgl3OAQhbUfnANKa3Xo?=
 =?us-ascii?Q?IF8SFWDyBp6Xj60fcKZa4ML4I3isgy5myw0a2wwa/gnbXmutOrDvZqbDxLDB?=
 =?us-ascii?Q?Ts6S1G7XCrXdlFgU9tWno1oXfoUHUzPv2QkGHJgDAFkTdbCCKBcx+hKVddk+?=
 =?us-ascii?Q?+NeRA1h6bZUQOtKPIl87AYU4iQ95kRhP2DDW6t5VJYm+AyM+D7DSI1NaGx8O?=
 =?us-ascii?Q?xLHiX34hVgK7GhW5NUhpjcSG7HW3301sRzULqvHzM6K3YK2QNzBrZvJ2XrLS?=
 =?us-ascii?Q?KizkVntoFGXZAhoUF53Kb6OCXf5Pr1xcRdC8ot9QFu3YePuNN47ROTukTBt8?=
 =?us-ascii?Q?jZjKnEztDw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18941857-4ec3-4330-abc2-08da194b2ab3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:33:05.8037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlIm8ZGPdR+O4c0z3JOcNq+0FZLrLvkIk+sxdVMbuE09U1JrXuPaaOPAhAujtDaNu3MPZPuQ4OiWSQdUvjHHOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3405
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
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
index c8f44bcb298a..ab176401b727 100644
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
@@ -306,11 +310,44 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
+{
+	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
+
+	/* Restore logical address */
+	dw_hdmi_write(cec, cec->addresses & 255, HDMI_CEC_ADDR_L);
+	dw_hdmi_write(cec, cec->addresses >> 8, HDMI_CEC_ADDR_H);
+
+	/* Restore interrupt status/mask register */
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
+	/* store interrupt status/mask register */
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
 	.remove	= dw_hdmi_cec_remove,
 	.driver = {
 		.name = "dw-hdmi-cec",
+		.pm = &dw_hdmi_cec_pm,
 	},
 };
 module_platform_driver(dw_hdmi_cec_driver);
-- 
2.25.1

