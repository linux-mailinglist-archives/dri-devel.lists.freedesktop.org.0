Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DB9B0701B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF59710E709;
	Wed, 16 Jul 2025 08:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T5KjqNTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED80010E709
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j90T2WNrS6+fAp983JH4QrzHc1aX+zw6yrx3B38kQKh1bTeIOY598SxjkPW7MsleU3VSOB4QLVoJYmDDzcuixnOSrsDm18mhVR8zwOlMP9IUTuAQfE4PNlJcNLhxFimTmdVrgD6Yyp5CluS0R8lY4+dmY9vd1RTybdMNdEQ0NxdByApPfGCdxoKE2Mlda/+8w0jjRkzY5XWo81aAxSOEwQy6Rxsdvhvg6QXuQClMVBFwRMZjlWCp1IiK1nbdp0P2uCOkcUBI1ue+yNHMj3Rw96iopskp2ZjFZrhvxrGF/ijLyQ7xu3N6Jdcf8qmxZJwlV6nAs2jCtfD5x/eyzOxoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WFRufm9XWQHXiZrruaL2M00luClh62z12qadxD2rWk=;
 b=MA/9hdKTJs5hKy09ISburBg3fRWnafDGepcB1h1mOky0LQdi0G1hCfJjoL9j1+7vC8SGKzrlTD9fQTuyQCqkr4vPHahMb7OZrlPDoRqYXWTqLzulhxfEnJ1Wghrv18xpHG13k2+lrHFir0QQ5qIU2pxxaBBnV92CVoUewrFcgs1BJLgbHUayvR8SgGV8X0FB7Q1mdBuH46Q6nNo2jwtV5QNd9TytcW5Dmo2cL5KHDAszB9A5ZW28DdAE6egUh3MXs/3iSAePyUgXQhFd6ZYBthYULmoY7IbZb6hLB/pxgiFBTAlfHGs3+a38PaM+f2lOBg6sKUk1GnHy/AOt4UoLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WFRufm9XWQHXiZrruaL2M00luClh62z12qadxD2rWk=;
 b=T5KjqNTaNfzXtOTFk2Z7SJ7sdleAEmg3rM4OVGyMplDWWd+1cKfkMQGOxmY+O+zaNmU1jthREW1o7h4N4hWteQYvo0RslblqcS+rJpYFLBvpHgZuWxtL9+WwqekSCZ4inqGTDSzOfmGseWRQjl0g3juiz6SG6mYyOs8VyV8OemzyZ9K403iTzIgv1csWD+Aw686BVc6Fq4GwBnVkBdMAj3hrtxH6goi7dgZ5ixiACRdN2uXbybyH2HhergFo2o5L0Taq+dTbWWVdTaB2Alj2T2fA7THubslV/TTrZt2UTzo79i3NwqfZB9I5of3ITXIiVQZiKE8f0c/VoQvu5xQsbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DUZPR04MB9983.eurprd04.prod.outlook.com (2603:10a6:10:4d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 16 Jul
 2025 08:16:11 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:16:11 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, Frank Li <frank.li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] MAINTAINERS: Add entry for i.MX94 DCIF driver
