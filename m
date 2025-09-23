Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D52B93EF1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF8C10E520;
	Tue, 23 Sep 2025 02:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nS9YP4XW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F72510E520
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIVs4Df81IovuLMbKuo8MejftLQepCa1rRuYh0L2VOueh/zi0yN4KMZYll+EPpwsNWJW6SiXsRy/2rn5VXArJUI5ODnZMBx7nRYE5WJcrCGQySG/UTLVbIlpQo/7fUDoFVHRfbWyO/Akz6c5R24LHG6kqaMbfWVQ1gewHbalNFEP7cNhOGribZJwgSiX+nRN9YCGotfLOJZLNHpXq8Gc0C85jbobd1DOxZhn7XyfkjiMv2uXAUmwXGzYJfZfmXyE3+eI55zBrGbFy5Yqnx22nidb7JziNTKxdBQvmLH4Wo+doB0bHoyBQOViJs2F+wNIrAI762jp5IDEPqjb0m6Ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6VYAm/9ngMKqhDLjY7RVfOV7B+HQpLtgNL2hNRF4hU=;
 b=u10C6IK93TvM9nVhWlNgQMuIHUA1Lb6LlrFb7/CJ5155xulWWfKCQBPx7RUnAY2ioMb1ngkjmoJsjKTlUp/jXwAGcHEiUCe4218pUyIJJRl6DvsnxDJW6BDps6s8m9O85+AShs9l+feMtsm/9ldMG1S8vSxqhs/NXlWe1orRVJgVlTHbLmyySXFK8Bp988K5p5l0p9NzANiIt8jZSOCFX4U5pePzmQvinDjX9KvgrAu3QkZw8wXx3d0lUykFHY5tGpgzKZRldVjEffVvsIyCMiQLUQO2xnoWJZpuoXvcuq9jgwxbT5WTMvHI4qrmDxJNC/aAgHCfqrcN2WKTjK7xjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6VYAm/9ngMKqhDLjY7RVfOV7B+HQpLtgNL2hNRF4hU=;
 b=nS9YP4XWWIH5dxlURVpxzNWZ4HaJgoJAg+EolexdwXqLlbSY/IWT+Ho05AVC4rFZcZZDVHDB0eKORY6KbmSOqJqN0Ku0vzlZzHfD9e4HzqI5UIhzrNJ4VWAxGsnxccOsIgOXnJwGXpK79JcmXL5traUFZHEgqPAZOiFHKnxjvY72vFOPqo2DK0MwHtFf/7q7FnvdEsbbk/TZO6q7QQqjg9zcJm32Wo6NzECwDGNn8L8agLLRy8xjuyhtwqpV7SKs/9AzEZXPEUQt/9PICILKAp8d0SIFzIbnzZns7wnw5UHLIEJY0z8xdysX2F1PeQ7aPC0GAefv2uTenXUg6L+2Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:14 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:55 +0800
