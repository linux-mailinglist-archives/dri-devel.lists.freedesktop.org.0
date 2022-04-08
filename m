Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5FC4F930C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EDC10EFB1;
	Fri,  8 Apr 2022 10:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789F010F14F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za00OkBNvD0z6i/50iubox2CxGlZrG8a6zPCpFLp/BR87OdfC9Oyw3p7NZ2Udn/HmkhrNU+JbVE8keLYnFdUqlIqdvPIVn22OxfRVQ/nEiW2nrsGHya/tX2Q1Xvi4TdjpQ0oTT47QLKViawWBm0D+voG6UaoYaUdCWPdbq2Yt7PYMrU7WIwJyLURUynLfj65HGVJd3Mul4qaixZvH9dVwH8oJ85mV4XDroH62mSZTdx03SPHvK3HWWN8GocY3ve6laT/ow1d+RRPLUwtDry4vUMQtWfAWjTraGk5g6y0X2W50qLdbg+tRn7cW0XwRBiltgkz0XzwDWGZNpVTFLwxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ESsHq+HwjbkpRagROK6lpXlHO1JmzQs8/tplC/pzhc=;
 b=RZRsELc1pX6lYi9y/EI2PjvZ+0+dENqkSnXxpzjtfgZflcqWI2mF6mZi5494Mnhu4OL6TluwFRSSWq2SWvdZ1KQMSjPtV093j4qhIAv2rPl+tRZOsR/b0m7PqWlTrTslucLbP58VinrY9+OTdN1ypqJPCo3llEn/ZBA6qo3sZ19BDpoew7oLwd4nAjafeK/c5YVPOR9U79QKa0sMg2fqx0JBIviTodIylwIKOxXeG8E6i79VxqdHe07r7TM8f3a1++mLhIJzekhlO3Qnyt3yMRXcHT+/BEVB+oJExzV6ylwJXp30QC62uW6vJcvJWkLOq0KmHgSBNExo/MBWx7e6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ESsHq+HwjbkpRagROK6lpXlHO1JmzQs8/tplC/pzhc=;
 b=MJDbTaAbf6yhWPXNERqVARE60UGDeHoNhOAdRbZLIly+GYYe1/LqUPlkAAefA6Hfvk784bBaMs7v6bpe/RHuBTWatjV34FX9skD9wiz9yAOObaAH3htF2y/lNiqnoLh5WJagVsZ1y+bBZ/7uKIJeSo2dplzleS75ZSywQr5ZKA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:33:10 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 10:33:10 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 2/5] drm: bridge: dw_hdmi: default enable workaround to
 clear the overflow
