Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67D940E0E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 11:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7708C10E0B0;
	Tue, 30 Jul 2024 09:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="f1ofYy35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013030.outbound.protection.outlook.com [52.101.67.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1377B10E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 09:41:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bemaJjbGpnw8kC514n4K9OmBHocgb+yh5akcbh5wRBiKm9UDMSdkgdqd2UzLTdR75grPzheFBpaXi52laHp96Y1EJb5jlhOcVd4/+JonHMPiodw5RzMEmtnxyVlglvV6tvCZwjRI4erErxhp3McvRlRCczvVFlg96SQgT8JyCKf4fkSYUgHFH6tbVjeTrSsJD/bGUKhtRfYewtkoKDPUz2I1rytKtO4nwFXmmejgTjRvGFSRuqs2JvCZQ8W6+Zcp97YHIAyQWnJSM2VBX46Lq/ANHnQYxppCYi7JjFgFBmRfP7RXXwMqX5C4t7GhrGdEnSNXtooiaiRq6Y095w8E2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3/VQqEgLisAz5XfcheW4PdcUrSEn7AZsAtVQ/BhiYI=;
 b=cq4v1pzbFECIWR5Tk89OH6Ew4orrzAS5CHY0uAeJxddSMF4yQFu2jEBUGE2EEa73HIn4oM4/zaO8/aA/7mn8AdiAUf3HFC1iaMth3adOnGGoakpR4VswycrhnKC72owka7Wy2LpZdI44wZoY/qkz3l9p8On+3pZg3NH7Mfl/ubqrDoTRAZD1EMnNjUhICWXIDjNwpRbtm2gzHETL9+J9EssJwocVy0Ld7/8CcKWDkF7ToYpPCZIPG0lBWCRuwwK9OnLw4yxVbTh1xXUT3mdsfdMpHhGdVkxzeDgynAIv0QwxtkmCsqjFaXx/JBqgGwZPj+At/yqvCqTsk16ENn3OlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3/VQqEgLisAz5XfcheW4PdcUrSEn7AZsAtVQ/BhiYI=;
 b=f1ofYy35WxfohxUgVGZlHaCDDI5eN4TYBwTBVRH2J21Sx6txRhJDKnHwIw8WB3Tyo/z+AmVHegJx3OiGjHuWeeby2wGubFTf5S0qaXWD6edjsUvwdggXJSJx+XvnWkqnUjdgdi5xNAbc7acjzcq1v/iSNst6rjwwd19ttEpLDCE+VMCoR+TPruwmBZCKflVdcTx9JrtoiuRSZk0zdKssxaUv7DZwp71QxytFWcs3IBLcCmME0O608I1R8O5de5J+g7C2veQHrVXWberLB3/4kaK+la4z3KHhbeKrttmBt0343EFKJCHqgWfoE5cWBbClmSVLPTSdcxp+e8+al7w2Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10473.eurprd04.prod.outlook.com (2603:10a6:150:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 09:41:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 09:41:48 +0000
Message-ID: <81afd7ef-c4a6-49e8-b232-8007a25aaf51@nxp.com>
Date: Tue, 30 Jul 2024 17:42:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-8-victor.liu@nxp.com>
 <ibdzow7lvbimaefrp2z2aolgp4pytpq3dcr2y3pegjavvknhgm@2e6j3f4zytqp>
 <107d89b9-e7b8-4613-bc07-9af7b52c2b8a@nxp.com>
 <0e7a8d52-6556-4531-882f-73513f99259b@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <0e7a8d52-6556-4531-882f-73513f99259b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096::18) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10473:EE_
