Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622CCBA7D23
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC2E10E1FF;
	Mon, 29 Sep 2025 02:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G2vETp7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A9510E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKDGCdMtNip748uEmxjUkIf6B7+1Gg8nYh5fVC4HQfNo0GMSb6c8II7K/w4P8IwlWldB+G3zHqbq5AM5z3zEnk/+zs/z2ou58GV4j5JifgxWHu+gFT3X+7UoaXYwZLO0ooiuy4dGkEz4N4OHhumrk5tLkckVKfTdAgtdkvU4v97Ah5j09Bq4i597yH9hBtdDTjRrp3E+gunjm7DwdfqQpONuMB9F+12gwPCInt4OiwNNGJ6wmmjWzuTutz1eLV710lbUKxFfHky/p9jZNMUz36rc118eDzXuEDW17/xwtFRTBoD686rPyYeWtTOxQWc2yR9NrDaARS/6QlE72R8djQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsrigFOoVP039rn2Z7hnXpFlJwbipkD2jFQU9mOx2eY=;
 b=abPI0qZqgFceWVb+I+ItVDmuP0xEmXIfZPeRE+ubkeh9FajNTtHpZRIg3PP4cnQKIwA5d+gaqQW8/cYSiiqdTBNcu2u0yHhIOL8D4Ia0CfLXoyzlnWGqhikaWQxhm3MZqI43c2Jyc+5/0cTzir3WZnnjSchGut6LpJ7Dq88/BwMZ3J4jsO2Fa3qVE55igjodjYe8Bl+ER27XIaZo9iXrY5b/PWU0UUKfAc6oOTkYmbYryQ5CAI8thD21rVmpXx6jZmFZlXuZiV1xc1sHCaBL841tvXlfpSDADsA/yhQ0lfcg9fEUF8btEPSL1xhLXd5wri5HYrNUH658UD5GWX1sFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsrigFOoVP039rn2Z7hnXpFlJwbipkD2jFQU9mOx2eY=;
 b=G2vETp7Ryq4nkob7DKWxRZNSDvZ/aJijMlVr7R+3ir16zV2z7362OT3NOwnBGp72zJRGg7VMsA81F7Ig4t0dSQwfMH1wCsism0jpkAH8Dczyqh4lwO20Nf0iqP+t0vSLnnOli2YPLvxWqDWf0eAMaIrRp3K/YQk2uCNNKz+LZ6bc9AqWr74rbSsduQG2MIe3Y2WgN7HCAbFBe16/Tn+cc6QWjpNzGJeohDgI5QCn5lwCLz/awEjVngZTWQfuUzzGDOpALSluVhPxjpLYI8NOgHQicikHQl3Jpa9xc7g+tZspH4I4/0zE68kl6otzLsoHFEIkzT/N1Yw7SmngbNMpmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:41:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:41:13 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:43 +0800
