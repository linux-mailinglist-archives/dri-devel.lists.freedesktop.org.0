Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5674CA7B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6011510E174;
	Mon, 10 Jul 2023 03:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::707])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D9D10E167
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IENu3w50yYqw6W2Ztqrk50cFhaVYqS9bTjWzhl3qSH2yH4bkbZqT9MxyFKfbRIbpTkCVIR3reC5/mJF0sfnnaoVSwl1LFBzTKbC7zc7ahnrjGORvAR7EQZSc8oK6oWSlSU/JJhcivgE95FNdvZ5ZA1ybkpyFkMF8BQzQOoDclOxY7GSOWD47g8fZ6wHbYJflPXbbqgfEoAE+QETDljqXrrOeCm3ygbbq0vy5MpFrdNj1TYR5aepO7I827cO+0QQGJ5G4GgrR6/8VjlH1vktrhzrU5UMxBvsvYq4heyEa1E6WOjJ11GDVTxSlno6p8IvYrjDYQxd7SebSZLLBzJwBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGxx+VePSjXYlpTqopkI+y0GcumA4d+Xb8ZaUtaDV5s=;
 b=DAojeakGq4Y0FdBo+oc64cMu1bQJOAsAcnmB6vHQmyN+rf2jDK1dGlnUK/Bbcjcq1pASaQjwF40VBz/XqNe3tAtx371zHQSWbv7XAQDEvt7/rumvasdpEgUersBFQ5wTbM7jdPmRkzP6pr9B+WH16s3hyim30VO5Za0x94DSall8iVlk0KEHXVp1LaisQ1OtkhRlv6NUVH8wNql0SyEa0yda1QkNcT/zwXFf26KllCTQQ/y7nysabd4I+bMFszMTRydMrlgO5WK9purOJp1Krec6EgslXfdi6Mj/NJ4kFFrkMLfoa3gOQ5racVSxoR47Dp9t5wvTVzBsFSVeloGl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGxx+VePSjXYlpTqopkI+y0GcumA4d+Xb8ZaUtaDV5s=;
 b=c36GYxW00TdwAMvixgmUpBwJZ+w3Yu+cqtODesIAOTVW1dthe6MVPALogat+NI6wXUOvcuYMcQbMCo8jybwW/p5qYQ7WW4v9MfrZsGhn/iy8IFWzoTwACR9t1bAX6A8ORKAebieHtDNmuDx3O70/tgVJp7bF5cUh1xWDRExBi2piSWb17++fhpR7pUaEvXbHQNmOvtV8MYognA9+K7PGfK3PkFTVXPKG3gIocJ0tB1m1YDQppJXNFBPRNt0wmykq3QIErt2QhC9Do3HyRSdb4V9Lm0x4fwvJKR+R5FAJoF62kPHpjFeevjdHXIT4afer9zotX2ihT18/wpjwNPP8Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:53 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:53 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 19/19] drm/fsl-dcu: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:55 +0800
