Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BCA58CF9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C2910E3A7;
	Mon, 10 Mar 2025 07:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eD0ZGJ7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB69D10E064
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvGix7+XklfPO7PiBBoHWYt9t/Nh67Kk3cjbJr8Tki4UcyyAh7SRyY6mke0K4ddDDLTewNxP31JJBkzbOvJqGyqk3Mf1Kbyfg4droPiY5u+ot9lWuseIf84KUkQGP/Fh2pGtHFziNhGaDMrgioePLiOs0shgk275Pz8KnaGj8aIbLWRZnRJSFKmFnZ3uu/YDar8RYJTRAq6YOoeAvumJ+5HvTv0pmrouzsvGfd0tneJVrvs+hVJv/RoRLnDeyZ0FFOeVf0RM9jX9MOTxEe1JyV05MAGxFmN0EATc0ZbEs2N/i/AJ4VkWOqlQdroFrbrjDHAS0LdbLhdWWb2UwL66zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM9Q8ZZoWZ0O/KuC3oUb3vzIcNRJ9mrqzgj3GB8Xc08=;
 b=tt6CNkzMDxfIFtd138OAYTNjBj+PU9U+VZAxyI+PA5zQ6MqIAVhXrVYStUB9FdmwLPNR1G7xy180lYL9TsRlNZp4KHmPZnArhcyAMVTlNPa8RxURHynEqYzqbhCrhCEMwSpZjeMhRwY6vOCnzODFZJRLf6CMYngVDGhEFhOjiptFygmPOT5QG3Y+D0+gZURyU6AEgICTvZ8easwCtRYh5PLDH60z1TG4fM5frxPhWWiHBIe3i65IuKsWdhNQwOZtjAeRV6ousu7TsOBCSmSx7Rdkqj18B+vKfC9BDljDLndMBXbPD5hXocRB7bEYzB+uM/np9FU4N8wgbkN186ngCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM9Q8ZZoWZ0O/KuC3oUb3vzIcNRJ9mrqzgj3GB8Xc08=;
 b=eD0ZGJ7keuLfxiZuG3oZ6h11njBtEgMjf47nY8FVmwjOMqLKewdRVouYQHFW6tfYAe0X1DytesixRQ4NFZ8qmop9szWQbm5NkKlWAYF7sk43Mmd1hwz7cUbWcenYb6xuuLd0h58WJlNPFA0E8jQAvkQblKAQ8i39vCKWuojZIr3s+sP44iC5yIMdWeVIOCyPzUAZocJ7qIIWfU86H2jJDlmj1gqn8lZv85jIp7zzLawmAb10+xx6y2RozOXFRnTidr4OsK5deq0q4OKaNghjTjqciZe9MmIUiBS4cAb5PckGcqq8WkcmrXtvW6F/NRzzrS3KYMHhXntqP7C7nYUAKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7847.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:33:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:33:34 +0000