Subject: [PATCH v2 05/14] drm/imx: dc-crtc: Disable at boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-5-5d69dc9ac8b5@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1f55f0aa-02e2-427e-af32-08ddfa45ea3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVFoRjNhcmZIaWU2b2duSExxdlgzSUJQdTRwNzJPdEwyNTB4c0ZvTnFsRXFD?=
 =?utf-8?B?Y2ZETGFkSDhncHFEam0ybWlzOGhSTDBZTnkva0dYTHFSRTd4cjNWMXVsMnBO?=
 =?utf-8?B?eXpRK2hqY0lDYzF0VHlkOXVsOGJoc1JRZVY0L2FiN1BJT0FwMld5dEQyenNN?=
 =?utf-8?B?TGpmcWxXT2I1ZFQrYk1tbXFXTGtaN1RiOWlvNmJESjMxaGRFZCtzaWR1OC9N?=
 =?utf-8?B?cjVqM3IxT29VOTFieXFtYlBxZ3REaWk4N1lZL1dlY25qZDBLbE8ybFlhbHF5?=
 =?utf-8?B?OWhmTWczSzE3ZlhWc3VRZmh6YnNmREozUXdMSTNMaG42eEJYdmpmSnRycVRQ?=
 =?utf-8?B?Q1JxVUVaOVEvQU1KREpzSXM3aGd4SitWS3VnazBkeW9RN3czbTl2bE1zcFdI?=
 =?utf-8?B?d0luWkQrdUY3TzI0UThicEM2SkhxMzNPc09ibDZnaHdMVDBpMk45eTNBb0RR?=
 =?utf-8?B?S1BMQW5PRVF5VUx0S3pLZDZQbUZLK2h6ZWdlc2NoajVCWmMxUEhqMm5TN3pX?=
 =?utf-8?B?UmFnQ3ZTR2dtYmRCbDNpR0UyaElqKzMxNjlLdkdkSHM5MEVOQkpONXQ4a1VO?=
 =?utf-8?B?d01QM0J0MGY4eitHZ2lMM1BINlBRdm5lWnNxU2MwL09kQlVvTEZwS1pZa3JH?=
 =?utf-8?B?bXRoeUw0dDc2R244bkpRRk4vbTdRaG9odVYwOENIZzhpMzQ5Y21LQm9mQjVj?=
 =?utf-8?B?RE0zenRzd0ZGVFVOV3ErTmc5UjBEVzRGc2JxMHFGRm9wVHlnZXkzZjl3QVhs?=
 =?utf-8?B?RUpOT29FaXd5TVF2dHZjaCszTHRsVTZkWWlRdGw2SDR4TDBaQUk1NVZ6QXI1?=
 =?utf-8?B?VWx4a2Nia00wZjBVYnlKUTlEY25pbWJGa0wwOEwyTlRkdHFpLzF6NEMwempB?=
 =?utf-8?B?UldQdkZwME9TYjJzckR2WndFWHl6VmxKeitaQUVUVEVwR2V4bGhMZkhFQk9k?=
 =?utf-8?B?eENKLzB1c2dLN2VueVlnZFpaQXpQUTJMTVRvV3kycytiaXhWUWFnYWxsOXFx?=
 =?utf-8?B?VkZyTG8zTjVxalprS2N3a3g4UDF2UTAwMmtJZ2xHSWZWYVZYUkIxR2s1TTZv?=
 =?utf-8?B?aURCa0orRWhBVUVCQUpqSEpFZE1yRDRvSHdWSHVDMnhiUlBDWDYzdmFzZ0x0?=
 =?utf-8?B?eU9XNVVJb29qS1FPTnQydzBtK2IyTGU5dlp3TzNTRkorZnkzWlhiZFU0Z0ZR?=
 =?utf-8?B?MUVaV25wVGFva3lVTnRZd3l6Y1I3aTY3ZW11UWFENUpWMHlKZTlWazhRWGpq?=
 =?utf-8?B?dkw5Sjc4RXI0cnZmZFRERlJTZmRiblc5d1d5blIyRFZmWTE4NWcxVWZ2WFBW?=
 =?utf-8?B?SXZYSUQ2cCtMaHprVVZkR0RETWRpODhiWmFXZzRZM3VyZGp5QTk0UHU0cVJX?=
 =?utf-8?B?ZkpmL0tPODRwd0N1dlRId2pmU01WNDRrZmhkMGt6UGtxTUpyZzRJUGRkU3hX?=
 =?utf-8?B?UHlKWHArS1RQQS9vRTBNd0dJRmo2a2wyZEdRaTE5Vzh5NGpYWnpuYjBYSy9q?=
 =?utf-8?B?b2MzamhyWjdJR0tqeXMydHFUUHhzNENzYXBXQUk0TnAyT3llZnYvRHMyclZ0?=
 =?utf-8?B?dDR5cFl5OFlHWGNkTDh4U3h6OEpOdGg3bkNlVlIzODV0UWhtT2F3UE81eFl4?=
 =?utf-8?B?Q1A5T3N3Y0NMT2t2WldQT0xNVC96bDM5V2plajl4Q3kyTzN4dUcvQldiSDhU?=
 =?utf-8?B?QnRQamxHRHdpMEcyU3lNUFVtNjVHOW04dXhCRzZUZHJjTFpuUlpQbkI1OHlI?=
 =?utf-8?B?b2pCcWhVaCtrRUdvOFN2Q2l6Sm9IUEpXeCt3UVFKMThlR2Z6aGhLUW1BTjFM?=
 =?utf-8?B?MUxlejZWcmd1Z05YRWdpQ3JDbUFxM1o0UFM5aTM1R1AyUTdzOG1NWlRhckRU?=
 =?utf-8?B?L0pkUURqSjIyVU5sL1ZNTkRoZkFPeXRyTkZwZm5FMWRLQ04zcGV5VFJUbmhx?=
 =?utf-8?B?cENHNzh2Ky85M2tDVTgrZGxSVlpEeWxrV2FsLzlmOGMzc2pmZEFseEJNa3hs?=
 =?utf-8?Q?sKsBMku3D13jX/eNMk8Lk2GfjFRn14=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(52116014)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmhCMkY1THZ5Q1h2U1BhWUJWSmpDaEZCZHVQeUZ0WHYzYnNvR0xVT2ZQK0Jw?=
 =?utf-8?B?WEZzZlhRSHU4a3gzYVJkaUJuaVBYZEF3SkRaTWZyZWpsNFZtMVF1MHVPaUpD?=
 =?utf-8?B?SU03Rmw2dlNnV1lTZWE2a1hCTmJ6UitZekwzaGYvWFd2bkU5N2wvS3hhY1NV?=
 =?utf-8?B?TnRCSjRJYnYwZndneUwrYzVWTnNUZGNvQ0xuWm9oVTYvc0ZPZ1Q2amZYcHlF?=
 =?utf-8?B?c3BhNnY0MXB5TmNZcGNCNjVtdmN6Ti8zclVIbTB4ZUtyQXNwcEJwbUxydDRJ?=
 =?utf-8?B?bXBKZ3ZlVmZETnJlaENoT1ZSWlNzTXkyV1htTUx5SHRsT0VGa2IwOW5OUDJD?=
 =?utf-8?B?QTU2Z3VXUzk1T0dHRGw3WVplQ2FLT0pQem1sdnh5eUxONkF5N2oxODVSRlJm?=
 =?utf-8?B?UjlyRWZJY1Q3MzN5R21IVk9hUTVSM0plS2tvZFkxMEltNXhXRThMTTJmMS9W?=
 =?utf-8?B?M0lqL215OHlJY2d0VkZxT3hNYXA1Q2RQRFBnKzVDa244RkZndDY5MFFsNnVq?=
 =?utf-8?B?NDFKMEtTSXcyTWwwMmxOT3Z5TUIwNEI5QktydWVUS1dhbVNxcDRidml4MlZK?=
 =?utf-8?B?V3kzb1NPNTZmcnZhYVk2dnBDZnVjUzJGMURuL3RLWE5sblNndXI1V2pRY3kz?=
 =?utf-8?B?dU9zUHFxRk9pTHB6R0lFVm1iZXFZNi8xa0xhL1JWU1BQaTU5Q0g1ekpPQWNm?=
 =?utf-8?B?dUt0aExVcHpoOXh2eUd5b0pwWGt5bXpMT2M5UVBQbVZ2Yk9VR1dHc095WlEv?=
 =?utf-8?B?Q1NIWHl5VU00aG9YZEhPWHB2MHpHZUQyVFpFNjlHNXlsRTRYcGJleWhtTyts?=
 =?utf-8?B?aitqcEkxbEcrSmZFUU9qb05idnhZVGN4TzQ2bVN3L21tMDVSSkM1MXY5bThw?=
 =?utf-8?B?b1pUcEsxWnNBL3l3ZHBvSXYrWE5xdnVCMSttNm0rUzVCelVEMGY5ZG5YYWxy?=
 =?utf-8?B?VlZOMkdHU1Q1M2pTRUgyMnkzS3JUSzgvQ2M0b2hnWnoyTVlMcVdVMzNWakFq?=
 =?utf-8?B?eEhRMDdxWUY5eXlSS2tCb1Fha0JyT202K2swbHU2UEhCRTFuZUFwdXVlejZl?=
 =?utf-8?B?VEI5Qmk5K0MyNURicTBsaXord2NMVUNXMTZPY1J6YzlIMmdXOTNDcEdZSVBp?=
 =?utf-8?B?cjNyWDhSeWVleG9wS25OZ3cvbmVMaGE3U2tKb3N3cmRUWm53K2F1Um41M0hQ?=
 =?utf-8?B?TldDU05TZ2ZjMWN3S0xFQk43cGtweDRvTjlnSkttWWlLb0FWd0lsc2p3aUZ3?=
 =?utf-8?B?Yzk0K1d2dG1HZHQ4WnF2a2pWVmdUVEM0UUpNUm1TaXNrY0dwRDloQTNWRXdV?=
 =?utf-8?B?Z1V0aHpWNDRCK1Z2VWo2QUFqSFNkalE1K3NwSExEQlJ2ZFRKSU1HeTRUdHZy?=
 =?utf-8?B?RnBkQ3dBOEE0Z044QWRMMXBYcUpxczJzRjR5T1B1S2hPRVVVOTFCVWkrOHhh?=
 =?utf-8?B?UmZzeTNkZitVWWZpTTRHR3dFbThjdHVnMXNFUzltRzNqOGozbm13UEF0bFVl?=
 =?utf-8?B?U01ySlptUHpocmpqVHdySmRnazE1cmxCcThXbGpISjdJOTRYdldnQ0tNRGxu?=
 =?utf-8?B?RDVKeWhaN2o4VmtENGVpSlc5YUZtci9iUkJuR0pBVG1SSWxWTzgxcjdmcFZS?=
 =?utf-8?B?VXhnaWhjWTBBWkc2dGRaVy9iblgvcGxYc2ZPdGJJODlpQnpyMEZ0dG9hdFRH?=
 =?utf-8?B?c0xQVG5pMzN0M3FRYjAwckFtV2NhNXhFRHBJNkhFenluVk9WbTlvck9TV2Jk?=
 =?utf-8?B?L1p3VGhueGNwR3pEK1psTDdVYnhKeStYYkZqS016ZlZDUU9Rcy83VjYrMjdK?=
 =?utf-8?B?dHBNbUhLV0FLeSs1MmlQUzM4RUZtdVhyVjVKWmJWNkhGaTI5OUJzb1JDR0ZL?=
 =?utf-8?B?VUtNc1hpWStYMjV4ZHQyQnZvL2NGM3E1R09NcUVNbzk1NE5TVEtVYWVyZ3N5?=
 =?utf-8?B?MW81bklqVzF6ZVZzWFBmNVZmdnlzZFJvRVBNb2p3RDNYV0djR0kyL1BmY080?=
 =?utf-8?B?V0pNY1RQd1oxcGtUWUFMQkNGaVdwUFMzTWk4MjBaNGh5MWN4RFZKZDRFM0cx?=
 =?utf-8?B?OURFRml3UGN6Mm5ZbzRkUlFCSlIxcDRqS0c4TXEyZzZLaGQzZmZNaGoxSUlU?=
 =?utf-8?Q?cUrbl+OIu2amRUSWR9iKvEP8e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f55f0aa-02e2-427e-af32-08ddfa45ea3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:14.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWTRUhay4FgPgn8ehSXH2GIh7m0Q4gKlnzazcPfpN/Xqy9ttBj6j0/+lASv4NQTrEvQYqF+HZAF50e5bzfgHeQ==
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

