Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147A5B2D2D3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 06:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9D110E340;
	Wed, 20 Aug 2025 04:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YX+JZvHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CCE10E340;
 Wed, 20 Aug 2025 04:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzfNFtSQEp7yO4501kMB4cke2ejJMdoqh7AKUmiqtARSyUKqFVCZRdxt/8EN+HBP9hH4ZXc3OMaGEFiww3LKjDcIygrJ812JI/2N84bE15vQWJ2n54M8eDm7EECPP1KOlkiDkWV/ejahXdM7jPymnwJikD9N7gDQ4kHEWn8KgyoNsMt3TuhCMlwgIOrMnhMC/+xRIkCElyvABTityz/jQeVUmUMrc2ZsyQrtJt9323JkEfdbq0p0tR8Zjm19GjG48Fgr0KVwP7yN0Tao0PFoeyjmbBnybuq2P75RzHsuFBHnPuFBt2NM0tu5NWn99NOvQDsPOIiVtsroD1PQ4x8wlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjaVKCFfQvQMlgtl9yklrvpCXmG+zbWbG1nJogIhIEY=;
 b=r7ciThgGrhPrYspDTlsP1P3zMlKVGGz2FN30UNbKtceE/VxSIFo0eJg+lhBAhLnUO41gm/U1MgdyNlP28ea1Odr1LDeTKrX4XXjcT0u1f2D7ezHG79CgDSDI98hIDQIOba1VHg+B9BBsnzBXxdaZDg3Gp3TpfAVF2vupYwPv3prpMCsZaKbCuvt8fvYhn01ReVZ1XdkFYLsFofOcwn/m6Q4SGAorGL1jNpAXxnAUhkX0UrjFFxt2UuUAMjsVGCLnIcaTufN/KjOEILp1IOmHWRcO7Cgl+8oBXyXqJFB6i7vFoQCYetsn0bjnjNP3OOFCaqyPso0zfC8lXfF2RYM+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjaVKCFfQvQMlgtl9yklrvpCXmG+zbWbG1nJogIhIEY=;
 b=YX+JZvHEvEYUy2hzW6nqpCxPbsWqLunGTNOhRbR4roxzPp4ldlp5YvilTxJ1zY19U6R2nkmt//jZQXmUf6Zzrjz+bo8O/MBMcPREH79drJk0el1N6jc9gPYnlXWafWGJTUhIui8AxkAY7OS+uoKr+WTTKPCaWLINWo6aWN59gF8+hRzjrRbtCHjcFXcxOXvtNKV3V/xfVu5j+On+IDnCQYsfx3Vtx5+AkVUQXfoSSgoCWKTLolnOhz6LXNKI/HSJCv6abKah3vDV2OFvV13NtVtx4gjYcDRtrNzsenthYP09T9eC4x14na0XhLJzQ7+51DPrgNB9HOwyjju88Hk/BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 04:01:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 04:01:07 +0000
