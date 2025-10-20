Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C235BEF1EF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 04:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB6B10E247;
	Mon, 20 Oct 2025 02:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CpuEnqdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0107510E247
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 02:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ7QRO6Rt938+oOe8K2mjSaLh11HhyYJaOyYWX+hSn2J9n5TXt9Au/cCZIdkpj4VCxoaZ6UwRZ4f/lJv0c+AYRSrUHZANkZHwW85/tXowD8tnJRfou364uD+cakoxnKOgW+K2aqEXegBgemx3hl8YxxkUeXuZJ9kBT62HBYel515YoWwjS9uzp7O9IWb7HNm34Wd68iF716ZgxwBY6qizxH+1xwqNzvQPhuy3oHZISsf8/uXCA8BBrV5WDNR41NEmgSjpcjB+ZjL0xNJmknkeJYSNmH+faQMfQHbEcjklws5ap7RkQLasJGWGIfQfmlhEXg9QcS2GyN3icHvnRnvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6EqIrf28Y/itySZgA1uR2hwPvjvdwGxFe54We1/M5U=;
 b=V6hkcYKLxaL3g/fPqbKVwNbt1k/zUFFCLe6FATrJ/ku9GRHOieENUVZYOZ63Z51fm2e51oR0xl5bRxb++TEb48IaGomgHvO2H01KqEc4kQBQU4aNPlkSpV+ESe8/a6p9Z1shlSpPX0PxCh/1FXgJSWDA0TKnDoPQcoLQ11YpHWmhc1wY4WsY7dK9uN3hhvZuFtVps4xCFf+wlvWJodzxSRsorM9FLdvCnGGCOM/die/mYM54TNY74j+LdwIRrpy9zYGqtxg91P7w9s0aKCrW9dj5HqdQ3X2X6OTs445ulfxdIYyeP8FrOlR7Sn9fArzLNhOi1Kxe4X1Vmlu77T92qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6EqIrf28Y/itySZgA1uR2hwPvjvdwGxFe54We1/M5U=;
 b=CpuEnqdCgeRTpeK1B9P+e6LOUMbsm9qFqBAU6KU9+C6Bk42S9FzNkNHiR3i6dm0PQgaEpXs107ureZEVSTFeHifrlIfSZkUwg96UbHM5cf1tuNcb6PE6PTqyuptxjJUQT4+KTLWC/NddCHEiWEWrgSWAmsgG41LB7dfTHW0/3p+ueonYY+60/oWHztYQMmAZ4nxY6hZ5Cha4MruO7TGVUlvqnzOiW4K8vd9Z3/voF+cH+lbLFJzA2QzB6tQ3GIaRENMmN2QR843yR1RRA3ExvBln9RWTtPuSlU8U+yFLsJhmcXofrueDUmhG3Mwi7bAD245JvAwbPJKU45mjKpk/vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10641.eurprd04.prod.outlook.com (2603:10a6:800:272::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 02:47:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 02:47:04 +0000
Message-ID: <24f99c46-ca5d-43cc-a2eb-a6e5029e9f86@nxp.com>
Date: Mon, 20 Oct 2025 10:47:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] drm/imx: dc: Add DPR channel support
To: Marek Vasut <marek.vasut@mailbox.org>,
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
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <174bdb5a-b5a8-4856-a0ac-8caaaefde136@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0068.apcprd02.prod.outlook.com
 (2603:1096:4:54::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10641:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d572266-338f-401e-5180-08de0f82f3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmQxWmxRck9kRXNJNjZ0ZU8rZ2pjUERYRFFzZW5iRHdNNzhzTE5hUHZPYTNj?=
 =?utf-8?B?enhPNzNRMjgvRlBqTWNNdWZGUEpXa0hidVUvcFpJQlNmczNOOWhYRUJrMFFO?=
 =?utf-8?B?S3hHREJvODRKYnYyRUVJTFJ1ZHVWK1pUcnpOZzdNYzRnWDdPRkcrNURoSytH?=
 =?utf-8?B?eFFuVFgrbWJJRlAvK1Vma3VHMGEvYjhKZ1dBQ014a3FMTDJqelpkV3JldWhK?=
 =?utf-8?B?S2ppSC9aWjB4WkNKSjA0clVqNXlMTW9SRDRnaGVaWTdxYnVYTzJNcHFIY0xB?=
 =?utf-8?B?M054Ylo5NWJmRjNzTnVkeTBvbUpEazgzZG9VVnlWS2RDTy9uWCtObkVVaDhL?=
 =?utf-8?B?NEFHeGxYY2tSaWIzeWNSS294RWI3Z240dVV3aGErb1dmSjhrOFpITUZ0N0dy?=
 =?utf-8?B?c1VDNTc5aFhTVnNmb0lmS2JmUGdZb1F6VmFMREI2b2tiMlg4UkRlRFQ4eE80?=
 =?utf-8?B?WFNCSGdYUVlrQXQxaXlpNTdxTXBheW5wc2hMN01WUC9vNnRoMUR0YjlhZG9j?=
 =?utf-8?B?TFIrSmw3aXZYV3RzM1U1aE9HRGNIRDNLTGdUallhUHkzVGUwR1VPZ0Nhb1pq?=
 =?utf-8?B?REc0SjVERXV0SGZWMjVCV1R5Mmc0bUVBb0JFQmUveDVuaGVzT0RrY2NpMUhH?=
 =?utf-8?B?VTNEbU9WQ04wL3NzVTQxR0dDRWd5bk5vZlBYRmFwUkhUdVpJVWZyaFp1TFJi?=
 =?utf-8?B?UngxNkJiamxwYnpYeWdDZTVnR2o3cGt4dDRDRUdTdzA5M1VwZGRqMFhxMFlv?=
 =?utf-8?B?c2lHYktOdHVpVm9ZNmdweTF0UWJnampOTWVjQnZRMzZKcmZtdDRsRXMwWEds?=
 =?utf-8?B?N1dvU2lTbVVSSlcvUC8xKy9FZ1VvL3ZLaFdBaGJSTFoyOFFWc2NEa012M01z?=
 =?utf-8?B?ZnRYUmt5ZFVScGlEY29vK2k2elBmdFJMYXdiSkFYNFZqTnRBUTArVWp3K3R3?=
 =?utf-8?B?TG1GTjV1MGNvZFZyRGVXcVVSYVZIVCtxeG9HSUtlakZoTWJRR2lvYWR6OFNu?=
 =?utf-8?B?YlNaUXVjbXcxaVZzTkpYQlh1Nk9ZQ29iaGN6bS9UZmFBQ2tWVHJqa0JoSnNu?=
 =?utf-8?B?Wmlnb2NFeXh6L0V2UC9XckVjeTRrK3p3dVVVZ0lqMXBMZDdveHpqTUVWN2pn?=
 =?utf-8?B?QTJnc21zL0Q4Tmk2VnZQeXhRYjJscUdWWnQzMHlMZVlHaHM5MHowS3l6OThZ?=
 =?utf-8?B?NldxRXhqUm1UdS9YZHVUUXhtSUJyazcrUXVMVVlBSCtHUWx0Tm9qUVdCZm1i?=
 =?utf-8?B?VWVpL2JwdUNVbktRT1I3RnFwOGc0VWNIdHVRZ3QyQW8yZ09MdEpKZi90VmJR?=
 =?utf-8?B?VXEvaysxaFAyVXRINTNOd1BDMC9QY3paMXlSWlpFaDJPbEpwNzg4dmVqWHRK?=
 =?utf-8?B?TWFEN1ozb09RWDBqWlZRR1ZoakxVSUs1UWJzMWw0bTEyaXRFSTlUc1dzb01F?=
 =?utf-8?B?b1o4ZmtIUzBmRXRaV05DWi9RaUllcVV5UEhhaG03Y21KL00zZjhIOVozQXZo?=
 =?utf-8?B?WXJkL1J0S1J3Mmd3b2J6alFPRXcwOUl3VEpCTzdGc254d0VSZXhEdHhVTGpS?=
 =?utf-8?B?eGIwWW0za3VTTzN6OG51OFBkSjBaSGwwWjk2N1pPQ1RrbHZNN2ZYMitwVDJq?=
 =?utf-8?B?akV2djhaUVBzRi9WS2JkN2JObnJzUzROQ2taQkV3QjAwZzZGOHpUaExPMDd0?=
 =?utf-8?B?R0RLMm55ZGVWbnZrTXV2R2VoNjVDRHZMYTd2TjZEZ2xUSFl4UVdwTmlreTNa?=
 =?utf-8?B?dy9ud2xMWVBpR3RnNkFDZWw3TVpVWjVDUlB4Y3lvUi9xQ1YyU3Y0eGFHRnNH?=
 =?utf-8?B?U2dwMUdDN0hBamx6dUtONi8zaXh5WW9vWlhTNXhhNmNVaVZyQjVJYjBDS2lV?=
 =?utf-8?B?YjdQSE4zOVJ2UkRHTllPYlFFTWdxQ0ttWnlRMzQySE9nck4ySlVvSUcrckFl?=
 =?utf-8?B?ZEk2OTlzWEJYelBVdG1NNWx1ZHBjN1dOa1paTDRuVEtHRWJXajBXQllseXRB?=
 =?utf-8?Q?AsCAi8PcYbSeTql13SD6URGJJxW3lo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU52N0FRSkgyVFJIK1JlT015SUFBcnlEUGM2VDN0bHB6R2dFdGlHZWg1akRB?=
 =?utf-8?B?cWoyaVFaNjVBNjNPaS96eDBBSVkvdVluK092bUxycFlwdHpMd3l0bjNuT3NJ?=
 =?utf-8?B?ZkFuSnl6aXQ0d3NJVE9XNVIrUEh1TXJVZzFKWk8xZmc1ZUZ3UUN1ZzFuMU95?=
 =?utf-8?B?d1RQK3lXQTdBaTJ3RU45cm55WTc0bXhSK0szYXhDTnFORkg4NFJIWlcxNjFl?=
 =?utf-8?B?a1FLQVZJQTNQRy9LTkRtdGo0MHEvVWoxWEtFWEhodTZqanNtaU1BVjZJY00v?=
 =?utf-8?B?VXlOcE95clhxN3FhdlVNUmdZcnZ4SU96MFNkQXN6cXY3Vjk4czRxaERMUDRX?=
 =?utf-8?B?TlNZUFdaOFlYV21VbDFXNW5FSmE3S3p0U2F4ZDBzUG80RFA1QXZISndhT0Jw?=
 =?utf-8?B?NWpLd0VrbkdrdVhodElHNmNKZjBzd1lVajFmcUxEdkc4YnF3QVF6N1FyTHA4?=
 =?utf-8?B?U1orT1RLUWJ2MkxUQUpKMUYydzU1ZTZkVTMzNWNDTFc0SVRWM1pvZnJtR1l3?=
 =?utf-8?B?M2RFK0RuZkFjVTlzemdqQmRVU2pmeFFjUmY2SUtuRlhRSHBjbENhdkZyT0xG?=
 =?utf-8?B?R0JLRHdBeFJ2OE5PY3J1TjIxbEpINkFrT25wSzRoRkI5NWhuR1VnSTlvL2Z6?=
 =?utf-8?B?b2N0bGtYcllvbXFPR3lpT21ES2RMaThudlU3ZGkzbFM5WVBpNTArdEJYZ3Uw?=
 =?utf-8?B?NDl0MTduWXNaQzFCbVRxTjRRaUNraUlCQ3BZZ3pJM0p5anNNc2R6amZXU2ht?=
 =?utf-8?B?bHZOZlZHRGt1d2w5eHh3Q1gyNUpnVlR2NzJZSThyQ08ra1NCWlkvUnpiRGRz?=
 =?utf-8?B?Y3ZkT3ZSZFR0a1EvZG5TR3Y3K0Nzcm11clNnUllVZ09Ob1FsL0I2bDBkalc1?=
 =?utf-8?B?b2QzUEszMHBtTi9tNlFsMGhzQTdqcm1maGYwemNHQzVDYTFjVE5aSVIxamQz?=
 =?utf-8?B?ZjROamVINitMV1p6VE9EOWlEelVHWVZPRWpUQ2lQYmVHK1R0R2JMaDVnRTdV?=
 =?utf-8?B?VEdpQ2o4RThCYXVDRVFjRW1ydzZVVExtUWFicEttSUEyd0R2K1c0V0JwTHE1?=
 =?utf-8?B?NjgzLzRBcGdYTzQwMkNENk92b2FaM3hSVmFCU1FHaXNIOGMydUY5ZzN0b1px?=
 =?utf-8?B?bE05VlNhcFl1T1VEN3lJQXUwN0ZONENCd0prTnk1ejhmeU5jcUlHTnNuZTdH?=
 =?utf-8?B?VHV5M0R1dGVnYjBBYjY2UWk3RGxFM1JwZWhRVXFiSVB3eG5pOC9hYnc5V2dH?=
 =?utf-8?B?WGl1ckFiSW5mSytub1I1UXk4dUJDZE53UlJ1bjdWNnc1MnZzZGZhRW5iTFZQ?=
 =?utf-8?B?czZjTVl0NExXMExsT3Fpd0NNOStTMmM0bUo1NWl6OGxBNnE4L1ZXOXlMTUhP?=
 =?utf-8?B?cjREMkx0SWhCL0pLcmtCeGd5d0FFQTZwQjlXdVpMSWY1MGlEYzdjdlFpa09y?=
 =?utf-8?B?MkFBeW1NQzFOOE5FU1lJWmVMek1WQkdUdXd4cFV0cERQV0dLc0lkRlJ0T1Nt?=
 =?utf-8?B?MlZ1L0Y5RklLdHdoWXB5b1BvdWxndllxNGJJaGpXSGRSSmhSRmdXejY4Undq?=
 =?utf-8?B?SDlmZWlQNWRRTkVnNzREQVAvWURaOEVWOVpvRkYxbGpHOUordTlFZUsrRWFl?=
 =?utf-8?B?R1JSK0xJdVBGK3FaRzNISDFnMVFPZWhza1hLY2NMYnVxNjBpazRWZmhnU2FS?=
 =?utf-8?B?Y3hjN01aSkFtTUpld2pMTDZZNXhWa3BJZERHcXRMODJJZHlrU25HUWVOUmZl?=
 =?utf-8?B?MFd1bWRncDJQQmFCMVdtbS9kRzBlWHFJZXVpYWZxMlZVUVgvOUdBK2gxb3ha?=
 =?utf-8?B?MzVNKzhSYUpxOXBWckNsMU0xRWhnVnpvREsranNEVE12Ti8wZG05eGNWa0cv?=
 =?utf-8?B?alBDdWFqMFdDcTI2MEVDUS9ENEdvTGU3emVTOThnQzBrczg1NXpNL1JiSWgv?=
 =?utf-8?B?a1FoWmJVZk1FWnZ4K0VKamdXWVIvcEUrcWRqUldKQU1qNXArUTB1c2tWZlpZ?=
 =?utf-8?B?VGZxd0p3b1dpd2NmTnN4ZVlRV0NCQyt4eVNvbjgrVm05MVJpb3J4TVV0Zkow?=
 =?utf-8?B?Q2FIRkl1OXB2NThQT2NhUkVrNmFoQVpyZkRYb2JzeUE0WGtpVjZnaDBCQnZP?=
 =?utf-8?Q?qVpQWxnc7sspdb/4z217A2Krj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d572266-338f-401e-5180-08de0f82f3c3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 02:47:04.5631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yejEiftoESJxtzs3JYvIXoyp4p3hRkk7eE1sqTfpV2ny5gqQtIeZQuunqqTfvCnkoXz28CgmlRPh1dWaePhDxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10641
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

On 10/16/2025, Marek Vasut wrote:
> On 10/16/25 8:32 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello Marek,

> 
>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>> @@ -1,6 +1,7 @@
>>   config DRM_IMX8_DC
>>       tristate "Freescale i.MX8 Display Controller Graphics"
>>       depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>> +    depends on IMX_SCU
> Can the SCU dependency be made optional,

I don't think this can be done.  If you grep 'depends on IMX_SCU' in
kernel, you may find a handful of existing dependancies.

> or per-module,

Well, DRM_IMX8_DC(for the imx8_dc_drm module) depends on IMX_SCU just as
this patch does.

> or somehow abstracted out (via regmap?),

Like I replied to your i.MX95 DC patch series's cover letter, SCU accesses
registers via Cortex-M core instead of Cortex-A core IIUC.  I really don't
know how to abstract IMX_SCU out, especially via regmap.

> so iMX95 support can be added into the driver easily too ?

Like I replied to your i.MX95 DC patch series, I think i.MX95 DC support
can be in drivers/gpu/drm/imx/dc, but it should be in a separate module
(something like imx95_dc_drm) plus an additional common module(like
imx_dc_drm_common).

-- 
Regards,
Liu Ying
