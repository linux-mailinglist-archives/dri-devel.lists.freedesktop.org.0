Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E8998218
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 11:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C29410E8A3;
	Thu, 10 Oct 2024 09:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="X+r3x1XH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDE210E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 09:26:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIZOg3q84aUFJTI416yEOllTgxYgJr7gvBEh9wY/2GBXbscBoMCVBtt6ZQyvVILI2/plX4HSJh0+nOvnvDgEzCB/Fyryzg43FqlQALNwjEI6NBY+jDTagS4PN8O+C8naQEZNx0O5f7KJ+vIehorlFdP9MzdM56vb4GLKNCoN8QK561YDIqGk/lEhmlTZz5YkR9t4xLymjJTUI4UYgGISC13GkN/oqfk7dDw4mbs8Ue3+VevdbCZn/plHrc1/G58a9ruhbd0B9okHHhn/vPIpc2NtBp8akoCKGeVcOqmrGtegqV0VRGRw4iYKyc1zk6sXsplVf3kgo2eFBMcsX9BlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uSLnLthcKIt+KuiGqxlOHVN8H++tLBZaH3tztJ75eI=;
 b=FUD+udQ1z46yF0OQcsgQcn6RzELgoXVUaLbZkmzYu9H1fzdnmgTynFZTFlJG+4PCY5HOGxfz7iHxG4T1ZNJzfclIsrX3JItkNFFV6KH1BIpirT5S2GwgInnoJjqQj5Nu/ZnPkxKPNI7RSQgF+BbzjLO38UEaqTdp23J4i1Sqlhe6BS0xBuUA13DPNcUqlnIg8D4hIXN//14ecbA1/7KykgB4II091YiHQXCH/5EwZsTeF6J00NAlOLnudtYPjho0cKFNdg+vkE0rhoph908b3XbO4W5ZLhrJ9UG8W/a85a/KwHhoXKH7yvRGyD4FFSTrzvHuo2ws9IJD3R9AyzY2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uSLnLthcKIt+KuiGqxlOHVN8H++tLBZaH3tztJ75eI=;
 b=X+r3x1XHwdoeitNOtzgYG5ZJ4pv58iMLsjSB6w0plFl9i7bWwnY6uQEg0bTYejZLqsJhXk/pyzrJgLJE3+r1qaxSSalJInLFE31QybeHSK1LfsAcVtuRArLf/iFrTu56nr+deeGVf7EmAR8a968/+v2f8Yflsj+Vli2inIU/bWz5xSt3Ni9laLZjuA5idEZ+Z4XfgKKFB4alQAX95bAGeAxczXmnMZaLcjgZJ1pbjyh/HSa2aF8nOz4cWgMPmZW/L1UpYwHczUhwBeDUF9SWvSPeH4GNcNb1KDYoKKsOiJIF6HyoNlAUk10apruqBqShCBT1G3ytIak89mctOQ8Cqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 09:26:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 09:26:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: ple@baylibre.com, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH] drm/bridge: ite-it66121: Drop hdmi_avi_infoframe_init()
 function call
