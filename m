Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E14E74CA69
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E109910E0C5;
	Mon, 10 Jul 2023 03:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2136.outbound.protection.outlook.com [40.107.117.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF5710E0C5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoMU1eS363rGzlSlxG/nY0Tce946hFbBFYM54FHL6NRZbDHp5b1bjI6DKLafN4VG9txYUsZ9j7Gzg0Ufda1agApsqueK4brXKKFAODLdTaTyBkqjfrWNzxm4mhmHdvyA1IjPiJH5Fj7RcsIGCYoFR8db0bNgxAePn3z36RyJPbMKK8w7FdobpML/2xdm5g7CPaaL5qOMcOX8KXmmSpbbYjZGy9l4acLL/WLBjxwZdEEdBLzNoguliwEUjEIi1kvYAKyMx92saflTIFLEhkblOaWms9MilSWNdUqllqANiqY5InrGEneiVZNqhkYxStz24Y/irSwhTbYIXJocvQbo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJZBSlaW2G6WCkDU5NYrFjf3UyvJxq8V/QCqrMhiABE=;
 b=AzPmEG3EZuOfggJpGYEci4rIsHDENH0DQSTCNILuB0jSktPdM3Gdxq/Da449ApklMl2qTrYcFcyyl4wpQvcDDTi8NRB/r/qwp09fwrNOstmkQ/D8YA636cewM11juovlZjdPXNFPkPM2Yfbx8+n1PGnjvoHvLyJ6wPIn1OLYmL/yxzorp9fswS38Gt2Y3mNH/pSnV8eMHm6PDJ/LwjETJeIt1kb+PNCnCQvpCoFwgeI9C3eh9UXspj3WZmO1PKL8KdAV6YjbgU/InmOio22yVUK9XskjAKnkyIJJjNHzkFJ8mhZEhUqzZ9sdzr3n/p87zfHct3m8vJvzTiLrg6pU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJZBSlaW2G6WCkDU5NYrFjf3UyvJxq8V/QCqrMhiABE=;
 b=mwFbgMTjrxDJXoebI9FYpJL727HSqlL3Nfaaf0AZk4NnP5hXTt5d3FkwwjN9T0aliCOXCj7IEPYh/wjL51/YwM36ONesdQsAI2pfa9G1diFWZwAhl14ssXwL2DwnYTFdODg9HbQV0P3WbcHeODBZHkuGgbU6lFg0abVudIfMep3SmAapSdT8QXD5EcT9SW+SEIA3QiBqaJ9+GAZ2NDxYSAPfFEOjeFXlW6sIVQ47z0BYAt9xt2pedg1Hoa2syQ/BUQou2GN4x6pEARxN/rpfJFaYbz9SpCbFS1kgq0V0ajHonBuOtqb3DHo/ARtbSqjN4L9i/PItduD33Zz+7aORvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:19 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 05/19] drm/tegra: hdmi: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:41 +0800