X-MS-Office365-Filtering-Correlation-Id: 53113a39-5894-42e7-f9be-08dcb07bd561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHlaa3hLYUlPS1BlQU9scTZWL3c5a3dTbGd1YjJacGU2WU92RjJrV0JlVyt0?=
 =?utf-8?B?WXhmYkNlNnQzd0xrSytWYzJHdjhZVjc0dHhSNTgyL1hNdllFWUZjbm1tU3FP?=
 =?utf-8?B?a3JpZlhERFZtRXJrZCtvSVdmZnZBOXRJaStUUHoxQnRjakN2SnVjREE1TU5z?=
 =?utf-8?B?VC91S0hoZ0NpblJUN1V5MlhqaEMxeGVYbVNreDc4cVBzV2NCdzhBTnhySk1K?=
 =?utf-8?B?aG5aLzJvbWNXVE90ZzA2SlMrQ2dnNkFkQTQyQitnM3VpVXJVSEVNaDBhbUdC?=
 =?utf-8?B?RXdRdlFtYnB2OFlMQ245b01xbldzcmVWOVRJYVdsMHJ1bHhFd1hLejZmRXZ0?=
 =?utf-8?B?ZXRmTm0rY2pDbWVjcVEvR0dmS3M0YktoSmkrcnJUUlpiVTEzOVdEWVpVb0Qx?=
 =?utf-8?B?ZGhlRW9VaXpVam15WEphbVpBcFFXWGRGL1BndjBtenVrMkdYajdjdzVIOUZE?=
 =?utf-8?B?UHFiSkFDZjB5TGFndlhjSHQ4bUpsSHdtYXFIUm5tS0NqbGJveGxRVEgzZE03?=
 =?utf-8?B?ZFE4UFhOVUlGaDRYcXBrS0JjdHdQWHZJckZ6YVNiNTI4UDkzLzBHVzF3Wmdk?=
 =?utf-8?B?R1ZCWGo2azJvcG5HNWNZOUk0czl3a29FMHdBdjBiVDllMUJFNW8rKzFNdkRw?=
 =?utf-8?B?R2tTQ09OVXNEMXNTN2RKVlBMWHRseVh4OFlVbXZZY2RlbXZrem9IUm95M3BH?=
 =?utf-8?B?eGlrQ2ZSbUxjTEN1MFFrcGxSdW0rbVFvM2VodWN4b3FwYXNNc0VvM0lkVGwv?=
 =?utf-8?B?RjhZSVhoUGZiTVUxS3U3aTlKUHJ5UHdxcXhFcVdhckZaS3FLTWRmZ1IxeEQw?=
 =?utf-8?B?dnhLZWpRNE9rTFY5TWRFY1I5dlpZNlRHeWIxR0JjVXI2c1hnQW9WalJjTjZJ?=
 =?utf-8?B?OC9xK0xpT3pZUWd5UjRPV3Q1QnRBMHJORks3dDhSSWNkRlZhbDg2Tlg5N1Vw?=
 =?utf-8?B?NlAyYUNoYzl6emhxbjNjMkRCemtNUm9RNnIraDVRdXoyWXJSK1V6R0Z1Mmpn?=
 =?utf-8?B?WDFSQjFNK0ZGZkI2aGd4bE5jOGx1YkdaNlV6S0w5ZmRmQk0wZXdFYTFRTHBT?=
 =?utf-8?B?RDkzZVkra3pCcUt3ZFg5alNxd3BHV3NobWNDbHUvNmdtNHBmNE93VVEwWUJZ?=
 =?utf-8?B?cUJrTXg2dW8yTnh3TUNoNG1PeVNtc0ZyTUpFdTMvS0xwWGdYYTFsSkZhbVZ2?=
 =?utf-8?B?UEhkTSsrRkQyODZ2ZGhLNmcrYm50TGkwcnhPN1dhRUh6cGN6UHYrUmszZ1lG?=
 =?utf-8?B?QzRVaExGdmcyczdhV0UyOFphVW1KRUk4RkMrcWxFSno4WHBjY1Z0cm1FM09o?=
 =?utf-8?B?QzVXaHRpRGgwc3pjYjByVzZnRGR0STFOTTR4V0QrVThuY0hsUThoeWNlalhm?=
 =?utf-8?B?blo0M1RQc0M1ckQvZm0zZmJhWVRkKzNiZUI5ejR3dURibC9EMFRxOWE1OUIx?=
 =?utf-8?B?Qlh1QzRMWENJVXBqbS83VFMrd3B6dGMvY21NZllPTC9ITHkrcnpYS2JYbVlp?=
 =?utf-8?B?UXdlNnhzU3V3aVREeEpPeEd2V1Q3TzR1REpWRHc0U1l6UVdxaG5vMVhOaEZk?=
 =?utf-8?B?ZS9mTW93dU5hQjFjbHN1YXFDSGhhdE1RbTlqdUdWVG8rMlExaEM5ODBCOStk?=
 =?utf-8?B?VHl2L3lBQldpSC9qbkR0dmZJZlJIbUpweDRrSTg4ZGp5cFVTaUF1cEhNaFlk?=
 =?utf-8?B?eVo3NW5RY1lUYVN5TnFoazE1NExsZWtrMi9Nd3pJVmhzdmNLV0FwRkNIME1p?=
 =?utf-8?B?aU1EWE5qbXhnTStBZlorVi8yZXhxL09CWHhhNngrWk1tcllCblBGQ3V4UWNV?=
 =?utf-8?B?NGRGU0t3aU1uMDV5c1VTdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVhCU2pzL3RMVDV2Y0JvRzVSZFhOU3REVGJjZGJOckd0Z1VuNFVibmw3R2ty?=
 =?utf-8?B?UXgwRklIM2l4WS93cTVRT240OWUwWncvck5pamN6cVJ3Y2xheHdoNnlvV1NF?=
 =?utf-8?B?Q1phRG40dm9aM0VRVm84alhMQ0IwOVZjVmJLVG11bU9sanlmUWZjRXYxdXlE?=
 =?utf-8?B?amZIWk1EdG5WRnRVdlFWQnpPT2p6cjVKcmEzODdIZXdzSTJiemsyN2owUkZ6?=
 =?utf-8?B?L24rMDUwRS9UT20xY3lQeTRlUXYydklkVGpXa3BOOUFqcCtoU0dWUzJsUTZi?=
 =?utf-8?B?NTRsME5INUJ6YnIvWDd6NzU2SlIrQWlNSUh2eGNUQ2w2Y1NwK1RpT01GSklw?=
 =?utf-8?B?Wm9Rb3RwNEdFVEsxZHQ2a011SkpPbklwYUZNVzEyUndkQ252QmZMTjRKRmpi?=
 =?utf-8?B?WHluQ1g2cHEwUllPcWpuNm9KNkIveFFncitrdGJhL01yWVFVa3ZkbXZZUUph?=
 =?utf-8?B?YjdqQ1EyRTJKMVdxdTdXdEpnSmhlNGVXdmFySEFqdUVlV3ZCaFFKdGx6TjVJ?=
 =?utf-8?B?MUQvL1ZJZ0h3YzVFdmRKaFBKOERTN0t2ZUdrOUtzNGMrd2Q5M2YrOVI3UWEy?=
 =?utf-8?B?d1daTGlrY3BXbTNIcDFxZkF2ZnZSN014OUJJNVQxdEtyWVozaUp3S2Rwd1l2?=
 =?utf-8?B?Y0VKM0o4bFo3NFlGazJMa1dkYTlnenFIK3ZOZ0xMMGtsTGgvOSthckVidkEw?=
 =?utf-8?B?aDBSMVhVeU1QeElCNmNJTXorR01sL2JvRGZDQlBIRkxuVGdwTHhkM0JUUzcr?=
 =?utf-8?B?cTcxUmpnekNqSS9salRKazRNNlN0amVnQkRWc0JmUWhCS2o5bjFMbVRpcjhM?=
 =?utf-8?B?bVNBc0F3blVoOXo3Nnlzd3djMlVMK04xdkt1STRBQjlIRytBSzhnYlV5TzNh?=
 =?utf-8?B?Y2wxNFVGMlQwekNWZ3Y3SDl1WTdKS3VuMG12aEs2NmN6ZEVMME5wOWt5S3kw?=
 =?utf-8?B?UTZVYUVRNjdkUzh1MjFlOHprSGR5K2ZjZTY5NSt4K2w1ZXdrL2Nlb1NlTkZQ?=
 =?utf-8?B?aXhnUTBRcml0VDJPdCtYaHFIemFod201TTRHOW0xc3JqYk5LTDgzSmRUVmdm?=
 =?utf-8?B?WmwxUlhxR1BBeTNDdHN4NGIxZlhQTnZXdUZQbVlpeHFXck1sd2NtbDU5WHFM?=
 =?utf-8?B?NE9qckpjNUhwYUsrQS9JUzRmYndkeTlHbEsrTElqWEdwVDZ1VDVsL3JLbUVZ?=
 =?utf-8?B?ZVlFQjNwMHR2Y0dTcEZsYm9ZanVoK2tZcHFkRitSaDBLZklSYy9ndEh2dFEy?=
 =?utf-8?B?YVFkWUdobEJCTkhNemVkWW5sYzR2eTgxWHRQdlNPbzV2cHZIcjhYZmIvVFpV?=
 =?utf-8?B?NG1pSDE0MUlpanVjYzh0OXRTMCtmMFYzZjZIZmJnK3Q0Zm85QjNWQkFhbURs?=
 =?utf-8?B?SkJLYWxhbW8yQmlNcGZHOVBkd2RHMG0vRmU3S2JiTHRwdis1eEVmaE1hQW5K?=
 =?utf-8?B?Q09VblptR0ZhOHdWSWFVU0pCMVBWSW1IUFdvMnA4WDJlWVM0RktacXd2R2pk?=
 =?utf-8?B?OFEza29KT0libjBReloyYldYVDBhQXQ0U1BOdERxUEVzZHZpQTZKQmt3djlM?=
 =?utf-8?B?cCtqazY5UUNZN1BOVmYrdFNTTG9oMVAzNitpc28wVmRmTWNlQlpmOW5MU0pL?=
 =?utf-8?B?M09pNFJyYkZwUzBpMjZkYWJqUDl4eEc3eEdGZ3I1ZEFwb3BYb2tPZmp1aWxy?=
 =?utf-8?B?QkV0WktUUHpUQ3p6dmZWdkpDdi8xZE1EeG5hb2dwUXFWakxBVjVxKzBwU1N2?=
 =?utf-8?B?RFZFZm5qS2pNOHZEd0NEZmJUQkNFZWJPWGs3Uk9LQkpGME1kckZYSW92TEVw?=
 =?utf-8?B?eDVOOURlZEJNZnNaa0V4M01FeGpWSlJhYkI5OTV6TG9YRFQwWVFHb0lMbFZw?=
 =?utf-8?B?WmdZNlFwQldOT0FWU0xCWTNXMWwrNHNCeDZnekxBblhTMXlLNlFjY0psTlJC?=
 =?utf-8?B?bHdQTnErd0dQVTd3QStlOUVUU25rWExVVFVSTXZVcUJTZXZYNUxEeEZzTEtI?=
 =?utf-8?B?aDc3YWo1SkpMeEhCSFk1M21mQWlSWlUzeTlLNUdIcE1YcGlTcFA0K1FnM2lj?=
 =?utf-8?B?QmhLZWN1bmU0SUl0RnpNU0laOEpOL2g1L1NFTjg4ejJKQmJqcWhYcU80R0My?=
 =?utf-8?Q?RGVAsMrMmKA2wmuco39XrJanc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53113a39-5894-42e7-f9be-08dcb07bd561
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 09:41:48.8194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh+OGJA00lNkWkRRtb9XhaoL//4uWpeDROBWyuBjz0lqbHbUjGCB0lAYFu04lvQO3a6AObu4koTKAfvJ4Vwgcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10473
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

