Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB939D91EC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 07:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7A510E0B8;
	Tue, 26 Nov 2024 06:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Rum3L2V4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC5410E0B8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 06:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkMLciAKxU945adCxDFWec0u8IFkV9FxY874EEaGTg4HZ5rIlX5A0zt2qqgpRZXekdAVrfQYcjV9/5A610KDW15YvfbHJ0jcGs96rbZtPdY3V8joNuhoewiVfpKcOFQmfjHp3usuCugocDQHLSHKtAp8Esrx4HmWZC6aCy2InGPsHES/BR4AV1m9wwqfZjwh9i1B9frwHGd5yfNIj+otNNA/a7rx0wZNCPCEwFlqxeiet+PrLC72kTvCp8mkIGgejNXk+ImtXMroOBVnvc8nVqI9yF76Vu9QOUW/6VW3xrTf5FNuvoU1S0VHau2NzOWyfEaS/z8ZcQyF6ymdE1GvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8dHByn5M4fNR2p811M501cDAdWti1ZeFoYnwVilfoc=;
 b=JpUwujAoMpdxdJFHaF6wXeQ298dGNaG6uFp/nf8wiUWphpLBmPVLtXeH8mU/nWr1CsD4ZUiygBUemHlkulZGMsO6MUCTxrb5WWX6SW5lIQmcQ+18WRy9liLsIOzulymAX6FlzoFcfiU1uNIhKDOKFJHvWc5lSAmkR4HYLno+0VtxkDywQlO9V8U4NCAJT/XYKzR9veTzmS8wi2MfuTPTIJhRi7YwogshqLIUqjW9nPqN+7Y1hGQ8y0CqMZ4Czax0EaokhkrsNVYO2kdlRJUz4xGEuDP6eZM4Vh13NtoRNy6AQqGUz0jw46U7/3H8bEQYLXUcefEX0x5tHWGN9ApWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8dHByn5M4fNR2p811M501cDAdWti1ZeFoYnwVilfoc=;
 b=Rum3L2V4eikY4dhZ84ilphP60fEcwwNcCBA+qHref2ETtXqLnNfCzCuVdZP4xuJiBNQm2aswqMQlW9jNl8NzPMjpGhJmQAQH3zZS+7d0ck1AcHJhSznUYIkJeHDZoLUIeeTR3OM1GhTdIilT2ZgVrDlUQRvcXfdBMH2klELI/ffo9PocUIyv+UTSYrkgbe4Rp0TY0ZBnBYx7HVeI28p5aa8zrwR7+ylxau4h/D5yVy6f1GRpw/vZrBndB2A5lkWeHZrluq4363CmyFnLWEA74e7x30W2/+HCllxTORdIpDrsrxp/wTHj7Y5TxxjeLqw/TJMznRfNh7NPawBzdzRN+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 06:49:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 06:49:06 +0000