Message-Id: <20230710032355.72914-19-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 3868ecb4-c47f-4e0b-4398-08db80f539fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHCdqZQHvWZk/vvJNLsJtR7SL2o9BaHp1Zl5ARjL3b8oVDQTZLhneL5yJxBjF4coC7kIkKVEdet0Z3Ur1x969iape2lyF3HLD3MPh6JfjRuqZGVOnSrZD38WeGlOBsskAqD4JNoikCn9+SR0FqggrQkG/D+20PHn4n6UrDLpIRETppqxqGFFt36Aohhmzu0J9p88t5rbqLFLrgZoaK379g9BXhvvi/yl7S2n2Otf7gMp3Rt+7E3TWts1HXCMIV0Pg0gYq0cBQlZjXTNk9LMBORGkUj36jFtIUKaqd5aYxDBOQ+gWVBWNZaAzHJuj5iQMrUk6ORHvLehnKSiF0KjaxND2krIc5LiL2qhL1D5tA3FY03GIcyLvaSTiHn0MJIOiYT8lLiCbWPdfh5RPbJqPcWRxMQGTs6cPNGhJOJ21W5LKN7wXspSr4aYlEPTaNQExXMP/nSi5KcGIidhvszXD4Bxm3JW5bSZdBfsrgp6U+Kmi0L6MjQqTO1b1/s3cgp0EZqmk/whZeQTwN1ubfPFe+nO8aWpRM0i4qSvqer3iNCIU+IATKK2Im43h81sTMEoQpSwaWzptFE7wbesr3u3LKhbJLbac75kneeLJfuP2SdHBpMhN3rvEfzvHlnYwYypY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(2906002)(110136005)(186003)(83380400001)(2616005)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aY6Tg7x0MZpdn+pOr9Hk4/aFxMA2qs0ivPDhAo7HfmctWlxmu7J6VbsVWTU9?=
 =?us-ascii?Q?a/Lz5UXl3jf5N6W+aeQ6Z7b0Z0gwzXPrMq8BE/AtT1JKeeXsNE3B9ToWN8dj?=
 =?us-ascii?Q?4nHIxKhZT77t1AfRR45sxVa+ztXkypG34tMri5uyle2lqM8xbJaAP6xZNRLv?=
 =?us-ascii?Q?7YD0ljIg7KJOSvv0JTzQFHmve2uCg3FqeTAuFXx/gsV0fIOGWeyd7RCNc490?=
 =?us-ascii?Q?rs3TAKERyYUkjhXsTa83dsUruUzv3a4+Udk9JQ9BG4ykZ26mvaIDhfDFJ6Fe?=
 =?us-ascii?Q?anKYhj9zi0S/81AwSU/73/vykxkjWtChxelK62MF0QuKIeWE1VBL7cj5AGK7?=
 =?us-ascii?Q?Cfrp9W3T4VFxBizOXuDV3QpcP+v4h+dRg1i2BOUbfkwBSelqUEIi4jwKYl8Z?=
 =?us-ascii?Q?VQWBr4TWNUa1Mcz8rtJR0WzssEP9v7L8quJ1Zvd7S0Mk9qKB72R+xvhQuqx2?=
 =?us-ascii?Q?lNiWFqH/mC3FoUChF+/PouXfgVJAV+230SzGT0V50CnlJ6J5q4A4bShw5ps0?=
 =?us-ascii?Q?Zks2mn4gH/jcxI6pXJ0uT3KoJss2v8JNllpb76Fj3iFd95ZxGiI+mmMDyr8I?=
 =?us-ascii?Q?nqq8SYw9VP6X6N2ckAUnmsUmydDk3CyonliucnSg8VVE1VUx9xtfhh+ur0B/?=
 =?us-ascii?Q?hmno3PIHPPBrc28B/eZlSKfNc8fa9pEChz2GbEO/CZ6GuxOTZu/eihKfhl6n?=
 =?us-ascii?Q?2fgFPnbf2hVN4/CikAO60FuM73VYvx6qyRfG2TlPAR6IPULtQhh0OJyODoCy?=
 =?us-ascii?Q?r+EDOwiaeFpnXAj4g8ezgoKH+/JvO02zf/yV9qvlBQTn7C+CFW2Dz/q7Rmj/?=
 =?us-ascii?Q?0QmMjMK7pws5C8qEsGjZ2rAq+eyLUUq/wEhe1lA0HzqmJKchuAh2RCI9MD8i?=
 =?us-ascii?Q?9VShSqzJh2xOzHR21fzS2J2vpFESXDMr9qOjym/KLh8yj3qNx/gKioMvaL+q?=
 =?us-ascii?Q?C9mywJCyGTdANzWlUf/R5cLiJV274lL4nGh1S3qEDJ0Z3xmUZIkpvm4NMwUD?=
 =?us-ascii?Q?eFw8p7RFUlY9VaModLuR0ZMSlHc/CAgGSngOsp2q/arrmY1Ow94Ogdl2LQIt?=
 =?us-ascii?Q?OvFmyQg3rEeu29Zeq8og3/hTsCE6f2w4bxKz4FTwUgxmNKCD94TbC7sCGKlv?=
 =?us-ascii?Q?wfVVZm65+0wEKw2aYnxrhJNTl8ngO+IY9SJSLVwPTnSW/hLvb7RxB9frAZhy?=
 =?us-ascii?Q?GnlzK4+LVeXk4Jb5Z6mDwE/mgp9TkSLaU+uzVKXvSr32sV65GYrZnOxEMntA?=
 =?us-ascii?Q?4tLeBJYY+aX6QyGLKxTIBEb91nJeSBpEm/YJIun+vcCQYWBgQ8a0jZY0RGJY?=
 =?us-ascii?Q?+AJ2Ang1/oj9qUKqWXJNO3bubvjgJOrSe4lFQtPBygp+ukPp3GKkRId+L0UY?=
 =?us-ascii?Q?1OmJiTE/j7LLQsh5PcJd7xA++dRUU0cpe4jrr0dvxVF5pBkWyAOi1h1YXOvo?=
 =?us-ascii?Q?sV7ksJaRG7P/qzyiP6PoKyB6WqnGwdNwF0sh9MpowRwqdJL8JzITQqGdbpz4?=
 =?us-ascii?Q?QZu0iB664f47EGOMivB8xVYhy5MapDI7AQnWiv5n9+17DuYyuoCd+ow5a5BT?=
 =?us-ascii?Q?EATuqZH/DryGUyuhrsGsNDYHPjTYS8ufjhLlr6kO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3868ecb4-c47f-4e0b-4398-08db80f539fc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:53.3353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iESXSuJ5tH9zTJ28KL6CvvKAsZht5oBzQSSZ5CXcMi/bUlKfcwJ6N6crtX3fqpnkKVYThrW5DZxXGjvUYF+6eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index c09ba019ba5e..14661912e60f 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -246,7 +246,6 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	struct fsl_dcu_drm_device *fsl_dev;
 	struct drm_device *drm;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	void __iomem *base;
 	struct clk *pix_clk_in;
 	char pix_clk_name[32];
@@ -264,8 +263,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	fsl_dev->soc = id->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		return ret;
-- 
2.39.0

