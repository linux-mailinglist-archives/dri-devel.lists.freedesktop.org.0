Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0816AAE33D0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 04:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D3910E0C6;
	Mon, 23 Jun 2025 02:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="F0Sxwhng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012018.outbound.protection.outlook.com [52.101.71.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3810E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 02:54:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0msKdfw3ucOuXl2i/V9G653gfaJ1tXQxp769rOSsht74H0MdELAXsgmrl1WmNvKuuaXDLqCsXCQocWTNCNSiOfIuAxPeVni7Z2hNFAT6BBbZmsXoWTvP2OCXShJkfgFYN8J0/zRiBuvTXR4XkN4F9G0Ra0BSVfvrHL9W5OnQHjHbVs5UWWdkhmS9BOwXaGeVftr9fYb6oszEA2eFxUm8o3VXVFK7tk9E15BEjWWN1XkmtQsemhgJeyFJuXc+ZTmZcqXzLr3JdD05HRWDKejEOoKumPyTYM9NRdtcWXgaGPehAOk71W7oAnfJJ0f/jVARgz2083nxQXGJw8XUnYpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bxHArbBQIp2KtJbvWfWit8Zuj1Xq6X3+LPwrqtMuRM=;
 b=Ej8lUSUKZipw1A8I+U6nl+fogfpj3tBQo5/p41WOQPqqzYu9go4sgoj+SItRQqZ/25rVm54ue6nm1/7VtCNKnw14wByycrarEs/60eR/YiM23EvqyJ088PqiMXmkRucjODb8E9CNrWU3AWusTbGvZ9Zw3JKawTYL8uRe463eUkxS9jiqNx+RTqh029gOzDfSQXp++MctT6BziN/9EVOvwD1fgqYeYWTCE3ub3F7hg8LDVx5+aJ6o81fmlcjdfB1YN4I2mJZIRnx2c0r2NfmkelQX4j+QRpPJFTa7hBBuCTxuIgCM2g3NyUdyzD/v/knShFubNPy7EuiraUyKv0Tibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bxHArbBQIp2KtJbvWfWit8Zuj1Xq6X3+LPwrqtMuRM=;
 b=F0SxwhngCM12oLp9uVIePkXgPqucnC5+FFfeV8585t9rEzKkQP4Dh098H9qT3ZT/4rCJ13omsUL5kFVBRfOhTQ6vYmHo1c0bkj8pETzqHQtyU3v8PhJeU/bCESCWVmKuUmDllrXJmSthe1qp/pqmyX+iF0oT3+xH8fm+rKPlrQIwxW6pRYByZORNFSogsHlLrKW3fi9DbNUSFd5FCljL5YVW5IP0V59+zBdqWW8AZFsx2z3W7InmPD8JWATOo8bWe3j0VMDI0qSWiw0FabfBoYuv0Lka2dvEnme+CSNMF0Fo9Mv+RSrZtiqhkdvDpWcdy7mMpBJRTP7oEaVah0pknQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA2PR04MB10214.eurprd04.prod.outlook.com (2603:10a6:102:404::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 02:54:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 02:54:44 +0000
Message-ID: <be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
Date: Mon, 23 Jun 2025 10:56:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA2PR04MB10214:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3f75ca-76e4-47bf-e957-08ddb2014eb5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0xiUGIvb2cwTEt2amp1U24zY0dMc3h6TlRWKzFTdTBWRFNiY285K1FNeHFE?=
 =?utf-8?B?emFHN0JBSFVWVlg5MUpaRk9MaHpnSk9xRHI3MFkweDdzZTRoUHJvUVVzbkVV?=
 =?utf-8?B?azhKWWdObmpRWkZCL01wZHFBOEFLYVdmMnMrL2s2UDUvSTFnWkRISmd1emtZ?=
 =?utf-8?B?SUNNZWhUR2FLN0xzUVZ1N2x1cWs3cjdJMVJoSTVEYituZWxJbkJibEQwWnR2?=
 =?utf-8?B?ZjUwZWxGcjM4ckprcWM5Zmkzak1TOVNQb1ZBTG1LOXN4dTVEdWx0NW9XdEVS?=
 =?utf-8?B?QjBLSmVkL2NWaWFxMTRvcHBhTjhTOGdZOEt4Zk1HUkg1MFg0aDNNbUZlY0Nv?=
 =?utf-8?B?cFhHUVk4elQzOGFFdmFIc3RJanhRSzNnemdXUFlncENld0Y4MEE4d2VKQWJu?=
 =?utf-8?B?dzgwRkNHbWFwSG1lMVpXVHBqNXdCaytBKzZBeGd0eFYyYzcyM3l4UktJSWRz?=
 =?utf-8?B?cng3N1dvbGRjSzRncy9EMnZmb1U4QXloYTF5K014eVRUd2NlK0hZM3Zkeks5?=
 =?utf-8?B?U2I3aFQ1K1AxaTZPYVdZQmF1bzBXcFV6K1BXVjBQd1FQaHMyZkFqYTJ6QlUz?=
 =?utf-8?B?a2NncEVldnF3cXZZdkluY1pGcFJMKzJBV3VoNzZnQ3Fud0h4QlVMbnk1ZXdB?=
 =?utf-8?B?OEt4WTZVQWVWaE5yWkNsWDM5WVJGS0pLSGxKb2RJSndMMnhjMk9CVG9nV2lM?=
 =?utf-8?B?L2V0bjZ1amdHcXZYcGRlc05PdllpM0ZGWkN6d285TnA2NTVlbzZlT0dGMERP?=
 =?utf-8?B?Z2dlNmdRYTBXbURKKzlQRGxQdW9ON2s0Y2VGbDk4VWZ0WGFRcFNrRms0dnIy?=
 =?utf-8?B?ejZNbERpUEVITDFtNHl1UmVVeUNqMHFwNHRUNHZWUzZ2QkZoMWZNeGNqeFk4?=
 =?utf-8?B?ZTV2WjFZL05qa29WQjUzeEZvOWxRVmZGdlo1NGtNb3NDbEJka3ZkYlVHM1RD?=
 =?utf-8?B?ZXdmWFlyZ1FnQkM3T0pGWXBvUWxMS2s4cjFubkhiRWc4aWk4SUVIL1d0cnpU?=
 =?utf-8?B?TFlXdmNiczlPUmp6WE1pRnZ1UHVrODg0cFhGZ3lWVXZCWThkVXVReVVxdmpR?=
 =?utf-8?B?OXRqbGZMK3VlUkpyc0crdm5SNmI1OHRacGFFNDVsdjFoUHVOZzdDbnZHNDMw?=
 =?utf-8?B?ek4ySFhyNlRRTUZCeGRRVzNGK0xuNGZQNDZnZlA5RFRRajA3OFllNU5GRHkr?=
 =?utf-8?B?ZEg2NWRoOTZFL1FTeDZaK2NlUVdyTmhncFhMcWxFekdCbHBIbW0rYTc2Q1JH?=
 =?utf-8?B?NXc4dStFT2tZTzRHUkhQWVVDeGxPNmRRS3g1dXBXMEJzTy93WC9UUkFLYnJT?=
 =?utf-8?B?MVV5aEFFUGdYdjh0M05vaW1rMVFubDdPVkV2SjR4V0JhSHRwRWpPdnNQMTlO?=
 =?utf-8?B?djdFU2hqdmlJb3FWeEZLRzlQYVl5ZUdqWFNWSVhtWGVVRm1TOGZhUzFBLyt5?=
 =?utf-8?B?WFNJb0pRZjNOVnVGMnhYTHh2b2djQXVJWlh2L1lLN052MjJUZzZXR1BMUWo2?=
 =?utf-8?B?TDNoYTBjSHZTNHNRcTJQUzhlMUNDcDdiUm1ydUNDbmx2a0JCTm90bFJKcE96?=
 =?utf-8?B?d3ZJa21NY0liR2hmL3dyMG9mK2FJYkUyWGlPU3pFMzlNVFRGbTV6QklQeHF6?=
 =?utf-8?B?amdIMmY1eTN5L3Z3MFZZeTFweUxTZmhKcmhnUXZOMncxL1VTc2dxL1B4d2Z1?=
 =?utf-8?B?ZHFHMGV4dStIUzVGbDk4cm5XYU9FL25tdHYyTitZc2xRWlA0bXg3U0R1R2tS?=
 =?utf-8?B?OUxLYVBReFduNGZjQWd2Tk8rYlFScFY5cFYvSjUvcy9FOFBzUU1LZGNsbCs1?=
 =?utf-8?B?aUhoM3lJeFNtcllvZEZ6dVRST0ZpRHV6STNrRHNtV2hJTTF5SUE3b1dXTS9k?=
 =?utf-8?B?d0UyYjZxUGxvbS9tSzZsNnRTYTltQnRCTHF6WGZzenJEenBVdmt5NnR1a2d0?=
 =?utf-8?B?RWRCZHg5T242aTA4aWQvb0pXbGZSb0w4UDFndE11YjBvc3NYcWdRa0pFSDkv?=
 =?utf-8?B?R2N5eGcxK2JRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVFOWZhVE53a04yM0xSK1NMYmtpbE9kRG95cVZDR0s2dnBUNkZLdVBJYVNE?=
 =?utf-8?B?UFVHdEMrZ0FYb1RMakRyOTk3RjNNYlpjWExrWnJnV3dWWm9OTWRxb25FM2Vz?=
 =?utf-8?B?Y3oya2tqc3lYZ0E5WExueFdGNVdLZmpKQnVkaWVpb3hnWDg0cThCL2dOZG04?=
 =?utf-8?B?OFdRUlBONkV4dWp2Y1NlZW9YMkQ0MWRZQ1BHVndIRk9uUXk2Smx4L2FuMUM0?=
 =?utf-8?B?UmtHRWJZb0VVWEl5V1hSYzc5MVREc1VXWkFRTFBPOHk5NCtsVnF4cVlOMHFz?=
 =?utf-8?B?ckVhYU5CTXVQd2hWcEpwdERqL3QvSGl2YjJBSTJ4SXNOdXNrM21ZaHI4V1NI?=
 =?utf-8?B?MjdDa0FpcVJXcXIyYks0UGYxN3RmY3RzdHkyakZnRk5keHN6S2FPUlhuMnpy?=
 =?utf-8?B?SGsxZm9GeDVvVjBhb0p4MlR6TjJNeVVidUpzRmRsVzBpTi9uSTdTaHd5T3Jk?=
 =?utf-8?B?b3gzdjZRUXJNcE1ONEcxbmVNaW04bWFoak1mVVV4MUxTbER5UjBkeFc3VUpv?=
 =?utf-8?B?TTE3K1BqVnVBamdXTFA1T3pucHdRUnZwYW1TMWh0dVRDTGJrdXgvMk1QTHhm?=
 =?utf-8?B?TWlVL3VUY1dpVksxaERsNXlIN2NCcTZZR1oxWUcyTkhiaHJwamJpQkxwT0tT?=
 =?utf-8?B?Y01WVjk1ZmdPb2dNNkUyd05FdmxXSXhNS2ZmSWpISWUxdDJXVkFXZVVPdmww?=
 =?utf-8?B?SGphTnBhM1NnOG1xTitzazN3RkpVcVRic0tpNHhpSG9na2M4RGkrSFFqWTdG?=
 =?utf-8?B?ODNGRk9yOVh2S2pERFFuTlpLTWJENDVZVWh3OStlb0Z1c3pmenZHQWVBbVRt?=
 =?utf-8?B?MkpqN2dDUlBPWTBCVElncWZ3STJxZUt5TEtGelZPN2JCUUh2bytMZTQ4S3U1?=
 =?utf-8?B?Nzhvc1RhYnR6VndSbWVRT1E3cWJ3ODhjRk9tZ3VFaERicW9ReFJINElnazlD?=
 =?utf-8?B?S1JuekxJNEJyZUJ3c1JYdEhEY1ByMWxrYnlWK1AwcHc0N0Nad1BrZ0JYcGJw?=
 =?utf-8?B?U0dvQ25obDNjWkp3V3FVM1JzRGZqQ0t4MnhPMEdBM2FWQnhkUUZ0R1hVQmRh?=
 =?utf-8?B?YS9tSVZvQWRwY3MwdnFYODVWZkl3dmdNUDNzTlhmK1BRTWEyQUV2M1hvTDlF?=
 =?utf-8?B?eDF5N0FRM0JrTnk4c3YvOUNLRzFJSXhZYTJCZGpONHhzSUVCRDJtM1dKNTZh?=
 =?utf-8?B?V2tQZFBBOWYzVWdRTHZyc3hnRDF4U0lENkpqdGhDVGpLd3l0TW5NL2FJb3kz?=
 =?utf-8?B?bmQrMWNkZ2pDelI2bHBYMndPbzVUZXMzQW5teGE3V2VCSFh0T1N2RUh2aGFn?=
 =?utf-8?B?T3dpc1lSZ25tVFlIbDd5bkJ6Sm5yejYzdktWMnpLMnRUSzhQK2hQUm5IRDVY?=
 =?utf-8?B?NDN5NEpRbGpmVWpnZ0RzWXlISExXQ2hoWk16aGdXMkVuZ3lwRmtpdllmMjZv?=
 =?utf-8?B?Q2ZzVmcraEVlcDZKZUpqM2dXR3dVb2kyNlFkaHByMXJ3WFJneVVUaXo1Rkc4?=
 =?utf-8?B?RkVGLytQT0xZSTJHTDl5dkliSU1seFlFRUViNDZOQTBOSjNTRVoxL1BuUmRT?=
 =?utf-8?B?K0tSSDdFOE9NKzJ5bHVwQUJsOGtPOGR2dWd0NVFxeXhtMVhBRVVnYjl6TG9Q?=
 =?utf-8?B?eUtSSlJ4NWZibnE2RmFZUmxXME5BMU10aG5GYmpibTBxU243elJOcXBETVRx?=
 =?utf-8?B?cUJvQjkvR0lNKzRuTDZraWZxLzlyRlFkV2tPMkEzL3pqOHV3NmtRakd0UU9k?=
 =?utf-8?B?Rmh4ZXRKTE0vNTNRTGdGWlJKTTZTbHRmTUdWamhhSGZ1MENSdDhlWmFSNzFW?=
 =?utf-8?B?L0NUY3hqM2I4aW9neDFRYlVPSUY3L0RpSEJndzhTU1pJWVJxOGgyZ3lvdHBN?=
 =?utf-8?B?SytvNXdwWkxZOFJrL2tPUXFWdVVXb3NjK2lvL2NnRDRYdjFheWxmc1MzS0po?=
 =?utf-8?B?WDFhS2xha0wzRjlROFNpd085SDdKdkJRT1VLY1BUUUgzc1dnQnMxOXlZZnBV?=
 =?utf-8?B?WkhPRVNKdVRuaVgwRktHRERMWFYvSGJ6UjBnSkNPYXJ3NjVzd2xsaC90Rkg3?=
 =?utf-8?B?V3ZEYjFWbCtnOTRqMDdlL1VPTm04eU8wVTRqZVJVWFJCMVBzaFB5RnVLMnVy?=
 =?utf-8?Q?VCNw6wn/m5g34OGMoAD+JVFcE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3f75ca-76e4-47bf-e957-08ddb2014eb5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 02:54:44.5167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6mdU1vYwG6N6GiTQb0HC2ls/4OrB266OLwq+Nd893TPhH3JfGv5h+OGuewv7L9gzyL+kpc3v4JxFh+kvK9sLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10214
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

On 06/21/2025, Luca Ceresoli wrote:
> drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
> caller could hold for a long time. Increment the refcount of the returned
> bridge and document it must be put by the caller.

To make sure the incremented refcount is decremented once this patch is
applied, does it make sense to squash patch 3, 4 and 5 into this one?

> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> 
> This patch was added in v7.
> ---
>  include/drm/drm_bridge.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index b110c5bba8c0612a71f749ad51345e7a8ccdc910..f98044581d67c380c3bc3a1943bd6ab09b764ec3 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1336,6 +1336,9 @@ drm_bridge_get_prev_bridge(struct drm_bridge *bridge)
>   * drm_bridge_chain_get_first_bridge() - Get the first bridge in the chain
>   * @encoder: encoder object
>   *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
>   * RETURNS:
>   * the first bridge in the chain, or NULL if @encoder has no bridge attached
>   * to it.
> @@ -1343,8 +1346,8 @@ drm_bridge_get_prev_bridge(struct drm_bridge *bridge)
>  static inline struct drm_bridge *
>  drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
>  {
> -	return list_first_entry_or_null(&encoder->bridge_chain,
> -					struct drm_bridge, chain_node);
> +	return drm_bridge_get(list_first_entry_or_null(&encoder->bridge_chain,
> +						       struct drm_bridge, chain_node));
>  }
>  
>  /**
> 

-- 
Regards,
Liu Ying