Message-ID: <55bb77b4-5172-4b4a-aaea-df6972a417dc@nxp.com>
Date: Tue, 26 Nov 2024 14:49:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>,
 stable@vger.kernel.org
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com> <87zflrpp8w.fsf@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <87zflrpp8w.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 76be5f26-7999-4bed-d3b6-08dd0de66bd1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGkvU0NESEVRd05mTVdwV2oyZk51clRSck9zSkF1SUdLb0x5VytBdzZld0dB?=
 =?utf-8?B?ZVhUdnZ5SW52M1BlYWRSRTlST3MvRVhrMXlZNDk5cGJKTlZXaHIvZkxSTFBO?=
 =?utf-8?B?U2hXaStLMDNXWmdtMUZDZVc3eUJuZ2QwSUU1RDhwY3V2ZHhObmNLNkZTSkhS?=
 =?utf-8?B?YzlSbWFseElCVG9IemlOczB5OUxJdlh1SGs3RVg1QlQ5bDd0TlFYTXZxbUVx?=
 =?utf-8?B?Sjc2THN3ajZSSUhiNWlkN1lhYzRUajZ3LzlsVFFvZ0ZhazRZQlFqMTdyd2xH?=
 =?utf-8?B?RitEOUhKR1ppR05XSlAyT3FuZEgzemdMLzhXaTVhK0l3ckFmazBjMkU5dkNF?=
 =?utf-8?B?VWJJSEdXME1MdWFrVEVlR21FaHF1WGV2S3VPOEc2ZHhvZXRhQks3citRSFAx?=
 =?utf-8?B?Sk5iMHRZaXMwM2V5aXFoV29qKytaODNOZ1BJaThOcTI2WWxyTlJFRmgwbFpZ?=
 =?utf-8?B?QzBTbFVDRll0UnpCKzB1eFU1Z1lJMU9yZkJ6UExYc3k4Sld3QUc0WjRLR1JS?=
 =?utf-8?B?eW1KdTBDd0ZMNk9MSmxQSUJSTmlWVm5WaC9BV1JMdlNwQXJ6VVpxZkpyemNz?=
 =?utf-8?B?K2lCaTBnZ1poRVBQRG9oWDBTZ1lLUnhLMEpkUmcySXdmLzFtaDdLTkY2NFRE?=
 =?utf-8?B?Vk92V0tPTW5EZGQrSWljOWZubk45a1JOWXNiUVdLbkNhYWRhTTM4M0s4ZmNa?=
 =?utf-8?B?ZldvZlcxVlJMRlozaTRMREtjZlZIeFdxSTBRQktSY05MSkw3eXZqd2VKUGdG?=
 =?utf-8?B?OFhJbURkWDkwMVBqVFdIK1JlT21PWldIMnVWMm1hUGlOWHVsUnhjTXg5eFhD?=
 =?utf-8?B?VVdsVUtxNWd0ellUUTFsQUhONllLdHRUVGsyN3pQNDFOeUhsR21mWjFHUE5q?=
 =?utf-8?B?ZWlVNnhrUDhGRnE3cUJIeVQrOWtSbFRXYm5OM1BUSllqUkRGT1dlT2l6M1Q3?=
 =?utf-8?B?anY0WDhDMjJNazVMSFlPY1hpQzl5VGp1cGgzSis4eXc0VDl6T2VwRVpDVVY4?=
 =?utf-8?B?d0VUVzVWVjdpdkxzK0VhdFJTK3lzbWVMdTBzdUI4VXJ6MHBqNmdZQUlYZWsx?=
 =?utf-8?B?L2QyUGl6VkVadDdTYU56a3Vkd3l1YkQ5WExJZU13RUdaL2MxQy82bG1JMVZs?=
 =?utf-8?B?WGRNejB4UTZzR0RtcmxRUUlCc0hQTlI2UFlGNTE5UUw0OUVTOFJVMVFXeWNh?=
 =?utf-8?B?UkFkUUk5OTg3T21FVFB5Sm1CbUdWVkZUdU4rLzdkVWtrZFllYm1QeHdjNWE4?=
 =?utf-8?B?VUx6dC9mZ3RyUVNMb0hHcXN6RFBmNmZpQ3FNeUFKM0NSTTRJOTUwZ1RtblNF?=
 =?utf-8?B?THZwaGFGUEd3QkJGelRZOHp2UU8rMFViRWdJQnIyQ3ZNeE5ZQVdjZnByaGFu?=
 =?utf-8?B?RDRZZzVTbjB3bjFMTVJDZ0RBK0dPcVBhaHIrV21LMlcvTXNZNUp0Z3J3TlhD?=
 =?utf-8?B?aUdGOFZaenBVdDBjT01lVjZ1NENzckVHRUhwQ1BCT2ZOMEpmUmEwQ1U4R2w1?=
 =?utf-8?B?VGFBZ0d3M1Z6c2UrSUROcmI0dS9HUW5tVzgvUVBSNkk0cDUzT3J0K2Z2RUJx?=
 =?utf-8?B?RisyVHBBSFY3MFZ1OVFpMFZYTVBVTVNTR0VYbUFEbWNaMWJha1pwSFBzdkpM?=
 =?utf-8?B?QUtXblowS3F3WnJJbENxYXJlVmZnWkthZEd1M0pLdXZneU5iVDJoY3dtclk4?=
 =?utf-8?B?TG9KOTFBVkk1alBQYTEvOWdoZ3lnbFpwOGh6VWNrMHNQY0o1Q2NoTTVtN3lz?=
 =?utf-8?Q?jzjpUUIVLg/5fdFGEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejV1LzA1Ukdjcm03REd5c3hpeURPMWs5Vkkwd2k4dHQ3ajk1VXNIY0NHVmdj?=
 =?utf-8?B?VHhJNXRpeVJOSXZ6bElYbjR6Q3oreFhPY3J5eUJNUElpcGYwV1phMU1CcUJi?=
 =?utf-8?B?M2NtNjFJR3dnQXpFM2NNczVJR09sdXRCSFhPc3MydjdPV2ErSmc4YTV5aDZZ?=
 =?utf-8?B?RVdwb0ZyWjBpQzl6aVhOY3RpWTJFYmkxWHI3ZkJrM1F4YUtZYnZvOW9BOTc4?=
 =?utf-8?B?b29heFJETnVhNmluVW80R2g2RlZmWngyMFVqQzU2My96eVZFa3d3eDZJVGo2?=
 =?utf-8?B?NDM5eGc3TG9kcUFlRTU2NWRvelNDR2R4M0VGR1ZyaG5qanBNb1Zhblc2RmNP?=
 =?utf-8?B?bTRDbmwyNDJCNEQ2TkhpQmxCVDdCWGsxenVCNHMwK01OcVRMY0hCdFZka0lU?=
 =?utf-8?B?WW50ZTBmb01hb3VWN2lCR25kVklSVVE4N0tGZ3RsaHhoOS80M1lKczNIWVRs?=
 =?utf-8?B?aXVITDBYam9FZTBrUUY5VERJUWRVcmptclZOV0EzaTVicUxtOWhxTWI0ZmN6?=
 =?utf-8?B?eUVwVHgxVW1QbTVicEpJbVZQVFJDdE9yOGtwaUp4VFhGTW5Nc0liRURveDRH?=
 =?utf-8?B?a2hHOW9uSTdVWlNhclp5M1NSdmhtYVZEbUZRVERNL3U3cEpjMFNVdU42dHha?=
 =?utf-8?B?SlUyUzJkcXIrNGdSTFBpT3V5QmFUL3I2T2JncjVTNXdQWGx3MGF0Z2hoMGg4?=
 =?utf-8?B?YWxrcE91MkllU081TEZJUmNkUFhyeHdLNFFDQVZGNU1TeHhLdXdNa2F5ak16?=
 =?utf-8?B?ejgvWm8ralpkQTFSQkd3ODJFTzJQd1ZjKzMwYitwN3BISllweUFuLzdlcWky?=
 =?utf-8?B?K3ExWUMwTzdSYzBTRUVjbTV3WHpyU0xzbW9pOFhycUw2SlNWOU1ZaWhoOTkz?=
 =?utf-8?B?NFB6Ylc5V3hxZ0xWNlFPRFRURnFqZWJyS1dOTE9zQ1JMcHFtNG9KYzRPbGNi?=
 =?utf-8?B?Mzk2YjNyQ241NnovQUZWWFN2S09jUERvOENFWHRERndHbWZSdHh0ZnVuTXdh?=
 =?utf-8?B?V3N4aHFYc2svZU5lWHdnUzF4ZnBpSUlCOUxiZWljcHp0TC9qTjNDT2NBK1RJ?=
 =?utf-8?B?VjhhZzA3bWFkZGpMWGxyRzdNUTFDN2lGVFlqN2czdmoxYXkvVXYra3A2OHVG?=
 =?utf-8?B?M1RCY1dYUExUNXE2TnY4bFRzMURwUExHLzNDSnEzK3FYTlUxNTNiRGJYUkdh?=
 =?utf-8?B?aGZCTGo1SVJGNHJNK2JIeVlxVnZRS1huOGtsbFhnbmxHaWVUcFdZeTdNWWR2?=
 =?utf-8?B?VGxaU2RNbXl3YXJKSlVRVjd6aWNUclhiZkh2QVpPWG5UOXpXanJKOVhya0hX?=
 =?utf-8?B?MjJrRDNBVEVMNURpUXVJQjM2dUFma0tJa2d5ZUpGNnFsa0FsZXRHR0NiZ3hq?=
 =?utf-8?B?S29wbnZGaGtlS1Vvb2MvRzRtQlhqTDdhdUdCb3lJbnZNeE1FQjN5d3hXdUo0?=
 =?utf-8?B?c0EzZDAxOWE1ODFnRmxhNXNIcTdqVm1ld0dnYzd2aElLc0J3ekRES2ZkeVNE?=
 =?utf-8?B?dlZKcWdGQmFSVW1SR1NYSHhVc0tOdU93NFllSDUzY0VXR2tQaEJ4ZWVmamhJ?=
 =?utf-8?B?ZVRCRDhEM3lLc0lRS29HRlBCbTVOVDhWalF4U0d5WGszbll4YmtmOXhFbGU3?=
 =?utf-8?B?LzE3UlR6Yy9ZenVKRy91b1ZCQkloMDJnaDVhbzBpRitpc1YwUGFCWWhTN0Rk?=
 =?utf-8?B?WHlGaWV2bXdYWlpoOGpSRFFOSmFWZUN6ZVErTzQvV3lsdGpOQVBTR1VJOXZB?=
 =?utf-8?B?NWVaR2FRWGM1N2hibzZ6VHJuQjBwTjBQTG94WEY3Y1J4TVYyejZ5cjhUaFcz?=
 =?utf-8?B?aEtIbGswc3hNbDloODF6OVVvMDQxNjdjLzhmSVBjV21kd0c1VzF4MEtTSmFq?=
 =?utf-8?B?Lzc4UTZGM0Y0WDZLa2lLdzVtZzhKT0lMRUpURys2Tzc4MU9iVVRhZHlBVWZ3?=
 =?utf-8?B?ZmFoL0RUV3lPbGsxWHA1NXh3WmsyaEx2NUdtRDhWZ2thVkRrOW5EUDZuL2pF?=
 =?utf-8?B?b2JrU0h0V1lVQTU1RzI3TGVIdDFxL1ErbnRuOFNMREhPaXpHcjd4UVdYbWht?=
 =?utf-8?B?bHlCVkMzZXhReCt2dWRvNG9YVzBReGRhSmVZdU1mMC8wZkRTNmtvUUlPMkJH?=
 =?utf-8?Q?KINpoCd1UI4IQd4aEzBJ2x36z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76be5f26-7999-4bed-d3b6-08dd0de66bd1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 06:49:06.0726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go3kqmKQR4oNjlQd4KkBTQdvZ8nMHhNqpGcKZ/wzIz3f9BsjiknIGm7pjGlg/CNHpU420ODI1i718BWU+4YDzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824
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

