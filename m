Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2733B93F03
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4B610E528;
	Tue, 23 Sep 2025 02:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eNI8W7GM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E9F10E528
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRVpKwJZigjP2OmKg2/YV7/F5Wc/9NI83KxMttLHWz/7fenfY+zgdiYpPzEOzX0ueieKiBX79DxZ3x6os2eCG3wlDQrvZketZaiuGjLMZph2il11y3SyuBeWseDtei9yk8QyPrbgN/lzZEGpf1KvV9ap3imc/3x+DX40ovgcp9T0sKFf1bXtBe5B1XFhdY/oJWa+wzprH44rZSyXtu+Eff7WClaDkB41Mdo/OaH89Z0G3WlKGC9K58GMqzOXIPewUmdcLxsYf2LKPuD6FRJahQzQx9w4DbPGHX2VwfI7K8qMew9+qcdIZjGPY+tw0TBdqvup981f3dSRw14po8Igaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDVXkc5l7vN4xpmimSvaWDx+z70LSHrN8cT7EPl4Dwg=;
 b=DjKQmnYFdv6gOa/WIjtBCZkoJvV1JQcMet7yv64rHrxq/elpXqnTaBkDaw7HrkfkGbCk61AOZsoVU9yrSg8KMgiEUeLNOS824jI6JSW0tAxJTHHa5f7VVr48X8pY6F9tMBP5aMBhtYKWVc7BXPq8jmNy37W30hCHXMt0sKBZlFDMuGGdpMmzqpw+29kY35BbSC3XsG68aNBjcXh3cTCRVFhDSyRZ/G66isC6KbVpYZAdhIeYx64FE6CTk0bsHsc7MBGMBuruDQFke053C3pSy5sX+1WK//T3/pKs8MgssOgzhTMUJVo0gg888LqDE5XCbjQ3JJPoOZ9w9a3EQjE8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDVXkc5l7vN4xpmimSvaWDx+z70LSHrN8cT7EPl4Dwg=;
 b=eNI8W7GMGw9z2qqGXjbzUR+oQK0Q/rUG5j4xl9QOxWhh4bfudLvpnpeu8Bnc1K3zzM/oVU+xP0Mz8Ph+nxUdndC/1XZk2oYJ5l9JB6ngY0POexDS/CKhsW5YuacX+Lm/8R32wDl/HQoPY5y8A0JedbZc3wSR76EJR6O6a9t7gMlz5P/Drpe3qzlil7Va7uu7TjBhda59sYIboH0X05qM3dV9zV7hJXNoZB8sLviwDkaluQtmAYcSAJ3TNF1nlzGGeCl5c8qzuv7AyUWK438ZSPO2losIbgrWw89WJyxh0cQR5ERniehZUhSWDiMA9HN4jQXT/NJDSVuvvJa6GeIchw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:32 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:58 +0800
