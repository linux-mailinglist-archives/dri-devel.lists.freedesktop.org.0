Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091074AE7A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35510E556;
	Fri,  7 Jul 2023 10:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::708])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6116210E51A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O41ekPv5gYaBybsIrK19cy4Q2n0i3poPjT+v0Yq6lq0f2SXIJIoJ2Fka+PHuOTzecKA1V6B016tuwFFdlDnAWuaP/fQJrh2X7Iw235PlXkVOONVl5iT6rymqIk5NSsPqJFC1bHTKx6s+o121diL6PUWRse1/73V9iTK2oTEJesky1SfeElLRQFibIRlTG9mJAJSgsLU083VwNKQcSZ0lMw/yGVtvp95JN1N1MhvYbe2IZRjs6tEIYE5+gcMIhPZ1rkjJ9eknHdnmjaIxgMqUMBbUl1V4J+0DKhMqj28Z5KJIbQS6tQ15WjiDWqQcwzj05IdVPAR5MnKzUEPpcJRpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S52aLvA9c+8fTPEUxbLQzNSXjy5oQ4nntTQZ5ZpRTG0=;
 b=Ebc08o0/o61jP2j1bLmBGLPhZBhZxYKxwsE4hraeJrQlnHJ5scN6esY0adcNegUB/+ulP0i2jXepAXpK35PI5TFtM4GGsqpO7sCN4m1Og9/8y+gJ0t5XJojRQ6MkX53eph+O93lnAhuX7HrWayyiTLgj1kSvKfx62uQivgEZ8Tajm14UVaiMNQBTUorOlFAbhJt4m/ShuOOFvSrQl6rkz58qSLn4LNGJa19RqeBwfteRfk6YKK2gy0nFOSfN4C6xRbWar+xHdV9+EraCd0g4GkFHBZOpTu7BF+ADKFKE858zUr0Pc4dlMEm4xQVbliDlDOoGGgRmBAvbN8iGGn4bnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S52aLvA9c+8fTPEUxbLQzNSXjy5oQ4nntTQZ5ZpRTG0=;
 b=PU3AIPVycqc6QK0em2JCfI/UpR4zNS1tsvJpFizKCYKy+qtO2210GhKXeYUvOfx+G6fDUx81QuB31/HDOsh7EcE90KrZMtqPH0Uz33VM80NMgagRgR7jOLwYKWxTYbG+isupbmp19kbO2NzpXr7JkU67WcmX0qvug3sb0+e6Sq1PctkfvYCCmiKg8+eLbTt48tMDFRVMrgA0L/cYwNt89yfwEWUu5+B/Onokiwgw/K6P0DxANLquwxVTc50b81D1gksbkgWSGJwpnrIAuaF60shwpNb4pb6qtexOTgH/L1vErlez+pn+nPT0k7DAkIJM3EKnWbEo8hvrmOdvzxwnFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3954.apcprd06.prod.outlook.com (2603:1096:820:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:38 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 16/18] drm/rockchip: vop: Use
 devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:32 +0800
