Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05CCAC1FE
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 07:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6B510E0DF;
	Mon,  8 Dec 2025 06:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="mamF9JeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75C810E0DF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 06:13:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr3kFGZ1JDj/vH58nKQOXfxoxEjktn29rFac6mMfJF8HixMpXqZWkVDLJ2htLwYy/wCDNXsCAcy0pDCcnPtcjwrQGX4VkTT5gJNBb7FL6myO9iaTv8WTKjSITJ8kOxLOXXbfk5s2D2lX6jvvqCof8/lU4ss6w1WNyZ/ansg8XcGvldXYH2blP5WwRPET5Vqox4FWH9/UfWTrTAQ4ZRrwjhWszlGG8vMis0Ng4bjEvK74Z7VOBblIL0uKJXyhmXk+ibiMsp1SwP4HEuylTkT2/BjFhJ/ff/g27zpf7qG+fn4QWgolffnx1FdO6jgkujySUf1S0tg5je8Sy8xrJMbd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnSbwZeM1k2xLJVhkMamb7Iz3vm5EtF33hy+EzFYAww=;
 b=J3DLTKaeCh4nVjf6JtkDXgld1tpxv/k947IrvWDDCdu3z968huM4L2gSmqnCAK8oldrEa5bEQEOfFXMh9mtQ/0REkdpPW8I/NWDiEmPm2AMWPxG1METFQq3hPNcEcFKcHhcjIcYwAsurlPIinHQZlXtyMKGpAOQVOMOCy7WkKAx/cVk03J+I6ON5RudFXPmtGyRI6T7WzggmL+mJRNMj7/CQ/thr4yEfCuFedaudhP8Hn1EXgXExe5jRMG+CTFpjRn1ihK3wBj2lxbDxin3h05SXuks5M7guTQKnMGyGTV4Vi9nAOGTjrJtpMrjMI4s9/FeeIqqXFtZ4z2fiZz/CTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnSbwZeM1k2xLJVhkMamb7Iz3vm5EtF33hy+EzFYAww=;
 b=mamF9JeLSuab0pt174HS0N36S9aRiGHTCJ1nA63LvdhmFivbRZEA7WFjurdmbZzida1/CBBaCnLAgXvpZTy7YseVFufQMSD4nQWEs2ukdGFOiP19Bfh45cQ980zyKbdXeEMzr0vplqXfDtRs4ZHcmDE9nSLAjF4E7PYQHZk47ge11k8FM03tX+bjLuNoKisWW+kcGtTSnjLqQ72JGr7gxMlC45eFhAxt0X2kJ9hygCZKFEEKLXA0YFTqoEXi/v2Im29zCdLiEGZKHDEZcFKzyKmughL9tnH4cHvJbgUwzL9HS7wj+ALopWJcMq8KkRVr42yPeMrRs9SJ/vj/KH45qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10955.eurprd04.prod.outlook.com (2603:10a6:800:27c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:13:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 06:13:55 +0000
Message-ID: <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
Date: Mon, 8 Dec 2025 14:14:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10955:EE_
X-MS-Office365-Filtering-Correlation-Id: eebe7ab7-695e-41fb-15f1-08de3620f74c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUxZWnJwVGNJMGV0YTd3UE8rbjFkOVJzWEJ5b3V1YloyOHJDaGc3cjJoUXlq?=
 =?utf-8?B?Y3BaNm04cXBUMGxMNlFXYXRzOW9oQVQvOGo4OE0rZktTOUg4TEN3THp1Qjc5?=
 =?utf-8?B?a3dHeDdWSUhwZ3pTbmxrVmdUeVVObi9SQ2ZBY0JlUGljYWhFMCs4Rk55dzFx?=
 =?utf-8?B?RnlPb2tQa2FUek1uMkNVRmQ3VW13dUQ0MTR6V0NuUEtmaXZiT2VFRCtZWHZi?=
 =?utf-8?B?dUhqRU4yMXF3WEw5c09EbzlUNzN1MU1jc3ErakNTMDY1R1RzeDJiVGx1M05k?=
 =?utf-8?B?UXdJN1lpUjFmTlJIdlFva3BqVWIxRnpjS3RaZ1RiQWhwb1V4dDd5SSs1T2VU?=
 =?utf-8?B?ckVnenNZVzFUdjZJSWdVcXJmeUVsaDRPRVVYZGl1ZW5RWlNtY2laWHNjZ0Jm?=
 =?utf-8?B?VzNGWVNLd05ab0dCVERSRFY0cC9TUDF5Q2xOU1hTNlpKN3Z6LzZJcmYxNXJD?=
 =?utf-8?B?MjVuczA2OVVUZmJrWjJRN2ZEVkgrZGZWNmtiaTBjblZpRGo2dEFRWWFzRlNk?=
 =?utf-8?B?dzdzejEzV2g4R0p0UTh0dE9PR09UeHNkT2Y4RmVKRmU4aElHdVpxL0REVU9F?=
 =?utf-8?B?RDk5WEdGKytzeXk1Q3lpdGN5MWNCdkFNQTNHMUZCVG1BWFdsNis2ZlN4ZkZa?=
 =?utf-8?B?UW1wdGlLNmVoTjEvV1JMY2h2MldOQUQyajlvSnV0LzdtZzNWMllkdXRiQ215?=
 =?utf-8?B?Q1N6QnN0NmcvZ1QwSW5FNi9pemhOQTBKRjVIbVpza0ZGeWRWT2l4WUM0MHVt?=
 =?utf-8?B?U3Y3cnhSSjVWSkNSMXRueUZjY2x6NHNuMUwxZFNta3E4ZnpWY290cGxmUUFF?=
 =?utf-8?B?WkdQZk5xYVBoUEJKTldRVTJPbEY4L0VxNC9BRXhIVVZtQThROGJtYVR1QVFX?=
 =?utf-8?B?WEtvYkdxOFVDUnF0RUsrYkFBeWk4aGVhcDN3WnFvUU5leUxzVm1uWE5sbnZJ?=
 =?utf-8?B?c05VVzVLamxXTDZHa1pRQlhobzBkcDFQamVPWnJIeW9HQ3hJZWFNVmNlVmw4?=
 =?utf-8?B?SzUvTmMxU3VQMjVRYWNodzFnbk42b3FuejMvaSs2eVZOV0w4UE9kRXlHbkp5?=
 =?utf-8?B?RGdPNkRVUzZjdjBxeXdjQ294b3BhbXRBR0RoaEV0bjdhaWh6Uldud1RUMzlX?=
 =?utf-8?B?SFJSTzI5RVFJMUdHc2FGWHVwMEZDMVVVdm82MEZmVm1iZ2V6S0wwbzZaZ1Bs?=
 =?utf-8?B?dkJRdHNsQ0JPM1BuZDlEYkdTMENadDFNcTdZSTM3UVlDeTZQOHNjSDRSTmRj?=
 =?utf-8?B?SFdGbEJtR3JoZERFVVFLMmlNUFlwQ0NOM2M5dWNjcFp6UlE4clhKaDRrNDhs?=
 =?utf-8?B?RlVEWkhKV2tkMXRYbEdYdEZvRXU3UVFZelhnNVRyQk9GQkRzMFpsVzJsaENI?=
 =?utf-8?B?R3lVd0cxcy9DSUFlOGRETGVuNVFscjc4VjIzWGxMR3ZoN0RLUVdaRXVQa1Rj?=
 =?utf-8?B?OHM2QUxLVys5Z2dTVHIwSEZKald3MWEvd3phWk13dDMvRGFaeDFwM3dSeHBY?=
 =?utf-8?B?a0hCL0dXR2lxTW5ma1hadGYxZWNSZXMxazZUUnZqVjNyVTVkdWQvbjFnNjhM?=
 =?utf-8?B?c2ZoYllJZXE1Q3NoRnRXNGVnaTBUTmVKbEpCSDZMVVhFdU5yeTUyV1BheVpZ?=
 =?utf-8?B?WGZOUW9meWdIaDJXaVNEcitFVTJxVU1sZDJzeXUxNHZjdGFWKzlKMG8vSkYz?=
 =?utf-8?B?bDJWZnJIMkZXV0lkNk8vb1E4UzN6VmplVS9xbVlPQzcwM2xrb0pMT3YvMEtY?=
 =?utf-8?B?Njd1dE9wOElrVkxyMk9WY0ozeWFXVmRYd2RMNVo5cDhjaTlMc1B6UVFKdVNl?=
 =?utf-8?B?MzZBNktidXpDOXFlcWJVTE1aTTNxcmMrOUQ3dFNDeUJnVThjY1pqT1R0UHVO?=
 =?utf-8?B?bkV1a1NacndySDNMMVJYd1hsZXoweld5RVJBejhjWnJMb0Mvb040bnZXclh6?=
 =?utf-8?B?NWZ3RFN1YUMvcE12Q3REdkpBOGQyWE82bHp6eW9lYkRrZitFckljYnFQbENH?=
 =?utf-8?Q?HVKqpkWqDjFb52mUFX9Hz50N2RhiK8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rmh6Z1c1czFJTnFjcTZlY1crKyt2RUduOUxJZFVwMFEzRkJ6UWRrMGZnY0ZD?=
 =?utf-8?B?c3Q3VENCL1lyNWxRVkVDSXhYZ0xtN1N3NzJmKzliSThGM0JSSVhVb0dST1pO?=
 =?utf-8?B?K2UwZ2JEcStQc0tiOTZIWk9nbU1JMGNvSWxveHR4MU0rQXh3L2svVWo4enE3?=
 =?utf-8?B?T0FmK09QbG9YQmNMZkJ4KzFqdlR0Y2pXbjBLMlhkaTRSM3FRQmhBdGRvRXNv?=
 =?utf-8?B?MnNsL1p6c3QrOHVwMDlENkgzenZ2alZ3dm1tSmRIVUFWWU94Z1IzeUdobFNo?=
 =?utf-8?B?ZEtNdHJZeXpDVWdrTlZqZW1kN2UzbFlqeHplWGl5L1hibnNBeWRwL3Vqb1Jm?=
 =?utf-8?B?WSsrY2c5eDYvRTA4clhtR2VMakVISE54dE1DYjQzcnJuUzhOMUFmM2xxaEth?=
 =?utf-8?B?RXlmTjBsOU0xOEg4dUFKay9tbFI1am05TExIUkRvcVQrUG5yaDh1bWc3Nmp3?=
 =?utf-8?B?UlBKUFRocTF1dzV5SXl5VnlLVndCektieWNvN3pZbi83b1EyeW4veERSa285?=
 =?utf-8?B?WmVDT1ZlL0dIMFo3dUQ5eGxqcjkzKzdlYm9YZ25DTFpnNERRUUJYUUNOL1p5?=
 =?utf-8?B?dEFJczhhQXVhanZsUTA5dFk3a1BrS0d2dE9BdUg2ZTBXOVhLVTkzci9NcEty?=
 =?utf-8?B?a1AzTSszbTN2U0F0YW9FRTlFVU4zR1kwNlNkTzlsaUlYMFM4OGRZNUdQU2Y5?=
 =?utf-8?B?eWFveTlQQWw2ZHlLbDlHUlpVT0tlUW5PUmFhMkZHSlQveTBnWEpkY1Z3SW1U?=
 =?utf-8?B?cHNVU01CSyt4MVM1bkxyV01YK1M4SWFocXhpUDBGcWdMS0YrS1Z0Q2xGaEZ1?=
 =?utf-8?B?cHY4YUtsNWhhc2FFU1RsazJuOU5YNytINkhUYVRRQWhvcVQ0alB3Z1d5ZSt5?=
 =?utf-8?B?WFBVMzFSd1Z2NEtVZ01qcUhZTmt0SEJ3RjdNRTJRNWRGamExeGMvcEc2Z3Jy?=
 =?utf-8?B?OExwdjZOTEwxTEVFUStON2pXbit5My9Ea3F1Mkp2cWxMV1pNVU1lWjRDTkNF?=
 =?utf-8?B?TzZ5WTFEMUwveWpsU0dRWGNQbnZjZ3RCNEtpWjZLVE1uMXhoZ2xhanBHZXlU?=
 =?utf-8?B?aGZjbEFrT2x3NEJ5VG5jcnJZRjdsM2RFZHBLSWIvczAxR2tBeG1Cck1tcm1P?=
 =?utf-8?B?bGlXU0NnQkxETTBZMlY1VHJ0djc1UGkvQ2hVdHo2NkxqQ1ZncWhMUkFTcUNH?=
 =?utf-8?B?eW9uV3dsRXNtL2UxMFByWThCTloxKzRodkpsYS9qeHZTOUQwNFJhaVhFVFJN?=
 =?utf-8?B?WnloVWkxVDFmZk5QOFFPZjBjL0N3dSsxVG9FUHpUYlFWaGdXWHhhZ2U4d2Yr?=
 =?utf-8?B?V2lMeUlxTktZRHRwK09kc2x5c0Z1ZGZ5enFrUE9yc2F1akpYVGl3Tk13b09F?=
 =?utf-8?B?MUxxM3BXUDZwMllHZUVIS0MzYjZJRCs1a1JiSlYvcWRIZTFRQVNoNURsRzNM?=
 =?utf-8?B?M29NZXl6WjIya2J3Q0tXbWZkT3VDSUFGN2ZYdXdHSVUrbkxISkZHeDc5eUJV?=
 =?utf-8?B?R2ZNLzQxcExrR0NZTURWcHBmdno1dDN6eGdaTWxjdGMrZk9NNnNaYnVkVVFr?=
 =?utf-8?B?aEVUbDQ4ZEIwZmxZaWwwc1dpYjYxcXdwTFIrc2tzeU1sOVNLaXplWnZZaTlK?=
 =?utf-8?B?Z3dvSHAyaU9MT0tNMlNRQVlrZHd1ZEFFaC83OWNZZ0QvN1ZvYWsvclFicXYx?=
 =?utf-8?B?eHJ0ZndoWHo3M20zNTM1ejgzM0JNN0dYUTVaVHVoNVYvSUE1bHhTdnlwSmZH?=
 =?utf-8?B?cUZ0a1JPSGZ4dFVtaU1EOHZ0S0ZGOUNIWFY2SXlkbkxTbjMrSjBzSGRLdklE?=
 =?utf-8?B?cGlGeFlWY2phcDRYYzQrcnl4UUJYdU1KQ1NHamw0ZTFLaktrME5PS0NTRGlQ?=
 =?utf-8?B?Ym9qRGFDNVJEVmRRNGczR3BlRTdPaUYyelFNUVFWUEZvR0R4QnhUNUcyVkpY?=
 =?utf-8?B?M1ZxUCtMcTd5RFp2TC9IaTQ1WE15YmFaMkJIeG1NdldFcy9sajArRkUwUVJO?=
 =?utf-8?B?NVowcFNQckFHbE9WTTlhS1FOR2U0dS9oeHRURVVweUMrY3pDQUpLMW5zZWNq?=
 =?utf-8?B?SWI1aDM5WFUzTXBNR3JMT1FldWlqSWVhbnprTDdJZkgwWmJWVWhkbkszVkF0?=
 =?utf-8?Q?81eIH8XkzBRMSHDnjIgQyltuP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eebe7ab7-695e-41fb-15f1-08de3620f74c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:13:55.1007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqqBVR6pey1DmTr+VUJQH2lybJ88im94bJ3M55QEfJeYertrkRi7eq+OiQuav23PYRsWJBjCyUuRxSovSTmSbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10955
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

Hi Marco,

On 12/02/2025, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
>    '#power-domain-cells':
>      const: 1
>  
> @@ -40,6 +46,60 @@ properties:
>      minItems: 8
>      maxItems: 10
>  
> +  bridge@60:

The dependency patch series mentioned in cover letter has two links in it's
cover letter.  Reading the patch sets pointed by the two links, we may find
Krzysztof's comments - the child nodes of the blk-ctrl should be completely
documented.

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: nxp,imx93-pdfc
> +
> +      reg:
> +        maxItems: 1
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input port node to receive pixel data.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false
> +            description: Output port node to downstream pixel data receivers.
> +
> +            properties:
> +              endpoint:
> +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +                unevaluatedProperties: false
> +
> +                properties:
> +                  bus-width:

In v1-v5, I thought the output bus format can be determined by the sink
device(a panel or a bridge) hence properties like bus-width were not needed.
But, if this property is really needed, then reference video-interfaces.yaml
since bus-width is documented there.  Should we reference bus-type defined
in video-interfaces.yaml too?

> +                    enum: [ 16, 18, 24 ]

The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP supports
below formats.  It seems that the enum here may tell RGB888, RGB666 and RGB565.
How can we tell RGB555, YCbCr 24 bits and YUV444 then?

000b RGB888 -> RGB888
001b RGB888 -> RGB666
010b RGB565 -> RGB565
011b RGB555 -> RGB555
100b YUV -> YCbCr 24 bits
101b YUV -> YUV444

> +                    description:
> +                      Specify the physical parallel bus width.
> +
> +                      This property is optional if the display bus-width
> +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> +                      is connected and all 18-bit data lanes are muxed to the

Per video-interfaces.yaml, s/data lanes/data lines/.  "data lanes" is a
value for MIPI DSI/CSI, afaik.

> +                      parallel-output pads.

How about just saying that this property is optional and by default it's 24?

> +
> +                      This property must be set to 18 to cut only the LSBs
> +                      instead of the MSBs in case a 24-bit RGB888 display is
> +                      connected and only the lower 18-bit data lanes are muxed
> +                      to the parallel-output pads.

The __lower__ 18-bit?  Isn't it the __MSB__ 6bit in each color component?

> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - ports
> +
>  allOf:
>    - if:
>        properties:
> @@ -81,9 +141,12 @@ allOf:
>              - const: isi
>              - const: csi
>              - const: dsi
> +
>  required:
>    - compatible
>    - reg
> +  - '#address-cells'
> +  - '#size-cells'
>    - power-domains
>    - clocks
>    - clock-names
> @@ -112,4 +175,33 @@ examples:
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
>        #power-domain-cells = <1>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      bridge@60 {
> +        compatible = "nxp,imx93-pdfc";
> +        reg = <0x60 0x4>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            pdfc_from_lcdif: endpoint {
> +              remote-endpoint = <&lcdif_to_pdfc>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            pdfc_to_panel: endpoint {
> +              remote-endpoint = <&panel_from_pdfc>;
> +              bus-width = <18>;
> +            };
> +          };
> +        };
> +      };
>      };
> 


-- 
Regards,
Liu Ying
