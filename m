Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13B9DFD6C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 10:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5848910E68E;
	Mon,  2 Dec 2024 09:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Dzv2c3OA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555310E68E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 09:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liQjnh8q1EaTv2ecF4rGJfPr5w0ZK5osSXs3AaY8n2Pe/Cdu+SKfWaty+ob9088SU9svZUJhxQBooIjZTPhN2HSZlnTiYHIEqjgdVWssn+5af408HpzjqOUYIdKEWIb51SYYjH3xrOF7NaamUSV1CVXu2+POQFVrwlsirWTgsVuufqxk/aeVcr03mhFjTkfx2wwGnV6tWNT4zhosK+lefDgfgfID6fETcKiGPaH9LsR8h5euM36iG9kUDvD1g7MHUnfvNJ/UQUA2ldrb2FQMzBpo/jZGUAEeiSN64LM0u8ezol3HMLrY5Ta9TY0PkoDf5eQY9mtwxTW1sl8IeO2FIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCTD/Wu4vtAF96L3OwyHQEgfc87DLHotYJ9ibFgMN/o=;
 b=PFd/Qur5cxrMdTCeu5lgU2oLPGmSb2f+Fp142bBmUrH5zxmr1WLIt7KNyRj6zW82TDrPm6zA29d8NmvTXnlG6bwsH5NLMATj0bLOVCu6S6DEIt3FMt4mF+9d5px0wd+4aGMnmMD+PvpNCXDwtDCF/bhBZ3MWOXvpZRPILVsHskMnKanGwsQ5ydNUX+gTe/WPhhugsReXCHoMpg5hm3rs6PKr6a1iuaIsp86YBU5gGkmltXyeBpBPNy8jf3H1jHkzY5djkTZMF+6HEizUkHwNt55+kMfcg8hka283Bk4N+wWjtzZFpiQ7ZqvFlzbLCdFNy5FPKaubr+tcbi5IYakApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCTD/Wu4vtAF96L3OwyHQEgfc87DLHotYJ9ibFgMN/o=;
 b=Dzv2c3OAdBvBIifIbkqDtLM+CtBy82DojGwxErMoYsINg0hMMLUr+iEav/tbJ7tvfCC5lFH5ODTCxtc1IKeZp+VFJPOwwQjZtGl0ldTCWMPHijRZmGiUJ4UerrLZc4pjRue+Ci8JP80YVMrUROO9XdalhqINeEEPsln1iD3mu5LrY9vUFxZSyt3v2cbn8XObtnhL2XSrDE/NUjRyZPd6Bs2TCokd3XyEaoXqEWigYLkFKzJZVRhw95TTz+ecUmredRpcOwfNu2NkA28fM27vXQ8UYYRM62onit+uGfJmJScVPyIB2H1QUFlOcz7tb4dnZ7FRvdzR23jYpcn+hzhikA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9378.eurprd04.prod.outlook.com (2603:10a6:10:36a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 09:41:16 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 09:41:15 +0000
Message-ID: <bc08993d-3672-452a-a29e-3a85199a0dcb@nxp.com>
Date: Mon, 2 Dec 2024 17:41:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, glx@linutronix.de,
 vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
References: <20241202025635.1274467-11-victor.liu@nxp.com>
 <202412021617.HmlPGJLh-lkp@intel.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <202412021617.HmlPGJLh-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR04CA0176.apcprd04.prod.outlook.com
 (2603:1096:4:14::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9378:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d27ffd4-a055-4beb-24d3-08dd12b57739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elVlUU5TY0FESUZ2eE9NK0M0ZEhtWGc3ZmViNnp4SlJFQlAxTFlHbWdQblRG?=
 =?utf-8?B?RFpPNnkvS29wSnVVTFZ1dEc2Y28wU2FxaEdxd3kxZzhycDlTOWo1cUVKdGoz?=
 =?utf-8?B?SHlsZVJsL3VwQ0hzZ0h4cXNjdzdyeUxneXZwZzBPMVIxR0toVHgwYnBmR3Ju?=
 =?utf-8?B?N1hDSVVOOGkxd3hZSyt1K3cwKzV5MGk2RytpZy9FeVhPMlg2aW9jdGhsREQ2?=
 =?utf-8?B?KzZBWDFQeXRFc3VCQTdtOFNSTE8zOXFHZ2NqRzk4S0JIT1pndWNrMjdSNng4?=
 =?utf-8?B?OEVvNjJFdkNMLzllSkJqdkorQnhMMldINFR6NFNBYjNGV3NFMkx6Q0hmY09J?=
 =?utf-8?B?OE5jNno2WWVpaDJqcmtiRm1Cakk0QVA4VDFQTWRQTEdTUUJTaTZwbkJCMmxa?=
 =?utf-8?B?TndWYWF6ZmRXMm82RjZVRWxFUk9MUFJJd1JtNjI4YUxycms0UVJmQm51RWV2?=
 =?utf-8?B?djRnOFJ2OXNSaGpEcEo4Qk1zazJRendRSGJudlkwTW1kRHMzY05GbFNvd2JV?=
 =?utf-8?B?REQ1YlJvVmRYSWpWKzY1b1Z4c3FYcWZXeDBtVzBtTlpRM3RFYWd4dzlXKzJU?=
 =?utf-8?B?WEVXKzlyT1VlY0xpYnY0aHI2OUEwU0hBTTJac3BmWE5KZWo5Rjd1RmVONUV0?=
 =?utf-8?B?VkNUSCttcHRvOUxOS2pTekpGSFYyZWd4WnBxd0tLN2V5MEVtTC96TG5CYkJ6?=
 =?utf-8?B?YzRKbUNyOGtFNHZNYWJPZkkxTUFCcVNrTUNuMWpjRld5bGhIVXg4U243YlJR?=
 =?utf-8?B?N2JWYUpFZU5vRXdvS2drZUVHeGFlSUhFeWlWY1o1SGdCMUVUZ0ZvVGNZRXNx?=
 =?utf-8?B?WVlGU0xHRitLT0xJRDlpMTdYWWw1OTFNVzhkQXRhVDFOaGRGQ1JoMUpGYUpV?=
 =?utf-8?B?YitVc01UWmZRUDFKV1pLNzloRHZvcWsrS2RnOTkzdGNBWUd2YmZJMnVWMXMz?=
 =?utf-8?B?SEdrVWhaZ0ZmYUd6WmJ4cjRRcHpGMUZLbFJnUTlkOHl1OXVtU3FJK3BHWGRD?=
 =?utf-8?B?ZGFMRHcra2FFZXBrZlA0L1ZXOFYrNjJOZ1ZNWUtOdm9aWkxHZm1LU2QvbDNh?=
 =?utf-8?B?SGFqSVVYYVdMcnZUWkRwTERxSGNTMVF5Y3lQazRWRFRhNTR1aklROG9EN21C?=
 =?utf-8?B?OHZqdVJWNU5wZnJCWSt4Sk4rM1o5d2dTa25kcmdqSlhrSlpqUzhHWFAzS0lt?=
 =?utf-8?B?cHNGZHdBVHBzemlyVTZRVmtBSUJseGN6dFU5eW5pVW1ZLzlDVVpxcUhrQVh0?=
 =?utf-8?B?Z25GdzB4TkYydmdvNHF6UVcrNGtibndyK3ZSNnFRNVBVYVh3TnZpajNpbE1u?=
 =?utf-8?B?TmJNRXNhZEozSGlPMUZPNjltaDBvRDgyL2FPSEduaGFjQnE5TUdwMmV3WEJn?=
 =?utf-8?B?VVlGVHptcWNHeFArWktlbE9Cd2JZdG9oeWxFVE1Cak5iL0xSeHZQMG9rekpD?=
 =?utf-8?B?aEJDZVJQdWVHNVhzczE3UElQMW9tZUVTUktsZ1VFRzJwRnp6eU1rMkczYjlM?=
 =?utf-8?B?MWh0L2xnTFhVMUo4TEp2aHRDelJ5SXNDY1J4SEVYY2Uwb1h6MFNualp0THVH?=
 =?utf-8?B?ekgzdWJuU3QvQmhOUkwxNGZGM2N3ZmhNWjVKWGE5R2RYR3RpOE92aWE3aXRC?=
 =?utf-8?B?Zm9Xc0NoR21lZVd3bFQ1Y3VyR25pdFVBVmtoc1JUWXNhMFc1OVRRdjlSdXls?=
 =?utf-8?B?T1dtS3VVOXpEOUR2Vm01aG1wdEZoOGhDV25VZHRFREVKWGdPbUdDSmlxNkZS?=
 =?utf-8?Q?pGwbaWb8FM0j7ybW70=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjhHZDl4dVA3TDVnZnV2ZmQ4b1BXVXRnRXB4QlpOQ0hCQk5VRldlV1JSd245?=
 =?utf-8?B?VDZKYzl1M3RDUGg1WEl5UFJRbk8yT04veFpPMlczZDlaWS8vSFNRWWJTRThO?=
 =?utf-8?B?bUpNZWpaRWVUbG9KMFpqVlBZUWNWSkdMWUtkUEFzVEd1VmdITmhYYjRibWU2?=
 =?utf-8?B?akp6eHM1eVYxT1dTay9OOWU0Q1VGMXhGc1BzSkhDQkp4VlVZeFVUdDJrNVI2?=
 =?utf-8?B?RlBSWXE4QnhHK3JoUm9JTEN1b1hmTTZmdHZRdmFDYXJsSE9BUWJTRmpDRlkz?=
 =?utf-8?B?eTVSTHlyblFpeklNSVNEVjEvcHkxWVRXMXJQWm94eTZ1czZpK0dsT3FKbUdk?=
 =?utf-8?B?NWxRN3RDWFVOcHZER3lIRGViZlg0RkgwZ3JVekVNblFqYnJYd3B1M3I0MUln?=
 =?utf-8?B?Y1pZMUJ6S2dTMWdHU1BUSWFPMzJPdWQwQmNIWHlzZFRhNitGTUI1UDBvK3Ju?=
 =?utf-8?B?ekVFTzBNQVg3ZUxCN1FEVDU4cmFhem5tOGNXMytmOUZTTE9zei9DL0crVHNU?=
 =?utf-8?B?N0ZwOXJETGs2dnM0bFZkOFdYNFRVMlF0MmhvQmxTZXNMQ0o1UEFCV2ZyaC9S?=
 =?utf-8?B?RVY5aEVyKzBBd1Z5MXBVQnhqUlVId0hNTWpSa3ZKcWovMjdUckdzcUo4Z3hz?=
 =?utf-8?B?NXBqRTVZZUkwUldWYlM0RTVqVHd0cU5VemtoSW1vZDhqMlUzckpHYXB2NW1M?=
 =?utf-8?B?d2JFMEhGTTk4SXBMcHh6ZTd5UUVaNm0xNHFsampHOXYyMkFObk4vSFptUlFi?=
 =?utf-8?B?bi9DUTZvMnRSS1ZBV0VDTUd4UHNFV2Z5cnE5bHpTOFRrOEFON0F0V3VMZml3?=
 =?utf-8?B?WmUrRjg2WFcrdWcraXY3cUhXL1JoVmtkY04xcHJ3ZWpWQmpQcktoRGhoMmJ0?=
 =?utf-8?B?eUx5MFk5Q2lNM0cyc3ZRTEVRcmM5c0hDZll1L2kxMzBPSDNZZDJ5cEJEdDdL?=
 =?utf-8?B?RHNpclNuWGRWRjhoOVpYVkpBU1FsakQ0d1hPWXpQQ0R0RFZ3R0xaM0pQZHho?=
 =?utf-8?B?Y1hxN1Q1V00vaTR5TUg1MDFVK1FMWjhibUI0RG1rVVR4MjJ6K2t4S055aXhn?=
 =?utf-8?B?bzVhbFdWNjNreFZ4aU14UWxGcWF4clkyN2pHVDkvQkU4VWkxYjUzMmNZUVQ2?=
 =?utf-8?B?aFZiTGR3RVgvMWk0enNlWmhiZ012WmxIQWp2b1FoUy9CNC9tVGU0cFlIb3pz?=
 =?utf-8?B?RWZBVzVqbmFMYzNSRkpaMWdnTTdPdmlGOUprbWFkL3NYbXRoWFU2RkVmMkNv?=
 =?utf-8?B?TnUwWHZFOS9TRFFzNS9QWUJEa0lGemtyeG1FcjJHUXQ3U0xKN2NuLy84ZnFL?=
 =?utf-8?B?RUk3MlNDMnR4V1E1R0FTYldEWHBiZVcwQmdkUCtzQUxHUm5EY0lyNkQxMFFB?=
 =?utf-8?B?OGNsUFVDNjVzOUUzb0NLR3pEandrUW1TOXhYMWxoNHJ6SUhlVXBDc04wR3F2?=
 =?utf-8?B?ZTMzeWN5TVdXZlBaUWlocDJxVjkrSlhyRnNtbEd6WnlVVHhUQTlNUUtIOXR1?=
 =?utf-8?B?d09wK1hyZGtFK1pXWHZ1Z0cwOE9SL2QraUtHdmNrazNnMFh6S01SWHlEZDlS?=
 =?utf-8?B?MzBRa1p0VjkvNzJlYjRjYTBneU5pWU56RE0xVUtSZmZoZngvTEhRdHIydm90?=
 =?utf-8?B?U1EvMUVPaDdqQzdRRUJBQUZDT1dhNnY2R1FUbW5kcUlZaFgydEFCekN5NXIz?=
 =?utf-8?B?Nms5Umd3cFplR2lNcDJrQmcraGtHNHVmNlBiVzZhMWdjSXlVSUZMa1FOZFFQ?=
 =?utf-8?B?MFlHb084MDlWVFp5MElFSlFOMlRjSGpPNDlwNVFXcjMxWmJnUWZ5eEJBRVl5?=
 =?utf-8?B?ZHhXQiswVHQrNFdEYzdBd2NkSTIxR0RMSDdua05yTzBtRzhmeWZ3K1JBY2Nz?=
 =?utf-8?B?ZEFzS1hRWDFhbWNJU3RsbFNaOUlTeXNDMW50TEVnaHFKMFVOMXFHT1g4NDNs?=
 =?utf-8?B?VTVLNGNVSHBhdmlGMkdPT2NCcitRaHQ5VFZCTDNpS3IrMDEweUFPVi9KOUdN?=
 =?utf-8?B?RXkwSnhyQ3l2ZXRQcDRta1FGQkc5NkVVOFJPb0NCTEk4SS9xK0I1aHVUdVBM?=
 =?utf-8?B?aHd6dnljbGUxc0FNNG1Pblc5THdWblpLOVkzaXBaZ2FHb3FpL2xucHJTS1Vy?=
 =?utf-8?Q?G0mJSURt8wojwhXWN7JwzyCvM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d27ffd4-a055-4beb-24d3-08dd12b57739
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 09:41:15.8666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0d/2heo32+NNSn4LaSAbBXZ8X9SI0H02+sXkrKtIjQLVjBkOpuiAYI9c4wWggCVYcgaTmswY3woL2E2Xe/6srA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9378
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

On 12/02/2024, kernel test robot wrote:
> Hi Liu,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on shawnguo/for-next]
> [also build test WARNING on linus/master v6.13-rc1 next-20241128]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Ying/dt-bindings-display-imx-Add-i-MX8qxp-Display-Controller-processing-units/20241202-110331
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
> patch link:    https://lore.kernel.org/r/20241202025635.1274467-11-victor.liu%40nxp.com
> patch subject: [PATCH v5 10/19] drm/imx: Add i.MX8qxp Display Controller pixel engine
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241202/202412021617.HmlPGJLh-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021617.HmlPGJLh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412021617.HmlPGJLh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/gpu/drm/imx/dc/dc-fl.c: In function 'dc_fl_bind':
>>> drivers/gpu/drm/imx/dc/dc-fl.c:136:57: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Wformat-truncation=]
>      136 |         snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
>          |                                                         ^~
>    drivers/gpu/drm/imx/dc/dc-fl.c:136:46: note: directive argument in the range [0, 2147483647]
>      136 |         snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
>          |                                              ^~~~~~~~~~~~~~
>    drivers/gpu/drm/imx/dc/dc-fl.c:136:9: note: 'snprintf' output between 12 and 21 bytes into a destination of size 13

