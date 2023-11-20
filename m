Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851557F0E99
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 10:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C0010E32F;
	Mon, 20 Nov 2023 09:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2112.outbound.protection.outlook.com [40.107.244.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0810E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 09:11:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etJPNAzLDnCyvjPPMvjdBqMthR6OABGrRUevoHo61VB/Pu1oDXwfAknnfrPeay2I7A5dHSMOW/GYOepSjGDmkgXSZ7yqjtphTKCaUVd3j2jyXGqCave0p8n0dPKokJo/7SDffj2bapZ0SMFrEDIOWFeuzVXjTda95BoPUsxP8sc0m8VgiN060xaMktunBNFzsvFzK1hzH6FcFk4PihsSDpKmJ0pUvjs87TZBJwe7IDWv6tLaJmFeZ26A6ncrWTgeo1NTB4Tcjy8zqVJhEX/gukkVuNG430tXlremDlpZ1iN+caTsR9aafPNdJjd5UI3t6PE70amYq0yh974JBhr+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmxVzJ43Vrb7aBkt7LgeBNSVW0wavN4/WdgBKywC5Vo=;
 b=JNxunUC4q7WLPAPs/z8pzFbQA0nAJRzw3x4eAr6bS1ObgfG0MTlPrKmJn0om0cLRPmpKbGRhxNHpxevn9kdWaZ3i3vzEFoIXDYPY6RJESIentnhTwwy+sFUfbzUEZSZFy2ymzMaZhV3B1K0krMgDu0xTg3wpvPFsoYSQ9FSoPeHHozThyeyyB+ENcHnkiTigJEA9bEpBXiJ0JZyN/oEqH7u5vwWbkPwCWmswYscnyvzyy0pRGVsVD5nFxZ6ceLZj3soTPGtF0/eHz3pLn6Ag4hgeBfipM+HGgrTSG4cM0eHFxAMfxrvOWtSTJny1O1U8SI+ktOLkr/55cZ692k8VVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmxVzJ43Vrb7aBkt7LgeBNSVW0wavN4/WdgBKywC5Vo=;
 b=EzQDhbcVqjuTFDdforS6rzn2Rxj528FceUIv+KoIjWSBH03DILEi+j2b3pE/4kbM5B93m9RuLgxa4G+/ZiVlXXA60FiX67bkyjuvLP4kHSHy3HDWlvPn78NS65PBH8lNfHP8gJ2Azo1djainQH8S7E6mt6tui+zEh3iaLXdBSmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6706.namprd04.prod.outlook.com (2603:10b6:a03:22e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 09:11:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6552:26cd:6ff4:9b3d]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6552:26cd:6ff4:9b3d%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 09:11:34 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms
Date: Mon, 20 Nov 2023 17:10:37 +0800
Message-Id: <20231120091038.284825-2-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120091038.284825-1-xji@analogixsemi.com>
References: <20231120091038.284825-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|BY5PR04MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 30934ae5-1d54-4b86-ab8c-08dbe9a8b156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nrXU3k4gA/eOyfTJNqW2JmBsg60wrnFecc2Jw6MdzNsRmPyL4eXEDfOyBa3rdCyejXN9f0FsfPCoE0FtEpXSvJdq108ZafC6qpwJJaQbdmdGkfM2mo1VIVJ2Ogc8n1v14tgzUL1y2X86C1tWowT+agYiwYYFrVK6ELb8VPQo1HuKAp9QHT0dEOwIcYIO6k3SQq3kCcPboqgG2bvQYc6HaPY4uxJWlwhbEPhyHFxXD4LT0Ht5G2NRiBfEObDYoB/2aUEjnzif+sp4q7CjDkzlzAwpKeOXsgyAKtVbG8t6uuz3x5FQPNVK85Y9sIXXeWuqFDDRiMBVdsY+TqpHyaQGFEkYuOc3cx1utXXtgdtXM/MbTKz1QVYN+Ss4ntYxjNIJVj3OuRdCPgSUM9wuW5eJhJYwa4u65u9cZJdkr8iKUyGwIkdyubQjaL/QJ3L7KwMie2sdmrQFhm9ZQLDQBYZu4dGdPp6PpTpTa8MOkE+WC82W9TsiFkFqlnLg7daoSiiuXcGDGEIq6WIpyXgynwfjZh1rsrdBrZPPv+jwMbIBA0xWbwPG5t/cKbSRcDwD1hT/L/J5YPqEeN4RBDm670A8DJC74gtFarP0mDVaCptjHy2LSp7dYZ0EOYburFclu0ip8MDgXNigudRsqfEtKKWJuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39830400003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(36756003)(86362001)(5660300002)(7416002)(2906002)(38350700005)(921008)(83380400001)(6512007)(6506007)(478600001)(52116002)(6486002)(26005)(1076003)(2616005)(38100700002)(8676002)(4326008)(8936002)(66476007)(66556008)(316002)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Qd0eIJhEPalSrrxBe/7YivOTQ/oHy7pBnaFX/reUYZIbDBx9dHexeNhqaOd?=
 =?us-ascii?Q?WcFVjN2/EmHt+kpUE54LRZfIuciizjX8HUPcUjPZG0ST6Gc5TZ4xFn7CNi4k?=
 =?us-ascii?Q?WesQ1xRR3+EGLQ6B0nCAcBiAjl6+AL32ZB0CtIR/Kz8+P66Q2suYS3Z2e7iu?=
 =?us-ascii?Q?3k+31yB0yBB8Ze75xH53mIGZH0KwddFMXVl1wHfJFhDwqtobVsiJ7FlteKXY?=
 =?us-ascii?Q?7Ys1kVEnWLtNJlw+PxpZhl3wxc5++/DIsUo1GaXpTQM3zsUT3PblsrdHLzCE?=
 =?us-ascii?Q?Dj9l92ABosLdVdn2YnbRGvJIh/M+lm/6A3GWPOKpuxeQJPKCa4BIfv+9/eyp?=
 =?us-ascii?Q?gt3HGgGvcaq9bdynlq6IRGKdaBWpoJn0X5UOFtwOGPIIJp+Rq5nmag1gew/f?=
 =?us-ascii?Q?y+r07W0NkDm9VAG7EdBnq9RBzbRshpFqyf7sRnwJjtA6T+c5+eShBR+WfIps?=
 =?us-ascii?Q?a3hHiJYquqpYp3qIo9rA3/q5AnGxhnUPv/TAlqpHbvNIMpUAuzPcSxadyCEP?=
 =?us-ascii?Q?9XeOmbIW8yMlMtuD8tJGqRsoWyAdUPy6f5h3PKYAZR4v0KueR1nOpOGVG2TY?=
 =?us-ascii?Q?5HE69aa3khVJLl9j7nnpNwlph5Q+Zcr74XL5/PGkZMPHUdceN99ci64fRpUJ?=
 =?us-ascii?Q?/XWQAd4u1TyL9BnQXuOpy3EWiXvWdCUNtQfLsWYWlrD/6Asx26H3SlGf0uYg?=
 =?us-ascii?Q?cdMC1eBukbUKuVSklQDpsZVVDQMKVOFzn4m0gm6TU92Yrgw/0o+Gmyko9Qra?=
 =?us-ascii?Q?ySaa0aA9s5CONAfbaFZ4Fev3eCm7x3Pwj6KsEYY8OJnJeBx1y/6OF4E5/CfN?=
 =?us-ascii?Q?KuIUZt4YRf//qhpyZ7AC+4cLz6v2GL66JiiidVrgLlvN/tuqLhbIecOnZsoM?=
 =?us-ascii?Q?m/9UQMFkyvwv+OzyqfaClePF8m4JIkAROvPlBH68QsTOvsIocvhdOFnLu0ku?=
 =?us-ascii?Q?DIOsNBmDmI3NfwfifRPUNA73Fnf5XxIwmx10BB0hbptLr3s6jdMLyyj04jqV?=
 =?us-ascii?Q?KxjHobPS4kGf9ukLsgPpdwLwYiq1hOveuFtwxNaZVyw82euFAzlAnG4zxyqr?=
 =?us-ascii?Q?uT5lVHbeZRKXtvAMIJDnywV5gErROiIdKNXzI/MRNvTL44h+QslGzSirXGl/?=
 =?us-ascii?Q?VxlsOn86x6UNiRKyFS70HcvXyk7oqQK6FMq/CxZVutQrHKKGw/X/ev676CrX?=
 =?us-ascii?Q?j5IfU8leBQcfKFFVN6LsMDKgQckMmsWnykR41id0sXG4/q3Ak+RUpz+Ev3kr?=
 =?us-ascii?Q?vtGhOHZV0tn+6OioNqF7i2FfVWHnxpb/O4KdkrjLCIVTUXYMhVAmORpedQyG?=
 =?us-ascii?Q?+VH4OA4SETlfbEepnSJXnfahFYKplWRE3T3JZ/YJN5V6YJQiGRrsbHtg6+R+?=
 =?us-ascii?Q?syAvF4MN8DURmLZgXWfTVucw9ReBTiiPJpLD8YUoAVvADTv2tjoFGVRAqzTk?=
 =?us-ascii?Q?bDXSn+CTpcYUcGswdS1R96w3a7xJuWYrqx1tcbvtbWVTyueIBwPiZ51qWlWR?=
 =?us-ascii?Q?T4MI/cqQWSYv2lxYy+Qn52TlY7V1q7M6Q8OMmHUIZCntMiIRFNK+QXcXlArP?=
 =?us-ascii?Q?sZ1w+LJO2HbsQXalGE6iUyAXk9PQWufxwXj7++WK?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30934ae5-1d54-4b86-ab8c-08dbe9a8b156
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:11:34.3899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +h0Eu7ERrlsoytwHHvmeq6Bllqsxex5dLp51/7xJUG4t8FykQ9o2o1oBJPj0w8R131w8uEgY5TmeNqG7klRz+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6706
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Polling firmware HPD GPIO status, set HPD irq detect window to 2ms
after firmware HPD GPIO initial done

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 51 ++++++++++++++++-------
 drivers/gpu/drm/bridge/analogix/anx7625.h |  4 ++
 2 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 51abe42c639e..ef31033439bc 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1298,10 +1298,32 @@ static void anx7625_config(struct anx7625_data *ctx)
 			  XTAL_FRQ_SEL, XTAL_FRQ_27M);
 }
 