Date: Fri,  8 Apr 2022 18:32:25 +0800
Message-Id: <39592fee39610c544058e6b8f9af4b4ea8dc4cdc.1649412256.git.Sandor.yu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: da5d15d0-f462-4d42-0bce-08da194b2d48
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3405CBF430B4F805580E62C4F4E99@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkhEhFZ+xS6J09gYyLOwX8iR1J3TTq/GMtjOD6RgXdR/46g7NCUx7D3JYEkcOILe6y8+IihEY5u4ex2WcdeV3cGGlpO8rEg3JDfSl7vcOHo8Ft3CzPMtQS9BNtNaXr3V4mxFjpJt1aHQCpu4DDs0+OnHIQkX7ZgiU/Uhn9V9y7UhgbnRYN9DJKZysYlTWJsEKf32benXv0xA1BdOWOg4qrmWlyT/coSszHEaccSWQg7RmZGNl3SQzepvZOtdO16COEHbsG6LOSqgLGyZrNWM/pKwroZqfZ4z9lR38owNczDS/0kc//nkL7QQeqDIihilfIxqFEKY2qIw+SAGAxHA01CQ6QnLwle1tAKNPMVW3Ag6AtaCAWDAbWAh9/0CoxURWgQ+f4giHDofGJHrjfmDJAaoMoCV2oa4QRQQIaB8Q/XgGoh4YrpLm8T5MGPymlYMHjKxoy26fEVKDoEwuLSytn58F27YjdJSLdtEpivB4HfCSxTApidpmGu8fhx2Lj2yRuZPlb4lXJn3oTvgYsIr9px3FcLrTTFGY38MZxbOqIfoylQYb0olfoFcn920JPv9VjtLL+b37RRqGFoUWiWZ1ev8xexgG7h1ISj9UVetRE4P/wzfXax5FLSUm4hTFCb6hM9nnxF56/RGXoiSAaJM+A5tsHDHfbT83iytW8XfetQVXN8RR1NfhdsiW+Db6bsQE0h5DdoZ1ax1Y/ver3+0uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(52116002)(66476007)(6666004)(83380400001)(8676002)(86362001)(508600001)(66556008)(66946007)(38350700002)(4326008)(7416002)(2906002)(186003)(316002)(5660300002)(6506007)(26005)(36756003)(6512007)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BIaF6a89edY6OXfSl4qKLqEqKOTW2DD+zTiKbJX9CDiW69y96wYPc9lVE7EI?=
 =?us-ascii?Q?8t1yoV0ih0SmPFyLs6dSYtW9bzud1Y+qDGxd21ds2kofeCLNjJkfiSni3xK4?=
 =?us-ascii?Q?VAt+9k6D9AbEAyHOuc2ia5E7hYSsgQW/m4lz2GMWaFf88QdzOGGCg32RHapp?=
 =?us-ascii?Q?Graq8RU5UkHtCudn4xowhMfsL01964chyDiqRTCUyK4pOaHUod9lB2nKbYYk?=
 =?us-ascii?Q?izWCLWMuSSbWhBHe6HwAbTK6cHZ4GPjz+oueyYIWzRLgZYjFBtVaq+F2xIA7?=
 =?us-ascii?Q?nxUlTTGo/zyMXWNTaqYTWHMtXXyyqo1wulUxN3Tu6xfuYvjCTyGR+RJcUeTt?=
 =?us-ascii?Q?+DtEVz8+ubw2hAXS8sciajr53CYyshoPzXlsHiej/TdGWR2f4CzyFP2sZn14?=
 =?us-ascii?Q?eJC+mxqfZGFpMSBBwE5yoq9K+OY0Tl5+c/Bb9nxH/ngcRTh7f10oCtqb0A3a?=
 =?us-ascii?Q?iBRcSNoQHrfo/RcanWVwO78GRrBsxlyhwH+xK0HlfPE6zqalaJ+D2OjzXEV3?=
 =?us-ascii?Q?x4d6rAj07/nbg2AiF+CUvL+l7pf0kBl28abzJnWcWNtZl7ht0Vh8LUF/6wRX?=
 =?us-ascii?Q?CEdmDhv6zu6Xt55pYpPsO6vcrtPrSBJLQazbi4hJlPMptX5BcCKRfN4tMjeC?=
 =?us-ascii?Q?wjlBk8q2ED80jMetkNmyfwS+BC+jHNT2iAqcNjuqZHfKFZ3dJWm7CnrANqmO?=
 =?us-ascii?Q?MBASjCBI0ur0apzzzMT1H0T/yJqMSFx0na4u+umuIgahwhQL/dgfw2++YiDv?=
 =?us-ascii?Q?dftpGcMxneL4nCIeQJ8YYhObx8dKlqVvSX+WeyM0q08hx7OcX2dYZrsbM/Xc?=
 =?us-ascii?Q?Af8iERG/3EAU9WAHs//okPPnUGVw/P4oLxEhx4wjGFyQ10H/VKXmfc1PlfLy?=
 =?us-ascii?Q?rrZLaKsU0MAU3KBHCcvm7WWY54yKPSd6xNayMYbmQNjTkJqZdMC7qlOyAZZ0?=
 =?us-ascii?Q?mN9V6x7766LXPOP0Cd8mifMeh8aCZ2wuxtstMzYgYV8fuiahdq0vgPJRVZS9?=
 =?us-ascii?Q?h+9eEYFthr9z1UC7NguOJdCMLK7xm+HIR+feq+pxgWliSA8vTd1o+t/DqkMi?=
 =?us-ascii?Q?y8aas7HjOnj3RuyFI5RbQaMXeoVGh4Z9w5bd+mf2KgNqcgFoJzVQl/3uk+RQ?=
 =?us-ascii?Q?6gLLtcMCL0MdYMcjrTXFqnDBxqPQ96yIOrLJjqhUDt+Qxvk4xAQkbwDPKxsN?=
 =?us-ascii?Q?LzkFTYbQL6bYfjp8zOSUWXLq0qMKo15x8X5+eL/2xkzYRX8yQ58HNN1CReD8?=
 =?us-ascii?Q?8NjPNqEKyjPmgk+Edm9Q+oXp4ERaQRmMkKEIDanmUnFrzVbftCmb2X+BwKTc?=
 =?us-ascii?Q?ntdlb3q/PxUF9FRxRCI3sDjixe4BUFMy/Yznr2MykPOxO7tZ8xAj4eLjxhPo?=
 =?us-ascii?Q?eBaERZhQx1TgfKkmaUU5ZyrwzlWcsYaiIzGlRhXI3ZnuD5iQaHcpQC9phfOD?=
 =?us-ascii?Q?odC8+wFQba0YhCR/LMw+p1IDm/XH4EFBRLC2GhSFlR7al1AIl7KlH+x36jDm?=
 =?us-ascii?Q?TwakUJ02cp/GMV1fz5ckSewvznP25NgvPQTnG2+IZSZxR/82r91ZbITYai73?=
 =?us-ascii?Q?L+9w/FEHaMuOGW2RfZZA/Mta9KvxyYmH0GosbboqDHy3nfW1LlP2ZrJpDg7X?=
 =?us-ascii?Q?Rbw5c6LM6QFaMqJjCAOAeZrBuW4fPuVBxDFIcCLHQnMAefRFCPj6cQNPITdm?=
 =?us-ascii?Q?mBQTlFT5TrE8Pu35UedHYAkgIp3r3KDBOFU2Y+4buLXNX3XwVaLhIP9trWrp?=
 =?us-ascii?Q?M44/0hpdyQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5d15d0-f462-4d42-0bce-08da194b2d48
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:33:10.1784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHglaFb8Yu/+uzmh1p01YFcNY9GFdUhs8Cfq8Cc/HC2YaBAyGkomZuFVKCk8ftK5GfNB6yj8ztXlmJWjHs5T6w==
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

