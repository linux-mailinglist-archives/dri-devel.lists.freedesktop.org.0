Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FC9BD999
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 00:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D40E10E056;
	Tue,  5 Nov 2024 23:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="nt0T/hQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9748C10E056
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 23:19:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5NzGf087saNHeMzwqZeGeLiUz4bZl76fdbuqusoUHrpsqcs7vrEAY711yHyfjYoOeFFBkjw6TgQ4HSDHPc54YisDOS0xpOu3Th500pe5mlsYbTDYoHwCQBrmoMJ2xHYTgCkMJnu+trcQwh3LbBxHRvIDSAqo/4l/0PxQNipbiLn9D51HpLN7mbhr17H9NKOY0moUSnEDYi8gbI50/WguKcAyoGz60g5YizfFdIRYRGT0taWmhRiNY4632PN+yXNyhL4bi4e7gdnV+2fXvbq6ESgsw+bLok1GIqXTRajZPFTS9sUS/3GVK9k2NCZ1yDVh+5MK+je5eCDKmMz29np2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF3DZWbG4u+K0x60bgkYWt86d0SG7gw9ToxS7V4VSeg=;
 b=f1ORJQ4MMCw8nSQIrnpuIdgEcgA7ps9cFQWYV/qQxm5SZJJ1r3SEk3gMQvCss56RNk1cV9zkVsPa3j1L+4zBAQCh263yHxovlwCAtuQN257tgZEaLdk10to2De99+UZoI+1dsJbpWLFLArK51C1BeVkH16+QTzSjfm9o9p2Sd7TfmQAtOV9oPAfv2d8CkSLd/BOub1wzfzouOjUAn7sARUZtLls0InPo5PefTBEEPoQkCN0qtfx1OHcc1Ve7TIv+DXJMAiryBoKAxbaBixS+Ix6xO7MD8DKUw1cYiynUq33x/pJL4Nj8dbxMgyLhUUUHY3GknECNyDCx24WPQNTarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF3DZWbG4u+K0x60bgkYWt86d0SG7gw9ToxS7V4VSeg=;
 b=nt0T/hQAucujXMGeO6yTs6rZuim8nVaTQ6k4Bey7QZ0qdFtVYacyjfJ8oB7bkC6scPmcxXul//PB+Es/y/GCASrDuSiuG9KJppDiEPP+lFXr66jb/JQKhSa29db8XHSfLdfUC4HT8e5lBeqNytHFO7lJbnWnIiFZYHXIXhUEodg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10415.jpnprd01.prod.outlook.com
 (2603:1096:400:247::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 23:19:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 23:19:26 +0000
Message-ID: <875xp19sle.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexey Brodkin <abrodkin@synopsys.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6] gpu: drm: replace of_graph_get_next_endpoint()
In-Reply-To: <87frob3neo.wl-kuninori.morimoto.gx@renesas.com>
References: <87frob3neo.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Nov 2024 23:19:25 +0000
X-ClientProxiedBy: TYBP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10415:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0cce3c-e9d4-4c46-b9e7-08dcfdf04a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BQB0vSoLgTznfZKW+1cBWxhvLjwgswkTfqamQ5fal7fspcF93wwEA+TyDdDu?=
 =?us-ascii?Q?H8uh5mkOYBzWlb+4AYm0FazSRAoAulFZ8JhTe+wpt3zGE6P4386YWmx5XnBL?=
 =?us-ascii?Q?h2baSqLqNA1nqKkz4qu5U018NveB2IOef8UHEUxEevZGDKLRPSRLH7gntrYJ?=
 =?us-ascii?Q?ll8OubSWGtKspiYkIeA0oxBabpzfZuvVQM7Uh7WxapEpyhHBzI3pqX4udqeg?=
 =?us-ascii?Q?0b2yEx3eKhG8fQks7JgGxa8/vToPpTj11gOQ4HMdD2IWWH894wKRqD9NJ3EW?=
 =?us-ascii?Q?bGz/h6JqWAdcjAes7oa3/kCUBJBTVwswdn7MuLbkesGWosN2KVIDAHogaDsK?=
 =?us-ascii?Q?DCcZds6b9uNmcNi97EonUYRWfxkH6Ax6JV4xsRfY1vc9ZcPkaWZZTRsUcl9p?=
 =?us-ascii?Q?Y5yDABIweoQtZlQMN2Nmw2HGEg+lyxE2+3eHh2WRUoAT0sROuLIZRGNIEOIm?=
 =?us-ascii?Q?WRVQXUOhH78bYh4qGXrLSmxv0Uv5skzfkq0WJqywvbO1f66F2kkSdJUdUMrR?=
 =?us-ascii?Q?VMjt2/dvJHAAOnwYkKfMq8VadbayvnQSFY+Tvwo78p0IemY5qXNWHAr2mGvt?=
 =?us-ascii?Q?YthYxCXhP1/E12uVxnQ7fyBqNdElrfE7J4J1P6BxVQM75RGqsL/ZuiyOtV2k?=
 =?us-ascii?Q?jvDxG0h++I1sKJmYRvMEzyq47oiIPUQoCxdQeFCYqHOsr4GxmfrmeJfYAWhg?=
 =?us-ascii?Q?bp75RkEQBRcledYRBqJSay6y03RuNHs9fea0bT3pz4CmDqe1Htirnyvo+vDt?=
 =?us-ascii?Q?c+g02/uKo7/EE7lSqIpNLEtZV0oM6pNbw4LknFkl82JTWN83RxPaGp6x2JDY?=
 =?us-ascii?Q?0ZjBt0W/eNXaWK1Pq1OQQQ4pejd2/Sy/8/3/vdeydeIjO2luiAJgELILAoF9?=
 =?us-ascii?Q?z8hYSVi3rZIAFhsnej0H5LaEdStO7yfd2Tq456IS515T1Kx+sOXWVyTPCTBr?=
 =?us-ascii?Q?naJiLqfuKpnpfPdZc8EfXpyfrcfFZwnc51EN9kFxjCbH1FVWx2cIcnEngqKv?=
 =?us-ascii?Q?/zhazQFV3FzfNIhMqmUAzRSLWDq99zoxBBw9OH/iE3StsG8cMshfFlzdoU5M?=
 =?us-ascii?Q?Wkf1tWH4HFG8dqQeBKwQOwEvzEvSuwk205TGnXPNLnEtLeMXIpCFWnq+Pyh+?=
 =?us-ascii?Q?WNIbw4N+GwVBwSqzmU9cL5JiV7nC3Q+ss1odLDeAUDg7M7br0KHvqz9rbWl3?=
 =?us-ascii?Q?1ABqwf3VyIogzBRY/e/7xyQq6UFKF4L666ZqDqyFTFQuHAnNcEqQ8RE/oElp?=
 =?us-ascii?Q?NXYGywTclQG6DXIdbLsPMO/cPqumG2IOhSNO7ZFQIXB5QQEmWlkf9fcc3r7l?=
 =?us-ascii?Q?aI0WgRLMXJCl0CC6xe9nORRJSE93iXGFTkxXQb6mwyDG4dvyUmH65KYAA26m?=
 =?us-ascii?Q?E9xHBExH0h0T9wH6w2ZR57dt+auV4U4tlYWtt3136HM0T0O7UA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?auX1W5NZDAd+Dzsh7ivLMWvjHTxFUrbjT0h7cOIXx4AwhoCU2nejH7FDlG/7?=
 =?us-ascii?Q?Y6cSGK8xvk+63saML13URBBvIfqEVvbVf9NkdS69aOyTSeH0ZRBsdO3Q3OYp?=
 =?us-ascii?Q?afzNWdc5J+cuZcmSEx+zKbUYJBdjcgbK6qSW+QtFA4MLmu+BGCJ5meQSs0Hk?=
 =?us-ascii?Q?x3CLuspNO6bvis1ErFWAxippBiwY5UCmAJxdyUbpAB3Mvalt3K35yJ69CSY3?=
 =?us-ascii?Q?pHEv+E6P48mhq1DoO6iRFnK+fYTjnHcyOK/WquCr8XBBEIunwgAvESX8eA2M?=
 =?us-ascii?Q?yUM8h1bYwTsz1UipJ7NF1GeMo3Wk16OADqvLnPOfiRisC9Kla1zccAeZaCYq?=
 =?us-ascii?Q?Q36GEt1A3n3D7/SKo63p1re855wivaiXMtNGdackPm+32Hb9ez6zpl91rnN7?=
 =?us-ascii?Q?qhHcPMJaw9ztAFwiJZMob9XrssBWC56sVl5uhyX4UO7idmfm+2InUyxbpHOR?=
 =?us-ascii?Q?KMgd58CUPP8b3iX8NgULKiemkKhbzc3aeekCplfzCFjFfd/OY5LMR8USxg+E?=
 =?us-ascii?Q?UeXnGSmX/SubneWcs4BeMkTnc1Zh1MlSt1bJ/++6nDb6AX//NXVOgDGr8lzW?=
 =?us-ascii?Q?CtHIsIBKVpir1ErqRt8TinkMfTV7/NSZwZTZl76I/16SpWIRlpbO6Yl9oktj?=
 =?us-ascii?Q?uIsgF+M9DCmtDNjjVMCVw9nGdpXzoYlVcyB9T9pHwJFPqYPpKE78OHYUv8Bc?=
 =?us-ascii?Q?vI/+y6oEBlOIEIZulhvCHCyVXnCYk7L7JVNvhi4F2FNmaPZeqmjXvikKp2go?=
 =?us-ascii?Q?di+Po3gawuupDgY6Jf0h91K9YuhJVOSTiYku7VsVWOGZDsYl7dAphalG8mLD?=
 =?us-ascii?Q?jdmjBCL59epBdTVfgo10Olc9fOQpfcHzTJT/NHI2N2s9VnGNastlbIiaT8eT?=
 =?us-ascii?Q?mtGEJugyuKf4GWtchEVkwrt5+V7lzqTqm8vHn3D+bYPoPIGU/u/uPtHrvZaL?=
 =?us-ascii?Q?9k5xDvujGabT5AG5us3WPGW4ML669drQ/YJf7VNlSIrj6NiB9bCg6JqGAqZi?=
 =?us-ascii?Q?B7vKoVFWwSpc5FwQT3eVbz7HsD4iAdfDQSW6dvtsUriNxg/vwg2CT7D1/sju?=
 =?us-ascii?Q?LnG7niW5F5NEhCUdI8uE8l742MoqD/m0mvBSSZzXCLEVZEZuV7xDMTqoF1cD?=
 =?us-ascii?Q?xAT86ADHXwyH6hk0ryjS3MtrSmRPNixh+bdYtDiGjGFnzvaQnnNdzztb7Ltp?=
 =?us-ascii?Q?IedEXLsZJo6IYZfiFnFbDOkXpG33anUiL8IxGPO2/Qwa3oF9sEkh8fxQ13P2?=
 =?us-ascii?Q?+QucqjO2BtETpcxbAo9/UUNzbpKf94aHWpGTJvdHXAWU21QFfgYyVLxuAfl1?=
 =?us-ascii?Q?eoWYk8a+HlPYtEpXhn+DPBF+a1s62DExPwgaCNx/0/+oTLQZOa1j+MVNC+71?=
 =?us-ascii?Q?edQwPjz9DXpHNCAqK3mICTQfJWhdQOrbSKX5lj+uuMLUWEzWHH2yjQsagvTq?=
 =?us-ascii?Q?x6TsXG60tmbVz5NznJDbwNF0pThoIPiHqgFGzqFCa37gRfPEncr5sZvtpDd6?=
 =?us-ascii?Q?s5JsjlATrNLQunvvdkDhEWWwX07Bd9hamgRRWuqSG4uyzhqj6h5Q4QMP354B?=
 =?us-ascii?Q?YtmVdzmXGFPQwPP6bE8rayCCKQKmXE9jtsd+5mQ7j4dnS1DtNJOGE4+is48a?=
 =?us-ascii?Q?M7WBvtfB8Gq1hH0UUo5YXTg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0cce3c-e9d4-4c46-b9e7-08dcfdf04a57
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 23:19:26.2089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4afcywYESrhKB9vuLnshfW0l9pjDWKk4jfgJO0ruS0K/VV1SK16KYHbesLfeIBqcT48Wp28b8rLeEb3F4XaMioYo+F5Fhkx2k1R5I8o4WkMdLO63R+cEKGbA7XzpdeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10415
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi DRM Maintainers

> From DT point of view, in general, drivers should be asking for a
> specific port number because their function is fixed in the binding.
> 
> of_graph_get_next_endpoint() doesn't match to this concept.
> 
> Simply replace
> 
> 	- of_graph_get_next_endpoint(xxx, NULL);
> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
> 
> Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
(snip)
>  drivers/gpu/drm/drm_of.c                              | 4 +++-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-

Who can be a MAINTAINER of this patch/file/dir ?
I'm keeping posting this patch but nothing happen during almost this
half year...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
