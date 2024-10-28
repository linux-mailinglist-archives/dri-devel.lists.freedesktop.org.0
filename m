Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B569B22F4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D32010E321;
	Mon, 28 Oct 2024 02:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Jq2m9+p4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D52410E321
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:40:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yanbDrmHjL2PEbCgZ4M6Gmgiu2bJ07gJQMpRZFqnvnQbXQJjDzQZZuss7rZvfa8zuK+7JhwAwVjZrcR78MfH8hZRARSMYh1WiU4sUcd4sDNVVimAyLuJNRKRHcaF7sDfZSIji1iMIofWWT5WqniKYteqogI5JJHP+pt102Mb+Jl4+wKKDpXAUe77Zr1U8x0FbmSx0tvoL36omxbOi1I34IHbxmLkBmDLQL4STWSNw33F52AXHX0BF5Gd7wWdkb3beOGRI3LiKdiy0a6EsE7IA0ivHk0jOwGOiuoPzB9JfGpRRwhWD1W/QTLTCZPs2p4IlTize3eCXYVYxVC3g7nkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvabejdP5d2t8qeomjDek/wNKCPuWSJS5dbffzfSZrQ=;
 b=wL3uGRvRLUjyZRPtlh8V+vj09lq8q1rUblgUnoYkzTI6RJYegNiqQ7BloUd2ucVWFc5ol5swDLBplsCkqhA2j7bF29t+8hHwHL27ORIchBkmLQhuCpkYgljcu/GVMEzKSUmDWsIMeWABTU9QycNo4Otnf5mv5Iswc7fxL5wVd+ArOKdEx/9hAnUE5tvUiu3kvL8MK31Ml1bVzQtyBE4/1FKijpsvQbB7K03sTsX0QI3V/ZBu35yByqfBDbvcQPpfdr73ITaugoU8Z+Lm2T8PE72JKrQ3DpVKzrKCtaBMkAXMERIYamz0Hy3251sULKV7lLpF0/5QNAhE5NsYVC+XFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvabejdP5d2t8qeomjDek/wNKCPuWSJS5dbffzfSZrQ=;
 b=Jq2m9+p4+TKYiRSxvcYYPVZvqlqEpxnrpITu88TpKeJceUX8fosBWge29n1+m2kdbgcxTfQah5NN/QP4OLlRwP3Sd6uDdVQqceU59HUWjFzW8pO+C6IlTsoHtjklQSijGOG7HbXGqtgMly0ygCpByoahMydgzz8YdGEgda2JMR/XolrksQWfyLpSQzhyncQGKjq/s4bNohHvHmV+Xom5ZWfPi/UxWZkPZw5BXVWQicoQzWnzdN17W+fU5DEqp8fgWLrkLTgHQJ/G6CEwM1MEHmO17wlnYE6BBvMu9/eBvsUlKZmznUpvpwqKpnCT1bA9ouZfrgwDROylYzPnWHPivA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 02:40:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:40:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 13/13] MAINTAINERS: Add maintainer for ITE IT6263 driver