CRTC(s) could still be running after the DRM device is unplugged by
calling drm_dev_unplug(), because the CRTC disablement logic is
protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
driver's runtime PM) and pixel clock use count could be inbalanced
after removing and re-installing the driver module.  To fix this,
add a helper dc_crtc_disable_at_boot() and call it to properly
disable all CRTCs before advertising DRM device to user-space by
calling drm_dev_register().

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 50 ++++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/imx/dc/dc-drv.c  |  5 ++++
 drivers/gpu/drm/imx/dc/dc-drv.h  |  3 +++
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 31d3a982deaf7a0390937285c9d5d00100323181..45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
+static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	dc_fg_disable(dc_crtc->fg);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+}
+
 static void
 dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
@@ -305,11 +315,7 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
-	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
-
+	__dc_crtc_disable_fg(crtc);
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -337,6 +343,40 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
+{
+	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
+	if (ret < 0) {
+		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
+			    ret);
+		return;
+	}
+
+	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
+		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
+		goto out;
+	}
+
+	dc_crtc_dbg(crtc, "disabling at boot\n");
+	__dc_crtc_disable_fg(crtc);
+	dc_fg_disable_clock(dc_crtc->fg);
+
+	if (!dc_drm->pe_clk_axi_disabled) {
+		clk_disable_unprepare(dc_drm->pe->clk_axi);
+		dc_drm->pe_clk_axi_disabled = true;
+	}
+
+out:
+	ret = pm_runtime_put(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
+			    ret);
+}
+
 static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
 					 bool in_vblank_irq,
 					 int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 04f021d2d6cfc93972aa8d9073be24d347152602..f93766b6bfbfae8510db05278d104820ca0719c4 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -17,6 +17,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -96,6 +97,7 @@ static int dc_drm_bind(struct device *dev)
 	struct dc_priv *priv = dev_get_drvdata(dev);
 	struct dc_drm_device *dc_drm;
 	struct drm_device *drm;
+	struct drm_crtc *crtc;
 	int ret;
 
 	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
@@ -118,6 +120,9 @@ static int dc_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	drm_for_each_crtc(crtc, drm)
+		dc_crtc_disable_at_boot(crtc);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "failed to register drm device: %d\n", ret);
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index eb61b8c7626933adc7688f046139e2167665dad1..68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -50,6 +50,8 @@ struct dc_drm_device {
 	struct dc_pe *pe;
 	/** @tc: tcon list */
 	struct dc_tc *tc[DC_DISPLAYS];
+	/** @pe_clk_axi_disabled: disablement flag at boot */
+	bool pe_clk_axi_disabled;
 };
 
 struct dc_subdev_info {
@@ -96,6 +98,7 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
 	return -EINVAL;
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc);
 void dc_de_post_bind(struct dc_drm_device *dc_drm);
 void dc_pe_post_bind(struct dc_drm_device *dc_drm);
 

-- 
2.34.1