Subject: [PATCH v2 08/14] drm/imx: dc: Use TCON operation mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-8-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 291fb5e5-0250-4c11-d7ae-08ddfa45f4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjhyOVFGMkRkL1p4SC9EOW5LRkJpRzhDSkpaYTJLeEF6Y2RXVHpQWnd3VHZL?=
 =?utf-8?B?YTRiTW8wVmhLbmRTSnYzNXI5MkVZMEVvZXYwekRQN3pqaHV5MGRWMFVid0VD?=
 =?utf-8?B?akVrbXUwbXQvUjAyeEt3cFV2NDVXbUlwOXNHM2haSytKamFZUGE2Yk42NWxY?=
 =?utf-8?B?ajdzVUc5cUpjQ0ZhbHJUT05NR1RaZVpsKzVMaWFPaVlDbTdxeiszSkpCMmFl?=
 =?utf-8?B?ZmVHaXBSWTltWVFTbkIxeXZjSEtKenpKVzlpOVg4QmRqeVF5eW5vaHBoa2Js?=
 =?utf-8?B?dkFlTjliYzhWeTg3Vk01cGpETWNldFBpM2hoTkNTQmRTeTJtVzJRVlpoZ2lH?=
 =?utf-8?B?ZndtR2dCUSsrQ2J2WDhTYnJGV1k5c2Ixdjh1ZkJ4UysyWm9Pa1ZCZG5xd1BV?=
 =?utf-8?B?bkVhQnUwWHRPMDRLaFZxVFpwQkIyUDI1UEwwOTk2OHRFT3pGdUxGYWpCaTNm?=
 =?utf-8?B?Mm9IRVo2MFJSaW04ZUx4K2pyUTVDS2NhWFlJTWxxMWUzS1dETTV3VFpWcUZr?=
 =?utf-8?B?TWtYZHE4cGFnMlVxSkdHU05qMXFOS1ZWVHBkUE1nSzhZdzVwSEd6bkZJY2pB?=
 =?utf-8?B?cnFEdDlucnUwWmJhV0V4ditNU0ZKRW8xc1BqdG5CYkNjL2F3aTVvdWhyUnV4?=
 =?utf-8?B?TFVWOXVCeVRIVUlJSHBlR1N1dExkTS9JdjVIcytzVThoOGxQUzhUejUvQ1RZ?=
 =?utf-8?B?UmJhMkZoYVg3a1dQK0h3a21oMkJDS3ZOdE1XSHM4UjRTakczdHZLeGRjMFFM?=
 =?utf-8?B?Q1N3S09ja0lwdmljMXVJUk9RaE9TRHFUUE5hMG5BNVpOcTBZVGVhZnhsTXRW?=
 =?utf-8?B?MmRLNUhPdEJLdk4xL2xDSHVyQTErL21zakFiSmIyeld2NmFxa3VxOFdwdkNU?=
 =?utf-8?B?VTV0d0VSZ0w5Uld0Nkp2YS9LalEwNkEzS3dndDdHM1hIWW5hUjJwc0xIbGty?=
 =?utf-8?B?cmY1akE3NkVySlhra1FEQlBIekZtZTZ6NDQzcklBS2hKZzFXcXR0djRMbzdx?=
 =?utf-8?B?NFF0cy9vRzZsV1pzRU1rRXRJdCthMkdEcUM1NFAyeHdkNG1hbGZNQWlsN0ZZ?=
 =?utf-8?B?M3IwM0VNamUyUE1XVEgxL3oyUDlCVm5Va21EcC9za2s1eUFZSS9WQy9TTFdF?=
 =?utf-8?B?b1BjYzJXdnNZejF0QURWbGw3Wm5Qc1NobUcvY0c3R3RWTzFlOGNVNi9WYVk1?=
 =?utf-8?B?cE9XcTAxc2R6QXV5eE9PR2V3ditXY0Fsa01KeTdiYlVrVVNjQ2tXSEtZV0dD?=
 =?utf-8?B?Q3V5TGNabi9SUTlXaHo5d0F2Qkt4eFo3Q0p2R3JZVUhiSFRXMnQrRlkyTXBN?=
 =?utf-8?B?UTEySytXME9EZ1JpUVd2WDUrRnZwc2pFZFRMVU1sc05UZzBwSUJuZ0tMcktj?=
 =?utf-8?B?a1o4OVUxdEowK2NHTUZWUG1pTG5zVllORkpFQmRHSzFJQjBlZklNazlMMm1w?=
 =?utf-8?B?R3d5Q0lSRnVqWFMwVmFJOU1xa3VIT0JmRkpIaFZJT1FrTnpUZUs4b3pRejhp?=
 =?utf-8?B?b0ZscHg0VmhKNkc5QmFIeW1mOEZzOGJrb2FkK3JsRWtNb1dFRVFnR3VRVmhz?=
 =?utf-8?B?QWVHYkhrMkg4bTVmaVN4ZzRBZk9xV2xSNndLZHB4VTc3enF2T2FSdHRnTlRS?=
 =?utf-8?B?ZERLN3h4N21GZXc1aDY0N2ZDUTZjbnVUeHNsQU1wOStYMVNJQzkxdVgzdjdZ?=
 =?utf-8?B?dmFiMVRSekFzYjZCcGRRQk4zc0RuY3djeXFHV0ZjWmZlZlFQVjhRUEl4bmNk?=
 =?utf-8?B?V3BxREtCRW9DTE8yWFFleVptc0FQLzd2dGZzL0xnbUFHcjJxNC9CTTMySlFV?=
 =?utf-8?B?d3hydTNLWXg4Rk1TNEo3VjVjZUVaOGFjS2Y2aUhoUEhOUGlaY2djYmtHU0dx?=
 =?utf-8?B?Y1B5aVpudmVUcE1KbEM2bXdkdVVYc3dxYWFlMlFxV2pveEFPZ1FIVjUvMElq?=
 =?utf-8?B?bXNpN1JuWVdIby9HUzJWc1NtYTA1MWhydlNXYVJCdGw2clR1WmhwanVrQlVE?=
 =?utf-8?Q?UL58y7GrfgWFQk24b3YLH10YYIP8Sw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pBT1BFNm5pRE9VYjg3S2sxYm9hNU02OXJidmNPaDNrOWp6Z1JHVy9xK3My?=
 =?utf-8?B?alhwN0JiYTYzQkRRNXgwV0g1VUl0VFB1Skt5d0d3ek12Y24yaHp2cVYzczBJ?=
 =?utf-8?B?ZzVTakRjdnU0ZUM1ZzJwVHNLUnkxYWFiSHdSUTNSbjFqMTdObi9OQlNCemZL?=
 =?utf-8?B?UUkwZjI3SG04VE1UQXRkVDUwMFptT1RETXAyVFVNYmNJYmIvSkdKc2tCYm9v?=
 =?utf-8?B?dkx4c1UzSDdVV1ViZy9BanowSGlYaTdDbHBkc1ovWmRpTnd6aXJYM0JyazFJ?=
 =?utf-8?B?d3NVVEZYdGV4NVdzdGlSUHBQcGJiV2E3dGJDYUNIRXltQVF4U3lSb2EyUktU?=
 =?utf-8?B?V0RqaFUwNklwYVVZWi94bEM3MlpYaEgvTzg1ZG9Cb0JGdWRRS0duK2xOZkZm?=
 =?utf-8?B?UzRKT09ZSVQ2TlQ4L1lzdmIyTExsYkRpaXNnb3lBNitYNXhrbHpBenNuUnBr?=
 =?utf-8?B?TFp4UzUxdzdBZEVWekNXV2lyM3NXMndoNDNrMEV5d3JqSkl0S2ZEc0lFMVdP?=
 =?utf-8?B?L05oZDEzMWhRWGNvZ3V3UzNJcHlGSmtNV0VJV2hKS2Zsakk1ZEE1dzRZZnRx?=
 =?utf-8?B?Y3YvNzRyMzJzdmV0cTBGSjk3dTM1OGJRK0dVUXhqVkMySWVIZ245Z3JSMkRv?=
 =?utf-8?B?UHF0dm5ESHZOTFF4U1B0YXlEL0JyWDVDMCtkeHQvUnQ4ZEpLWU9OTkJoeXlz?=
 =?utf-8?B?ZzJ2aHhxc2Q0ai9vRUErRm1WSkJrZHhnMGJhb0pnY3d3V1p4aDduKzZyNUlv?=
 =?utf-8?B?UFZBRm5kODRtTGNXMG8rNjNxSlRFdlVNaUNoNHp5Q3ZydGhRMEh5VGJjNlBH?=
 =?utf-8?B?enBmMTlLQWVJRGkwelFSQ05JZlZrb0dWQmhvMXhvQ05kd1gwaWNHSlJ4VXJG?=
 =?utf-8?B?TXJsMEJIby9vT216QXR6REdtUnlXVDU3RytXWGkwRkVOL1JpSXJxeUY5QjhX?=
 =?utf-8?B?RSt0N0hZdTBQVlR0ME9JMDRuYzE0aHdyeVR3SGFqVWVScU5oMW5WRDFjVTFE?=
 =?utf-8?B?UmQzTnJicnE3MUM5MWJlM3pVenhIZk1oSURvVGQwNTlmMTV0dVFmVW1QYUlR?=
 =?utf-8?B?RzRTZWFkc3AwblBycWR6YXg4R0ZZRTNxOEtYVmRlM3FKcGF2N3pXS2k1alRo?=
 =?utf-8?B?K1lhUGFTZkRIUWVyR2xnR3pUK3lvU1gxZnBBRThYdHZZSGt1ZnZ2bTVCK0lp?=
 =?utf-8?B?OGlHM1htNEwxVGdIT0dCeCtpcTlBQ3ZvVnFEWEE5SElDRmpMOFRwMnBGOStN?=
 =?utf-8?B?dFJoUmhRTzNLcDJxbW9NZkZSWEFSN1NvTHkvb2FRNDNSU3BuWmplOGcrUE0y?=
 =?utf-8?B?S1VlYmtwK3NPZk9Da0Nxa0hvb1hFVVVWOERheGJDenlrenBrc1dQMTBHa3NC?=
 =?utf-8?B?TTVKbit0OTI4RnVoRjNjVUVlMkpORXFsN3RCbmt6T2lVenhRLzhIWnkzOSsz?=
 =?utf-8?B?WXJBQ0JVUEdqNy9MbDlzaFhrOVk5WWxSVXdnRGF4YlE2a3ZjZG5ZSnVZM09E?=
 =?utf-8?B?TWxJQVhuQmtzVHNINHJRVTlaY0lUOTRLR3M5U0pXK09peEhlSUxtQy93V21M?=
 =?utf-8?B?b1NoOTVnbTVuNGZzR2hrWE8wcEgvai9FZ3BEalNhNW5yKzBMaWtJSHBrL21p?=
 =?utf-8?B?V3c0cEtENzJHNmJsVUNuK21CMGtOVVZqWFFXWnFlUnNiYWtTbUlUZnBUQWVK?=
 =?utf-8?B?WUczaUtTUzRpeFM2NWhuOWlrV1hSOTd4bDJBcVhyV1dvVWpvc2MwZnlmUUpI?=
 =?utf-8?B?bU42cGhydWRXcUVtcXAyYytDYkNmeFRBS0xERHd6UE4vK21oeXBIeFlWZ09I?=
 =?utf-8?B?RGJFcG16VUdWYjFOUDFoY2hZYi9ZbVpzYnBpcjlTSFh2cmdiY2NIZ3FJd2NM?=
 =?utf-8?B?YXd5UitEOWcwTjlldnFVWWs2bWFzMFJySmFZY1R2d3FzTXl3Y09Id2VWWlF0?=
 =?utf-8?B?ZGtmREVvenV3N1pBRHV4VjVEbTJRVjNTVVVhUmhFbXNkOXZTSEp2cUFRa1Y4?=
 =?utf-8?B?dFZwQkxpT0NWRnNNZSsvb1B1aGx1U21RRktUSlFUK1Y4L2U0am1HVUZ6L1F5?=
 =?utf-8?B?SkRpWkduL1A3VU1XQmtjRXE4akZCdWZUN2daV1NBMkdMRU80alh3K3NMeGMz?=
 =?utf-8?Q?3YLNYiS1QWqNqV0QsvZVcilYh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291fb5e5-0250-4c11-d7ae-08ddfa45f4c6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:32.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQqMhznFMbjRyeY3FgGy+9z5PGz5N9tZYFW6mn9XQAxMKWdFlvQ2InMkz90OZkWsBVObCLZa2io06Ugt7z0T5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786
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

