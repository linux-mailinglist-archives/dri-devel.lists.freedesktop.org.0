Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB58BDDEB9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF5310E76E;
	Wed, 15 Oct 2025 10:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NCAsV6co";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3958010E76E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzF9aDo/9kevHLSRyntDw20rqVV0Rf6LidLeBpenYqm4yh/wfzCELuxMuk82x1dU7L8GEG4drP+oQaEcjNKBi7DqLzqp3i3Tgsz7MLsuj2VdOn78t1wK0qzD3MmJ8nR/rKL+GA5CqG9LsM1HcjSBMXMBDjJ8lMaMyG3ZblaFc867QovSwblmXTiCEjpd2PCSvCo1ze6Ue27PIpEsaCxwcTW+VCCFBlUwUjeKuly4muVlKTIjlYXbXFopQDeJ51tIlbgDRVTgOy2CKSn4hC9ACrgQ81iv3fNuwCfZiYihpDFbrEP2UtEueAYfYKIx3jvasIGlGAjvnyLzTF1gDPcaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHKrmdfVMjq5oJLNteR+WtVT1upjcmeFSxBH/bqwJWM=;
 b=tuR2nn3XrgiCSsMguDeMMwAcSDf27JY9wMLqVQ19L+i0P0Ooyu7lRSGXD69deiWxA2BRSF8L8rDFVr4KaVA8DSGndH+ZyUcqvu1epZXoOQ8ev+ifVwaykXBmCBGWMAO0y4mVr/EhsAkazmpybxPVFf+ycynN5o2h6MDB2eek3CMOOmRRJ0KoFtGTSLaAkiRTq7DZj8hv6r9PWTVgm+Iy16RSePmdop57qFfxr2LkbOpQ1N8iOC2a3zSOwELpvQ79NZMv1Av/3caD+NWwFa8c0W0kldVYUkwK6QohiY7bXB7TvEDHSOhF+DA0z0hIv7AxsYWwbWMvMzFvK4bHuiz9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHKrmdfVMjq5oJLNteR+WtVT1upjcmeFSxBH/bqwJWM=;
 b=NCAsV6coPrxLvpWLgL38YV26RhAl1FLp9t8N7IeyuExr535amU5ycE/wHCsDHKZGUQHPsqTVCtVYnZj7Yd926klynCeThgJpsrpC6fNvNSNPV91CQ75yYhfuJM7KzF2aR5zLlGmrW+x9L02wzvm3nDoQVxqdCOuT0jFkdNyBSMQH39Ecpkstl6Pi4qfgySgmip5r2apV8rL7pHMvJDz9mOzO8ciU2loW+cr+KY4ZLPkWw32SuBGD8fhkLIEj6yJFm7g95A4VCMyiwIooj9ww3yTXQXpq/jffLywLPt27TyWkuwvJ7/BnjETROqqUhxEeSxyHkpo9CNAgRc79GLKX7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 10:09:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 10:09:16 +0000
