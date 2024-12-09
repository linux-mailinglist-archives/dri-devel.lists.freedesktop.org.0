Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7319E8BAD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 07:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AFF10E0E6;
	Mon,  9 Dec 2024 06:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="dcC7io/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11022112.outbound.protection.outlook.com
 [40.93.195.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1C110E0E6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 06:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S10cU7FqvhQZsAxfmEAXMbuy2i7GkXU5IL8ams2YDPSZFotEAOhYd4zYLeyJsjBQCGDchuyxpzetiFyiT1rQ1tVucVUzlkSMLB2CjDv5sA3nJIXhHUlRX57zjfPsiEaCtDJPhzE6lUOKZ5Kpafkgp8CKJbThjUzJ163ytZKyL+mOImYDWdeCTTk20du+bMG1j4iDNFf+EMLyoRZ2Pflnt7I2l9uWrV9QAA/IrVH2jUOlrMIERh1jwablK3pv5rmCmRmZJQ40TzCP3CSwi94SVQ8Uy5JIzs22chf/ixgFHy5XCN+1TAV9EUpanF1/QrJ91ClePUWmGlfR8od9ezr6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUKRdaLsp50JnzyFXWoQ2tnJmbqXBfLi7MzdsrKQFHk=;
 b=BO0nPGGhkHmWIvNx/E4LYpe12oKTCP0JBK85KGlfpdQrSy0KAX/OHm2miYk5LXStUr7Hmm0dO/Cjba8svS7geS64dUq5VF32KsZp762GCS/CP+qd+EBr2IJEFIN29cfcCLod9lzeTP3rmv07SWkmznrREf5LYJ1q3jey/bcq/Xi90/oBpjKoYXOUtvFU9PcmRJLR4hkfyTKgGIGj7SnnP5NK49NCiZ0HVJI1O4gPLQdYZvAAjOI65/tXbKr2K9GPXL0bKdGp7L1+UBsC34SCqWm9IWY8z53IdHWrZsaMdONreAP5+k1nVXrM34/nSFR6UEYiewpdb1IJR0HejQZrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUKRdaLsp50JnzyFXWoQ2tnJmbqXBfLi7MzdsrKQFHk=;
 b=dcC7io/i1Lkdqk3u9O5ed9rE/tCdk6OVuFlv1AUWcOu0e7ghwMks/gbeD+uPMX3HUSEnjCs2YCZB66pasekpqaz6AqTLKPktcmTrsh2FE25bdys8zWPsZ7tBLuduSz3jMS0KDV6BQwsztUW0oi0KFotLLjxLZCqkvWHSciv6Xe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7360.namprd04.prod.outlook.com (2603:10b6:a03:293::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 06:47:59 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%7]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 06:47:58 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@google.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/bridge:anx7625: Update HDCP status at atomic_disable()
Date: Mon,  9 Dec 2024 14:46:32 +0800
Message-Id: <20241209064632.1705578-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0048.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|SJ0PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 4929b163-2e90-4420-3d5f-08dd181d6b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bbRxZeJRCZLn6Fvwf9PXGh92+3ZXGEDLu12mAD2/vyAa+p9G77qWMTl9oyRs?=
 =?us-ascii?Q?bpnIAQfT+Nnm35CvLQTtSBfqQM9AuaHCsDxyWda6rfw+BTyr9RvHfVSIJ3fs?=
 =?us-ascii?Q?iRK94KIUjjkUsef2/cTgnH+OuV6pexwebwHSlLAAloU7yFgcZfXakLP11RJG?=
 =?us-ascii?Q?Lf71laRn3OzvQ9J609N06d0HUcguwG2CZ6RnlukHbNP0giWfj827d4WQCv+c?=
 =?us-ascii?Q?XrMDNKIqTr6MK7wsCA4ffrMrb24Io5wTRptOVodbdTtuTfA32h2qJVNQGkrA?=
 =?us-ascii?Q?//TGCgXypORN8dDWOyg6z9/UzM6L4a+2p5j2UxHGXDlquOJoanrt3h0Jdm1P?=
 =?us-ascii?Q?Agv9Ec/qa01ATiN4H/lODRh2V7ojkaSqijfMVQFEmSMS4X41rLgQCZvfjO0m?=
 =?us-ascii?Q?1zddf9UXCqiT/ZlqQNTMQNCVhBGs2GE2SzvBbjPbTuDipAE1UQR3EFTrw4OW?=
 =?us-ascii?Q?YZew0D+8W4/BxmUQAQjmlu80JxZUlWopBvs6+bw/MluQ3I+AB3Ohxv/EEOUp?=
 =?us-ascii?Q?LPVWFTspHkGbwpYkkZ3qeTVT62Uhaxdy2nUONf3giUgze2zpukdADZI0t4K3?=
 =?us-ascii?Q?fh/b9tRyQRydmw4PCSjIXvJ4Efch+3Mv8pDImoqDVDKGpReS1xlNbsfssEyt?=
 =?us-ascii?Q?tWANRKtpWC3KC5YjlRrvTWZ/fzbbxMQby1em4kbeys54kN5hAFI2MQ+feKVB?=
 =?us-ascii?Q?Ar/4/oDXhkUVWYpt0ZAGSCBZgtVYt0jW4xa6iGl5d9ANTJ4OQlkJFGfXDLcQ?=
 =?us-ascii?Q?/x97tv+7Pa+AmGiF3dfcG5aeWkJ4GJj17I5wd/u6t/WxcInVypBcrMHGxz8P?=
 =?us-ascii?Q?rbF50gvfZTA9L1dqwwdwpblcEip+51XcWAjpMTjKyyZ+ozGngyngz/lJLNvp?=
 =?us-ascii?Q?o3rogafTuTIIjzPHqxe8WdtQcMjm1UZrO8gjzTO9SCkRiA0ncv4FUGBv6aFV?=
 =?us-ascii?Q?YH5TIxT+HnpAVxH9603WZawxH/FBS0vMlGODYUZIfXxQOkU6cVW34YlcQ53b?=
 =?us-ascii?Q?qKTZvYxFluDoSUUoRlJa/6lOySEaxFPdlpidjjIgozvG+8Y8ZAfH4T3iNxVn?=
 =?us-ascii?Q?wlWCN40HuVGhPWEocuFKKYdkHWyREJdpPc5ucp5RIKvxbGSKebHx3e9Zsjz3?=
 =?us-ascii?Q?Jre3XVGz4mtD3W/EOVyTrze4BPHexFPPmgOwm1Usz42FOI74PwZk9uqbitrF?=
 =?us-ascii?Q?JyhOPPaGM8RfMkCJhRlNmyqCFeI4wzkJB+GcYYScPRq4xug08VSMkCAD1EFb?=
 =?us-ascii?Q?vsW+Bk61WcFb1lb/YomFXy1cPsso3uBj3sxAXIgdIr53ISMJ9HLl2cz+pwKK?=
 =?us-ascii?Q?MTTgvtM1Fh3eAWuD6iNuFL59OpKy5RkXEX42NgYrtzJDPkN215lMjJrPyzA9?=
 =?us-ascii?Q?Pep+6ZvTsaHll12jAte0XjK29jfe00CNwsUlteqD3DSlrTVxb61KZTh+jOZ0?=
 =?us-ascii?Q?R/0RWqwVsvA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H2qehK2rKLZwQpP9I/13+p6nei8lp7YO7zYitTNFZNXwGU9VZhTt4BspyUOX?=
 =?us-ascii?Q?ObURLF4XuKRXiALNW5ti13JIU/pUYqBir3RwJK4GJiWOfV4FhYVPcRaPjceT?=
 =?us-ascii?Q?q0TPqU74E2+y/GGKE7dRjduIMoQQd+P9jefBOOgloeBKLLqpF/SbyBTV+5i0?=
 =?us-ascii?Q?1H5w7KHfBfW/Q5YqJkqnTDqFU/dCHEs0Q+cI7GT6Hdpj6kmYIT9WT+uMW6lJ?=
 =?us-ascii?Q?0nyiJ0pmoX4lIOwpF+rCPQveJQQmG0aoLIN7mP5iL24Zmr+3jY4XGT92R4Fy?=
 =?us-ascii?Q?evat8ApVhmhxYbllwTnI6nTMTQgFSaaND9ChHgZCtVonzz+Mh8ladp1uBSKJ?=
 =?us-ascii?Q?zNTqJlWilQl8gYBPhb4OIfcQ3KVX/cRYN/6/5T3mFsHbva8W7yDqHPuDna6t?=
 =?us-ascii?Q?LUk+Nx4nby4rdFcV9HItDgFadIknhe2cveGkiex3BVCnlRSe0L56jKQy9buo?=
 =?us-ascii?Q?Ufn9WlzW4jHIyDdsKEbpZt19GEj9IbtKTVfvXoNRfmRFIiGsTbEZQ+0+Ez3n?=
 =?us-ascii?Q?4DzCORFiu8SfeurZxbDXxYgFmdDkkBrCnlpgRQGVucLn7Eevk2E1TD8sKPVa?=
 =?us-ascii?Q?+1XQhFqFEWOsU0n+Wj+Sc8lVsJxCHi5x3y66GQFDoSzv9HcnYOZAWyqSkpo6?=
 =?us-ascii?Q?lDPzf0wg4spbMKjS+NOvU7vvzHZ2/bDbMyqD+v/ntJ6l6YS8LdJwO0Lhw3rv?=
 =?us-ascii?Q?1lyyTOuP55buqpXnLttQlLdo1wWQZZBYCtDJ+mjl1tg6zBzVKjP5Z1MpnYuJ?=
 =?us-ascii?Q?7/5boEL8+W9LstVz02clWrfjBOM7+MMEvhLGn30wcb48sUWsdissVD/514eU?=
 =?us-ascii?Q?DAjVQGtxpIIeXgNCXJE8h43jA0G/rzHTEDzZxoecZ5KXxW8UQsNFZyjVipp7?=
 =?us-ascii?Q?qIfMhnDQbFjNhPLb7adxvd0C9KGxrXwlx3f+q+wpUWfKAKuHWjiZB7MPc3hD?=
 =?us-ascii?Q?NPr0yIei2ZzwKG91mbPQj+91Xu0ySIeYzUMbNqgsGN78ywl3udM9RY3N4OCf?=
 =?us-ascii?Q?wp8kP1LWsTpNMyvcsZ3xeKRvJ6Pces8KX+Ggl/3deHXkMmeVJMbtz/VdaU9x?=
 =?us-ascii?Q?vBo2uvQa1TNe6U0HheBkxJ163FQth/GeO1jGs9dS1LIO+Yb2j9b+6hc7ktEW?=
 =?us-ascii?Q?YBLjJoPAe7NJeMCicUulFNPE9HlrVTOuzmcvLCSzYDNzDESfPsAS+GrN6+Ke?=
 =?us-ascii?Q?ax6gysxvuqK+R3X8ZOoJvwPRGimRti8BVNpe/43Hv45d1uyIM53WNE5qNcre?=
 =?us-ascii?Q?Hxthzv+9knGIXDQ578fxehiCkhHBgi2RAjzmrMyNOHuvkZ36YGJvgh+kV38Q?=
 =?us-ascii?Q?deJwc+7H6dKHUHHTxXFBpVWl1ZlWuE20y5r/gQNC3q4bykGI187hXg7N0EFg?=
 =?us-ascii?Q?YdBWFRqmKHCzozeBMknpwJthNjATEqE3bcDUPnxupLlCFeO6MBmtaQr23fEz?=
 =?us-ascii?Q?nE/dfm28DMWTyAXSeH4WAmY1Nfg0t4NBF1Jta1mliyQ7cET65JQpfr7S7Oor?=
 =?us-ascii?Q?ATmQ5Pet3qTB8UPdST2f3bI7LYFW27rA8APbCgJVz8TZ9c/93NOjISduXSym?=
 =?us-ascii?Q?OiP3pznKfd2JLff3I+DlL1qmRpeWWbD6JTvgjd20?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4929b163-2e90-4420-3d5f-08dd181d6b15
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 06:47:58.7319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQUFq+TCsunUYX3agCDFvpPjMMhBxaDNwIgDBdxkyuhl2gj1FbYPNbGyWBAMDTD659KAtPelE6Hj6vtbTXuc4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7360
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When user enabled HDCP feature, upper layer will set HDCP content
to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
support HDCP feature.

However once HDCP content turn to  DRM_MODE_CONTENT_PROTECTION_ENABLED
upper layer will not update the HDCP content to
DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.

So when user dynamic change the display resolution, anx7625 driver must
call drm_hdcp_update_content_protection() to update HDCP content to
DRM_MODE_CONTENT_PROTECTION_UNDESIRED in bridge interface
.atomic_disable().

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 25 ++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe4..a75f519ddcb8 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data *ctx)
 				 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
 }
 
+static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
+{
+	struct device *dev = ctx->dev;
+
+	if (!ctx->connector)
+		return;
+
+	anx7625_hdcp_disable(ctx);
+
+	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+	drm_hdcp_update_content_protection(ctx->connector,
+					   ctx->hdcp_cp);
+
+	dev_dbg(dev, "update CP to UNDESIRE\n");
+}
+
 static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 {
 	u8 bcap;
@@ -2165,11 +2181,8 @@ static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
 			dev_err(dev, "current CP is not ENABLED\n");
 			return -EINVAL;
 		}
-		anx7625_hdcp_disable(ctx);
-		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
-		drm_hdcp_update_content_protection(ctx->connector,
-						   ctx->hdcp_cp);
-		dev_dbg(dev, "update CP to UNDESIRE\n");
+
+		anx7625_hdcp_disable_and_update_cp(ctx);
 	}
 
 	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
@@ -2449,6 +2462,8 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dev_dbg(dev, "drm atomic disable\n");
 
+	anx7625_hdcp_disable_and_update_cp(ctx);
+
 	ctx->connector = NULL;
 	anx7625_dp_stop(ctx);
 
-- 
2.25.1