Date: Wed, 16 Jul 2025 11:15:14 +0300
Message-Id: <20250716081519.3400158-11-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::10) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DUZPR04MB9983:EE_
X-MS-Office365-Filtering-Correlation-Id: 941ba5e2-c512-4d2d-d5f0-08ddc4410647
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DckjqvOyvhme/94kX6ytmQIFicpVSwsJd7C5bHhipd17e3XQZy0ypDINp3iM?=
 =?us-ascii?Q?aKt6W3t4Xgwy92u6Kcg+LiuGDIAxqoKtNgs62OTGtbF24VOnvo6ZU/0Tafus?=
 =?us-ascii?Q?d0eV0fWXRDw2L/3Lz5Zm1SvaD/IQ8xEkwsmIvCkXC7rroYe/wB1+oUMGc8qD?=
 =?us-ascii?Q?0m8mW9g+L9IwPxobaaSPIUB6MGwN/JRguTvXZrcyiVMirhJGEeoP4+ZL6esw?=
 =?us-ascii?Q?7m5lwymI4495GcgUPY3y2YDO5I4jMoFHlts/BLReKqyekmDU8vE5t9YloqrY?=
 =?us-ascii?Q?yugvdp2EfWLxNzoyq2Up+AozkllUv7kZz7R+icbUyhQLNNb0gieaN2Za0m6q?=
 =?us-ascii?Q?R28cFgxiH3NRr2rZeDbmNIvH1OwlB1yPgYIPyCEFjhXwnR9k4rz82rb92ajz?=
 =?us-ascii?Q?ucVUr0+0VobW6xQRW9W8T/k8xMU+fFMPBlZW1CrSrWofof0QUS0ubuwiE9yW?=
 =?us-ascii?Q?JlV8THMy71BMtl5I9gUZM0/yKGmQGbiymcSQfk1ppNxuQYkcMcihBi3XLSJY?=
 =?us-ascii?Q?qcYG8P41CTYgbzItu5OQpYHpEUbSYvSnFGN1tgLUmJMj0d+42Tm17Wyp1cMF?=
 =?us-ascii?Q?8btuWfbVr1wmGaxaXwFgxahSgiuipKy/FoNppHPfPYyb11fQpZqtWSX3kN9B?=
 =?us-ascii?Q?pctdSWf0az43bmz7VbofvITCyNCJgzyAJhoCUleTTwvUH9wVhySvKmQovNcn?=
 =?us-ascii?Q?2LFoz57E9er6VY1W61ye40Pzt6TgSbHRSQuQaUO+GXWCEjUASGSy3PwE0wwj?=
 =?us-ascii?Q?rt1FlcTffi5+ylaFJvKmGyq0CDoQ+SgDguuvODZpbLON5PE4L5vPZPKZnqu1?=
 =?us-ascii?Q?etI3aq7ngJ5O4/hn6hEBV9wq2PeDoAcmhy8QZFPshe8XFoJKyqoV+Gg9Y3UX?=
 =?us-ascii?Q?jfNXdyaXrnC3+1wtPyLTBlVCSTrTwn2y3W3jvFVgy+lIzlhvxic1FcU6DO52?=
 =?us-ascii?Q?kf00jGpNN7nylHN9nnrfdQXaV6+V+EUo42odYyGOiZi5JrBMg7a/30RSWpAb?=
 =?us-ascii?Q?X6+nOI5jtSgEfUS8gZ4cnWDb86SDD6EiIYwzR+75msfeWjIbkfm/YcsZ42Gq?=
 =?us-ascii?Q?y2WonftqMR8iLqzEIKeaQAl/5oFiQ3Xsk1NrZA63BSWaHXMI4zc8jD0p9aVS?=
 =?us-ascii?Q?9mks5dvPiuul22TkIYdNKsGk1QUrl05EnCc1XsNFUmlLUtK4+Qy9vW0zRiYX?=
 =?us-ascii?Q?8loE0g29JX/pF9BXXvW/RjLo7Tvt02WVmYaD6J6asRQoxkCOCa9/23qIdMIe?=
 =?us-ascii?Q?7omTOkNhmJlqZkYprtfFjYBtC5XznoA9tdAcef/FsDYW1msxlhC04np1OsOw?=
 =?us-ascii?Q?U7vziWcDezw5aN8yQmEnSXTgEj+00Ab3QJG3ODu9h5kFlEK9X1b/be0Fw6SC?=
 =?us-ascii?Q?KsPd93U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yBlQNQhI4WAslgfILfcFcCT6f+UCqKyEX2nauTjNVxZEQFTWMcNnBHHN1ox+?=
 =?us-ascii?Q?b88eFCi+0E/8Z0bZq3lI+ScffhQEVDOsMfpPhxGXBIP3opr+unlYcsYKN9bQ?=
 =?us-ascii?Q?hvCArT+Bz/3Mx+bHbAB6p3+2Vuh9gTKixOe0BfxtuaXXKjFztP/38yN4f5NT?=
 =?us-ascii?Q?MsuHyKouTnbfg59yW4RpPgMlsCsOezYGpxznZpPMsoDhnFzOZ9A74E2KVy2r?=
 =?us-ascii?Q?ydHOavZ/Ei762UUQVHY0WGyUNlAr9k33qTQSII4k9OwluSVGxfKmeEALOpzf?=
 =?us-ascii?Q?VLad8uRTCaXz1oNGDQgFF3o2XWQktYGiR93079DvQ83HczERROZr/6J+QyDH?=
 =?us-ascii?Q?cC57xxFz20WSobkvoGH6gDesigXMn84yYcpkklEeSrWSY8vJfmUNIKlzyBON?=
 =?us-ascii?Q?deT0jSPZk9uRKHTGVi9dus94m0cy1FcjZ9PxodB2UBNYefTTcBqSW7q+5WYq?=
 =?us-ascii?Q?DN/pzryB6YMaJFfT7qvvOaE7pIhfaQKtWoe+kuuxNDGJJXKTk6Hd6o4VuHD0?=
 =?us-ascii?Q?UEwJD7bLaQ8hXQHrUA0XKjIKHYeb0m9psdupaFAenDRnhlES9tMlnMe/WH0X?=
 =?us-ascii?Q?ymez9Y8draKZzOP51mnQ0DfOeCIalw+4ChY/8wm7v60pcplY6MQL1NDerQWx?=
 =?us-ascii?Q?IMld0h0mD0NlBbcLfTFYttzp3RVAfG6Fl/tV4Xtnsc7r2iOYMyxnJTlv9dy4?=
 =?us-ascii?Q?mfY/FMNZnzlm4OkxpNLbQFgLdzT5mKtLH1Um0Q4qx5/isLQ9vDkUaHkRS6b+?=
 =?us-ascii?Q?HqD0heZdeu5b4R/3gLiK+uiRZKEqo4rrG1FNVDGmIlphFhTi24yWZNjsiCBT?=
 =?us-ascii?Q?f4xm9Sg5bG5E0b28XSgal9VsCcly3UXhPL6/MRrqqjPZ3NRqeLPMvFJBEgu/?=
 =?us-ascii?Q?ifQKq6bLDQlAIl13mbbO9gXCbIYpMPeGQMuSEvK4KOhv4+xXcD/5217tnPoI?=
 =?us-ascii?Q?rOkdTPKLvz0o3tux46L3KikjsuO3eaHjDsq3d2ggZLGqs+y31s/F5NBh7ErY?=
 =?us-ascii?Q?YlfX6PeCY5Y42tnM9A3GdqFdYgo+6Os4+cx3nzf2iTZ9/Fj8+WzdAcXZSZBZ?=
 =?us-ascii?Q?co3+PLYc1KIWXAOrieOmsjf+X4WQX4cnX91ODCt+NWKzE9r/n7UwETU3SoZW?=
 =?us-ascii?Q?PHVMFJWtW7YAMfQgfgOMQOYfYMjiWIgA5HVmSA2NgGzUZul52dGSWyV9mH2I?=
 =?us-ascii?Q?49642v7hR0gFSfiHZSe/siMKO+YuWRMYdMzBxg/L1uiibotZAvewVKcPXSYn?=
 =?us-ascii?Q?SsMIGN4/CbH7uH745mmgJYLuCUYi55MoakrQeDlkQi7D0jfCIpJ97zSeF4Ok?=
 =?us-ascii?Q?7sgtnmxFR+kMRWRMR7dn/Tj+5vNSOC14r+vyeLvOigSF6e4FVgDse7mMgNcz?=
 =?us-ascii?Q?N0nFaraLz/LkhEh8I0woT0eF2zIG05I4Km+c8aAKvBJtNrFkB7rBRGPdmtPu?=
 =?us-ascii?Q?H96fep1IRfui0tlJeQTEtDPoKA0zeyN9tmIBgiFsMeQb19GqccCxoBPL3BOE?=
 =?us-ascii?Q?Gcn+oI77vTKB+ZAtZQnfSom+wvf8iGBP57KNv7liWuGqqUCkP6PB+FKezIQQ?=
 =?us-ascii?Q?mO5GWvsFc+kqMtk2tFx/o7M6GE3pAK65iKH7Y1lcWTsgzadSO1xbMj6uYjBX?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941ba5e2-c512-4d2d-d5f0-08ddc4410647
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:16:11.6585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKbt1Q0cEMPuBQd0DSSaRh6DiSM8NBa3a/xle2RJftSu6DIjElD+6KdJCdVzUA4UjDOTciBO4/MqsYrjLtqRgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9983
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

The driver is part of DRM subsystem and is located in
drivers/gpu/drm/imx/dcif.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3b849ed34fde..89ce22c6a8862 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18130,6 +18130,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 94 DCIF DRIVER
+M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
+F:	drivers/gpu/drm/imx/dcif/
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
-- 
2.34.1

