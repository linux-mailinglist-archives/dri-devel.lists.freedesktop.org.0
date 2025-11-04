Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A3C2F139
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 04:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAECB10E22B;
	Tue,  4 Nov 2025 03:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cS/TLAbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB22510E22B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 03:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jW24xjfHn+4+BthtnNHCNsZUpaPQHJMjQBTEFHZm9Sx8Anzy6viXYXgoxA+cFaDLO5t67pSi8RVQDmXK3dt4Ggkqa2zX5anttEUMP7ODvUYhCQZ+KyiGGYcrNiUxDfbXd+KDOA6EFj6dQcs9lEohdKivZ/dJo00fINVKlGpWR/HWOjmzzx5gRCqpOSeHgh37IGdzlabriqxAeMNTUZCzNrJbJdUK0QnxoDqDnZcobvNTmMkMrKMBI2diAeonEqP40THdDt+mkFhnWfXRH5VpvLqrqSA/iJskxnISV33kXVsjK9SKha5a1eyi9/a0gRC4iODvOeeLExR0C441D8GFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4cvXBcIS7dUHX8JKHOsfsnAr8qRZvG/okWhClBz2KY=;
 b=K7z0rdBF2NFO+VDYIU0Eej6C7l27bN8FrEi4eZ6TObbAtV0AOU8Mhgsgadwnp0XaJ4tedTd8PZAMfM5GGxqIelHHQfVLNmCEAovTIVqFSOhOv1UvOr8qEzGRnSqXV+WtaObDIyWvhGEsk3tCzJ48FyyZqKnz+e6dvtgQgMMSTd6EDmobudBTNUVsTBs6J8is8guYmGF1fA/lzzKiunxUTcXt00x2BbzlKFYogo0eJ+XRpiVSamUqBBGFzdgDGCT8ymL1UOili4bD1ZJB6OdPV8YeOKdbwme+qwEpN0YcMh1+NAWE8zBdfdsnW/YrvdstjKlB0r5pLdCfbmJj7MzAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4cvXBcIS7dUHX8JKHOsfsnAr8qRZvG/okWhClBz2KY=;
 b=cS/TLAbK5QjDqwvYfplH44cv+oxHSpqqQxcjxoMr0xWvZhPX1Q1+8cHeV2aw43l2QdlAlQ7m9wk1icAypsnvMhMJ1IPeVXn3h9/Hzw36cNzR7U9M2+goUZqwT/O2tHRC8fKfXj1UwfDpVh3O1lc8xPNqgkOZB1p8ioKlyAdQu4QQ/bCLIAnZVCp0WIeF02RYHBfOJwrjI5f9X0fqKVpdotLPEsAiBQqYG3deCN0z9bBEZxJ36q44/RxWo5veK/wYPPwuaVCIreWNnx5EI60CmWGXc88Im4+cPrpljoxyjvBQ3obxMLkApSquKs0BHSgq+rJ9EPouBvAxpm+9HmOupQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9954.eurprd04.prod.outlook.com (2603:10a6:800:1d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:08:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.017; Tue, 4 Nov 2025
 03:08:59 +0000
Message-ID: <9f77105f-4754-4a39-848d-c1f92e4f47d9@nxp.com>
Date: Tue, 4 Nov 2025 11:09:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/imx: dc-plane: Add more RGB swizzling options
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
References: <20251102162359.49263-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251102162359.49263-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: 3837d1f9-5441-44ca-0089-08de1b4f7fef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEpHVXBxQkF3YlJnMkZMRGY1MnoxVkxKZVhQMkVGUHpySGFiK01tSEhKbGow?=
 =?utf-8?B?U29OV2MrZGFscVA5T0EwVjdpcENSV0tlSzVOaEoydXRzKzBFT25vUkt3OWJk?=
 =?utf-8?B?bmlMVS8vUVRMZXBjRlhzZnYzaXhYbGlKUmsxK1RkRE9Kc2tqZGI5WjNFZVdv?=
 =?utf-8?B?ZTdWaUVoYUtGSmcwdXVHUTBLVzJoTUd6RUdEY1VhQTlxdWV6YU13a1hyUjFT?=
 =?utf-8?B?N2hEZVZ6WWU4dUtYdUUzTExyN1lEUWp6UUZ1eEYwRWZadUxmL2NlTHUyQzBO?=
 =?utf-8?B?WklJNEgvWVlvcjhPbWVLSEZCcThQMVYxY3B2bVUycTJmK2ZLZ2NOUlVkbG9Z?=
 =?utf-8?B?dVhzL1M0TzlGYk5uSHFESVFUbUpmRjNXejUxTjl3T0ZWMUFGUEVjaGp3ajl2?=
 =?utf-8?B?dnFyeHVVVHd0NloxTmpQMkJzQUJVbld2S296VkVxY1JjKzllZlFKalRSZmNT?=
 =?utf-8?B?dEhFc1EzQzBrdXplTXFpeVFGSzl5V2FqVmRDWHBwVXVRaElIa2lTdWlSb29J?=
 =?utf-8?B?SlVNRHI1LzR1L0xMMFRPWHJKVFN4allGMTFpT2xveHNGZkFKYk5HcTh5WlJv?=
 =?utf-8?B?cXJCaFQ1QzNCdmNTRE82My9sQ2RBNGJNYnVIT3F0N1kxczA5NGZNYmpJTStm?=
 =?utf-8?B?bEV0Vkc0cE9LclFEL2xGUCtSeitxaDYxb25YTko4SlBPbks1emdKNEJDR0h0?=
 =?utf-8?B?K2pnSW1VcmFHdytJOGliQjZPL2dvZEhaSkF0dWR6dmdseDdqYnVjVkNXYzVZ?=
 =?utf-8?B?SGEzTEg5UG5LRGNJOWJtSDhZQnk3K3dFYXl0Q3BDM3RuaDhZZGkwRm90RVJ2?=
 =?utf-8?B?U2lIZE1uS254K25WYTlTNFZkS1ZDMVY0aGFBYzRwdjh2TGliNjFYeEFJMFZB?=
 =?utf-8?B?OGlrcDdzbHdCbjhqSmRxKzhlYWJDYWdhMzBFTUZ3U1NCeVAxVzVNQThjZXd4?=
 =?utf-8?B?QUNPN2FFSy9LMUdzcGN6TkRpUVRGSUNrSnQ2SlBVS2ZwdWlLVU9DaGdLZ1Zi?=
 =?utf-8?B?WGgrcEIyQkV4S1VwL2ljQjFHZlAxNi9OOE41aHB5a1h5WU1HUUpUS0ZRNFNK?=
 =?utf-8?B?RjR2V3g0QTlCeU9UU01zdnJUQitDSWtLYWVCWW0rdUdZNndYYzlXV0RNRys2?=
 =?utf-8?B?ZmFHV0Jjd2RsYXMwOWxySW1jLzZYelFtVnc2aU5IWXlDdFJJL0RTanBremxY?=
 =?utf-8?B?SjMrTUNVTnlOTmM0RWdXMTdpcWJ3VTQzYVVqUTFXaEZKUkdzanFoQ3gxZG02?=
 =?utf-8?B?SkpyVmNtU2RwWTBwcVRMUzNUVUovRmZ5K3JVUEVBc05sRitJeG9oVWxsb0kv?=
 =?utf-8?B?MEtvRHorKzZqZGd1Ymw3djFZZTdPNEhlRGdZUm0zTWhDN0Rra2pqbFFNcmZZ?=
 =?utf-8?B?ajk2RTNhcGU4bnFKY1IzNllvdkc5djFveTZ4RTVrTUxOUFJOV01kUkpmQ1Fs?=
 =?utf-8?B?L2JTd2NZMmNzenJKcCsxK1owdGtrMlRUMHFiNU9FSGcyY1p6d1V3Z0o5L2JL?=
 =?utf-8?B?dHdraElYKzN0ZkRDUEg0bWZjRFhiSENRN3VvWEhDcDhkTUVNcWduTmhHUHoy?=
 =?utf-8?B?ak5uS3NKMm96dHpqNUFpZS9HUkNMZlpxTnhyQnpMSmtlNVRiOUREYlB3NXY4?=
 =?utf-8?B?Z3JLcFdpNWMwL3ZOcVIwQUszQS9oRUNTL0tmdWhPaXNJeHppbmhRTkNIbHVQ?=
 =?utf-8?B?M3BKL0pvbit4SHBmb3o3R29aN2hMRnRxM2hNZzQ0RE9mN3lCR3JpMGtvem1i?=
 =?utf-8?B?SGJpRnNZVUt0UVZ6Tmp2RUVNZUgrWkZVY2dtT2lvLzd4NW5tSUVMc2QrTFVW?=
 =?utf-8?B?WHZ6dkRWU0J2ZEZpOVRGV1FSSExUL2p6cVBvNHhlUzI0dDZIWkR3TWZldUhL?=
 =?utf-8?B?RVJqZStuUTlFSTJIMWk3SFhCV0d0MnJvem9EOWYvV0k0SVRVSktrLzdwZDI3?=
 =?utf-8?Q?fCZhxAsL1fHq+R8teIyrwsIB8o7cElMT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YngxNlR4dVhoTTBhTVdkRmJrOG1ISWovM2g4OG5xcGlyWFRBRlpGSU5weTNB?=
 =?utf-8?B?aml6WjJacTVvczZkWWxoNkM2aXhHbDVvK0ZTQVphTDVlL3B2MHJxT3BRamZX?=
 =?utf-8?B?SXJiUDdISDUyUVBWMTVzTFNoUG9qcE5rSy9KSHFtVkFlL1JnM2RhTUNPclBS?=
 =?utf-8?B?dTgvcHdKT2tuQzAzOXlQaGlkYXlTK3ZkYVV5cG5FNk9MR1JaT0swNWVLc0ow?=
 =?utf-8?B?L25URFM2WUFjYzQzQ1hyMENBMUhja0pSTTM3L2M2elE4elMxN2dTRHltU2Q1?=
 =?utf-8?B?TXFkRDU2UC9uSmptTzJMRWVzQXNXUjBaNWY4T1dJZnR6WWdyS0tnTXlBRGla?=
 =?utf-8?B?YzN1bUhkNEE2TVRUUlM1bFRHOTd0c3M3bHNkYldEWUdrVVhWS0hRdnVqelg5?=
 =?utf-8?B?WUhCTkJNcWhqWk9HeFBlU3BKNjJXYXlTd1A4UzZvcDNsWWVaeDUzZGhIMzRk?=
 =?utf-8?B?bSt3a1puRkNqeHM2ZjBXMTRhOW55TDRxbERGOVVsaEk0bGF6Nmd3eFVnUFlr?=
 =?utf-8?B?T2pmd2poRGVzL3Zvc3lpaFhodTRVdzBIeG9XT2pDeUxFRGNNL3hhODVLcVRW?=
 =?utf-8?B?Mm9OSFBkb1NXZUNPelJJeUUxQ1JkOTNhTWpmRUgvZDlzaHREY3FIdkFwUnVX?=
 =?utf-8?B?MW9JVitSVnRPRVF6a0l3MXFKZWx2cFhZNER4dFpQa3h2bzhnMHhBenphS1Zt?=
 =?utf-8?B?NmU1U0RyQ0FFMjhtSDlJaWhrNTZhZG1JZ0I3Y0QrZXVQM3hRb1VDZ2U2MFB2?=
 =?utf-8?B?QWZWVCt4a0NZdzZXUWR3bXNIQ0NJNno0T2xsakVJZWFuQ1VNK1BvZFhiamVs?=
 =?utf-8?B?KzE3L1R5VUJreXVZZmhpQmR1WmNrU3NjbFFkVE1yQ3Bna1NmTmVKN08xbktF?=
 =?utf-8?B?ZGpxamFubjM4ZXdWZENpREFCTEdaSVdlTDFYRkFKVndUeGdzekE0LytncHRy?=
 =?utf-8?B?eXpOLzY2Rzc1SEVEcmhHUzJWMWc1SVcwZzNMV3dEWTJxTGttYW54Y0xvR0VI?=
 =?utf-8?B?Y1V1ZFk1NmtVWk9hNXJReS9EUXFya2FIQTJwUy9DNWdRbkFxei9XdEYvVEhB?=
 =?utf-8?B?UDJUUGQ5a3ZUaGpoMzRYQzNRWXRRSmZOcUNpWGNvMEprQVcwOXJYYVFBa2tW?=
 =?utf-8?B?VldBeXlkaVhNemI1QklxY1BYWVhLRURJZHdhNm5OQklBbFVxYTZiWm5HcUV2?=
 =?utf-8?B?c1BCdkdTclFpWHNhTC9hZnNpNWZYQm44dUZuNGRkWUxsNEdpckZRZHY0N0pi?=
 =?utf-8?B?TFNncGNLREdBUGlNenlwZ2c1VjRFcG5aSkVad2l5dTExTVZDTXJJNnRyMmFS?=
 =?utf-8?B?bFBQQmgyTURXVXlmY1pMVUpmVGR0czU0Rm5OZlduWGVKM1RLaTdLY1dhdmNR?=
 =?utf-8?B?cjNHN0RrSkN6cDNubllJbTN4d3krR0pKa0Y1Nk55bHlWMHpQTVMrdjhHQmZx?=
 =?utf-8?B?Q09qamIvNHlwVkMzQ1JyMzI2Q2k2aHIvZUlHNmw4U0RrMy9iRE01Ykg1NEpM?=
 =?utf-8?B?WGUwVlRmTkhSM2dXZDE1Mk96bzRDVDUyMVExaGNkNzU2SklySDBMMGdkRGNH?=
 =?utf-8?B?bmxiS05PL2RmOVpIZDZvMnpxaFpjTEt6OTNVZUVKVXFVNzgvdVBKeTV5RGVH?=
 =?utf-8?B?a0IxRVhRaU5yZmJHY0ZmaTgxbnl1NHNKTUd6RnhZb3RRT3JrcUpZaityNkJH?=
 =?utf-8?B?QmtzZTBwa1VYcm9leUs4L0M0RCtPU3FOMkRoeVBUSXl6ZVcxNjFSbTFySmlH?=
 =?utf-8?B?RWhmWHdLSFlwQ0hIaUw0WkN1MnhCT2NVRDkwNFdRaDFKZmMyMENiWFRhb0lv?=
 =?utf-8?B?ekZmNHZvTTl4T2VReW12bXhoa2pHRHRSczBhR2NXeGI4anl3TXVTMFlYY1ZW?=
 =?utf-8?B?QThsY1NBYXBuRGRzTG52a2FIa2h5OTQvQnZvcEs0NFVTNStxZm5SdDJaOHAy?=
 =?utf-8?B?N010eXdhNytua0pweldYNnZ0b05kUmFYMHhKRytMUjFMWUlWbUdiOVdBd0pU?=
 =?utf-8?B?cnF1YTkzdXdBTzUvYksyYk53QktQbTNoU1dubTNwSUhGeWt0Wkk1cURFdlFX?=
 =?utf-8?B?NzUzUHVEVklGSGx5S0JOTzZKMWJEU0xtT3hnRytETDdvS2FwV1lxZk1DMWty?=
 =?utf-8?Q?kP3gBUZMa5/SzthXyJ6GsPuQd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3837d1f9-5441-44ca-0089-08de1b4f7fef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:08:59.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iiHu3NXYz4saOuivoElBgZPf8ka63qjWPBHG48keLIW7BucEy61aoGMudwl6H5slkqffNO3UhPS+le3/aXVGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9954
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

On 11/3/25 00:23, Marek Vasut wrote:
> Add additional buffer format swizzling options beyond XR24, the
> hardware is capable of sampling other formats, fill them in.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: - Adjust commit subject
>     - Drop the alpha formats for now, add RGB888/BGR888 to dc_plane_formats[]
> ---
>  drivers/gpu/drm/imx/dc/dc-fu.c    | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-plane.c |  6 ++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index 1d8f74babef8a..b4a3f8c58cbb0 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -65,6 +65,30 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
>  		DRM_FORMAT_XRGB8888,
>  		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>  		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_XBGR8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGBX8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGRX8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGB888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGR888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGB565,
> +		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
> +		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
> index e40d5d66c5c1f..4fd58afef16bb 100644
> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
> @@ -33,6 +33,12 @@ do {									\
>  
>  static const uint32_t dc_plane_formats[] = {
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,

Can you please drop the above two formats, as I said in v1 comment that it
would the driver a lot more complicated when prefetch engines are added?

> +	DRM_FORMAT_RGB565,
>  };
>  
>  static const struct drm_plane_funcs dc_plane_funcs = {


-- 
Regards,
Liu Ying
