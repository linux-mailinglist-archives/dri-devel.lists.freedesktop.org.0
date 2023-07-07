Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5274AE7C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3668310E553;
	Fri,  7 Jul 2023 10:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::710])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE7A10E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8SYpms0eE0wQzeYFU86HjeXyLgo512lB1o1zjh9IPzl0MCkMxZ13EMyrGQRbYm3Vq9Yljsp8C3JD266A7RnCBKeVdnt8oXH7f23JOYTZZY5B557VoWkb4xqc2GwiHjxTOugAlKuTO8KHi0DlSlYXC8iqNztlGiSN+eZYNz3h003cs1TeSIgCOKKbLHYu6H5dLOdwKJwfitW7AovMTorVIk1Tg8wezOH/cp/n6FCGRTfxiLdVdQhP7uRGejVD521EMK22vcEtK22IiODXroL7D7tOmI9iFLhE5ht/bQqdQDsKk+rhqGReRA3IjI4kPBECCvF0+b4ZroRfBSj1wB7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2No7Zo84xwCRFwHWRB/2QOflf612freUdHSozLBxa8=;
 b=boZZuaCKYMC7jko4n5R9LyU5sSN8Kq1cQ4TiuP4k6tSvMdO/Qfasn2y9rdz0ucw4gaiUqfhz3qF3KwPcVjV+VD2POmVKaaO2+WwAQzgEsmYN2q2JIs8FnmLpK4qyJ621+M7Eg9OtQL4i8rb2E38WRtlxCNZ/jQ9dcw0b7TLDP6H2TdmdBgcqIHOPWSiWkIgg+/CuaCIMxfsZsUXGNYba44RDAlHPlmgSyOD48R/sRTY6W2ZOYh7ZeNyCktjdVHmV4JqPh5w10nRV3X45Ykiw22KUgh7svCG1CNHa+VXAvbwr4OrG1NaNiPU5nDcGfPhtxnETcj4xnMiZjMTQ2J209Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2No7Zo84xwCRFwHWRB/2QOflf612freUdHSozLBxa8=;
 b=Zuoaf7K6wsg3104peUm+C2d23q8dow4h4LXj03WWlYuPW78lK4YhfQSPur9plUIdviZqhyd0aPaPArcjcylTH7kRfa+hFpYoE3eiWS9SVi4rV6JdcGlmrSzVa058c03soXdl+itAXc4+JmqwwLQe0H3NkjMx3OSjPaTQUaynOQeg43r7v3tOPJ4cQgbpZnrWy6vvQKDz6U23L4dX80Fin33YXQ3kBtpDXkdKuH9UZAR785iaFRyllfGXcJf03GboY/UHi/r2LegcKGOq54jIUV3BrXVmuJnuYaRi1+S3UmZl/6/xZRXtiCSRDpa+fnYbxeUqnkRO1H/JmM1bJcdiqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:08 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:08 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 10/18] drm: lcdif: Convert to devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:26 +0800