Message-ID: <bba7f41a-5374-4f72-967c-07f63b176301@nxp.com>
Date: Wed, 20 Aug 2025 12:02:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-8-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-8-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c4a157-6021-4ccd-7d35-08dddf9e30e6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnZzYUw0QTFEWHQzQTlSOEVzTlg0a3F2VTl5MlJ4THhYamVzSDd4eWZuRG0r?=
 =?utf-8?B?em83ZGxETmVOcWRodlFYZG9FYkZuUWg2VzRtOU9BQWNWTDJhQjVxc3hTODJI?=
 =?utf-8?B?aWdZOGg3cU1UMG8rY1pmM3NncmRXUDhKeElhNDRIdVNkdTBwdmhZWGZaUTcz?=
 =?utf-8?B?SFp5VFNWOXVDaWxKa3JDQ1hVS3NTSk5uZWxJNXpaY21zMVdaNlpMaHRDdDI5?=
 =?utf-8?B?ZnJ4ZURFdVA5dE9JbCsrRUk4a2l6czd5QmxLUXJ1bFlOblhtY2w1WWxYTWpi?=
 =?utf-8?B?QlY5TGtVbk9Nb1JvMlR0TVRBT1V4WW5keDhkeFRkWENjZVdvaWpDSUJrdDFn?=
 =?utf-8?B?QVpkZnp3VXFML0VpcUdwWE5XZEU5Mk5hQjdoMGF0by9vNTV1TENuMUpBeE91?=
 =?utf-8?B?Szh6RUJNY0ZmTVArK25OUEExWlJvSGFKbVh0NEZvNnBzbm0yUEtvV0MyYmFI?=
 =?utf-8?B?eG1GeXY5bjJBZEhZS1M0OWhJNHZYMXgvN3AvbGppUDlubElZb1JBeFhMaitn?=
 =?utf-8?B?NmZESDA3amZ4SUlGMU5uWjVGV0p2SDRHZFF1LzdpeHloZUwra3dCV2NHOVZk?=
 =?utf-8?B?ckNEQWFRUGlwUFA0aUlnOUxXYVNGd0QzQXp5RzNBb2d2Q3VpZkUwNUtvdm1y?=
 =?utf-8?B?SE5tWHF6NkNkRVRlOEZwUFZPNlhtUHlZdG9SZjROTldnNDN2QjVRM1czWDNJ?=
 =?utf-8?B?T0c5NHNEZEdZNG5ySmt6OFZUeXl0WGJXUnlhZVd3V2M3NG4xSHU4dGovTWFr?=
 =?utf-8?B?Y2VhelF3VURNaS91L1hLQjM1eit6c3Q3Z3E0UmRpemVtbVdCRHFMZktxOS84?=
 =?utf-8?B?dk44VlJ1aU9YMkFGYmx0VmlmN1BBUy9ISHFtN0hTZEVmTHVCWkROWTMyNGxK?=
 =?utf-8?B?bEZPb2hXYmJON0V1UU9ndTFNOHdjZVFFUDkzVUdzdVg1emg1dXFnM3lNR2ZV?=
 =?utf-8?B?ZnBXdHkva2VoVnVsZDJUd3FmMEl0aFptZk15eTYvNjNhS3hMd01sdGFEamli?=
 =?utf-8?B?Ym5xaENvR0cyVGN1N0hHNzNBcXRrSEpqdWNqZENYaEJ0TldoTnBFRWg0YlBN?=
 =?utf-8?B?aEVWMmJLQk10bC9Fa25EY1RBaENEc3JBTzhRVXpiU2RNaDI4QmxQbDg4bDhT?=
 =?utf-8?B?WDF2bVpnVkY1c3EwL0djMnliclpMckVaOTNTMFNhVWt1VEZORWUxVFhIcXFP?=
 =?utf-8?B?T0Q4aVdvUGF3b0NyNGpPSk9hUjF0aHFYZ25QdVM5NlROZTMzYjRUVTAxTnl3?=
 =?utf-8?B?VjZrWFI5amVobnMxdGVQMElIMVZGS0F2c2lKaDdKcU1rLzM2QTZSQmZNZTUr?=
 =?utf-8?B?bjcyaVpzbldwZGNFKzVNbU5ycXVpbmhOWjNoMkQ2SG9xU3o1SThXN0phTmZK?=
 =?utf-8?B?NnphdTNVSzMvNDhKYVNCNityMVJzUlJsQy9yQ2pOSFpjNjNGL09ZT0hPT0g1?=
 =?utf-8?B?bFp4TGJsYnNnWGhHcmErRUU1cmtuajVLUllvYk0zQllZLzdsM242T1BJUGpm?=
 =?utf-8?B?Z3VLd3EzWTV5SkZadlpDckVOMUgvL3c3OGJjcVFEY0NKZHppQXdoNjZpZCsx?=
 =?utf-8?B?c0V1QndpSU5aOGgzMlJ1RFZNNGhaZHJkL01hUmMwdUZHcDdoMnhockRzOENR?=
 =?utf-8?B?TnlVVHFhVjVmZVhOaWZQTU0vUDNIRTFBSVZ5Wi8wMEwvNzl4U2hNNmZrZXBh?=
 =?utf-8?B?cFpidVBGaXVNNktjVENGMmE0SElwekw2R0FrN2Faa0w1b0JlczdLUHVCZmhm?=
 =?utf-8?B?Mmxoc2ozb2pWeWNHWmtNeWhtKzc4YTMwU1Y0SGNnT0JqN2lPWG1DTExWczVU?=
 =?utf-8?B?YTR1OVBaTGVoMXpPV2p6Ymcwdm5QUzVYRHdDeU9HeVpQSExaQm1Mdm9LZFRY?=
 =?utf-8?B?ZWZ5SUUyL3RSakorOHF2L0JSS2duN2lWQ2tUVDI2dEFKRlNpRkFQU3BGdlpF?=
 =?utf-8?B?SnBxMTRFWWtWRVZnbDNVbkl6YTY2Y1dtNkU3UGJNRElySVVTV01pY2hpT2cr?=
 =?utf-8?B?TkYvY0JJVS9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG1zY2I2ZEc3ekM5YjlaOGcwSm5yMWFKMHYxVmJjaDl3ajIzZEFITGtFcDRO?=
 =?utf-8?B?VVJ1RjdhcHZDcWJYRXM3OFgwOVZlbHpqRkh2TVdMczhRbFIvN0xmdlFEeUE1?=
 =?utf-8?B?eGxheTBOWUt2RWs4WnV5ZlBGbmV1emJyQVIrN1k4eUdwUGVROXdCUytCb0dN?=
 =?utf-8?B?WHplMkIycjlvZDF5L0FnU0Y4TXRhNk9wQjVwQ3VuT0oxNms4YWNIMWtrdU9E?=
 =?utf-8?B?SHZKcEFIUWxBNExMRVRUMzNvZkVTdmhRMjV1d2hmcW4xa29UTGgvWnRPRTNk?=
 =?utf-8?B?b044RXAwUGpiNklMVXFpbzNjWEVxbUpGYzRBWXRIazdrWHJBaXpBY2wzdUNU?=
 =?utf-8?B?V1hVaFg5UUNhYVd5R1VIdEt3ZVFlYkhMZjFRRzVkTDQ3Vm5pRFZ2U0Y4NktK?=
 =?utf-8?B?ZmNUOHRQMVVyaUFrWkxaTGl6Q0VVQUp4aTlZK0FMTGcxVUREbHdORExUc3pu?=
 =?utf-8?B?ZlR0Z3diYTIzNEt1clNMT2J4SzljbnNsQWI2WTdVTUwxNTlEV0N0dU5hQlB1?=
 =?utf-8?B?VkhZWCtaWERyNC9CK3pvc3hJU0pxY0VmUC9seXhpY2l4SUc2RzlHT2pNRC9C?=
 =?utf-8?B?ZHUrdnBHNEllUlljNWViQzA0aGZOZklRUklRanQxdzVWYlBEWlRUUTRZY3RN?=
 =?utf-8?B?aEdUZk96eFFKMWVCNm1FcnV3NXJmaG9UTkhLdWozVGxqNzM2UUQ0MS9wdjQ3?=
 =?utf-8?B?c0pXc2d0cWdUeDBUeHJQSTBvcHoyTWs3QmxnMitwU001K1pVYlZ0UFV5OEx4?=
 =?utf-8?B?NUo0b25YQmp2aVVoeHRWUGV5TWZzSzloaGgzbHlzYWRxOHFmeDRkNUh2K3dj?=
 =?utf-8?B?aU5INHJSWkdncjYydTdENFhBOTBzWU9FMlV1RWlvTlVaQlBjZEpQWUNubzUr?=
 =?utf-8?B?cE9kc0ovUUxHWkR3b252bGZDTGZYQWczM1Y0dzFHbGdHQkZybkR2Y1FrRWpR?=
 =?utf-8?B?QWVVMUpPU29pN29TTUR2TlVGcjkwYUNXbW1sMEREV2lEVitXbEYxLzl0L0VN?=
 =?utf-8?B?eGRlVkZ1YW5tTnRwQnlvdDQ1aUhxT2ZTbU1QaXRIbXdvZHJIYUs3YXY3RUdX?=
 =?utf-8?B?bjd6UDVHWm1OUmdEbGw0L09SZGhNTHNYMHBwUUNVVldGVjFSSmRJeXMwWnJv?=
 =?utf-8?B?eEVjMktvQ2VjcmcvSnpxcmQreDlIeVhFbndwd2tYU20yQ0VLQisydVlOMTJh?=
 =?utf-8?B?d0YvdjJhK0JFaldtaXpJdGdiek8rS3l1MTJBcjFtZFpHTTBpNnBXNmUzUEFJ?=
 =?utf-8?B?dkQwVDMwRTVJaG96eTRpcXVIaEp2NFk3N0lEY3lYVGNBUUZuclgwdjFrUlFu?=
 =?utf-8?B?ZDI3UGVQTTdzTEZJOXZoQjJWbHQxMVZvTitHUW5rVnY1Tis0UlRzMnpBODNM?=
 =?utf-8?B?LzFlNERESEZwRi9qVmxKTjVoOXhmYkdVRC9waU5WMDRBdFdvR0g5VnlTUDdF?=
 =?utf-8?B?ajVBUjlxREpNV2JXNXRJL0VqdFdyZCs2VlFhV01ocWdEeDFSaXdCSXlmM3Fy?=
 =?utf-8?B?UTVTZkl1KzFXUEE1aEdRUUNPWVVnaTNJMkFjeVdYbnN6L1YrT05Oa0NGWWlW?=
 =?utf-8?B?b1Mzeks5YXRFQjhvVEZNdkpORDZ0a3RSbFAxZ2VTSTlESGVQNUJ3bnp5ek4v?=
 =?utf-8?B?SWVOb1VRakw1aFBSL3lkQXA0UHZrcFZhWExxdnJsdmhiUEhoR0RPRTRJalRS?=
 =?utf-8?B?b1VXTW1yeFE5V1NzV2czRDJPK0NkaUI3NmlweUVyam11ekhKdjVid1Ztc21o?=
 =?utf-8?B?MENDMVZJMEl6MjNYRWJ0SFZ4OE5CT0w2TGtUclgyT3ppS1I4ZGNqZ2NCdkFP?=
 =?utf-8?B?QTA4aWJxSlNEZ3pnSjZNVm5ITzRadnl0QWdUU0d1NzUwMEZReDBSUnNONit2?=
 =?utf-8?B?emxBYWQ3SktUeTI5WlZwZEZWSWtvSnVqNmFpbGtLekp3VnNQcHl5Q1g0ZXI5?=
 =?utf-8?B?djB0QWgvNDNtazN2QlJYOVY5VzhyOWdkUitmczVTRkEwZlhHc2g0VEFmL0JN?=
 =?utf-8?B?VlZDVGhnZUZpRVJMaTRhdU9iaHgvb21pVi9jTXZFQzhRWWEwNGlob0Rlb3lm?=
 =?utf-8?B?bTJxZFdzWXpKZndOUWhNakVxUjVLU3VUTlYxS3F2UWZRczZWQXJ6T3JjYXBt?=
 =?utf-8?Q?sdxtkMjDRc7Vpd6NtbFhKgweP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c4a157-6021-4ccd-7d35-08dddf9e30e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 04:01:07.7466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAkRXtO29Bm8834cGX1ug4zTXw0J5WL8o9gwQznwV1J5mIu7w1d4Ncfbsro/VKAmK4KQM/Hhw1RnxrnAxJAhEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557
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

On 08/19/2025, Dmitry Baryshkov wrote:
> Now as all bridges are updated to list supported HDMI InfoFrames, drop
> the default value from drm_bridge_connector_init(). All HDMI bridges now
> have to declare all supported InfoFrames.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
