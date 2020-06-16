Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77621FC73D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F0E6EA95;
	Wed, 17 Jun 2020 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40072.outbound.protection.outlook.com [40.107.4.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EAC6E880
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 09:16:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxNqqG+DO+qGXnO2VAcLPa0BVw9CzKdT94H6GIxioqXMZRSdaJyFszDKqcBQ80aZyHPb19gAcJ/AwOU9lppK7c2nSxHwcfnkTM5BWD+m6a9w3qq6nsUAhu3hoBO15xHdAn5EpIel/wJSmAOcZ1e39fgGWsShnKP78MmZgcMEUGvRaFTUpuEkpuBc0u8euPuhwDa9cLCHQgxmcmsXMB5AaIY6MDUNm3RBS4PzXqh5Z6Ev6Uo7YVluGr7mPXIUcqo0EADkMcyOTy1AVBDPrQ7k8KDMHeTUaR4HQ+BqlbN747lve5mTTKz6bC4n3+P4lfFiQ44LtyfdQBPZKuTsL6OcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1azelHSlVD3Z+Zu/xQhNFOzbEexSql1XpnjQkQA/7xw=;
 b=gST6kX5fPnLQglEHRSIaR6XOzgzibCuyhQAnCqw9BDv9x5+z99u28+jfLzAOqtGttSmmTPWaheenbMBI+TcRyE+0aKQHopGmLYNdWtf8qdr3z7M8hM0cNyO1n+Uu9XNLWuJf+6h2QPE0/CVJyKr0eCTfQkO9Jc0qwQYLlKqmCWCWs9gT8xhqCBJS0F+7aI6seAecsfGlcZGcqDKjzpxDm9UvzUnJZ9f3gpqw4bCtDUaqgL4H4IT+H7cXfsSPvAwcXzUI6RsBao+VS9CQvP9IVUUtWsJ4PcXzt90N3dRNA9jjFRRPzfHUSqd8hEUkBA6LUxscIe3tA6yBsgp1Cr+NcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1azelHSlVD3Z+Zu/xQhNFOzbEexSql1XpnjQkQA/7xw=;
 b=KCu36JiK+3n1ZTpruZRd01YwD1dP+lMw8HvVje3kF2Y00ea9AwFW7vSqrnaqh5pn9gBdcUvo8zt0uYipOglehgHCKMPFg5LcJsSCDUu/ZRxFc4REg+fVAqBglKQYsuLkOqay0GxuBGC/jp/oCRBAt5ZACzWdlISQflMm7tD15eg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5087.eurprd04.prod.outlook.com (2603:10a6:803:5d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Tue, 16 Jun
 2020 09:16:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 09:16:08 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: dw-hdmi: Don't cleanup i2c adapter and ddc
 ptr in __dw_hdmi_probe() bailout path
Date: Tue, 16 Jun 2020 17:04:51 +0800
Message-Id: <1592298292-17634-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3088.19 via Frontend Transport; Tue, 16 Jun 2020 09:16:04 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b95c7cfb-4a07-4913-5cb9-08d811d5e77e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB508763AA6330F1D3E0B04288989D0@VI1PR04MB5087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/vABLurBbxGTPEfT/kWIgFeLomEalSB6Fa/LO2Y5di8hcTZi3LqE39QT7Jtali1HFtgjLmpefaXl1IMy0z6Efs/rHVNf1pfyui0AL9fKg+C5vl98EWABYAZSsqXyW6T1Yv6f15iSnE/Y/qJv9xwpi0dUIRwFKgm/GuKi+b0xPoBmW+5FfVIFNgrbetvjYzu0kT/iHeuDd+FCWk8U3D9eug1sEEKFh4rTwH4lOmBAlBqY70xVPAUw9KhH9mOl2apaEGxKVZ/j93vqGorMU1hSYbtMAR1reg69WF0/3CftP5dSXe9FpHiBWeIxa1kH2r3gOdYwj8mrN+up+vW/aOHQH/G7OgWOAuD/LVXPnIHAmjciotO4vE8ueeAedBhGBQU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(66476007)(6506007)(26005)(6486002)(2906002)(8676002)(7416002)(8936002)(6666004)(66946007)(316002)(66556008)(186003)(2616005)(52116002)(69590400007)(4326008)(83380400001)(36756003)(478600001)(6512007)(6916009)(16526019)(5660300002)(956004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: HMT9uTna61wVLV4SQd0MNCE/RPwq1aGB+/18124pe6XK4UgakKo4v9W1orXFNHHvgLxGfJB+Z0c3dbyX+fljDwHsyTuCV5MR/nVBdCKLmK9GwYF3FNKmXfOnribf9hUzAynOi9eJawZt8hkr42rRJA3pXiLRAPo27vEQ92eigs666TrTQQKRxyy3E5JvIc/lYWhGHSX0wlSjSc+4uzfMrqtG4gkUGXdKTz5P4K5vzA7ineUvziXtWMNUuVlBuaZtdowJfgC+ti9lMO1wWZovqLMYToyg2kuSrfeaWQFQsrgyaMqJM7Vk6egeYjDiGlSpI2YcPKNWW7oHZrgNICGSk/lB5EgOcva4lppSaKq2U5eTHKzIjnpAkLTFInGhajRXuRrJpoBpRSu1XMazc72EBN1w9ORJ5yXiJTYHrd4uzXFvj89E8om2xmVW8jum93bv7eyQPRjsP9zyMVlvySBzGyQaqgSqZKXflXxzNLi8Rmg=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95c7cfb-4a07-4913-5cb9-08d811d5e77e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 09:16:08.5018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rf4NouUAXtJtvBln2vqj5V5BxBwpt+pPJ5tampM3Dnm8OQIz9Nvv3YgDZJLjSnETFVfnVXRKvuVopRVr+DJ/zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5087
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: joabreu@synopsys.com, jernej.skrabec@siol.net, darekm@google.com,
 jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 architt@codeaurora.org, a.hajda@samsung.com, boris.brezillon@collabora.com,
 Laurent.pinchart@ideasonboard.com, linux-imx@nxp.com, cychiang@chromium.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's unnecessary to cleanup the i2c adapter and the ddc pointer in
the bailout path of  __dw_hdmi_probe(), since the adapter is not
added and the ddc pointer is not set.

Fixes: a23d6265f033 (drm: bridge: dw-hdmi: Extract PHY interrupt setup to a function)
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Dariusz Marcinkiewicz <darekm@google.com>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: dri-devel@lists.freedesktop.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 30681398c..da84a91 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3358,11 +3358,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	return hdmi;
 
 err_iahb:
-	if (hdmi->i2c) {
-		i2c_del_adapter(&hdmi->i2c->adap);
-		hdmi->ddc = NULL;
-	}
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
