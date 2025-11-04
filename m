Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BDEC2F885
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 07:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249210E539;
	Tue,  4 Nov 2025 06:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nrKcMDzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013041.outbound.protection.outlook.com
 [52.101.83.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E43110E528
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 06:59:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPiKNQ2cjGtCEeJRAxYa900o8mZTeNufgymf+yPCZ6CtDFf2TyQhUYGjPIEepOWfg6C3aHxQCl+3Tbxb7jgmzzImZMY9TxcBySE+S3xWePn94cGPxdTDVXwEfWaqrpPoNUy5YaOXPz9MD8JK1LgFJTcrQvMD1KEs7PM6Uns8B52shGMGaz4WA/6xawg93sRCI/F/xeUmzxAcMfqoLINk+H63UH0IxwZu8Vxag9uhO7ky42bOCFvc6kRmTI75xKtUXrM6ouB3cKyj0C9LqZlCn3iXXyJyiS89QXhWucHPXNvTnb4moeOAegG4UNHtRRAsZoMWEQxSJCypOyUM54rk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvDmqrx0n0T68fhN/GktJWGCFwTPwUq/bZqvOIxWGxc=;
 b=fecuweEkpiqn9pPCgA74RIOX77Ys9iliTdP75rOiExcmxeGn2yO/HbzSLusvRJfq+9nb0hF7kUNn8F35hx+U5fnLjFLrZ+DtO7LIMlYLeZb9X+1j0gwlME10UWd0wqSZhQJbdLsoGYsrLAk3iLCWcHgXjpl3hD3gxfiZITFuIxtzQn2yOQOmRMWUJ/ZNlH4Vch9P4ohqK/sDwqRCwrdF8Vwp2eQVcUdWmLpocdKfe0scepJfrIB9G+IuhOXb4T6mEBJiEfSmmnbCTZmBo4S8Pq+if/M+4IzmLkUq9FQ0kQHIM2ogjFa2RPMskTR8uQQ74K+x3m70av0d4Dre2tWI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvDmqrx0n0T68fhN/GktJWGCFwTPwUq/bZqvOIxWGxc=;
 b=nrKcMDzpnpoBbikcF7gIxg+DARyA/vrQNnDBsuL5WcvehjAoXrmP36Gl1cxu2xb3E623dlGn9GJu/fI4FO8fE2BNX/C+xJWsVq3vPFyb87xmuLC8XgVbgsl8XroA86qPP8ACzcqcLZbQxaEc7IPRnNw7qIFY5Hrg8bNofajZj70V5mmjxnMKCQdxI5cbcY2RA1OPIpj+2RJ7OvYh0bR01sBLflgZgcokyVS8RkTCTVkR9LxMNztk1UFMjmI28OrlRmFrwh5kcQIbEpSr+r8PawD0VKYzthPgpkYjwPZHVznnyscvkSkwAqAj2gz1kdAecEdlds9u3+VxyUi5xFICHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 4 Nov
 2025 06:59:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 06:59:48 +0000
Message-ID: <7e67c129-bf1f-4a4c-9aaf-a260d5481926@nxp.com>
Date: Tue, 4 Nov 2025 15:00:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Marek Vasut <marek.vasut@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
 <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
 <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
 <e0507800-7e86-4fbb-95cb-e64d8cca1e49@mailbox.org>
 <AM7PR04MB70466BF64A1CD8EB01D2DD9C98F5A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <ad7c080f-38e3-4579-8cd8-148df7769826@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <ad7c080f-38e3-4579-8cd8-148df7769826@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 10964880-919a-4f43-895c-08de1b6fbe69
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTJxV0ZCRDNVU3IrS05nM0IyUHNzTVJCUGh6RHFuTmpkTXYyTHZXYm04aXQ3?=
 =?utf-8?B?aUM4dVJYc0Z4ekdQek9OclVvNGlNMnRpMTYwZ3YxT2F1NmNnMEtTZmVIa1c2?=
 =?utf-8?B?NHI1NEVSVU5XcjBYR01URHRCeWhlNVBuUWo5UHBzTmp3T1V6SEE4RmJuSTFF?=
 =?utf-8?B?alpJYjBWMm9JWEw5WXFsRGNyS0VsdHlrRGZ1NzhoMUNBZnBpeEg4NlNpdms0?=
 =?utf-8?B?Z21NK0dMYmNOMnlBZ2NpaVlvOW52SWJiaVdibTVLaXZ6M1pKRG5vSTBrS2x5?=
 =?utf-8?B?MkxMa0ZIN1NDMmpTZk5WOHhzMzY0bGdDY1g0QzIybmpWUjQycTgxMHJSYURn?=
 =?utf-8?B?MGlZU3BRRzZyNElKSk52RkY1RmNsNHdvU2FRK1lJOVRRM0lIWU5UNXZNb241?=
 =?utf-8?B?dTk1NmNGeVAvekNxZnlCR1VmVklLUW84WUdPeWVZYTFpSll1VmlESFZUOEQx?=
 =?utf-8?B?TUR3U3FCOHhZZkpDRGNBUVp1YjV0MzgvLzNTZllxNGt5SmxQakx0UkhxRUVi?=
 =?utf-8?B?a2JYaHgyOEVuaEdQUFhBSVYzU1kwUlNFdzFWcU1kNmNnYUxxaGJEMGV4SCto?=
 =?utf-8?B?aHNkUmliL0RFcHk3N1A3YmY4NjVwNGNQK2FuQnFkbWQ3NkRicStyOVcwNmxx?=
 =?utf-8?B?QWFDLzZrR0xNZTlwdEpxcXEzVG11MGZ4N1d0eUFsNllBNkIwY1RsRTFQemZZ?=
 =?utf-8?B?VDBjc3Vmcnl1Ky9VMkVFUXBOaGN4Y1dUbDFmU0xwamczM1lubkJlWkxUemNa?=
 =?utf-8?B?M0EyU2tqN0dsTnRCcWVxY2tLYUR6OTBlaW41NFVmUjRBYVF2S1RzczF0MW0v?=
 =?utf-8?B?WWxhMkVQb25wUTIwUEFWUCsrdGZZN0E2cDRTQkhoalM1SDBiNUsveXNqQ3c3?=
 =?utf-8?B?NjZmY3gxakR1Ky85dDhST25KNkphRUJUeDlDQnlBRjlNbWtaQTRNUS9tOS9q?=
 =?utf-8?B?R1VDU2ZkRkxBVDAvRnQzSERmSzRGdjdoUk5wWnpWdDVFaUV0UVplKzM2OGk4?=
 =?utf-8?B?NENMeVNxYkRUZlZXajJaRlY0UFF3WmtKaEx2N2t6WGNkRXZIcTVTZ2pYRy9F?=
 =?utf-8?B?QU1aS2dYeXBiV24vUndmOFk1R2E5ZGUzS1BrL0xPbXNBdkV2Nmw1MVF5bWVL?=
 =?utf-8?B?TVo2MkNrZ2UwQi9wTDNTWFo1TmRjZXNwOG1pZ2dRa1RaVzhRRFJzMklDcHN0?=
 =?utf-8?B?dGdYb2pWSk1QVk4raDNRT0diUUVsN045bTVHVVdTV0pxSDQ2Y0ZORFppNGFN?=
 =?utf-8?B?b3RZSVdQMU9pa2FNMVphNWZvblpEVnQ0cFBxOFlzSmZCTGZaMFB1NTFrNTE1?=
 =?utf-8?B?MllTdVA1cG4rU3ZCdVR4Z2VHV2U1VDg3RCtxMm12eFNCR3k5TEs1UkR5T0Jt?=
 =?utf-8?B?bWkxcGhmRmpwM2FqQ1hjcWZZcXk0T2gzYklqcGhkM2RwVjdsMlBBdGptcmxU?=
 =?utf-8?B?SmlFNmZjdTZTVXhwZmtlRkVnMkFuWWh5MStaSzBkaWZOUy9rOS9laDZvcHEx?=
 =?utf-8?B?K3JKV0tYL3hkQUx3U2VMUDkwTGw2NC83SVdCV3VnWUJZZXNlQlZSajRPMS80?=
 =?utf-8?B?Z2FRa2xVdFZuTmJHNHRpYkF1TVk0c3NlWmJTNjlFTGJDbUlyNFBrYnFaR0ZJ?=
 =?utf-8?B?ZWN5SzBPVklhaERwQ2drRk1QeXBGai9hK0R5ckFRV0d0RWdaVWtMRXZSQmZv?=
 =?utf-8?B?eCs3QndSaE1HME5ZalVVdHRjZjZtQTdQemgwVEtSQmFtZ1lqdGE2U3RPeEsr?=
 =?utf-8?B?NmlURmFIYXQ0OUE2ME1xR3MrMWlNdDZ4enNpQ2N4VHVMVzJsSWY1d0dEYkQ1?=
 =?utf-8?B?SmRZUm5MSEs0VWhLNStGbjZZclUyNmNwbDB2NEhBUUVzVVVldnQremNQdGxJ?=
 =?utf-8?B?SDR0TW5VZHZraGtFeFhac3Y0NGg2VHlGUlFIYkNUanMvTHFNOE5PR1VYZ3hK?=
 =?utf-8?Q?a13DEpXgbBjtjWMSPtOFqrx6rwY4benn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjQrcG1pRG03bmJSVWdKRC9qUlNnSnd1T3J0S0p3RkRkWDdOak5DRFl0ZVV3?=
 =?utf-8?B?bjd4TllrUERlbUlKUUVhWlFSTHgzc0EvMGh3SHlNQ09CdVo0MlU4T1Y4d2ZT?=
 =?utf-8?B?WDNwMGZuUldOZnFRa3FxZWR0SkU3bkVJWDlZbWUrcVkrZnlhWEdzV0xyOGNs?=
 =?utf-8?B?RUZPTE9PbkR5VzRXU2svbEdXdkx1VUJYVWZGS1dnMUZQWWlDVVE2b1dLbndL?=
 =?utf-8?B?ZEUxNi9HdkJqazhqcDhlZnhEclh3Y1FoK0NacnRydE9vQnlHK1BTTTBOUDk4?=
 =?utf-8?B?L1BwaVFKenM1VUMrQlVJaUplZEdGaVNiSm5CNk9ER2VEeTloU3Y1cjh5MUh6?=
 =?utf-8?B?TjlCb2hGaC96WlVtRzZsbmRLQUczQkdSS0szS3JldXkvSnlER0dydkJNb1Zy?=
 =?utf-8?B?Q3pRbXJMZ00wRlJLSGtNbE1wdmdZUW5kQThaWUI2UUJnUjBQRjY3QkRyMjRS?=
 =?utf-8?B?SnYxcWRRNE50QlRkNG16T0ZVUXgxN25JbVpkTHVmMmREbHM4TlppaXQ1QTdw?=
 =?utf-8?B?ZFpRelRTQ0ZTdHluSlc3Mi9XMXA1WmlXM2JhckhCQVRTZHVYTFVESmtmcXQ1?=
 =?utf-8?B?VktraFhmNFpqSFNpNVNMM2xSbWZCdGRkaTZISXEvdUE3UmsvNWM1aUxaMTd2?=
 =?utf-8?B?aUZYdG1MRkJITzB3MUZIRTRVTDZ0amNnMGxSNXk5dkhQWW4rVmhpencyRS83?=
 =?utf-8?B?R3JwUU1FaEtQYndpdkU0ZWNIL0lyQzhUc2NkSDc5MXFtRVpZdWdpU1owY2tH?=
 =?utf-8?B?ckxQc3NWWVp0RUNWWnkwM2Vzd3ZFMzlyK01CTHAvOTVHQXNuczZpQUlmeDFv?=
 =?utf-8?B?eXVETENVNGdGZmRVREFud2RiWENGdjVqeUM5ZTBteW4wRkRScGJwcWtSMy9I?=
 =?utf-8?B?c3dOVVFkbVVGdENRUWgrV3lkOVYwL1RjTUtVVXVZcTZCOWlaOXdEckl0NHJn?=
 =?utf-8?B?bkljZHVyUTB0Rkg0QmtxZUFJQnV2cWVFWUM3SWlSUXdpN1BFSndWckNjem5Y?=
 =?utf-8?B?RTFmODhuUU50Z0hFVEtjQVgwbDI3NXErdnpMQTMrZG1taytsTGd4L3pGMENF?=
 =?utf-8?B?YVlyQmt5WmhZRFB2aWg0bWphMHc4bHNpVkY2bkw3OFUxZ1ZRcHhtcDFWZTcz?=
 =?utf-8?B?VEw3eTNNMlJLOWRrYlYwOVAvTU5IcWNFZGJoekRvU25XTWRWUVl4NWVpZGdX?=
 =?utf-8?B?dHlTaFJXeTYyQmtYSzloY09UUjhSWGY3UWttOWFaOSt3UFZycW1RTVUrK2h5?=
 =?utf-8?B?VlR2RVRhWTZoYlBtaGpURnNNL2U1SzVDRmlJZDd3bStkRzkwT09NcmwzWllX?=
 =?utf-8?B?dHpIMVpDbVNiMnJTdVl0T3ZQSER1SnY0MTJseHJRU1RGRTk0ZFhwa3lHaE00?=
 =?utf-8?B?Q3lUODZHRCtpU1Z6SzBiVjNMVU5xUGFMMHdlcTZzSlNPWmpHTWVEcUtzdFpQ?=
 =?utf-8?B?bGc2OFNCZCtpRFdZeGlKRG9QUm5qd3RKQnpMMGJ2K21JZnV3bENScDgzYXgw?=
 =?utf-8?B?RnhTNUIraUVlM1c3djRhWlJJNE1BUlhPTFIxNlNjcDRQUzRjeFNXa1J6K2J1?=
 =?utf-8?B?bW52NmJRWVFrVXFZUlZ6WVZGTUpPVy9NTjBCTGJ4ZGhCeCtEbUJydXVLaUZJ?=
 =?utf-8?B?dGN3T1JQSzE3ODBNcmY4SzJ5WmtXM3dyV3RJSDZ1OTJDZlR3WTBpUHhDTUl4?=
 =?utf-8?B?bStMVUh4Qkk2OFBBTi9qSlZxK3l6TnR0aW1NZEw0QmtZaFA0SHJFWFQzeElq?=
 =?utf-8?B?NE9QanJIU0ZnUXZnbHhBbk5OUDQ5V0haT2hOdGZLdFJmc0pJbkhLbjRpK1kr?=
 =?utf-8?B?b1NvSWxPTndiazRoMHhDNlNBUUxNUWIraXVVektaQjY2cmxLeGV3ZEFDb05Q?=
 =?utf-8?B?NjR2OVV2RXNqQmJ2aE45Zk9TR09IUFFaaWtYMExTemR2V2d6QkJNcWpvY3lh?=
 =?utf-8?B?M3ZiMXZrelEwMXA3L0JIWkRnc3YzMDRwZVdKL3hWdnJ4YlFndUJ5bElQQk1H?=
 =?utf-8?B?RS92MUpEUzBXamxFKzM3QjdnZElaeGJ2Wm9yQ1d2NEZzeFpxUk8xbDZ0VDN4?=
 =?utf-8?B?QnpRK1krckd0bllKbjRSSldtaXdQSjJ1ZEVIaXZhdWhFNDJlcmx6TFBkeWs0?=
 =?utf-8?Q?mghh05AEK2fLz1nFjlVMxyAkJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10964880-919a-4f43-895c-08de1b6fbe69
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 06:59:48.4813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olZ7NiGYEqrZ4y4m+iBQfQRpZeKTApQiNVrMDJQF6IHxnRjjSVX42oYSTygveuDchVCcU5HqNbcqY/fPyMr5LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880
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
> On 10/20/25 4:15 AM, Ying Liu wrote:
> 
> Hello Liu,

Hello Marek,

> 
>>>>> I wanted to put this whole thing on the list first, before I start splitting it
>>> up.
>>>>>
>>>>> For starters, I think I can send these separately:
>>>>
>>>> Before discussing how to split, a bigger question is that is it fine to
>>>> support both i.MX8qxp DC and i.MX95 DC in the same imx8_dc_drm
>>> module?
>>>> Separate modules look more reasonable to me, considering the fact that
>>>> there are quite a lot difference between the two DCs.
>>>
>>> (maybe I do not quite understand your suggestion with "separate module",
>>> I assume this means entirely duplicate driver, is that correct? I
>>> operate with that assumption in the text below.)
>>
>> I'd expect separate modules: the existing imx8_dc_drm(which can be
>> modprobe'd) and something like imx95_dc_drm.  I wouldn't call them
>> *entirely* duplicated drivers since I mentioned common part of the DCs
>> could be wrapped as helpers in an additional module(something like
>> imx_dc_drm_common).
> 
> How would this look if everything is built into the kernel ?

Something like imx8qm_ldb, imx8qxp_ldb and imx_ldb_helper modules -
DRM_IMX8QM_LDB and DRM_IMX8QXP_LDB select DRM_IMX_LDB_HELPER.

Note you may make CONFIG_DRM_IMX8QM_LDB=y and CONFIG_DRM_IMX8QXP_LDB=m with
CONFIG_DRM_IMX_LDB_HELPER=y.

> 
>>> This series indicates that the functional units in the DC are basically
>>> identical, with the majority of changes being register base addresses of
>>> the whole DC and an odd bit or register offset here and there. Most of
>>> the code can be reused, as can be seen in the first half of the series.
>>
>> The major differences between the i.MX95 and i.MX8qxp DCs are
>> different components in Display Engines(especially the additional
>> Domain Blend Unit in i.MX95 DC)
> 
> This seems to be one component in the whole pipeline,

Yes, DB is i.MX95 DC component, but not in i.MX8qxp DC.

> with links going into it. Those links are already in place.

DB's inputs are not configurable.  They are ED0/1/4/5, going into DB0/1's
primary and secondary inputs.   So, DB is nothing to do with LINK_ID_xxx.

> Maybe I am not seeing the specialty of this particular DB component ?

I commented on patch 1 earlier:
-8<-
Add more description about the unit according to i.MX95 DC IP spec:
The unit operates in four modes:
- Primary mode: The primary input is used for output.
- Secondary mode: The secondary input is used for output.
- Blend mode: Primary and secondary inputs are blended, according to the
              programmed blending functions.
- SidebySide mode: Primary and secondary streams are projected side by side,
                   i.e., primary video on the left side and secondary on the
		   right.
-8<-

The four modes make DB really special.

> 
>> plus i.MX8qxp DC's capability
>> to connect with the prefetch engines(DPRC & PRG).
> 
> Isn't the prefetch engine only a bit of register configuration,

Yes, but maybe more - See my prefetch engine patches, there are quite a few
logics implemented(especailly in CRTC driver) to make sure proper sequence
to enable or disable prefetch engine.

> that can be abstracted out ?

How to abstract that out?

> 
>> Both would
>> have significant impact on how we implement the drivers.  We'll
>> certainly end up having different implementations for callbacks to
>> enable/disable CRTCs or update/disable planes.
> 
> It doesn't seem they have to be entirely different so far, do they ?

Well, if you add really limited features, say just primary planes
without prefetch engine support, then I'd say they are not entirely
different.  But if you consider to add prefetch engine, overlay planes
and those HW differences(especially DB), they are.

> 
>> The sort of minor difference is in Pixel Engine(including Blit Engine)
>> where FethUnit types and numbers are different plus different numbers
>> of Scaler Engine.  I'd expect logics to allocate FetchUnits for planes can be
>> implemented in the imx_dc_drm_common module
> 
> This part is fine, but ultimately, it would have to be possible to build
> both the MX8Q and MX95 drivers into the kernel too. And then there would
> have to be some logic to deal with that, likely based on driver data, as
> it is done here.
> 
>>> The addition of iMX95 into the iMX8QXP DC also does not seem to be
>>> making the driver in any way more complicated.
>>
>> Disagree. The addition would introduce quite a few i.MX95 or i.MX8qxp
>> DC specific code branches due to the differences mentioned above.
> 
> This does not need to be the case, see the first half of this series ?

The first half kind of handles difference for some shared i.MX95 & i.MX8QXP
DC components.  I'd expect the common part can be put into imx_dc_drm_common
module.   The CRTC and plane drivers in the second half would really be
quite different.

> 
>> I'd say i.MX95 DC support could be in drivers/gpu/drm/imx/dc, but it
>> needs to be in a separate module like again imx95_dc_drm.
>>
>> This makes feel that the debate here becomes kind of similar to what
>> we did for single mxsfb module vs  mxsfb + imx_lcdif separate modules...
> 
> The mxsfb (the old iMX23 LCDIF) and lcdifv3 (the new iMX8MP/iMXRT LCDIF)
> are entirely different hardware IPs, the former is from SigmaTel , the
> later is from somewhere else, right ?

Well, I'd say they shared some HW IP logics.  I bet quite a few registers
are shared.  After all, you the one who tried to support both i.MX23 LCDIF
and i.MX8MP LCDIFv3 in one single mxsfb module in the first place :-P
But now it ends up with mxsfb + imx_lcdif separate modules.

> 
>>> What would be the benefit of having duplicate driver for IP that is
>>> basically identical, for i.MX95 ?
>>
>> Cleaner driver implementation and easier to maintain.  I don’t want
>> to test both i.MX95 and i.MX8qxp platforms when only either
>> i.MX95 DC specific or i.MX8qxp DC specific code is changed.
>>
>> But again, they won't be entirely duplicated drivers.  Common
>> part could be shared between the drivers with software techniques,
>> like the imx_dc_drm_common module mentioned above.
> Please have a look at the first part of this patchset, there do not
> seem to be that many new or complex branches.

Like I said above, I'd expect the common part of the first halp can be
put into imx_dc_drm_common module.

-- 
Regards,
Liu Ying
