Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 277AE50209F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 04:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF810E202;
	Fri, 15 Apr 2022 02:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B63B10E37D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 02:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jg6QvygHmr3N5lHXXCQBhWMuzzbJfbHOngD+OBPnLUDlSVtnAHBN+C0z7oX9IpR+BzlSQv1+MYLkmk2NDEIRujf1oIImGaAEDIMoH6tfdimQYlZ2avPc6MMNY8gYLOiQtL0tFJJvXy6RjAI7sGoeExvoirFTOxBrTwOJurIr+TmJxoTzXLxZqRZLQN3JJY5JPGVdJorzo1MaEbjKI4NnAVr9wlPfsYmSbnCovGMjJfvl9ZK3CzwzMmNbcnVL6//SIgYyOPGUgY/0VpPkfH22GGW7+eFmgYtjH+8EbX4Uf6kAVauvETHEUUFRKGtS4+xXKut5hgpNaRkQfxn3R2vKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqBJQSA9E0WGVeLfPfjJYljmppdDVBVI74FcicKmHHs=;
 b=AoXLRC4PXlzM9TS99hsArhIH53f/WOywKXYMC4X5artXkPZjcAJVoGQOEqDenrU/sgy9xUfQtA3knAwnYcAg5liIevFh5M8u626KSGOa1hURMPSvFfJv9I41ZoXBC44PZ0HRpr7MlCeiPPgdCEUj9cMkvU9bcyE6LCTZJmjAfMhP0EzuQunfiyEIDvcfsz/8mEVYg645DxWZMyVdMTia6R6KzxCtpLxhDqLH7cjBXECYwBNqS85pJ6SW40x1OhdTxwF7AYihhOD6rWVSDnExfT40obZfJxWcDncOUt1cLpCT02YA58gD4zM717AZe9FmxY1TPhCawyXo3x1nrcZudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqBJQSA9E0WGVeLfPfjJYljmppdDVBVI74FcicKmHHs=;
 b=XA0jigT8fcaquypKtdHDVUWfp5DNRQHNAqCBzm0zAWNlD4PxWdpTp4gPaDKS0SeZsgm830olPWbEseHTaqLbIC3QefKnBEWjW3dVpD4nF2I4RzYQhmFtXeZTsKum2DWI+fbk6lXxmuDYExGytYkLmhnbn6wgWfCoxnEPT9xKaLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 02:43:51 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 02:43:51 +0000
From: Sandor.yu@nxp.com
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 1/4] drm: bridge: dw_hdmi: default enable workaround to
 clear the overflow