Message-Id: <20230710032355.72914-5-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 079491d3-1f8f-44c2-4ffb-08db80f525eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4H0WPUrEY8T14llq9Wx7v+otZ7snWgu8NeHjCEk3noFn/eBOnqJqjHY0m/moJdDk9tPSetrgl6pta64PghynXezmFptk9hJHp3OFI98r+JiKYP/czvp7JaX1aN6hOWcqiZ2H/zYaN1ykn183TGN7Lzl36YnnyGrTJcGib5uR0CAOfL7LhCuCwZi7e8O+vHn77e42b6r0BOnUXY0iCTrRbZGp8JAvTmm18MAxWOUWHAFRrbYvpx+ILHLOjC1vUqUi1I3QTqa9drebZQ+t7tappXNT9ai8SFrg1QpX2ygNbflqp00l2Klx+Ap2dA5BR+Vc29TQCRuTolBXC1mwtJmja4Ve1BShmlRe++bIuwV9605mx3Wd1At2A/ck3Ap8fxCb6K+ONhE44Qo9DaAqMuZx6ozxZEsS4Z+5bHHTUjHFh8+6vBUTQhtGKBhg1VPkYFj4GnDqJ9Kz5wrL8vD1W/oDhnemgXMuluEa28jTiRDdqGi/e8BBYvphMtvF8s2xVN9BgW/N2Qu21FzGFx1sCHZvt6XJThC3G368CsEaTms6O+nTImFvyD051G8jzbie0gFJo5/q4yKpLYaA5dHfCoSLfiYQqt//x8AQ7rO1b4tuzB9U/UOF6e3A3lKMnflLj6Ko
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(4744005)(41300700001)(4326008)(2906002)(66556008)(316002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3qSkkuTXhzpXb1MKhWC+GFGJSJuFg9wsFigSa/9V41XzVE5ramWZuKrAZP/2?=
 =?us-ascii?Q?HM7APxsB7NAI/HM80ozeuiKSKvuaJnNtXU4cVLQp9BietkS3yEH3dhpjnMut?=
 =?us-ascii?Q?3UgkneYSqHrgYHyyGWTl675xDd5jDBeLCP5mSGcxgJp3cftV6FNo+fNIu94J?=
 =?us-ascii?Q?aE1LkDGdRxBtsqOovRHNB6a8+1pVDyfOnUYpCEfr0sosfGoVaKRkBaojKj7e?=
 =?us-ascii?Q?mCvb99MLMosUgZmSQi6ua9yRKyP8LavMMm7KZhP12A0n73Fa1kSJl8gPjTdJ?=
 =?us-ascii?Q?V1YD4Uc3f7N7WDjbqHtHApOp1sTLHFIbV7xS7oKKz5ICVqEMWQZNblxXcBwq?=
 =?us-ascii?Q?qtgHQl6+tngk4J1mMrvpj6fNOwQJPih438eZKbAksnOUg/v65bLfEhMCGooY?=
 =?us-ascii?Q?JWan/KO7Nezs1wsN8VMFJyWjg4szjCSQxcf4rAxxJu/rXGMD3HmUpyb9cnT2?=
 =?us-ascii?Q?oqZgilsky4j+plrMboNmk7gn4PFdV8yZunXzwQg2BnhxuvlZNz5tjuFJz2lo?=
 =?us-ascii?Q?9P09boAE36sgnA+iaz78xiQLp9gOCXxzzvuv65xgWxsZPdn7sCBdekJ7TeFZ?=
 =?us-ascii?Q?68ttXEAewpYs2TeRGiQmH9c+Y/FYiO8r5f1QkeKadzcDvKCo+0+rsompdzHB?=
 =?us-ascii?Q?wqecHUc90kcETohLm7JNUAA55Ne3XaWbzFtHeHCipT4ZWgFTIwACMhokZrME?=
 =?us-ascii?Q?b/e7EUgKtTm8YEPrEK9hVVO757gxVN2xcTPw1gF4FBcLm2oI6+B2o0Tgum47?=
 =?us-ascii?Q?uXCrc1wjFHHoEhX0nDd6yJaqCVsKqKbVAxCYsLq+Y1+zRTi5VW4TKLVoO0Qe?=
 =?us-ascii?Q?HtH5M3d+s7gX0+1RY0tr59qgO7nRig7cdPmPSXPPh7IsQ4Q75x/ePStZ9xON?=
 =?us-ascii?Q?Smdy4YsdQmuvuIHB8vLM5yJ8t6p+w183jPCQXGgprOU9Gb+khp4Lh5N1IGLi?=
 =?us-ascii?Q?EB3kXSSWU3hlegQBy8MMFU1a2aOPUXgWW0cq0lc6+/Sk8d15vJCusvFS1Lik?=
 =?us-ascii?Q?MfusjMMBCTAABiZftYuDZXQLqQCij4TBjYQpTdnbAZD4dS49cE1bFMDyDG8R?=
 =?us-ascii?Q?iQzsMhp4pxfziAG7a0cfvm7rJCksniavuFU00s94zcYEZnYCjugeajyFx62y?=
 =?us-ascii?Q?gC8MYCIvY8lhRDcZEe2RvmY3h4n5S0LX/R1nat01pcOD5lhyN1DNaFtoTUIE?=
 =?us-ascii?Q?5/Dz3s2DBQ4EBIZUgMeqDdHqPq4Inlz4mb/MHg0JDF1lnxpBJIbP9ohAyxgz?=
 =?us-ascii?Q?OHMnzJESluis/J20ivqS7ju7LvebmANOqzOAiA9jtfKxgf35L0jrUguDeHAU?=
 =?us-ascii?Q?WNmQ8dszrWAFN+P7Coy3+cyjBVknrzB3922slNXqVUPTDcfDs48LqyLp1KFb?=
 =?us-ascii?Q?N3It+Q/MKxO/0YlwCMUx/ODC3kHUXpN6kArHjgCQxKmo2Cj7GYcpL4nu9hqm?=
 =?us-ascii?Q?OVxryQhjh30nZeny2q8e/r8ntjCD5w8X8OcLcdH9T4334K3bx5tlyIBQZ8F4?=
 =?us-ascii?Q?WVIgdbH3rAjw3zUGmrDdcpMHg0AhjfklJ0EiXpsvoCR//nsTAqySFQToiqo6?=
 =?us-ascii?Q?GuObafC2ncd4HoLdC1YGb/xYKEhlVll+iouoTNpV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079491d3-1f8f-44c2-4ffb-08db80f525eb
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:19.6694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcKyYI3Fo+ien4dmo63b7ehY5rvklc0qY1plp5yrKM478iuSZASNIbI6MnidXjjiFjd0oed8mHCFp8lbwOEvDw==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6eac54ae1205..f3a44ca87151 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1769,7 +1769,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
 	struct tegra_hdmi *hdmi;
-	struct resource *regs;
 	int err;
 
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
@@ -1831,8 +1830,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(&pdev->dev, regs);
+	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
 
-- 
2.39.0

