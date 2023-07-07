Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77074AE77
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAF110E552;
	Fri,  7 Jul 2023 10:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::713])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CD910E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+hFb0Ejrf3W8ijpkO+2rV10LxQfZdQmx9V9ZR+fvEXkTPARts4W5yKsWQMrTYlDopLiUS7okX0j5NlOTBh6hS8NSfkyS/NXbRLgB8rASZ9n6WtJl27ht6Dyp70vgQgDJpa+61ogq+k42R3NNwjWuxXcA/W0ioxeBLwI8FkirJACCgs7Vg7o7ep/qLyEsiWo12P2YMJNubLF/Ptu+S0Q8NyYZiRu2nKuJeypOwYsvDvkmIGAn31ccjRpuZfvFWr7kpWgThPnwtppWRr8gXiAe/ZxrvQC2TnDC6h64LsK6O4kkvYXlmbnvq0pwhujtK2nTP7q+QSgssej23DG5k/B3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW9sy+EuEvJZxUZApA2Ps+U9r0wesnA0NlbXsbEGTtY=;
 b=JFZ/7c0akXdg6+SkQaBixlmRx7uTes52X1ipOo1ngONH0U6I0Z7EdQm3RtRn7rJPFcVmKYr4xKI2Wa6dIwjZR2vceS9gCDCMKQUznFbobybZ0egX+xwLntwcyyf6Qzjh/tYBfAcKkGCj6II0Dy65OVyg9cvxM5gQk3ecen1k8CXRjbSsahZUYEcrfo9OFVEA6hgop8OHjZju0/Y6+q8W9Plm3xmQEQft2go6KFowH0NuK35Xv57wnBixOO7JpQgn0Rtl014aj59PuaWwJbOkgcZ79Bt3XY2h7wyM0Pmq8T4JlIKRmuOwmlrrTVlZ6Du0uc9ya+NXvnOQl3xhYzrtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW9sy+EuEvJZxUZApA2Ps+U9r0wesnA0NlbXsbEGTtY=;
 b=j86VmB4+1YTd2Yd6TGQMe1aUiYWje/4yuz0Lz7klghfTM2z4yVMPHqXEwkDLXyC5Ly6OyHxc77zRURXNEdvsMg7IFAgyZ1ZgiMRkBM/F5LOiLbAAMTlzvHnDHdUakgS++9gGKTmpP0ctXccbTFG/opWCwZiSADJzq8dFlpNV87tJr6FkQ/PveOjn7Hl82We/Z3k5aY9Heg5Fh8Gp2usAV4Ke1XgxlrvZClabdV4kcaP19cfltHsN2KKxt09BV65f84JB4hAvMTYHXMPAX24xw2P8k6yfLiy6Q8o+3A68RJYE+UZIyhawUQDyAuYdW38OE8q4FyuFMAMH/0c8PbFMBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:04 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:04 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 09/18] drm/hisilicon: Convert to
 devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:25 +0800
