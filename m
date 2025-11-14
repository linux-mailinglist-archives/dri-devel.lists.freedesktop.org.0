Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1BC5C6BF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 11:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A766410EA23;
	Fri, 14 Nov 2025 10:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o4MbI3I7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011031.outbound.protection.outlook.com
 [40.107.130.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE5310EA23
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 10:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqwQMUgF1KYNapNtjBxBw+/c1jsvT2hzf/pr+dvmTajW95cL7HQVGuGFaWnmTA2IQTZOnov3T3KbNRbhoetocWO9am9LyMlgaZCF2QkTwHPso/Q7yShjrJ/Ue3C1rAEVOyDXAKnBwjkLYW/GaFOcbrsZmVWokV3TZi2CySTT68BgH/Lko13EOtHvVfJmlyGf1GGFbr8Qrpc8wSliWtmyvUihXEuuDWKBsCZyFe6TNOVtAPxbdgazyUI/EpOMJ7sa7L7V2sPTyKVsGbwm86Ba5NDSIa1r5uTsAM37ZFis9804nncQ6ltxIexxQVACpNdxGU+CpIOsxG8Eo4PnyldgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IpGGkzCtL2HxOW220u98bLEaSjCFVwRfnSag34Ans4=;
 b=j9e9o7bORprCyXWrn7o05mwWzJzCfT8W0OLNT8O8XueLVosaNz2EDj7nP6fcrI2XyR+yAE5VGENMgucZ61kHYvvQXz3k9uDsgcJu02ihDKRbtWxV6JkjpcsIo03ngxVQrXfmCPur1jZkRHUfwG8ACaKg0TBMTv0ssxCIn6R2Ogrvb54EDcMKx7k8+TEeFcOr7y5N+StJKWIiglGNCpt8W9srsKLqbOEGicOooivG/TSE4Kp3E6KE7QHZb6tlhOKzRkTG7t8V6J6dxx9G6BSeBo4ITnogtLnj9DAk0KsnKPZkBYTX3LULngStGSO3ddqxxL+xtFgkMkgPK8RVOlau1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IpGGkzCtL2HxOW220u98bLEaSjCFVwRfnSag34Ans4=;
 b=o4MbI3I7Y0wRRxd9xfn2xtVEtZybJj5vas8lNHRsi3JFeD/u0oOPrvLvl+2OfanX2MIIXjDuXbUHOassbXikQprdVSZNAPQEbEyhxeqLJI44SN3+P0ltMujvIMZ6C1XhsvKVjdsJKU46j0TnridsP5eTSUuN9vLYHOcBFO4tibj8UD9bnPbCI6vHBqKIWLiPShoOgNNbIPjjBXdnLAh0brsKTJSq/IHwwi8e3eM4Eu3fBeMFeqxuiU81MFStQw80lStlPcEw6Y0qOqKAbJW0qLcQaX9eJKIaoAaFIlzJzSpgkyxmFtsH4GlSMZv1twtH5VPRj3+lmPnmdxP8LWL4sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 10:02:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 10:02:38 +0000
Message-ID: <3d622f3c-ddd4-4feb-bc88-a1eea7dd936d@oss.nxp.com>
Date: Fri, 14 Nov 2025 18:03:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Marek Vasut <marek.vasut@mailbox.org>, Liu Ying <victor.liu@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
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
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20251016-imx8-dc-prefetch-v4-0-dfda347cb3c5@nxp.com>
 <20251016-imx8-dc-prefetch-v4-7-dfda347cb3c5@nxp.com>
 <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
 <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
 <500852c9-2cd5-4897-a139-4e93988f5469@mailbox.org>
 <df8751ba-7215-4635-98b0-ca659ec786cd@nxp.com>
 <de695268-1241-4658-871c-30dbf068ad92@mailbox.org>
From: Liu Ying <victor.liu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <de695268-1241-4658-871c-30dbf068ad92@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 2896b52c-7313-40ff-59bc-08de2364f151
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|19092799006|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VS9iSlJlQlREVGtWcHh6UzZMdy9FVDg5a2MzQ0JIM1A5MUg1RUhMTmNjbVg1?=
 =?utf-8?B?SE9YeDFkTE9LVHNQdWhmNXJEKzdHU2lTNWR1MnlXeGw4K3c0VDkvaG1mUzdq?=
 =?utf-8?B?NHZHK0crclRNNE1aMnVEOGFFalZLdkZJaXgzM2lielpFY0svd1FWOWpwODlL?=
 =?utf-8?B?NWtWNmtzVzhaTytrZTIvUU9ydVhENTU3RGVYVWdaekg5V0FKY1NKRFVUOXdI?=
 =?utf-8?B?TXBsRnd0T1QrSDRBYTZKQVZKS0h3Ni9VZVVHUUs2NDVwK0c4YWxwUFM0SWhh?=
 =?utf-8?B?clhubVRKZG93Q2VYOElXaGI2RCt0Q091bTNDdk8zSjEzaTQrMzdIcG8vSnJF?=
 =?utf-8?B?OE5ZMjBmVHkrMFNoamZOQ25CMHpwZXh0Q2dkVTVNTEhtWnRHQWpqL3BTaTdU?=
 =?utf-8?B?MlBYeW1EbVpJNnM4NU9aRHFQL0FqVnlIMWYxYmhFZkxuQ21oaUhFT0ZkZDVF?=
 =?utf-8?B?eGZFUG03eFdPSnNSUlBzSmVtWWJtT1dwaTVPRXhwbVZubGF5WE1US0RmYmFJ?=
 =?utf-8?B?b2NORmxNZXRHYStQaE9RL2g4RGhvTHQvcmQ3S0s2TG9LYUIvcCtoRW1aVGRS?=
 =?utf-8?B?NEdQeWFWVzZlTUVFUFkxbFkxVmUzcWJZVC8wUU1rdUdHaVZlM3hSM2JaUUpP?=
 =?utf-8?B?eFYwQTFwMTVWa3JJc2ZKREZEUTNBdUY4V3BMcm9ZRE1hdnlpcXcwOEw1aTdp?=
 =?utf-8?B?T1owQXlneGs2cE80VFJzcUgwVWg4SWEreHRFdWY2VkI5UmZFNElFaHRwTVlE?=
 =?utf-8?B?UDNkT3J5OElGNEEzRUxtUlhwZFYySjF5QS91RVlTS2dqbTgzS1RSeHBqZzRz?=
 =?utf-8?B?MjJFTElWeTlpeTh0KzJ1U3hRYlRRTG1KWnRDUk5FZW9pczZEN3ZFZDRHck5k?=
 =?utf-8?B?WDhrb1lmL3FuOEZObTZKY3VEdElIcjhPK1ZpQ2JwcXZkaHBObUUwNmUzcTYy?=
 =?utf-8?B?NXR5V29hUDNGbFFyS25nOGVzNjQwTEZENzRJK1JzM2hHVEt6b0RnQ3BKaW9R?=
 =?utf-8?B?VWI5by9TeXJFaC9xYW5HWlp1QmRqNmRnbmROcGxMazl3YjEwNitVdzRUUUZ1?=
 =?utf-8?B?Z2ZGdG5oZm5mWUJ2VE5zWHVtTGNsWXVGYy9HRDkxTU5iYzFubnl6SlFrMGJV?=
 =?utf-8?B?a1JyMmtRY2REQVN4Ylp4MTl5c3AvNXJwRXEveXBFZnlHQy9XMWR5WjAzdHhP?=
 =?utf-8?B?LzNHaDlVMHNLaVA0d2IrOExOMmllQkRqVUVnWjAxNVFsQXBsV3hsNFNMQ2RB?=
 =?utf-8?B?ajNaVFlUYUZRbUNzeHIrZWRBcGxMNWR4bEkwM045OXE0ZU1zNFdwaTZYQ3NY?=
 =?utf-8?B?MnZwblN5ci9MeVR5SkZMSkIrMEZMN0MyTUFMR2F2dmJML1dDQVp2V0hUQXhY?=
 =?utf-8?B?T2o3VGY2S0JMUFFkUnR2ZlhTbzgxUWRlOTE1NHRndWVZUjlYeTdDdW1oT3ln?=
 =?utf-8?B?Qyt0OVVWQ20vdlNvZXkzS1A4dDg1REkrMW85M3RBQWp1d2JZcVlJb1YrWVZj?=
 =?utf-8?B?MFljSUMxQ3JtUWRES1N1Ym9DQ00rS1NQWEpjS2FQRUJWdTNrWitweDNiTU5J?=
 =?utf-8?B?RUVkUFBYSVBId3EvNDJKY1VPNWw0cFdaSVpsQVhaQmlISDdwYU40ODdlcTJR?=
 =?utf-8?B?SGRaV1lsZlFjQ0hveHppVWFYYThSUVo4OU55d3FrS0Yva0h2WEVxNm1OSHY0?=
 =?utf-8?B?SlFzbFlBOUxoSFJOL1dheGs3N2lQUWhjSW1SbHJIR3RtS3IxMCs4R1Vwak1n?=
 =?utf-8?B?clgweWlyb0Q1b3c0VmVrT1lmbGNQM1lZVnN5MVBnYk1LTHhzcHNMVjg3aGxQ?=
 =?utf-8?B?VEk5VG5BT0txQmtnVWc0U1hYNTVOQWNoVFJQUFU2b3FDNEFIeGlQVStpWEEv?=
 =?utf-8?B?MGhydVV6TGRVM1JyaHJFTW9zaTBFMDVucXdkVXZOQ1pZTk5BT25NRXkxdU1p?=
 =?utf-8?Q?CooEOu47LdlWtbQV13y20rYUWEdpQjKO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhLU1JhbGIxUEV5V0hlSFJWaXUrY0F1TFRjNU1rYUVQbTkyZDNJMGt2blpF?=
 =?utf-8?B?Vi9aQWpuRGpteHhEcU9UdE54WWtMbUlWNGFKS0lXZnNKdU82eFNWb1Y3Vkk5?=
 =?utf-8?B?MjQrOWRnbEZGNWorV0lrTDcraFo0TUFVV2FicHdJSFp2dVdVaVlVVDA1L3Yz?=
 =?utf-8?B?UkZkY29FNCt5Vm1sT0NKN1dFS3dGSDBkbHEwN1ZEa0FIb0FPWVBsY1Jrei9V?=
 =?utf-8?B?WGdCeVorcUxybFVTL1RDYlZnSlRBQ2lmWnU4ZUptei84WjlpeDc3L2c4ZXhS?=
 =?utf-8?B?STBHRWFmWC94SVRxeTlmOFpEUEZOenEvQUJPemgxOTlzME1ZVXYwbWRleTIw?=
 =?utf-8?B?UlJJRlhJSERRMy8rcFVUMHdrWkx0dnJkZFdpK0lVWEkzejdmV0lBZytpaU4x?=
 =?utf-8?B?NGdpY0FpZllZZ01KMFRjSGpXeHRIT2liMlZqY3hyZm9Ra2hBb2M5V0F4ZUla?=
 =?utf-8?B?ek1aWXFFbVNZT0FFR0xGaWVzOWJKTmtXNTJyZzRmZ3NyZVRoUHVrTzBybDdp?=
 =?utf-8?B?U3BidjZwc09xM0dzanZ4dC9qZzAzcjdDL3hVTW0vTzdBZTI3ZEF6N3hJZzJN?=
 =?utf-8?B?OGhiYWg5YXgzck9DdEZGRmg5bDFFQ1N3RzFLZjV4M1JlK3BIeXdkd1JwSzMy?=
 =?utf-8?B?LzRpbmhDQWZBbUp0S3Z1SXQ3aGVTc05GMXJGQ2hWNFp6bndwdUV3d0JJZk5u?=
 =?utf-8?B?NTd0M1FEVEkxVGlhSVcyY0svcG5RdTJqaEdUNWJ0YXVQcDB6L1J5SjVVcGp4?=
 =?utf-8?B?WWRyWmt5UGZwaXVlTUpXWTFvZFhGbTR4blI0a0FCWlVCTE4yS1NwUVptbkln?=
 =?utf-8?B?TzBQQmRWSDlFUnA1VFhiTGtUeXRYUFJmbTdVNytyWitJRTZ1UmgxS0NRaXRh?=
 =?utf-8?B?enpySzBSZFlGNm1vY0pDeXdob2V0cEszZE1XY2FQbWFTY1JFdXU4Y1lhZzlh?=
 =?utf-8?B?eFVxL3ZzZmJRUjYvNk9jU3g5Q1p1NnZMbzZma1o1OWRiZktzNTdDT0VCQjll?=
 =?utf-8?B?ZHRqVk1sdzBHbkRIVW9mcDBNRU5ESVlQeFVBLzFaZmVJd0lFWi9jaWpia3BG?=
 =?utf-8?B?bmZYK3kvZGs0aHNCdUIrZXNPMkltemxXNTBKU3ZacWpqc2xnaWFtemtLa2l6?=
 =?utf-8?B?YjYvZXlhMDVoZXI3S2w1Q0VJVTkrN0J1dEFmcHRXVkpvTVdPSll2OXVOTjNN?=
 =?utf-8?B?dXBxTWVvOEZJdkpXWU9zcDdKaHVFVTFmREVkRnhaekkyRzFORmJOVE9JRHJr?=
 =?utf-8?B?cFBoYnkxUUw0djhTVlYxN0x1UDMxdVZUQlB0b2NLQjhvQ0hEbkt6RDFpOXN4?=
 =?utf-8?B?Nm85RHBoN2Y3enZ2OTg5aTUwNGt5ZVViRFFOK2ZMVXpqUXdXM2cwTS83QlJG?=
 =?utf-8?B?RXMwQTREQU1WYjIzdmE0STZja0JmQTFiS21RN3pDVllTTWwzZ1M4Y1o1UjFF?=
 =?utf-8?B?d0N2WUFEUTkwLzN6NHJPL21RaHRYbElOUHhYUFk1ZEUzL1QwTHlES1AvMVhZ?=
 =?utf-8?B?TE5DR2ZLYlozYUFCWU5BQklYUnJlTG9pVmxQNXVOMkNTb1k3bnFnWTEwNWlR?=
 =?utf-8?B?S0VrVjg5SmNuMUtQTW5lNjBBdFdjOVBiOWlYTjRlaXJlSi8rYmVaSkNDWkpD?=
 =?utf-8?B?ZWIvVEs5bnF2TEozVisyTVRPQi9HTmdibGxsMXlMRVdQVkU0Z3ZvR0dsUGVW?=
 =?utf-8?B?cWQ4QTl3bVA0bTl1M3lpYXdhbnV2SytlUU5HakNnZzFLRVR2YzFjQ0FpR2hs?=
 =?utf-8?B?VnFOaUI1RmlrSC9TNGVsZjZtbHROcE5xSWF1RExjem9nQjJUUFJyN0pscnNI?=
 =?utf-8?B?YVRFaDRUMm9SZ1Y2MXFqUXAwOGpYMnNkcyt1aGRzM1FQOHZOQmRsOVpUejZY?=
 =?utf-8?B?VlRUWXZ4R3VNMTdCcTRRbWM3UmNGaVFMWWRTRGFsTWlzUWJWVWZlbHU0bzBZ?=
 =?utf-8?B?ZHlhUSsrei9GSS94R24rM1N5RWdFTmRKYnV1TGtsMURLUTZuL2V1N1YyYnVK?=
 =?utf-8?B?WlNrZm1maW1hMFUzSmxrMWhjK05mUkpjeEhpYkZIMTM3amNwaWtneVhNRGtt?=
 =?utf-8?B?YmdrYnR4Z2tHa01NMXhVQmxaTVNtWlM2ci9QVmJlNFU3cWlEbmVJSjdsUk01?=
 =?utf-8?Q?tICnuMwPm/6V8L1j3JhbSbP4M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2896b52c-7313-40ff-59bc-08de2364f151
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 10:02:38.8040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYD7jdcKFv14DNvh/y9RiQ30qZNLLaeoa8DIw9Ax36Lru9Qk4BMCJguc/sFTHUCvEl6I1qtwD4p9ue1yYrQ1zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213
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

On 11/09/2025, Marek Vasut wrote:
> On 11/4/25 8:18 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
>>>>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>>>>> @@ -1,6 +1,7 @@
>>>>>>     config DRM_IMX8_DC
>>>>>>         tristate "Freescale i.MX8 Display Controller Graphics"
>>>>>>         depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>>>>> +    depends on IMX_SCU
>>>>> Can the SCU dependency be made optional,
>>>>
>>>> I don't think this can be done.  If you grep 'depends on IMX_SCU' in
>>>> kernel, you may find a handful of existing dependancies.
>>>
>>> Sure, I do not dispute this part.
>>>
>>> But the SCU dependency can be contained in a component of this driver,
>>> which is not used by MX95, and used only by MX8Q . Then there will be
>>> no problem.
>>
>> Which component?  You mean PRG and DPRC?
>>
>> If we add something like CONFIG_DRM_IMX8_DC_PRG and make CONFIG_DRM_IMX8_DC_PRG
>> depend on SCU, then should we make CONFIG_DRM_IMX8_DC depend on
>> CONFIG_DRM_IMX8_DC_PRG?  That's yet another dependency.
> 
> I would say, if possible, put the SCU-dependent parts behind
> CONFIG_DRM_IMX8_DC_PRG symbol, and make that symbol configurable via
> Kconfig . Users of iMX95-only can turn it off, generic kernel config
> should keep it on.

Both i.MX8 and i.MX95 would use arm64 defconfig.  Most distros if not all
would use that to generate a single kernel image + modules for i.MX8 and
i.MX95.  We can't presume that __most__ users would change the configs
for i.MX95.

> 
>>>>> or per-module,
>>>>
>>>> Well, DRM_IMX8_DC(for the imx8_dc_drm module) depends on IMX_SCU just as
>>>> this patch does.
>>>
>>> I assume it shouldn't have to, because the SCU dependency is only relevant
>>> for the prefetch engine ?
>>
>> The SCU dependency is only relevant for the prefetch engine, agreed.
>> But, how to avoid the dependency?
> 
> How about containing the SCU parts in a single file and put it behind a
> Kconfig symbol ? The common code can call the SCU parts and they would
> either use SCU (on MX8QXP) or do nothing (on MX95) . It should even be
> possible to discern this at runtime.

I'm not a big fan of a Kconfig symbol for the SCU parts.
To me, any code path which would run on i.MX95 should not call any function
in that single file for the SCU parts.  That's really confusing because
i.MX95 has nothing to do with the SCU.

> 
>>>>> or somehow abstracted out (via regmap?),
>>>>
>>>> Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
>>>> registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
>>>> know how to abstract IMX_SCU out, especially via regmap.
>>>
>>> The simplest way would be to use regmap_config .reg_read and .reg_write ,
>>> if there is no better way.
>>
>> Can you shed more light on this?  Any examples?
> 
> I'll just reply to this part, because that is probably the most relevant
> to this whole conversation.
> 
> git grep '\.reg_write' drivers -> drivers/hwmon/aspeed-pwm-tacho.c as a
> simple example.
> 
> Then such a reg_write implementation can do:
> 
> if (SCU)
>   use SCU accessor
> else
>   use writel() or so

Thanks for the example, it makes regmap idea a bit more clear.  But, how
would you pass the SCU flag to .reg_write?  I hope i.MX95 code path won't
see any information about SCU.

Also, IMO, wrapping SCU with regmap is abusing the regmap API.
How would you pass the resource, ctrl and val parameters to .reg_write?

int imx_sc_misc_set_control(struct imx_sc_ipc *ipc, u32 resource,
                            u8 ctrl, u32 val)

Regarding the 'else' clause, I don't think we can use writel(), because
SCU accesses registers via Cortex-M core, not Cortex-A core(I mentioned
this before).  I don't see anything we can put under the 'else' clause.

> 
>>>>> so iMX95 support can be added into the driver easily too ?
>>>>
>>>> Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
>>>> can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
>>>> (something like imx95_dc_drm) plus an additional common module(like
>>>> imx_dc_drm_common).
>>> This design part is something I do not fully understand. Sure, it can be
>>> two modules, but in the end, the result would have to be capable of being
>>> compiled into single kernel binary if both modules would be =y in Kconfig
>>> anyway.
>>
>> This is something like imx8qm_ldb, imx8qxp_ldb and imx_ldb_helper modules -
>> DRM_IMX8QM_LDB and DRM_IMX8QXP_LDB select DRM_IMX_LDB_HELPER.
>>
>> Note you may make CONFIG_DRM_IMX8QM_LDB=y and CONFIG_DRM_IMX8QXP_LDB=m with
>> CONFIG_DRM_IMX_LDB_HELPER=y.
> Do we have to make it this complicated right from the start ?

I don't think imx_dc_drm_common would make it complicated, but instead it
makes drivers simple and easy to maintain.

> Maybe we can start simple, with one module, and then split it up if it turns
> out to be unsuitable ?

Hmm, maybe it's time to split it up now, because:
1) Your below patch has already been adding DB to CRTC function.
   See dc_db_shdtokgen() in dc_crtc_atomic_enable(), which certainly breaks
   i.MX8 DC.  To avoid that, you'll add branches to the atomic enable
   callback, which is something I don't want.

https://patchwork.freedesktop.org/patch/680085/?series=155784&rev=1

2) This patch series is trying to add i.MX8 DC prefetch engine support.
   i.MX95 really doesn't embed the prefetch engine.  And I hope i.MX95 code
   path doesn't need to know the prefetch engine/SCU existence or non-existence.

-- 
Regards,
Liu Ying
