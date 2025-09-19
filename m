Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD8B88888
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 11:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1DB10E22C;
	Fri, 19 Sep 2025 09:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gtiD4oQN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013020.outbound.protection.outlook.com
 [52.101.83.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652BF10E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 09:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+8TW6b2XdatmJXoGQal+SMVhxkl6ICT+59CYGMeqpKq32joSh3QoVezHHJ9edH2oDaVzhCBHgocEOFan9x8fs390+cU3c3JGQskxL9JsvfgHHPduYlFzBapy0v0Xwpmoc2WqntmPvM3cZMvVfo2oJSiAETNi0qUJXas4/EEenvIK3jxqOcNtxxr0I2EmxSst5m+w5EDB9Fy1dwXJew95yGRb3JtfrCmAEMWM/Ho81F2oF51lx1wEtn2F8JD60bbPy83dNr0EjAHzH7jjzHhATLa7stSA9qlQ20F4oeFl8HPNxmfPMNxU0PTvh3O149a/IDu//HBL7jmWhYpnYu5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p81yK+o/h/+o94yvCinssbPqd0qkrixwF5iknpA4rmw=;
 b=MESnKjquKhoKAq3LtPI2T+EdJOveL70ZoABBJcBstfoPdz3JJxiKZDPrushzrbZ72ActTQd6G1nxi/l6q+MpakH4Z20mysnCDfKER4u5eHVGRuU0X+E+dv17SM9omMkdvQGf0ORaiMhhp1XeD2Crn16ocWvI0xDXDgf6XJs8gImRLFJ1csWYxSn2oe0BbOuCNqV8Ji1hNkaS2Aa4btkLPAt5YM/SdEWwjnqQbz5wGnxB+n3ax3xQ7Gt89jAnFn9vSykwkp60fXdFIucuF8x4pJp9+EZx+J0NUAn9ZYi78RJGRhGP8XHu5tIOEdKQ3pCcjRebM5KKeOndj9V9pqgjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p81yK+o/h/+o94yvCinssbPqd0qkrixwF5iknpA4rmw=;
 b=gtiD4oQN35x1Y6ANJLwheXR/4Z9TS3rn5UV6ym3gbf6PHwuJ92WBSoicDcIkF7Q5ktHLecbxQJDfVmSkUlWU7gfLgzE79CPIi9oreQ/5m2j+BaJiPCQxIYJHXlKeA9qZR6itjw9O8sKqzbIZzF8GRWYuryspJLUK0jukqtHTRjwKvNVAx67FURbuTrGZIkqT1dIofkbUn+y267Q7YLmmKlJBvbEI088mAjyAQ9mG6cPxDxaUQeGjGd1BmiVJFL3H6a9qYN91/p2Zq+RXFNUt5sgikCkjTYyppExuN/IgdYkZu8+EZmdBqSxd71XpESgHyFdEs2NolmgnZXAPAdK8Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10429.eurprd04.prod.outlook.com (2603:10a6:150:1da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 09:18:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 09:18:39 +0000
Message-ID: <77840bf0-7dec-485b-a531-aa12b033ee45@nxp.com>
Date: Fri, 19 Sep 2025 17:20:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] drm/imx: dc: Use prefetch engine
From: Liu Ying <victor.liu@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <10a9b4e1-c777-4e63-86f6-134d6100d70a@nxp.com>
Content-Language: en-US
In-Reply-To: <10a9b4e1-c777-4e63-86f6-134d6100d70a@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10429:EE_
X-MS-Office365-Filtering-Correlation-Id: ad331c55-fa8f-4392-5ece-08ddf75d84af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk8xcnFKS3VBRXFXbnVNSmRGUGI2Q1BMbkRFZ0dIWjlVOWU3SWEydnk4MmVy?=
 =?utf-8?B?T3Rqb2F3dkJTQ0Qyd25kUHRSQmZSUDk4V1JWTjJRWVV1ZG53eWVTU1BYM3pT?=
 =?utf-8?B?c0xBSmkwenRkNHZ3bi9GamY0Y25NeWZMYUlnZy9oWUJWR0VWU0IrUUZSSDE0?=
 =?utf-8?B?eUVNSDlTdG1sWXprSktmSjliWTY3RFJKbEF2Z3BTMXBVYzhob2xLVFFwdUd2?=
 =?utf-8?B?YkdjbDI5em1yaXNtKzNVSzcrVTZEYUMrT3dqbUFlN2ljSDBMTUpzbjJCaEVh?=
 =?utf-8?B?R3FqN2M4Umh3S1FZb00zYU9ydWZ1WCsrMzBBZVJ3cG4rZUhJakZNc1NjOTBt?=
 =?utf-8?B?UUthL0hNNTlIOUlRbjZVdmVkTFZsTUlERnZsMlR6a1Z1VTc5bFo3cnVqb0ww?=
 =?utf-8?B?Yk02ZWgyaUFRQ3NOanlTQ1VxQ05YU1dieis0eWdzbXZOTFdNanRkZVpvQ0pi?=
 =?utf-8?B?eSszL3RiOVhxQWFEZnE3dkw5b2c5aVJCR1F3ZHN5SEYySEJtWGhRaStFVWY1?=
 =?utf-8?B?TWs1OUVPVkcrdUFtdFZCbGs5dXVEY3FPeis5aFhqbGxnUmZScUZMM0VybGNY?=
 =?utf-8?B?eDdJZDZ3SU45UEY5ZFMrT0NnYW56RlpMRmh1MHo2ZG4rTWpINjdpcTdxR0R4?=
 =?utf-8?B?WGVvaktSeUZFTmFUMnRUSUtoTGE2UnhjVmV4UlR1Vk5hMi9vVXdEYk4vNjc4?=
 =?utf-8?B?d1hlUlpETWFWMUN5dkhvYm1iVjNNYnRtRWNSOVBQZVFqUFNvVmp1QWJTZ20y?=
 =?utf-8?B?NW55ZGczM2JsQkxTUk83VjJKRll2emVIRk9yLzVMajFFVnFlSnpBdjBSSXRp?=
 =?utf-8?B?SGFkeDNQbGlqbzIyTFd0eGY3R1hydXkvL1AvQXJtendBQkp1Vzhjb1ViQy9m?=
 =?utf-8?B?Y1dLVFlrT1VtUjF5TlVza3hMTFRMdVVtcEFZYTExZ3FKb1NEUmpmRjVxN1FX?=
 =?utf-8?B?eHJJaDJnMXQzSWpMR01WdVVPclJRbm55Y3V0ZVlhRlBjYmo3MCtJa3pQSTV2?=
 =?utf-8?B?b2NSdzZka0JCS2pGVzV1NUZuMkxGbWE2UnhSOFc0NmRSZFhEVUcxd1FGRXFO?=
 =?utf-8?B?K2dJR2RRWHArS3NRQ1ZUVlRIbWZWdXRRblZYcGtaWHlNM0NnejVFc2Rxb3o3?=
 =?utf-8?B?NUR6SmlUUk9sS3dRMngvb1J2QXhxYUhBTkdFaSthQ2JUbFlEZVFnYnphMHVE?=
 =?utf-8?B?aWl6anRMQkFpSVFlTUR3NEg0TTVGcUVzcFREQ0plY3pnMzRSemdkeUM5V2NC?=
 =?utf-8?B?V0wzeXhsazVQeWRYS0NOck5Xb04rb0RGZmV3cjFRTHN6MGYvZU9WdEx2Nm16?=
 =?utf-8?B?ZGsvY3c0NnVYdE50dzNhSTBJeHp1Z2NXSmtod1VZbDFhd09mNGFqYzhMTHhv?=
 =?utf-8?B?S1JPUEZseTdRY0s4cnBkMGc1a2VDRUkxK3V3UDVSNENJUG9zczZONkFzQTY5?=
 =?utf-8?B?Tmw4YkVoVmxXMkhEOUN6Wkp1bllJSC95eEYxUHlHeE1EMjFzcW9uVmRvQ21R?=
 =?utf-8?B?QnNJWk5wSmFSWGErRktMNWNkaHNwYVdGTEp6a05WRm5OWmxsTUFhcWlhaUVL?=
 =?utf-8?B?bGF3ZDVaVUJUZXpPY1BEaFVaRVo3WjVVTGFmbS9rUXV2Tm5WYXdIVlphZlRE?=
 =?utf-8?B?Mlg5YmxiWWdZZUg3MUhGZ3Q2eUpBOGthS1Z3U2pHT3J2b2I0NFA0RDFpWEY3?=
 =?utf-8?B?WXFVN0hpVlpaeVZJMDc0LzVzSm91RzJJTjU4OFdsRVVtTGdkWnU1MFovdzls?=
 =?utf-8?B?S1NlVXgvci9CSmlkcUgrQTZPbTIyRzZxMks1RkxEN3R3LzJQWnIxbE9PZ25N?=
 =?utf-8?B?dXdJQk1jeVpZeDJKZEtoYVdJbkhXTWp2OHptaDIzeHRzb0JxL0EraVBHWllw?=
 =?utf-8?B?ZVVWNFhwZzQvQ2U0THo4M0I3d214QnljUkYyK3hWbndPVmFVZnlaeGJ0ckFq?=
 =?utf-8?Q?IUSuw0A/HRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akZheDVzOFV4TlhtRjE0OTlZUlFwYVIxWStGSUEvVzBid081Q0NHVVIvZ0FG?=
 =?utf-8?B?Z2VLK0IzRVdjU2FLM2FCc0NkSHpjZStkNDUzVHppQUtuM3p3MENHQ004d1hR?=
 =?utf-8?B?NkF3ZHpGcStpM0VQemFHbzR0UGVJMG12Uy94ZGpKeGQ0WHptdkQ2WkFXeXNV?=
 =?utf-8?B?SFMwdlZnaVJMZXNMckxua1VPRFFURnBZVU5sVHU1UVdOaWp1bkdLcFgyMy9w?=
 =?utf-8?B?YzVxcE5EL2pvdXBIN3ZmMkN6RjByWG5oZkFZZnQ3dkhlZjFaeVBXK21WTTRs?=
 =?utf-8?B?eGRIbWwzaDVTNUxRN1NjVllsRjdxYy9Vd0pvTGV1dC9FOXBpWUdaTC9iZUR4?=
 =?utf-8?B?YWJTWnkzVUNsWGhyeHN5TFI4SUxEVm00eC9jaGcvbnJUcUdlaHFPcTE3SmFW?=
 =?utf-8?B?QUJsVGpQZWEwK0dwM0dVaG15VndZcEwxOGIybDZFam9raHJJM0pobDVxdlRp?=
 =?utf-8?B?YkZlZ1M3L3V1d3prSDdSTW1aOWlMbkdCNnlwMldlNFZXdDczbWx4b3VubjlL?=
 =?utf-8?B?SUVBd09FelpJQTZIYkdtZGFRSE1YNTZGUVFhbXhWa01UNlVQUE4xRitQTVZu?=
 =?utf-8?B?VWZjazlCeVBpWlc2RXo0eXJ5d212RzNwSTArQXBnbnlVL1d2K24rSHdVWERJ?=
 =?utf-8?B?ejlXWWluK1NYb0E0ekJ4Mk5NR2Qxd1poc015ZVd5WkJtY3NqdzN1eTByc05F?=
 =?utf-8?B?Q0VudHNTQ2R4dkxQVnNNaW1NOCtmNHFnWUpFekJ1L0l0WUhOTGRtdUc4N05F?=
 =?utf-8?B?UDhIQkdNRENZakNoVWFQK01QRk1iSlR0UnlRYmdqVmVPQ0JNSVdXeTdkSFlW?=
 =?utf-8?B?eFpNZXNnS2NPOWdFQ1c5YmtsWis5LzZvOThOWGl4MGYrOGsrV0IxVENYWXFM?=
 =?utf-8?B?OEZCM292dlRGV0MrcEpwK3lBWnVLeXNrc0VUUTlVb0lKbHhFQnRXYTg2YW5k?=
 =?utf-8?B?UCtaRW82QjRMZGZ5T0JyRnFZclovaEs0L3htZHprczVocEJub2Ywa3A3WTBy?=
 =?utf-8?B?amFURXNGVS9pdlBrVXVpN2xRMVNSVDBnNHhUT3dyL3puK1g2US9teEhjVVRJ?=
 =?utf-8?B?cEpaOGt2blNoQUVQOWdtZU1Hd2lWWlQxejcvd0hzQy9jT3lIMlFhR2ZBM1J4?=
 =?utf-8?B?Y0E0UEduWjJXUXVKdmZ6ZTJhRmd4TGNIRnhHY1VjYTM4ZEtqS05ldnI4dVJC?=
 =?utf-8?B?RU1WSnFBZmFyL0doMFlOTUZBUm9VOHhsRXNUQU4weFFlT1NBV0xhMjFVM1BK?=
 =?utf-8?B?L3cwYll4TXRyUUFVWEVjV0sxMlV4emJUcmwwbExTdEN2dmtXeFRKeHRYVmhl?=
 =?utf-8?B?cmNUSHA2bXpQZ1BUV1F1K2dXTjRiZitaR3JPQ1oxaS9jNzRmWEROMGVNRFN1?=
 =?utf-8?B?a09EMVdKMWVhdzhVeGNtN0hPWjdPdVpsOHZoSWhkTzNxVFhDVm1GV1ZZVUhm?=
 =?utf-8?B?MG9MdS9vQlpnM2VLU3JVb1BQdDZTQUhXcFpCeDR1aXZBVVdIMkJScGxaUndB?=
 =?utf-8?B?Sk1keFU3U3AzZEsrL0xvb3UrUzAxc2liUjlMSFNCOGpPNWVhL0RaN3cwemxn?=
 =?utf-8?B?eFd2YTdSeWJLVUJFVmNaUDRNQUxhNTJnSlRFdnNFYlpraVp6eCtlQXBkSXZE?=
 =?utf-8?B?UlVtL2ZiT3NaQ1hBU3RkMmVVZC8wczRNMk4wRitYWStvSGxMd2drUURValhh?=
 =?utf-8?B?SEhuVzByT2Y4UzNHNmxNeFpKUUZPNXZZQ1k5TkJkODFoSDc5MnNUSzVFelRU?=
 =?utf-8?B?WjU5bnppRnhVSkt0R0tqRGJaeEtEUEFtZElGN285cnJwQXAwbGRCc3dvQ2Vu?=
 =?utf-8?B?TEltTHFvbmQ0SzZXekhicVNQNmFRblRaVXZnckR1UWFFeUlKN2pKejhPRFND?=
 =?utf-8?B?MVhCUmFOM2ZWZnpDU0xJVEFNa3BiejQrSFBYU1BzVHhYc0loL1NqUm5teWxD?=
 =?utf-8?B?SGxjY2psN3JMRWZxb1JVK2tVcTdVSUhrcVV5UGcyaHpham1DeTNmNDVySURT?=
 =?utf-8?B?MDQ5dCtYbU4xTWRhNGhNUW00a0tyeERQZmwxVEY1VnR5SFV5Ui93ZHhoUkpW?=
 =?utf-8?B?UTBTT28ydWc2Vk1RSjFWZnpVUmV1UTByKzM3OGt0UzUyTHN3bnJjcURCUE41?=
 =?utf-8?Q?GjciRnSIm2Fed54Rx7dEhKESx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad331c55-fa8f-4392-5ece-08ddf75d84af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 09:18:38.9939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2COtK1XyWQxEM1Y/2YjJv9cgwqCm92/mkeFLnTZHAWnFQkZL590QAYMEn2/TRX9nZaBD88A50jf227tT/+HGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10429
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

On 08/12/2025, Liu Ying wrote:
> On 07/04/2025, Liu Ying wrote:
>> Hi,
>>
>> This patch series aims to use prefetch engine in imx8-dc KMS driver.
>>
>> One prefetch engine consists of one DPR Channel(DPRC) and one or two
>> Display Prefetch Resolve Gaskets(PRGs).  It prefetches data from
>> DDR, resolves data in tile formats if needed and outputs the result
>> data to FetchUnit(s).  When one PRG is used, a prefetch engine supports
>> processing pixel formats with one planar, e.g., RGB formats.  When two
>> are used, pixel formats with two planars are supported, e.g., NV12.
>>
>> For now, this patch series only supports prefetch engines with one PRG
>> because it is enough for XRGB8888 which is the only pixel format
>> supported by imx8-dc plane driver.  Two PRGs would be supported by
>> future patches.
>>
>> Patch 1 and 2 add dt-bindings for DPRC and PRG.  They were reviewed
>> by Rob[1][2].  I slightly modified the patches' commit message to use
>> imperative mood.
>>
>> Patch 3 adds DPRC and PRG dt-binding files to MAINTAINERS.
>>
>> Patch 4 fixes FetchUnit dimensions as related to prefetch engine function.
>>
>> Patch 5 disables CRTC at boot if needed to support prefetch engine better.
>>
>> Patch 6 and 7 add PRG and DPRC drivers.
>>
>> Patch 8 to 13 do preparations before using prefetch engine in imx8-dc KMS
>> driver.
>>
>> Patch 14 uses prefetch engine in imx8-dc KMS driver.
>>
>> [1] https://lore.kernel.org/lkml/20201207165945.GA430214@robh.at.kernel.org/
>> [2] https://lore.kernel.org/lkml/20201207170206.GA434964@robh.at.kernel.org/
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> Liu Ying (14):
>>       dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
>>       dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
>>       MAINTAINERS: Add i.MX8qxp prefetch engine DT binding files
>>       drm/imx: dc-fu: Fix dimensions
>>       drm/imx: dc-crtc: Disable at boot
>>       drm/imx: dc: Add PRG support
>>       drm/imx: dc: Add DPR channel support
>>       drm/imx: dc: Use TCON operation mode
>>       drm/imx: dc-ed: Support getting source selection
>>       drm/imx: dc-lb: Support getting secondary input selection
>>       drm/imx: dc-ed: Drop initial source selection
>>       drm/imx: dc-lb: Drop initial primary and secondary input selections
>>       drm/imx: dc-fu: Get DPR channel
>>       drm/imx: dc: Use prefetch engine
>>
>>  .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 100 +++++
>>  .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 +++
>>  MAINTAINERS                                        |   2 +
>>  drivers/gpu/drm/imx/dc/Kconfig                     |   1 +
>>  drivers/gpu/drm/imx/dc/Makefile                    |   6 +-
>>  drivers/gpu/drm/imx/dc/dc-crtc.c                   | 191 +++++++-
>>  drivers/gpu/drm/imx/dc/dc-de.h                     |   2 +
>>  drivers/gpu/drm/imx/dc/dc-dprc.c                   | 499 +++++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-dprc.h                   |  35 ++
>>  drivers/gpu/drm/imx/dc/dc-drv.c                    |   7 +
>>  drivers/gpu/drm/imx/dc/dc-drv.h                    |   5 +
>>  drivers/gpu/drm/imx/dc/dc-ed.c                     |  27 +-
>>  drivers/gpu/drm/imx/dc/dc-fl.c                     |   7 +-
>>  drivers/gpu/drm/imx/dc/dc-fu.c                     |  49 +-
>>  drivers/gpu/drm/imx/dc/dc-fu.h                     |  11 +-
>>  drivers/gpu/drm/imx/dc/dc-fw.c                     |   7 +-
>>  drivers/gpu/drm/imx/dc/dc-kms.h                    |   7 +
>>  drivers/gpu/drm/imx/dc/dc-lb.c                     |  23 +-
>>  drivers/gpu/drm/imx/dc/dc-pe.h                     |   2 +
>>  drivers/gpu/drm/imx/dc/dc-plane.c                  |  46 +-
>>  drivers/gpu/drm/imx/dc/dc-prg.c                    | 335 ++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-prg.h                    |  39 ++
>>  drivers/gpu/drm/imx/dc/dc-tc.c                     | 114 ++++-
>>  23 files changed, 1545 insertions(+), 30 deletions(-)
>> ---
>> base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
>> change-id: 20250703-imx8-dc-prefetch-028e306591c6
>>
>> Best regards,
> 
> Gentle ping.

Ping for review again.

-- 
Regards,
Liu Ying