On 11/22/2024, Miquel Raynal wrote:
> Hello Liu,

Hello Miquel,

> 
> Thanks for the feedback!
> 
> On 22/11/2024 at 14:01:49 +08, Liu Ying <victor.liu@nxp.com> wrote:
> 
>> Hi Miquel,
>>
>> On 11/22/2024, Miquel Raynal wrote:
>>> Recent changes in the clock tree have set CLK_SET_RATE_PARENT to the two
>>> LCDIF pixel clocks. The idea is, instead of using assigned-clock
>>> properties to set upstream PLL rates to high frequencies and hoping that
>>> a single divisor (namely media_disp[12]_pix) will be close enough in
>>> most cases, we should tell the clock core to use the PLL to properly
>>> derive an accurate pixel clock rate in the first place. Here is the
>>> situation.
>>>
>>> [Before ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]
>>>
>>> Before setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the sequence of events was:
>>> - PLL is assigned to a high rate,
>>> - media_disp[12]_pix is set to approximately freq A by using a single divisor,
>>> - media_ldb is set to approximately freq 7*A by using another single divisor.
>>> => The display was working, but the pixel clock was inaccurate.
>>>
>>> [After ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]
>>>
>>> After setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the
>>> sequence of events became:
>>> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
>>>   setting video_pll1 to freq A.
>>> - media_ldb is trying to compute its divisor to set freq 7*A, but the
>>>   upstream PLL is to low, it does not recompute it, so it ends up
>>>   setting a divisor of 1 and being at freq A instead of 7*A.
>>> => The display is sadly no longer working
>>>
>>> [After applying PATCH "clk: imx: clk-imx8mp: Allow LDB serializer clock reconfigure parent rate"]
>>>
>>> This is a commit from Marek, which is, I believe going in the right
>>> direction, so I am including it. Just with this change, the situation is
>>> slightly different, but the result is the same:
>>> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
>>>   setting video_pll1 to freq A.
>>> - media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
>>>   to freq 7*A.
>>>   /!\ This as the side effect of changing media_disp[12]_pix from freq A
>>>   to freq 7*A.
>>
>> Although I'm not of a fan of setting CLK_SET_RATE_PARENT flag to the
>> LDB clock and pixel clocks,
> 
> I haven't commented much on this. For me, inaccurate pixel clocks mostly
> work fine (if not too inaccurate), but it is true that having very
> powerful PLL like the PLL1443, it is a pity not to use them at their
> highest capabilities. However, I consider "not breaking users" more
> important than having "perfect clock rates".
> 
> This series has one unique goal: accepting more accurate frequencies
> *and* not breaking users in the most simplest cases.
> 
>> would it work if the pixel clock rate is
>> set after the LDB clock rate is set in fsl_ldb_atomic_enable()?
> 
> The situation would be:
> - media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
>   to freq 7*A.
> - media_disp[12]_pix is set to freq A by using a divisor of 7.
> 
> So yes, and the explanation of why is there:
> https://elixir.bootlin.com/linux/v6.11.8/source/drivers/clk/clk-divider.c#L322

