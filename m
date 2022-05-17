Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC67529AB1
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C98A10E059;
	Tue, 17 May 2022 07:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2120.outbound.protection.outlook.com [40.107.215.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F9D10E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 07:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfZ9aJ1bn/j2+yxKxRvEdrUErdphMGUtKv1SQ5waYDna8j+gUgxTgTparueVixCUusazN4BOqsS0NMKvHL163/v0JKzjf7AnDPtH5Oifjynmo+pDfBE+TcNNqgUeJM5y4EmWbjVz2KAuONpAP5TeG2DK6QhCoPdeB/NjxRCvMorAhdhch3AD3ITAjfHTj/sgvC88l0d5GEa77JuWPCt0yWg6iTXplYShziLF3LR0+vrHrJyTwHsM+qCOFqT5OXf37VGSeMcN4YRN/PDJf1jQlYfObC/1bdtLZdu5rnYkr3andzSvp31mZDm2j+ok/XmlYo8ldIHf16MynbZwnt/tzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMhtarYNcssJPsuy19+RW2wip1+Wdo/KS9q4Sx8DG6E=;
 b=XyS2N1nOI6LhXLNqGl+LRdprsdH6lFqPmiNP/ChH6BbeLVALKcjTvIULKft5+BcoEXSnt+aqncPSSh5Pq+EMkrcCAFRF081h2Ixs4rgJ0Xk5Ulm4G7yefb98ZD6lwAzBxLSRs21AWMyaJtV8OBudX0BY5ZHqRad+N72eqnEbjYXRT15XzrqbTqKuAvXGoYgXbU+JLUqA76Jnw6Is71Q88UW2xhGI/0c+nWYe9qNCJDz7JMExODWFvuOU8e/4bpYYdi8+56P4q7VaknbWGjWJ3rYk3gBuulMIp1L7bxMXZD6UwuvoBDma2wo6nmQT6ueLikXUk6+GzhMKO2avL/U2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMhtarYNcssJPsuy19+RW2wip1+Wdo/KS9q4Sx8DG6E=;
 b=pH10yY03tdesFEPNRw1jIqIxTDEUIOyPV8PRwe3VrLM8HQWFIMXMLdQRqDrsFDvjG5TYSdMCv+/kiF7ZVCv0uVMTrI5giELV6M5DNErrl7ArLHNwR1Wlq7fBqwX4oKeAkqjgsQQ5tudoklsf1GA9mnB4d8FGStI3lPmamhdjjxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by SI2PR06MB4204.apcprd06.prod.outlook.com (2603:1096:4:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 07:23:22 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 07:23:22 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org (open list:MXSFB DRM DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm: mxsfb: remove unnecessary NULL check before
 clk_disable_unprepare()
Date: Tue, 17 May 2022 15:22:58 +0800
Message-Id: <20220517072259.123870-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::14) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 429af4fe-1001-4d97-6425-08da37d61f8a
X-MS-TrafficTypeDiagnostic: SI2PR06MB4204:EE_
X-Microsoft-Antispam-PRVS: <SI2PR06MB4204FE52FC42026E56315798C7CE9@SI2PR06MB4204.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3cadlp77BDr9MZgr/sDIHiaK6nl5XB8J08VUaHx09BQ4i99X2b5OPeD7hxf2sX+fDbU/4hY4rhyUtW+iG1R0gijK0DhcUq4eP+Yw3650bZLnU+KyWtB6o8yeC1oPxgHs0l2w6EJ3Qr3XUaGbGBvHz6DjZSiSVuPCo3SUf8kWBTM/ULm01VrU6FYjK50SQDRssTmyEbHRMzePZbIXHYIitw+JrodTHxiSo6Qgc+cISVlqZc84fPp/gEGFUG4yakL/qU1CxjC2zxzhS4koDPLCMdm8MV0ospss/SSwLYHvrS7blcfOVp91IQbn0IwFoH86ZQ5/rGHMvGhdlrRG5bhvixX3U0o7Q02SLHute8V5JEH9fJJDjSZIXIKzqZmhla9WbGSzp3G8DohC4QYUpk4U4gJ7P7npBAk9Xf7tzEBBDZy/Ndd+cm6zpkAFRLZpA9uN5hqONKfFrH5KxiJwLc2EmXeKiILTO/lCSI7/N0L3BZiJo+0RiWnreTLj8PcTovOV0I9upFWtJKCCl+TYYBbKYF59MSgQthKYWvVao4bSJHmMrjOehPz2HBUpYuouCxv6j1goLDzVwTKGrv3bsC/PQGVVI9SopwEoWqU4aWBXog2T/2nv8j5INla+BjGyh+/ZHqvh+yrb+QZiKWNKe2vu3j0F7n7H/S16uns/A0bxUjfQVBDGti8XN/DOoWdcar1doeflZ0b5xuMQ1GlDgBxKO8Zm5hGCWw5Hz9nQ8g5aTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(110136005)(7416002)(1076003)(36756003)(26005)(52116002)(107886003)(66556008)(6512007)(38350700002)(38100700002)(921005)(316002)(508600001)(6486002)(2906002)(86362001)(2616005)(8936002)(6666004)(66476007)(8676002)(83380400001)(6506007)(186003)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?or+KsBjSlkBQs8BwGUSfVEQvd75Xu7D1+SckyTxAuG6JQkYqwEix7IBFpkZz?=
 =?us-ascii?Q?E9BaH6RrqPkbOssX0Z61CUj6gsIJ7wZuvEt/HK5V/RfSLbkoS3Ygw+iNK3Jx?=
 =?us-ascii?Q?kFRRGThtam+Cy43UiI23Osdk91kRSzs1b9rxu5IVk8evjdwkEuVTS6Ja9hQ3?=
 =?us-ascii?Q?zClkmUiWDzM3PtDlkYtEKzAoqadSjpkANYjDfZkGqnUDxEbdBg4zE+Z8IC7n?=
 =?us-ascii?Q?OUdtaeBdS+U3zFUZSVff5tTo4J09r+pQ2ewEs7XoihJsy+yAbATnyZVD1hzy?=
 =?us-ascii?Q?wYtmgRLf+04WNQdlEdzVERhYvwn+p2Du/9mkrZ+vLPfssP/AyZikohirjPiD?=
 =?us-ascii?Q?0iUVpx/bFrfUSJF38txycMUznUkd0U8AgEiqJdLfKhc/WrRPI7XOKjbWIN7m?=
 =?us-ascii?Q?xSy7a/D8yLyFpyXqCpL74BH3WHDIOBTmAq6hcZWxW8Qr0h36SQQh+KvieDaq?=
 =?us-ascii?Q?uY/V8VjDrRiaw4ITwJYxatWHfwvZ7CaLG5sRNUUb1FPIw3zqttYwpZGgrxI5?=
 =?us-ascii?Q?vXabUKxhZgnNVqtkjsssFPxVYQ2eT/ZEE7FmU+PFqE0jz9PS5mSnWrYcgGc2?=
 =?us-ascii?Q?ibQNFB3pamc6s0hZxbAYBtUY+G+MPRkmkMmH3kDmp9ZvOHXifgcTudN10qW8?=
 =?us-ascii?Q?XeEwOLFRhKDcm28NRAneiEl24SxfCg6OKrVU0McVg75vs/yi+0C2sytYr2u3?=
 =?us-ascii?Q?ecAN+YOVef9rMPCpVLFFyApJzwir8BZipQmpjm2SjxWiYEflNuAKS13U43mv?=
 =?us-ascii?Q?qVym8YGTpdYApxrgzpG9uq8IvUjm7p3G8wUy4E69p9z+WSa7GnQ96Jxq/4SQ?=
 =?us-ascii?Q?TfPRqxc2nAOwMqz1FkjxdaVwI1aJP71lrlwTdnZvn4QLzC3W7Hsz2RHvwzrg?=
 =?us-ascii?Q?6k9zWAhuF8RQADJN8jKux4c+UwghcD3HxeGNvYUScvKRS4Pn6vIUbRiH6Npf?=
 =?us-ascii?Q?LYLftuoiO5TgXNPt8XPacWvCLvbG6jFJ25IO1jAm6rDHMw0efppwTx3/l+f3?=
 =?us-ascii?Q?p09+u6ow8Fs0FkLL1JgA3aGviNKPum/S/O6wiQL4HMTc0xYSXgX3O8hP4LBn?=
 =?us-ascii?Q?f9IfOurI+Sb7+lxi5TQ4CKcHX9JtLBMqiLQIC4fuLhv9kKBXgBevJG7dmS4J?=
 =?us-ascii?Q?rVMDxyGFP0IMBbzFgJ7hXaNIKKb2o5IaIUdsNheVAFLLunZdr9bATPML60HK?=
 =?us-ascii?Q?Yi/Gxu5FO4bwnQE+fAMTSMKgeqfbcTz6q1hf+u9ThmfPUxP4fhGDyTvMqEjh?=
 =?us-ascii?Q?VIPGUMdhH1ZoGKWYc2BTCsC/BQgz905J5aSNSjsyMQ/LpODYEC9wDGMbXdDS?=
 =?us-ascii?Q?vlC724XvsdG1cm2dDG3fNBxoFryYGpFh1Yd8+dduIaSxhF91ybnfCy0lK4CP?=
 =?us-ascii?Q?5SaapVWnxLrnehvQ6ktq+l0O3ORdyU7t8jZ//tMRaiKh5C3QrBCUydWqGECU?=
 =?us-ascii?Q?/mDgjEF49N+IUV8guQpK44oTCOzRmrtL7jsKDhQT2jeTNiqHpayfjoZU/eut?=
 =?us-ascii?Q?iAuz4HvmjqUoVxcNHcD2K6WDxxdRuFQyBcQRbPpwXIH1oVnzClrd9EZFMq4l?=
 =?us-ascii?Q?MU5kNAZeOzMzkyMmiXv2oeYS9g2nT9IcPeXUZLRihJqtFN7GqPDA6A7fyvQg?=
 =?us-ascii?Q?iS3KFO0gzOVpjEQ83mAXi0BYFC1OKA4DUTYlsh0Wwim+2xR3kt143xUo4CSK?=
 =?us-ascii?Q?vyxGbah+SdX68L0AdLN91W17sCx5w1fW1QGw28dYWeyZZtkoXDv7y2eDQ2qn?=
 =?us-ascii?Q?NdBFxNAwcw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429af4fe-1001-4d97-6425-08da37d61f8a
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 07:23:22.3663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDkplKQZ7frILnn/QVRlqdVaXasb+JZvuUwXDDl2wA+LGgcO/iaIMKijwaugt30udgynrT15nS1N1PKwI7avAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4204
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
Cc: zhengkui_guo@outlook.com, Guo Zhengkui <guozhengkui@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NULL check has been done in clk_disable_unprepare() by IS_ERR_OR_NULL().
So remove NULL check before it.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 55aad92e08ba..90f8d6bc0d21 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -84,8 +84,7 @@ void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
 
 void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb)
 {
-	if (mxsfb->clk_axi)
-		clk_disable_unprepare(mxsfb->clk_axi);
+	clk_disable_unprepare(mxsfb->clk_axi);
 }
 
 static struct drm_framebuffer *
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index f021ab2c4520..ccd21ece21bf 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -221,8 +221,7 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
 
 	clk_disable_unprepare(mxsfb->clk);
-	if (mxsfb->clk_disp_axi)
-		clk_disable_unprepare(mxsfb->clk_disp_axi);
+	clk_disable_unprepare(mxsfb->clk_disp_axi);
 }
 
 /*
-- 
2.20.1

