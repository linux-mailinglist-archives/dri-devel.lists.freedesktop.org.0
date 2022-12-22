Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321DC65496E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A124A10E5DA;
	Thu, 22 Dec 2022 23:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2066.outbound.protection.outlook.com [40.107.6.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC1910E5BF;
 Thu, 22 Dec 2022 23:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOB+cp/2ZenWVC56AXYvi0QMqLdjEQZZBxI/yX4ymCSj0bZwUAYrI9TmW/sylFQ++fBBgu9DDupqlTpeBX8rtK6RfVczLDn3rstdWudO4xBsPKc5Ccvzvqt1mWzxTb1HGftWgc/clG2T2XitntV3Ba8YOaV7eCBps4ZNbGPwFjI5cx5b7DiN4nMDmWudptRWXYIjpDRBZ520WDyKbpvXxCpx4c66xaVN9+Jo7C3TwcNjcKQdgyyBWodhzIPgM9wgWFyc+ZewahzNeCU0YXFDObDg1SWgUzeOoaC925nM2hyLZnr3sqmIWpBfAF32O4LZP8Osrrfdp9UECksKGLwj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJBQsgZqHySR5ZJFvpzCoSAiWyJRIXKFYrS/yNJi4yQ=;
 b=ApyPzopBuElCPf0QfJjnVclcgzjB2uF0LMQsxisQJlcqxUmJQEGB+z3+W8jxc+jSKbRYV6GsgFv7mg3ETzkvFE8c1o3U7gEouq/dJRi9/Zs9zworvZ+5uJWqFb+K/wBvZr7NLqcxNcGxYIsgG8cwt1i5basU7x0OlN/QBOZArT8AXiU/X4ANjAbUCOmdKvAvNw6jVAFj12ugPV7hhUTTgz891KwsK2VCA65GjCSnSrwcLzOoLXhGve1hXFfCRoijx2R2W6jctmLOqgPhDExS7x/1ofAIcqoDCDUx8xtyjmIsnMC6fy+rU62bfodVKxB9PtFuBnbJzp+W9HHUHjU5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJBQsgZqHySR5ZJFvpzCoSAiWyJRIXKFYrS/yNJi4yQ=;
 b=Kxx5V0tmSntBCR5hSadufXiJxVSI14CMpcTNTBsut77IFRn6JW35ARk4uwSINfjoAnDZ/iC2MIZ2x7W3brA6W+zIqg+5bucsCkArQnh2rVwrAhPqnW/mseH2lstFFQZVbTRvLL9r6byBMuBuVTCDNWV1ba440xGnlVrs6CWTQmjs2UghhluVykWEzIw1hYP0MISQAksrd5iiF8pod7M7zBSMr15370avBpk619nzmWJNz+r//lzLf9moexF+YnpjdhvrHQfUK23qB4hi+gBEKzxc5sxUc8oFoQcnKIwbfcC42OgQUEbZhUrQqRe5PfY9CPi3LkOZW6+JvHXhzRByDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9100.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 23:38:27 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%7]) with mapi id 15.20.5944.013; Thu, 22 Dec 2022
 23:38:27 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm: Convert users of drm_of_component_match_add to
 component_match_add_of
Date: Thu, 22 Dec 2022 18:37:59 -0500
Message-Id: <20221222233759.1934852-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221222233759.1934852-1-sean.anderson@seco.com>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS2PR03MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: d0773e21-0506-45e2-4bab-08dae4759fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrRzdtGzlbVhGjlo5VQbmcOe9GYWaj6poLsMUMKqln6CpLCtfojVnZEzlt0EYmhFJE/4bgQSL4Yb3LzedtCSpkEfD8E8yJgYsfW/dkkAoipxnSUUYJS42swEBpOYnZobMbg3Kw5m9ibz/WRuGH5zXbE+8An+gWn5W4n+d+tgcr6yX4ehIB10q/IxtR9fHIGGqYtIr+sH3MUPkcxC/B8X26BcrD0olI5fGTfLv8FFSDRKHpPaPZjOg2AVvsIDi5tBpgi2WnJRgvBLHYiOZB1iqginMqRE8O2xrpR5RRQMt7BMH5YX4CHateWIBGnR8KEec6NVEjH28a9g4uiEidK9XdthCKfhBFSXMkrmQPfLlxXVW9e6TmyDGGb7j2/G4fd8Z7CFoqCfWWZBn0ShHJSnaAwKKZffWivEyBJZqjIOqTy8w9VQJMDdnuS5ESA3QRCMvguNfH8g7aDV2W2IjxBd8KoZ7SfQ9M0aVIE0kbBngEfslCXHNfnIVTypjgtBTdLIzV53EmanjnCphaW57huFo57HCZIRsaisq/Y0xUNYN5SeumHKss/zw0URrz55KH6gcV5gt4eoukOORHjP3mzseOJVTWLXkCx+UaeAHq3PrSWNaOuOuI5ZFmFyF05nSyEeCT91wDN+Z761YRViHPvD2rWBAFcuApnt/5674UylUNUXOB2eZOj29WcUSZGl17OUqErlB22qHUt3i6lOimYufw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(366004)(376002)(136003)(39850400004)(451199015)(86362001)(36756003)(110136005)(316002)(7406005)(54906003)(478600001)(38350700002)(52116002)(8936002)(44832011)(41300700001)(30864003)(2906002)(4326008)(6486002)(66946007)(66556008)(7416002)(6666004)(5660300002)(66476007)(38100700002)(26005)(8676002)(6512007)(83380400001)(6506007)(186003)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNLUGZVdW1NWmh3dEpyaDNSSDFyWW1oUGhmUUZIL1EwUDg0d2IvZjhOK2g3?=
 =?utf-8?B?djQyTGM2OVVBTWNRNFA2eXpKUTRQNng0QnRHY2h1cE5NK09FbnFwcGJMY2s5?=
 =?utf-8?B?cko4R1lEYkQwMGVZNCtIbGlWU3BWZ3hyOGU5N2JqNjgzdlVGb0V4TVp4WEZY?=
 =?utf-8?B?a0pjMFlQejNtOHNRdXRmQmdZd050NFcxdWg3emhHMFZDWnNFY05OWEwvRXM3?=
 =?utf-8?B?WnVHRjlrMldWYUxFWWlhSk9SNFhwZUdibmZwUFBPaElmSEkraWRYQkVkVEJO?=
 =?utf-8?B?SXJlY3ZxNG12ODV3SFpMV3oySDFHWWN0Qzh3NEs0ak9BZkNzZUZVL1ovQ3NN?=
 =?utf-8?B?K1FrNkkyWjR5QXBTUnN3b1FLN0hHMnRSZ3FOSks5aHU3V2FLOCtadlZsOTRz?=
 =?utf-8?B?WUUvYzYrSmd4NEROWlVjcFJ0dVorUjB6TTdTODEvTk13Y1FzTjBUMS9nRmE0?=
 =?utf-8?B?WDUrdEZLYTNzQmFWVU9XRGQ2M3lVZ0xZS1lndnFlZ0FiZU5zckNsM0tSR25W?=
 =?utf-8?B?M3QzNmRxcDFGZDlEK2U4VG1HRXo3dDFVblNRYVU3cHY0UUE2OHpUbURKUVE1?=
 =?utf-8?B?NER1dmpRMTZ0MXc2TDN5cVBxWS9yeEM4RURwRkdZUGpxUGtEdGp5ZFBJdW9F?=
 =?utf-8?B?WDVlektqeWdvRW1wdUh1TXV2SnMxa0xFNEQvSjZIMHRSZS82OWphcnlodGN5?=
 =?utf-8?B?TGpBeHp6RWRxUmM3d0YzRjRzK1pPeUJLZVRvYnpnSjVtTjFIMGl3Wm5OZmth?=
 =?utf-8?B?cW1rTEYyZEhHdnhIV2tsMWZJcE42Um5wMnpVYU1wc2lMV21VRDFZSFJ2RGR3?=
 =?utf-8?B?UGFzd2hCWStWZTBDVldjZVd3eGMvUTdic3VFQUk1Q2tFV3NLbnowMkVOLzlR?=
 =?utf-8?B?MEZLTHc5eGhiNnIzTEFBUitORmROQ3dGb0RXbnhSOSs0ZUxEb3BTS2l4ZFBq?=
 =?utf-8?B?OEpIeDVxd3l3TU5FSTltWVVMNW9heWVYWEtkWEsvblloZDhSMHhHcU02ZHAv?=
 =?utf-8?B?R1oyYnNFSko2aXpUaXNVcVFCVFNKRjhsaW55UUdYd2RpWFBsbjZqUlFidndH?=
 =?utf-8?B?Sk5kVUNtZXdUZkI4TDQrZjc2bkFsK2V1ZHcwQkJaZ0RVTjUxbnJheUY4bVBi?=
 =?utf-8?B?TCtjbHdQQm5ubHcvNkdmMGN0djlCWlBWNUhJSFdsN1pQS1VwdXpMdEVPUWdi?=
 =?utf-8?B?dUo1VHNoNmN3RkQvVmpaTU1scytoUnR1bVZGZW0vaWxnYWNPWHpOSnB4Misr?=
 =?utf-8?B?MmdSOWJOQS9LV3B5bnNRSFBla3N2SVdzdzNJTkdZajNyanhPNUtDVnVkTmpH?=
 =?utf-8?B?VStoeVRLZmtXUHp6UVN2QTU2dE8wVmZPSkJremlOc2VlUVhnYm95Ni9zdnVl?=
 =?utf-8?B?SkZ4WHVscWJmdDkweW94SWE1QlAvZVVKbFF1TVJrYVhQd251cTBIaUI3aDhY?=
 =?utf-8?B?UTVaYllBTENJYnFOY3JlM1FlR0ZqN0pzZWk0ODBNcEN0MjNoUFVITXZYS2tY?=
 =?utf-8?B?TndoekJQUGVCd0hBY1RmOHZaYlJzVFJZT0pxN2dqbVRZMkxLdFpkU2g3a1NG?=
 =?utf-8?B?akdmenhJRkpsbjFGWjdHdkpoYTNZczFHTG1XQjl6K093ZnlscHNSbXR5MmZz?=
 =?utf-8?B?RjM0cHB3ZFljdFlGNkJjSTZnc0tPeTRVSjdSbVpVekJFMEFBajU2bk10Y2VQ?=
 =?utf-8?B?am5leGI4ZWUrWGxoRTM5WExzeWVNYisxWFBjcCtDNDhnU3pzNk5IVWxpMkV6?=
 =?utf-8?B?dENRWVdvZDVaeXFVOVJYUDR4M21FVFJoWklUMldwWXlQRmhQNGcvZmRaYUlm?=
 =?utf-8?B?MjNBS212MGxibVJic2RrZ1czb1kvam4vcTJFZExxS1Y3ZjBrRmpvd3RnTmNj?=
 =?utf-8?B?QU51RysxWXNMMDBYR3ZDbDgzMmFMNFBZVnVkeU5kVXlRNjNjdEcvZnB3MS83?=
 =?utf-8?B?L0xSR21WWngydzJFVEQ3WXJYRi9xUjd5UWlEQXhXL0VTRDJZNTJ6cnhwLzF4?=
 =?utf-8?B?QXFvaUdoUDVuWCt3OGJQMExYVEFLWFNkaHdWbW53TDlsbzdvMmdqUHdXK0ZO?=
 =?utf-8?B?ci9TOUgvS3Y4Nk9JSmxEQ2xSeUZvRXNMVnlOeUt3bFNGTlRwWjd0eFRkS1Nu?=
 =?utf-8?B?M0gxa0dvdEhKZTh3RVZremYrdDFXM2tNb3lMRWQ1NmcwUXBiVGc1Ly9JdS9Q?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0773e21-0506-45e2-4bab-08dae4759fd8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 23:38:27.2123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoB/31SbI/ndNhK5KWP5CvXNmRWBgy3BSwSe+BIP+B121xOTVy1mGVC7xOz5CUd5661o8h8BpAZpH2o846h00A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9100
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-arm-msm@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Tomi Valkeinen <tomba@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every user of this function either uses component_compare_of or
something equivalent. Most of them immediately put the device node as
well. Convert these users to component_match_add_of and remove
drm_of_component_match_add.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Jyri Sarha <jyri.sarhaı@iki.fi>
Tested-by: Jyri Sarha <jyri.sarha@iki.fi>
---

(no changes since v1)

 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 ++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  9 +-----
 drivers/gpu/drm/arm/malidp_drv.c              | 11 +------
 drivers/gpu/drm/armada/armada_drv.c           | 10 ++++---
 drivers/gpu/drm/drm_of.c                      | 29 +++----------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  4 +--
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
 drivers/gpu/drm/msm/msm_drv.c                 | 14 ++++-----
 drivers/gpu/drm/sti/sti_drv.c                 |  3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c      | 10 ++-----
 include/drm/drm_of.h                          | 12 --------
 14 files changed, 33 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 3f4e719eebd8..e3bfc72c378f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -103,10 +103,8 @@ static void komeda_add_slave(struct device *master,
 	struct device_node *remote;
 
 	remote = of_graph_get_remote_node(np, port, endpoint);
-	if (remote) {
-		drm_of_component_match_add(master, match, component_compare_of, remote);
-		of_node_put(remote);
-	}
+	if (remote)
+		component_match_add_of(master, match, remote);
 }
 
 static int komeda_platform_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 7043d1c9ed8f..fa37ca10c80b 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -353,11 +353,6 @@ static const struct component_master_ops hdlcd_master_ops = {
 	.unbind		= hdlcd_drm_unbind,
 };
 
-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int hdlcd_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -368,9 +363,7 @@ static int hdlcd_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;
 
-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
-	of_node_put(port);
-
+	component_match_add_of(&pdev->dev, &match, port);
 	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
 					       match);
 }
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 589c1c66a6dc..3a49c29ba5b8 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -909,13 +909,6 @@ static const struct component_master_ops malidp_master_ops = {
 	.unbind = malidp_unbind,
 };
 