OK, I agree it would work(even without this patch set).

> 
>> The
>> pixel clock can be got from LDB's remote input LCDIF DT node by
>> calling of_clk_get_by_name() in fsl_ldb_probe() like the below patch
>> does. Similar to setting pixel clock rate, I think a chance is that
>> pixel clock enablement can be moved from LCDIF driver to
>> fsl_ldb_atomic_enable() to avoid on-the-fly division ratio change.
> 
> TBH, this sounds like a hack and is no longer required with this series.

Pixel clock is an input signal to LDB, which is reflected in LDB block
diagram in i.MX8MP TRM(see Figure 13-70) where "CLOCK" goes into LDB
along with "DATA", "HSYNC", "VSYNC", "DATA_EN" and "CONTROL".  So,
fsl,ldb.yaml should have documented the pixel clock in clocks and
clock-names properties, but unfortunately it doesn't and it's too late
to do so.  The workaround is to get the pixel clock from LCDIF DT node
in the LDB driver.  I would call it a workaround rather than a hack,
since fsl,ldb.yaml should have documented the pixel clock in the first
place.

> 
> You are just trying to circumvent the fact that until now, applying a
> rate in an upper clock would unconfigure the downstream rates, and I
> think this is our first real problem.

I'm still not a fan of setting CLK_SET_RATE_PARENT flag to the LDB clock
and pixel clocks.  If we look at the bigger picture, the first real
problem is probably how to support both separated video PLLs and shared
video PLL.