In TCON operation mode, sync signals from FrameGen are ignored, but
a much more customized output timing can be generated by the TCON
module.  By using TCON operaton mode, generate KACHUNK signal along
with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
a synchronization signal inside the prefetch engine(DPRC + PRG(s),
attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
operation mode when CRTC is being enabled so that the prefetch engine
may evade the first dumb frame generated by the display controller.

Since TCON BYPASS bit is controlled by KMS driver when doing atomic
commits, drop the bit setting when initializing TCON.  This also
avoids accidentally initializing TCON BYPASS bit to 1 when driver
module removing and re-installing where an upcoming patch would
disable a CRTC at boot in TCON operation mode if needed.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
 drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
 drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
 4 files changed, 142 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7..9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -6,8 +6,10 @@
 #include <linux/completion.h>
 #include <linux/container_of.h>
 #include <linux/interrupt.h>
+#include <linux/irqflags.h>
 #include <linux/irqreturn.h>
 #include <linux/pm_runtime.h>
+#include <linux/preempt.h>
 #include <linux/spinlock.h>
 
 #include <drm/drm_atomic.h>
@@ -68,6 +70,14 @@ do {									\
 							__func__);	\
 } while (0)
 
+#define DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(fg)		\
+do {									\
+	if (!dc_fg_wait_for_frame_index_moving(fg))			\
+		dc_crtc_err(crtc,					\
+			"%s: FrameGen frame index isn't moving\n",	\
+							__func__);	\
+} while (0)
+
 static inline struct dc_crtc *to_dc_crtc(struct drm_crtc *crtc)
 {
 	return container_of(crtc, struct dc_crtc, base);
@@ -229,6 +239,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	enum dc_link_id cf_link;
+	unsigned long flags;
 	int idx, ret;
 
 	dc_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
@@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	enable_irq(dc_crtc->irq_ed_safe_shdload);
 
 	dc_fg_cfg_videomode(dc_crtc->fg, adj);
+	dc_tc_cfg_videomode(dc_crtc->tc, adj);
 
 	dc_cf_framedimensions(dc_crtc->cf_cont,
 			      adj->crtc_hdisplay, adj->crtc_vdisplay);
@@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
 	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
 	dc_fg_shdtokgen(dc_crtc->fg);
+
+	/* Don't relinquish CPU until TCON is set to operation mode. */
+	local_irq_save(flags);
+	preempt_disable();
+
 	dc_fg_enable(dc_crtc->fg);
+	/*
+	 * Turn TCON into operation mode as soon as the first dumb
+	 * frame is generated by DC(we don't relinquish CPU to ensure
+	 * this).  This makes DPR/PRG be able to evade the frame.
+	 */
+	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
+	dc_tc_set_operation_mode(dc_crtc->tc);
+
+	local_irq_restore(flags);
+	preempt_enable();
 
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
 	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
@@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
 	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
 	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
 	dc_crtc->fg = de->fg;
+	dc_crtc->tc = de->tc;
 
 	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
 	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
 void dc_fg_init(struct dc_fg *fg);
 
 /* Timing Controller Unit */
+void dc_tc_set_operation_mode(struct dc_tc *tc);
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m);
 void dc_tc_init(struct dc_tc *tc);
 
 #endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index cd7860eff986a272f6983ad0f3cc87dbf40c2851..a25d47eebd28792e4b53b4ecc89907ce00430c2c 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -50,6 +50,8 @@ struct dc_crtc {
 	struct dc_ed *ed_safe;
 	/** @fg: framegen */
 	struct dc_fg *fg;
