Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E774AE78
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C6410E551;
	Fri,  7 Jul 2023 10:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E19010E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey30m1a3HTCmBR8WGDK4cwUSyCD0jQPOdtxsbQQ+7VM3ehM6uB76IDSbqHnxhKftasMHOsRyKEy3Q4BJggWXoEt0g7rjd6BKRRev81Nz4T3K6nWnaL+HiVziL8e17DcU+DF661F/XT+a1jfhudxHrI9mejk2yiOJqljZEeanBu7bsXHoqgTiRjVbNw7LOAaarONHM/kabHwsrSGL3RuE80pHdVhG4y64UhnrJtKPV6r7m2EkCXbXPMha3RWV1aOw90dz91cXI1fK0B89lssKg66kPEG2ctGioxY/xTTLEAP38jO61QSP1JQ0U3XqnssZAuAOiYw+YbU5fH9Ge4ERag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc2hhX8ccpa8NG/KKmOqSpO9dEVTF11haptmKKeHccc=;
 b=YdQxaaHzrdE7yL1p6iKoG54RYN5B8rNa3jIhaojbDYbctgS3FHX417FK+aOYHAzkGKlQBYAFdCyAK+mWp8n6SO6fq6cBIeH5bClroFwq4rqNqzohb3JcLwrxlQxw8Eti1iwS2ByeYzc4Hz1Y8NFUuwEkszf/DPaTYo9UWgXVZIr3dFf1zaszCgqKaocv+LYtIHvbGHuYquS1oavcaoFFodyKXiFzh1Yx6mwz2IFrMFQEG4e/66NlRqCWPD5N4IIJgmH927dXDAp0qgvqZ7B36oO3yYOhHZ7Gssych+8gh6cKxiugCRtrD6KFuR2i3pXq1+6DdI/GA+Yu/P96X+zRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc2hhX8ccpa8NG/KKmOqSpO9dEVTF11haptmKKeHccc=;
 b=dFi6TpUCoMTdwM7rrl3x8nQP6Cco4BecY2ZdsiIkUq6WAby/hfBcGQOScjsC3WN91V87iI06KFwxtm2UlXd2TQ7aT3l03tU1pmrzOLdclrBIcE5wbv26u4oNrU2ja2K7fIORBVBow4D+H3MZX4LP0l1sWAZEIz1CH/RQV5wPcOA7nHtb8WvefIsUQijabk9HJVpyBTpnTbmlcY0cgOvzn0B18AxCiH1JdZVMchWWGjP/N46msVH2xWywQfRW/mwTY2fQOQSeTyUTQE1pjH0WPv8e7kYb+2Lgpmths2ZTOstqwBkv6/0cVMJa7gqWJVCpLOKcqDvbJ4NgUnkE12UlaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:11 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 11/18] drm/mxsfb: Convert to devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:27 +0800
