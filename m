Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABFB4E3A05
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 09:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A18110E530;
	Tue, 22 Mar 2022 08:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2139.outbound.protection.outlook.com [40.107.220.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3240B10E530
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 08:02:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewUGWayJ5RLkZILeLyBRiD9iyJmshOxEqNBdEj61YoRX49LjtOqhzSXe7e9QlRNammQ01Y9e8Wr1m1KISSgm/VpIyhQ4feKxTTcuqU90wjQVqCvBmBd4rDMPGVuVJHeu2GlXQ8Q2lUZDM6y97wsijRMCY3ioDiYhg7a5AnQN0udXFQKNdXMi5W7Hs7+RSLbLVd8/6thbdoJ9s8tVUD+KFw2GqalX8Kv2/qL5biLPT6I+Aenc6+hERooJLMAWEfqjHAH96HsQ4Gt6e36KyWGDbQ4dAAX84tQYgp9s6pUgHHTMcCQD8JMJpdA27/5WKXDdS5ofKK1zXCVXvmpGLEJaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2oA1+qp+tRRGIfs5G4Mf54Q58uF3cKWrP/uiYASqz8=;
 b=lmUtwcHX16IWN36yo9fU0Q/ojdrrWTH+0I3dZEr89KHY430XHW9lqcuLbh5TZgV7SpZdXpwrsTVBxDTwbDQw0pJZU+BXxK0iujX4TTLa/B8Y7M8VeRj+kfRrRAcbKFoQN6l2yjyxZ5j8G0gUg/waI+CsBcT33p+IZ5g63SJgrri8/QdJrtFBXPRS3s4PGGpyxDTrBAc/WGJf67ooSDtXVfFkDqMrIBmjtapcxRUOICSpLFgLeNHVIzfmRknjJ2PJoja8VjDafwmFl3h8+mUapIpT9dKtG7qCpxDMpI0qlhs998lYqLTaBOy4ELK2oaXBmZ1GOrg4y47PJat1mjJeuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2oA1+qp+tRRGIfs5G4Mf54Q58uF3cKWrP/uiYASqz8=;
 b=bpzhoNN5dln/cfZvVoHGqNR6PvZh2pyPPtkgflNV8Xqv/UpqUXE25PXolrvlJzovCVt0J8xlQ8vMKXXE3b7gb/gTKpVprv5vIFfuoNe9yFAxjawFRhPcDQ9pl2ALpO4azZENvxD4HVw7KSraBdO9JRKAocIcZOsAOTaUzqs0/9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by MN2PR04MB6351.namprd04.prod.outlook.com (2603:10b6:208:1a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 08:02:37 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.016; Tue, 22 Mar 2022
 08:02:37 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal status
Date: Tue, 22 Mar 2022 16:02:12 +0800
Message-Id: <20220322080213.1487134-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:203:b0::27) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 083ccef6-513a-414b-120a-08da0bda5461
X-MS-TrafficTypeDiagnostic: MN2PR04MB6351:EE_
X-Microsoft-Antispam-PRVS: <MN2PR04MB6351FA3442ED8C24BDCAE945C7179@MN2PR04MB6351.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EDf+702vw2vPxBNE/Fbyi9M69mCreKVRGnMO77Gcfq2nUKEuAR4XMsK10JjvT8IqoP4AQFr6DzsSTofvBxfo57+vbP0qhRhZwcGcF3uCrfYaEE61jBCcWPW3PU7TNvH7ij2DEdt55aimYzfE4Fyf5YKIBYOLsztogAVYn93IXolV38VtIH3aPUpeJOPoF40MdDRDDAGArWwqmbqDzn5QHWNPH40MOehFrcz2rzK5m9VpauGdX1raWzqwl10w9spmW1mIb1a+QEX4neA9IFQ1oz3yKpWcdxxLI7Az2SXAB5WUycWLYsnw6Ue5qTra/d3lA1vCFONJXEirGo/ulYxAwlOWLRMw9S3ETZFxD+Swlt5nMRN4MoUKbwuW7zdyIBqOrAtO7292ckjlNQqdcNaeol9L4VF005qADG0AXlhJcWjyPV4Mj7q+Rta9nE3SkDjcUTwixjrE3eA8puWXeQ3htLNtQ+csWP5DdUWAlZWdCEBaNOnckWjTwVjw3MPTwFhnvzKiU+M+U+yrR7J2DISOEQ/QNMOk2PGbT/yVMYFgGyID0NzlvG0MFKcasFeuLXR9A4LiX8IasQGKt+CjyPQSVigl1d6Cep374kZ3oDlt8XMcguKiMQYutTNDV8F+3PxYi5619iW30S4FCBsQdcLl/dmC6IM17SqSa+MppaROCh9LLUkoHOcsSS6vqfUDmIJxo9eZtLLay6HYLWBZgKH7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(83380400001)(86362001)(6506007)(66946007)(6666004)(110136005)(66476007)(316002)(6486002)(38100700002)(5660300002)(38350700002)(2616005)(7416002)(8936002)(4326008)(2906002)(8676002)(6512007)(55236004)(36756003)(66556008)(52116002)(1076003)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kiKNyGQiLVBS20ua7zWBFY5q8jANew9GFnj+69PpDzJb2QFgsSk2GtaS6Lrs?=
 =?us-ascii?Q?CIXZ/fVz3YsA1tkktf/LfUaLcSU8rv4BnyLgiHaWUcaXhlFG+hL3bCW7BVa7?=
 =?us-ascii?Q?YKjbX9aw7VnaLoRaxyiQpnelDcSK05BWm9l5oZJI2WeGG9Ee3eQ31WqmS6z9?=
 =?us-ascii?Q?M6y4fzdi12plw7vN8qFk00+2l38DNPjW8zDghUF1XxrhpCDtteZmmBkHtjUn?=
 =?us-ascii?Q?WXc8unwhL7WnMqwP0OCHdX813PWb9Na8syL9temTrVrQGqmyik00vaqo3FNl?=
 =?us-ascii?Q?hYsqhlwel6JqQGZ4nmYu02W6cJnMrVQ4Y96a5IgdBwdajcPNHOZJO01ZtKI8?=
 =?us-ascii?Q?5VaGT/HeerCQqfY5YH8PHOv4YYcJbR77DihfzvBIWuD1lYLj1B8n7yyvu8bO?=
 =?us-ascii?Q?QHTiPQ/a07EtqKCjXS3k8uaj5JsI4F4w2J9AVVu+ELye1I0qKHZRoeY+thx7?=
 =?us-ascii?Q?B8pI7q2fcTMADAYkPQdIy5TLuWn7muuFqp0wM/yVs9qj+TxNB1ujiXeeicc8?=
 =?us-ascii?Q?Ljn8QWp014jYGhhvjE7fVVEFCL/VRXxq6ULlY3XoBKJjKCYeZ9xX45PUmYgv?=
 =?us-ascii?Q?y6B6G9C1atClroLqJjeJRG9u6nV10rK7SMiHjtHLLJb/FwK6NV1wH2Qwcgnb?=
 =?us-ascii?Q?N5lamfYp/y7pZMh7Ii06zfpdJ2+fh8JVWAt/e4NACiLjlMMbQ6B+VrVG1SYf?=
 =?us-ascii?Q?TuObtyCLek595wlUdrc3HiFBLuH+JJ24DsOU6MhdVDBy9FbeYnWBLC++q4sc?=
 =?us-ascii?Q?CHoYD3qhAG/wJqIshx/oBu+QjQANdvHS9IdG0rOTCe/qUOxdde9BBZo7A61q?=
 =?us-ascii?Q?VTql9JWfCbv0qp9zTAykBCu7Q+LPaG++PqVgJGNsPttU5lzmvCc85eraaeMz?=
 =?us-ascii?Q?EpYGNY7f4UtZO/hbHoFQ08ZRuNYL4cODuSmwFsBpOrob8kdITiYhQjKWjP50?=
 =?us-ascii?Q?hE6Jyjpi15yrvT8m12wIvjLuiZTBovsqaIX24bjLQ4bXSk2mrFVe7nepfJDR?=
 =?us-ascii?Q?H44Ki2XZnCjUIprQPjKBko4WPhfSQ3xByFoM+b+yW4AreJ0SV2qLM8CULDRw?=
 =?us-ascii?Q?BiXdmDhviaat0POMHCIzK9LXmM3qQi+UYS75fE28bwnuSzb6sjzpjoK0D2kG?=
 =?us-ascii?Q?RX7M+Be/51BaOUYlqxkKjJqTXRxrn2oAPJXF6T2sPu6Fz7Or4MMeXXe9bcQL?=
 =?us-ascii?Q?p+kEHN1+UR4adgRZY1Ws0qXLXioAOq+riYetz1nimOO3djYtSVMNE7pw7BvV?=
 =?us-ascii?Q?co50QCquuUvgn5kCVObV1F/gdDUNO7fOlU8SyInyXZk55gAroElzlTWhLRB7?=
 =?us-ascii?Q?PKjy7ddAbk6wo6U6zxjKMSYaV//KJtm55IJr41GCgLq4+tubo9grKbtYXcMu?=
 =?us-ascii?Q?CkhrApc3ECARI/vsGWbfnPvwR6v9f5A3rnYU84AfYZtCVi+f//zVkTnYdUW1?=
 =?us-ascii?Q?bygU4F3nE5vPnqvvDd5GxTLtbPQARj88?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083ccef6-513a-414b-120a-08da0bda5461
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 08:02:37.5425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vMhnmwUxFwC8jCG12+3mT/K6MwfDsC0tcuDw65bTp+46txYNIhL0sCIQ1LgyHeqlURAznEe31BlSge7oila5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6351
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
Cc: tzungbi@google.com, qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, treapking@chromium.org, pihsun@chromium.org,
 hsinyi@chromium.org, bliang@analogixsemi.com, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As downstream sink was set into standby mode while bridge disabled,
this patch used for setting downstream sink into normal status
while enable bridge.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
Reviewed-by: Pin-Yen Lin <treapking@chromium.org>

---
V1 -> V2: use dev_dbg replace of dev_info
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9a2a19ad4202..dcf3275a00fe 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -924,12 +924,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
 	struct device *dev = &ctx->client->dev;
+	u8 data;
 
 	if (!ctx->display_timing_valid) {
 		DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
 		return;
 	}
 
+	dev_dbg(dev, "set downstream sink into normal\n");
+	/* Downstream sink enter into normal mode */
+	data = 1;
+	ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
+	if (ret < 0)
+		dev_err(dev, "IO error : set sink into normal mode fail\n");
+
 	/* Disable HDCP */
 	anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
 
-- 
2.25.1