i.MX8MPlus (v2.13a) has verified need the workaround to clear the
overflow with one iteration.
Only i.MX6Q(v1.30a) need the workaround with 4 iterations,
the others versions later than v1.3a have been identified as needing
the workaround with a single iteration.

Default enable the workaround with one iteration for all versions
later than v1.30a.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 4befc104d220..02d8f7e08814 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2086,30 +2086,21 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
 	 * then write one of the FC registers several times.
 	 *
 	 * The number of iterations matters and depends on the HDMI TX revision
-	 * (and possibly on the platform). So far i.MX6Q (v1.30a), i.MX6DL
-	 * (v1.31a) and multiple Allwinner SoCs (v1.32a) have been identified
-	 * as needing the workaround, with 4 iterations for v1.30a and 1
-	 * iteration for others.
-	 * The Amlogic Meson GX SoCs (v2.01a) have been identified as needing
-	 * the workaround with a single iteration.
-	 * The Rockchip RK3288 SoC (v2.00a) and RK3328/RK3399 SoCs (v2.11a) have
-	 * been identified as needing the workaround with a single iteration.
+	 * (and possibly on the platform).
+	 * 4 iterations for i.MX6Q(v1.30a) and 1 iteration for others.
+	 * i.MX6DL (v1.31a), Allwinner SoCs (v1.32a), Rockchip RK3288 SoC (v2.00a),
+	 * Amlogic Meson GX SoCs (v2.01a), RK3328/RK3399 SoCs (v2.11a)
+	 * and i.MX8MPlus (v2.13a) have been identified as needing the workaround
+	 * with a single iteration.
 	 */
 
 	switch (hdmi->version) {
 	case 0x130a:
 		count = 4;
 		break;
-	case 0x131a:
-	case 0x132a:
-	case 0x200a:
-	case 0x201a:
-	case 0x211a:
-	case 0x212a:
+	default:
 		count = 1;
 		break;
-	default:
-		return;
 	}
 
 	/* TMDS software reset */
-- 
2.25.1

