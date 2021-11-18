Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C53455471
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 06:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165D789CB3;
	Thu, 18 Nov 2021 05:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2135.outbound.protection.outlook.com [40.107.244.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF5A89CA4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 05:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOenP2Cyj5qnwpiD8Vcd+RirvR8y4jSQUXTPGMMsBp+QB0Ha4WMPsWsZ7le8Y/dlOQN4nQ3v523NitgIaXsQ2aI8KZjrVSIMvcvpIjzI5Q2tNN/yNrqnOt2WTWzW/6So0LL2Njh5ofsSRZIa9jgZLK+88zQHSbvkizvWUcKQ8DlcMPzfkgO3mM6TMDNXwlpw0FI9rT+6YodZ4NkJlQJnOLve5g621H1uedwmNmMdskODIAydv1Z093g9yXR2CsycmxoY22mm8F9FXPSxM5kR+iK/MQjb7mFglw872RCykBwbwceh/0+JZgALl0TgAbGB+0bJ+du6mJBZ8q+YVAZfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1QrxTOqny8qCHu+8QyO8MBKmMZ6UvDidigWTcl9MrI=;
 b=SC02XQCL/DvRLhkFUt/VCkQYGPQ1yCFLGB7Sp9ICP1KjBRUMFV8WPU1+WO+7/hUzMA8WhGNLwu9oNuhNUb4bzV4xIYh2kCUo3lYp3ixs0HLdehrKP0o2lalJ4cKaSfnWtg9q7X4u77XAlv0BcUGNzE0A/FODX7j41PtoRXAUB+huKW0xqdBHl6rPNrpCqQzLnKjFOlfruiZEi2ULC2qj/v0CWiO5sjSi3ZfBX2PV5NZy4eTaS0HhujHINLW4ZJnvtdHkDxouPKCq7hZyH5j1RHEni8jO4SmCKc0DoRW84SpPLAye5zlwwfS5iJTWim5Y2mbaNmyQNK/z5W8cOZMLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1QrxTOqny8qCHu+8QyO8MBKmMZ6UvDidigWTcl9MrI=;
 b=OIjwAaiRP7ygqIf9/7g6022HT6ETo8x30oP/Xw41fQCx96Jqdd9ImBkuktLQAT0uU9UFGgdOFxy9NA7Axvjei8eqRumx6P/ykOA2aUkWRi2mLRMdQStJ4Tqe1IQGQew715zpFlrV3dcMwF/2n6YnF8qdFemjVD5BPBOG51teX+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from CH2PR04MB6741.namprd04.prod.outlook.com (2603:10b6:610:96::19)
 by CH2PR04MB6540.namprd04.prod.outlook.com (2603:10b6:610:64::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 05:47:57 +0000
Received: from CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df]) by CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df%7]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 05:47:57 +0000
From: Xin Ji <xji@analogixsemi.com>
To: narmstrong@baylibre.com, dan.carpenter@oracle.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH v3] drm/bridge: anx7625: Check GPIO description to avoid crash
Date: Thu, 18 Nov 2021 13:47:48 +0800
Message-Id: <20211118054748.3797062-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0185.apcprd02.prod.outlook.com
 (2603:1096:201:21::21) To CH2PR04MB6741.namprd04.prod.outlook.com
 (2603:10b6:610:96::19)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0185.apcprd02.prod.outlook.com (2603:1096:201:21::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 05:47:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e1cf380-d1cd-42b8-e110-08d9aa56f89c
X-MS-TrafficTypeDiagnostic: CH2PR04MB6540:
X-Microsoft-Antispam-PRVS: <CH2PR04MB654098463411D6AA645BC026C79B9@CH2PR04MB6540.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wr4s3QMP0bdDUI0kSDYKe8pA7pTwiUIm0Dx+nhe6prv/Fvq83AG34iyG0NWE8FtYL32xo+QnnNi/0EZXpP0b4/oMIeXWFjZrMZ2j6C/F/+hCFgWNy6A2mrLXScrpuxgY2MvCZw4DIfaNZxXjvaOjpDm0dGi4Bcb74pkoeU+uRADRQJHU0jzmCoFB2suuzd6DWENrVUnjLQHaLPkY/vUIRJCmfNC146KCyjK+vwgofP7KuMkS+t+/Q30vKohIxKGWXJ90wFsruyjDl2/Hra6Fom2HKXrhxgJuZNb/xMxUcrE1AEYKvY71MUeoaY7FIf2lkrc+S1eY2WksLAx8RbUr8LACCaMjih26pQplEf6t517nckU9sc6xGNNx8Hz6KgK0YWK7sowpCfYdkVh6v9WKKkT12RQTPUmdVfqQEV20GHmmDPsJ4Njm4es0TNi61Cv57+cgms8LKm4sQO4ga+3d6sGaw+lpH0TU4nDrCNQrpn7KLUoYbMQ36Z3xLbYJ65hlbChgf9uGGaeOcCixTAwZRfEKAhbF1+YWTxEVWT5Q/d/oUeDEa4A0YsITNX3oD9ifDldksmJzGTi2WKU2UXUhAsVpAPl6JE04/L4HjW74ue/Hs2rrRpes+Smt3G00fpJNoBsd/qlv22adMrvo5s/XpeqxZ65mXDgsDVAOkl3XSsgbEpA62Cy22yEkvGdI1YFfFn/nxUQfXr2KSvOXfX73QVC6koCw2bX/hg688gR9eUA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6741.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(66476007)(66556008)(7416002)(66946007)(5660300002)(956004)(8676002)(316002)(921005)(6496006)(52116002)(2616005)(2906002)(508600001)(6636002)(107886003)(26005)(4326008)(55236004)(38100700002)(6666004)(38350700002)(8936002)(86362001)(1076003)(36756003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V7zlszpVe0UCzIxi4WFcXRb2lhvoRxwpfASxqzn7KknryOV7LH1jGgTpDUH8?=
 =?us-ascii?Q?2ryjAAyqJzdAGAAmvK/Mp/yal9zjJuaSyidsk2SpVqBDaKD8fqcY+1bfq9+V?=
 =?us-ascii?Q?gbgO+PP96nVs0lgWd6NUnzX657meiDV9pBm/c1RphijVm5bmpTSTGJwNtIVx?=
 =?us-ascii?Q?8WST6J2/iQJX1MxoFueK9A9JcA3cp1tyC2YTY1fboZ88TxJS09jcSeUc/WDa?=
 =?us-ascii?Q?efve6KbEc2NnV7wvxYgF9q/LZGbnNaj74IXc0InNb3aECs7PzEKxmCmZXS/Q?=
 =?us-ascii?Q?BArJCfAe+FL3CA1+00rG6SeDyyd7YT6jbgJ1efbsHRSzONQaDrtBPHMbDYc5?=
 =?us-ascii?Q?bQS7UEelpJecOH4aZDWVvtpaC5d74INSyggFC7WJBw6uuwmRjpHi76QGYELQ?=
 =?us-ascii?Q?VtxkQV2hv/pe5xe4pFc0DBYaUkc626kCqaAhh1oBZW+bk5pUhOE4l8y9zdRH?=
 =?us-ascii?Q?EszIMxEDMjBVP6YKJXqbHhoEnc3bHHv3QZEPUTBcbI4FYNgpBLKLc8B2stL9?=
 =?us-ascii?Q?hgo8j8lHXupuEq88qG7YAdpmmFQhWwQGYHiomy+IcNzw5EuFbrt1UFMflD9C?=
 =?us-ascii?Q?YXwvjOE9tkDTqdtq6vCIewYn3IjDmQl9TI78z43Qw5zYkdEp4GRK0C2omxfN?=
 =?us-ascii?Q?Gm12n+jEXnd+NlmvQcaPST6MloxJeOE1GyRkDuMz0bmAwRa/XrVudr5lJDKF?=
 =?us-ascii?Q?DFr31WIGxQqvJIgH1LEo7m2JXjnYzyCMt3/fbIpBzBtZyYwq0qvdXcV5ZFkE?=
 =?us-ascii?Q?MwyVinclnY5w9kmgV8eDBei/IqrFM9AxUOSJZfkiH3IRE3EynZlW6J5pYS/1?=
 =?us-ascii?Q?TsAxR06gGgB2BccmaQhA/pKXcyCZlGIDG24ejAJwL2EjwhDTVVlfG3yUVpi7?=
 =?us-ascii?Q?Q9Q2YJHoYHsuQbWtVI7GcEbrHz/HmKr2zKZqBT/44RLqNzImPh7EmnDnFYU8?=
 =?us-ascii?Q?3v3o9CYvpmkJXAEAvtEcIOD/N/B4Bxf7tHwzDrfPyYYb8zuJki9GUG5QK0QA?=
 =?us-ascii?Q?sefIkOTzvL0Sa9AjJfoe2KjejSsKMieR9AlrsXOTCtKgnN3U24mXiCyJbWM6?=
 =?us-ascii?Q?gAr4JuwbaJpfv8hEJtyYC8kMzwfi0fFQL0kNcypNupgl5olIVa68Xww17Pqp?=
 =?us-ascii?Q?auig7yFDeylN1fqz66fYCm/LeCLZF++6fJYPpFKUSkTOM7ogeiJ3Gyel5dzZ?=
 =?us-ascii?Q?XkXqzK72V1NBPg0drrka1x7rsIR4M3vjMnTJgXNX6tAct7MjF64fho2cHQ1Q?=
 =?us-ascii?Q?eDkIn7E5845i0q/cBYthqVGdkWrMuwYyuw39O/JllllZr5RRke7wQZiSFTH+?=
 =?us-ascii?Q?7V8Pai5qSGciEipwN3PuQPqddZWdJjfQUqB1DpN/SneESrXHTycCKtf8B+N6?=
 =?us-ascii?Q?A7z58DcAT6QKV9qtpzlmWBXIgzT2FE28mDJdqZw7w1I7amKHh0vBFpLfrXsE?=
 =?us-ascii?Q?T4JsfH+fTsvFo/8ixjo1D7ODTQJ2RQ17MtZiBemRAL4ac8DVrITI/VPua8PS?=
 =?us-ascii?Q?giXIa8syI6aTAY2Vv4u6DnCqKRkhOlKDRgiAPkS0pOAFORYcR5QsgElqKfds?=
 =?us-ascii?Q?pnRJifbzleR44MLSQIKVSi7uO/vRd/rpT6Rb8NB8pMTy4c/siZPhfnu4w1/0?=
 =?us-ascii?Q?+FHdFkyf+aQwoPwC7ErhJt0=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1cf380-d1cd-42b8-e110-08d9aa56f89c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6741.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 05:47:56.8717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yjPT3gqjvqXE+R5j3aoLFRMktcnatBn66DgbfEd6+r9MzpIBQS0+5blPcSVsaiV1awjL159BN6DVxZwR1Y/yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6540
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As GPIO probe function "devm_gpiod_get_optional()" may return error
code, driver should identify GPIO desc as NULL to avoid crash.

Acked-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001fb39d9919..652ae814246d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1098,9 +1098,18 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
 	/* Gpio for chip power enable */
 	platform->pdata.gpio_p_on =
 		devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR_OR_NULL(platform->pdata.gpio_p_on)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no enable gpio found\n");
+		platform->pdata.gpio_p_on = NULL;
+	}
+
 	/* Gpio for chip reset */
 	platform->pdata.gpio_reset =
 		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR_OR_NULL(platform->pdata.gpio_reset)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no reset gpio found\n");
+		platform->pdata.gpio_reset = NULL;
+	}
 
 	if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
 		platform->pdata.low_power_mode = 1;
-- 
2.25.1