Date: Thu, 10 Oct 2024 17:26:43 +0800
Message-Id: <20241010092643.1048116-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::33)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1db261-4d93-4062-c57e-08dce90da37b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tyq81/19Jvyk07EBUOjtBTTEpTsfNUHGrUJEwVG1LygPwcT/IY7cGRWxdG6c?=
 =?us-ascii?Q?z9yJz1t52qtoThle3Uq0/g2EGlkmzUxGMQqke26IB6bQAmKZm+ges4sTWxDe?=
 =?us-ascii?Q?FRcoxj5LJj3KSrTQ+XNh7fnbltPyMP9DeEmYLZSaj4WX+xyhPO7kLJKqeZiz?=
 =?us-ascii?Q?7f3FbKVpaRY9m1YlAknG5FdwKTjNmVj8xYgy0pkTuDgURHg77X8GtoQY80wL?=
 =?us-ascii?Q?F+ZSubnLAkF7bwPrAzUw770z8uv5fZenOnV7dEdu6GJxYtfYLWmFNsUbd0qY?=
 =?us-ascii?Q?c9W9DQy2yjUkWhjZMQkEWvX2Cx7zPZXLm0tN9orPKm0IexfCsyjRmoDS1jnF?=
 =?us-ascii?Q?OqWTv4JrqoCBjeBy92Lmn/s4tk/ML6lVQlxMW1IIkrE7GJUdpTS8N0E/Wdh8?=
 =?us-ascii?Q?fD3wLfMLwitAriqQ9Cd6li/T9BhlcTCr8qYw3rJQ47mowqopPHIMv8cJ2PW8?=
 =?us-ascii?Q?aU1V0rfe8OZdIrMpE6Zn/FjBHs46nJZLwZ8wb4bNp7rStnTNkK0YylrJ13Pw?=
 =?us-ascii?Q?HnuEjUGPsk+l/92sDAXerVqQcitoXygJ+TY7vgd+lMdOTSFz7RHThUFKjSFm?=
 =?us-ascii?Q?oDRmZs1OJmDwD7ovAvmJYFXvngSTIC3+1uzaoPyIr1ENiWIMaOe80EiITxSN?=
 =?us-ascii?Q?q7JphAinqgxscxgm+uKDgWiKCRy1p5OTfDc+0+DtsjctXJKvEAa8M1mvyzPr?=
 =?us-ascii?Q?b2dFAy/z3gL5F+hTaVO7/5OVdWr+DKVuIR+bG9oQvGcBCT4TG9ikS1EHJ16y?=
 =?us-ascii?Q?YLwlMmUSt9X34GApgz/0BMj1FE88FiQc8cVINDYBsAYDVAN0dptuB7tJy6y5?=
 =?us-ascii?Q?2NGv1lFOYfSyWhJUxcVt9Ca5mTqByAza5/ZIbKfGJ2UC8BuWe7guS97uzB/9?=
 =?us-ascii?Q?ULvtFZPZg+LLr0yAxdFupamqSvkmlJWirR+6ECgkVda3M5jMEnUWIoF3zosf?=
 =?us-ascii?Q?fPPGpA2IOrO+sKVZUF7tBrBZ1jpyiJB5Hg+Zq92drcYDz7axuNhJwiidqoAw?=
 =?us-ascii?Q?9S+J+gCBh+ATRHW5mB5iu/nUQ/Plk0PS7Vnq8zm1AALVSDdms3DtgcaJS+uz?=
 =?us-ascii?Q?FBCB2yEdtkkVc0pk/EiA7e9hPuq9thjNl4pURGL8HBMWc1PwZ/r7ty0ifP5E?=
 =?us-ascii?Q?3MeRTPH2z4Vbk2Q/AVOHWseOSJMN6JibPEyQA0EuB+8IFd1BPqlllKiTjX0Z?=
 =?us-ascii?Q?kTPP+cNKfpxiHyrMZWufnaVLp3STvmdN7ZRvIj3KM1HNasRAczNpeDH3tkNT?=
 =?us-ascii?Q?vE0sL9fv1uAe9TN+0Ed1cEktsQaXBTqat1t3ClAIdmIHOlXojPhMY8wTq1RT?=
 =?us-ascii?Q?xd4CT3tAlaoVe54PEVD/fcQKhQ+CsIz6NkId1ojOz6JfJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eHN/kS4UfTGsbpjsK6reFe3HRhsX3quQ7vx/5JdGXskQRrlb/fmmJT9BOcyF?=
 =?us-ascii?Q?X/4FibbHOdhTneF7xgwT3qtyLb9JAKQIIFVb8939BMtd6mrBmVdNdNfJemrh?=
 =?us-ascii?Q?Cmr2ZsqbbculI1yLt6la25PYLohEud9TGv6TzWcP2dPalOt/kvESvRCgJo/0?=
 =?us-ascii?Q?kLN1oGJ5Cqn5b3MVqd/878k4DL3Vyaoms7zK2Tl89MohDsFasxFULV1crgJ/?=
 =?us-ascii?Q?b8QfDAry38JAR6/vbOfOGirq+4PrWegFp6daGdBOxmyafICjBAnUgnwrKgCP?=
 =?us-ascii?Q?RvX4UBpxoz6lYb7IyvX/Tcr8eDwIWt0AIGwXmtKCQHuEM9aMtFIdJ8lxWbMa?=
 =?us-ascii?Q?ntn4BKtRTxtiHK5yQfVHf32AMwuou1kAbWjNkP+B2EMQq4YndStaBWihVlGY?=
 =?us-ascii?Q?m4NjEsEZiKzPKVAxNtnBO0d8l56u2BoJWCQiNupm1bR56s5AmmPvSqrMDtIK?=
 =?us-ascii?Q?rQU9lZCwrVp7SHT9j33lDGUqUQRx9JAz2hqjqiJsHIVTTHtg9/BNzIx3eZkt?=
 =?us-ascii?Q?oAvMBoeOdkzzgomjdja1DgGoZoCPaegfDLNl4B/WPAzwaCCY1TqkbzqQJ/ie?=
 =?us-ascii?Q?w6pwirmShVnKrhEdOmZQAhX2cRMPNC7oKnrVzcrjYvIj6hb/GUEMW0Vlhcia?=
 =?us-ascii?Q?SeXwXYGiQrmqlVbKuGbg8/43wer8K0wR9gLaUZTcnAs9uEOy3nCtvp5nH8YW?=
 =?us-ascii?Q?UqhBKy2Gog2MiAd3zxOGL6fcj3OjfnCXvE1JorIN4zBxG5i/YZ4aXKYY0dPx?=
 =?us-ascii?Q?GnmjikZcmu4PYyyygExBYXwV0qbi0KGsccyJ5a1OLh105KzoO+sYLEBZbb5C?=
 =?us-ascii?Q?8V7q63B3tZAPpjVzAFYZZCtFR705q1NQuR/FM+z/k1fKl/iC3H99Us7TwbTe?=
 =?us-ascii?Q?uaEa178jO3cuOvwRttFNb4Xbj0hhJcMUe106JCjT3eiQEd4arpNzOLNsAXjj?=
 =?us-ascii?Q?vNQws7IyxbRmRxhwIqklT4WEqUR664M2OdgJ0KmxbW6a5t8WuYhYLph75ixC?=
 =?us-ascii?Q?WcDEmDA/iK27dlkpG7LETk0dE/Crsv0q5l2AsOCRuHBicvfuGV/VyZXV9fRS?=
 =?us-ascii?Q?yTmSaSGoD3B1vE6Rvokw+Lx9Cwofq9G5a/O7aBQfSffDH4u7+hS5c8W5BDVW?=
 =?us-ascii?Q?EY217e4BLFrcCET1Vld2FA8AZ6tn3B9tussCj+Jw01t0nIsMqmduNyAOVJnV?=
 =?us-ascii?Q?AQxLPQnDazhzvYcttTbpoeCUn9nCrVgzI4J1esRH12oKHRrOcvYZalko+hG5?=
 =?us-ascii?Q?TWqZ6jcYmhPC2w+DoJwU+wWBOt/12vCjOoUPvkFy8zP4ttvNHOa9FNXl5scZ?=
 =?us-ascii?Q?W5c0O4h38RV0t4/O+npiIf5APfA5iHOdDpZnk1jem6odRC0yMI1vbpFOgyPv?=
 =?us-ascii?Q?FTN95Eh8L8GhH+hRbo652ziq518HN5fBoR91h/YWp6EA1LniE28+b5XWhpg4?=
 =?us-ascii?Q?f5NdygeSsuxJSIfG4FoazHotaAmYOG4kqG6TgAtdkAQXc43zJ8esflIlqDg+?=
 =?us-ascii?Q?JrbLMKNb98oa66l+78Zety558qOHTajmD6tPbhkGbkf8Cap2evez+6NkajyB?=
 =?us-ascii?Q?knmlSiiCnFVb2DBaLl0MvmPjFhpILvn3pIksGlb0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1db261-4d93-4062-c57e-08dce90da37b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:26:36.9981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYgNAEkCKO6m1UjHTsynxRrgrsVmKVDt0PVD86Bj5MFamwO4jxA1aWxxNEH5aUWYDen+kVToXRz1ps58wvIwxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387
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

drm_hdmi_avi_infoframe_from_display_mode() called from
it66121_bridge_mode_set() already calls hdmi_avi_infoframe_init() to
initialize an HDMI AVI infoframe.  So, drop the redundant
hdmi_avi_infoframe_init() function call from it66121_bridge_mode_set().

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 925e42f46cd8..35ae3f0e8f51 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -770,8 +770,6 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
 
 	mutex_lock(&ctx->lock);
 
-	hdmi_avi_infoframe_init(&ctx->hdmi_avi_infoframe);
-
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&ctx->hdmi_avi_infoframe, ctx->connector,
 						       adjusted_mode);
 	if (ret) {
-- 
2.34.1

