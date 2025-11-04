Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D84C2EF65
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 03:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3735E10E122;
	Tue,  4 Nov 2025 02:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TRQeVesB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013053.outbound.protection.outlook.com
 [52.101.83.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008F010E122
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 02:26:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypUvXxSm+ujsGALPcRDXdmM/hKVBrOBxVBob+a4I1lhXJzLM+qphvNRPCF5zsBoEvotYfGF9MxaaMmXl3FFBO774nZSn4DFGEJsWquAcVngqXRrXB4wAaY2C9ACPpI6vDAzEZiycnJdSFOH9Nu4k9AmZ98CFsyqZIYNdFNKxMqcyVKfbVrBSARiOZR6p5KEaYi2+XzHE3EHOWCScz/bZPWkYZ5BBHPOtACS4lsS5zw27Q/+cvIM5IE004gHrNU3ALDsJYFPb8gQ1AX2w5Q0Mdecq+qDB7SDeCSufy2uMdGBfRGpWLkGkxvPV1E4a/LoHnxsZR/KdjWcSq3oZAecy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vC0h4JnCfT/BdBqI3sBn0Eh0FDKHpY7Hd+ZiDbJzq8=;
 b=TW2g6ShSVWDFqB9jTEE7J2xNyYr2EZMWGPqecQZHXZ/gh4PGYw5ArCjiHucmvLwSAI6A8xa5CkpY1KrK5tbKL7DK3R2g4m0uRyWmK5KpQZsiMzJ+zUZZ6tktDm9UqB6wAqwxGv8bV3RmIxUZIf/JB3JLegcSNMEmp72h53IJiOgxLtn51PRu5UAm9KUtq7DSZvz1GJjlrznBwh6hFR4TmfEFwEiwHd49FBeEZJ6PIFukuuJnSD/sf2NG53eKTAi7quyFf/noTDcKy44rTKgCIN4jcLejEq5Tjs2LwGs7y/G8Ln1TfUXQMohdZdq9rzOJqdvMU/SbwXIu899FO4pcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vC0h4JnCfT/BdBqI3sBn0Eh0FDKHpY7Hd+ZiDbJzq8=;
 b=TRQeVesBaQSm3DYet2pS/hV5jm+7DE1EY1A6gL4Qw4E/uJOCgAn75P8MllkNYcvON9kmNTvg9hCI6hlQtsHsxHEJh9t8s50COezkNKDh/iRMxcSyGhw2TXshqIc3l+zlA4ZbQJoZDoRwL6ZlGWK5wNHQj2syXIu3kN6BkhhUp5LoBMopkIpvRvuHSS0a//YWWGs5s/pSh+GrYLj7kORf4EtaIH2lGRwKNtLKzutjU/KU+JLabLp3CdqISqDtjquZ1TDdvRuzPwSPp3teAvoSbCdi4wzh79htre1On1C/nNNAG6vhXihXQwaOlyMrhbhcT+m+TFfkxiuH9duETsfN3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10355.eurprd04.prod.outlook.com (2603:10a6:150:1db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 02:26:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 02:26:10 +0000
Message-ID: <b65d9221-bdb3-4e69-beed-6b7646c5d5eb@nxp.com>
Date: Tue, 4 Nov 2025 10:26:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
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
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
 <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
 <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10355:EE_
X-MS-Office365-Filtering-Correlation-Id: 853b5f21-6543-49a1-32bf-08de1b4984a3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDVqZW1pZks1S3M3MUhHWnVGR1JqREJqbDMyQVdjeEZDdDZ2TzN4QVNJeGt6?=
 =?utf-8?B?ekttMy9hSmF6SFN5TlFsY21BM0xmaWlTUFNwV1ZRcTBrZDFTWld2ZlhQZmVV?=
 =?utf-8?B?cFFvTWFDNCt6QzJHMzhCTkUwU3FEcHIwY1dMTjBwT2haU3p5Y1BwcitLaUlQ?=
 =?utf-8?B?UmZPV2FFNjR1WThoeUlXUkZBcjRiZ2U4biswVytQSUs2UHAwWFpMYlNSTkRT?=
 =?utf-8?B?T0pDV1kvbnpDcmI0VTdvUjRnU3ZxaGNadjNDN0FWT0JMeDRkNkVLRWJ2SWtk?=
 =?utf-8?B?bGVCUHBsWUJseWE4TWF5TFdySWpTOURmZHBjQ01pSzJIMVA4U2g2aG4yRDJG?=
 =?utf-8?B?all3eklwYlNNZHdZaTNPUmNVK3RjcVVRWWZMeGVEUitnQjNsY1FkSzJnZUZM?=
 =?utf-8?B?VlA5SmkxMmw1OTQyWHMzN3N0UnNjVHpMaUpjWHVTWGloOENCcmZLVitwd1Rk?=
 =?utf-8?B?MUI0UGdPWEliNUErMFc1RkhIdVErL05lSHBod3FhSmVqU0FBYzBjdFVvWWtk?=
 =?utf-8?B?dGJMQXM5cVFWcjQ2ZFNTR3p6dzIwNlkzVlljSk8xeUxzNnNEMHFES0FwcUg5?=
 =?utf-8?B?TG9CTGszMzducm03L1JBKzh4OEJVSmtuUFJOS0tQc0p1RUNmejBFc3ZpM2tp?=
 =?utf-8?B?YzBaMUVzSjJLV0xHVkNtMTZ1K3M3emlTY0l1VHljOTR2bnFwU3M5SFdjOFVs?=
 =?utf-8?B?OUtCOURFWUhhQ3p0UGozMStPUXlhTTU0UUdnc0x4M0hPZlZGZnBiYXd2RWFl?=
 =?utf-8?B?Q3cvV25PTVhSaXNQWUJZWnQ5Mmd0WHVCOFo5Q1FLaGlxSVZYQnRibzcvVUJF?=
 =?utf-8?B?OVplTllFQ3JJdFVMM3NTbDFyZHpoa3dIMmg4cWdKUHRKV3NGN3BQUE51dWlB?=
 =?utf-8?B?N3JBb2tsR0cvVkxsdkhnb2M2dEVjMVhCcVV6U3M1REF2d3hlYWlLaUVPVzI3?=
 =?utf-8?B?dEdyZUt3NTVHTEZmWSthWXdqNTQ2QTZnU1BrK0MvK04zUUVkeDlnSG5Sa3Mz?=
 =?utf-8?B?Wi96SGl5TXZxTWZrSUFZWnZ4YlN4bStNdVJ2K2k3N3ArSHRvdjljR25ZYWRo?=
 =?utf-8?B?SHphZVM4RmdrbTR6NmRCMGJ2OWtqOWsrQW8walZFYU1DSDF0YklLYUZWT2hD?=
 =?utf-8?B?MnlCUG1DK0MzclRuQlZRdnhFNDNtRzkvRGdSTFllbVA0cHJLNDh1T0hCSkY5?=
 =?utf-8?B?OUV4VU1BZnA1ZnRVamxqdGRpcmxZZ21IR2Y0VUpYdXhjamVQZ0JGM0FPUVF3?=
 =?utf-8?B?TjlHbzl0cDJDNzdkNk40MHlPd1VqejRFWUhyOC9xRmtTQTNHekVKcWZQQUE4?=
 =?utf-8?B?MlpZNGdENVVWUnNKeG9zb0lkWkE5cUxtVlhkby91TVpWVU1lSEkvdG8rY2Vx?=
 =?utf-8?B?QjZLbGNDUWpnMWlSRHNKOFpiZ3ZYQ3pEV3lreUVkcVhoTVJNQWEvSGhvUjVr?=
 =?utf-8?B?WTFVV2ZYWm8zWmR4K3h2N1JlUnhPd2kzZGJWSFNiUVdlSFZSMVJQVDYzbmFJ?=
 =?utf-8?B?QVN4MFp2OVFuSkVlTTFRSGJ2N2ZMTWhJTXRMUHViOVNhbGt0WDJIY3M5TG5n?=
 =?utf-8?B?eExpTmpTUVVqSDBSSVArY3ZrWEZGRXlsbjFXZWErY1N0R1pxWXpSZlhjbjNY?=
 =?utf-8?B?UjY0VUNoQlZreUFJL0E0MitHSkV5dDJZRFNQNnBiSjZrZHBlRnFvaGRVQWJj?=
 =?utf-8?B?ZGVSenhuQ0tIdUtyS0krMXdkU1lZU2JmNFE5WHk5TTF2R0RMQnlpVzVTYVBK?=
 =?utf-8?B?eGF5L0pReTI1SzlHRFhxc2I2Y3NGbkkvYUp6Mk13YzNocUNZSFFZU2lPOUNr?=
 =?utf-8?B?RFJvYkJ5b3hTeFczc1VjTFJKQVZFdjkvMCtUZGRGNTFrMFoxOS84a1hISVc4?=
 =?utf-8?B?UmpXSy9BcFFzTEhuVzg4cmxiU0FtWUhEM2hrRFZWL0thS3JjeFJMTi9Bbmtl?=
 =?utf-8?Q?s9MKCW74tbjYvBl2F0Yifh2FA2L5j9Wk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlpGa0UvdmhZMGsrdkZoK3ZPNkh6UEk3b29kYzR6SkovcEVoenNoR1o1SUNL?=
 =?utf-8?B?Tk9ZdHQ5SUFIUUQwbi8wWE9PN3phT1JyYWlyOXRoMlRpeWNEVUpQbVRsdGhm?=
 =?utf-8?B?cjluVVhmeUgrQkdRczJZenBBc295LzB0RWU5U05yd1RRdG0wcHI5SlMwd2Z2?=
 =?utf-8?B?cUgzVWNSUXRlN2NQZm1NWHpwN3JSdEhBeXlrSFRMNnh5dTRRN2M0OEhlT0hN?=
 =?utf-8?B?MnVIY21YS2wvODRUc2VMQjV4YXpRYm5DWXI1OEFCSFRKWjZOd0FVU0xQUkVX?=
 =?utf-8?B?SjZ0RUNWcnp2V0VGOUhvNU9yN0hENzJDTHdGM0FEYStvS0kwS3N4MFgvQmND?=
 =?utf-8?B?ekdqeHY2YWo0My83cmVETTJ5YWJOb1FhdEVzZU44MW53K2NyT1N0SmJabkJ2?=
 =?utf-8?B?aXU2WktGOFVCQXUzaDl0NktVTFZaMitJMHhIQXI3dHozTGVweDREaVJoTGJE?=
 =?utf-8?B?UjBpem12MENiSzVlVCtHeUJxN1pxb204TVB5OVFDSHlld2RzWjJxanZxcU9w?=
 =?utf-8?B?b2FrVll3bFJqelVGNit6VTRXUkNTOVg0RTdFWEQxYmtqSklhb2Y3elpvSVZs?=
 =?utf-8?B?YUF0ZVlrZ0E3cEVmY1gzU3crY1A3WDMzVVFVWHRSNm8rN1l1bmp6R3Q0NlN2?=
 =?utf-8?B?SkNObjF2UUh2aVBFRW4wbEFMY1ZXNmdVZ3hpZVhXTGZmZVNzT25UbFg1TG94?=
 =?utf-8?B?MWExVHdSVklQWjZ0VnNlRmdmc3JLQzh3V21qcDZkR2ozbU5tZ0J6QUhpa082?=
 =?utf-8?B?ZEJ6TjFqWHhFaTl5NkhaZ2VJbXlHQ0RIVFJHNnpzWVlVSEdpc1hlQk81cklS?=
 =?utf-8?B?WlFGRXZ6WmVjYmNUUURwK1Y5SE9MWUozYWU3ZDFhUm04V1FHbHhRQkxINzRk?=
 =?utf-8?B?bzEwclZGaE5IY2hUVlNMQ0FGMW5CTXA2dnk1TFNBT1V2a2xXbFk2U2tlOXZP?=
 =?utf-8?B?TEp3bjBHU2lEYnRacm5PaFFJTWwwWStaSUsweUVoLzhBZmRoczNaMzhVSmdv?=
 =?utf-8?B?eTAwQUlhd1o2RTNUTWplZndYSU82ZTIxSk4zeFdQblJTd25QT1R5Y21SRTFs?=
 =?utf-8?B?M0hlTFVyellMTjYzU1VWN0ZKb0ZsUnFDNU0rRWM0bEVKcVh4U2VodlZpTE5u?=
 =?utf-8?B?REhzTEE5eUxaM0MyTXR5cTliaVZJWHV0OXBOL21jeWtqU2RzQ2RIOFpsMDNi?=
 =?utf-8?B?cWttblBlRWpoOXlEMSt2eDlhRFQ2eU1yeFVCQlpLbmRxU3QrWjlhUnNOd1R2?=
 =?utf-8?B?TUkrQVBaTlBBdGJsSVBRaU92RHBpQ0tmTEZGZ2FDNmluM05SRXhKY0psSFlo?=
 =?utf-8?B?Y0tMUERIQ2FXUzR2Uy8vYTRKc1htSDhwbyt4ZFVGMVovV2ZCNi9PMWF6Rkx1?=
 =?utf-8?B?TjhIemRKL0Fzc2F5Ym41YTdWY2RQVVhzQzh0dHV3TkVRUEJlZXlGOUtGaWt2?=
 =?utf-8?B?YWRKUk05VTg3bE45VG40TGNhTXNEUm5QZmo0L1JydXVLendoY3MvUjRyZHow?=
 =?utf-8?B?ZkZ3eG5DNGxLbzRaSmRmUXV3TkM2YVl6YnZ0N2NNOElSTFcrM3ZGT202cGQx?=
 =?utf-8?B?OVIzSUdHNFV6TXd6SDBhOEdwUnJaSlhlZXNua2J2SHdmYXltcDkydHBpQWFY?=
 =?utf-8?B?aERwMEZ5MVhQSG9IUk5Ld1BTdloxeTZpdnJ6RFIxWVlDNEw1ZktvaElERzVy?=
 =?utf-8?B?U3VxcWJVaTFZbDkvZ2djQ1dHRTlxTFk1bHUycDdpZkRZZWtESStFdDFjUUVn?=
 =?utf-8?B?eldQNldyaWdNbXUyTlo2cDVGekdWR2FqcUpWRDdxUVk3ek5SVDhsTzlXekh5?=
 =?utf-8?B?MHpHNFBqemNTa0tzVGdlUkhtTHFGblZTZWlQNTkyczV5Q1FENmI0eTJ1SDB6?=
 =?utf-8?B?RUJSMUdNT2pWYzBzOFo5NUlhS0UyUWVOR2tLUVQwT0lVeWY3a0VBN0M3dCtR?=
 =?utf-8?B?dUVndVNtTU9IbTR0ckFZTENEbkNMZnlzTGZ2Tjg3aUgvS1VxV1lLOFNXYmQr?=
 =?utf-8?B?dG4zZlZkZzZrWlFXZzdDNUMzTCt2V0lHUEdhU2tqeFpqRGsvQjdFMWhMbGFX?=
 =?utf-8?B?cEhJSTJadVRpdzZza2NZbGczZTRuK2tZMlI0UzZVazdMRUo3RG8xQlk4UEk5?=
 =?utf-8?Q?0oYAy67OIJDlB2wPK1hTZxG7j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853b5f21-6543-49a1-32bf-08de1b4984a3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 02:26:10.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rnCoIP2VtwKMn7QRwmK28vKZh4k805lCBFB3k/UTL/VOznoZiIcmhLLHcSp+y7dusv4rtytRQiozniBCjqEEvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10355
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

On 11/02/2025, Marek Vasut wrote:
> On 10/20/25 8:21 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>>   };
>>>     struct fsl_ldb_devdata {
>>> -    u32 ldb_ctrl;
>>> -    u32 lvds_ctrl;
>>>       bool lvds_en_bit;
>>>       bool single_ctrl_reg;
>>
>> single_ctrl_reg can be dropped then, as it can be expressed by failing to
>> get the second register.
>>
>> Furthermore, with this done, lvds_en_bit is the only member left and hence
>> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
>> use a structure for device data with only a flag.
> I plan to add more bits into the driver match data when adding the MX95,
> so I would like to retain these instead of removing them and the adding
> them back.

i.MX95 LDB supports two LVDS channels.  Two DRM bridges are needed in single
or separate LDB mode, while one DRM bridge is needed in split LDB mode.
Also, each channel connects to a standalone LVDS PHY.  All these could make
it intrusive to support i.MX95 LDB in fsl-ldb.c.  Maybe, we could discuss
about this later, but IMO this patch should remove struct fsl_ldb_devdata.
It doesn't hurt if we really need to add it back.

> 
> The rest is fixed in V2, thanks !

-- 
Regards,
Liu Ying
