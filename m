Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF136B2D297
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 05:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9F10E346;
	Wed, 20 Aug 2025 03:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Z+uyA5wl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2690C10E346;
 Wed, 20 Aug 2025 03:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArXvjGMFniyk8L8PpWuLc/O5zmC5Rs0TQ7s6201byiJQ5BUjuDJCRgn0PRHRzAFo4sjEHIXqqK2jRa0hNSHj9OGMazK2MKD7CFTBaEc1mCp0R/xwJcDLonRihwZGzjPXJ7o4IDGOa2vJCzatY/DZh2DyPzaObHdRQTpKHJ9w6gZ1zyD0NjC+Ctl3XKO7ay7ntrCIsqBSwLIRsZC/uLQVv6mOTzPfo+LFPNjsKrReVkZ47+B93+ZEkHf5cOTmpfYkLUqTgkAeB+IcGzmJZUUk3owMBFDCN5RRw9v8nujxapJq/F1nk6YjFp/o568Ao7LbcPDqy+TC2DLVx+EHcz6xWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1doNOW2Q7BHpA/PfnIFflunqMdeI0kwZ9lCjdmL3II0=;
 b=UzwIk9gfcUiyBNz2tWUqb0yInhS+Ix6TUmZna1Emi2yRk/TeeLMxZp0eKur9Gn5aBUkqYNN8rTcKt4ZDEfPZWndZCk1TT4u4Z+Wn+6eCcOyescEu7UXC51zWlM8vLI+chu5YEw75wt7RaIHfyh/l67XAkK5hcCI1qz0GqVGw/K0aikkHuyh+HXxDdEMVnmK8tyzgk0QtojHyZxhVadsFZjHeBTLFwT3K+c7Sgga2G3/RO0NJ72yA4WaXAY6Jrf+GTLSLrw0PEnLgLrv7p19DjRbimMvS3sPc7WotWplWqT+k/eWnKHnoa2brlhUftyExLwdW1qO7QGszjxNEalnJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1doNOW2Q7BHpA/PfnIFflunqMdeI0kwZ9lCjdmL3II0=;
 b=Z+uyA5wlIcj81EXXTm8pKiaw+22eFOgu1p3Y9i6nZH08cR32ayc9P8pe9cWlYoYJ3jn4I0OyHlHzaXjwjuWcTsGWbK8gdMqTbbjr4hQRv9xx/GqZWQWEly43X+/pwx1GOA4EnQTrBGiS/MlZ1/qgLU1VEvfUEJl/1LWi6+3pwlaEYu9xfLTPwnaJN6n6wI4oyi8ZvaKTMfwVom3zo3SH0oGkyzOWOB62d+VUp8DMr5qGlTXtw1bvxZ0gjGRougD2Y64HsSISCNPZT0TSJEaL3ZUE2hg/Px2Q/wNnEZfr6BMnyXm1VRyNhN3MgQ5GbjQX4/04B0ZOMAyQlARzaI5QVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAWPR04MB9861.eurprd04.prod.outlook.com (2603:10a6:102:381::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 03:29:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:29:32 +0000
Message-ID: <214e8bad-8ca7-405e-bdf6-90ab3a1a5d84@nxp.com>
Date: Wed, 20 Aug 2025 11:31:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
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
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAWPR04MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d401bc-e017-4f18-e32b-08dddf99c70d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkxzN1RtT1laYm92T0ppdm5qQVh4UDc0VEpheGg1NDRnQzBXUmJwdVdoR1pV?=
 =?utf-8?B?eXI0TVlWWDZkR1JMMGw3d3Y5SmJ1eG9Nem8rb3VrYWc3S3ZtNU80TmZwdnVr?=
 =?utf-8?B?SGRUTGZSQ3NGU0ZkYUtUdHJQNWNWMVlxM0xuZ0RxejNMT1pLMHVNYVZtWmNi?=
 =?utf-8?B?U3VPZVZ0bWlkcnhpWnlYdnp0RWRRY21EVzZPWkZiZHVGTy85TWtaQlJqTVFM?=
 =?utf-8?B?c2dObGZlTFRsZDZ5MDJrdVhBUWVRbGpDb3c0QVZoYWJ5WFhWK2lKSVJKNFN2?=
 =?utf-8?B?ZXM4MDk2emdSV3BzcHhXZkdEL0ZEbTJLQ3NsanRBemN2TWExMktBSFZ0Q0tX?=
 =?utf-8?B?U00xaUVZSUxFbzVzajZKblpmRGtLWHh5eitYdHA2c1NzY1RVU3YwVTM2TTlZ?=
 =?utf-8?B?UTJPcWhlR0FJRVEycEw2ZjgzN1Y0OTVrMURncjdERFBYbEExNG9raEFIZjZ5?=
 =?utf-8?B?V3BQdzVJRUFUbGRjeG5oZW0waTFHanVnUWZqcWIxOW5kZnR5MDJTNVFlZDRt?=
 =?utf-8?B?WmFVaWlWNitpRDNtK3hBRlI0T0p2V3FTV21jRWZYekY1akhwVWUvblNhaldQ?=
 =?utf-8?B?b29DVlY5S3A4Qm5SWGY2VmRjU3RFbEpNOXM1empNT2V3MTUrTU51dHlWaFRy?=
 =?utf-8?B?M3hKbGNGTXRFbktrMDdObzJJVXJUTmxKaWpHYzVNa0FjWXBNMmxVR1ZrVWNm?=
 =?utf-8?B?N1BtUnVZQjgzSWtIUG5STloxQWhaUkVaUnh2VGhJMmJFT1EyaXRDV1pDNmVV?=
 =?utf-8?B?RUNKQjVjamJ5Ri92cHJ3TmY2U1UvQ2JBU3dCRnNIN3FScnlRV3lpUjdiNnNj?=
 =?utf-8?B?TU5DQ2xGdnJLbkw4cGcvZEpQYzJWckZBNzNZTTQ3Tno4NDM1SGpmN3FKOFJx?=
 =?utf-8?B?cktHNElrT0p2RytiMWFHUDlFdlRPbklUQ1VJQTcyZVltNGtqVkpRR0p5VW5j?=
 =?utf-8?B?T2lVVEFBRzY0bURmSVJYck9VU0s3VTd3Z1Z0Vi9rdTFINU5lcDhZK01XalNP?=
 =?utf-8?B?V3dBcmRoRWZLRGZXVWt6MnZkUlVxaExKMEZvTGpaQ21OT0pmWmZQVDN4cmhG?=
 =?utf-8?B?Q0YvSUZRaDFXejd4OVJ0NERhUmZDM29aUkhoYkxlbDB2K0prekhmQlJON0Qr?=
 =?utf-8?B?YXhYSHpxU3JYNUZySkVwV1BYMEVGakh5SWVkbkE5VkZPS3NHY0c5M25RTE52?=
 =?utf-8?B?aVF3UGJvdEo1bmUxZWR4ZjdFaSt4TnN4NFB4M3NiMUlEdW4vQ1BqUUliTUIw?=
 =?utf-8?B?S01xWHBucHBoYnV2THl2a25LdURpUjhKRG5xU0RNd0Q5emRsY1FHeGJ4azVk?=
 =?utf-8?B?Z3UyKzRMMktUblF1bkhibVV1VGZCbnNOMlNKYUp0d3daeVNGMFR6cGlhNG1I?=
 =?utf-8?B?YzRmb001WXhvSGYxazhIRjdDV0ZFY09wbkJIeHpDcFh3SFVycWFTY2ZDb2Zl?=
 =?utf-8?B?Y2NHSHlSeDlUNEpXbHBrWFE0dDF5TDJGNUlVUDEvcmtmdy9HTDRvRFE1NmJy?=
 =?utf-8?B?Sk5CQ1FEcVhTVi9zM3VjWVZsdVIxOG9ORUp1RjFOVE1NN09lbjQ4ckl1YWY4?=
 =?utf-8?B?RmtJWHZpdFBSRG1md2xvcU13RGVNRjRKcitjV1RZWnM5TWcrMHNKZURTN2hK?=
 =?utf-8?B?ekZKWFUvSVJXUmJnYy94Q1ZtWDBDTjRoQkcvTVBPNnE4ZXVvU1U4R1BjdjFR?=
 =?utf-8?B?WGZqWS9Bb2p3Y2xMbjJmQW52MDJndmJabHczb2lXNjBTZDVocVB5Mk91azFa?=
 =?utf-8?B?ODRLYWhqN21kK1ZlMnBZMXhoUXphSnRXaVJ3ZlhUQzVNY2Q2U2pVSDBGZWpF?=
 =?utf-8?B?bEpVbmttcE9meVpMd29ibFNKQlYrTmgwVGFhZStBc0RXTlVuVlUzdWdIRVFG?=
 =?utf-8?B?Yk9kRFRvTVBBS2lNNnU5QngybUVkK2xuUFB0UW1tdktzWHpLN3ZuUE13RThB?=
 =?utf-8?B?RlJRdFhmSlVuc3ZrTUswS0hMUTF2QlF3WFFnK3pjTGlnd2pBMFFqOEhMeFlH?=
 =?utf-8?B?RyttK3FWb0F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjlXV0FnMW5GL3podXB2L0dVU3RXVGgxVFFCTjFNNVltcEtyZzdNQjdUaE83?=
 =?utf-8?B?ZFcrNmtwU3BndFNUUEttMmlkNkhsNzNtby8zMUFWVUFGUTVRMWwvTWJLUWJQ?=
 =?utf-8?B?dCtmdWRGWndqSXVSZGtVMzdFTy9MYTJ4S3l6VFdmMzdPY3pBTlBCdk1ZQjZm?=
 =?utf-8?B?NitsSE1la3M3RHNURSs0ZjR0VmdpdFlPOHFFMEVqWnhSb2tnam1xc29zRVly?=
 =?utf-8?B?U2ZIR2lyQTdjUEhDMktsOFZWdGYwZHdudU1CRHg5eTRjSFNFZUpJWEZUM05k?=
 =?utf-8?B?aDc1Ni80c1h2SFlRdWZ4VVhEKzJheUJUUmxsT3pMbHhPUURYY3JxdERSVVpX?=
 =?utf-8?B?R29FRzVyaU9Eb0x6RzhhNUh6VFE0RnVQaUFEdlIzQnJPcm40RnIvVTZmZ2h5?=
 =?utf-8?B?SEt4Q2ZuUWxKU01CSDVsU3k5Q3NiMkI5a1RsZFp2UlNCczhXVTB4bEdESFRR?=
 =?utf-8?B?SnR5anlnREZjMnp6TzhRdkRSL1p6bVhIai9wcjhaSWJXWmtWMlpQT2JEVlFJ?=
 =?utf-8?B?UHZZUlBZUktvK2RkWWo1N3hGSDlqdlA5Um1QSzUvUDkzRmxaQndLMzl3Y3N4?=
 =?utf-8?B?QUg1K3h4SE1QcTlwNFliMjZ3RHNNQWMwMlUxVWtpdTVsaUhuY2RCM012aWhT?=
 =?utf-8?B?bUhMdUZ1aU5oS013Nlc3b1ZTaU5zaE5LM0tWQVpCSmgvWTJjWGxqZFdDR0pw?=
 =?utf-8?B?K0pIK1gvek1paUpRTVc5RXNaRzdBTURHZGtsODFJTklNR3RDRkN5YytnT2Nl?=
 =?utf-8?B?eE92aXEyajRjdFJvOFJhdTFFZk9ObEdnZzlNbDJzRzU1eFAyUnZ1WTRhN1gz?=
 =?utf-8?B?MmwvL1QrcEYzUlZxV0srcVdZajNLVDB1VkQ5eEpCZjVFRkRrcHN4dDN1WThk?=
 =?utf-8?B?VmJGRzlnbWpDUmJ6MURUUC93L0VmNXpEMVhmNTNOSjlpYXNRSHp0V2YybTg4?=
 =?utf-8?B?ZmpVRTNrWWh3NkgweVdySjVKWU1jYVc0MUZTQlRqT3JCcWRHamt6SVNZUXRy?=
 =?utf-8?B?VW41SGhFbUhSQk9hY0dKek1FRTVxd28xTjlORENEeG9LU05pcGtlVkx0azBB?=
 =?utf-8?B?VGxYelpWYjJ1VW1Hd3g0VGxHNFpxV0thbjYyc1NPWUpMbWlLRFY4VXBkUkJ3?=
 =?utf-8?B?bCtEbUszTzUyVzhBKzFLOUZXNGZMY3hhSE1PVHoyVDVRTitBT0I0aTJGVXFi?=
 =?utf-8?B?T3BrN3hyaTB1bE1SaVNaZFFQLzA4RUdXbHVodjlMc3RCdjR3bzByQWlHWUkz?=
 =?utf-8?B?OWxzcGJsbTFjSnJOM2tudTdmUGxoSFI2dzhYWE1UcGpuV2FYUzFadTFRNURB?=
 =?utf-8?B?REdGU3hMQXFPTWtnTXV4Qm1GRjBWUEI1S2VNbkJuOXRNeEZacUpqc2VUVEpB?=
 =?utf-8?B?bC9LY3hKYkI5MXlwN2tNZmlOdkJCZE9Gb0FQb2lXT2l3bVdESHBEMVdOa0Mw?=
 =?utf-8?B?WDNUTERDS0QyUFRnc1labEsvRjZJMDBlaSs1N3poYlNqU3EyekdiNW50RDZp?=
 =?utf-8?B?S3BrT2p1RllvdjdUZGdPMmVmeDR5NVhjWjJFTUh4SGFpdENoMTNLN3hWS0VY?=
 =?utf-8?B?QVZPUUh3S2JSMWluTldKYTc0N20xU1lwSERQU0lvWXpiajlUall2b25ORGJ3?=
 =?utf-8?B?NTJOdUFZS0ovT3EwUWc1T3prN056d0p5bk1RSDAvL3JSNTJjeGVaYlYwNTJC?=
 =?utf-8?B?TzA3ejd3V0R5bStrM3ZPekVCSGh0SENYbUUwc0hKNUdiT0t4VktpL3BGeFQ5?=
 =?utf-8?B?RHI4MG9QNGxpYS9Nd2R4VytEUEtsWGlwRHloTm4wekRnUERveHExQ1J5Y0Vq?=
 =?utf-8?B?M1AvdXFyK2I5ai9FbE9oMElCTUt5eUF3Z09WdXZrQVo1U2R6bHVVdUhGNnhw?=
 =?utf-8?B?aXBoaVlUa0RPL25DTVNPTWhhYUtDYjRaZFVsZ25nYzhFMVVWN3RxVHJBaXlO?=
 =?utf-8?B?Yjh0ZlBNRW1IdHlGQlIxN0k0R0hDb01WUlc2WVFqdUpNOFRHcWd2b0pYTHps?=
 =?utf-8?B?ZkIySlI5L0YvNTZXUW8zSWpQemQ3T3Y1a2JRV1VqeHJKSm02djk2bGpCRFFm?=
 =?utf-8?B?UWdra3lRMlNhOWZDY242SlF2anZnTVBEN1ZUY2Z4S09QVUhnb2lvYWloS1Iw?=
 =?utf-8?Q?bT0XHXv8PT0qMFwo6y8wvCh5H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d401bc-e017-4f18-e32b-08dddf99c70d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:29:32.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YuzYYLQofD3GWUHIXm6wf+YoG/UcjMHgbfiPXt4lY2UJTFtITJxBsHVPmsbqz9jiU3gQgsBEI1gejF2oQTHSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9861
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
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire.
> 
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  6 ++++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 37 ++++++++++++++++++++--
>  drivers/gpu/drm/drm_connector.c                    |  4 +++
>  drivers/gpu/drm/drm_debugfs.c                      | 16 +++++++---
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 +++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  5 +++
>  include/drm/drm_bridge.h                           |  7 ++++
>  include/drm/drm_connector.h                        | 22 +++++++++++++
>  11 files changed, 128 insertions(+), 7 deletions(-)

Acked-by: Liu Ying <victor.liu@nxp.com>
