Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC34A74AE75
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B430F10E54A;
	Fri,  7 Jul 2023 10:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4290B10E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arfFBUQiWe5vc22M7GVVioJLdjg2wXMIGsIsfLABqpolge2FwzCpTSM8fpRy9Cw84214kGM9E+5HU7efk42/91SBLvFsad19Efpm64ntQlwyiUUHr87MYv6ulyQRPpNAsNzqmoJGUWDVkjpRlDW3KIF/5zZ4LRpe3Xw+Ku8UGVlmnB2xOvYawa0+9JNwAS6lBtvKlv0MB0qC+U5ekdbenxDDqy4G8j8aZ3uzsK+1xURakykC3W59rS99iIyBY7TCRgQtphtZ4STmDYmKQCHNVBIMSHZNk1D81XAGrM6cXhlRIFaUzem4XpvaSCFNL0cMRabfLrsEGPzcMH7mJZjP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUtCUGmPwdZL1TGN9TvsBV9CwQ515piuDigq7/yc7Ko=;
 b=imvQlgYi/Js1gyuEOTQhShR2ZKz9AEDwTYPN3l4aOuCBdn70BxGuRF+sZwfwT0vUYz+cm/o3NBVL+O8krAmh1H1V9LgxC6kkcHHSauxJRgIOQgeyPmHbuefC5ieUnu16GHdhnL2+Kt7ZyR4qeiyEgjooDRRlnHA/3OUKxSVx1AGjG5QgU6RJwFCuySuHw225LLBn57PpGozIHDpnnTmFeoRQGl1HTVDGzr9v9iT4HOSBhaS+W9nd4CywrDzTxA9QJmwR9PLucbQbl2MWOrwrcD0Z4DP/neXnSBXhgB2leunGy37fz1sXPX71unMXBX/ohHxJ9aMVIzxDgPh8Vj367Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUtCUGmPwdZL1TGN9TvsBV9CwQ515piuDigq7/yc7Ko=;
 b=QjBW5/X2BzhUzbNXo20u433a3RCscThsUYPILq6u3ZFy+XMWB061HbWtTncccRpZIC2ZK9IthZZ181zC/wIkSddD8Pttm3KH9xP3jYj+tLWIHhD27yOzmvL7xNbWVGwB5954z5x8I6eVvmaOOYC3kh1UJw31CqkIUgAPMEQjNZOxTqjxIbQ9OI2FgK3MgSbR/uc+z9M/7pTh+Li5kSjpk9W9as8SIOgNMNwlO+C+e8PzSwa3SHXMth/CixETRC3xwOImbNHv1vrqj9o+/G+mFRjyDFgR1fePHeiXXC8HuRfzAa7e1N0svK+GJDKL//R9BWeYhtO20SmFdsNHeImVeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:20:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:20:59 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 07/18] drm/bridge: analogix_dp: Convert to
 devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:23 +0800
