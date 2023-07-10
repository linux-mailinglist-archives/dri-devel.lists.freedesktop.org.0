Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE98374CA73
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E4E10E148;
	Mon, 10 Jul 2023 03:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2135.outbound.protection.outlook.com [40.107.117.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAE310E135
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaWgxSKQ6JCFHI4umV0Ux3PVIJvNkoGFv4IEUnW5xaeyCZRgLt8nyaWmuPiIlqALJunvLDw13wvqs6tXRErgxX2jQ2j2OFYIW8cUje1fhQUwwLMH+2V3/gCDl4CS0QZ6Wmx/xRZ7WtjYcifSYRpKVa5Bs4kIyZU/+OJSF1hD946gma1se4KsUpfCEXdm5LXU6t8hPwRd6T4KU+NW9ZLA076/wU1fuovaI/bw8XNppxfqUXiDKlRnTkTaj4sDb7fuPFPglsYTLvWM7ge3QzZCjFirJrRAY55YtEbQWFaNWCqesK+Pi2Em8qHpHVypv/YouD+0jgytS8BV415tm/ZBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc2hhX8ccpa8NG/KKmOqSpO9dEVTF11haptmKKeHccc=;
 b=n/jjATVCQubbmRcr55hdEr5ja75flUl11oUjGSbXkYaOhb0vvO4uxYk/mvt8fwezwWoLFxMAoARnD3cBBSlzoOz/eVS3Gt7Xhed6dfWmhR0KjP93tIGemvO0yYNlbSLc/p464W9CjxcBgphZ7+tjTeFjrNAQDzX/u5UYBQqfWcO4Es2DV0aqOjwt7bbaiC/vbQNsFox/Dm1hE3ji55uupfcsIU78ZEoA/N09RwlPpP8KAErz4dtEbDGwALjzHB9Rstnr5C/97WfrsWo8QsZB+ejXi60r4yAwraPFdLF7qYbUhsjG4YfhIgep8xEel+XTJreLZQJgT/m9/Y2KguKuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc2hhX8ccpa8NG/KKmOqSpO9dEVTF11haptmKKeHccc=;
 b=qH6GLvQqwmdiEMc2RmE8pfKNue9NqnEVoIzvcbphfB9wFQfkMqQZI+ryEIHfKUD1Duywtyzab2oAhUwad5VeqRYzjcbAD8Z3bbirjPUXj6+dafSGDJ9FIdBUcCEjneiKKziS9kdmLnwhOuCMEGinpkcdI/pJoVJqYoRLGode7HVMDVCjHgHs9ZlR7v4g0UpAguRbvKUzx9WeTbn5DWnKR56HuMROfRzu0Ogu9AS7wD8Oc0cmvPl15GYSauhIjuAzChbsqmJ2f5wQw/A+CQmz7G9eBsFdP/TGSFWZMrJU3p19RGSp9uup7979Nb8g/7Wvw/kbyDdyMYXlqT6h8gr6kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:34 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:34 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 11/19] drm/mxsfb: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:47 +0800