Message-Id: <20230707072034.48977-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd27bfb-7e27-4a0c-afa1-08db7ebabbd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lgtqNS7NRiP4yRGlMAKXeyJ+Yfj5lz3bAVCCPJ6ivUa6LMyQ3lYX2+AcuWePdJD7vhQ+wjEuCb1yf0eGbAWY+ADpf5e5h+HhciM8qpU77odsBd3PlwfuSol1H8ygwoMlo1Px9Proo1EUwK1vJvZxC/31RZ1EeEA3j661hGEzLxW1q0LZJMNPDcTAdvBdTEp72FJjYEYKGVjetX8HXZLjOt4Thl97qFgSvQHnwWtWhRWLUITIdC7FG2mZe5d7t+8XNWN3YqMFa8u9CT+6bKPnzWooqNvKf2Ur9AnDOAZQQH2oZ5n426bLH+Yn78ePlzfqyF04iCzos4wJV3bE/BijB3WHxiL1Qg+ePYuaGYdZFyLZPRD1dnPWMEF+NBLLotAH0qrMPt7a9Z2FN7Lcx8y9OLmDn4GjYBMJt3crF7Hxgt1kv85i8Bg7XRugrltXPy2nOBUqb9IaNb/bZINC3xDdNUb+EGz2HpSxopEyrvYA5krkied+vAlXwCQTWaFuFnp4yAOpiRw1Y/IDb9E9T0F6BxfUoK8vgDA6vJlumVrHNN/GWm8RopgqKUC4dYVPDP8lMry/1YOfgWpnDdwpCQ6uPpst/UVnJuJ8/b4D4bmYosQlAM4nWWXiyZXKJa+fFgec
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(5660300002)(110136005)(6486002)(4744005)(7416002)(316002)(2906002)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(6512007)(478600001)(38350700002)(186003)(86362001)(2616005)(38100700002)(4326008)(83380400001)(6506007)(1076003)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DUvkMgtRj6pE+An1OZ0YoXEaHd/T34sQdV4IAfLu8TXemGqIa/RbdW42QkKk?=
 =?us-ascii?Q?Bi3sCaMrPJW3L/640fwKJV77aGVM5peA0OVjyFiZzzIWFSNPhkwIZZKwVTYZ?=
 =?us-ascii?Q?1ARbEhLtk96DqcTiGOl9bxKe45IRLGLa+ZOjtP0hayvU6qE4r2UelPr09LGE?=
 =?us-ascii?Q?4wfjLQViEgnXD0lc6fcUIf3pxg5iBs1JDj+QykvCeH+bS7+y4C4hV52yxSqw?=
 =?us-ascii?Q?se+EabIs7gd9XH4jauUwMIfE71kwnCk2OHKBE2fyRwTu0/b37E4jJXopKVh+?=
 =?us-ascii?Q?BLWFm7pQqBx5vHqe3SJ4NH7Mq/qXa0Zk2nOPWlIb1eVQaTbYNcdajDhIaUxp?=
 =?us-ascii?Q?xnAFquAgjHyaPbgXsxldYAKYU4yI/lLvx7abxIq8mkuLykTT3T9Ns6fKPJ7h?=
 =?us-ascii?Q?5Q7eyFsC5igzSPJHiK5ZjSFAwiJmyI6sk7QvYxEUYPCa44azEr8vlQWV4cFp?=
 =?us-ascii?Q?MqE3b0fkpQR5cIyjeEyP2z5VPUgKcQ2Pm8z08t9cuNlkqpUKkHi4tjN6arES?=
 =?us-ascii?Q?gpZ09eylwQVAFx3l0XsrFEyz41pym4Ix8JqeD8LvGGM6z80iGO6OkPuJ03v2?=
 =?us-ascii?Q?MS5gHE686Gpzw1tx8vzvrhJtdbdhVSgSoE6193ZOsuBHlNNuZBEOnKrjdPPD?=
 =?us-ascii?Q?iMF6W5Wosqp7qi1mvZyBNR9qlnH7V/Fqm8baCLHqRepOKYoYwY5L87I+tuO2?=
 =?us-ascii?Q?c4pbFHMBxl+yeOSzPzMXnSAioZaq8EJQ4w1HZ0SeJ9IiCjDQW0irhz4nzOI/?=
 =?us-ascii?Q?yboQxOcMuntTM+c6kCqxnbTcNRp+CKY2+mydQs7lABJEI//L8m+AXv1X8V0L?=
 =?us-ascii?Q?wUVXqEOI1lr5ewu5LkletuBZeqnWj+KLLQina3PsZD5BJ/YzOltTWmTKuY4e?=
 =?us-ascii?Q?M+VFzuVhzf/ngfg0WEw8gMB4P2PdqE8qdj7F/h7O21F7JnhKrE0n7Mfd3pdP?=
 =?us-ascii?Q?27a/JnNIC8q4qwFZ1c8QM+3PYAP/0oOT/I28hgT6WaVCsN+fVM+5dbRQB7VK?=
 =?us-ascii?Q?f2RCBo8AbrzdgRy4BKU0bimaiTyAxyvtXhnwUkvVCshLpTB9Qcf032A3Y8Jy?=
 =?us-ascii?Q?zXX+CxHdXHkAfhXY0TL9Z4zVKeOg9RZ/D6nzh6gI+pOy9V78o74MfTjkoJBB?=
 =?us-ascii?Q?HP3/2aJHBzoedmHJSrwACVjU1+rd8q/UvulIaZB2s1sVYPkCZSBaFzyyjFQ4?=
 =?us-ascii?Q?72AodiPnlP2fdgqDQJ9W3Y5zboSSmT7QETHUgoPdYwnndFwROZ34bO8ZvZdA?=
 =?us-ascii?Q?2klO6KcH/TRk0S1P3679etPw9Ds4rMcsgP60Je7j4fRMKTYp1I95awvrdgbj?=
 =?us-ascii?Q?GCyKn1iMCPbUDaLGb3Hhxcw8Ox6gFtl3ppNB0pG7v2nYanCcRN1PPqN9CeGU?=
 =?us-ascii?Q?v7wZZb7ti6Ev/E0Pl6D9IYd1EtyxUdTfr1g5CPbgAqvLiIi1pHnsasBtCXfb?=
 =?us-ascii?Q?GWAj0s87mhiNcbmFQLOFNrBolTBSYjh4eveQqF0tZMh1pGg1sJwrLZB//eSU?=
 =?us-ascii?Q?JvsS3nUgGLelhkgZBBu+IEk3MPCFqekzwhY9nEEjZTzSJ7DUU5ZW//QhrczE?=
 =?us-ascii?Q?WwVzmPkDZnEK5Tben45Al8GJ0BPxzNGaMAcmvGWN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd27bfb-7e27-4a0c-afa1-08db7ebabbd6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:08.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpWEFGKu7wilBr7P+Psc+8Ej1N0b1/1HrkEHRQI1aeYxVSHZaNR5bYeH11/7qrKFZ+YqjXdxT6KejAY+RAT7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5342
X-Mailman-Approved-At: Fri, 07 Jul 2023 10:06:28 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index c9d8cbb21407..a7cdd0eec7a2 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -134,7 +134,6 @@ static int lcdif_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct lcdif_drm_private *lcdif;
-	struct resource *res;
 	int ret;
 
 	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
@@ -144,8 +143,7 @@ static int lcdif_load(struct drm_device *drm)
 	lcdif->drm = drm;
 	drm->dev_private = lcdif;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lcdif->base = devm_ioremap_resource(drm->dev, res);
+	lcdif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lcdif->base))
 		return PTR_ERR(lcdif->base);
 
-- 
2.39.0

