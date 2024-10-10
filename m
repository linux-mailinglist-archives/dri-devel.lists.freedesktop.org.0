Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3453997E79
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 09:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFA610E879;
	Thu, 10 Oct 2024 07:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Blt5oes6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D956610E879
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 07:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2LtfV2ZmkmJrrF/7s2gTaOENdLhLB0gNlgVcUYm2aKf+JKOsb+QXQawUGx523DpGtcLMvLVXZtU/m87bHDTgh7/qEgC5TGxPLa2xFhQChinuC0G+F9G/WDh7vmfQLJRz6gDA/s2rgaHekPrsKEL2M92eAGfOufRrmCnkbVhHFe1Bd2LSP0ZX2qULwijoPO7bl14S6JVDFU+LqK0jX9Xmo31YRdBnaKwJKTVa5N3lahq11ZDBH8xpOolQh9BX3jP2aIPB35l2tRIdkpj1JgtcYct/pxfzytAT+rILmeI/LbBEyfp27nRVX8FFQmjecV3PPtmXdRnoXhzvlrWIEVzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sbFD/EluWfeudEJv4FrkqN9B/mvR4rvSrvzHajC7qY=;
 b=WB+dV7Oe5V7lIUj3P3t7UpyGcPw1QbPDYfLY6xrGiKI1NKeQbwNGTL52JmZmTmSyO2z+aTrHzP0ODxOTzloOFpiNCGfrqlHBgNhCGCxfyAQHd5uBn1ckfYJZYah31MjhvwiJ/u+OC8um03FEURvoI3cc5x2HeNo5C0h8T5x8tkUJHFBK4CW3kmub0+RG06zePFyOJvaRSnvk8g3j+VUDaGM689Dcxo0cMoPsXLZerYAqQ0AXVvrYEZ2ADwqqvGggJ8DgCQK/yvTWM2onatilxE02Iktw9/XruSg2q0rwyeePmTZzS7nhuH/ny//mWjOMU34H6vcqbCHhvEdQfqa2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sbFD/EluWfeudEJv4FrkqN9B/mvR4rvSrvzHajC7qY=;
 b=Blt5oes6y0fN57BBbAUT3BEP47gcA8pLPA7EcIgwyACdKrtC6bgOkImsPcTCpefNKYy7ZVwc7sbwWTftrmbHF+P7wNZbtWqbG67vGx5akUV0oN/c48pZ26VHy0OWBPp/sMdV/WhgDUnMBAPnE7wpZnnOGUYnRIVIQJCsZkyi/k2OtGxuWK2S6dcR6FCx52axpYVZxyreZZrtoVKhXCvrIoLTr4JNWj93Vi0NG8ulUTl8aEmFonPjnET1mOEZp3wDKT31YsNzwmsch6sV/vE42u0QXapbjg2GyD3vagBd6NpG2sRM+lr3YDt5cj/J/OUHVvF6bHBVi0nvNd+C3b2QqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9641.eurprd04.prod.outlook.com (2603:10a6:102:23f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 07:14:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 07:14:54 +0000
Message-ID: <d6a34efa-47ad-439b-8b0c-a427cf087cb3@nxp.com>
Date: Thu, 10 Oct 2024 15:15:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <20241008223846.337162-2-marex@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241008223846.337162-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5a0aeb-48df-4fb5-b791-08dce8fb3d61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L01UZUlaMVZYUnVRb0F2aFZxekdrTHV2VEplVzlTWGE1Wit1VUx4SWZ5V29t?=
 =?utf-8?B?U3ZXanVkUS9MYmtiQStQRkt6OVl0SnBiamRDRGVydXN1ZTExanVhc0dsOGNR?=
 =?utf-8?B?NUdsbUZIamZMMkZOb2R6elRReEpVQTgrRGtxS2RJZXBES1UzMHhwYmhXMzdi?=
 =?utf-8?B?RHFTNG9wWEpZNlMydFE0SGRTWmdyN1BHdkZKcGZWbk1DRXFIejFoRDlqK1dy?=
 =?utf-8?B?dFhDb00xb2g1Z01xU0VUd3prWWt3dWFvdVRQRUZIQkxtRFA1NG41Uyt2ZG1L?=
 =?utf-8?B?TkZ3UlhHaGd4bmlCRzBiYTl2ZzRERlRUMmNXcVYzK3JCT0VldHBiUTUxWXB2?=
 =?utf-8?B?OTdoS1h1bkVmZ3d3dDJaeTl4ME4zZ2ZpYXQ4SEdWSERBWVNIOHpjVzliVG04?=
 =?utf-8?B?eEZwbGlpK01JQnYreGkxbENGL2JPTWtuaUVLbmJKWFBhdnBoNUpuVFVJdWsy?=
 =?utf-8?B?cWtTSWFOVTFrZTFpQWtmN3BkR3B5MitCQTBYYTU5MGJJMGhXOUZBWmpOcjho?=
 =?utf-8?B?WmEwRDgrUUtCZU9RQVlpVWJxcHpsMWdMVmUxZ1doai9KQXgxUjRRbzlWblBt?=
 =?utf-8?B?V2MvbmZZMlR4WVByR0RpTWQxME9ZcnVGdHRtSStHdHJ6bnd0L2RtaWZ1azkv?=
 =?utf-8?B?TXFETUdSVTkzRExjRWRCVUpobjhIaVBzalFNVDBhekdnL1lRcGp4VVRDMmxl?=
 =?utf-8?B?TUp1NUNQMmptQm4wY1BFV29hT1JkbGdadWVXU1pBMGdqZ2srbVBZSzd0eTNm?=
 =?utf-8?B?SDdwNEFNZXFFSTR4YnAzT0R1TjFhVkhwcGlGS1A2VXdoam1Jc1VtWVpDYTN1?=
 =?utf-8?B?ZVB4NXM2UlhSMjh4WkdXaGxvSndDV2czREJXMnJYTnQ4UjJEWll4N2dybnor?=
 =?utf-8?B?clAyYVBxRWg5RTdCYW9lVzlVNTZ0dlZRQmJQaTEwN3BCYnVmbUJ0RDRHUkcy?=
 =?utf-8?B?cVBTUGFuanlLTU9TbzVUYjRzZExDMWZZTkFjZnJ5OWY3Q21XNWtpT09nTDV3?=
 =?utf-8?B?clNPNlVyN25NT0FuZHBxTXZBWXJ0c1dFeENjbkJPSUZPVGJ3NVhMSXBscDhF?=
 =?utf-8?B?QWZZdlBieVhPcDhTRklvd0lLZStoc0I3dTlGNTNIbElDYmp6T0E5Z1JRYUQ4?=
 =?utf-8?B?VWJZblZHQkp6elFHMTZQTUpVeDJEMDRXMTVJc0huWEFoV1JnTFJaY2szTlhk?=
 =?utf-8?B?aUFySFlIK3FDTDVnU09JSVZEMHJBenNQcEx1MGVUVUl6YU5ic1lpNHBITXhK?=
 =?utf-8?B?VlBCcWRUWVVGSGZxYmNmb0dRZDY2cUVIam1GTDFiRUthdFdIdXIvUHhpWGJo?=
 =?utf-8?B?d040dVdVcmgrWDF2ZmtxNWhyOUk0eG1TQ1BBR2VRQWJXd0Fsb05WR0R2QkNz?=
 =?utf-8?B?MmVvQUE5b2J3bjdXMkRHdnAwMUZZdjZmUmYrQ21nRUJxNmNuT1Q3dXl6VDFs?=
 =?utf-8?B?R2RCeG5SSG1NUG9RUEhleVVJUjRTNlNPdEZ1R1pjZXF6VmtYSDZJUUhyblA2?=
 =?utf-8?B?MVRwb1EyZ0FRZVlCNlBMQ2tPQjJvNHVSeTVtUFpSNk9oUnV3NE9pRDgyNlg4?=
 =?utf-8?B?UWdQMURnMFpuOXJOZklCZk92aTdGb1g4NlZ2dStmNE5aUnd6bGs1WldGWWFz?=
 =?utf-8?B?QzZDMGI3UUtVTEgyZjJGY0FQWVAxNGZPa1o0aTFHVU80MlAwRUtBanJxQjdh?=
 =?utf-8?B?b2ptSjBCQ0lKWWV1MWFkaXVySGM5dVB0cmNidXk2NllyVFI1cnBmRDVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmdjUDd1QkxOdGl5alBkUDNHUUpXMTN6K1BnaEhtMzU1Y3FCOVhKWHNyUjZn?=
 =?utf-8?B?c1NMMS9pcGNYRm1wWVo1bEFadklWakNMYlFQNXg2UVFodWNTa1dGNE40WWp0?=
 =?utf-8?B?Y21xZ1BFM2x3NU1DTVFvVlNKSmgxQUJvQUdWUUc2b0pzcm95VWpyZnJpcUF0?=
 =?utf-8?B?cjJYQ1VsSjJ4Y0RWOHhsRzNaNFdWQkpPRWlxYjVIRnNjRW5kTnZ5Nm1JczBG?=
 =?utf-8?B?MEtobks4cVpLNDZmT1NoREN3TXg4UHNkbGlVeFBvRHU0UGJjdmt4eE9rbWlF?=
 =?utf-8?B?NUk0R3ZacTZ6YzRtdHNEd2hnZ0ZwS2VybmpMVjBjWGJOR3hwTkRiSllxL0JE?=
 =?utf-8?B?MVJURHRRcXVPd2Nnc3IzY0NSeHAvRzFBT0RwaGlIM2xXcjI1RHFmdTlvUEVV?=
 =?utf-8?B?d1lMbmpuakhHb3MzOE9XYStoajMvanVVN0EzSDMyTEZISWlJYkp5ckYvZUlH?=
 =?utf-8?B?VXRib3I2U2RjRXFMcExQMktOSjRHRTROdHJ6T3o2blNldGRRZWJkbkJ3bnFr?=
 =?utf-8?B?SThnVE02Q05oU1ZuT05lS2JMMW5YN0JaMmpBOUJYZmVkWmQ4dGFlNE5RaDk4?=
 =?utf-8?B?NXc1bDFuaFlsczFJQythMkU0QzA4VHFUY09zUW1PQUFKL2ZkbzhDTFNONEx1?=
 =?utf-8?B?dEladXc0OG5oZWF0K0VEUnlxeUVYK0E5cFpWalEyRXQvaldnMXpONUZLeEha?=
 =?utf-8?B?a3loZ0RsZ2dPWVJOOVZjT3FxUmFIUlJicHZWeWplOVhYQmE0azRYb3d6M25a?=
 =?utf-8?B?UE9QZWZxc0svYmhhLy8zS2JHMThUbG9QTFRJQ3VmN3JJVFFJeWY4Yi9naGhW?=
 =?utf-8?B?V2h2MS8yeDE0NFVQdXZRNWZvTThLMmhiYmZMVytvdjZHcHlsTHZocGovem5P?=
 =?utf-8?B?eUVBQ0RJdTJOcy9MdlpvU09uMnhDNUowU2Mvb3lzb29VTjVCVHZhU01qb2xX?=
 =?utf-8?B?Z2xkd1RGZHZibnVTM2cyakg0NDdUbUhITDdTZXI5QkhWbWM2bGZXWk1PMWll?=
 =?utf-8?B?Uy81UHZXeHBtcGxvUVM5VU93SytqNE8ra2ZSZEFhd2QxVW53QUI5b1FSenVh?=
 =?utf-8?B?bi92ZERHd0E2ZWpjd3R1M2dOZ0Z3eERVYTFiNXlFeHJpTWRvbDNXWk5CYUta?=
 =?utf-8?B?ck8weUNhLzZiMms4TnV3MTgrNVZUQnAzbG44MHNabnczcjB0VEZrc0xoa1NB?=
 =?utf-8?B?R3pwSGgrMGxOUE1YOW8ySHlGUFUxN0djQkdXMWdORmVBU2NhVnMvYWhISTFC?=
 =?utf-8?B?RkJCRThiUUFnTjRlanpzaFAxcVhzNVdBdGlrSnNDWXl4dFdMWnVLbGdiUVBv?=
 =?utf-8?B?VGsrZnpVNDZudW9VR29hbjYwRWhjcXFLN2lOaXNlL1lSMEhlMWs4QmM4UWtZ?=
 =?utf-8?B?QXRFeXBTblhkT0p2Z2RQZm5nZHQ1U2RLcmEvdVBuVFY0UyszNk4wTkgwOHJv?=
 =?utf-8?B?ak41U0xjR1l5Z00wbFVGOHZWVFQxZ3JDVWF1QzV0OXg1NmtubTV4NWFKYUV5?=
 =?utf-8?B?YlU0RDlrSFI3V2R2U3BsSkt6RnczT205elhwVzhHSXhTMDBMWDczWXcrSzJI?=
 =?utf-8?B?c2ljYnBQNXExNHJHSlV1ZXc0MXkzdUVPbTRpcm1kV0lib1Q5U0UxZmI5TkVS?=
 =?utf-8?B?QUN3ZTNjQkk2T1VZLzl2UjllVWowTnIrQ3pRRGloK3Nzd2tpV2d1UXpPM3ov?=
 =?utf-8?B?ZEJmUmlsY3JpTVZjRWV2WU1Gdms4Rlo5TUJqOGErbElZS2I0bStvRU5OdzdV?=
 =?utf-8?B?S1RJVlRWWUt0NnBSU1ZOZkFDOGFES2RTSGdUTUthb0QySmpYdmFvR0t6U2NQ?=
 =?utf-8?B?a0RHcW9idjlHMTVDampxQnlYMkdMSktGTUZ3L2JtbXpjYmxiSkN6dlpiTzQ5?=
 =?utf-8?B?UWRaRU95TzF0cUtRV0JyVEEyc3VsQlFzV1Q5bXNvVXVlZkVwazF5Y3kxTm5Q?=
 =?utf-8?B?TTFTbGQ4TnNSVXNDMjFCOU5pNERsb0VCZ3ptb0pIZlNuUGpJUUtDTGtBNkJ5?=
 =?utf-8?B?cmRWMjRORWZOVHFOWmtlSWdrQkt2WFFUZHhIUnppNkdwMU5pU0Q0K29TNzRX?=
 =?utf-8?B?N1U4VVBMQ2lrMGNNenBScDFUNnZ6Q0hmUnk1b1lKYW9PZVZlWDVwWEV1cWhU?=
 =?utf-8?Q?KcqSiluGnTQXYiXKNk9uBRikn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5a0aeb-48df-4fb5-b791-08dce8fb3d61
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 07:14:54.5332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD3R/t2/shtNPKoXfSAS9TrLKJPbfkY2nHJbugLQVZiIbKTNv0acpLPzgaE7TqTIcnDu57FsaexQDYqC8jVCXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9641
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

On 10/09/2024, Marek Vasut wrote:
> The LDB serializer clock operate at either x7 or x14 rate of the input

Isn't it either x7 or 3.5x?

s/operate/operates/

> LCDIFv3 scanout engine clock. Make sure the serializer clock and their
> upstream Video PLL are configured early in .mode_set to the x7 or x14
> rate of pixel clock, before LCDIFv3 .atomic_enable is called which would
> configure the Video PLL to low x1 rate, which is unusable.
> 
> With this patch in place, the clock tree is correctly configured. The
> example below is for a 71.1 MHz pixel clock panel, the LDB serializer
> clock is then 497.7 MHz:
> 
> video_pll1_ref_sel                      1 1 0  24000000 0 0 50000
>    video_pll1                           1 1 0 497700000 0 0 50000
>       video_pll1_bypass                 1 1 0 497700000 0 0 50000
>          video_pll1_out                 2 2 0 497700000 0 0 50000
>             media_ldb                   1 1 0 497700000 0 0 50000
>                media_ldb_root_clk       1 1 0 497700000 0 0 50000
>             media_disp2_pix             1 1 0  71100000 0 0 50000
>                media_disp2_pix_root_clk 1 1 0  71100000 0 0 50000
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 0e4bac7dd04ff..a3a31467fcc85 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -278,6 +278,16 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> +static void fsl_ldb_mode_set(struct drm_bridge *bridge,
> +			       const struct drm_display_mode *mode,
> +			       const struct drm_display_mode *adj)
> +{
> +	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
> +	unsigned long requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> +
> +	clk_set_rate(fsl_ldb->clk, requested_link_freq);

The mode_set callback won't be called when only crtc_state->active
is changed from false to true in an atomic commit, e.g., blanking
the emulated fbdev first and then unblanking it.  So, in this case,
the clk_set_rate() in fsl_ldb_atomic_enable() is still called after
those from mxsfb_kms or lcdif_kms.

Also, it doesn't look neat to call clk_set_rate() from both mode_set
callback and atomic_enable callback.

The idea is to assign a reasonable PLL clock rate in DT to make
display drivers' life easier, especially for i.MX8MP where LDB,
Samsung MIPI DSI may use a single PLL at the same time.

> +}
> +
>  static const struct drm_bridge_funcs funcs = {
>  	.attach = fsl_ldb_attach,
>  	.atomic_enable = fsl_ldb_atomic_enable,
> @@ -287,6 +297,7 @@ static const struct drm_bridge_funcs funcs = {
>  	.atomic_get_input_bus_fmts = fsl_ldb_atomic_get_input_bus_fmts,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.mode_valid = fsl_ldb_mode_valid,
> +	.mode_set = fsl_ldb_mode_set,
>  };
>  
>  static int fsl_ldb_probe(struct platform_device *pdev)

-- 
Regards,
Liu Ying