Message-Id: <20230707072034.48977-7-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6dc5ed5c-1f05-4832-d46b-08db7ebab642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VcQWoWkb6SnDlVpvrzyps41LaeILxuGptiIDQtMdjl2PHbzqyyJ1h/KL0OzpNqeE0OCe6aR4T7wLaTYA4ccB5ak4Yhx0gTEnUql+3Ei/v95pOx1KhKC7NJ0ViENPP4REc4VxFJHJpE34xca2O4lsVOMgI+ob2YSeExGAqXf9wPelIy42DDiuMh9ojFgFx34maQFblCFVsD4Bw6wTc5MAx5FVDXqLEknbzXfzfcFxqZbmyr6I+NffpBnr79uiD0daimeSsQnGz2150upHLXqXi1sHwHrUIWzZBs/STu5unt1673WIjlirt+hS3AHuvEwu9Ear/5eKaZ8AmWHqJkW3bY0935WBR681GlhBDbalBsXciakfkdqQkwYGd65WQzRf002xk8h6dwMAA81hQT1Qqg0kJdUYMBTMfH7So9XC2OhibeS5yVPaL5DLi6gx7YfO3g4Z9R72enDt1Jj2gY4BFbU1ZxejjiYK48RQMKCd+n7zKVmvdDNEdgMlthdibb4rbczPOyKJuiylxruo045H20cEEhqZGU7Rn6Fq2AXRT8adhLAa1LvEoUmGAk2kLjvv1FHmcE1ZDpuADAWn0dSiMFqe27buCat3OdJogXxo8Q8+QheOMQdpwB0XkPNXO6L3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(5660300002)(110136005)(6486002)(7416002)(316002)(2906002)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(6512007)(478600001)(38350700002)(186003)(86362001)(2616005)(38100700002)(4326008)(83380400001)(6506007)(1076003)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0Rpm3BaHmKcInRz5SRED0rep3S7p0t26T4MsLED73SmZbTrJENWG95Wg4rZ?=
 =?us-ascii?Q?d2YD6vWohYh2fnAkvsIZy+Mx8x04J3vj/UiBjytL2reUnNDPXE/BE8lJK7ov?=
 =?us-ascii?Q?xUUMd0+BynsZt37LxK65qbFJFlOUIJkTOLghqhIKGqSdbJPRGSDnosXngznJ?=
 =?us-ascii?Q?36YM1on9PKDmtNRnyQsmSNAbFD1cJ0nu/5SkvjzgmM2KD/gtWYBiqxfPatNa?=
 =?us-ascii?Q?MbikEb8r2MpBQidbdc1diBWaYpzDOSMW5ck4ejQgKHZdaPcIV5WaEwSnR6Wm?=
 =?us-ascii?Q?Y3YCpht8v+T6htEsVT7EuhXAqfG7XzigZO5YdPAFEcGZ951YRS59hZ7H/D2k?=
 =?us-ascii?Q?3xpZYVkSk1s4L/v9T3fGNNoAt/88kb8tmGNAzYARWkEoilI0U9rMe0talfVj?=
 =?us-ascii?Q?di7nTy3SEjfJhf2BMrhgZmSaKuGGsnDkKSvhbxBIWFMPB5kRm1Y02oHKgoS3?=
 =?us-ascii?Q?bpWqRNQ7EHTyupTlYvGwMk7KyDw5TOyZclppxeyjShzCfDXti03U5qzIlLcO?=
 =?us-ascii?Q?AjhBL5fQBzCs4/vyeazRYxR7fJAX9Z2Su1r6Uy5NKVhGZIth4Ry8y19pdn7q?=
 =?us-ascii?Q?EKLSGgBe9RC/ahQcdPAKYRY62ZFpF/aGRY6ihlpJy889p2PXJWk7md1jfGmu?=
 =?us-ascii?Q?F8+51N1E3jgK3VnebPRDSIxhACEWBfLIc9s48kqsFmPNJ7hDgQ05Emkl6WR7?=
 =?us-ascii?Q?rHLr0u56BAyWEep3FIo28FhBL8kKMYQESAxO00g+FLDQE/5SGUaueN2LfPBi?=
 =?us-ascii?Q?rML6OcmAx0BhKW9bjNCCiDKfGHzAqQ3I5wRMExwjViIcC6iX7eik0HNhzmSH?=
 =?us-ascii?Q?4n4g+t1Ozsewl3dQxkYRhXUfn+TPe21RnbHMO/xLb6CiH2SfYnuSbuX6yCXl?=
 =?us-ascii?Q?apvSe6wBeslQ/55/9wV7VFaTrmAnOqZWAKwVEIXvPM3oHVT9EDKYp26mLXIm?=
 =?us-ascii?Q?ONurPYNr1VVHtGO9SRL6Qe+OtMR1+SjXlnfzY77EEgOEQFbMxS2QAKebwzfg?=
 =?us-ascii?Q?Bq5ru/sQ/tr06J4r2T/XEaBsusAFYm9scfCZa4P9GLyOgralJzhWvqxFLF9U?=
 =?us-ascii?Q?unZB1+PMWIE27FanR2Y32ixyFdslQkaclRFY2uhyoRpQp1ilSYeqLBuqlliD?=
 =?us-ascii?Q?qILOttONO9wrm9nTcQDkqr1O5OlNXAXQXca7sS+iJ+aztYbc4VzwaLzN++kI?=
 =?us-ascii?Q?20uPMVDnH8USO0wdyA/syuExwcWqs++XMDNaXYrFnNYTD3kWWk6HRyCROOBO?=
 =?us-ascii?Q?oGnE4gRcYDSQEfsEZ7C2+SbyhYNxwj82bBfBrJPXNa/FPMi/+QNTnn+Mzcwo?=
 =?us-ascii?Q?KzdTrbMKqTfo4a0K+mpY+GYOZeaTjaG3Un3qmq7Uk1Dner4szguYd6LH0MK/?=
 =?us-ascii?Q?Jn4LicCrF6XnfxchWodYSMW9JjYNyxOes5WNsILE6T5tomy34wlCpG9jO/QI?=
 =?us-ascii?Q?nOFWp5Nbm2mclbi16xSKIyxuT9gVyVjJezR/w6e6nw32gr0MtMkWbQObhqXy?=
 =?us-ascii?Q?dmaBRBMh0Xm//g8R/YYXrvZRJ5Bz4+KIFA3B7O/qc+cORycbqqavB3qGO+jH?=
 =?us-ascii?Q?1UYWf/EOjHNwMYpBUxOVtA2b28Nq95FhcM4Ni0Fs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc5ed5c-1f05-4832-d46b-08db7ebab642
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:20:59.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UszVXvr6Kebk5JE39/Ku5IqqXL1/u6LjTAgcbXyEz6BgdKf3n6XhOHbGUUnunoBCC+HYMr13Axesyb+y7l3smQ==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index df9370e0ff23..c6b228f1ed4c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1686,7 +1686,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct analogix_dp_device *dp;
-	struct resource *res;
 	unsigned int irq_flags;
 	int ret;
 
@@ -1740,9 +1739,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	clk_prepare_enable(dp->clock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	dp->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dp->reg_base)) {
 		ret = PTR_ERR(dp->reg_base);
 		goto err_disable_clk;
-- 
2.39.0