> 
>> https://patchwork.kernel.org/project/linux-clk/patch/20241114065759.3341908-6-victor.liu@nxp.com/
>>
>> Actually, one sibling patch of the above patch reverts ff06ea04e4cf
>> because I thought "fixed PLL rate" is the only solution, though I'm
>> discussing any alternative solution of "dynamically changeable PLL
>> rate" with Marek in the thread of the sibling patch.
> 
> I don't think we want fixed PLL rates. Especially if you start using

I don't want fixed PLL rates, either...

> external (hot-pluggable) displays with different needs: it just does not

... but, considering the problem of how to support separated/shared video
PLLs, I think we have to accept the fixed PLL rates.  So, unfortunately
some video modes read from EDID cannot fly.  If there is an feasible
alternative solution, it will be good to implement it, but till now I
don't see any.

> fly. There is one situation that cannot yet be handled and needs
> manual reparenting: using 3 displays with a non-divisible pixel
> frequency.
> 
> FYI we managed this specific "advanced" case with assigned-clock-parents
> using an audio PLL as hinted by Marek. It mostly works, event though the
> PLL1416 are less precise and offer less accurate pixel clocks.

Good to know this.  I think if the audio PLL is free(e.g., it is not
used by audio subsystem) on your i.MX8MP platform, you may use it for
video output. However, i.MX8MP EVK made by NXP has to use shared video
PLL between LVDS and MIPI DSI display pipelines, because all audio PLLs
and PLL3 are supposed to be used by audio subsystem.