Message-Id: <20230707072034.48977-11-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b1c5d70-aefd-4cf6-6eb6-08db7ebabdb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LFUvMn9dxxrnrnEK7GBCxXPfqFRqQOCFpzqUqspszINJCh8w5yfGZiNzAzbpxJchD6r8qz3mI2zbj6b7TPXWjXz2/ogmxJj3PllHNCW15Q8/K/kV7LF39bJRGQeGISec/2DimMg+nD+vzKco17wGOJaLKdUqU8yP/1uaLiO3praZTbHsRsO6cBmwvkCAeyw64JQ4FqZWprBqTxLPkTGZer7oBA5IHaXFhBde0M5yW6SK91BMheFYxaY0+m0qKFcKauDy8DFBnF7fIQinx/l34X1Ax9GaZvq5p8KEv9On08Ugno0lKu0pyma2mFXBDo1sqvuDL3TyTYhU7cm/+hlAPpLTOuXon7XibKcdLeuGQa7GI/6wVzjHtp1/c860jZSHnzuQihvUYHcITTqxulKM+LjYYNOVUfLWnRwZU7Iq9SlKLwjOi3VTZ1cDWhONQPaY0yFc//8EaqVvm5wTQNWT1p8v78WOK28LlV0sXzshH8p4OjIwEb8Lf/6osUqaDJUAlbBY1jjMqNNcxfCv5IpchW3HDGS6n4enB0nzSUZq9L/xYx6MQMNGwiu2jPAw47f5H4YIYikPcD4HSv3i9Mx/ML+7EZzOxyS15AgDT2irEjJi/8x6ov6pSVG1BCEVRz42
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(5660300002)(110136005)(6486002)(7416002)(316002)(2906002)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(6512007)(478600001)(38350700002)(186003)(86362001)(2616005)(38100700002)(4326008)(83380400001)(6506007)(1076003)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7MiIztohGH+2MyK9Js/dXtqALdOJ5pPC5xpzKobdmlFGRE9rDdZJ7tZ4qUi?=
 =?us-ascii?Q?CcQy80nTHgiHmVXQHpggRa9PXqhXVY1UO8YmmnB02ZVCGuWGdb7bPTMYv8EQ?=
 =?us-ascii?Q?SqdUhZrNWa8cwrXivCjNXfYUuhc7Vmjyv1LBLfPb+CS/7ya9PU9x9iEQARTA?=
 =?us-ascii?Q?+KEahC/+CltaOUFB7BsA0ldLSMJAmWqj+pZ2bX30Y6a+P2vZgJOZs+nm7vGk?=
 =?us-ascii?Q?5C7erZWgjMsi87BAxUKqu9sU5ab9VxMDxHFoLbMk6rWieH4HRNNwd6VtkcEG?=
 =?us-ascii?Q?Va0TfhI1Pgey3QSpLcDF6fhunUl2ypzqWtHb0roRDG0MCPcCxhvtjFe5+n9I?=
 =?us-ascii?Q?6fWhEMXpPT+Nv7hosN9fNGtiqb/J3JWGLXKa1+FVw1HZNO9IN7UYI04tFEa6?=
 =?us-ascii?Q?yvIjkmVrVmazOBYi+WNJ/Cig9AXX9/KsyCy5EcIfsrv59A0Z+/h5xBX3S8zQ?=
 =?us-ascii?Q?YTLpdND7AcFrWZjBYPaj6Tn2mULLsiH+YGAt7+T393vyWqSJwHX0DXuc9vFl?=
 =?us-ascii?Q?YCqM0399xZxhyvdi+9wfl7837M1oggHjJB9djoarh3RdOv4krnK01BmKaz+M?=
 =?us-ascii?Q?AjCSVx8ov3orUG3l0TUcSFeRW/qgGp0/zIIuRjzQqZuet/fpFdJNj1IIc6nv?=
 =?us-ascii?Q?/uRiaZwZryKQ/QB6Y9zFjTjS4FrfA43s8NAK0s9FhPFBGk224xtIKOGSzvD/?=
 =?us-ascii?Q?XEIeEVfsyKHAuAdyGW/a9yYTdEfXH+0Q1YP/los1JEhEnmcFlJKzYSiIH9Aw?=
 =?us-ascii?Q?BavGMR+qFI+8Qf782rAq7LcMO2LtL9PHxWL7qWKR3gDv11Mpu7BZuJpNSk+k?=
 =?us-ascii?Q?1vSjkJc+htxAu5OELUvdFGuSSjwTL5MZOSK0Lc7qTxJF/p2GnkfFu4adfJ7w?=
 =?us-ascii?Q?A9ZpHVoMRxHKwBIuA2C6i40TmgF3pFZQ/C5tbCQ9JcniwdKRxQd6SFrmdeu1?=
 =?us-ascii?Q?iMlfTaFkLX7vxF9dJxNm5tHYH3D6Q1+wQ5kyVRVRhSoOCMcOP2zUJIVdmcdN?=
 =?us-ascii?Q?aqNq+3iC7OehMBk8DLwtPxoTnkei8kEGZUPyYObCqMUSzi97wuyClJZ8LfjG?=
 =?us-ascii?Q?PM2S70uqJmojvr/8Z1pv9sXwK1mk2lw99OslRUGvQyFBOxSCFWXoE37xa4mA?=
 =?us-ascii?Q?+j2ne9kfUEyDYRljFfj7FsZZRRkzS5FVnkfiAiF3z4z0NTkJRH8a8l1lpRol?=
 =?us-ascii?Q?TsvvWZ1Cgpk8ue45GVog/agx/S+zjt6inJijcLRj4W06mU6UpOroZiWZe0H9?=
 =?us-ascii?Q?3wvbNdF4mHp1CGVouTO/xyK7jL6WJkdVhRAcbn1MQp8MJErjMRViaEq5iYP0?=
 =?us-ascii?Q?0T7A7KYcLaGh2aqJC53On1NExOidMdRc58eqkCVQ8DAhOHpeBWLP4yacwNcf?=
 =?us-ascii?Q?ZVp2+CD+O0BhIPcUo+nxI7bdXuszBFdS64EievVp1ke17woFF3bbrKKhRzov?=
 =?us-ascii?Q?9rnby7Rvu5aRF3S2cpNEoAn9enMrpvCNsCfu3pI/w+0vf1OapLfrWmYh/r2A?=
 =?us-ascii?Q?VaZjyHwJ16vao3isGA9p2SJ4Z6jaYKmV9OJ/atdvyxSRdlCOTM3kv5v58ms+?=
 =?us-ascii?Q?Bl74D4mer8YTL/PGhGhEcMoVEPoywzzDTahbMNQ0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1c5d70-aefd-4cf6-6eb6-08db7ebabdb3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:11.7115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKViEVI66fePu0wj5uPgQN+arb/iwAipqdMN/eUSdhZCNI6lXPERAGZdcXdSeDU4OiSta6lbtpIajk6V1X/duQ==
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
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 368b1fbd8305..c8b3fdb1ab09 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -213,7 +213,6 @@ static int mxsfb_load(struct drm_device *drm,
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct mxsfb_drm_private *mxsfb;
-	struct resource *res;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -224,8 +223,7 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->dev_private = mxsfb;
 	mxsfb->devdata = devdata;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mxsfb->base = devm_ioremap_resource(drm->dev, res);
+	mxsfb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mxsfb->base))
 		return PTR_ERR(mxsfb->base);
 
-- 
2.39.0