Date: Fri, 15 Apr 2022 10:42:47 +0800
Message-Id: <561951005a85574dcdd108e5d6a3a87df930ea3d.1649989179.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649989179.git.Sandor.yu@nxp.com>
References: <cover.1649989179.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92d782b2-645c-438f-3e55-08da1e89c610
X-MS-TrafficTypeDiagnostic: DU2PR04MB9132:EE_
X-Microsoft-Antispam-PRVS: <DU2PR04MB91323D118A8D603A1E66A7C2F4EE9@DU2PR04MB9132.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+r4Bb3bdFliFz9qkNCr59rn0eXa+Canj7Bf1ghZg0pTrEJ54SyihMb8u4cC9E2rsevetxmCVTdMA5NSmRjrAKRWcFirPXy+ZOtFQG4UqgHDmt7o6JlL3ZQAo2G77R7FHWVxHeNtqwC4xm/x2O6DwFi0YS6dRLmRc1yblw5L+tCH0cjwTORIzYMB3hicG68FBedBFidZd747j5XfNllImTVrHKzb/45XWJkBHo0sJnPcGgki4Q4Na1fU2h/Pa/sg1Qek7VnOKiJecTtcal8cBqLBJar/fz/uyuw6MuR9kaV4lZJyjdjkXJbvjfi1uQlI2OvywC3x7kEVC1tUZtoYurPX+0E57AkImhfoD6gHqRI3nCJZ6A+1qJdzYm+Z3ZsQ5Ck6m+YNte6zw+8hZMED6W7DPNm23ituNmX7honF0+IE0yHPIGcBXebFDljHBL+3wwH6XkYbRoOhafm4f+93Nt2yF1V2q7q9WkV2apUtYbtuMg9NrT3XSK9tnLj7p8xMZ+GSlrqr5ZG9R9gczp1Q1ygUkHqOK6AomhfjZYzPINDwsVHMlQ1JJHOZ4ChzlYn83NCGYLTemxZRL7kzXp7afuqwPIyRIdfst+uli8WgSW8kph9j5QuFRi1RO0ZTs7bhm2jVqdnXejuB03A/Mm4Aie8eemQsk2QppXVe4jfvqPiu1WlWD8c7Jqxe27CgJ9xJ/uOEp8lo9XGILyBVTK+6EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(6512007)(26005)(2616005)(9686003)(186003)(6506007)(38100700002)(38350700002)(86362001)(66476007)(66556008)(66946007)(4326008)(7416002)(508600001)(8676002)(316002)(5660300002)(6486002)(36756003)(8936002)(52116002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KAHpQI/yj1rKb/z+HeyPh4/L0LhAbTZfJmBbFOLW5ifK9DLnrkqIxmBh5iV9?=
 =?us-ascii?Q?jKOpyOLUk2FoSg8PSkIjvOxMACpVc4h8PxYWHDWFeLXdXW48LNTc2F7DPqj1?=
 =?us-ascii?Q?AkwPJKF1w6zkjhuR2kkb9RpAau5O2zoiWXXukR2EzDHG1jQEYI+cJVSyXdts?=
 =?us-ascii?Q?qIXQwxyq+/+Qfi7EFvghwoO89C/B7mYge23lfglmbVU6gUWaqf0QKPa2m78r?=
 =?us-ascii?Q?QVCx91Kkx7OuVZw8MWA9xQTBi1fHijh/tpD3XAHuv/mbMRksb9g1BaJKc2oG?=
 =?us-ascii?Q?Vj02XmeLn31QbHm8aUe3XEFIYctwECdvbWIeOxFPXZV4SdxBeEaszBlZqooZ?=
 =?us-ascii?Q?1+Ny8i3AB62FyCCLGVk9eouoIfLIusCZWB6U31Ox/eXgwvdq7rzXgIS4Q8Bt?=
 =?us-ascii?Q?RNbtc3vu4D8FdVcCRGLlS8morIYMEGM5x79YDwlWd6lP7QYzQoQT+GonEzhe?=
 =?us-ascii?Q?uZmjP8Mpf0KEdOXCUfVNfBSvid+D7v/rCp40nWGpR/qYEZnvXY7JnCa+v3B9?=
 =?us-ascii?Q?8snwVgakOBn5snVJwS5YiQkn5bptcLusCoV2NwFKOuhUYqbsxZ5Mr97io2F6?=
 =?us-ascii?Q?WlgwCt2hol6dWV4zToNRnp1/Kt0TQXsrrSs1tcbvDiU0AG53qXY70QNFtD7+?=
 =?us-ascii?Q?RGNbykTF8itHQhM5gE+cqzQFwleZmd04WVami4ouPhYgqZvXxRGVfe3nGc49?=
 =?us-ascii?Q?1WjViL48c4TzTx2CkxoJmNM7+ivONTHNDg7zBWQMxnM1wTusbFhwMixxK1Bf?=
 =?us-ascii?Q?NXm9SKsXIRLCWujAh2EvxuXNZaxSchnDh/WWSdTS2byxonabGigys5Lj+qSx?=
 =?us-ascii?Q?LDy5v7zCWZ2egczDopshqtWqfnMsTm8/jCqDlTGssPCDZJSwCxYUXRUApuzS?=
 =?us-ascii?Q?pDlKPXE8HGCkDBBeO7lGXtCniS1+vpmsLnuuWdWK9Jf+DmACzB7Njr4G81wj?=
 =?us-ascii?Q?zpHWlovJMhK/Xmmr99QTuL6J4HWAmMpfxwSeuvESJMHcTPYt1ZKITazrpXBT?=
 =?us-ascii?Q?XM4n+qOcSk+Syr3/tthLzQHbx36+QHmKpOnjxjlBue2G5aX390BOBifhYfmH?=
 =?us-ascii?Q?D/iYDdBZNFYSk7Jsw42rMgAnE36gIO3nEQTmPpwPCluSn0xMfy/G5YyhZAS3?=
 =?us-ascii?Q?J+6V+ZCFEh/+4eRuZUcwRF9wVSDn7tMnqJlZOutvhkKCe1zHlumadCwEBl5U?=
 =?us-ascii?Q?FdtwWjYaWKzaLJAe93dQB60NDwB2rFW9kAgExNaBscKO+dxGqlCZ6N96tNii?=
 =?us-ascii?Q?zWw/OThgOj7NYn9Sh38Q/CApJ6QX8DljxNt+piXUTdmt40micQKkbMLXRKdr?=
 =?us-ascii?Q?N7TVMyaYWWf3Vf5iX5TMCR+t5U0MGxZul704VxrnmnuAHkBEFBJDjHczEgop?=
 =?us-ascii?Q?8tE3RAM3yWkEIRwnCGR8++tRbn5DDmwnQJAyH9cTnHfajVzMBjoFpQYzpI7j?=
 =?us-ascii?Q?JH9WnPGD7UzBvYPPLRvKURapr8DDg/s9OahrRVugcsw8O9bo8V0dFS64q/lF?=
 =?us-ascii?Q?q+V0qzkWhV3oWZFvAgJ6wp3k4pU6ALRsSh02jagyurwAX2ohqnfRC3YFigZu?=
 =?us-ascii?Q?b0wws9Kot7tX1L8CVBuMcXMmYJivsKJN/3lPSdwk/YMAU7l8wQlRmclrJPgc?=
 =?us-ascii?Q?kLkNNjGd0qXikeiVoqUdJLMyx8XGSEKt8EbWjNQpNY3Cv2TcM872wvHpMtdZ?=
 =?us-ascii?Q?G8yOdUihke2MfdTyMUXlYz3XZUCpy7G2ywf5GJlvQqWgAPJej66cQVEpG16P?=
 =?us-ascii?Q?r94lBhjDaA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d782b2-645c-438f-3e55-08da1e89c610
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 02:43:51.0527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Veqyv3uHf8sSQcz0+VaG/7eoa8YfQdZ1ashtRDdPMtxwhKCwZI2IkaObQP/FMQcYD2uAoze4eLJOKmdIyZIPvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
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

From: Sandor Yu <Sandor.yu@nxp.com>

i.MX8MPlus (v2.13a) has verified need the workaround to clear the
overflow with one iteration.
Only i.MX6Q(v1.30a) need the workaround with 4 iterations,
the others versions later than v1.3a have been identified as needing
the workaround with a single iteration.

Default enable the workaround with one iteration for all versions
later than v1.30a.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
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