Date: Mon, 28 Oct 2024 10:37:40 +0800
Message-Id: <20241028023740.19732-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: e54cf86a-d3ee-42a1-6c27-08dcf6f9d5dc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e6nOeLo/DkIV7VMDj1tH8rGnq+M85c6AcwzUa1fSmUFSFRS5OpNWJ7Gv/+/Z?=
 =?us-ascii?Q?i4zL7R6qJXRRy2bqGuwn9a88orRCpxn5+RIHTjkkgNROmRY0PqW21pP0O/gU?=
 =?us-ascii?Q?g82fe8Fg4/xi0G3NH8jcASe15RnLiH3eInv5dfTNRsvPhBPJ0Q8Z/iQOU9Eu?=
 =?us-ascii?Q?SHfPPpoIkpzdvUsYlOU3Y+F60/2L+PgZob8Pp+U2baSOd0iwTa7saXzmy9GC?=
 =?us-ascii?Q?4XVwgTb4fXdG3BQSk0UGkOluQiV3pPYJrT8Z7Dki95UX8Mg8D2MVj+KURtNK?=
 =?us-ascii?Q?e6uawesQGrB18qHcjsTt2g9X5wuq6wGMJHeoRwAz0CykLAnItirH8QHq+wX1?=
 =?us-ascii?Q?D2Ts6D0ILw8T27OmT5zyQaWE0/C+EbKuJoa2/1P73UVJLG72MizScwepz9ZI?=
 =?us-ascii?Q?4jRBUF61o8hyZM8H4isz6Jnj82KDuyPRxGwyIx/ssrcje1PkcHQ+yv7lpRwe?=
 =?us-ascii?Q?h0EiWNloX0ismqUn/qPMXLnVa/OXV8H6qYGLCbPrZCpX1RefY8wJzx0Gmhlh?=
 =?us-ascii?Q?T1qt2PZuBUQrLHvxomUHuH26pVWzFShaxVaf4/bKEK24VSZS9A+fJFuXRqG7?=
 =?us-ascii?Q?RIphAAju1oGXxAB4kcHbdyJrf7NwgnY7lTnl5K8qIm0/MRPZ3DhKN8c2om4o?=
 =?us-ascii?Q?HkUz801HayVbSphMAIxtPCOVHLP8nN34CqF7RmTXZKdTjHrx9H7NaGUZM0ka?=
 =?us-ascii?Q?KIJqcqR+FeQoTuOkAHmpepF/gBvZmonuzLKqY6Fk07S4a+7yLMRdO8uq8GX1?=
 =?us-ascii?Q?5ntYZAASOfyCQ5vJ2SuKkVEugz5oJkNrenF8bVpBGaOVUyo+wq7l2RszjvJR?=
 =?us-ascii?Q?7P7D4NvFaL6hoUMDJeAbH3ckKAq9pFebc/cqVv/i/erPxE3vkfezr88n2c7m?=
 =?us-ascii?Q?XgZwrX9RfLql3BbOdV9/zGfDJs8xKJxqJt+Cvm3Dya6ycsSLYyUuOYL9pP3i?=
 =?us-ascii?Q?TROK9vEkA0AALeBRWC19TeVpn2SrWGz0FpzgsGEJQzmiiI4qVuWOUWLUl1ie?=
 =?us-ascii?Q?P8kDOAFVMjzOz2AorptoasbNSg3MZh791vhSaoxKHWbjG58C4uoFlzBQXho2?=
 =?us-ascii?Q?Y3kCXGBK7eez2S7NZ9QDLvh9EarvZMi4ruvZHwt4RtBMpl8ciGG28FODDQkH?=
 =?us-ascii?Q?FbX2b/vSWUjJBj3XnsSAzGKNBVY7wfzoCAD7zAUreEt+dJAxgmBPNBj0CoAN?=
 =?us-ascii?Q?1UwDEm9UNF6tuQxmeFs5MY1AIyej3ef7vHvxfryBsp00mfkHjmTkNPDA2fZk?=
 =?us-ascii?Q?n1QIRJlIbk4VmpvX8cUFL3Pr/Ga1bUfkSAc2XWbL94Qv6fZJkG5NhaCKrQDw?=
 =?us-ascii?Q?eGEqtIzSEUEUQLTU1+ax8Xk1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pywjYZ6P0UuImojKk99az2CSgE9gFORQlfere24iew2zGU7ORp1pcPQNEwas?=
 =?us-ascii?Q?66foyO/unAWcWpdymTfYkOEYOmKiQNTMuPq47BVQef6ZD+xrN7RsulXveWwP?=
 =?us-ascii?Q?wPb4lCg95OZmS88p9hkoouae6yQ4qLHbCCuxhBiXRvj6H04Q3A7kvAgTEKFr?=
 =?us-ascii?Q?b1XkSB859GQBA4BeWs94IJB0T93Zgb5nVi8fnPSa2BZvTbseTkoslkjkaRiR?=
 =?us-ascii?Q?YAO6xe4acnef84RuM15ZY9zh7E8fsNBwu8uGsMfrVESXFHTa4uqSrvZsvIsK?=
 =?us-ascii?Q?ULNTDQV4wYKMk7+MGVby9s/FNVjxmvyNbeK0dFLvA1qnLDvpLIavA3jE2UvE?=
 =?us-ascii?Q?h7JmJtwjyOTHIUCj0RFC2A6pr4aO9WFQ8qpg2iDr8YUtPjpcaMngsiuodh+5?=
 =?us-ascii?Q?HjmCwX1a2Aw/3PE54LmqyHCLbDLHysrr9hGNXvUtcihk93JAfhD/gOr4tz+H?=
 =?us-ascii?Q?sRTXXAL66Etkb379oGWePwOm1wckrQDrT99avnkidX591zQQSVRSGI06iJZg?=
 =?us-ascii?Q?ClwO7ZXSip79THuiLjUqYLye8tDGJ2A9FT3X3JQ49esKt9l4/7mM/MzYyk67?=
 =?us-ascii?Q?wEdQAU+ysf/VgiNE4s35klSeKY2Y1W2y67AT+7LK/qLfGmCbbwZLUQNvHvf4?=
 =?us-ascii?Q?kB9Yl22tCmCZdbRYC7LtFXX0sbUPTwrS1aNz5BHCrqxpgY6KxGINubCmYx38?=
 =?us-ascii?Q?yntYLbJZX8M3QaOdoAlUCSbkWt2SVZppftW+bAvQRinbnCbbHttFHojOK6m2?=
 =?us-ascii?Q?QTNFRgY1mMpQpDkl/zuHqHzM//AE9Jjh5pnhXEwQHyfX1rTDw52A8xqaIOMw?=
 =?us-ascii?Q?ChXTBtgP5Rz7SWzN8yok5ZYIh1CGXRZkU+FF37lr5rkPUkhBsPU6HWwHZauv?=
 =?us-ascii?Q?FYNK7K6DWLnjl91Hf82+VQWIfRNexHfrC2Fwb4qId6Vvz4XktdRWRrHM4kVx?=
 =?us-ascii?Q?HJzhRa4DEIXQyBo+maZTt2FoiiG2+RD372iSarMuhv3dzuTDCQc6tIAmWJ0C?=
 =?us-ascii?Q?FP9gQDGzNId6cvMw4h06v246yH/eQUk20E4g/lj+hKZVJas/PmezKZTsZahO?=
 =?us-ascii?Q?7pm+RgPqS7TUxd08+HZDhmc9D23V+v5kIzwFHVxpBnft60Rbl+7CW/kTDDcZ?=
 =?us-ascii?Q?GfdsrHhih16R+kmsDHXs3zhFDbPhrI9nop6sivWG5NljeAdW+FlSdk7gXf8b?=
 =?us-ascii?Q?nfVLsPBH7o1ZpHSqO3MM+xMW7ieA07yCn7TKTfMCY/UU7LJNIC2q5T71N0FK?=
 =?us-ascii?Q?2UEXv41QIEAsuqp+RFK8/89rLS4fU8EvI+f2SsNJ+t0/utsTztmRRvFJGnlW?=
 =?us-ascii?Q?9VAB5ABqtFtM9XlcfMZ7koLRlPIN93muyCjmuK/8Zv0YQsTSD11lBhZCj3aV?=
 =?us-ascii?Q?Uqfgsz8qBFk41HDSY2aWRf2u6PqceOZvGQGe2vOxhM7TAbK+9chzWQ6xTrip?=
 =?us-ascii?Q?DG+24iZNG5CIPyNbhgUlxv60+krIBF9/aLzZrkvI+NXU/JXh5bFM4gFPyQGG?=
 =?us-ascii?Q?gzNex1ERU+Y6bksfxTeLk+3JS7Nai5BccOEvWdWQ0mTAetHJIaESDGkg1IXd?=
 =?us-ascii?Q?en/cMCxksowWdcB1iu1fSoRn9ElLy9/b5ut31uLj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54cf86a-d3ee-42a1-6c27-08dcf6f9d5dc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:40:07.7947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFe2yZHf2jQO8L/VjjAhBekkwnVTNfzEbMREKwUL5I1OAlQqk5hMzAw+BXJk7j2nvIhCJopeB5Ra+3u0dzyKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902
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

Add myself as the maintainer of ITE IT6263 LVDS TO HDMI BRIDGE DRIVER.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* No change.

v3:
* No change.

v2:
* New patch.  (Maxime)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a858224b59d5..615ba0e905af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12234,6 +12234,14 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/tuners/it913x*
 
+ITE IT6263 LVDS TO HDMI BRIDGE DRIVER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
+F:	drivers/gpu/drm/bridge/ite-it6263.c
+
 ITE IT66121 HDMI BRIDGE DRIVER
 M:	Phong LE <ple@baylibre.com>
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-- 
2.34.1