Subject: [PATCH v3 08/14] drm/imx: dc: Use TCON operation mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-8-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
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
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acf0924-2127-4374-d86c-08ddff01a81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVAyanBoMjJZd1FoVFgzcjZ4TjMrSmk5aTUxRWd4cmdXMjRYclJQMHFaWGhV?=
 =?utf-8?B?UldiWEtncmNlRGRUNmltN3N6R0lHa2g5c3MzY1o3eVFNMXN1TlJla0dmcWFw?=
 =?utf-8?B?V2s4bVNMcWRDaWU4TjYyS2lBYXdUekFpZzRSeGdGbHRKMC9mbnB2TkowNTdw?=
 =?utf-8?B?ZWU4cm1maWlKajJlbUhPaVRyQkxadDVXeElNR1dnQUNiampyR1V1ZU8xYktS?=
 =?utf-8?B?VEUwL2dqbWNBelRQZzdTUjU3Nm1ReGVadTVXa2RmVmh5RkxXdjNpSDhKTWpY?=
 =?utf-8?B?UGwxSWRXSDEwUFJobStsZmN3TTh1aE5zYitEbEY1Vi90cW5YcDVvelpnb1kz?=
 =?utf-8?B?NHFTWG1BVmlQdUpTZkJHZ1dHVHJEZnJ3Q0txZVZwM2diZGFaM0RySkFRVE9m?=
 =?utf-8?B?QWtXWWN1aVlvRFNORHJxdS9GS2hReVlncHFlQnFYdmxnRkpQbnpWdXZVbUR4?=
 =?utf-8?B?YUI0clh6SkFOMWIwUlFoR2Y3a0pObDV2T1NERnRsZXJ0VGxLaHhjWjVDcWhP?=
 =?utf-8?B?RFRDU3B5VzJObnVVM25yVFN0TWozNlBlQ29adzJnQkhqL2RkaTJ2YVB6SlZP?=
 =?utf-8?B?cm10bTBObjlVT0JJc01KUXQ2cTYzK2N5Qm8rYUgwWEVCU1NpVjhVQjBETEtz?=
 =?utf-8?B?OVVHSC9MRjAzUzhlSE8xNk5MYXRmalRmZkloZytJSHRQR3Nzc2JoS3lPa1NZ?=
 =?utf-8?B?ZDRrejUvR2RMeXo3OXZzemRDbGpyeDBmWlE4NU0wN1FDTnpMYThpbko3MUFG?=
 =?utf-8?B?dTh6N1JTcFBqTTMwMU91ZXE0N1A5K24xcUl6K0ZvajVpaWZYYi9BR0xiUUJp?=
 =?utf-8?B?dkxuc3Z5RmVFcTc4L0JRTmFFTWJuN3d6Um0wSlppVzZZWFZTTHhBVkJmWTRJ?=
 =?utf-8?B?NEx5aThOTGV4elNHcTVRc1QvNXpCbDIvTkh0L1VEZm5HSlg4Wm4vUzBnRU5B?=
 =?utf-8?B?VFhlRW9yMVgzdWVxYzA2UVJhcDV4SS8rY1Vxc0xZc1dBbmtjZTlVdGFtWmpo?=
 =?utf-8?B?ZWpxTXZvanBUTGkwQ3F6K2l4MGhTVWN3a05mSTEyU2hvSm9JOTFRNFJLOWk2?=
 =?utf-8?B?V3pmQmFJK1lEVzZSVE1TTWFadEpWeWNLR3VRcWVLTW1YenN1dm8zeWZHYUkv?=
 =?utf-8?B?SHUzZnZCS1BGS2tFSTVjaTZFQWU4NWhEMURsaDRHY1Q3Q1pTZk5WRjZKYlNz?=
 =?utf-8?B?WlN0VEpOVGYxUWZBTGtETWVNSXlEK01pdDY2VHpjaWxibFBSS0JuaElrT1lU?=
 =?utf-8?B?RkdsUE0ybWdkZXdJTm14VGc5cExLT0Z2QkMvdmd6M0RkcVA2c0tQdDEyN280?=
 =?utf-8?B?ZUZYSnJFdFFBMVlxK1lUVzYrM0REeGx6aE81emVaRnpEZEQ3WnJvNHpTKzBj?=
 =?utf-8?B?QnFSQ2x5amkvMjVJekdnZHJwclJ2RmpBaGxGdFM5dGVYQnQwUVFjYkN0TTk0?=
 =?utf-8?B?MVV4aTJUaFgwcG0weDdXcjYwcFVEQXdHMm1pcFU1dTY3Q1FqTFZESkhpQ2R5?=
 =?utf-8?B?UGluZWVjMm1uelp4ZHZEbHRxMGpnbU93ckNybEVscUVpMTArbUdMY3dXUFVH?=
 =?utf-8?B?MWdZaVVyNFZJcmpXOTRoYVNKN2pLbFByalRyaG94SkxqNkNXMW9vY1hmYk5p?=
 =?utf-8?B?bEliL0FWQ2RIS0NNSzYxYUhNQWwyWHBHMVdnR1lRb0YxaCt5RnVpOHd6M0hr?=
 =?utf-8?B?U3ZTMm1mQzBFL2dwOHhtQXdwcW9VOWpLUk9GVnBXZThEeWdKN05sQ3dvRm81?=
 =?utf-8?B?WGxzRWRIeFBrakcrVXJ3cXhpNWNIZmpKREZPY0Y3d2k2QWJIbktWRThBYXpm?=
 =?utf-8?B?c1R6QWhWalh0ZklQWFBFSlJWUU94cUZML0xyNVhaZStTZEJuc3ZidER1TWJ5?=
 =?utf-8?B?Yk1BNGcvVjluZEFPRWZRN3NLay9hNk1uSG05MSt4QVFBTjdhNDhQK2w4SWpZ?=
 =?utf-8?B?bXVVSm9sbnBvODNiemdYb0lqUGZYVmg4VTBINlFwY1FZald4S2pRQmZ6Qmdm?=
 =?utf-8?B?MVM1bkRYdll3Nkl2bE9ZVWNkVkhqYnJhRS81Z1JTWTlLTERtbURqaUVZSzFU?=
 =?utf-8?B?ZTQ1dy9PS1dhcjgxY1ZQU3V6Y0xWcFJhUXhkQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDhMUEsyVEp6VW1uZnArSjI4cGZNZVNnZllRdXJrMlJsNlFMVVk0VDFGWmVx?=
 =?utf-8?B?Nys2dkpiN0xEV3RPbVdjbVNPZWxEdEVVOFpsZitnRG9yYnJvaGtiUFNxTDhL?=
 =?utf-8?B?TVNHa2xZbm5LRCtqVkQzckNTb1ZnL05DV2Y3Nkwvanc3aDFtRndHV0JVSjV0?=
 =?utf-8?B?eEhldjhWV3hmYVh2ZUNmcWxRVXFiMUdKWHI1Vm1tMUhQUWErWVBEUWlPN001?=
 =?utf-8?B?TmQ5Mzg2R3Nzeit0YUZGMWYyUFNFc1JrT2JPTGYzTk1XTXRMRmJxRVZSTTM3?=
 =?utf-8?B?aDJ0LzE1MzRsemMvZzBGNld6MWJ5MnFZakxPeXMzZnFqemxVcXZ6Y0lydk04?=
 =?utf-8?B?SmczblQvMDVHV3Q0ZHlIbWlkSExrazMxQmJ1ejViQjg0TlNXbVNucHZESjJ4?=
 =?utf-8?B?cUxNWUZ6aGlwdHJyNlQ2NlY5K04vK2ppQkNtN096bUJrVkN5ZHo5a2RGRmhT?=
 =?utf-8?B?U0tZbGNXL3pVb3hXT2s5S2psRU1VTU1TZk1JZjYyZGFqTUs4SS9qR0FtNnhX?=
 =?utf-8?B?a3NHblN6Sk9JY0owMk5CSlI4MGxObzNNUEQ0YTlueHBuL2xsWjJmZ2Y3S2ZZ?=
 =?utf-8?B?ZXRyRUtpNGl2Q2M4cEVsaXlTa1JoU05LMGprV1hWRnRPLzBBTTY3RnVJeWY5?=
 =?utf-8?B?Ny96TWpYdnFpTVdxMEQxRmJqRzZZaDVoUnNyNlZaL2N4UTJRNGZ3SWdYdWVh?=
 =?utf-8?B?bkFDVVpNNDhnRlIrZEEraUdOQllzYUxDRXhWV0lVSXNIUE83RnFnbUM4Z0Zl?=
 =?utf-8?B?aUNwQmY1TVlGZXcvU2JoTUt5a1RHUFFkcmVPODVIT3RYU1dOVzAwMzhBc0V0?=
 =?utf-8?B?ODd1VXpYYnRnQzIxVkpEQzkzZGdKVktIZE9zQlRiaWx1MmtWaFNBd1lUQm8y?=
 =?utf-8?B?amhzNDBHd3lJcjhkajE3Sk1DTzlnSmJ4RndCdFVBdWJCN2dTKzFpdSs4QUJU?=
 =?utf-8?B?ZkhDRXFTSklsSTE1VlBKWFEzWHl1eWxUMkoyUGVIdXpTRkplZlQ0Z1hhb0d1?=
 =?utf-8?B?cmliNUkrSHU0NGVsSzV6VlRISGlaalB4dlFOTW53Rnk3ZWtTS1ByeFhFVllC?=
 =?utf-8?B?bHo2RGtvOFNUWHFyUVFuQWJOMlBPbWhmTTkvN25yWWRReUFvOGFHOWZ3Y205?=
 =?utf-8?B?VkVUMHdkVkk5OFBFbmhhakdtRDVnNFB3V3NZUXNqamhrbDBPMHZabTBySzVW?=
 =?utf-8?B?WHMrSHpMNUh6QW10U3NDZ2dNRGV0Mkc0M090NVB3eHQ2Y0hDWUFpZFU5OVlM?=
 =?utf-8?B?NkN0eWtHdU0zQmlENHJ0VWxqQzNndEhDdVhjWlhNUFJKd3hJc0doYlBpaTRK?=
 =?utf-8?B?RkgxTlVFbm96TVhOODVRSlp6OThqUGwvVC9mYVc1Nm1WTG92R2dXQ3B4OHBV?=
 =?utf-8?B?Wmx2Mk1xUXo4dGsxU0grQkxkNU11Q3dlQnBwZ2hvbU1rcUhBR1JTZHZiNmNU?=
 =?utf-8?B?dUpoeHg4ekFnNVlGY1JFckRyZjFWWTlKRE9PQnJ5cFg3MGhSTE9QVktrRk5J?=
 =?utf-8?B?SlNiV0hHeGVUYXRtU2VPOWJqbStHakh0TWFUZEZrRERYa1c0djZYQ05OZFBm?=
 =?utf-8?B?b3Q2Tm9KZUt0bEk2UkFuYklLZHFCSTlpVTExd2U2RGdLUW5sdzFvS0dGc1I4?=
 =?utf-8?B?SnRGaUE5RUY3ZjNFT1RDSlZuNkUySm5ZYU4rK0J3YksrczhoelVQRTRHenFm?=
 =?utf-8?B?Z09CcWtIdkVnQXluUElNZVpXZ215elNJV3J6eFk5U3RSRFpxSDFLaW84ZGJY?=
 =?utf-8?B?QXhOelpkTm1xQVpOMU5tVEpzOHhRN0EyR1ZUTEM0SUNRVHF3MlFaMDBkSys3?=
 =?utf-8?B?T1BBY1RyeEpNNmdvVWZpQ1hiNkpvcXdqU2FMbnc2K0o2RjBTNFcydFQ0MmIx?=
 =?utf-8?B?WWxFN2pCcFhIZ0ZBU2FiRkhZVmE1VnBCY2UxbW5BRTB2QktIQmptRUtSRFE4?=
 =?utf-8?B?Ymk5aTR2UVp2cWRYcDNJdmlEYms1VVB1TWZTRUxVemN4eXJ5K2ltNHQ4eUpP?=
 =?utf-8?B?VHFkRWhNczNHZ1dGTlU1L282ZzVTT1BRQzNnMzdveEdqdmtSeFpGWjFyZXNw?=
 =?utf-8?B?TXRlcm45MWZ0SGVReCtoNDVoUno2NEI1dWJ1TytpV2Y3UHc5Q293QW54RVhs?=
 =?utf-8?Q?DTKOBE8yu9N/VIFEKtayPVMrs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acf0924-2127-4374-d86c-08ddff01a81b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:41:13.7933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCJr0u5CduaB0FTvhc83Uw2xogUWS8WGiyI5+tozvsyvE7gvW7hzwz8VloMhBrJKdFw//43LBF+2QCGB2Y0C3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
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

