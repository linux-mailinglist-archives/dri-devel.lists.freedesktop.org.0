Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8C8D290C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E9C1126F4;
	Tue, 28 May 2024 23:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="IG7MjNCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2043.outbound.protection.outlook.com [40.107.114.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB33112701
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8gaf1zmgsbGcuWfRKmV5O7ZBhRdaC5HU+lFSwNzMJq9ZoVyUFe5lN1tIaRuMFlqqGAMN6WYuHrrg/pvn0s13BhDqeFfuBBaZlgXt9C4CT3obP23Ybmd6RyVmItrQdgZ2MB7hwwN7Xz8anwUchC1doggKdnjEGTyAaH8TOPUosIRO8UnH0CJEQP1fydfn73yvyZLbts3VlvNhP/6HHKzn3rIfaOpmxP7yNdxgX4tb4qsLaVV0UGJWb79+n9wjRlUXUpRRa0QPLYHu6rJFQfpfXceAMehzW/kXDORREjmW5aZmd9RX23yPxjUNqq0ZPlDdC/UUkP0pELR+3se00joeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9l3BMOkzLVKH3aXnBvHDmIPilm2JHV1P4tJXZpRq9U=;
 b=X4VYZgzRIzCCkcWu3Da3GurPPRdNJOWID5BUlD8P5Kwv7Fn2ZmRihro1nKUcKDqjyQXXR5Gop8ofldm2qUDQwMtai93I326UtFaVgaerdeAUbBcXf/pGkg3193bDTk0yYoP4kOUZ01oOznajCOntpVuLzJh97Guj7p0DAGSQkjh+K+gwu2kJ4yMyYAkKTctf0ZTruDPgMPnKdrs9+483Uqdn4EsH2I68LRFYPB7u1CWRF80X9F82QwQYdTNNTPt8c3veTCEbzV71lTUohGyEBoH96zr5dJseB+IfbEullcHgBoc1aFgvZogLZlKNJJRCkO3CsbaP+n7em+1IBCD3ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9l3BMOkzLVKH3aXnBvHDmIPilm2JHV1P4tJXZpRq9U=;
 b=IG7MjNCpMmQ7/WckjygWexydWNp7Koj1m/+1047bM1WT+VdJBlb82Kq9z+cOOqjx+giz947gMPqPTlkEIDZw0F2bNGAGgjkB0f037iatjWvAO35WFdbd+93/g7Nl4hRKU/pAAfHP/4iW1Q2FwL+pZiR/SAuVAUad5mLOw3C/Vsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:56:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:56:00 +0000