> 
>> BTW, as you know the LDB clock rate is 3.5x faster than the pixel
>> clock rate in dual-link LVDS use cases, the lowest PLL rate needs to
>> be explicitly set to 7x faster than the pixel clock rate *before*
>> LDB clock rate is set.  This way, the pixel clock would be derived
>> from the PLL with integer division ratio = 7, not the unsupported
>> 3.5.
>>
>> pixel    LDB         PLL
>> A        3.5*A       7*A      --> OK
>> A        3.5*A       3.5*A    --> not OK
> 
> This series was mostly solving the simpler case, with one display, but I
> agree we should probably also consider the dual case.
> 
> The situation here is that you require the LDB to be aware of some
> clocks constraints, like the fact that the downstream pixel clocks only
> feature simple dividors which cannot achieve a 3.5 rate. That is all.
> 
> It is clearly the LDB driver duty to make this feasible. I cannot test
> the dual case so I didn't brought any solution to it in this series, but
> I already had a solution in mind. Please find a patch below, it is very
> simple, and should, in conjunction with this series, fix the dual case
> as well.
> 
> FYI here is the final clock tree with this trick "manually" enabled. You
> can see video_pll1 is now twice media_ldb, and media ldb is still 7
> times media_disp[12]_pix (video_pll1 is assigned in DT to 1039500000, so
> it has effectively been reconfigured).
> 
>        video_pll1                            1   1   0   1006600000
>           video_pll1_bypass                  1   1   0   1006600000
>              video_pll1_out                  2   2   0   1006600000
>                 media_ldb                    1   1   0    503300000
>                    media_ldb_root_clk        1   1   0    503300000
>                 media_disp2_pix              1   1   0     71900000
>                    media_disp2_pix_root_clk  1   1   0     71900000
>                 media_disp1_pix              0   0   0     71900000
>                    media_disp1_pix_root_clk  0   0   0     71900000
> 
> ---8<---
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
> 
>     drm: bridge: ldb: Make sure the upper PLL is compatible with dual output
>     
>     The i.MX8 display pipeline has a number of clock constraints, among which:
>     - The bridge clock must be 7 times faster than the pixel clock in single mode
>     - The bridge clock must be 3.5 times faster than the pixel clocks in dual mode
>     While a ratio of 7 is easy to build with simple divisors, 3.5 is not
>     achievable. In order to make sure we keep these clock ratios correct is
>     to configure the upper clock (usually video_pll1, but that does not
>     matter really) to twice it's usual value. This way, the bridge clock is
>     configured to divide the upstream rate by 2, and the pixel clocks are
>     configured to divide the upstream rate by 7, achieving a final 3.5 ratio
>     between the two.
>     
>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 81ff4e5f52fa..069c960ee56b 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -177,6 +177,17 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>         mode = &crtc_state->adjusted_mode;
>  
>         requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> +       /*
> +        * Dual cases require a 3.5 rate division on the pixel clocks, which
> +        * cannot be achieved with regular single divisors. Instead, double the
> +        * parent PLL rate in the first place. In order to do that, we first
> +        * require twice the target clock rate, which will program the upper
> +        * PLL. Then, we ask for the actual targeted rate, which can be achieved
> +        * by dividing by 2 the already configured upper PLL rate, without
> +        * making further changes to it.
> +        */
> +       if (fsl_ldb_is_dual(fsl_ldb))
> +               clk_set_rate(fsl_ldb->clk, requested_link_freq * 2);

I don't think i.MX6SX LDB needs this, because the "ldb" clock's parent
is a mux clock with "ldb_di0_div_3_5" or "ldb_di0_div_7" parents.

>         clk_set_rate(fsl_ldb->clk, requested_link_freq);
>  
>         configured_link_freq = clk_get_rate(fsl_ldb->clk);

-- 
Regards,
Liu Ying

