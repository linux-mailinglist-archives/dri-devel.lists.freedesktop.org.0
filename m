Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A86C0C697
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9643A10E3A1;
	Mon, 27 Oct 2025 08:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NxOj6edQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013051.outbound.protection.outlook.com
 [52.101.83.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD0410E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6DPtmNnzro0GKkf70PWJp17CiLipJbycV50J1c6SsMjwQ2qIDa6C0sNwceCExUn4cXalJja3T2XHZxkAAjIGi1B8GFExv2MbuGOOxkXwlFngJcx/MQEeXgqK7p4GN2OQWGHKCulWwfW73UG0v6yHlc6J8UyfDjJM676l5P90aGmZquha79Q5Kk/B2o6T3Ir0tLLjNpoDSUoT2ECkrrveD1NIR0/ZBEpAVhtkdawthBAgzvwMZL48FgJBibV6hSO9SE3ykHT/lEB6erCho/LALJzomJu57fxf0bxVUUhUJCjB18TWX0NT8eZQYi/78diGkCcI1XV5MGSRbaHU93Jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsD9Sgp+4EZjesXNUs3j5P3Y7PYJ2/tD1wUk5ZVPQrI=;
 b=prQ8SA/WV+7BmgQHLf2zGD06cVeGnQDjlby0I85QpRyrgPT1Zj42exagf2Z0wwQawClDhOY5EX97tbbl0bcHxnplqjR5tgWAxghNLYWm6DGKQnW4XqYmqSQlKEJcTow4Pfx5iZ6F5vftoM8znQn68UKzqVjYLZ3GVlffApjcP7JouJO2+ee2L/KzMtHTNNF+gmBSnciw2zan5aVxDxf4zZK42Acvz3MZ5WvXPp8I0ZIPY4zlwbCyR1C54le9Cyj1jPehwpbvgSWOhuz/0F0Zp6dvP9DXFup7vRR2qXMdEqn3HrXEOtyslAiJLm0qHVUHvH55CEKN/nKkkKJKbLHIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsD9Sgp+4EZjesXNUs3j5P3Y7PYJ2/tD1wUk5ZVPQrI=;
 b=NxOj6edQQG9zfhNtxyqAQ/y13Su5TUhTVdNMGhFwx3icQwJzMEA3HzNMNMKM7r33gyli2RT/ZkloMW9LYEPz2AKjmBYkvKgdNjcPREGLS985cMXenUZ0V7rYq7/81SYXlE73wJ4oYQeqlp8ZPDKxbtEK92jT0evcB+H24AaiCAtJRjoQT/j1MPSYEtRK49Ar93HJ+ZDQEsLd00g2Y4KM7pwd/kpGcMEIiL/kfbq3rAkAZPwCKGiWbp4fQX1PtRJFo5nupYsFGpB6Eq7uKlUv4VZMh60sWT33ZOpLsewuvEkXZgcxAONa9ZlNK7mPVFFqhWN8p90oPC83qSx6MNpSjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:47:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:47:44 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 27 Oct 2025 16:46:59 +0800
Subject: [PATCH v5 09/13] drm/imx: dc-lb: Support getting secondary input
 selection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8-dc-prefetch-v5-9-4ecb6c6d4941@nxp.com>
References: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
In-Reply-To: <20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.com>
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
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 61aa7e07-d534-4af1-5f44-08de15357f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3RYUzZBVmNPSm8vK1Rydm9GVnpSYU1zSDRkc0lxczVReW9tZnVUaWUrZWlw?=
 =?utf-8?B?Q1dTQzY4Ny9JQzZiSHY2MEozcGZGZkUzNUJQUjFjbk5ENUVwSU1PRk5rRVU1?=
 =?utf-8?B?RVBmd1RPV3ptME5VZENHa3N2amhvSTNGdVEwVmNaSnVhbzM3UGR6dFkrMHVx?=
 =?utf-8?B?WjQwWG01ajM4b1h0QzNuaHMzY2d2ajNWcDQ4dmpqZVVhelBpd2tpRFdmZ1JX?=
 =?utf-8?B?RVduQmZjamc1dWNmc3g3K1prb000T2pXK0o4L0Vsei8wYlkySkY5SWMwZHkw?=
 =?utf-8?B?K0Z0OFhSb2trdmxiRWpONTkrbFRod0d5N1pUN2dNM0VhRkFSeVRvc2pZNkh6?=
 =?utf-8?B?MkRYTHkvRWtQTVVrYm80eXJWZG5OWWYyK2Nsd3EzK2Z5allJOFcyelNCZE13?=
 =?utf-8?B?T2J6aVZuR0tXQ2YrM3c2djZhaEQ1S0N1cEdxZmVXdi9PTzJsNzNZQ3dTOGtu?=
 =?utf-8?B?OUxzVHJMallOUEJ3U0Q5Wkp3czcyQ1oxZHNsT0N1NVZQZWVWRTBISzlGa0cv?=
 =?utf-8?B?b3RUNmo3U25pWEdUcS92RW15aEM5RFRGR2FuQTU3MFMzZ3RCRkZleW15c2lG?=
 =?utf-8?B?Rkd5MCtTRko0b3NCbTVLaE1Sb29OMzJ6ZmlsaW5wb2IwUUw5RGhCK3NTVlhR?=
 =?utf-8?B?VmpwMGVTSFJNRUIxWGhiT21qU1lGN2JEa21MVUc0QkVXbUpQbjVKQkZhS0Vj?=
 =?utf-8?B?THROdHZ5UDNmd0U2WEpscHBjQ1NPR3htUGVPREdXTHg0b21ubEEyQlRFZHdF?=
 =?utf-8?B?dEVBVUY3S0JaVEU2bGtSNzl0c3RFMGk3MERCU3RENWNPaExOTUdMYW91aEVh?=
 =?utf-8?B?cER0cm1Hb3IwUyt0S05rMXFpbFB5a3N3anBTa0ZmVHlZSnUyVFNwSXNBMi9P?=
 =?utf-8?B?T2NYNkZBY0xlOHc2QXpIbityMFp2QUJFYUFYMTNvWUpQMlFPYzh3QTRJZ0pM?=
 =?utf-8?B?OFIyVGR2SGVqNUNUTmljR3VYTUhUUSt0WjRBalNTTzNNeTV5UEtVU1JQYWVR?=
 =?utf-8?B?azRHWWZheGNzdHJKS2p5WnlINDlUZzljSWRZRElrVW5CMThuUWtSUGFYS3k3?=
 =?utf-8?B?TmFTcVZMdEhHdGZta2NiRWQrazRuQWhnSDFEVEIwWkl2ckRseXlwSENSVldB?=
 =?utf-8?B?ckhxZ0JxU0NnYWNqMHY2ZGZwUG1zdGtyS1F6bzFwcHE5Q3cvb2ZtN2loVnVu?=
 =?utf-8?B?dE9NRk9lY2lrR3czYyszRElsNzV3MDA2cTFpbWptMDJEaC9lV2RwWlFSNHRD?=
 =?utf-8?B?US80RmdEaXNBbUZDNE1wc0tqREpyZklmS0FEYkdsZFB0Wk1oeWFoNWVCUUJ5?=
 =?utf-8?B?OGpxOTRVeUd1TXgyaG55dW14bTVIdlNna2NCUE0xZTNqNlFBUEh3d1BQVHBo?=
 =?utf-8?B?cUpzT09vVk0xbGJsWTB2NHJPVWNGamlxOWhQcFFXVkREeU5ldUVmdVlGNFlT?=
 =?utf-8?B?dkxjbDlaTm1jeXViRVZrOHg1dlh3YlB5cGpyU0xzajBmcjBsZzlPS1RkRjV1?=
 =?utf-8?B?ckl3NG9BaXQvNHZVRThHOHYwQmcxWjA0N1UxSFE3SW9RMHlYeEx4cllVbmNY?=
 =?utf-8?B?elpLalNBNmdFdWNTM2RjTU5UK0JBZWliMER2Wk4xZHJHMW12ZFl0WCtKRExX?=
 =?utf-8?B?M2NaODE2R0Z6TzErUHhzNk9rSVFEQkdwVXlLRzZBd1dSZTB6SnVqeEI5ZXA5?=
 =?utf-8?B?bXNFNWxaV3NtSExBMmVXZzVWS0lCYjN0dDgvbytlc1QwTVZMMitzVHJkNWs0?=
 =?utf-8?B?NE5ielhDWi8rckJ5MVdqM1lvd1ROVUIxM3Fac0d1WnJMNmx3ZUlyelpYT1Vz?=
 =?utf-8?B?cUFlZHdsWkhvNVRLbEg1cHpma09GNEFuY3A1aXNTS2V2TWxFeHRXNGg4eU1C?=
 =?utf-8?B?dERBY2NWaUZsSzUzQ0htamxmQTZhaXB1UnhWekdGLy8zUHJ1VlRoQ2pDY04y?=
 =?utf-8?B?eDRnRmpUV3R5bGFZUDBRbG05K3NyRUVIeVIxSVpHL21lNitENjRRZERYSEJh?=
 =?utf-8?B?Z00xRkVMcnR4Z0RrblYrWHNHVzVGdDk5VVhNNjRLeDVmdm1wSDlXRjB6ak1Q?=
 =?utf-8?B?M3c3ZUNxQ2Y1V2Vadk5GWEpPTFkwZW92MUNZZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek4vazZ1YmtPYlo4TnJlRmxKUjBYcHU5NE1jVlJNUmdBd0ozK1lwSzhJT0o0?=
 =?utf-8?B?TThUd2xZMFI1QUJyaU1FUm9Mc0RyVDhPMXVqMGlSY2Y3VUplbkZOK3h0NzJG?=
 =?utf-8?B?NUpTQ0tuVnA0T1ZDdTVKRnRPcUU2K3B2TlR5bmtMYk9XbG1HRWJpUXJPeEJn?=
 =?utf-8?B?TFA4UERacFRjaFdvRFlBcE81dmtPNG91dU94aU5kYjRqQ3NBZFExRGRJekFk?=
 =?utf-8?B?dTlHMFVtRVl3azlsTzRMbWs0amJWSzB5TGkyZzFIb1cxQzRkd0J5TnRraWUv?=
 =?utf-8?B?ajh1cFVjdm9ma0lWV1pRRzNxMkNSd0xnQnZ5c1crNG1RdlZteWlwZjlhU3lj?=
 =?utf-8?B?TlVTTGtXeDZ3WXJoaFcxeURxN2MvbWNDR2NRVCtkQnMxRGlrSG4yWkpyYXpm?=
 =?utf-8?B?bjFmVWt2em54UGwwRkxGU0w5enB4cDhzeGE5WFNMa0tXeFMxK0kzT2I4ODNX?=
 =?utf-8?B?MElLYlRYQVlaU2NaY2J5WlV5MTdjRWJ3N3JqUjJXZjE1MjhaNFp2bU1kWEFu?=
 =?utf-8?B?WG9ULzVtTEZCQnhaMlAxcnNQeFZvVUhtMXhCU3U1amRGTzE2ZzVSaktDdnJW?=
 =?utf-8?B?THg3VVhGK0MyMDkzOFhkd2V1S0dwYkFtTG1MU0VxOXNRbnVXUW0vTlNreDU4?=
 =?utf-8?B?S3pIZnpWdG4xbkEvVWJRb0FCSVFvQ2FLVVNvbGo0WmRSM0p4MFJtcWtRc2ZL?=
 =?utf-8?B?SHdtTmlnZTU3Sk41b09wTzcrUHdUNWowa2N6ME51SzAzTjRBYVJuOVkzbnh3?=
 =?utf-8?B?MkZyakw4WklqSGZJNlRGZS9ReUdaNG5mOTJrUXBwRmp4aEZMei9uU05FcVQv?=
 =?utf-8?B?WTc1ZVlsZmpOVndlaGFnR3o4QkhwakJMQ2FCTDBqOVJidThQVDhzT1BUOXVT?=
 =?utf-8?B?cHk1ODhpZDVaQnVIZUVpNFduV2pENVRYYVFUdlZJWVB3Y09BY1k2RUtQL1dG?=
 =?utf-8?B?NG1iK0o1aHRkUXIyejNpNzcvVHQwVGFjM3ZEWnhIbWR4NTJWYi9tK2FzNXRk?=
 =?utf-8?B?RE1tRHRGSlU2MEZwaFRDVlluc2dMV1k3TGRRYjNxWXpydFkrWHVXNzMvS3pE?=
 =?utf-8?B?WUdUTDlsSVppV3BCSzZQQXpxUlI0dmtRell4VE80L1Y2ai9FVW5BSXJZd1RC?=
 =?utf-8?B?Zm5idHlNRlBacmZyMWcyMDVpa2V0bzZ6S2NjRXpsVHRxYXVFcUhYMVB3d25n?=
 =?utf-8?B?Y292eXZ4alBQTnYxZ2FmSFBqdXNuTm5ncnlaMVhTVnRnWTN4dW5EQmIva1J5?=
 =?utf-8?B?TFNpZzFVQ0FvMVpKNWdyMjJreDA2ZTBkaHkwVkltWHpGNnNZYUx6SmlQL1F6?=
 =?utf-8?B?aWdSTU1vd2lUVG1iTDZWTVlHQ1lhWWY2TjBUQVlPTkt1UEplYTRnMkwxK0l2?=
 =?utf-8?B?MHVWUWpvMlZseC9obXhFKzh3TTBuTHlDUllqemVoNzU5dThtd29NcnQ1M2g4?=
 =?utf-8?B?Q0V1MUxQMC9QZ3VKVlB3Q0RmSHBRY0l3Yk4zWlBVV09yLzN2eUhuNm1JR2RD?=
 =?utf-8?B?SnJtS1IvNHkyQk4yYlAySGp3OW0zYUE0cnpPLzdIdmorRFdPVzNiNkVDM1Qw?=
 =?utf-8?B?QUljSkJqWWdpb2lzeTRMUHphS292ZnNBWTliejdqZW9sSFU4SFZWVEpFaVli?=
 =?utf-8?B?RUV3Ym9QZDJuZUxlQS83eVo2NGJPYXU4Q09qaEtSaUpxM3FVV3doUlFtNUha?=
 =?utf-8?B?cEhHZ053OVBwSmtvMDk1K0FUcExxSlVOcTlaTzZza2N0WlJrdytFblBocnAr?=
 =?utf-8?B?OStLaTdoU0c0bld1ekVBMlJKSnh5YVZxVDEyQ05BOFdXNnIzNVlNQXZQekRC?=
 =?utf-8?B?Sy9rckZQRm1Uem1QRmNlakY2N2ZJWENva0dJaUlGZm94WWw5Wnpzd1BzY2tH?=
 =?utf-8?B?Rk5zUHNBR1lDRXEwYm5UNGE0WnhGNFdJWG9ablltQ1pEeHlnOC9CUTJVRitO?=
 =?utf-8?B?d1dneHFzaDRIWXpvY2N4OERZTHgrbHJ5aTdpQS9OcTIwZjdZVVpFc0g3cXk3?=
 =?utf-8?B?aUw5TTlGdWFLUGIxTnd4T01GVFp1ZE8rMkd6SzFsakdHT0drUnRXbTlnS0hr?=
 =?utf-8?B?SHJmdmQ4RmtscGtTUG9tUTcyaS91S3FkK3lRL0pTRFVHcWZRWHF0UFNLUXVa?=
 =?utf-8?Q?5duRpftkc2P2LTTEJq2vNtQ2E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61aa7e07-d534-4af1-5f44-08de15357f33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:47:44.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4oWnec/MY1NNydmuHa5uK+xbvM7+QR4AGRO0KBrGmNd6NOd5qYEaIijL+Vc4XPlfgzgnux6+mID6pLclXo5bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8432
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

Add a helper to get LayerBlend secondary input selection.  This is
needed by disabling CRTC at boot in an upcoming commit which tries
to get the selection.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
- Rebase onto the latest drm-misc-next and resolve conflict.

v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index ca1d714c8d6e654729e3c3ed5c00e74653b3e6b3..8622efac3f3d566ee6eeef33d90e2e26899f6502 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -20,6 +20,8 @@
 #define  PIXENGCFG_DYNAMIC_SEC_SEL_MASK		GENMASK(13, 8)
 #define  PIXENGCFG_DYNAMIC_SEC_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
+#define  PIXENGCFG_DYNAMIC_SEC_SEL_GET(x)	\
+		FIELD_GET(PIXENGCFG_DYNAMIC_SEC_SEL_MASK, (x))
 #define  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK	GENMASK(5, 0)
 #define  PIXENGCFG_DYNAMIC_PRIM_SEL(x)		\
 		FIELD_PREP(PIXENGCFG_DYNAMIC_PRIM_SEL_MASK, (x))
@@ -182,6 +184,25 @@ void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
 	dev_warn(lb->dev, "invalid secondary input selection:%d\n", sec);
 }
 
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec)
+{
+	u32 val;
+
+	regmap_read(lb->reg_pec, PIXENGCFG_DYNAMIC, &val);
+	val = PIXENGCFG_DYNAMIC_SEC_SEL_GET(val);
+
+	switch (val) {
+	case LINK_ID_NONE:
+	case LINK_ID_FETCHWARP2:
+	case LINK_ID_FETCHLAYER0:
+		*sec = val;
+		dev_dbg(lb->dev, "get secondary input selection: 0x%02x\n", val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken)
 {
 	regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC, CLKEN_MASK,
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 0b81dc6b251c452e7ca72f1cd12af065bafaa198..4e38aead69bce6e9ad4cf2a7cd1fedbaeda60650 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -93,6 +93,7 @@ void dc_ed_init(struct dc_ed *ed);
 enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb);
 void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim);
 void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec);
+int dc_lb_pec_dynamic_sec_sel_get(struct dc_lb *lb, enum dc_link_id *sec);
 void dc_lb_pec_clken(struct dc_lb *lb, enum dc_pec_clken clken);
 void dc_lb_mode(struct dc_lb *lb, enum dc_lb_mode mode);
 void dc_lb_position(struct dc_lb *lb, int x, int y);

-- 
2.34.1