Message-ID: <877cfd4hkg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 8/8] fbdev: omapfb: use of_graph_get_remote_port()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:59 +0000
X-ClientProxiedBy: TYXPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:403:a::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8c8ded-e967-483f-10ce-08dc7f71b97c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GYPvpjoCk5H7NGAPAuqQdShNYtV4f6IJZ59tBSTG0BfNjq8WDnIcibcWUtDU?=
 =?us-ascii?Q?ZCEy0y6SwKVvLMn//equYm/hpCkT54vh+PcHAZx/UcwyiNnOdpur27M71l0d?=
 =?us-ascii?Q?K9s2/oWrj+td73tW8j+S7Tp2Wi9q5w59bCPkpHBEqT3s0c8O7w6dF11DrAt4?=
 =?us-ascii?Q?wZymBL50lyrSpN/qE8vAD7jQ2EpuhpmFhUIa5i40ECXgCNGiI55AuEyMcLbR?=
 =?us-ascii?Q?gNET3qkAbzGKrU6jHqu7MK4tUAM3/1VHU9YR1DH5fZEDppr19i696nvBQR5O?=
 =?us-ascii?Q?co62vFdD9/URUILf33IOPBCfPrtJo4ZMmG6FvB+FJcekjfhO8R9QQZpVQat6?=
 =?us-ascii?Q?92sXonNoaXhhG5zU8f8xhhc0U3BY8V1IuflV2iy5bF5zKCyj7wAFMsAiYP+f?=
 =?us-ascii?Q?1sUqkodJKBFYmXtuiQKCbW5T9XloCCfyFw19CyKOrrVzzU3E7xgwb8OMm48L?=
 =?us-ascii?Q?fOnllSXqo211A3+XYl+tixUrWmIuIz5PVIHy0F3G4hSD28uhhfH7XIqK5zWR?=
 =?us-ascii?Q?+T755hO5rfSoIF4ZvTTu4PVc5fbUcXAMX3ns4bcV97XaE0QEkLRkPOmlSXp0?=
 =?us-ascii?Q?FHkVTInzbR0Ci7DXE6VjJ2X0owUBfk4Y+hkZFLh+Lzl1+wpmDvG+oB8WXOjb?=
 =?us-ascii?Q?I8qDAE33tP3R00DxDMOHEfT81oC89BAu6LeSLoBD7fowwrG5TGmo9TgxviCm?=
 =?us-ascii?Q?znJBWHnB+bH3zJ54mnGUthD7dxvzyeRenh8VDOKTeznQskULpuX0ap7Xf6Jn?=
 =?us-ascii?Q?+ToAAnsFcBS/nBmnZac8nugU8Bj+M8GXpjfNjKQu85Tld6dNpkSO+Q62hRGi?=
 =?us-ascii?Q?c/OvaY1ZEehkBf2p4wzDlosPyvkjSgtsTFEznsjVwmJVDNYO+IzF5t3lCbtN?=
 =?us-ascii?Q?vWvIV/809IRPq5TnLYs6zH6LkZFhgfrmJcz/7hnakUr6NOgyQNU0X9QzBmG1?=
 =?us-ascii?Q?opZfWiE+rNB6rwCyoxhHVWWRZeJkVoQvsk3rMl93Bv1mNzX/BKYmLDQBfV3M?=
 =?us-ascii?Q?2QLQLTYPwt8i+b8QuVSp8qc8vx7oUz13JxoEyBZJgyhmUpz0clJLR/15+3C8?=
 =?us-ascii?Q?/W7cqwhf7zEI4z9EOe0gHHDChRL3ZFAwWZzfNYAG1hwG1au2tTrMNyIQgD/V?=
 =?us-ascii?Q?cgQ3+1PjqwR8dt+oz5iAXpLBriask0PJUllO4o/5jV4myv0T8msENxGNy4Ve?=
 =?us-ascii?Q?K/aT5pUycNc5u010aJsMS2oEySgCi1XUSlD5iE9Ohn/GnFdKHBxIowjKTxBR?=
 =?us-ascii?Q?Q6hy0/VzTJc5x1ASa4YQrSCL53QclRNVcxr53vSSwlvnmYP9DS/eQr12c5TX?=
 =?us-ascii?Q?BqTjZJKDgANoGxolH8IHniP3PNMyCUY+l40D27XBMNzrNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n4lJh6tRnL8OeUwbDoIJUPiu3h4u7O9V7WdK/9jnokUJcmbgUUqPXfUZI1Fe?=
 =?us-ascii?Q?Z4Rw7PhmsJqrkbQ9/gJ042T4VSx5BIWobP/QLNuEOIat1amEc5CGVBrboDHm?=
 =?us-ascii?Q?ddUk2ZCb6i1OKTtR0Rd6NOjZVneDCNLw+Ge6/XC0Wqiv5OZzOp2Z6rzqEjQL?=
 =?us-ascii?Q?ew6A3H7TGOQSqsMuNAbkaM5DodccPfHXtcxOypBqTPSWvhmG2xOGXIFAzJKl?=
 =?us-ascii?Q?b2QoJhCClU97HjRPyC5pQPEGVNPCyyhYFzh0jU01c2v3wk4wKN06UEApBYQV?=
 =?us-ascii?Q?fB2zlXBqleFgiDXZHxqlOT1ewXMgLUi6n+j2av6Kf+6hjzCISDJKP88wQvtA?=
 =?us-ascii?Q?WhZ+ky728r2jRtApTRhVECV2ZNmX8yMEvbJ4+K5VCtA7Yv71NGCY4yZ85Ztp?=
 =?us-ascii?Q?uWyIjTE8NAG7W7K4P2m5JCbtubo0ZzDj5aMLDniJZSjF0eCo0mah1vN/u7El?=
 =?us-ascii?Q?6RvsFmFcSnwVSmhlW6zkeZQclFVPg8KL4RpQUyiYoq5HOLvB9xJqe2MAC/3n?=
 =?us-ascii?Q?mXD66Ocn1hmMV3dRL8JOcSe5kjMQE895bmd7cDNiQ6xXOugLQMd4rNe31nqa?=
 =?us-ascii?Q?4y8Ma1gA9m5pvVbRZSYJDfzlmQXOQ+ZBvnPB7m1UGWfvlFIxtuqQd7WPGboq?=
 =?us-ascii?Q?AmPx9FCvhfLZZcjaWbuxfD2cfIYfg34N/TUpDNDS6uV8PcwqRwhc49UU3x6h?=
 =?us-ascii?Q?+GyVV1P5kRjwTA+i0t3Ge/uU+djXw8wTSEVRQppKVbcXVjPW2bFV6Q6cO0gA?=
 =?us-ascii?Q?TCUQnqbDbq39FREMSl7rgmya4gMEbYOqzYAR71u0GpdJ9+Symm7kQ/JHey4x?=
 =?us-ascii?Q?q43U/4ljEVqYJ+ombNL4/MTeITf7o/uIy2DuhqthWEuIawkXK8jr7a+CmQ/g?=
 =?us-ascii?Q?Rvw4iZfZDk+Y8pzEOavICTL3H5ukrN/NGXrAg4CRae2nWy3yHrVzXetNdLA9?=
 =?us-ascii?Q?mxf/nU/JjHQmyfSOeiW8pXVws2EKRWdCXlgeUbglOLB3PIXhFTAI8TrNqtjn?=
 =?us-ascii?Q?DVJP4QnJxtHDdpbO1b2mS6vLRS2SJQhV052vIsmnOVh2L7N0UtKy4A/pJWM0?=
 =?us-ascii?Q?xo5GkdGpBc/kDAUcFdG+OneaXZun6IRtk+6+9/lKCHpPALTpx9fF2YUCn6Jx?=
 =?us-ascii?Q?vh1lJayWwwNncb9ZV9F75WVa0EHdCmuB4KmWtZ+DOrEJIoe/1Uear9WFWL8F?=
 =?us-ascii?Q?QAT2xFKarE3ISavOhXlaTsdgsKEMEytmZ63ARy+1m9M1tMRY9XEfJwjAUlc9?=
 =?us-ascii?Q?J8B/KdAx0lghLPmg2M9ThwLiPuHJtqxYkQfiiC+tRc72nllGTjtKdnmPqKki?=
 =?us-ascii?Q?zymdjrbfgAClIu9T+eUPv/WwCKKL1p1JrX4UI6qRVOb6nd4oKslcpCr1SiZD?=
 =?us-ascii?Q?BsMdl1cteNmAnb4vQufu+wpzFEvNfx0UgnTY7mBl5xdjzPBhVTv0p2Nxr7Hs?=
 =?us-ascii?Q?jwalKsxmtKFTdNvNw8jSwxw8dIud9NOoHxYJo+SjwnTozzWDLChn++iycz3h?=
 =?us-ascii?Q?xXax+iU1f3w8CCo3LUEQGayQOyOs0VXPkXc+QXaX2C/cfvZRVywTFviKT3Gc?=
 =?us-ascii?Q?gz0hqmQC7rIgQd1iZUVbzXKIv43TobBp+MoI37udfk7qf5yF3vtLWxcldFNB?=
 =?us-ascii?Q?lGyDknA6PFwuWcWbJ8kB61c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8c8ded-e967-483f-10ce-08dc7f71b97c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:56:00.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+oiRyB4aMi9pB6V1Gdj81IY04GmhQ5muy5IC+GkpONhd+GqiwC4N6ztGuCgQH2RY5ONVmUgRVFuIAYEsVgr7Ll/HrU6jbewFdHUb6KIfUJdV3Lu/rIHP/Z5/6Y9dLGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 14965a3fd05b7..4040e247e026e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_graph_get_remote_endpoint(node);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.43.0