-static int malidp_compare_dev(struct device *dev, void *data)
-{
-	struct device_node *np = data;
-
-	return dev->of_node == np;
-}
-
 static int malidp_platform_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -929,9 +922,7 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;
 
-	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
-				   port);
-	of_node_put(port);
+	component_match_add_of(&pdev->dev, &match, port);
 	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
 					       match);
 }
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..c0211ad7a45d 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -184,10 +184,12 @@ static void armada_add_endpoints(struct device *dev,
 
 	for_each_endpoint_of_node(dev_node, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
-		if (remote && of_device_is_available(remote))
-			drm_of_component_match_add(dev, match, component_compare_of,
-						   remote);
-		of_node_put(remote);
+		if (remote) {
+			if (of_device_is_available(remote))
+				component_match_add_of(dev, match, remote);
+			else
+				of_node_put(remote);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..0a474729ddf6 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -78,24 +78,6 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_of_find_possible_crtcs);
 
-/**
- * drm_of_component_match_add - Add a component helper OF node match rule
- * @master: master device
- * @matchptr: component match pointer
- * @compare: compare function used for matching component
- * @node: of_node
- */
-void drm_of_component_match_add(struct device *master,
-				struct component_match **matchptr,
-				int (*compare)(struct device *, void *),
-				struct device_node *node)
-{
-	of_node_get(node);
-	component_match_add_release(master, matchptr, component_release_of,
-				    compare, node);
-}
-EXPORT_SYMBOL_GPL(drm_of_component_match_add);
-
 /**
  * drm_of_component_probe - Generic probe function for a component based master
  * @dev: master device containing the OF node
@@ -130,10 +112,9 @@ int drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, &match, compare_of,
-						   port);
-
-		of_node_put(port);
+			component_match_add_of(dev, &match, port);
+		else
+			of_node_put(port);
 	}
 
 	if (i == 0) {
@@ -171,9 +152,7 @@ int drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, &match, compare_of,
-						   remote);
-			of_node_put(remote);
+			component_match_add_of(dev, &match, remote);
 		}
 		of_node_put(port);
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1d2b4fb4bcf8..4a0dba34a6e7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -590,8 +590,8 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!first_node)
 				first_node = core_node;
 
-			drm_of_component_match_add(&pdev->dev, &match,
-						   component_compare_of, core_node);
+			of_node_get(core_node);
+			component_match_add_of(&pdev->dev, &match, core_node);
 		}
 	} else {
 		char **names = dev->platform_data;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 9c5d49bf40c9..3ee277615c39 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -273,8 +273,7 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	if (!remote)
 		return -ENODEV;
 
-	drm_of_component_match_add(dev, &match, component_compare_of, remote);
-	of_node_put(remote);
+	component_match_add_of(dev, &match, remote);
 
 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
 }
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 3d5af44bf92d..d0c87175dec4 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1444,8 +1444,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	if (!np)
 		return ingenic_drm_bind(dev, false);
 
-	drm_of_component_match_add(dev, &match, component_compare_of, np);
-	of_node_put(np);
+	component_match_add_of(dev, &match, np);
 
 	return component_master_add_with_match(dev, &ingenic_master_ops, match);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..abead814bfdc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -787,8 +787,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DSI) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
-			drm_of_component_match_add(dev, &match, component_compare_of,
-						   node);
+			of_node_get(node);
+			component_match_add_of(dev, &match, node);
 		}
 
 		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8b0b0ac74a6f..8ccf57def955 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -5,6 +5,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/kthread.h>
@@ -1156,10 +1157,9 @@ static int add_components_mdp(struct device *master_dev,
 			continue;
 
 		if (of_device_is_available(intf))
-			drm_of_component_match_add(master_dev, matchptr,
-						   component_compare_of, intf);
-
-		of_node_put(intf);
+			component_match_add_of(master_dev, matchptr, intf);
+		else
+			of_node_put(intf);
 	}
 
 	return 0;
@@ -1188,9 +1188,9 @@ static int add_gpu_components(struct device *dev,
 		return 0;
 
 	if (of_device_is_available(np))
-		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
-
-	of_node_put(np);
+		component_match_add_of(dev, matchptr, np);
+	else
+		of_node_put(np);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index ef6a4e63198f..e3aae4574c75 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -238,8 +238,7 @@ static int sti_platform_probe(struct platform_device *pdev)
 	child_np = of_get_next_available_child(node, NULL);
 
 	while (child_np) {
-		drm_of_component_match_add(dev, &match, component_compare_of,
-					   child_np);
+		component_match_add_of(dev, &match, child_np);
 		child_np = of_get_next_available_child(node, child_np);
 	}
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index cc94efbbf2d4..9b3ddd82f1be 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -323,7 +323,8 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 	     of_device_is_available(node))) {
 		/* Add current component */
 		DRM_DEBUG_DRIVER("Adding component %pOF\n", node);
-		drm_of_component_match_add(dev, match, component_compare_of, node);
+		of_node_get(node);
+		component_match_add_of(dev, match, node);
 		count++;
 	}
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 3b86d002ef62..0138ce02a64f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -155,11 +155,6 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	return ret;
 }
 
-static int dev_match_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 int tilcdc_get_external_components(struct device *dev,
 				   struct component_match **match)
 {
@@ -173,7 +168,8 @@ int tilcdc_get_external_components(struct device *dev,
 	}
 
 	if (match)
-		drm_of_component_match_add(dev, match, dev_match_of, node);
-	of_node_put(node);
+		component_match_add_of(dev, match, node);
+	else
+		of_node_put(node);
 	return 1;
 }
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 10ab58c40746..685c44dc1dae 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -33,10 +33,6 @@ uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 			    struct device_node *port);
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port);
-void drm_of_component_match_add(struct device *master,
-				struct component_match **matchptr,
-				int (*compare)(struct device *, void *),
-				struct device_node *node);
 int drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   const struct component_master_ops *m_ops);
@@ -69,14 +65,6 @@ static inline uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 	return 0;
 }
 
-static inline void
-drm_of_component_match_add(struct device *master,
-			   struct component_match **matchptr,
-			   int (*compare)(struct device *, void *),
-			   struct device_node *node)
-{
-}
-
 static inline int
 drm_of_component_probe(struct device *dev,
 		       int (*compare_of)(struct device *, void *),
-- 
2.35.1.1320.gc452695387.dirty

