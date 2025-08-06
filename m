Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D09B1C27F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 10:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCB410E2EA;
	Wed,  6 Aug 2025 08:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UdzySc30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE45C10E2EA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 08:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrqJtnjuukO6lI+zqpApISS9y2fw17vkvlMd34tn9WGbe+OHFLfN13kterS7zn2QjJbl1/jxvW8FARQ7YPbLDHpKArLtRLUY2vmAkszabRlGUgbf+Y15DUXVWB+kAV4ng0Ad3onl4tNeutMMey7Ho/WacKoYRYYi+pByCkOu+agg43Z3ok/7n133YwQPkg0YpZaqWdw3iWCEX9z0OcYV+/KIJ/JuF1goEytoLtvSdg1p13Yoaz4/OU/n11cBZKTtiigLzCI5dzHgJTnnc+9EthIFJa9Ma3jusghpSOiTgZ9faFwS6+E+Ft6T71qEd9s5eKiPWm6ntiFhyeKxKCsc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ixxZg4D0guRbMBDqxYZcF0Onif7QOjVE+hdZYTX/mI=;
 b=JHQLQgcKunMyGd4fMYSQYnK+vEEdwTHH25ewngkPbpf0uqkZMYsIE18HxvPvxwTYj2YPQEwQRScHWZFCZ75eKHydxPdyjEtffCL0v5iwpM+ZsBRE3JJ+Gg/YtFGqDvd/SPTcVLV9ExZbOLbhAMkM9BxAwP1z2/E7JoEuvdobWhQKIMQ89bsrt/DmVF27aQ4J3lrNrqYlJmiaCsd6GO1R4V6SNuV5CCmQmqc2kKu47VKJtg8n7GV9Hk6JRO/Dm1Zr1FzAMqqyoJpXr5PDLdJb5ivH8UIogordaoBz90Y2X++EhWj20MfkxHBkwtKhGNdTGypsUkRm3pRYjKdgDAgVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ixxZg4D0guRbMBDqxYZcF0Onif7QOjVE+hdZYTX/mI=;
 b=UdzySc30i/4dG1NGZGQxwL18+y+8u7V6epyeqYTpwckwVohAZBVnldMXqybodo0+l2pnwv9eh5LCcoDf2UVxEcM0eYLIITJ6RNgCZ3T3EWyRRnzsUs5W+8iATt8Hb0gPFPAfdCZLP8AQr7ncZFrhZozksswxfwDsmzpE7DhxgLDo39u8SIG5mjPaX+4EHZrQmnk+ZomFepLOa5nphVQdRBQWHR5ctqgIykxXbarpzj+SrR/k4DS1pD0H2atvDYlBoYjUhZpRbDMVUATlPsOklKTnSk/9ktyf0FLUIaiI1rzCAFlNn9uEUNsLsb77hkmY6bsw+MFnIcSotoNmPM7RAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7945.eurprd04.prod.outlook.com (2603:10a6:10:1f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 08:53:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 08:53:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 damon.ding@rock-chips.com, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com
Subject: [PATCH] drm/bridge: analogix_dp: Fix bailout for
 devm_drm_bridge_alloc()
Date: Wed,  6 Aug 2025 16:54:24 +0800
Message-Id: <20250806085424.518274-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a3cc7b-584a-4ae8-90af-08ddd4c6ad8d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ToNxabzccJoXtIAE1A7B2xSuQEn4gKQ2zFW6adu27B5c7izwEJbEq2MTDZu9?=
 =?us-ascii?Q?aKSMcGP5kK4G8XOG8uaK7fJP5rv2B2y2NrMPgxLRGTmi/jx4olrXLMmiHC0o?=
 =?us-ascii?Q?W+TDwvA78HJm9dWgGr0Pc8xPLb6Hc+NQcJhBN0FR0lUS3kdk3Phfeur5aSUH?=
 =?us-ascii?Q?YO+H4IcYtePqn779qI5ef1MnQL/hIIis9JZ4O/CMPkdjG5jsPIue2henKAqp?=
 =?us-ascii?Q?+FQZqns6qn/wp7KeLxKlQoRmcg4wREGzcYt7w1p2cRhiBW2sEbyjNU/Ydx2T?=
 =?us-ascii?Q?KPkglFfdUOMDI2ffIneDPg3AEekeUs1npn6h79t95aOZelH/rRWjxSneVj3l?=
 =?us-ascii?Q?SsR2uetWKRLO1bUMkCajR70jITu3RM/G4oVqVk94g2XFGE9dAvNiKGoyUUc3?=
 =?us-ascii?Q?IvC/gtqjkSsG3/ZVF6go7Z2hg5AyaDJgkRgb54EOgZFK8bqCAbI85LBBdMEW?=
 =?us-ascii?Q?R6cgW0+tvtrbFGlZp6FP/5GisUB+bUTu72to22UTSM6qgF2WqytuKc1l691L?=
 =?us-ascii?Q?M4tRYssn9HB/pcSHyrp66lL7ZhQdQNUgI+NbypZubRDQn1Z6u+XPZoR6ICCY?=
 =?us-ascii?Q?nrMEGpKPleAk7crmTRnQ8gQHHEp9Z0JRtomv3WcEixkuTJ0aURtH2DHXYlG2?=
 =?us-ascii?Q?KB4TS6gS5dl3YNic6GIpFYfpR1eHrQFmBUxkrbfPEL1VXRUtG6KR2C75htpO?=
 =?us-ascii?Q?JgafG0g3eAMO0wJFFia5QRNVWRdAXfLWsjmipWlXqnj2O3ElADrCJwng7rEz?=
 =?us-ascii?Q?PmvnfWuYi7NIL37wYoO++fe/w7meQlyX65BvRFpxovVhqW41lytRoAnlDWiF?=
 =?us-ascii?Q?tk1VD1NCvvN3eKuMABYWOyaGKPCn/3Yd5QADFBKLtsl+yB3MtxAV+2j35qCu?=
 =?us-ascii?Q?SjKYGJkEzD9J5Dy6uKtJToeWGirHp+SscuaNaCYj04+cKLsS0skiomPfI0Ls?=
 =?us-ascii?Q?MhyB9n4PDoMMyBszzp6z8wBRkMFkO07MO5Y7bpkJzEFp4Z65YRyjmxfALK85?=
 =?us-ascii?Q?M2dxf8+Xl3wrG37L62fxZ86EbFMHmRjDoLyA8Zaz+IRnZIlYcZ+d5CKOY41d?=
 =?us-ascii?Q?ysjutfeGYXOsT3jZmcLhmd8VsCkHkGcPeWYwUOUYiooUKUFIHn3JuL/xvksW?=
 =?us-ascii?Q?mCx8AK3suFxMO3ID7rXdrJNMD3wYxydJmKgmajMkp1u6Sbxb1E4zKU4HQLST?=
 =?us-ascii?Q?sa1e6w2uE3IlQSWWtIFdvu4njjOuyQIYxepMXgE/PdBNwNOH6Y/PJYGGY5B0?=
 =?us-ascii?Q?7yvMiCWNvFxaGxX9bR1VOyL5pduLesnpmyqzJsB+Ccr/9Hqx67wSZ+MB6ShW?=
 =?us-ascii?Q?tNAkzNQxc4oH+ybV0M6D/Aqt9/ff3snzhpDbS++GjlfC5ga8LAmbZLEqbZ7u?=
 =?us-ascii?Q?Q9FhXCHzGMryEyPcvSHl6oFEVkOUhA++tsvhzxf3y05i4/8dg7bkyTfD/cWB?=
 =?us-ascii?Q?Ni+RkRZhkiwXJEQKEZ+93kNx9S3eBiiD7/8+ODcTsxNiNk4tD4tqgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVmtvfWYC9Qate+tevyEFtttH8rLS5rclQkFpff/XYbreQ+ksUeSU9BUfjgr?=
 =?us-ascii?Q?5bLcvpt4RDJlw4kvtHPyas9px54jTws879kyzGHFBGKyRoZGAWlUId3izqwp?=
 =?us-ascii?Q?Nsk21UbObmjdEpHKnvw+yI4yMV1mZUlSbWj3d6T6gkqKjlXcY6OtcRSOEl/G?=
 =?us-ascii?Q?SN9Qi5OqEZedIfUdvRdVw1iTH6dhJeu+C7oqj8spkpn/qtR+cRzCVntbTh8q?=
 =?us-ascii?Q?kzHgiilHAg1LVFVh5LGKZ4oilyleVN6qNj98U7s790v+JyPUXuZV9BUyx4kA?=
 =?us-ascii?Q?QUL8UTjeemQCXf0hgGiWQcMFPs8BsD62bXWfK9QMQoQ0CFIrsjolv1Ec/qtR?=
 =?us-ascii?Q?R7g3oeR9xFqsAgXhsO1drp1Ldgpi7EL4FUUsqAh2uPH50k4os4JU7FAhx7xZ?=
 =?us-ascii?Q?RrO2BmP6hF2YwqYBeIrj6eU0vQwnPl6wpo77ZBHYFUsBmaUOqp8gfJ+NU1eG?=
 =?us-ascii?Q?TQwapvDkCT6Kqc6BjQsTdOzFPxoF4tJQ9X4HeePm49MtlJBlHcrx7IXQyvGK?=
 =?us-ascii?Q?ENYmwby85LHletVyv93jA1Kd/SghBjz5DsMD1HRA6YbeU9mkbqZvthiW3XC5?=
 =?us-ascii?Q?vOxZIDz1KtMuqKTymJwX9gEshrb44Re8ANVOiieCtNyJ+C65xN5BcjHFyYsH?=
 =?us-ascii?Q?zoH14c4x2c4a8Tb+0NSeP0wjvZMjXwXSH6q0bn4J0oT72K3kE37mqKh2KICP?=
 =?us-ascii?Q?BPJ1c9OCLRDPdP+IA01gcXeQ1b/ITU7x0NxvVP9+qSLImg2j+6H+Xwt2cs49?=
 =?us-ascii?Q?XRqv5Jxl3J45mm8djhYI77KMZAEFQRFyrMlDc24kl/70Stg33glD+HRto6cx?=
 =?us-ascii?Q?4vF68HNi+0DgcRyvWNI3apsjG9Fyuslm5+HNdYbXfumDEu9my1K214mf6mAq?=
 =?us-ascii?Q?jodcQF2HdKlApl0hNOrxrLJIzVxNhEqjCQSqxotEFiwkGN+VZpeUvaOB9iNV?=
 =?us-ascii?Q?61juxV9aqHrqBFXddkQRHDj0iN70QtO/V1WXV3KdgUN7thaWXlxruW1rcdl/?=
 =?us-ascii?Q?H2xRVJnCY3d/7TyIC6RpOn6Z+p0r20oxFmyhE2FJSqaUijc9Bkqikd2A97sK?=
 =?us-ascii?Q?WxvJqgurYWa4mBwqKLSwJRKDS+DHT+1xc8Wyf9IagganVXaT8XaZxYqr0bKl?=
 =?us-ascii?Q?NibbMhQa54iP5rsj7NnLBLG0Ieq6sAtLwGas4ibJesDmWj+N5C2bW1THlOYa?=
 =?us-ascii?Q?aqIwqOblYomsyllDHFs3u59VMGgLl6putFBlDUHf81AZrK69p3IJfdelgL/0?=
 =?us-ascii?Q?cfALBPPDot3G3xxNBf8J/N2PJrTzQAZYYWZQ2JVNbe57PoVi6h5cIU0cTdij?=
 =?us-ascii?Q?VnnG8TExIzpxKT6UfQcftdE0V5WJ7AsiJyTeUW6PpKolHXFLBKms0kT+PfGU?=
 =?us-ascii?Q?T3RpwN6jDA+kys755s7OTUL4TPWxXZToJSEzLdXPC/CLdzAD8sXZFdi9U4uq?=
 =?us-ascii?Q?FqviBAJojmCA+dt+9Ki2dfAPQGYFhBjYZFaVcl9numJ019GxYrGMPKJW7DSs?=
 =?us-ascii?Q?CqHKAqR8KUwBFqgF9sX5R9fEYLtFQw6K2dKO5WJj7uyoRUDYi6g73uLSjyRV?=
 =?us-ascii?Q?prCypK624lbo1/182jXa3iZ3NCOxEcsJXuPjDv/k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a3cc7b-584a-4ae8-90af-08ddd4c6ad8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:53:14.0326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vB58qJUvdm31LGvXV/+M1WwBQ+kuLO3VxEqkOZQ+5HSC7caPWaeI4hwT4ZXYrpRrXsQDLa68DkN6unq1w36q2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7945
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

devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
NULL pointer, so use IS_ERR() to check the returned pointer.

Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ed35e567d117..86cf898a09bb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1474,7 +1474,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
 				   &analogix_dp_bridge_funcs);
-	if (!dp)
+	if (IS_ERR(dp))
 		return ERR_PTR(-ENOMEM);
 
 	dp->dev = &pdev->dev;
-- 
2.34.1

