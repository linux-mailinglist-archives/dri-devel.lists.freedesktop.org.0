Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEE74AE72
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988D410E54E;
	Fri,  7 Jul 2023 10:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2136.outbound.protection.outlook.com [40.107.215.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A20C10E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE8xD52xfNRjYdK5WpetTWxY/90jw7nqA55pxALtLtji1WdKPp9u/dF/F+iSpAmAe1qQTKwHm/YkBRfZaUcBS5FnhwWePvoc/u4EHXm1RBmgrEcsJf+XtJaERrgRGSe/Y3AbsTO/yNd0qkejps+7OqxZtHnsIw2JF1VzSg7RBWH2XDimlXwGu9dXC4n929M0GeIp1o6U9D8nW7J44q8NJHgg2zTN4ua7XO4nM2srZ31CQUEUAsrb4W4iULo49UVlGXe5X5TM2shHSJFXRX689EBI7pti4ycRVprRuN+M/eD8gh4YMwGvVwRrt1mDDqJGIHz6Y63zCwDP+LtYr+7OhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+zqlnB9VISi9AH5ikBu8sH4SK22b45CMMph0c8wbYE=;
 b=iM6lFHbVt98QNKTjZkXqJ2SyIg0DNxHFuMSa/b3Bsx8nHt3VNpNVuFOOU2FVYLaGtR+hqqlw013W6jJClp6w1K06U9IEgpJyGumvxDqJvu94Jsja+J8yMvTl4srFFZK+zIl8MkUmRqeo9K/4fBFZYpjp+T1rPkRs36l4O8zG1IfHeY+Ckt70W9sDxAnhe8qLkP/leiYV+BjQK8Lj1TqqsiNLmWAA9QCiFDo0JB6AphSdPbXL/E0kCuPgCSQ5av1U7csX87MDoS3yEBzp8thhhWx3j3qyRimxrkm0HzyYMrrCnhY3pHsEL+W5tEitc9jQM6+7u1AAndcQenvt49JzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+zqlnB9VISi9AH5ikBu8sH4SK22b45CMMph0c8wbYE=;
 b=jJ0xcsTPuyAl2+4C8vH6CI/i0Wxa8l3gua4OmrfdgJMd4Vknqi8MzJBrAJpy4uB7vtiTHSC6cWeRPnsoJ+3nD6XTCc1VHSRHOTmfcekzMuBpm4EWHi9zU4gWuP2nn7swUrS5qF/wIjkRmxisvO8s9QU7/QHRvI3i5ft3eq2A48aN+laUMacLwqSzefQSI1VStIBJ2Ne++uWx7ioooFjDgewR8p+14kh6kQkWzKmQF9ZC5wMeapZehxHV2bWHu6aCvhusNgXQtpjDnGHDa7g8HtBYJmaF/3RBms899p9se2U6+dQdbS3ltPgt6P4yin8lIeJ9asXCdVlji0PwhPjZbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB6704.apcprd06.prod.outlook.com (2603:1096:990:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:20:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:20:52 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 04/18] drm: kirin: Convert to devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:20 +0800
Message-Id: <20230707072034.48977-4-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|JH0PR06MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 74167744-7743-4ab0-8b89-08db7ebab1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rrXY8AJD+E3MGRDiXExRLRQRl/z6KnwxNoM2J+Ks+GRoemGREsaGOZTE+b5QcS9TS080LlCgFpkn4do+UFIxOi/M9iVccvLblY8Kwxfxen+/v8Nu1DSzq2bKXdFTxHklVa4lvySZm3IwRKwx7TELDO2pVC2R20pY1w0MCtCQVDFgZS9OWpJF4RVH0gErnK0yYDtOnLiBtGwsSRDgXvqzmjelddlJi/2a55KKDazu9eS/axbuyrPayAkDXCxcbDblQiGh5QoWNhWxzQGKVHdGZ4tct4v7Lyizdy1hbAnA+VELIisf1FqicAoxEwglpBQb6GnruYYUjdey0EtMbJ1OMBoFKOMHavoAp0a76JDILyKj9OJ9YChj5TvCJd5xSgD1dlERpBVqIHQsSEF+4PK0Dv3jKTn/fDLqu+1rHFEy6Q72Mf3SSWtwHMRUYHrjRPTv/BFmhRZRQNLlfWgW7ygwzn2x0ZyPzdsBiqmrspyu3RDFGxZkOUOGiBvE/IiHThrvPnH3RYURlQbdLnorz6KBtQR0LLbpitBEv8/16wQEVSulxnhkm73FPEmsMcv4U/gPZ7fKYMglwC/cEDQ1MQ8rw+G4LYLsCpAid7CsHKz+ZNvWoOWsenTw1msqdwr6xwhw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(7416002)(8936002)(8676002)(41300700001)(2906002)(316002)(478600001)(6666004)(110136005)(6512007)(52116002)(6486002)(66946007)(66556008)(4326008)(66476007)(38350700002)(38100700002)(5660300002)(2616005)(83380400001)(186003)(86362001)(36756003)(6506007)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M9HFsEbksU5XXYSXRqW7EDoIJ5IL2xMNzAj5alnpNXJnYNkmE3Oblgm35kas?=
 =?us-ascii?Q?DMAVlBWKtbW/VK5Ut2LssOb4A+DZzFI9wqq6VJ2JgVDyausih/hJgtICW5Bh?=
 =?us-ascii?Q?nizZuvpST0hzOfsamarhSZZkPOH04SbEBSi4XaGIbekCYxOuu+cKn4IRXTMs?=
 =?us-ascii?Q?E74FPSypnTNPs5JqKdml+Uyxcob42zOW7z8dNLoeVUAty2P85DHR3M94hlsD?=
 =?us-ascii?Q?yCu+WZRcjoAif2DDTaB49sqGQ4BgNe0EixCKF8Ixu+vJkXF8qJlK+yTDO/3C?=
 =?us-ascii?Q?SP77oyJD4biAu41B6lbx7ruVYaDclLDSIWIqs70AzfDV08Fnh8CALo3pCiVv?=
 =?us-ascii?Q?noQvDKTnh2q1z0TTkidGdKAd2DRSX8bECZ7Z/Fml6ZlufuH++FAnQ1v1Z1HM?=
 =?us-ascii?Q?tCrCi7EWZBoFDYVvDwJ7ZgUjMJK8DXb6022Q+hJR6uDmW2Da5EpG0rpVafnp?=
 =?us-ascii?Q?Ehte4XRRbMkgeSsRCUExNoDnDekcIOvMwrWddEsUC0glgnlNnEWMx5+h2VtR?=
 =?us-ascii?Q?Izsnuu2apPSyozBNtZefxjr/wedXpKC47bJ1fTrosZtjZ3EApKOrQMALYjL2?=
 =?us-ascii?Q?isXZKqxeQsV0KLaTSNIlgYmMD8u0QT1bpP7fwnUMesesoXpg9usLe+J51F9E?=
 =?us-ascii?Q?WMSY4MTRsT32r3jIJaqBTLJU+U5xf7AFsENd+ETOSie2EM2naxOfadeiRfq5?=
 =?us-ascii?Q?P5gLu5Eao7Fw/0UcwdUvOg0t1bp7bJuKm9ZAipE6OLNS7HcisyS89rAl6vNI?=
 =?us-ascii?Q?ySMff0S+euPB7eMZ76GwmDIrOmoWwZloSAlIfw8g7Uvmjs/BRzklmBsTd3kK?=
 =?us-ascii?Q?Tw3bL3kMghDaLWBLWPVUqFPf4hfxfW51rE5cgHF21U1W/E3vE1gNXD1cwRji?=
 =?us-ascii?Q?hwYOyurc30xd7AhRtP73jCdCpSxeEaxlgusmsZW1A4r/GVkMZ/a+ZBD1orYT?=
 =?us-ascii?Q?TdHr6vstmnx1NsrLpXjGGUlgUxbSqIfne9JzOtKo+qW5uCzy5p0BFrgN5ox9?=
 =?us-ascii?Q?qAozeMoB45c1JPC4aq1DYVDibP0zAVulWBfG7MiAabpDAAGni3lsH1qPM5jj?=
 =?us-ascii?Q?50JOHcxr2iLyfZsXR0AJI7Ua7w34OTHCX/KgFItDM1sHUfa6CeZcXs8ypEoZ?=
 =?us-ascii?Q?IjerKWZV03BIMOOb/5NPhWwZUgzPAbCtB02QK0VCCuNaUvkJij5XCQCFUM2A?=
 =?us-ascii?Q?q7rBKdpTZDq3Nc5SO+xKI2QZ82iClls6u5K45kTA8IORKvBF5H3BiVhXrfM8?=
 =?us-ascii?Q?3axpF2b/VjQ9JCfr8mQAcOIY7GBco8ovAthPC26tG+lhZFUP/3Sc0W0qvw/k?=
 =?us-ascii?Q?gCx+mZjBEHMw5x3Qx5GeOw2ShIlTUsg1QPUm39yzkn3AwQ1EQtGU6fT8yL0R?=
 =?us-ascii?Q?mVdL9eyR+USQOoJcvFrnioaTlcjbgEaeyCtnCz5hJ0IvQ0BgV3WdIUw1weuC?=
 =?us-ascii?Q?sKFCFnuUI+hwJQakwbmsCKAvYYuW56Kn7SAYnWkYskyvZIExh7NzcVwqQc70?=
 =?us-ascii?Q?YGOdBlX3KQKHbE3/CSFkLego4WdXT0Fsg9L/drhKxNbd4pWlZD3W1X38MzmD?=
 =?us-ascii?Q?TeWSViehIuwI7LpUrIPvc2sAjHGv1Bz1LvdDCIR/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74167744-7743-4ab0-8b89-08db7ebab1f5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:20:51.9936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZR4xzNm5bPZnLBfgSCdvPCvMgZOJF1pb2nYL7xghNYYHbDUTEY7sHbfUSjDUxpoHp9U0ZegIGhX7anHgNdme0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6704
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
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 871f79a6b17e..42ae68c70880 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -843,7 +843,6 @@ static struct drm_plane_funcs ade_plane_funcs = {
 static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 			      struct drm_crtc *crtc)
 {
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct ade_hw_ctx *ctx = NULL;
@@ -855,8 +854,7 @@ static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->base = devm_ioremap_resource(dev, res);
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base)) {
 		DRM_ERROR("failed to remap ade io base\n");
 		return ERR_PTR(-EIO);
-- 
2.39.0