Will expand sizeof(fu->name) from 13 to 21.
Thanks for the report.

>      136 |         snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>    drivers/gpu/drm/imx/dc/dc-fw.c: In function 'dc_fw_bind':
>>> drivers/gpu/drm/imx/dc/dc-fw.c:175:56: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
>      175 |         snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", fw->id);
>          |                                                        ^~
>    drivers/gpu/drm/imx/dc/dc-fw.c:175:46: note: directive argument in the range [0, 2147483647]
>      175 |         snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", fw->id);
>          |                                              ^~~~~~~~~~~~~
>    drivers/gpu/drm/imx/dc/dc-fw.c:175:9: note: 'snprintf' output between 11 and 20 bytes into a destination of size 13
>      175 |         snprintf(fu->name, sizeof(fu->name), "FetchWarp%u", fw->id);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +136 drivers/gpu/drm/imx/dc/dc-fl.c
> 
>     92	
>     93	static int dc_fl_bind(struct device *dev, struct device *master, void *data)
>     94	{
>     95		struct platform_device *pdev = to_platform_device(dev);
>     96		struct dc_drm_device *dc_drm = data;
>     97		struct dc_pe *pe = dc_drm->pe;
>     98		void __iomem *base_cfg;
>     99		struct dc_fl *fl;
>    100		struct dc_fu *fu;
>    101		int i;
>    102	
>    103		fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
>    104		if (!fl)
>    105			return -ENOMEM;
>    106	
>    107		fu = &fl->fu;
>    108	
>    109		base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
>    110		if (IS_ERR(base_cfg))
>    111			return PTR_ERR(base_cfg);
>    112	
>    113		fu->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
>    114						    &dc_fl_cfg_regmap_config);
>    115		if (IS_ERR(fu->reg_cfg))
>    116			return PTR_ERR(fu->reg_cfg);
>    117	
>    118		fl->id = of_alias_get_id(dev->of_node, "dc0-fetchlayer");
>    119		if (fl->id < 0) {
>    120			dev_err(dev, "failed to get alias id: %d\n", fl->id);
>    121			return fl->id;
>    122		}
>    123	
>    124		fu->link_id = LINK_ID_FETCHLAYER0;
>    125		fu->id = DC_FETCHUNIT_FL0;
>    126		for (i = 0; i < DC_FETCHUNIT_FRAC_NUM; i++) {
>    127			fu->reg_baseaddr[i]		  = BASEADDRESS(i);
>    128			fu->reg_sourcebufferattributes[i] = SOURCEBUFFERATTRIBUTES(i);
>    129			fu->reg_sourcebufferdimension[i]  = SOURCEBUFFERDIMENSION(i);
>    130			fu->reg_layeroffset[i]		  = LAYEROFFSET(i);
>    131			fu->reg_clipwindowoffset[i]	  = CLIPWINDOWOFFSET(i);
>    132			fu->reg_clipwindowdimensions[i]	  = CLIPWINDOWDIMENSIONS(i);
>    133			fu->reg_constantcolor[i]	  = CONSTANTCOLOR(i);
>    134			fu->reg_layerproperty[i]	  = LAYERPROPERTY(i);
>    135		}
>  > 136		snprintf(fu->name, sizeof(fu->name), "FetchLayer%d", fl->id);
>    137	
>    138		dc_fl_set_ops(fu);
>    139	
>    140		pe->fu_disp[fu->id] = fu;
>    141	
>    142		return 0;
>    143	}
>    144	
> 

-- 
Regards,
Liu Ying