On 07/30/2024, Krzysztof Kozlowski wrote:
> On 30/07/2024 08:55, Liu Ying wrote:
>> On 07/28/2024, Dmitry Baryshkov wrote:
>>> On Fri, Jul 12, 2024 at 05:32:34PM GMT, Liu Ying wrote:
>>>> i.MX8qxp Display Controller pixel engine consists of all processing
>>>> units that operate in the AXI bus clock domain.  Add drivers for
>>>> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
>>>> well as a pixel engine driver, so that two displays with primary
>>>> planes can be supported.  The pixel engine driver as a master binds
>>>> those unit drivers as components.  While at it, the pixel engine
>>>> driver is a component to be bound with the upcoming DRM driver.
>>>
>>> Same question / comment: create subnodes directly, without going
>>> through the subdevices. A lot of small functions that would benefit
>>> being inlined.
>>
>> Like I replied in patch 06/16, I can't create sub devices directly.
>>
>> Can you please point out typical ones for those small functions if
>> the comment still stands?
>>
>>>
>>>> +static int dc_cf_bind(struct device *dev, struct device *master, void *data)
>>>> +{
>>>> +	struct platform_device *pdev = to_platform_device(dev);
>>>> +	struct dc_drm_device *dc_drm = data;
>>>> +	struct dc_pe *pe = dc_drm->pe;
>>>> +	struct dc_cf_priv *priv;
>>>> +	int id;
>>>> +
>>>> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	priv->reg_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
>>>> +	if (IS_ERR(priv->reg_cfg))
>>>> +		return PTR_ERR(priv->reg_cfg);
>>>> +
>>>> +	id = of_alias_get_id(dev->of_node, "dc0-constframe");
>>>
>>> Is it documented? Acked?
>>
>> Like I replied in patch 06/16, I can add aliases nodes to examples,
>> if needed.
>>
>> No Nak from DT maintainers I'd say, but I hope there will be direct
>> Ack(s).
>>
> 
> It was not Acked, because there was no documentation added for it.

I may add aliases nodes in examples in next version, if no objections.

> Anyway, naming is quite cryptic, e.g. "0" in "dc0" is quite confusing.
> Do you expect different aliases for dc1 or dc9? But anyway, aliases for

Yes, I do.  If the alias approach is used, DC instance ids need to be
specified in aliases.

> sub-devices of pipeline look wrong.

Why?  They are separate devices.  Though I agree with Rob that
aliases should be generic rather than vendor specific, it seems
that there are some vendor specific aliases in upstream device
trees.

Any better way to specify the instance ids?  OF graph ports?

> 
> Best regards,
> Krzysztof
> 
> 

-- 
Regards,
Liu Ying

