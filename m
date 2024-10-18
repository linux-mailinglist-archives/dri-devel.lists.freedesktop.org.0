Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ABD9A375A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C57D10E8B8;
	Fri, 18 Oct 2024 07:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NfC/TkPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1748B10E8B8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUrKeUBog+0isUgKQtqsH0+/cCPY7XM9r1rW5Bhu07ZYKjhs+OLAvTSAEUB/Wk8FBsDFyr70gh3AHEjohFKcQ6Lc6rczXz+BpFIfESQq13T17T3s9uI7C4IhUp0VYM42QWkClpm74Hce+FRRDkfE9Hq19F/LCRYOVtc+OIal9I+yt0ifNHHwHpb3oWmUXvuhz3NFZRX0f+ukmcdcahiPZaQtHC9sbO13Ob2sCCCyrfvrVVRSjrDB0+9IvcbiRijs7wpBwo0RcFe1Ibwcxdf4FvFjYENi2lqWhMV3e4PhYckUpmlABiRer0Pr3OwcA8eNwA5wP9g3zVIrbglo5qIaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoLCmQXsAh8fJnrrR1LAqmyiDHAJiDeC+aWGOJYPa/A=;
 b=uC/ymEDFW2XI07kCzZu7eo5S9LFUwdTYLKYT+DT94BSKHWLA9nkAibTEcFUvRqkSuGcsI+S4fRxXHNj9CSOkgiBSSUMjIMuB6ewQS3iPVD6SgLNQBmqu7wIesC8EOmfxt7n9TFmOmT5lakKPnMQlD5twc2AZVgTbkuCWUhza82dTd9yjYbA8Z17m3+li1LcbcRfvLIXlwGZRBN+swNGqfZ+mQheaWpPGsJ68Byd8CutTv7ojqMDHL6Ma+UxvdJRKQgp8s44tTUG8CUA3u9qE+K4orf5UvjVg2TGQRQOijrhOyokZzr74XoGridFClb0MwCLr/ETKXpoynXB8dxJhcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoLCmQXsAh8fJnrrR1LAqmyiDHAJiDeC+aWGOJYPa/A=;
 b=NfC/TkPqMr7tSTXAeupNOvXEmi2nQcNghZ8mVv/E5m37fa816YTcYn5lRLql/+uqlUo4QrTjAJY97PO/kuadql6F2T1FPzw08FK7yAtp/13tNfPrpSs0tFmOodo/92co9PaA+J5IBVjptUJCjCxFjF3rzSS9EWd1mkg9pGSfACYe/ElUKQ7Ijt4J7st1JArncp+OxS9dey2stmXZvR3ehSQRArvt/O4mYk94/5puPAfYkX8t08s54yI5jwM69Qt/w4Z90jDPGbthdwv1oAHJwu2B+Er4JUWBjsDjGVnn/JwX2sII/Vsx1DnaacnRn3dFEKWlCrifDC+uYn3Hda0ovg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9942.eurprd04.prod.outlook.com (2603:10a6:20b:67e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 07:37:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 07:37:30 +0000
Message-ID: <bed0ee89-8a53-44bd-b531-edfc74438cd9@nxp.com>
Date: Fri, 18 Oct 2024 15:37:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "marex@denx.de" <marex@denx.de>,
 "stefan@agner.ch" <stefan@agner.ch>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-6-victor.liu@nxp.com>
 <TYCPR01MB113325E42E2E31FB953B1CDF586402@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TYCPR01MB113325E42E2E31FB953B1CDF586402@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0129.apcprd03.prod.outlook.com
 (2603:1096:4:91::33) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9942:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f31f63-504b-40d2-a9c8-08dcef47b8e0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3UzOUtPSytiRndwZGlMZkdSUFQ2WVcvNGRFMmlYTUdDaUt3anZxU01pYjd5?=
 =?utf-8?B?SWtjcDNSZnZDdkJRWVFpY1dlZWJVNTZjaWJhYTNIcFhJUUdkV1lPaml1aHVa?=
 =?utf-8?B?Ym9TTXE3QjBOZ3dTYlRDcU5WVWZVOEJCMURieGY0ZHN2RFZkcytqYWpoblFL?=
 =?utf-8?B?THN6Wm5JckZwcGkzbHVlUGUvd3dBVW1mUkxVVXhoRmdGVWRvUzdvcCs3UllR?=
 =?utf-8?B?UDJFWUdLSjRmbWo5eGFHR2toN2toQlJDVGkyY0ZNdldlL04yME1DdUFjSXJT?=
 =?utf-8?B?TXE1VHZuNDB0dlNpZTB4VHkyelFDaWM5WTNlNGVIUmRJMXlLYkRzWGNPOTdU?=
 =?utf-8?B?MDJWR1VobFpQWXJqRHd3aGN4UWNHN2NJMS9ZTE9GbURJSCtRL21LcnNqMExi?=
 =?utf-8?B?NW1CNVNIYnRCM2J4eHdPTnRYL2RhQUFseUtSRG1jQm1FdDNDdHNGSVpkOEFC?=
 =?utf-8?B?MjlPYUdkdk9FSzYrb3Vxa0RRdFZvNWwxbkNBZStnbTNJRXJUMWRSSVpTZ1Nu?=
 =?utf-8?B?eERBTmI3QzczQTZTT0dIeGd2MzJVdUJEbVkzWktRSjNBb1NWdjR2ajFGUGZp?=
 =?utf-8?B?engrcjlwTENkQW5TZHRJMXhLbVloSjZGUUxSYncyRGkzbTlham55bHRMckRJ?=
 =?utf-8?B?K3J5Nm5KVEZTZVExOEZuWkFaQjkrSFBKaGprMkR5S00yS1IrZDRWcjl6Zmtr?=
 =?utf-8?B?NlU3WXJOQ1NuNnVDUllOdDlUV3l1bnI0R21rZXpWaFVHMHZMNjAzNlNSSVVX?=
 =?utf-8?B?VVhHaU5rZ1JTYVZ0amlHOHdZZzFtZkl3dEJNL2V6bXZkTVNhNEhnd0h6dVJq?=
 =?utf-8?B?L2xZZ2lKWXZnbzFpOUtEdkhabW5FNUVaVnhxR3BzOWVvWnlsUGtGMjhzOFRG?=
 =?utf-8?B?dzh4WG9JUHFoNWREUlAxb2N1b1h5MC9rSk8ybTVhc084UUlLd2xLZVJpODA5?=
 =?utf-8?B?UVJwamJrbU9rVDhoZXp6MEQwYktIc081ZEZBRXdlOHR4bk94TGxVME00L0Jt?=
 =?utf-8?B?NEhvOW81K3hkcDQ0ZTZxRS9sRlhJUG4zWFN1L0pRNVZ0d2lOQk9LMWlrQllZ?=
 =?utf-8?B?WURPUkJrNUk5Z1J5VlFLV3NPZjhGQnBuVzNZMFd4TDdZdzg2ek9jQWloWjZ3?=
 =?utf-8?B?K1RsOHEyMFB0cHloUFlQRVpqUG01TkE0alo1UkZoOUhUaTBoVzNWeVJkMmdx?=
 =?utf-8?B?R3Jod2VibFlhR2Yva00xeGZDa2w4eEIveTVwSThVU2l0cU1DTGEyditSTUpR?=
 =?utf-8?B?cXY4eXkwR0p1RFBMWWtGNmxDYWVkQ0JCaDhTdU43N2wvYldJbjVRRzVBdWlo?=
 =?utf-8?B?OVAvMy9xaFpyOXpONlBISUZtS1lsTTZCZ2taSjdHK0RVcFJiS0M2Q2pzc0Va?=
 =?utf-8?B?MTF2MExhUVZmS3pIblJwQUkxVlVyeUVpNU9FOFBleXVyNW8xeFZmbVlEUTdK?=
 =?utf-8?B?bXY2NjdqYU9PMzJ1VFE5TXdBaTVTVVBGUjhESDVDbXh2SURKdTZ0KzFJM21K?=
 =?utf-8?B?NnhYRUoyVlhiekQrTW45a3BiZkR2aS9qOTNleXZvWjcrNGIwem1KZE1UOWU5?=
 =?utf-8?B?NmMrSlJjaXFDVkZVenM1ZE9GWjVDTkM2TlhNVmoxeHI0Um5NZXQ3NENWQ25C?=
 =?utf-8?B?cjJjeUxodEtVOE9PRENNaEd2b3d3VkV4U2hsZGRpdkVRWTJNSEs1cW5JZmpR?=
 =?utf-8?B?UG9nUk8xRmR4MlJiNXpVejIvSGd6QXlYSzdhNWZ5TUpPK0h4QTE1UkNlaEVH?=
 =?utf-8?Q?EfvQ2jB8+31e1hN1SRFCZUeFScqBgMKuCgZzZWy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTNGSEF4bzgya0gvM1l1cmRBV3lWcFQ3ZjBkaHRJQkFPZk9najh2QjJvZENW?=
 =?utf-8?B?UktvUC9icWUyR2NKZ09sZXNRdjNra2JITEdrYnoyRnNnODJBcXM3REwxR0dN?=
 =?utf-8?B?VHErbUx6YUZPMlc3ZUhISlJZTnhyM1VZaXN1UThWWjUrd3hPclp0VWV2SnJk?=
 =?utf-8?B?Ui9ndjArSHRuTHVBQ25iUms0VG1YalBuKytubmxzbWlFZmwzQWV1eWx4YTRY?=
 =?utf-8?B?WDVUekdHTXZ5R3haNTI2RGFzQ0FVaGR0dHdNVmYxbzBMZnVwckk1T3lWQ3hi?=
 =?utf-8?B?bDVGR3F4RzhPaE1YemFPS3RtQ0IyQXN2S2tPL3JDVzdFNkNzejQvSFZzdTV0?=
 =?utf-8?B?S0I2blJmKzAwOGU2S1JLQ0NSRk95V0o2ZzZFUmRFa3NTaEpYb2tHM3lRekJS?=
 =?utf-8?B?d1k1SkVlN3ArY3hLZVFyS3haSUtRcWFJTzc0ZXBNNm1oemxrZy8zNUZod2xu?=
 =?utf-8?B?NnFXenAxWHkrTUFNNFY0UURkZlB3UkhJdFlWTGl3NkhGVkt5eFRTSFI2ZERk?=
 =?utf-8?B?aERkZi80UXkraVB4K3B3eHNVQkk5VmdRVzZFWmlSTVE5b096c1hCTW5PVXZt?=
 =?utf-8?B?dElzK2RSY0toZjByRnpra3N1ZnRYYzBhU1lMYmltWGYwdFFFSEdoN2VwNnJx?=
 =?utf-8?B?Ym9QeVRGZGlPOVVBcEUyWjJOMzE2ZVZEMXJrVDUyVnRMWTdDUm1FSkN0NlRY?=
 =?utf-8?B?QkJoRmNYSVBtbW0xS2Q4VlJPL2hWUkpnTEpqZHg1a2FQbHlsd3FyNjI3bUx6?=
 =?utf-8?B?TkFBNmp4SFFab0RXQ2lRWWdXaHQwS2JxRGZybnNIcDFyWnBKbFlSc3RrVDZR?=
 =?utf-8?B?UWMxaDRpcDhNM2g2T2srNU9GazZFanEvamN5UkRvN0xWTXhiZWdVK2p2a2ZT?=
 =?utf-8?B?dTBQUEpyY0hRdlE5MGxDM1o5YmEvajEwLytSY3Bab2RpeWRJSHY3K1Y0OWxE?=
 =?utf-8?B?Z1ZxRElCSFQ5NE1WdFVOZzhhcTRXa2NKSVpvbElmeTZhNVlVRGpDdmk2ZEVN?=
 =?utf-8?B?R1h6ODltUkdNVFluaGkrOHlkRWxXSnFScStpQk1raTNXcFNOMGhtblJnMnZO?=
 =?utf-8?B?MndSSjlxbms3TlpXbUVyUVB0RlZ2THJxTXpBejRCZUVySVdPbmgzSjZEcDNS?=
 =?utf-8?B?ZEVUaVhPWjJUVXNZcFBXR0RrU1F2V0k5Szdqb3I1VDhtWVBsNUZRbWRCejdi?=
 =?utf-8?B?dmZqaDdaeStiR25lWEUrRXI0Wno4c3g0L0ZJNXVMZEhDQlVQWWpvZkF2MmhW?=
 =?utf-8?B?b2lKQXNXc3F6NXJvVjhEaW5TYXphaytxVTNaYkl6elA1SXlMcjVWMzdKR2RI?=
 =?utf-8?B?aUdFRTB0Zit5WkQwcVVWV3ZEMkhOd0FoeHhpOXhQNFZmRFlhK0ZmVjQyU3hK?=
 =?utf-8?B?VUZtQjhMUzV6MGYwalZuZUhlRCtDeE5IWGFCL0kreEhLQzFySlUydjg2ck5L?=
 =?utf-8?B?aXdtelEzKzFBYjF6TVAvcWYrbVppS0ZuWUUzUEVLSm9wZHhVS2JaNlltUXZr?=
 =?utf-8?B?NjJCZUVSbmF1cjNTV0NvWkVSYUphTWQ4eEtJdTI4cjFoWEdRTGpUMWlHaTNo?=
 =?utf-8?B?TmJ1anFCT0pIM0xxWFNUWUdDajJzVk1jTGhFUlBLc3NReHVOL05rVmZQVFVJ?=
 =?utf-8?B?Mm9rcFV2Yk1EZHFIUFFxMnlJNnppdEloeDhpQ0FKYWl4ZW5IY3lyRjVWZlFq?=
 =?utf-8?B?a3hwN0tCeGVyanI1ZVE2Rzk5ZFZxQVRKcXdaU0xpM0MveDI0eWFxclpjWENO?=
 =?utf-8?B?NlZpdjlTakNITGVXZUVwTWpBU3RMWGdNOU5XT29KUE9nekdvRitHWHIzZkFN?=
 =?utf-8?B?L09CS3FBM01mRGVIUmM5K29GKzdnWFVaa2pyOURVZExLYmV0cW4wZC9GMmJj?=
 =?utf-8?B?YlNBMjhZMFlGYUJ0U3FjTllDS3hDdXA0aHRPSVhrR1c1Y3d5aFpPQm9XSjFo?=
 =?utf-8?B?VnpDMVNGWXAvQ1ZHajAzMXVQYmFGa1dFRmhGMjFMUUlIekFvUUplUE5wUHdC?=
 =?utf-8?B?bWp6akd2blVDVFpIK0Z2d3FxaVRkTUExcGtRNFQ1bXBWVVNQcTZCemhHb2Mr?=
 =?utf-8?B?OFBuK0FYRjVlL0lCc3R3TUNGak5Hd09VSE1OZitNSmlKcGdpRlBOanFPV1E2?=
 =?utf-8?Q?98/yA5VeQ77fbOnV2Qs3X3h8i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f31f63-504b-40d2-a9c8-08dcef47b8e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:37:30.6138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LAuwLySitzoK1ObzlKTpdDpGMBm5EureCS1kPFwJK5Xy28Qir1CeoyFlDrcWxdNRg2yYkx6TQNAcxCpnjYGzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9942
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

On 10/18/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
> Thanks for the patch.

Thanks for your review.

> 
>> -----Original Message-----
>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Liu Ying
>> Sent: Friday, October 18, 2024 7:48 AM
>> Subject: [PATCH 5/5] drm: lcdif: Use drm_bridge_connector
>>
>> Initialize a connector by calling drm_bridge_connector_init() for each encoder so that down stream
>> bridge drivers don't need to create connectors any more.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 17 ++++++++++++++++-
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig index
>> 264e74f45554..06c95e556380 100644
>> --- a/drivers/gpu/drm/mxsfb/Kconfig
>> +++ b/drivers/gpu/drm/mxsfb/Kconfig
>> @@ -27,6 +27,7 @@ config DRM_IMX_LCDIF
>>  	depends on DRM && OF
>>  	depends on COMMON_CLK
>>  	depends on ARCH_MXC || COMPILE_TEST
>> +	select DRM_BRIDGE_CONNECTOR
>>  	select DRM_CLIENT_SELECTION
>>  	select DRM_MXS
>>  	select DRM_KMS_HELPER
>> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
>> index 58ccad9c425d..d4521da6675e 100644
>> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
>> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
>> @@ -16,7 +16,9 @@
>>
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>  #include <drm/drm_client_setup.h>
>> +#include <drm/drm_connector.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_encoder.h>
>>  #include <drm/drm_fbdev_dma.h>
>> @@ -56,6 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>  		struct device_node *remote;
>>  		struct of_endpoint of_ep;
>>  		struct drm_encoder *encoder;
>> +		struct drm_connector *connector;
>>
>>  		remote = of_graph_get_remote_port_parent(ep);
>>  		if (!of_device_is_available(remote)) { @@ -97,13 +100,25 @@ static int
>> lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>  			return ret;
>>  		}
>>
>> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>> +		ret = drm_bridge_attach(encoder, bridge, NULL,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  		if (ret) {
>>  			of_node_put(ep);
>>  			return dev_err_probe(dev, ret,
>>  					     "Failed to attach bridge for endpoint%u\n",
>>  					     of_ep.id);
>>  		}
>> +
>> +		connector = drm_bridge_connector_init(lcdif->drm, encoder);
>> +		if (IS_ERR(connector)) {
>> +			ret = PTR_ERR(connector);
>> +			dev_err(dev, "Failed to initialize bridge connector: %d\n",
>> +				ret);
>> +			of_node_put(ep);
>> +			return ret;
> 
> Maybe same error path style like above??
> 		of_node_put(ep);
> 		return dev_err_probe(dev, PTR_ERR(connector),"Failed to initialize bridge connector");

I thought about that and decided not to use dev_err_probe()
because I don't think drm_bridge_connector_init() may return
-EPROBE_DEFER, no?

> 
> Cheers,
> Biju
> 
>> +		}
>> +
>> +		drm_connector_attach_encoder(connector, encoder);
>>  	}
>>
>>  	return 0;
>> --
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

