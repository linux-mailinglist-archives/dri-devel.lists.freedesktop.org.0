Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C72590A107
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 02:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30A710E0DC;
	Mon, 17 Jun 2024 00:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="TfZoGzqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2080.outbound.protection.outlook.com [40.107.113.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FFA10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 00:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7SOa4H2TMtvYcU6NY/i8vSNlhHdvF7KHFT6DsKwGITew+kf7mnsF+v/USrynLhcNf8l1DNuA9ScCPj1h8JIn1hSpEnoa/BSCajsA6x35Is7t/IetA9DRbdiRiAreogiL94KET8EUjluXBTk160Lt+PBTsLApwUj526k3CZf0BQ7JsYcTbqm+ylaDxlBcPUNYWDz6uErEh7cSybKJIExZ0aJvKkVLlxVF4rcQ9FObsNgOyUkaUwIyQ2vv00HUCGsF0pzWqC/UboGLjWJgt4EFZGO3+Wv/dtFfdIbdNic5q/fNMoMJMl8eh1I5+0U31zxCEgizqlBlxwF4tNk9c5uMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=FfV4CCvBozANc6QgbSeYcLFCyvScLJaDUbtVTvHy4zpht8kIvvC/pAoUCRXByTramtI30APZSF10wEVnsj634pcfnVUXwNmwDvBnhSZNNElNPY57/uzocTqUHwNuSYZK8FdGhbn/hbFmhz16A5sXLNsXsbK75Kf3QR1g08M6v6by8TzlGWGPvn355ik6WDAiwVXDEwOnpMQLiS81weooRo8QibIyHxBeplEKrbyMDvApBBpKoLQGix7qHNmIMBYuIvR6r2o0wgqEH7Oo7Nf44mGYiagqI/VKEhTh3y6+odby06SRVAVuoC5c4icd9KSlEUa7MljT8PK5696JQUylTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/hA+X/NDL2DHVcXTjFOx498moK6jPHb9pGdUrBCLk4=;
 b=TfZoGzqnf+hOfiDE65p9ySrzzFergUbD1tbXuN2NOiBf4/WEDhsKNilBHBFH0cr6wYmiEOIzT6lAGTu2TkxUAX/wQh8uhx9SwobS433TRHcdX11ojJzjE/FK1tDxTX2y1NysdjU06VNuNO9uMLGIdoXOK5xFNOujc4+xu4mdTKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8560.jpnprd01.prod.outlook.com
 (2603:1096:400:13f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:58:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:58:56 +0000
Message-ID: <87sexcs7u8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 resend 2/9] gpu: drm: use for_each_endpoint_of_node()
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
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
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v828s7v0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:58:55 +0000
X-ClientProxiedBy: TYAPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:404:28::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a8a0b7-148e-4db0-cc5c-08dc8e68aa35
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rlBaNAuHjDmc0S/6uZE8pB76olTB0wQehDhVQUYEGgysFrr5m9jhvZuXBVQp?=
 =?us-ascii?Q?dvHKoyotOdtkdM/AP19iy7ENtHlAuWhrlSUwshDn3P0lhRLGvv5DWwMOS1eo?=
 =?us-ascii?Q?Nr/0oWcNUSN9yC2E1+v2BeITM8ATM2vikNIoY8DxHm8ITuzjeU87pLsPf7cp?=
 =?us-ascii?Q?v2r1iIn+VyCjSdT4fWIElzX+cCQSmkXKGrxi4JNs/aBsMe2UXwoQ8vLoBKqW?=
 =?us-ascii?Q?A+jmaQZbmgVwTFZfFud5h8U2qDR4vXIqwg8pavVf9CLbsu+0pOqlrIlxqo1j?=
 =?us-ascii?Q?aiFM4bXfZjbkTer9p5n66NxgDBTUNvzBjnufqgmKxyW8A/ssX23BJvMeC/pX?=
 =?us-ascii?Q?AJJOLzNUW5xTjQ6L4YCMQ1OOSnHk5Ht/Rq+zFmaQuyan3eAKsw1T6+VTONsR?=
 =?us-ascii?Q?vVZ2ExqSG1Fz7lfVO8cvGLEYoYyN/f7wY8vITeTUq1iT8u+67aHkiBp9Wz8m?=
 =?us-ascii?Q?hFZVsXzmc01VO4EAA/iPgGGk0ks2ZHHESbkYi0CX92Az4VIIbZj9SEdBZeMN?=
 =?us-ascii?Q?6/KAshyGRyTVGjWtGnr7fmAXEMxL/R3pA7j5AiQeTAw18Qp5d/xap20uiShF?=
 =?us-ascii?Q?8H14S0ZFDKFUQJ2oBc4YofBzyhRB/H2YvyNzvXE3+qXzG8fS/Jw/DWwCOHpJ?=
 =?us-ascii?Q?d2tURKcIg/gMT8U2G/uN7uhISrE8db+4RtNtRBr2d/YfjBYyihlJmKFUaONN?=
 =?us-ascii?Q?Xlrc5gigW/5iYxyQ2t60EEqlIRt+wrJrh6SzBycNOe4Xz4je3WgXjsN8AQjm?=
 =?us-ascii?Q?Hmx1sQYBb6AI0Vq1KgpUduvJtAHyeJwxrHoiLbN/3cTBenVsWt2okdm0zxdv?=
 =?us-ascii?Q?QosXPtPscJxbTKs2CspABoMW/5MFOXNfxccWwIfHPeM2xFGFSbl0Y+T/mhBJ?=
 =?us-ascii?Q?KjGrb8zwhSHz9LoBPX5uY/LBzuZIKVuXxN1PkZCeZVpamKK9lfGvoVVvQC6i?=
 =?us-ascii?Q?1VGwiEpjeMci7jJA4B25RiR+9lduIaFhiUGmBdAZBgxEGdVn1XNEbmoLmdg1?=
 =?us-ascii?Q?M/fGsdpLDAXsKpZhN9l2PFZ6Bz1lT1T8B6chaB9qewLiqcNs7fMlfPFjUPPZ?=
 =?us-ascii?Q?DGfrgu7Axkhp3FED6jHxeeBzNhbYZKt+Czf7uOwT2wETQw056OAyu0QZPtHw?=
 =?us-ascii?Q?Y6FkdNi6+NGZoMqOdX5W0VxKRqgevHs/EzsapLrV2TP6c6NuAuVH/QLITb9k?=
 =?us-ascii?Q?Fa5K4jDsjq2MRM/4zgKYcP3YoCXRM1QLODPihpXd/oSVPDlXEav8o/6DOSbl?=
 =?us-ascii?Q?l3dgKK0VwVZsjbNw+G9D3NOOtg1ZKkyQuXJTZlUGlYfrzmtBOYmMAt3v8CY4?=
 =?us-ascii?Q?Lf+nKj4RyWDO1ig3U5WL4l4JhGv6xpFTfqXgHT2vdz1G1pbh9cv2y7AJpa4M?=
 =?us-ascii?Q?5qvv8JBIRMNStaE+jrpSSnfKxiIe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dlx2UWD/BoKjSODiUcQ8sPmb9hTs4UVm3BJwh8/qxvOU7MbUwSXs7EOGnlqd?=
 =?us-ascii?Q?IxguSZvaADd7a89EBkQvxFLnbgfvI+8UN49WBwgOorgeciclnNZ/uxYTV5SX?=
 =?us-ascii?Q?hsy1YZv6EPQK13GHxCjDtuAp7A+m9eMrt4tPB44U74U3W1+6vsbgtn/e00Tq?=
 =?us-ascii?Q?aitr+BQY91hGPPhDG32kvuMnVy9M0FUBMapYxY/fSGDhQK66iIq8IMY+y/Xb?=
 =?us-ascii?Q?QqRBRccEh7SS35IfTyW83zAiQ2Motr0zIkyiSFnD7SWsgGLcIznlhzYBXTKX?=
 =?us-ascii?Q?bftOO9bAohGcvEPvN8Uf9ixEyQOEG0XGdz0oqW9EVMN7hjI+TQtGaZ/2cuRQ?=
 =?us-ascii?Q?hAE3ePSZJ3HQyPgF0MhTBFWRB/TIv+EKe4zTDSB5hcTPyVVqtkmjnwxc2Z6P?=
 =?us-ascii?Q?l/ELaTNdgWku/aNu6l68PKwPWWPmJpLW967bgwCFkrZnwpg0m4r5M/dln6Wn?=
 =?us-ascii?Q?h/9AvwfYG2gHibWdwyFSUoWCJz8Rs35n+0sulan3XUTAN5mE5+b2obr9Ffyw?=
 =?us-ascii?Q?dIDKuwU7dRucldk0fDvfGYPFwZ3ixPlmho4QnpQitm6Kvy05Vt7LFtV5C2oj?=
 =?us-ascii?Q?KgM6KVT/BICn0cg0C/bgfpETLpchrz0hQhpqaaC264tfM5BP9oHMWi7iEaMO?=
 =?us-ascii?Q?QRGo74V13jCauTIBIcXJuGLSrWrRDhYRSMlBWeHdZc3PsaW8xoohmTr6mhVs?=
 =?us-ascii?Q?x8cOc6Si5iwL+3rpp+DY3hKoVTVBsfds4DOvfiQ20kDqmIIaqYjGJK0O7UXz?=
 =?us-ascii?Q?p8tzHlLmPjBmhfyHRu79YhWutu/QZw6wIzgD4lEAnuHfo7H9hCpuHogbaqoZ?=
 =?us-ascii?Q?KaTFdck0Lrf5+DhqOZdh5bidb5MSSrc8vmfxYJsk8ohzOhqutMH1zhUWcMct?=
 =?us-ascii?Q?9H3wfy4GqhGnw0pw6py2QAif4JA7d81i2cM2KpVR037iHlRrfAoRWtGFGzBh?=
 =?us-ascii?Q?nvrjC8uIofLnlifAHlwEGVHVkAz9yNjGB0cWtrE1nzeIcdTBnVcqO+vjp+bZ?=
 =?us-ascii?Q?NWW5C67sKbtEO5zm080pxhaeDndXnyFMuRTKfChEyiqOj7/PB7gLV6OEvXVA?=
 =?us-ascii?Q?Mp9rAs6rvKdz4ZkbOpkvcaQuGvs7BKPf2vTCx1lSfCSufORFQ1akVZ1A07OL?=
 =?us-ascii?Q?cisE3955QZvI6Xh0nRMc7HF5WMz+hfFT56+36STbRPJD3DoVOHeNN5VhwUki?=
 =?us-ascii?Q?J61Pc/Nfu92iznWgsQ5cwJ1giUCYGdYrHK2Olp5qn085wmODuXqR2bFJA2oR?=
 =?us-ascii?Q?Qk4SwesqHc1w31UvkMd6VLgQ5d7UXlkzaeMUcbqvSzUmAdJ+g9LJ6zdFwlm9?=
 =?us-ascii?Q?MkuXzhOVyRAAYFzENgiluKI9xChMya05m1Yo8Lsh/TiNGXhq2p3YZgCtl5O0?=
 =?us-ascii?Q?VDJa7k8N963d3Tu4cH/QYYQ3+lvTZSNzYGjfENISZ/quCx+rcupXIFso4k3K?=
 =?us-ascii?Q?sNqd3MqI1WP7i+dH0bv4XpxR2Mp3nSDdiv1+Qr357Gfuk1MFyuaoHoMpmkXu?=
 =?us-ascii?Q?xaJ4S0X4Fqy3jn4BayNm1TsORWV6Y4sKmQrehtdpdHRUDHsD2AdPPkmzRQci?=
 =?us-ascii?Q?5D/1FmL/R8ItnDR/qX4e3iyz7WHk4tDyT3bFm+0uMYuQdK8PbET34IvqoLyt?=
 =?us-ascii?Q?M8/AvI+OxHlIaK7BbOrSEfs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a8a0b7-148e-4db0-cc5c-08dc8e68aa35
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:58:56.4611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsoME9YoQXlrGFVxQnl7gwJ6P1rZCOg00rowTkU1BMOG0Zlsq4mJp5XLbYOB5hP1cRn7nDGPPk/qQ221G1OULIjilPgBCqAwhvrJPpU4+RiAQYp056Gz71n5fwp4Sy3f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8560
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac58..5f8002f6bb7a5 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn = of_graph_get_remote_port_parent(n);
 
 		if (!pn)
-- 
2.43.0