+	/** @tc: tcon */
+	struct dc_tc *tc;
 	/**
 	 * @irq_dec_framecomplete:
 	 *
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 0bfd381b2cea15444c399f3ad261e2d061ea1c9f..6f1dc71f1b40cb4d99ca177172bd0066f39e8314 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -9,11 +9,30 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <drm/drm_modes.h>
+
 #include "dc-drv.h"
 #include "dc-de.h"
 
 #define TCON_CTRL	0x410
-#define  CTRL_RST_VAL	0x01401408
+#define  SPLITPOSITION_MASK	GENMASK(29, 16)
+#define  SPLITPOSITION(n)	FIELD_PREP(SPLITPOSITION_MASK, (n))
+#define  DUAL_SWAP	BIT(15)
+#define  MINILVDS_OPCODE_MASK	GENMASK(14, 12)
+#define  MODE_4PAIRS	FIELD_PREP(MINILVDS_OPCODE_MASK, 0x1)
+#define  LVDS_CLOCK_INV	BIT(11)
+#define  LVDS_BALANCE	BIT(10)
+#define  LVDSMODE	BIT(9)
+#define  ENLVDS		BIT(8)
+#define  INV_CTRL_MASK	GENMASK(7, 4)
+#define  BYPASS		BIT(3)
+#define  TCON_SYNC	BIT(2)
+#define  CHANNELMODE_MASK	GENMASK(1, 0)
+#define  CTRL_RST_MASK	\
+		(SPLITPOSITION_MASK | DUAL_SWAP | MINILVDS_OPCODE_MASK | \
+		 LVDS_CLOCK_INV | LVDS_BALANCE | LVDSMODE | ENLVDS | \
+		 INV_CTRL_MASK | TCON_SYNC | CHANNELMODE_MASK)
+#define  CTRL_RST_VAL  (SPLITPOSITION(0x140) | MODE_4PAIRS | LVDS_BALANCE)
 
 /* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
 #define MAPBIT3_0	0x418
@@ -25,6 +44,16 @@
 #define MAPBIT27_24	0x430
 #define MAPBIT31_28	0x434
 
+#define SPGPOSON(n)	(0x460 + (n) * 16)
+#define SPGMASKON(n)	(0x464 + (n) * 16)
+#define SPGPOSOFF(n)	(0x468 + (n) * 16)
+#define SPGMASKOFF(n)	(0x46c + (n) * 16)
+#define  X(n)		FIELD_PREP(GENMASK(30, 16), (n))
+#define  Y(n)		FIELD_PREP(GENMASK(14, 0), (n))
+
+#define SMXSIGS(n)	(0x520 + (n) * 8)
+#define SMXFCTTABLE(n)	(0x524 + (n) * 8)
+
 static const struct dc_subdev_info dc_tc_info[] = {
 	{ .reg_start = 0x5618c800, .id = 0, },
 	{ .reg_start = 0x5618e400, .id = 1, },
@@ -33,6 +62,8 @@ static const struct dc_subdev_info dc_tc_info[] = {
 static const struct regmap_range dc_tc_regmap_ranges[] = {
 	regmap_reg_range(TCON_CTRL, TCON_CTRL),
 	regmap_reg_range(MAPBIT3_0, MAPBIT31_28),
+	regmap_reg_range(SPGPOSON(0), SPGMASKOFF(4)),
+	regmap_reg_range(SMXSIGS(0), SMXFCTTABLE(3)),
 };
 
 static const struct regmap_access_table dc_tc_regmap_access_table = {
@@ -47,7 +78,7 @@ static const struct regmap_config dc_tc_regmap_config = {
 	.fast_io = true,
 	.wr_table = &dc_tc_regmap_access_table,
 	.rd_table = &dc_tc_regmap_access_table,
-	.max_register = MAPBIT31_28,
+	.max_register = SMXFCTTABLE(3),
 };
 
 /*
@@ -60,10 +91,85 @@ static const u32 dc_tc_mapbit[] = {
 	0x13121110, 0x03020100, 0x07060504, 0x00000908,
 };
 
+void dc_tc_set_operation_mode(struct dc_tc *tc)
+{
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, 0);
+}
+
+void dc_tc_cfg_videomode(struct dc_tc *tc, struct drm_display_mode *m)
+{
+	int hdisplay, hsync_start, hsync_end;
+	int vdisplay, vsync_start, vsync_end;
+	int y;
+
+	hdisplay = m->hdisplay;
+	vdisplay = m->vdisplay;
+	hsync_start = m->hsync_start;
+	vsync_start = m->vsync_start;
+	hsync_end = m->hsync_end;
+	vsync_end = m->vsync_end;
+
+	/*
+	 * Turn TCON into operation mode later after the first dumb frame is
+	 * generated by DC.  This makes DPR/PRG be able to evade the frame.
+	 */
+	regmap_write_bits(tc->reg, TCON_CTRL, BYPASS, BYPASS);
+
+	/* dsp_control[0]: HSYNC */
+	regmap_write(tc->reg, SPGPOSON(0), X(hsync_start));
+	regmap_write(tc->reg, SPGMASKON(0), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(0), X(hsync_end));
+	regmap_write(tc->reg, SPGMASKOFF(0), 0xffff);
+
+	regmap_write(tc->reg, SMXSIGS(0), 0x2);
+	regmap_write(tc->reg, SMXFCTTABLE(0), 0x1);
+
+	/* dsp_control[1]: VSYNC */
+	regmap_write(tc->reg, SPGPOSON(1), X(hsync_start) | Y(vsync_start - 1));
+	regmap_write(tc->reg, SPGMASKON(1), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(1), X(hsync_start) | Y(vsync_end - 1));
+	regmap_write(tc->reg, SPGMASKOFF(1), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(1), 0x3);
+	regmap_write(tc->reg, SMXFCTTABLE(1), 0x1);
+
+	/* dsp_control[2]: data enable */
+	/* horizontal */
+	regmap_write(tc->reg, SPGPOSON(2), 0x0);
+	regmap_write(tc->reg, SPGMASKON(2), 0xffff);
+
+	regmap_write(tc->reg, SPGPOSOFF(2), X(hdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(2), 0xffff);
+
+	/* vertical */
+	regmap_write(tc->reg, SPGPOSON(3), 0x0);
+	regmap_write(tc->reg, SPGMASKON(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SPGPOSOFF(3), Y(vdisplay));
+	regmap_write(tc->reg, SPGMASKOFF(3), 0x7fff0000);
+
+	regmap_write(tc->reg, SMXSIGS(2), 0x2c);
+	regmap_write(tc->reg, SMXFCTTABLE(2), 0x8);
+
+	/* dsp_control[3]: KACHUNK */
+	y = vdisplay + 1;
+
+	regmap_write(tc->reg, SPGPOSON(4), X(0x0) | Y(y));
+	regmap_write(tc->reg, SPGMASKON(4), 0x0);
+
+	regmap_write(tc->reg, SPGPOSOFF(4), X(0x20) | Y(y));
+	regmap_write(tc->reg, SPGMASKOFF(4), 0x0);
+
+	regmap_write(tc->reg, SMXSIGS(3), 0x6);
+	regmap_write(tc->reg, SMXFCTTABLE(3), 0x2);
+}
+
 void dc_tc_init(struct dc_tc *tc)
 {
-	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
-	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
+	/* reset TCON_CTRL to POR default except for touching BYPASS bit */
+	regmap_write_bits(tc->reg, TCON_CTRL, CTRL_RST_MASK, CTRL_RST_VAL);
 
 	/* set format */
 	regmap_bulk_write(tc->reg, MAPBIT3_0, dc_tc_mapbit,

-- 
2.34.1

