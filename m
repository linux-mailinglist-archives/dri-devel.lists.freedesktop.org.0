Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65455919F52
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 08:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84A110EA12;
	Thu, 27 Jun 2024 06:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bTvPqwIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2042.outbound.protection.outlook.com [40.107.103.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D7210EA2E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 06:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBRvGJqGlOHwCLa3NAjUaeAQMDedd2m+bqjaqKKEOKmUdkIpS0ZAWPsGCrKmkIexEs8Pitph9Rl52kW0rq8+jH+trBgPKZhAhdH5Xlb6305Os1yxCnhihenGC7ZBDyH+ZTA6jlIC4bP/5VyX19iimtmG+VEHJ011ePG53RjEQ5GJ7XBODNJvuBWTK49h/VeYf8AZuyDJ0yokuXCUlQNve0ndyPnmWSfcIcTHI5g8MggsULuUmo+kH8xNtWLCj9C+2euarrzQ8w0lpdGFrXpD3quettSiER7Z6lraol8Qkb1fAkq2HxWYX7UkuEmFdv1YfT1vnnVoooYbTj0b5U/DDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbFd7bdvxqLv3LpX/vubxkV8bOgKAJypJh1wlIMmCE8=;
 b=cWL2yLlnW7JQdgO1mgKfRj3H8dIjRTAuxvLUE7mf8y943YjuuS7DZUF0w7E7V0aeKHCrb2Bevhn1dzmQdD/6J2TeB3sjpis4ldYGS8blpXvIQ3zuQ7e6WjWtYjl7Tr4e7n4Od6fke7DFYJyJ7d6HldTXvbRMKfyU+Pzu9K5OiqjG5l6McKpiCzaYRWYYSvgNXPdhOwC0JOM9+pBRjVK/X8LiNyRs3p/TvjQEs6oaQ0Z6Q20z5CbumBHj56UgbKM9Yao/BpZ63dZKuBMkHFk2CCrzwTNBfa0sqGIFiOojTShG+lpy5UzEtja9nrNhO4/hh6MXclC13Yf8NQwaT21x4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbFd7bdvxqLv3LpX/vubxkV8bOgKAJypJh1wlIMmCE8=;
 b=bTvPqwIHNXaXvBBYX6ITvJZE0QU6V18bYQkg+/skz3VZKnrp+zC+5bONusNlnTAgwp/zHSV2SH/C5L3PaEG8D00wncoXs5ijbzl3HeDHtqgN1b5q9EfGDYUr7uGblYNEMLdY0rNd0ch/mfQ8WPEp9c0c601kysi7LxvlCMYVxM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 06:33:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 06:33:52 +0000
Message-ID: <83276453-9220-4647-ab82-6e18f903bc02@nxp.com>
Date: Thu, 27 Jun 2024 14:34:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm: bridge: dw-mipi-dsi: Allow sync-pulses to
 override the burst vid-mode
To: Heiko Stuebner <heiko@sntech.de>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, quentin.schulz@cherry.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20240626084722.832763-1-heiko@sntech.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240626084722.832763-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 9104d4fe-9a04-4dab-2e85-08dc96731c0d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHozUEpzNFBXZ2Y3enpveHFhZ3B3R2x5QVh6UTRlRVB2U0svWFRlNTZjL0cw?=
 =?utf-8?B?MnhlRzdIaWhqak02djlqamN2WWRCMzg1SmsxSUtqYVpUTzNFSEljQ3RGQ0w5?=
 =?utf-8?B?L0IvNDkwOEt0TDQwUFJnQkowY1RNZlU1bGpsR1V3cU81Szc5NHdlV2dhdy9I?=
 =?utf-8?B?QUR4OFdNMEo0UHpOQ0FGcWlWOWdnT1g0Vzl5TU9XdmtueG5LUDZWL2Z2UHVp?=
 =?utf-8?B?WlpMdVByTE8rcGZsUkJkZnJJUFo5b3ZCUFJHK1lzWkZYYjV2QzVFTWpWREVT?=
 =?utf-8?B?WlFiZzcwMm9xdUJBQ0dnMkVPS0hBeG9QREtSN1BJYk55YzhwaTZKOXIvYURq?=
 =?utf-8?B?OW15a2V1aFl6QXFQSk1kOXg3bE1WT1crNmNpMFA3MUxVQVRuQTJ6SFBwNGQv?=
 =?utf-8?B?cXVaQW5PVXluYW54VVJHU3RJT2pLOHpyUkNJVjA2a0Z1SXVoa1JZVkFRVVBR?=
 =?utf-8?B?eTZlYStveWhzMUJ4YVlsNVdFMENXY1doY2h6NUJtNVlTcW9TTFE1S2tGM2lH?=
 =?utf-8?B?ZVh4NHVaalNHSHpkSGFGYUV5QlNZVFY2VUluM2M2WG5MUzlLSS9Pc1FYS0gz?=
 =?utf-8?B?T1M1a1N2TU1aOTNyMEFJQmk0c2lEcDl1L2N5NzJod3pkUk5CZ3dXaHJTT0NH?=
 =?utf-8?B?eHZFTG1naVRBbDUyZVpwNThHTVdnK0hRZVlZMXJ1ZTZkN2pyZzgyUW1hNk9w?=
 =?utf-8?B?b1M5OUVOa0JnL3FQK3g5Q1pwckd1VnJodzhJeklIUmxPM3pmbENhcU9JMktY?=
 =?utf-8?B?UTcvangxRTY1MytKS2dZRlFvZTRrcWsybUxBVXkzcHY0em5nMlU1eE1oNWJt?=
 =?utf-8?B?Ynl1dTRxL0FQcmxyZ05yTDkxMWVrMTNYTDhSZVdyNXRrNS85TXdBamZYcXAv?=
 =?utf-8?B?dlFmRG53NHFDOU5FOGhVQWJuNUtHd1FXT0dLMVpZSXFuU3Q5Vlk0S3lOaVJR?=
 =?utf-8?B?Tm1jMDNITngzRzcrc1d4ZllzdWZrNkt1TjdYMVhBbkNteC9wNElxakF5Yk5k?=
 =?utf-8?B?QXJmczRFWXZZdWdSWHhIbVAzd2hqcjgwa2hXckhtK1cwL0FmNGVOTDR2L3cz?=
 =?utf-8?B?c2UvcTg3b2g5Uis3TGlKL1hGK0hXNXp5ME9namNOY0NVa2xrMmJid1NYM0xR?=
 =?utf-8?B?R0JhcHQvOUxjRWRVZjdSZi9UMWFaQkpaU3ZJQ2VsLzNVRGlQWlpXNnBRdFZx?=
 =?utf-8?B?K2hIS0lncUJuc1VGVENjS2srNlN1OGk5RjFiNWxxTmU4eGowSXhWcm1RbUwr?=
 =?utf-8?B?ZGgram1HQ0ozNGg1WHBJYTZBbUlpZVg4SG80ZHJoVG0yRkdzY0syRTlNdXZC?=
 =?utf-8?B?bHZIaFdSbHFXUE5zbVNDeGhVYWZ1VWZJMWpxOXBiMEdtcFNZRFpWVFFhK0dW?=
 =?utf-8?B?NXpRZVJpaDdKZ2NPZDN0WVkrTWJlQ1NSTkw5MFB1UzBSd2h2dm9QN1JJT0kz?=
 =?utf-8?B?YXdFUjhVa0JWQmpwaXBXWU9zSVVNclhQN3RUdHlKZENSeVY5MXNPanMrcThM?=
 =?utf-8?B?ZjNtT2V5U3U4M1A2d055QUplS3F0VkpUODN5V2oyVUk3NGlzNzRJaC8yTzA4?=
 =?utf-8?B?b3o0QllPNkNnbmhRUHRiTEdHckZmNm5PTTNDdTJhTHMwSW10U2kvVXpRMkpa?=
 =?utf-8?B?U3F5QlUwSjRsK3dwOEV6d0tVdTNKRkI1bTJaTVJMdnlTQ0x2NTFRQzVDM05P?=
 =?utf-8?B?bVR0YXlRZlp5RTBmbnByckdPNy9mWlRCNmMxYS9EakdNRVdnZTBSb2xBdFhL?=
 =?utf-8?Q?qqssg+af309GCoaD4s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzEyYW9Sa2dKQnpQNnVTWUw1WnMvcDQrNWg3cDV4cUxJZ0tvZzZMV3lYVTNJ?=
 =?utf-8?B?amgrT09QczZUWHFCbHNpRXlCd3VqNjlxem9CbmlNVVBYeEc0YUFpUlg5Tllm?=
 =?utf-8?B?Y3dWa3lmTlozZ2lXUFppNUZFVGcySHpFRkwyRDJiODcwMjRkUE1SRFJaTGlX?=
 =?utf-8?B?ZmI4WnpaUHlIZmhrWGFyNWxhb1oyMDd5aEppbjJhTkY1dTREcnFBRXdtT1RJ?=
 =?utf-8?B?TnlyTGgzdHRZZTk4eXJteWdvN0JxSCtiUUlMNVlyRE0rTnUxR25rRlNMRUhP?=
 =?utf-8?B?bUV2SmpoNlk0T2F6ZEFOZkxGSU5SOXdoWGRsazlKRHhYQms2V3BtVGgwdGlU?=
 =?utf-8?B?SzVXekNtbnZOWlhWczVDSUV5Q3VSNW40c1YzeC9yTTVURnVlRkhwclMzc0dY?=
 =?utf-8?B?TURoUnU4VTJUSytBRUI2NDdrendyR1ZTZHN1VGRLNVZ3OW1TbFFtL0FJOG9G?=
 =?utf-8?B?dHJvZWdmVk1NbnRkdllHUFhIc0hZS2pnSDY2UXdxWGZ3TStiWTdtWkh4VTZu?=
 =?utf-8?B?cUdrSkY5L0pHRGZuY2lmcHpzZUE4eThBUGYxYTMxblRKbnZTTlZnL0ZZNnRN?=
 =?utf-8?B?TXozUE9uOEJQS2tQa0FBVlhjMkgxYUVaaVU1ZURsSzd0cEdVMHpqUUt3RWUw?=
 =?utf-8?B?WFZQa1VGL0lXaW8zQ2JHajJhUS9JcHlxeWFrWk1GdVo0VVIyVlFELzBoRC9o?=
 =?utf-8?B?Mk1zT0xJMGlHNTE1NndSOG8wRkh4WWF2NytOUmNFUW9iWGRhZ25yR1huVytW?=
 =?utf-8?B?Tm9BbXlQciswdXJuMEdkbEhoaEZZbDdYeDlPUVRid2psQVJKS0F6amdaOFB4?=
 =?utf-8?B?ZHdRR0UwTVdPWUo4UXM1WkxOa2ROaTJYeFpZZFprK3JaZisyWFJ2TGFGYXBG?=
 =?utf-8?B?ck1VNkpJOGNFT1VvR3FVK2lJdXN1ZVhiN3hOQm5FaDBVT3BXWGRKbzR0cStJ?=
 =?utf-8?B?RUptbm9aeFQya0dkcEQ5UmNRY0RaanlmMHk3WFNFd2xSOFlRbS9PbVVyUDZJ?=
 =?utf-8?B?cHNHSFp2dmFpS0c1NzVRUm5vaGYvRlcrUmtwM0RUdDErcXhPeXNsUkRBTlBN?=
 =?utf-8?B?bm1hazZBNXliRE9oblNWRG5qWStjTGQ0YUxIV0RENzFxWjFjYWNZV3pVd3d2?=
 =?utf-8?B?a3RzVzd1SnJ6L01weFN3QnVYZ0ZrRVZVVEVHQjNJMnFZS3UyTDdib3BTYnor?=
 =?utf-8?B?U3ZXVWZXdVhWUCtXaVUzRXZGMFYrYWRpWFRudllvYUtaNUdsNmg0VUkwTG01?=
 =?utf-8?B?WXpmYnBSRmd3WUhoWmt6aDhDQ2pFWFg5VTA3ZFY4SzFvMm1Wandrb3RpN0F1?=
 =?utf-8?B?NGRRUytHSHJEUVdPbUpFT2UyMmxGNURIUTF0cnZSa3dVb3dNenZLNi9rZjIy?=
 =?utf-8?B?TXo5enlwNGZPcmVHRHQ1elVDNUdyY0x4QkwzVGg0NC9wTmU0Zkt5ejQyZnk2?=
 =?utf-8?B?bm5QQnVCajRvQVM2NnRQUEdxWmQ3Z2RrcGl3RklvTWFwVFFpTFhKYi82Q2hy?=
 =?utf-8?B?TU01US9qZVlaVjdvV1E5L1pMV0VDcm9xRjVWZXlzdk0vQ2MzYU5Xd1BQa1BH?=
 =?utf-8?B?Y2t3TEpteVlNTWpTWDUzY0F3OUx5YkpURUJocmFCVzMrcnRoNzJzQlpMeVVz?=
 =?utf-8?B?UWpOQnRoL1lMeUtkUEUxTEpvZlpkbkVJY2FIVkVOdnlyT3pMUVJReE5teFRI?=
 =?utf-8?B?VW9FRklWVXNVZW9JNEpsY29EcjVpSzN1SE40SzdCNUMvbm81WGpRVmpxeW5D?=
 =?utf-8?B?US9QUVRrcWxiM2szeDlrMG9SeW5TVnR0RS90a09rbXBIMlQvYTlWYXpCM3I5?=
 =?utf-8?B?aWV4bEo2U1IzYk9JZ2djcFg0TTlRTCt5a0Q2TlFra3AwL3JySVlaODdHdGFT?=
 =?utf-8?B?RWVJWlFPR3J1RzBaTkxFSnF1SW9lTkNMT2lkOStnWTZsdzdMTXVDUUpWU3lP?=
 =?utf-8?B?R1hBLyt1eTdqZ3NXTXdIcHpvcy94UzFFUXpVQ0tNMXNXQkF3Q2kwcVJxeThm?=
 =?utf-8?B?TEgzaUFwaDRkTWNQekpjS0oyOFNQK2NwczZ5cFd6LzMzWU1nWWYveUlxVXZB?=
 =?utf-8?B?Nm9HVHcrL08rVHhPcW40aXlLTzFBdHBpOTZVYlZNK29TQ1o5ZngrTDh1YkZy?=
 =?utf-8?Q?+7RP2d+zg/2i5n+DKdnb45rMV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9104d4fe-9a04-4dab-2e85-08dc96731c0d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:33:52.6292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOvTbxEKR4QTxpMzH1BkuwWde6antpfylgVGPrCY5O8jXJUql6+hnsqYMUf1RNIS+RFpCo0h5ISdxM1WYdRl/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473
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

Hi Heiko,

On 06/26/2024, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The state right now is that if the panel has the burst-mode flag it
> will take precedence over the sync-pulses mode.

Yes.

> 
> While sync-pulses are only relevant for the video-mode, the burst-mode
> flag affects both the video-mode as well as the calculated lane_mbps.
> 
> Looking at drivers like the nwl-dsi [0] it only enables burst mode when
> the panel's flags do not contain the sync_pulse flag.
> 
> So handle things similar for dw-dsi in that it selects the video-mode

This doesn't seem to be necessary.  DSI host drivers may choose video
modes precedence.  DSI device drivers should set video modes in the
flag carefully, as any video mode set may be used by a certain DSI
host driver.

> with sync-pulses if that flag is set and only after that, checks for
> the burst-mode. So panels selecting a combination of both burst and
> sync-pulses get the sync-pulse mode.
> 
> The case this fixes can be found on the ltk050h3148w . It does need the
> lane-rate to be calculated according to burst formulas [1], but without
> sync-pulses we see the output shifted around 20 pixels to the right,
> meaning that the last 20 pixels from each line appear at the start of
> the next display line.

This sounds like ltk050h3148w abuses the video modes - it actually
uses sync pulse video mode, but needs lane-rate be calculated by
using lane_mbps instead of pixel clock which hints it uses burst
video mode.

Is it a panel initialization code issue or DSI host/PHY configuration
issue or clock issue?

commit e5f9d543419c78ac58f3b3557bc5a76b20ff600b says ltk050h3148w's
driving controller is a Himax HX8394-F.  Looking at
panel-himax-hx8394.c, "powkiddy,x55-panel" is also a 720x1280 panel
with only MIPI_DSI_MODE_VIDEO_BURST set and a different display
timing.  The panel is in rk3566-powkiddy-x55.dts, which means it also
connects with a Synopsys DSI host controller.  Maybe, you may try
that display timing with burst video mode?

> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/bridge/nwl-dsi.c#n301
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6c9dbee84cd005bed5f9d07b3a2797ae6414b435
> 
> Fixes: 93e82bb4de01 ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode")

commit 93e82bb4de01 follows the current state to make sure this
driver chooses to take burst video mode as precedence over sync
pulse video mode.

> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
> resend, because I messed up and somehow forgot to include _all_
> mailing lists.
> 
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 824fb3c65742e..28dd858a751bd 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -605,10 +605,10 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>  	 */
>  	val = ENABLE_LOW_POWER;
>  
> -	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> -		val |= VID_MODE_TYPE_BURST;
> -	else if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
>  		val |= VID_MODE_TYPE_NON_BURST_SYNC_PULSES;
> +	else if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +		val |= VID_MODE_TYPE_BURST;

If the precedence really needs to be swapped(which again doesn't
seem to be necessary), then change the precedence in
dw_mipi_dsi_get_hcomponent_lbcc() too, for the sake of consistency.

>  	else
>  		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
>  

-- 
Regards,
Liu Ying