Message-Id: <20230707072034.48977-9-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: a4ca5adf-f285-4b3c-9726-08db7ebab99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05dIxWr/w6fr9DW3XHYmu6MhpoZhPboVzj6VXZqjpcOGOF3OdIJUCgawLObw7QfiZ2ql9V6s775e6yk2qUpBCWLFOvtYd29xjAOcyTqlnXFETwpPnFVKTzWN+IcxWT4fuFn2yxCcWj5rh+XoLXKSzJfQluwsyxqVGS9RhO0OQys8YHOqvvn8q5PxPeCdA9Ju2LSEFSLWbjR+VHf+xhgd6ziENXX67FrmKS5MpZVTHyWMtEbJ+MF3wf349N63FTw1onewY+ZcxPywNO1i+v5L4u6rrumzEwGUC6Tszru4SlJHDKD7WYGhRjY5vZAxtUmAr25S6V46p1Vwi+eLZC20X0Fpft2bKKY5emPzMBWnYUxIjTm8kII5K5xHCl9sLlb1RS34dVOf16lGh6LTlatbNeZRXRlzmlQliGZXy9ndi/vMjkUJJGbGytxc6SRGXLUII5WBkz7YRFT5i2flqMOTRjduYC3jyDauFpw23PLJ2WPkb4I/4m9vHYhVUlqUdvIACaN+CZj2+6g3KdkjCp5NjOQt2C1yKc4sorshgvLsrTCYLiO0pC+mwu/ctYmmixKYM9VCSxAIFHNP9OHZxhqXtUJ5pZ9Aq3/nUH8T18wzYzLx9A8qQN7/q2KJFhE9tIuQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(5660300002)(110136005)(6486002)(7416002)(316002)(2906002)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(6512007)(478600001)(38350700002)(186003)(86362001)(2616005)(38100700002)(4326008)(83380400001)(6506007)(1076003)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n6+ubHSO/RDE1D/eb7q+/F62zT9XmgiBa9kzd2Q2T+zMQveNk52R2WiEvwiK?=
 =?us-ascii?Q?BFitw4upY902nFZJ6tnA8bVIB0mf9pASC+APfoJ6jWY9XAkOUYb829UCQdM+?=
 =?us-ascii?Q?KZvlRh/vpS6FMX7GzICPDpBQuZM9VI4KGUxmgE89+igOZNMpskg6gooaQ4lZ?=
 =?us-ascii?Q?ykHHSpt0fPs8q4oPr7r2AmwXo0MFPsBBXQnxrMsAjMnBLLJ8yRtydmy8S+kv?=
 =?us-ascii?Q?Evu0L4v4gdOx+T2jlkxXs3B+0IghiEWEz+rdRqJ8UQ1yJj9V29HQxgwpX1VS?=
 =?us-ascii?Q?9pqsilweVf2dY/HgMakysJw2uENuHGHbkR3xsv+nXY9YVjct7GN4vOsWwMBW?=
 =?us-ascii?Q?TXBWmzlpKb94R/QiYY/gtIl4H4ySZ2mg5ife8MHzcuRWyANhRPFxyy5AX/8M?=
 =?us-ascii?Q?uRRN10Z++TrpjzG2HwdlPP5rsJvmWgZfRsDiuNOyT+3T5nDwEdnqMIFArbwW?=
 =?us-ascii?Q?2mjGWvhadblsM6SyNLzIFumf6Zh1OiYB8weccXu5x5Fx/hSKk+nC2ntLfNm8?=
 =?us-ascii?Q?1Fem7vM1A9ihJn3nJx08JwaAKJsXJtNlnU2Dy8KDJLc7V6jU1qGK0yNp+FAF?=
 =?us-ascii?Q?1YhiUAxc1aTQht0BBaPiIIPYZ4aDLtZ1bZtMOtyxhbl+nwExjuCGB8M9BMHJ?=
 =?us-ascii?Q?4ph+MsGDO4v3yLyx2uOcbdA0G8bRALXyaJaIYwnj42BAgb055hVw0uwTzZv6?=
 =?us-ascii?Q?TUsvdJl4MbTpDkMGtVJekQ22RS6Ef+ddRMK7IP3kuTysiJp6PJmoReLQwCdS?=
 =?us-ascii?Q?uQyuFz0tL7T9y+uVt5veq2Wx8DdszyqIbfhYnG/pTMRMtm8dI84fah3NqVa4?=
 =?us-ascii?Q?pywiQIo6afBke14UDtF7k46fVmJKP9eb48Vzl5rquSH9kcJdz4nCjrFwwR0H?=
 =?us-ascii?Q?GhG1MUzn128xe0wzABmHVMrduNQFnKdjEE90xAdLEL/QD8ciRjscvZUKp0Np?=
 =?us-ascii?Q?mw4zJOS5ILP8sAyZoaflhedF8rtjiRCV3z0jS5d4NjEKLM0W8/XLfCljuTRe?=
 =?us-ascii?Q?3fvqNb5QYZRH01rIVOybZICAEpblOWh5MLgfVz98HBsoeKVNi9cms27AUMIO?=
 =?us-ascii?Q?ar8U5mPwzVeBKpGKYVGNJDa+dNNeRhRZZ/ZfA0ecjJTh2ee1SpFRjrFSecsg?=
 =?us-ascii?Q?7W8Gza0c0y+pS9ayWv0YHUnjBnj2E55dXJanEpQVeWWgjIATT2nwZp3dmFFc?=
 =?us-ascii?Q?sUNviN7SXNbXtA8poZlW5c45y44wrYI/NU51szpojYHLm4k+NBnaiM0MSV8P?=
 =?us-ascii?Q?WsOgEtwMtj71mZkIg/75XIKUshMsNYlLfhltDGRbs49afuH4GETOOy/JTkKc?=
 =?us-ascii?Q?V8GSCgXGji5bqkCKq70ZjeeH5LkG8f/wCDujscyOoeUYs2Zib/akmM5eEI1+?=
 =?us-ascii?Q?fjyVbMqETK/htjBJHciG42nBIrAjGagS5c0oK7bpUfDqKtCN5hUbL1QnJkJM?=
 =?us-ascii?Q?Oesa08PK+W25G69rN+6NwPJhhW7zT6c43tZ6qfpw+zpS8KnTHmpZtju08NGs?=
 =?us-ascii?Q?BQcfmj2URtuuqUnVDFPQh15omrCK8Dqm5QP/6vJjBJVOqdFGXqMJ5GtyrfTL?=
 =?us-ascii?Q?lSIlGz7yCL3OmhvLt42/wZUN0yf/YvGy9JHGOTIU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ca5adf-f285-4b3c-9726-08db7ebab99a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:04.8025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lxslgp6YULL3RAnQXxTa2lHb9WmLRA2aXoEVGlWE068rvFjM0RAmA76+iUaSAnJMcoWvLR/6wJVRX4WzzeRjAA==
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
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index d9978b79828c..ff4ed4639509 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -826,7 +826,6 @@ static const struct component_ops dsi_ops = {
 static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 {
 	struct dsi_hw_ctx *ctx = dsi->ctx;
-	struct resource *res;
 
 	ctx->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(ctx->pclk)) {
@@ -834,8 +833,7 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 		return PTR_ERR(ctx->pclk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->base = devm_ioremap_resource(&pdev->dev, res);
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base)) {
 		DRM_ERROR("failed to remap dsi io region\n");
 		return PTR_ERR(ctx->base);
-- 
2.39.0