Message-Id: <20230710032355.72914-11-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYSPR06MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad84b70-0257-4c81-ee7e-08db80f52ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5W9ZZxaOQ3gvdW/ThFC7k4u6IJme+VJXVIYsTTzuDYjY45ectMzN+DZygtNCi6VWcVISVOQCXIeD4Zs9NF04VugZmZPtCdWxFhcDqYPE2Vakp27+J+VG5i2nzeGEmLkqe/F3o1KVcGHT/6OIMDURc741q528qyzGRQYNRH02y7uh4dk68tNA/ZGbejrWsxe3gkj2FHHnPqCo/l9pqEFvm2KLslzbuie6iSY2XF1dVUCXObdU+Y9yicuL4ZKL64J6iULyykLvqydRHv91/SxdjDlPXot9Tcm7cV7RbXMEP9Lwrio396oNbjBwsrouFZ26zCK5uFDG+/Dm2azm4T/BXwNPgmN5X18K8I3r+RCGdfvyGtOSrNv3yw0gslno1tFM+LEbp9QpBuvLlwagEl6Kwuf/T+XXix/8bTNcpWNn92aYQtcvvPnfU256zYjHmB2/mRAWd5OLYiW58srvxPisEAFVisZK+hUY+gHbXa3iRN71f9tPQYMhxmTZW/Tu/TWz1ZV617g8+8nSH2xIJ8iiOyZ/y2RSJ8tQzx1QGKOmX9E+vFi9Va/hJrR6G5WKMbj9wAVEWay+g5CeQqsV/+nJxp0PzAmQz80h0G76ZRvQ+UKJxTMtCGzAsF23fxcP6eS5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(7416002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNqrbERRGTUx5ehj2cd3ilhfPaUEwB6kHSupzJCcpR0VfggjcH/fniQDmTOb?=
 =?us-ascii?Q?EY3z7irtz0r9jl5UHApCrBGCDEwp1ZFi9enNZN5beTEn/EVQGi1jBJ25izzp?=
 =?us-ascii?Q?xZ5MaJaxTeohnYAVpBO1+M/NHhlDCAJANIb9z68WKIA5NHU05oUTin294tg7?=
 =?us-ascii?Q?JwgoWpT0C6zOPyUSuwfqqEUbYeUl5+TcoFPudE9coXk98flMNnJon58Miv0V?=
 =?us-ascii?Q?m1O5sHmcQI6XFx28vdp26KlG14g5CjvYx9uTF9uXUFctudENaXtpJyaKgowd?=
 =?us-ascii?Q?Q2RqdR1ySwLPPsl7ZDg7UD9CRFu36AEvNB6oSyvbHwF6jcogz0InqviK+IpV?=
 =?us-ascii?Q?KIZ1gybBXHjqZGxt6SSNAruJlOfJuiXMXCjOP6beG25ElHqG2IL9wtEK1u+L?=
 =?us-ascii?Q?VnPlT+VPxrUZ6+6n4FTfsYbRR+NtUQf9Z4xvRbrPzxHYiibrBWcVuS2b4Rmw?=
 =?us-ascii?Q?Ck4E4NXn+OocaLr0kKYDcaef7WebBzonRbUKLtGj04FOq3Z+yFSWTLi+yOkb?=
 =?us-ascii?Q?vz3R5fccbTJiPdPTKTh0adz+p9XmisJjWd2DxNQyI7MWFjecgzAirGGjGYdy?=
 =?us-ascii?Q?vc/5z4QBgcVg5yauptGvxigEtC6QbgIpSsqN6Ic+310zAIhqzdRFZF4ihLFr?=
 =?us-ascii?Q?3tkrbHHhQdsbQy8Vm0au3YbkdXExsd5nb4Gz2MYbgWANorp1WyQvWIKvKLD1?=
 =?us-ascii?Q?kUPdvK8mi2pHJnbj+erqg53W4hx9ptbFMinXpGEtSKgeGI/xJsz+JcE9i0+Q?=
 =?us-ascii?Q?Kyn8hOiCsxANLABUQhCM6ObyB7tGbsOms6gOAffO0wMt8FyQYW78B7RmeA2B?=
 =?us-ascii?Q?/Nq7IjNgbQ8OOKFk4keV1xikD2eaIWjO9hpGZXM86OiPnlZgEVRv3t174uic?=
 =?us-ascii?Q?b/w7djrUouZi65t1bNjlPQ4Kw7fps7kKt4Uxszkh9Ja3KHYohD90QSSmNV2R?=
 =?us-ascii?Q?50qSTY8/LQ/STkHI6JfHbn46tn08HN/qkELxJUQq06LHC/YpjtGh9eJQlekr?=
 =?us-ascii?Q?eXxGW0vdgLdpZqwGgH16HPMkGSh7CkWqM9p0ir+Yul4GV9CVVT3BqH7SQlhU?=
 =?us-ascii?Q?bJwNCiIW60YKRRtESfOCRn9ubyuphAIo77yzO7iLulPU4lQRDUM1y1s7rNjR?=
 =?us-ascii?Q?uhxFZbKd5+8I9JsBOYwtv6IGWH9fL4uXAgwQDMxxsYfbAftZAtIgT0rGQGTY?=
 =?us-ascii?Q?5QQw9skfGviyJ71JfH+dWOXGT/RHWf54n3SRvgP9bhbTsLXmMscxmiUjGG7W?=
 =?us-ascii?Q?8gEb2FPPXDowJO4IcD4fLeBB/ouiViFx0fS3MN8IWI75xrvp7uWDqE/MOfHU?=
 =?us-ascii?Q?EDJmeAP8STixROTM2EtRR0rq1mVAbufK6/DVH81GLQ1cyMWB04Xa693gf2sj?=
 =?us-ascii?Q?j9kDwfiOVlwZOy8bFLElYNQjZCOvPMmyzrQF1hgCwV/cd4x+uJKMnrTjNo8C?=
 =?us-ascii?Q?FUuGCuSO1/+fSnek4mRm/XKgw27GmcjaWIaDLY/02pBwDRBoexbj+CMc1IOg?=
 =?us-ascii?Q?PvMWE05pBuwA8LUZl7yMf3OOUYk23T8DI+ryfESXiqgTF4/AUJlV9+TOyi3F?=
 =?us-ascii?Q?H7ZRPYQLPIV/uTxjIva+V0bhCWm3Ex88Om3qkxHX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad84b70-0257-4c81-ee7e-08db80f52ed6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:34.6317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwzPw5ooamCmS8pJscrFidbza7t4b3z7kyi3p//tytv1TvRM1pU9eFndUZMYEEYti2SQyZR0uaz4GMpcEtt/mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6472
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

