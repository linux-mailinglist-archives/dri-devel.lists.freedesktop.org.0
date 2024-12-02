Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B229DFABA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 07:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3554A10E265;
	Mon,  2 Dec 2024 06:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hvE6HR11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847D310E265
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 06:31:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ/N0wZhwdZ20zMF44/SzPdupkVA9GK/j4vPBaR0C+ruDOi389qhRUYd4RfkBUTxMjase2D8KBLkGSVFh97C+DhEGZFPnZ16ikEiaZVjC9Mca+M/Mxb2Gn10HMCEMQswFTFPVJkrPHfuVhdtHlrTIxqS+ltoDTxmOyEDUmAkHa4roktsJTSHU9LJ84RpfOOgdESqMM+8CLk52Ip/cFcSYvtY+ZONqskhWKCjmGo9QWAl11366BVldnrO5KaMxLWC2NLMYsnF5kgCUL7rndlDSBWnhBm73qHXkQSA8D41f3fKK26AjfxbEb1sJghjgc8U4hZRrtcQoTCqxD4hefodtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcHnHbRFcV6x7uEdtbf/O2hZX6FUZCQf6I9tQjBkuSw=;
 b=Y3IaQVAdpbp5cJQD0ZOqLOmH0ZCgzWLlJ10Bv63cezfLCf6x5OUEO6vg+xMQRtLWfYyAkMKxx1RCqfDz6c3j1uM0Cyje0sc+0qfKpfaleO4gxXuQIuhufbeWY4brZiLSZnP9YhRgnEeBpfvJCaeO4ceE0fDe032FzAbvOaHpo3cnLNStda61pH6DlwGh/Zy367691rUmlKzUXPmnpkVLusO293t1yRNr1BYu541iLDsIMbK11s7SuGWAPGjAOcc4C7+FXkfuC4Xi07aHYA4/eTj7N8+mbgW+xW3UXXhgcwBMFl48cJcGbbFvXqWqhZT2/BcGjwIzJZgrP3u6iOxIIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcHnHbRFcV6x7uEdtbf/O2hZX6FUZCQf6I9tQjBkuSw=;
 b=hvE6HR11qkRMfm1+TlpK+KjWmBQT817mfPWhtHoLndi8U2p6lj6XtkjTa3vaH6RWP1usZPZFmSD0M9niv0sE17bw1/SV42qThdGFT2ypEJnwn1FGyn50ko2XQFMMPjxA8PVMhuigFcseASRgnqh6kTlJcfcuYByLQwlpt/epl5rJbvgUv+K0kczah1d+t5J9GsspGXtEQkSKyNcMYFQR+7vtGkdyIXAmXkJeW0kLi+utShsXXLfMXS31fQ2zOYhocyZ3Ug7stiFzsfH8VuVx2VOLkVR+qykWTWt8rpNG7FtJD5vI0RqjoQpokt/KhVj9cdIcR3Rs7CUtulMrkpKtAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10930.eurprd04.prod.outlook.com (2603:10a6:800:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 06:31:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 06:31:46 +0000
Message-ID: <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
Date: Mon, 2 Dec 2024 14:32:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Nikolaus Voss <nv@vosn.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nikolaus.voss@haag-streit.com
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
From: Liu Ying <victor.liu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <20241126172610.AD8B51622C@mail.steuer-voss.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10930:EE_
X-MS-Office365-Filtering-Correlation-Id: 17533da2-0cd5-4a4f-19f4-08dd129afe71
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVJtbi9uc2V2UzBGTlQ0Y3lpQUEwNmh4c2hnMSsrNzZRRTJ4UFB6WnRxU3Bu?=
 =?utf-8?B?RHJBWE1DT0sySDFmdWMzY0VWSXhaMGd4OXB2RTc0WEFJN0oxRmlONm4xay9G?=
 =?utf-8?B?a3ZyYUVsNWR2R1FWbk53L1hOQ0gvVmJuVEdDNS9PRm5sTWpLWHYvQmFpZHNr?=
 =?utf-8?B?UlMrend0b3hWRTdCbnFiMG5YV0JvYnhzUkw1dXUwMG9mUEUxMnpwVXVKdURU?=
 =?utf-8?B?TkxmUFRORnZpWUNFQUdzVVpmMkFyMFZsZ0JOT2ptbWp5cGIrTnBqaTRhYnBs?=
 =?utf-8?B?bTczRVRyZGx4NDVkc2lOM3FZbGtVcjk3MHo0SytPaFR1YmlMRmpYYkxldGxr?=
 =?utf-8?B?SlRHQXJ6TTA3TDZXeHgxV0dtRkEwa0Y0MFJFOWdEZmdaNUVDcG5pSEFOZGFN?=
 =?utf-8?B?eXRvYkIrd3g4dk1PbklKZHpoVSs1K0hrZ2FxMEpONFcybzlia2lvT0o2MFpt?=
 =?utf-8?B?alBvR1ZHQU9wWlFkTHZpamIwQk15bGxHSi9oWEk5eDhsck03WDgzN2tYSEdx?=
 =?utf-8?B?elJQNUYwUnEydXVSWXp5Z09TKzZGRjF6RGJuQTlWSVJCc0UrRzlLK1BHZisr?=
 =?utf-8?B?Y000K1JwWWpHUlNER25oU3NGVSt3dnQ4UFB1U3EzZm9kMWdaRmRpWFVVblZC?=
 =?utf-8?B?bE9IdXFFU1hxTUpPdGZyVDdML1MyK1pYR0lRcEljck8rYzBKeEEwQXNESlQ5?=
 =?utf-8?B?SzRpTnVvdHJoY1M2eHE5Wm9JaXRpb2ZxYlVaOE9TRXc5WFdubUtMUXJxVzhX?=
 =?utf-8?B?dHd5U3hwa3c1WXpIVWJnYWFKL3lsSUxRSEIvOEwzRE12WFVqdUREUVVaaVEy?=
 =?utf-8?B?SjVhSm93SHNWYWpSZWU4TC9rMWFwcmxhOVJGZkZROERRa1hKaldHKzZ6TXNa?=
 =?utf-8?B?WVNlUEFRYkErTTdVajQzMmVJb3hhVXR1U1ZOSjJvNE1EL3Iyd1ZwS1lLOTQ2?=
 =?utf-8?B?VCtQbDVyYURXMk1UUk1zd0NPS3Ayd2p5bjIyL1FPL0g4Uzg0YTFiWjIvVnJR?=
 =?utf-8?B?ODgycmo1SGxTVVFYR1VkL2hnUDVmdmtUWERQSUtlVlU4VU5SaHZMMTNEZUdw?=
 =?utf-8?B?KzcvWDdFcTkvZGZBejRZR1UwSXgxdm1OQkw1WWFoOVlHcGJISHhaM0l5UWpi?=
 =?utf-8?B?ME0rSi9XVW5MMi80bXQ1MGtka3VwZUk3RENxNG53MGdqSDd5eXA5S3JsZms2?=
 =?utf-8?B?eXRCU2ZiK3JoQUw1OTNNRWVpUXBqYjVTVExUbnlGa3ZiVm9ZclpUbTNHbVVx?=
 =?utf-8?B?NUQ1NTM3bWJqMStCcG9KQllqMjR6dUs4eGk2ZDc5SFFOS0sySUJkSUYrZHNo?=
 =?utf-8?B?YXZudFQ2b0R4QjV3eWcwWEtka3orRHpyYVhIZm9WTHJYUE1YbUhmcE8wdmla?=
 =?utf-8?B?NndmL0lmdzJyWk41VG1rT1cvanRQVHQ2UDBaaElSM0FsYi9ubWpCTmdwQWNM?=
 =?utf-8?B?a1JXVjZQRHEyTGdJWUtCY3VyLzFSQUJCUWFCc3RYanNETElSZi9jWjFadVRI?=
 =?utf-8?B?YVdGRUhGY0pvTXpUK1pSdlZidGQ5cUZGdTdieFBNYWdCUlUyV1V5VFRzWWNi?=
 =?utf-8?B?bW9rUFBtdDBrUkFJS0xQU0JXbklpMG1KTXdTbXJKd3J0SGNOM2dsMk5qa0tw?=
 =?utf-8?B?T3hRRzJqRGxwc0FBWTViV3pTOTVsUmd2cmtjTiszdERmTkE4bUFycW94SjFS?=
 =?utf-8?B?a2ZNSVBwcW9vOWhsdWtQUXAyRzFhMmVRSmZMd09PSXpjQ2xzSnoyYXZabmhN?=
 =?utf-8?B?WjlQTFhJNXJncmkwcmNRWE44eUpvaEw3ZFlVM3hEQ3A3RDg1dnQxRUNwcVJB?=
 =?utf-8?B?czhqcTJUSHNZckMvZnRabmkxSWRjbDYveDVDWmNNeVZ5MGdBcG5LbDJOdkhO?=
 =?utf-8?B?eWZlL044UWdtN3dDeFhJdGJ0ZGN2RlBRMnN1cWJnenpoT2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWdqdkozblo4aVVNVHdva3pUTlJZM0pMTkRzamUvUnJrYk1WMEFRak92YTNI?=
 =?utf-8?B?TTRzd1BSNmYzMzBzaUFWVnJiYVc5WHVhaHo4VlRDcGhDSWZBM29kWjRlSjNZ?=
 =?utf-8?B?TUh4dllxbURaUWZWUWVIM3RHUm03UkxLc1ZZTmVpNyttSzBkZjQwMk1ra08v?=
 =?utf-8?B?T2JNZzArSUdLWGY4cDlXeE9GWE0ycUtNbXh0NlZURWtVMCtsc0w4NWJvcnJs?=
 =?utf-8?B?YjZNYkNUdmFpd1lxVTROcW5EQ1luUUdZYm1MV0lpV1UxNEo2K0JzVHR0bitQ?=
 =?utf-8?B?Um8wUSttZFJ0bGltZng5M0dPQUJmTVYxakpkbmlRT2g0c1E5KzZWM0pkMWha?=
 =?utf-8?B?UUp3dDBSNjdmVEE2aW9ua0xCbUJsR0NtclRjamtRT3F1WFNzc1FhaCtPeW1R?=
 =?utf-8?B?RldHVFdMTWc3OVFoeTUwdmZMM1JtcTBScUtLM3pnblBBUFQwQmJwVmxhbEtm?=
 =?utf-8?B?Q05VM3JyTm45ay82djhYbEgrRVh5VjNEbUJuNU5NN01NYmxsNTNNdUN5b3pS?=
 =?utf-8?B?ZU1LTEREWmN4VkpZVDZGK2FEOUh1dHNJdnpNc2MzN0pkbVJ3UGp4WDVOYytE?=
 =?utf-8?B?Y0Q5cGdEZkdSSTQxTVVTUG4wc1YyNUFRSmhqMGlXcDdMQ1ZrTW12SjdnbjRJ?=
 =?utf-8?B?dlFxNWZXMS83WWZweUpxRVg3M3htTk5NM2s1S0hkdmJZMmpOQkZ6V0xjUnU0?=
 =?utf-8?B?dThjVmU0eU1YT05oVWFpK3Ywai9qNGxoWFZaeHYwTkpFSlhpUjlBQ044MENN?=
 =?utf-8?B?dGxmZzlqbUkzM0RCanhmUHBZUVpSUU9DazFZN2xVTTlvODJneDFsRlp4US9R?=
 =?utf-8?B?NXIzaWk5dHZKZGQ1am83WDZwNWxkS3ZWMHRSOWlIOUZwRkVhRmRFMTRyRUFH?=
 =?utf-8?B?dVNpSUtmcjlXSGFDaUJQQTdTMDZadkZpeGcvRFc1aHhxNHNLUnlwVm14VmZ0?=
 =?utf-8?B?K2JQaFFNU3pBNm0wWDc0ZHU5VVJyTUtXUEZscGFzRjMrL2ZZZmIrRThjcWxL?=
 =?utf-8?B?TmhBRHQydWNiTHdkVVlrcVB4eHVzWUxSYkk3aCtRQXMyWE44RE9PYnR6NEhK?=
 =?utf-8?B?VXJ1TlhRMVZ2Y2RReXI3NkhxNlpTR3p2eHhoL1hUWXd5RmdtQkllQjMyRlN0?=
 =?utf-8?B?blFNb2pnYzdJS1gvM3ZTa1JVaGdSNHl2NHNSamk4RjZNOC9pbGxOdWVYTk9R?=
 =?utf-8?B?OHRkN3JVTHFGUmJhYTdadkxLWDZzRk16MFlEWWVtNi9GWkp3bnl1NkRXZEtr?=
 =?utf-8?B?cm9iSmR6SCtqeWlKQlVkd1ZVaC94VEVvVmNjWk9CS0VOZ3REQmxDeUlqV1cy?=
 =?utf-8?B?R09EVTJlaVM4Y09wN3VyZzhDY21ZeUJXZlk0eFdPcUk4RUtKbGs3VTg3eExV?=
 =?utf-8?B?V2ZHWnFIWVpMRFBuSktSUlM5YUhzb3paajBNZHEzY1VYU1NsbFVGcjM1WTI4?=
 =?utf-8?B?VGN0Vk1wM1Q2enpKL084cmlqK3ZKOHJoVW9ndk53T2lhazU4eUdOYU9HdkFS?=
 =?utf-8?B?d1dRanRDT2pNMGZYakpkUXVTOXhkWmdrWXFxcUR0ZmpXMS9INXRnTXhBa3pT?=
 =?utf-8?B?Q2FueHVSSms4WHcweHVsWFYrejF5NjE4VEwxVkVxdVdlUlljdVQ1cFhOWGdU?=
 =?utf-8?B?TC9RSEpEWkNLUGVIMGdLcVpNNndibWlVelNRdkJmSE9JSW1SU2h5YzNrMGdw?=
 =?utf-8?B?cTM1MEUvaWhSNHRyQTU2T2djMUM0MGNNRGdXeVFFYzdqSDlidVRaMFNJZkZG?=
 =?utf-8?B?UVdWcDJGekJvaFZKZTNoUnFLQUlYT1U3VWV6dWVHaDkwTXRnOHpHdmkrTlV6?=
 =?utf-8?B?TjdsYUE5M1o1cUh2dTlCQlhPNUdDdmNIRHloMk16M3J5NmpaNFlMaVhjc05S?=
 =?utf-8?B?VUpINXFrRnBmbFVqd0RTc0VHaWNsVUJucXFsUURwRFRaZGNEdlprb0tjOTZt?=
 =?utf-8?B?WFhmZ0VvdHVqUW8ra3I2VUpjM0lSdSsxSENiNkVtNGdkUWVIVjlXSlhsaENi?=
 =?utf-8?B?SWM5QVZOdjgxenE2QXZtdWRUSlRYekEwN3dZdDdDNkcwU3FHV1dnUlNndnVW?=
 =?utf-8?B?cThSRFFOeUJGSE5uQUtjaXNabmFhb1JLRnF6cDdhSm9wbE45bTNnM2RhYzA3?=
 =?utf-8?Q?w0LsSVXH08joUOP9PfrOLWJUB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17533da2-0cd5-4a4f-19f4-08dd129afe71
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 06:31:46.2362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJK+ktvnDAg56jvtHjGnqMeZ1ORZ7MpSgjqIdQAaciukMrtomjK+NfNvtz0k1Gq5zkjdr9gM8bbDvKKNo4o7Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10930
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

On 11/27/2024, Nikolaus Voss wrote:
> LDB clock has to be a fixed multiple of the pixel clock.
> As LDB and pixel clock are derived from different clock sources
> (at least on imx8mp), this constraint cannot be satisfied for
> any pixel clock, which leads to flickering and incomplete
> lines on the attached display.
> 
> To overcome this, check this condition in mode_fixup() and
> adapt the pixel clock accordingly.
> 
> Cc: <stable@vger.kernel.org>

It looks like stable is not effectively Cc'ed.
Need a Fixes tag?

> 
> Signed-off-by: Nikolaus Voss <nv@vosn.de>
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 40 ++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 0e4bac7dd04ff..e341341b8c600 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -104,12 +104,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct drm_bridge *bridge)
>  	return container_of(bridge, struct fsl_ldb, bridge);
>  }
>  
> +static unsigned int fsl_ldb_link_freq_factor(const struct fsl_ldb *fsl_ldb)
> +{
> +	return fsl_ldb_is_dual(fsl_ldb) ? 3500 : 7000;
> +}
> +
>  static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int clock)
>  {
> -	if (fsl_ldb_is_dual(fsl_ldb))
> -		return clock * 3500;
> -	else
> -		return clock * 7000;
> +	return clock * fsl_ldb_link_freq_factor(fsl_ldb);
>  }
>  
>  static int fsl_ldb_attach(struct drm_bridge *bridge,
> @@ -121,6 +123,35 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
>  				 bridge, flags);
>  }
>  
> +static bool fsl_ldb_mode_fixup(struct drm_bridge *bridge,
> +				const struct drm_display_mode *mode,
> +				struct drm_display_mode *adjusted_mode)
> +{
> +	const struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);

