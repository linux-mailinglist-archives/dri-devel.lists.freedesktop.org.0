Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B62B8ECA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303D989B03;
	Thu, 19 Nov 2020 09:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7F89B03
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUoJxKD3W3bY4vHGK8V2NuxMsZ/3QUUk1pBVnFoFl3bj7IDODDbbDqx3IK24e8QoNIDvWg82y90vvZ8OxSDjPAKb0w+xHvcSgFbOrGlUrLp7/8Gz+JSOJv59QHwPVDbpiWQAQBIyNhfrV8Hpys0eQM3ldUjuZJKozeLEPP18u3kB2sGaHjWfiNxYbQ1BEDrMDqzsxbgc+z0PdxnNcfZXVWrPq0OLyA5T5BoCXQriQ7ZPLZ+plXsWyBTCfnhE3VBTSj03Z5kEvNajguH6YdgmZ+5mp6UhzmVVOV6Q3d1m572nkQRQ5qHTfuyPfMs/xyeyq4OdEDH3vhtUmi9Ihq8sjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxHXIE3oSnAx4KBYDjcO0Z9WJk2QvQSCTGCGxe2Yiuc=;
 b=hsTsNYhptetrfNzTemNU1LsKz7cnRbjLuPzWex1hH30RnvObSsB5P5hBux5eZfDgvkcKKV+cqZmJI8ya2OX5wSJXRP8pbjs55cmw8nFpHsNf+RJKaMx+6BaQS1SsuYZ6ns5np1baz6CCNP2l03TQrgaJc2qEOMO1nSyAP97mYaLtcXagQ68WixUZRgdvnTAUEx+DsXk9OxAt2pLwPQw+JX3xvqNA+hgEm2Za6i+YoJbuCy9r8t6JdpsT8xfB8z3VE1KP75RJSiheAOkBoh92xDyWaOptNbEn8wyNkawYhhyuq9FJmjAVp0e2fpp+p4N/q2mZAugRWEytuWs7n6QKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxHXIE3oSnAx4KBYDjcO0Z9WJk2QvQSCTGCGxe2Yiuc=;
 b=ec+437RTI2mSy9QHTb75wx8tIiKegFiMjwSaqRdFPqSfgcwPZds9fVWBUuWnvPexhTTUIe67R7eHabiEI1v73WBsLi9DoucarhmcdvT66aKxZOmkKVSvOUEww1bISRoOuNa3G9aHq4oWkYMGdhiFhmxjyXkxl+kCLay1QPPj75E=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 19 Nov
 2020 09:30:13 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:30:13 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] arm64: dts: imx8qxp-mek: Enable DPU and it's prefetch
 engines
Date: Thu, 19 Nov 2020 17:22:25 +0800
Message-Id: <1605777745-23625-9-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c586b18d-7883-4b05-2523-08d88c6db146
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34055DF4F13D295E8F41819E98E00@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBnzGOBLgnDJaAlA4oBCGj5+3w7ca0bHlEAifh+ksFqkoIcQqugq9h8A65LPG7IDSURh/aVQM02QyJqsuSbmcRjKenyWdn1X7mskRvcQtHsCARTZtHBuskbiLfwuVz+/mzOsJSTO/W1VQJavwIcIWvlS8m0rHZxBXIBZIJbHFDZy80+aHN1BYjdm/iH3MjtkXr5fB+xfLkLuGIEInmNi4DfJmrRGSn9Udv/a5hrmpf+dkpMusZaAfujT0JqyH6ogTk6hbuBxpBXsSIYsGelCZRGW4ocNMGXDapJhhudtr4PLMGmT3wh2C7c5mQ7ff80ITIL951O0F50dr2n7pqXOc0njj74oL2+l6iluPP4+gaw7qmDWFeIXofGPY88O7wVA5ZDFOlUjx/zz5Tu/YNKezAmwdAZqMjDA6UZ8yPOT7Jw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(2616005)(186003)(316002)(5660300002)(956004)(6506007)(6512007)(478600001)(6486002)(86362001)(16526019)(8936002)(52116002)(4326008)(69590400008)(8676002)(36756003)(7416002)(2906002)(66946007)(6666004)(66476007)(66556008)(26005)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +6rZ3ee4qLYWq02ADm4Bca10TvbiHfAMqPcC5ZOSRQrbWF33eIY9YqB5URZ9l+WDYymyeDZfTGXRr22fOmrFbQx3vbeLdYC+9htvGrxXrm9JegtsV5Fr3EVLaA2JSh9hnrhrtBeNhDFW8SXpJOywLdWklb3Gor83aVVGrg3C7CZiQTa77cqYaeytpfNwEB3NNGUKbraLWouLqiGsYqvpa/aQ5lWKWJkdIW6VZ+8BNKuFnZeg/Hr9d8fQpofAACBeHSCbxjcTGXOjEiBCoKneQ/n0/BRZGWgCqCn4F/6PMhyX33JGI9jNmVhWNbSCGjGUqJ+u2emZ9nXYKL4YsXkLnCp7yE8DYsWogkhh4Etz1zGpZh/b/XFKQy0/FBTmkqRp9mYeY+ImlYUs2dYVHBW3HNRA77DvbV1TbOb6rOCG+QIDCzK6f5JsfPAKUzZkPtWA7htyx2GSqx9EZY/W9s7wMwdNVvxrv4MRboOxl7m9mVsAJVv7/qOJBWBg0iWlbjE4aZ7MQbA6n4a/5mWlM38nuEOQgigBoH8+dR3chQsB3wZu5AYtx6byrxmG9CywMeUxC/tl7fWZJEO0XlNTJTvIDVscM9QpQjMNiaJ6GrfZh3kJCn5tsSqjyPruUPqDC+VPn1chLOKu6PKlWSbVaEyWsg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c586b18d-7883-4b05-2523-08d88c6db146
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:30:02.9831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmXVB6q1JJ3TYrbOHBhh5qxqWDokTG4jNXKr07wo7i5ZbXHMTh7svEj8qgxaUbtL5z2hLgVx6coHTFU9uLrJMQ==
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch enables DPU and it's prefetch engines for
the i.MX8qxp MEK platform.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 46437d3..1ddfa5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -30,6 +30,70 @@
 	};
 };
 
+&dc0_prg1 {
+	status = "okay";
+};
+
+&dc0_prg2 {
+	status = "okay";
+};
+
+&dc0_prg3 {
+	status = "okay";
+};
+
+&dc0_prg4 {
+	status = "okay";
+};
+
+&dc0_prg5 {
+	status = "okay";
+};
+
+&dc0_prg6 {
+	status = "okay";
+};
+
+&dc0_prg7 {
+	status = "okay";
+};
+
+&dc0_prg8 {
+	status = "okay";
+};
+
+&dc0_prg9 {
+	status = "okay";
+};
+
+&dc0_dpr1_channel1 {
+	status = "okay";
+};
+
+&dc0_dpr1_channel2 {
+	status = "okay";
+};
+
+&dc0_dpr1_channel3 {
+	status = "okay";
+};
+
+&dc0_dpr2_channel1 {
+	status = "okay";
+};
+
+&dc0_dpr2_channel2 {
+	status = "okay";
+};
+
+&dc0_dpr2_channel3 {
+	status = "okay";
+};
+
+&dpu1 {
+	status = "okay";
+};
+
 &adma_dsp {
 	status = "okay";
 };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