Message-ID: <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
Date: Wed, 15 Oct 2025 18:09:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
 <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 741273ae-2c59-4fab-d581-08de0bd2e5b2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWsvd3BJYno5T2RwcnpHaWxqL1pwRmhocXFud212VWpjZEpVT3NyQ0N3dktw?=
 =?utf-8?B?TGR0KzdVU0dZYW9qV1pPOTh5aEVSMFF6ZERtc2tBUVI1SUgyYnV4ODViZWN6?=
 =?utf-8?B?eDZVZm9KdGVXZGgydElVdE9UcVIxcGNpc0tVVUZQb1VpQnJZWW8yc3g1cVNU?=
 =?utf-8?B?Sm8xemE1Z2U1dGJieGFwTzcyN0swcHRnUjFBU0duRXQwb0VEMTRwOU5XaVJV?=
 =?utf-8?B?dG9ORjl5Y1NGa3IxL1A3RVd5NTVoY0MzOUNtNjdFOFY4UkdseWhEK2VwVFAz?=
 =?utf-8?B?NGhsZE9QVEFCdHlCTXMyMGowOUZQMTc4TmZyOERlQ0NaWTlucWlFSWpsT25p?=
 =?utf-8?B?TWUwZzBycms5VE4vVGhHbldTM3YxalF0YjZKemJZQllYNWZJbE1ncU9QMUww?=
 =?utf-8?B?R2xPSEpyb0FieFFxMUpsTThuaDVOOHByR3VNTkZYQTFaQ0JVS0NRdnZBU2Zs?=
 =?utf-8?B?TkZpd2YyNHFxbEs1VVRnOVBtTEpwbGxPd3o5QUQ2eFZPUXFsRTBPSFlRUjE4?=
 =?utf-8?B?dll0WWdqR0ZqaWNEcER1UWo5MTlsMWtFa21jM1B5VUl6dC9XVDhIUWY3TTNo?=
 =?utf-8?B?UGwxblRpaW8zaUorZjErT2Fpc0pTVzYvdEpKWmkrMEJ4SWFiZUdkNW5vMW11?=
 =?utf-8?B?V0RhcVJ5MUY0L3ExK016T2tCcmJRcE1xbjk1d0Y2Mk9oUll1Q2dZeFhFNDlK?=
 =?utf-8?B?MEJWc1gxSTkwL3dGNEpyQVFWMFpyZmdXbmFDdEpUYU9zOTY3UjZCQzRiWFRX?=
 =?utf-8?B?cGxjVFphOC8rSTRCK2tSS1p5QTE5ZUZ2NkovUm80UjJxa0lmY0ZZN2xNVWNy?=
 =?utf-8?B?TVhjcU43YVV2SE1wMm1HdWs3K1FOKytHUHdXTlQ0clVkWGtkWDk0b09Gbmtu?=
 =?utf-8?B?N3RQZVZ4ZmM0Ukg2UWRpaEUybFN1VGhnSlJNVW9zSmdKOGNsbXdhNzBncW5I?=
 =?utf-8?B?bDZ3QnoyNlgvNkhRRUxvT1NwNFJjV0daVkhZL2w2ekFUTHZGZEROUnJlUnQr?=
 =?utf-8?B?RnpPR1lmQmNGY2p5ZVRnZXhwZkdnNU41VDNmaW9iN0llbnUzQWNqb2IxVWtx?=
 =?utf-8?B?YytsVmJWYzd1N2ZSelBFdGNicjk3TkRDWFpCVWdyN3AybjNmQlNDS05neCtT?=
 =?utf-8?B?N1owT080S3lrd0NLR1dhZmMwUUV6c3lNUWFCbFZJTFNuSjZQTk1TbDR2R1Fa?=
 =?utf-8?B?MGpRYjB6bUd6QmJ2WGU3QkNzV1pJcUtpVHZ1WFUybWszbDlTZ3Nqa1huNjNP?=
 =?utf-8?B?dU9yUWJJd0t3OUVyM09zazFIR3NocjlzeFpRQkxmYzBEK3BTTHhsRnVBeFUw?=
 =?utf-8?B?SmdsdFJhb3QxOFUxVWIvcnJIakVWRm9YY3JxUU5ZZHV6WGpHQ3RLZ09Zbmlx?=
 =?utf-8?B?a05BUDYyTjJtZ2pkSHM1RDV6ZG9nYkpEaDdsUDJlbzg2aXZKdXNLN3JKWUhK?=
 =?utf-8?B?VzhFQ3JreWQ0NnNaMzJhTXZHVVVHcnllYlAxVHhJMEdZTzhTL3orVU90TWVM?=
 =?utf-8?B?OGVWT1hUTjBWUUNISHlNc1VDWGZ0M3ZnUFBhOW8reGZvRTc4TFBPcmFjN1dI?=
 =?utf-8?B?RC9KSmhSMXFnLytJZEpXZEROOEtvR3RlS0tOMDl4TkZMdzBkMzVESDdZUytO?=
 =?utf-8?B?KzVYQnovWm1NQ0hqQlowZXpHZUFVWnh3ZGlEN3ZLSDBjbUZEeFlPSGJKRkt6?=
 =?utf-8?B?NExQWnZXVUpoTlplenFPa2tOS0U3SlpVWTEwbE9rY015NVJwK0FyOGpSUDQz?=
 =?utf-8?B?R0dYWDkzZkNyaERtbFFxbWFCYzNPOVRjRnkvTm9yYW5KM0VVa2dFZUdYWU1i?=
 =?utf-8?B?eGc3amdjSkZLa2p2QmNWREtPbW5Hc0ZIVVhyQWFpVzJDNkRQd2duK2xCRmFy?=
 =?utf-8?B?eXNhM21FYk5YWldRaE9YSXZnL1d5Q0ZzSmJObVp0Yk5mTlJVTDB5ZzRadG82?=
 =?utf-8?Q?J6PaU4zsvHQ7TW3dM01Ripwn9CfvS/mp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkc1M0szVElST0t4cGFaZDZOWUovTGYyR3Z2aXRSdUlUT0kwVXlybHlOb3ZY?=
 =?utf-8?B?WGl2NmZvZ29XbDJLSld6TWhHMjQ4VytYTkVBWk1uVmw3ZXRCWGEzRlNSalpR?=
 =?utf-8?B?Zm1aZmIwNEFmaUxUbmx1UXFocUhnT3NZSjUyZWplcStycExVdHFEZUVNNmpY?=
 =?utf-8?B?dXQweWVvdlZleTFxUnI4TmdIemM4Q25TbEFqRXFJRlhtZUlaTDhHVEk3SnAx?=
 =?utf-8?B?aEdhT3RHZUpwT3pxSjB0eTc0UTVSbGFGWGQ0ejdtSHJ1YlFLa0pzYnBmMzN3?=
 =?utf-8?B?VDJla2VPU0o4ckloQUFzRzBKa2RJQkVncGJMc2RKaXI0QVB3SDU0U2xFSDkx?=
 =?utf-8?B?UkdVN1lsbG9BcnJmMklYaUlzbGcyZEQrOVJCREErY3crdVNlcUQrYWdpMXhk?=
 =?utf-8?B?SDhhYXhXMEJUSytyVWFqbXh4TTJWOVVLY0hsTWo2ajFMRzFIOGtQZ09KT2ZX?=
 =?utf-8?B?a28vMEVZOGs3RURXNllZREpIUkl0Tm00OVdJUzRvYVJQYlJ6NDFXQUpzazR3?=
 =?utf-8?B?RU5RSzFlMGVmQ0xUWHJONjQxcTYvUk1hNkZMMTZwdllDcnZSeGZubTdqdjVr?=
 =?utf-8?B?N01tb1VOaklvd2ZiR09pMTgyQkVSYkh2ZHhtWE9UQU05Y25rSUEwQXRtdWNM?=
 =?utf-8?B?YVJsYzRJSFVjYmhBRjhqdlcxaWVpc1lvWnBuanZzVXB6cmV5VGI5TXp1M280?=
 =?utf-8?B?czByaUJJQ05VTUpPWVY3czBRdm5NK3ZsSzZBVG5ld24yZFFoTW82NmlZdGVB?=
 =?utf-8?B?OXNxTjlMeWRpQ3d1ZTA2Tll6UnNQdVAzOUlYT0txTjlkVmtNOW8wR0p2S0xh?=
 =?utf-8?B?US9ETkU4THRZWTFSTUdXa3h4bXVIYmRIc3U1dGlwckFJdkt1QVFaZ3dJU2Zu?=
 =?utf-8?B?aExvem0xQjVSeTlKdHlPaEFwM1JxWXhpU2FOaEozZzN4dXM4R0FZQXJ4eUdo?=
 =?utf-8?B?UndqVThRZGNIdnlrMUU0WWV2dU4wcHBETEhiL250MHpIT05ZbSthMXA2QkRu?=
 =?utf-8?B?a1B5SW1DQ0NMZkl1dUFYeEEweVBURnB6Y1NWQXRkZGx0ZjVYK3EyS00wWDgr?=
 =?utf-8?B?cHBZVEVXQVQ5eUlEaXNUcmFhUGQvQ05uaXpFdUV2MEdVOVhURmJWeXN1QWMw?=
 =?utf-8?B?T2l2K0FXNExjTEZsNllscVl1MWp0ZU5jbWp4TEFORWVWdkI3TDZXQW5WRjRL?=
 =?utf-8?B?OVVvWDQ0cFQ1aVRjZmpHdnVnREFRRDN5dGRaczNFSjVIL3dBdFpGYWFWbHBU?=
 =?utf-8?B?eDBBZG9qRG5NdVc5UlF1bzJnVlJmWnVnUENPblFKc2ErTDFWV05IbGU1cXdw?=
 =?utf-8?B?VHEvZWF6UjlpMG5TV2NrZHN2T1pSd2lZUWR1alV3c0xiUXpQR2pRdmpMTktB?=
 =?utf-8?B?RzNmdzl4ZmY5ZVVRc0FCSytWS2hjdE1jdXlvbXVKaHUxYVRTKzNZNmhjNGd1?=
 =?utf-8?B?TVUraEZURERSdDdtd0FiZkxEMFM2eXhmbFFZNGppOXg2VDhwOXFYczI3UnZv?=
 =?utf-8?B?V2tEdFZBaGFyeEZJbHQzT0d0M2ZreGdLR0haVEIvSkpaKzc4RGphUUdja1RF?=
 =?utf-8?B?UmZSRXRjcUhoZWZmeExHLzhqRG8vb3h2RTQ3d2FKbnhxdUJtNmZoL1duNUoy?=
 =?utf-8?B?ZXlER3UyaytoNHdVYjI2a083dlpNcW9TdjQ4UGQ4a2cya1F2VHptaGtJUDNE?=
 =?utf-8?B?QURWMjNMTFR3VERKMnVURjEzZmVaQlV0NXlIeEltRFcvTElQTG1Mbm5pUFRU?=
 =?utf-8?B?MkdWS3BhcGhQd3Y4T2Y3SS9LdVNzbmN4eE1pMFBOV0VlKy9wTmJpUkZNaE5m?=
 =?utf-8?B?NG9Kb3Nia1dBa1BxT01GR0sxUDVjaHpDeTFPeENoK0xXRU1ZbS85VkN0V0Yy?=
 =?utf-8?B?N3RzRnVsUGdqNU1oU01JdEJzU0ZEVkE1UWxqYW85bkpQOEJBd2ErVGJFUmlT?=
 =?utf-8?B?WE1idTFlazIvdXpzQnFjaW5vdjBOdjJUMDhGV2ttbjd5b1JER0ErT0J4R3Rj?=
 =?utf-8?B?VTJBNzNnUzZ4NDR1eFFGa2RETVVkMFF2eTJKSElON0FHaUFBZHNBbERHRmRo?=
 =?utf-8?B?ZTVPRmlWTWFYdFVSZHdDbGxOS2lNb3ZPM2dDbE10R2hWTkNkZEd5cHR4WjIw?=
 =?utf-8?Q?0tTJoG9hI8/tisB9ulPgSSW5b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741273ae-2c59-4fab-d581-08de0bd2e5b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 10:09:16.0264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oULF5RGu0lwvtq8qFybKUym9KdctiadwWxRcIgNXfrJcizlFHi2OgyLK5cCu0/9T66k6xsDE03ZQctYJXnb74w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809
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

On 10/15/2025, Marek Vasut wrote:
> On 10/14/25 11:13 AM, Liu Ying wrote:
>> On 10/11/2025, Marek Vasut wrote:
>>> DPU is added into DC driver
>>
>> This has conflicts with my in-flight patch series for adding i.MX8QXP DC
>> prefetch engine support(though i.MX95 SoC doesn't embed any display controller
>> prefetch engine).  You probably want to take a look at it, just a heads up.
>>
>> https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/
> 
> Thank you for sharing that.
> 
> Would it make sense to send 4 and 5 separately , so the fixes can land faster?

Maybe not, since there is no user(DT node is not enabled) so far.
But I'd like to have more review/ack for that patch series(it's kind of
hard to get sufficient review...).

> 
> Also, could you please try and avoid the SCU dependency on patch 7 ,
> and more in that direction , can the PRG be made a bit more optional, so the

Don't think there is any way to address them.

> iMX95 can still be supported by the DC driver ?

SCU dependency and PRG(even more other reasons) make me opt to separate
modules for i.MX95/8qxp DCs.

-- 
Regards,
Liu Ying