Message-ID: <b9e44f72-7407-4194-8054-91b7ed87d79b@nxp.com>
Date: Mon, 10 Mar 2025 15:34:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/bridge: imx8qxp-ldb: cleanup return value
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
 <71c44221-b18b-4928-8faf-00893ec4a109@nxp.com>
 <20250307122217.158b24d6@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250307122217.158b24d6@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 8925b487-823c-4eb5-ad14-08dd5fa5dd40
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTRhT0dBYjljbW81alJ2TDFiOC9rdjVtVEhDN2MvOXhDTElIeFY5cmhPeFNB?=
 =?utf-8?B?YTBaakJKUU9ET29ocjlvTFZYNlBrTGs2ay9QeWNOYmxYYlJlMG9kNDdBdG1N?=
 =?utf-8?B?M0ZkZk5PMGlPZVJhYVlZV1VEa2pveGpMamhCaXM3cG1vSW1FOUVnVWNqcHlV?=
 =?utf-8?B?TzJxUWhmbnV2UDB1VWRSc1J0Q05xd2c1WUdZa08yTWJYWXlTRmdqV0ZOMFkv?=
 =?utf-8?B?bldCL1JJUXR2cDBvY0oxK0x3V0xMeERodnZ0RklLWU1SWno5NTFCZklaYUxu?=
 =?utf-8?B?SWwrQTZGdWNpeSt0TEJTak5sc3RENFhza3hRQ1c0Tm9hTzREVDZFeXFnUkJY?=
 =?utf-8?B?KzBZczJkZzdLanNBd1R3TWJRN0ZRc0R0YnpjSGVNSERDZnNTM2EyeHQ1a01S?=
 =?utf-8?B?TUo3eUYwdlNhTjZqR0dBVDh6VDZOaFplU1g3NTM4NUhTK1A3U0tXL1FndjVh?=
 =?utf-8?B?LzZ4aGFaazdHVVpTQURpc0g3ZWZSYWlrZDQzcFNxbWZJdGo5YjVkN1krSXRz?=
 =?utf-8?B?bFQyNEFUM2hiRnRCclhPQmprVzVDNDI4cllpSGZDYW9YVWxLSUxOQ3BRQjVZ?=
 =?utf-8?B?M0FKZWZ0ZG1xS1MvQjRORWlOa0tZK2ZQT21zYkx6K3dxdXZ4VVF1Y2NiMEpO?=
 =?utf-8?B?cFo1VnpkMHdxTm92Ujdrb1dTaEF0a2tFbVlWWHI1eWVCNG4wOHM1TW83Zkli?=
 =?utf-8?B?MGl0MlZKZDlxYTZ5eWkwUFhldjh5R202L1pUV2F4S1drekRTbmVvVXdvby9n?=
 =?utf-8?B?K1RqZUFpb2VTSW93VVJJV0lkU0VDRGh6SXoyRURzcTZvVlpJQVJJR01kakJO?=
 =?utf-8?B?U0pwdTFlazhQRTJJVnlUcmNWdHg3NXVZSE9VbGF1ZzJsUmxWQXgwRDQ4Qmh3?=
 =?utf-8?B?MTJYSVByc3N3NWpaaUw5dG5OeXJkWUVjcHFHZ3dFL3d0eTNOd3V1dTRjdUdZ?=
 =?utf-8?B?VG1CbHFnRG44dEEzZzlFd0F5WTVZUnIycVRTK04ybVE2UDlhdVNrb3lHbk1Q?=
 =?utf-8?B?bEJvTUlYRjhiSDl0TllWa09UTDVQbFJ0aS96SHBMRzBXQm1rSm5KMy9TSUNm?=
 =?utf-8?B?UkhEd1VLT1R3U3ZyVUwwajhSYlRCSEc1SUE2ZlJOYTNENmkrRE52bEk3YlNa?=
 =?utf-8?B?SStsMExubk9PczJwdUVELzB6dTR4aGRvTVc0OWRZeWNCMTRUZ3Y2OS9qNzVx?=
 =?utf-8?B?V0dIRFVmR0tCRndFR1c3R3Fmd2RxckZTTjFFWTJiSHM1VkE0a1BWeW1mdlZz?=
 =?utf-8?B?UjFjMUtBd0M2K05pTjIxRXpwRTFqKytlVkhvNUJMTnlxeGswRzM3REJPWVUw?=
 =?utf-8?B?blp0N2dETWJoM3JBOVJWN1FJWXRrdmV4c0EzcldxSVpGTlk0Qno4ZE1RNzJP?=
 =?utf-8?B?bG1ZSTBNdC8zWlBxWlM0UTNRallNSGdVOXZMVHM3ZnZVSVJKVm0rblhQUnJ1?=
 =?utf-8?B?Q2s4ODhIZ1Y0d1Z5VStlQ2FvYjI4QTgwOFJ3YUhCMzhza2RkNVUzMktjKzVa?=
 =?utf-8?B?bjNPd25IeTlvdW93VXJKZmFtR29yTlNyV2pRVU1HTEY3aVlGWXdvU2VUQ0pF?=
 =?utf-8?B?N095c1lBT3JzbGtnL3pCZUZ3RnR5WU9LU1BlQU5Wc1Y4KzZzU1FiTlU1Q0s0?=
 =?utf-8?B?TGpwK2NOcHAyb3hOMEhZZlFVUU9zbGorSG9LWlg1M3p3ajlHVUZCY2JrY3F1?=
 =?utf-8?B?T3ZVdEJMSjdncjJNWGFRUVZ6MGtCaXdSeEMvNEJ6U0UvUTA5ekt1WnIzeXBR?=
 =?utf-8?B?ZkMzOUhCNzdraEl5alQzQ3g5anlxVUFKczRPaUYzM1NtTXR2bnNscElWckpE?=
 =?utf-8?B?Qm9CZzNicnVwL0FLUENCZ2ZFWTNVQlRuM01TV0xzRVM2ZEM2VWY5Q3BEeTlk?=
 =?utf-8?Q?ZGOfU9JAp4AAx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlN4UlVEbFp1Q2dFaWE2TzJtMFIvNmxCT2dkTExmR2NPV0kwK3c4eEdqUUNM?=
 =?utf-8?B?eEh5UVZDNVBVV0FJRXI5cXhvUng5RnBtOGJ5NUswdUs5ODZBUFFmd1dZRUNZ?=
 =?utf-8?B?T29udmU1bHhOSkw3SUoyMVVQczVJY2o2SnlCMWp2WFNCei9BWWo0SVE1MFBZ?=
 =?utf-8?B?SlFiOWVpekw0NFBHWjRSTnZRemNsNmFMWVBPYmNYZ1d3NHV6aHNsYTZ3cldh?=
 =?utf-8?B?Z2FIeW53WkxQbmRiaEg4bStaLzgzU0xYbDJSb2FIQUNtcU11UGsySG5FSFJy?=
 =?utf-8?B?WHlKWXdJUlY5NkR2bnBabStZU2YzYUdpQVZ0MUZ4eEd5MHM4cW1qNm9lMkx0?=
 =?utf-8?B?dlNydHd3Mm5MTTlUWWN5N01tcVZrTlVjZG5oQ0ViaWlHSVJURjJseXhVeERv?=
 =?utf-8?B?a3ZXL1BzU0J0TkJRSkRGQ0ZJOVNHZE55ODU1SndoeGd6cE9QZFlIUmt4NkF1?=
 =?utf-8?B?ai9LenhMNk1NcW0vYU9nbWZlQkZ6TzE0WXdWYXJIejQvZyt5Y3hreWI1cWx5?=
 =?utf-8?B?L1RWaENKdFA4cUR3U3NnUWhteWtLMk1YaWFFcmJRTSt0L3g3cEkwU0pQR1ZS?=
 =?utf-8?B?UC9acTNoVXdDbWpsN0Z1OVdvYTAzV3U0MDhidkFLQVQxSmtyNjM3V1NUMExp?=
 =?utf-8?B?enFlWFZtOXNKM3hMbXg2YTFUTWhISFdQK3J3Y016WVZBYnczN3RuMjBtV0JX?=
 =?utf-8?B?d0xqVHk1WE5TM0IxVkxONkVPWkJxanBsM0JoYUdxM3c2Q3VmRCtMdldab1ZD?=
 =?utf-8?B?VHlZSkxCYzhGc3g0Skt0aXZIZmg1OUQvN1R6UkpnRUpFUXJOVFpwa0pLcHhS?=
 =?utf-8?B?VEVub1BFb0RVT1c2b2VYelIwZzRRTjRDQXdHZTZKaGtXYytnbkxFL1ppRCs2?=
 =?utf-8?B?TnZXM2Y5OFFGTlBJWE5YbGFmU3loOWJqNVljRmpTMnJ5c01CZUVqcTNWZG9R?=
 =?utf-8?B?cWltcVpPM1R5OG96T2d0c1dBZ0FHZ1VCRnpYeS9kSTcxQVZJSTZTdEFPamkw?=
 =?utf-8?B?UTRETnA2Y0N4WGh0RTFyRkFXSFN3L0RuUHpkRkNvMUxYNzJxY3ZBM2RsYWdi?=
 =?utf-8?B?TVhYZGpBbGVZMlgzU3AvSWs0dERscW9uR2l0N094Qk5jOG91a0pla1BjRy9l?=
 =?utf-8?B?bGpJeFQ2SGZPYVdmUDAyTHJxUEZvaklHTytqdWsrOGJHZEFvQndyellEbmpN?=
 =?utf-8?B?NitFV1ExQmVsVHhiRWJSNmd3WXBEOGQ4UStMUmpVY2F1eXZUV1RVMUFlQ0VL?=
 =?utf-8?B?MmRLbk5uYllyNi93MUdKcWhKc2tMUHVZVS9mS3lPS1hkNUt2ZmJYYy9ybVFo?=
 =?utf-8?B?dFZLMW9ZSmRGMFNsb3F1T3FpeUplcnl1cHMwaXBjNFNWamJHY1JzYTlMMUN6?=
 =?utf-8?B?OFNGL01UY2krbW9TTjhTZzgxZnBhK1gxUG1GT0tSRFZCQmE5V1VSeDVvMmRw?=
 =?utf-8?B?VTNYd0ZTYzlhc1VzUWVyQ1o5MVY4bTN2dnoybjFCN1h4anBuNVVFREZZbTFQ?=
 =?utf-8?B?b3M2djA3a3UwOVNzbk9LOXpzMU5wMUkrVXphdGk4UVRZU29zWk5aQ0FpNWFy?=
 =?utf-8?B?UXdmUFNNTlBiTTZsSU82NWowL3VRNmoyK3Jrbll6SXBoWFBITnc3N1ZMSnNC?=
 =?utf-8?B?SEJUZFh2V3RIcGdCWnVCZ2F0MnhUN000ZEpuSTk4R1ZucjdhaU53NDdWbzB3?=
 =?utf-8?B?RFpWUjNhVUExV3BNM3loWFBNOGtVMmxsQjdsVk9VZlVrTXJtOStPSlZNNWtn?=
 =?utf-8?B?c1lhQ1BpWnU0a1d1aHozRGFVenY0ZEVKSDl1Y0ZFQmZ0SHYxczdyanozU29P?=
 =?utf-8?B?M2h2V3RnVHZvMUhVcXhpV2drM3N0TFV3WmpONDVYbmMyNjdRcmJMMjBsZzFR?=
 =?utf-8?B?K2JlUEFkYzQ2SDBWK0x2RWsvdjZzOW1NTHJjaXdwenprQmcwQVU1ZWdQMmtu?=
 =?utf-8?B?U29PNFJNQWdIb0R6ZEsrMnBJYjZmNVVhcjFLOXZWa2F1dEpvTXJZR00zcldQ?=
 =?utf-8?B?R0RkV1AvdzZhaXJoRmN3VzhzUGMraHdSV2xQbkoreHZua3NXQ1F3SnRRbkhv?=
 =?utf-8?B?L0U2Z003UlVGaEluZlR0Mnpma0NuaG9ISzJ4TDZidTRDKzRXaWMxYlJMQ3RP?=
 =?utf-8?Q?OInbkA3E1gHbQEZvSYAfg8HYi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8925b487-823c-4eb5-ad14-08dd5fa5dd40
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:33:34.4315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EhdOkOw70F0lwjla6i3P/J76oyid+770z736cN7EyEExjKHLZkvcK2x/noee995QCugxZlp7NKrCw61WevNbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7847
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

On 03/07/2025, Luca Ceresoli wrote:
> Hello Liu,
> 
> On Fri, 7 Mar 2025 14:42:12 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> On 03/07/2025, Luca Ceresoli wrote:
>>> 'ret' can only be 0 at this point, being preceded by a 'if (ret) return
>>> ret;'. So return 0 for clarity.
>>>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> ---
>>>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>>> index 7bce2305d676714cdec7ce085cb53b25ce42f8e7..bee1c6002d5f84dc33b6d5dc123726703baa427e 100644
>>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>>> @@ -665,7 +665,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
>>>  
>>>  	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
>>>  
>>> -	return ret;
>>> +	return 0;  
>>
>> I guess this is not the only place across the kernel tree where this cleanup
>> could be done.  So, maybe use some tools to cleanup them all?
> 
> I had stumbled upon this as I was doing some changes to this function,
> and needed to understand the code flow. Definitely 'ret 0' would have
> made it  immediately clear that all the code between the last 'if (ret)
> return ret;' and the final 'return ret' is not allowed to fail.
> 
> I think this change would (slightly, but still) improve future readers'
> life.

Reviewed-by: Liu Ying <victor.liu@nxp.com>

> 
> Luca
>
