Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C100BE1BAB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40D410E943;
	Thu, 16 Oct 2025 06:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nKd1hCgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3E310E936
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1q9qMTFDbGUUXBkenwv24kD59K2mOKwGt+SGLCtvdy3Yul9MEBeMNKRIZd7pSAfizOv/fYiqT0EUqNGFZwVlf/7EP2p3pLJqocXLyufjgM9OgCHbdSkB/DYFwHP+tAGg6pHcS6H71uzDAFS2YzcDiZVfDf0Spvkq6WOi/2JN6gRdJukYJlzFMKeFLPfB7h5O85LAz7iXBH3YFXuuj/eZ9pSClwm7V8oXzPSqJleZEeBSvhF919crMieueBRqZ4Xpa7j7L9XbfRZgkO0neximqOQ+EPcw+CVoBw9Sau5B2/JBFzoxnMhWs6sT0PUjfmi6fQdHFp1x41Wtp6LIsD7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=yRhuXJJnVK9M7Nv5crpFmg5UDYQba16v0kE6/xQqMd3TfeqUczx7SD4CKsmjFrT40/bU8dpUwefLnEl+xTBTEPib5cdYUFuMRsYzU2eNq/e9AnhWRjOTXk3jMqDmCiEOhxv/SAFZ2GQW7s7lIRnLydFZiImE5c3aBvekDKtIYz/KDA4E6TPYxQRs4rZOjlVQoWUfB2HRcVe+4xNu/rqk3TIxLF+Cpy/oAwS2CZAK4DQ7PbOlKcTU8USFIKr6vgHxmEOh8Q26euMz+4VuersA7buiuc9UbnW+5estcq0GX4JT0elxk4FVrjVDcC04pVuQkTHncKhE3FIiwr61k+BvmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22o5WVTKBD6sRAtxjBg/sHqwuoSMqlIfhKv30d8ePyg=;
 b=nKd1hCgYgyJJ863EkxEimDRrBEv/R78fqZzkYNA7/V0Y2fntHuJWNBYAXOynJGQu1O2bpUbyR+huXDdDkNMrWy6G+83AeHKDH8Ue+aybzasC2ztfPWq2iD9FkGB2Kk89fEXGtQuzZOLoBtzwbwjwEi/M1o/ImL44+qvpzTVhQw+4SftIQcoJWo+e2dbBiFzjj/NbRj/9zlU1AGoVtaJO/PrtlvAJuyLxpsRy7VvfB2SWYgnp9SxWHk+7f+QISSDGpwHwNGpQJrNgJjNmjZFStzdxUzIjxr7UtrVEb2F0vlES3rseEU64LxtP/lhQ2LM/Ge2m+AVMyqAqDsUVyB7D9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9964.eurprd04.prod.outlook.com (2603:10a6:10:4c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:32:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 06:32:30 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Thu, 16 Oct 2025 14:32:19 +0800
Subject: [PATCH v4 01/14] dt-bindings: display: imx: Add i.MX8qxp/qm PRG
 binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx8-dc-prefetch-v4-1-dfda347cb3c5@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
In-Reply-To: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9964:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e31545-4d9a-463a-e51e-08de0c7dc7e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clUrY3g2MW5VeHdKczI2UXF2djE1aE9UYmNRZGlmREl5Wmt4TGw5dmxhK0E1?=
 =?utf-8?B?UlNFWGoyN1NKOGptL2ZwZHZ4MWVvZWJMZG5SdTFsekpVTTlDNzB4dTVySjhk?=
 =?utf-8?B?NzZXck1GR3d1VDBZYTgvVkxGZ2pVcXg3RVRGZGhGeWNMazFyOWRjQjVMSnJ0?=
 =?utf-8?B?WldLRXFKYlk0VXQvVHcyVFlDVk9LMWYxbmx0cG40UW13Vk5Jc3RJSUMwTjY4?=
 =?utf-8?B?SlhjT3FwakhEZkEwUlFpeDBBeUs4My9pZU5ZeVh6VTBybERqUnhtcktUbDRI?=
 =?utf-8?B?YWdHTStaVHV1SWZVWitjdlB6dnc2K1czRCsrTnY4VVFFZTY0YTMzTUpkL0xu?=
 =?utf-8?B?elExdTgzUXF5QnVGZVViV1RpcWxmSXV0MkJOMzdkTUdFQU9qWkNQbzhBR1FL?=
 =?utf-8?B?YU5hOHUwS25VQWZVTWdjZUZFKzUzdzFCbWNLWmkxUjJwL2JSdUF3cVNEYVk0?=
 =?utf-8?B?Smora3RoS3JNVzFkNk1HTkZPK3Y4Wk9iZXBMTTNkdityTVhHK21MdXcwUmk0?=
 =?utf-8?B?SzBSa082bFovSS9nVlpBNTZ6SjAvVUFmTDkxWFF1YXN1Q3htTkMzUStJa3Vs?=
 =?utf-8?B?VEVwb2ZwWEsyOTJtYStKVEYxOGk4enpraWFnZFZSZ21CYmxOQnR0SFg4eEMw?=
 =?utf-8?B?MTEwdmZFU3NIeU5DNGNTanlyUU14TzZUSVpRVDR2aUFoYStvQmhJMk9DVHFU?=
 =?utf-8?B?Y2lMQnpab3hlcHFPWm9nNEYxdXJkQjEyaU1LQzlwa0h4VTIzNENIbTJiYmpU?=
 =?utf-8?B?cnh2RE5hSUtSM2ZwVTNUUmtxV3FPUGtEVHAxR2k2UWYzNDJVbUtORmI2WW1u?=
 =?utf-8?B?STV4VGJTWlVoSGpEUk9vZjdWck1nN2Ywb0w4cWNEaGhHRkcwL3ZOT2RmT3Z1?=
 =?utf-8?B?SUNsbHhtM1JUZFhjOThka0lubVhOb2NlZlZ3SmMwVStNN1ltN3pUU0RIQXRV?=
 =?utf-8?B?VDRKY0Q4clNDcWZQM2k1c240dHZpak1sbU4wdklHWjBJWVlrdEtKdy9LOSs4?=
 =?utf-8?B?aHhkSStHd3ZsVVREcmM4RmU2SFo5WldDNEZXR3dua3p3T0JXR2VyYzBFV0Fu?=
 =?utf-8?B?QnAwU2VQUStGb0JxdEhULzZGQ3dhUDVTMWVaWTlWeHg0VTFiU0w4SVpHaVFn?=
 =?utf-8?B?NmRmc0dVRWtQMXMwMHlIM2NSNWxQVXIxSjVvYlJVY1N3alJOVDkrQmNCcHJZ?=
 =?utf-8?B?RjJPQlBmWUp6Wjh3eW5ubEVLUGhtMjJPNzdmcUZtNXJjTC9tbXhtSnlkczVK?=
 =?utf-8?B?QUI1SzRkNDk1ZVozcjhKNkxMWHZDdERFYWtJdU1tbjJVOFp5ZWF3cFJ4cE44?=
 =?utf-8?B?eVkyaDBpSU9SVXVwbkJreUtFMHVlUUErV1h0V2w1VzMwVU5iQVZPUEhMMi81?=
 =?utf-8?B?SmlWZVlrRmFsQ1JnUXdDc2h1M2t1WitEQ3VvUWF2a2xSdFp5SlByUkhQeXBU?=
 =?utf-8?B?TlhTRHFXYkkxMy9xMmZ3MlhvUklaZ0gyRzZkVHFqb3VQR29ycU9ocmgvT0NZ?=
 =?utf-8?B?NG1BNUJLN2JxNlNRb2gzYTFRbGpSeWZZOVhlaXM4VE1rRVlZcjNydW40aHZX?=
 =?utf-8?B?WlUrcFdkb0UycWlrUW0wdVRtTGRUZWw2ajl2Q1NFWW53dEN0cVVWYWtReVYv?=
 =?utf-8?B?aDJvQm9pMTlaSE9LY0FFTThLR3RlYmJRYXBJeW9KUkc0ZW8wVXFxMGFNS0Rv?=
 =?utf-8?B?WWNoY0JkajNETFQwL2l3NmpldWJwVFJtMjFOaXFWNlhTWXhYTC9ZeENmZEIv?=
 =?utf-8?B?R0lnVzIzbCtFcU5MeGs0djhudEUxV0ZKakhqcEQ1TnpHQ1Y5NHR6SC9kWkdh?=
 =?utf-8?B?eG8zWFg4VkpqNGhJODhzWERJeUUwQWJHVEpVTFB4ZktjcGRTaUdJWG5IWENL?=
 =?utf-8?B?d3VqNUNDSExUMXh3RzEwdElhbFNDeXh2V1VhaStHcVlMa3V1MkV2NlBIYzJY?=
 =?utf-8?B?N1pDTzFCa081ZFdKOEdQNWZhUEtzN01pcy9SOTRqS2EwMGxHYzI2MmxrY0pt?=
 =?utf-8?Q?Gz9I/NKWjTS7e5Rsw4zFzwYLE0XtjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3F2NHBwdVBQSzVoV1RTZUR5cnpPdVVwdjlvdkxjSWdMYmN2ZjhPRWQ0ZW9j?=
 =?utf-8?B?L1d6NFo3THBBd0l5WmxmK0pFblZxRVEyU0U1a3c0Uis3RXI4aW5WeGZpV1gz?=
 =?utf-8?B?N3NhUWJGRCtCc1UxWEZHTTVsOHhPZVU4WFQ4ekRQMzZETmpsN1IwU2VTSjVi?=
 =?utf-8?B?ejNPQ1RQNXA4dmFnZDhhSGVHZW5hMUtGOVVwRFlURDcrbjE2bkRlTVAyMjNE?=
 =?utf-8?B?OVI3QjJlS1lrYU5uQ0VxVmpxS2xDMmtIYnpvNjRKNEFPMkJMREQ3L2plNUhn?=
 =?utf-8?B?TGVZdXpsUWJyZ3NGTjYyQ3FEeFNtTnB4NnRMdVFiN285alNJWW5ZeXo2MWVp?=
 =?utf-8?B?ZUg0QXpGS2o0N0FWelpLaWRkaWlTNytJaW52cDFXaStOUnhrSlNTRnJPR0pJ?=
 =?utf-8?B?WmJTcHp2M2NJcGR0T3RwZk5oRk9TUkpVV2I1MisybHRYS2tndHRvekRiNzUr?=
 =?utf-8?B?UWFaOXl6QmNzVW8xSDRmeDFrNjZvSTkyVWJWelAvbkxGc2JZeXYyV3orTmdM?=
 =?utf-8?B?b0c2YkU5V2Z0aXFGWnAyQ3cyTjVzZmJyVm8ybS85L3pNVUxwRVl3c0piMGJE?=
 =?utf-8?B?MTVPKzdmclNWbWZzdGliYUxyQ0RZT2thcFVyM2g0cWxQSW91aVI1cWl4UVY1?=
 =?utf-8?B?S2pVNFUvL2JsZEt0TTMyRkR2Sm9mRm5yT0tSV2N5czFGTG9XMUJnellibDR5?=
 =?utf-8?B?ZXk3Vm55TkVkcFZ0emprUlptWkFlSTZrVHUxOUxGQkNQOHg4QzJLRmgyOWNW?=
 =?utf-8?B?UHdXckV0UHR1akl5ODIwQUxXcERmbHhkMzVNS3hoZU94a0tQSk0zUFRHOG03?=
 =?utf-8?B?cEQ4N1V3YjE1M0ZVanhPcXBBRFIxeVdITjYyRmlwNHVpRmp5OGRQaUVCNlNs?=
 =?utf-8?B?Zk5DaFNrRFZXdG9OM3huWEZoQjd0NWJ1aXZvek03R1VNb01PZ3pqRTFMOFl4?=
 =?utf-8?B?REdzMEsycTR2aExIZTRTanl3SEkzZzhKODZkWHo4REVzOU5KVnpMcXdTU29P?=
 =?utf-8?B?L0lSSi9LdGs3cFJYdk5DcWFwcHFiQm4rN3NMd2NiMlZoZ2VxY1d2WTVjNHhK?=
 =?utf-8?B?YUpvMU4rQTVYcm03UGdPa1lwMzJEMGw2ckNaakk0Y1ZuY3JRTU92UjdhNDJP?=
 =?utf-8?B?d29zV2VLbWFyWUpkU1poWHZ6eEFlYWozSGJYbnV4cWRXZWJ0VzdHWTRnQmp3?=
 =?utf-8?B?UldGTHJOeDBQU2dTSFZPdlJPcS9tSjVmMkFMVW9JSmE0UDhrQlBwTkR6Rm1v?=
 =?utf-8?B?OUg1RTQrOVpxMkdsZDRiOGtuTkJwQW5RSk14N09jZGtyMzJuN1pQT2Q3UU9Q?=
 =?utf-8?B?QnFIQzJVaE5UdWRmc2JsS1M2WWM4VmFNdjVZcGZPQ3FuMHkwNDJRd2JUMmZi?=
 =?utf-8?B?SEFsL3d5WTN4eW42dVJsTFJLd09nL0VnUk9NT0VjR3loaWM3YTg3VmxEb2RP?=
 =?utf-8?B?Wk5NcFd1VXNiaE1MbEVOUEhnZVRYa1JUNUxBekpGbnVCK2tvS21CZlZnVERk?=
 =?utf-8?B?d0xZdGdQS2RySGQ0YmVKWG02OVRud0xkcjhJb2o0clluZWRXSnJ6UjhnQkJh?=
 =?utf-8?B?Wm9qZkRPNVRTL0lpRTc3WXkyQTdyY3dZVERvS0llMnhVM0FLWEtONC9WM1Z6?=
 =?utf-8?B?ekJQUjVBSFJiazd0VTNtanl0dU1aUEgybEZsenRPZ1lhb1dCaWpsY29aM200?=
 =?utf-8?B?ZUFHN1ZYT1dqbE1zL1FxZm5zR0lsRGRleE0yaWs3aWJJUFVXWmtQQXpkcVQr?=
 =?utf-8?B?NzFZUEZNVDhGWFJQQVQ3bmx2ZmxzenQrT2ZSZUYrbHJwRWpvUldXdFVLb0h2?=
 =?utf-8?B?UWxwL0FwYlZqSi9pT1FoWVdtTG0rWWFkSE9ucms1bldwL0hzajBRWGttdVV3?=
 =?utf-8?B?VjJOMEpKMzBFUmwxb2M4Y0JPMGd3NXI0Z2xMdUdkckhNcGpLQXh1VkxFWTBw?=
 =?utf-8?B?VllMS25MQ291Mm9UTzVsK0wrTitUMjNvL3NMZGJGUkp6amhXVmF5T21QOEEy?=
 =?utf-8?B?VTR5NHRWRWVlSjArbDF6ZmR4TnVLWXk2NGRRYzd3ak9JcnNGQ3N3RTIwaGtX?=
 =?utf-8?B?V1JNTGc2dmVGY28vRnhNWEFLOVhKdERWZ2xlNFhISWlNYU9zT0p3aWtCTjBM?=
 =?utf-8?Q?6LJm5OMdH6VmRo7BXY1Ig0wn2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e31545-4d9a-463a-e51e-08de0c7dc7e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:32:29.9826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pl/z3d5J5Yn+5zz7SfOA7yf+7A9xGFn/Q5omiSguPDjpzEhnAtq2s6p+cBXVoXXXeiHhjix3RVFQE339ThoMKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9964
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

Add bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changed commit message to use imperative mood.
---
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ff46e0d4e73488f8a3ed538830570b1ec71b50c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Display Prefetch Resolve Gasket
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The i.MX8qm/qxp Prefetch Resolve Gasket (PRG) is a gasket interface between
+  RTRAM controller and Display Controller.  The main function is to convert
+  the AXI interface to the RTRAM interface, which includes re-mapping the
+  ARADDR to a RTRAM address.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-prg
+      - fsl,imx8qm-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: rtram clock
+      - description: apb clock
+
+  clock-names:
+    items:
+      - const: rtram
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    prg@56040000 {
+        compatible = "fsl,imx8qxp-prg";
+        reg = <0x56040000 0x10000>;
+        clocks = <&dc0_prg0_lpcg IMX_LPCG_CLK_0>,
+                 <&dc0_prg0_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "rtram", "apb";
+        power-domains = <&pd IMX_SC_R_DC_0>;
+    };

-- 
2.34.1