Message-Id: <20230707072034.48977-16-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB3954:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f4f6b9-c1b0-486f-4177-08db7ebacd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BNVXHi5cduDW79aOljdeH5wQsXE//YVaQ+rQOlbazF/PU/TsRrhLnF2/HtJJcTNK66AI8tyNOoaj1fTD7IG8EPtQ5fDvvXRge2mWpA7GWXmSXspaZAkGSeRHuSazfhBaX4cNqZ1huulegfWxsb6voRp7oKFLwBeXuUwzubnGpzrvNODFuaGv38gF77Qw0HjoSaf+0UgBRPy80wJ7gq5ITynrX19jjGZDT5AlC1me/gU+yi/Jc1Lh2bvceltj8w4x7GY6QZ1zXa1w6jSGPNuDs7Nfb1k7EIBHrupsfcnlJRjBKeY48JQM9N/L/JqUUV99x6QXc9+DDRXEwOzN1Men4h+n+KTcSDk/XtYghx/87k7fbNPn1yeiSvCLZLdp5hY9/e1JuMuWQEWFCu6JJ/xwb2AjOaunyT0mEflCtf3bqRkhhj7cWjQQJybaAB4EZ76r61mjJHYL4K38YH5P/ijtWdKDL/+zsJzNYFAfNqGBKMuZ75nGf8rQZcr3+3j9JZzca5UyAbtZiudK5XEabetqNyqQXcl7HqWRVxG052/qz7KS1qofnPMzEuOcJ7SUNYA/mHDnbp6bKn10BIzLr1PHbVyunoE9APnpQ89cM1O2MprGBXtsK4C5QII2rLw1U6Zp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(4326008)(478600001)(316002)(38100700002)(38350700002)(36756003)(83380400001)(110136005)(66946007)(66476007)(66556008)(2616005)(6666004)(8676002)(8936002)(6506007)(186003)(86362001)(4744005)(26005)(1076003)(5660300002)(6486002)(52116002)(2906002)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WD0+mZ2Pk+UyIePG7LOy2lhQzgGPSN/YYj7EVsAilGGqLCV0g/WR7KHvl2Bn?=
 =?us-ascii?Q?9LrxSj1NMl9cefHW0SSfYqy+2hjn/2Vk68tDo8eNI40+5ns6XHpNzQJCzWOh?=
 =?us-ascii?Q?c1BDosroV7PM6pdcKefOYPU1B5TWOQhiijSdrMXLxhQuvhefsIY1YxLxo46v?=
 =?us-ascii?Q?8ou0IT/b51TkhOHtTRC7559AtmCmqaN82n5BPhSLRGrHsgu5hEtk54tmpEjv?=
 =?us-ascii?Q?aIp/hsH8pv9BB3baJ9zRNhVSUWN1dsv48iK7d61fRAr2ReZS4tSM59OS9f6f?=
 =?us-ascii?Q?8fFvsj3xBFTT3E/UGCJwtpa6mk9g+9Eb5eoESXPScbBOAzQU9PsSpHgM3AGM?=
 =?us-ascii?Q?C943uqiFUiEvy4u9LVZrNCzbBG9qplJQXhFNTNZdn/eNodbNviEzN4nbJCzm?=
 =?us-ascii?Q?ikLGcR4GHDdWrDczCuiLQJNr9FaElKKXPKxv0r6/tSnurufwIssOgPo37ttt?=
 =?us-ascii?Q?c7QW6u1Y9bWueCU4S6TdQJY+Q7eCcr5Bdooxt1k3mBNbMaNzVYF3YgSe4zgX?=
 =?us-ascii?Q?lN4O0m5w1LJG2wIuvoPYLCMMthXXUEjDw4RTFEouSOEkM091+9S4eTxZk3jO?=
 =?us-ascii?Q?o4VFmva47XWlFzViDX+qjRsNiS3VuAMEufqvexuI4SVNrOa3Koh2RrTkmy65?=
 =?us-ascii?Q?vIPi1gat8o75w68b2WmoCMtrAtiXnuT9zYT8UBsjoua6zHTZmT1hsMFa5Nrf?=
 =?us-ascii?Q?5PQpKSQ+sZhC5E7fd4YD2lxrygAAYZqTylCoVZeKfvHGtuOetF1r4EKCf4A8?=
 =?us-ascii?Q?1osoXm4YNIbuaZ9lhk/YiXF1WuO9lh/wsLFSWsVYEiUFKkODaq2ZwkdM0KXd?=
 =?us-ascii?Q?wovqFp4Dt7QsZX5sFVKiffG26Io+UNHq9k+0v4DEIystFsvVuqdmlsaTXdhd?=
 =?us-ascii?Q?QZoU06rCswyDG65jcii/uccaHgVlCv1NOVyyE5jg9+r7mG6/DaOdKNGUhbnd?=
 =?us-ascii?Q?t+AmgCIMqyzRFyHIU/1gKGAeGlQ2Y8wApu6J4GZz3g8MVrDVd5Lb7T/O0qaW?=
 =?us-ascii?Q?nkbNf4fLLeBhY2hdP/mtkUx8lWuPx9Vs8fd/j+yiLVjzrVWR9y43e1RU0MJL?=
 =?us-ascii?Q?r0rq8dVRZB2ig7kFk9YrR0YzhKLxAj92/D8flB+L3PtzaPXX8jn35s4ITz1k?=
 =?us-ascii?Q?Kp7z/v395MPoYeU2Ut25RPn6/YvZhbC4m2ZlQdhhpHlznIIf0Du/nUrhNDx5?=
 =?us-ascii?Q?BGb61LkSk8eccSxebbI04v+7o+0eogzAVLgfNinmDNKsLmy+GljsHdY02B2l?=
 =?us-ascii?Q?vmFeQTVbPtBVaeZcUYgwJncfLSZY4CFxUMQ9wbNRJjmt3FwVxXg8NjGkWzte?=
 =?us-ascii?Q?zhZ+TENeGXAbKm5MPUVjs6/gd/4obwqf+18FkB5hLwgTm7KNy+SC9m1EVRFr?=
 =?us-ascii?Q?GCG6+ZkeUO/MOSkp3ZCiaWt293xKEupYbwvAWhDdghJUQswoL+1e1TU6ZuXp?=
 =?us-ascii?Q?clJeQXLy5l9z9RQKJBiEmnl5ZxbwjTV6eq4JNFVUACB9X5/ggyHJIx3y+71N?=
 =?us-ascii?Q?hteOpwMvM0tPYdRNEfpQi+jx58q8Gps7rdnvnRYD/n3jVxv/QSlQx1ayvejB?=
 =?us-ascii?Q?s76wIWq3sAQRZwRRidkwXd5JuNyvDitIAtmwSLmo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f4f6b9-c1b0-486f-4177-08db7ebacd5f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:37.9712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4aX+8CUHD+0bPDoIWuGPhc1dVRUXoefo5AxmZFKjOOXA1RUK0kZhBANIKRfmAhtFfYPtEi0i3uTEYwnQIvA0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3954
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a530ecc4d207..e95d94ce1869 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -2179,8 +2179,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 
 	vop_win_init(vop);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	vop->regs = devm_ioremap_resource(dev, res);
+	vop->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(vop->regs))
 		return PTR_ERR(vop->regs);
 	vop->len = resource_size(res);
-- 
2.39.0