+static int anx7625_hpd_timer_config(struct anx7625_data *ctx)
+{
+	int ret;
+
+	/* Set irq detect window to 2ms */
+	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				HPD_DET_TIMER_BIT0_7, HPD_TIME & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HPD_DET_TIMER_BIT8_15,
+				 (HPD_TIME >> 8) & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HPD_DET_TIMER_BIT16_23,
+				 (HPD_TIME >> 16) & 0xFF);
+
+	return ret;
+}
+
+static int anx7625_read_hpd_gpio_config_status(struct anx7625_data *ctx)
+{
+	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, GPIO_CTRL_2);
+}
+
 static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 {
 	struct device *dev = ctx->dev;
-	int ret;
+	int ret, val;
 
 	/* Reset main ocm */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, 0x88, 0x40);
@@ -1315,6 +1337,19 @@ static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature fail.\n");
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "disable PD feature succeeded.\n");
+
+	/*
+	 * Make sure the HPD GPIO already be configured after OCM release before
+	 * setting HPD detect window register. Here we poll the status register
+	 * at maximum 40ms, then config HPD irq detect window register
+	 */
+	readx_poll_timeout(anx7625_read_hpd_gpio_config_status,
+			   ctx, val,
+			   ((val & HPD_SOURCE) || (val < 0)),
+			   2000, 2000 * 20);
+
+	/* Set HPD irq detect window to 2ms */
+	anx7625_hpd_timer_config(ctx);
 }
 
 static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
@@ -1437,20 +1472,6 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 
 static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 {
-	int ret;
-
-	/* Set irq detect window to 2ms */
-	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
-				HPD_DET_TIMER_BIT0_7, HPD_TIME & 0xFF);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
-				 HPD_DET_TIMER_BIT8_15,
-				 (HPD_TIME >> 8) & 0xFF);
-	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
-				 HPD_DET_TIMER_BIT16_23,
-				 (HPD_TIME >> 16) & 0xFF);
-	if (ret < 0)
-		return ret;
-
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
 }
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 5af819611ebc..66ebee7f3d83 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -259,6 +259,10 @@
 #define AP_MIPI_RX_EN BIT(5) /* 1: MIPI RX input in  0: no RX in */
 #define AP_DISABLE_PD BIT(6)
 #define AP_DISABLE_DISPLAY BIT(7)
+
+#define GPIO_CTRL_2   0x49
+#define HPD_SOURCE    BIT(6)
+
 /***************************************************************/
 /* Register definition of device address 0x84 */
 #define  MIPI_PHY_CONTROL_3            0x03
-- 
2.25.1