Why const?
If no const, then ...

> +	unsigned long requested_link_freq =
> +		mode->clock * fsl_ldb_link_freq_factor(fsl_ldb);

... this could be
        unsigned long requested_link_freq =                                      
                                fsl_ldb_link_frequency(fsl_ldb, mode->clock); 

> +	unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_link_freq);
> +
> +	if (freq != requested_link_freq) {
> +		/*
> +		 * this will lead to flicker and incomplete lines on
> +		 * the attached display, adjust the CRTC clock
> +		 * accordingly.
> +		 */
> +		int pclk = freq / fsl_ldb_link_freq_factor(fsl_ldb);

I doubt that pixel clock tree cannot find appropriate division ratios
for some pixel clock rates, especially for dual-link LVDS on i.MX8MP
and i.MX93 platforms, because PLL clock rate should be 7x faster than
pixel clock rate and 2x faster than "ldb" clock rate so that the 3.5
folder between "ldb" clock and pixel clock can be met. That means the
PLL clock rate needs to be explicitly set first for this case. 

Can you assign the PLL clock rate in DT to satisfy the "ldb" and pixel
clock rates like the below commit does, if you use a LVDS panel?

4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
frequency to 506.8 MHz")

> +
> +		if (adjusted_mode->clock != pclk) {
> +			dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d kHz -> %d kHz)!\n",
> +				 adjusted_mode->clock, pclk);
> +
> +			adjusted_mode->clock = pclk;
> +			adjusted_mode->crtc_clock = pclk;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *old_bridge_state)
>  {
> @@ -280,6 +311,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs funcs = {
>  	.attach = fsl_ldb_attach,
> +	.mode_fixup = fsl_ldb_mode_fixup,
>  	.atomic_enable = fsl_ldb_atomic_enable,
>  	.atomic_disable = fsl_ldb_atomic_disable,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
--
Regards,
Liu Ying

