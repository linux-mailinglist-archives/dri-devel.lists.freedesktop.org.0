Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2D6954601
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 11:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D808810E570;
	Fri, 16 Aug 2024 09:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WS6k9xfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2047.outbound.protection.outlook.com [40.107.247.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34210E570
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 09:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYvRl4AelckJi6WvN53nSXtwAigNjsppcZhdA81zS4L80l3/8RtgyrWjvmg58uFiG1JDVeu5NN80saBGmE2Frcxq7MDBaCabfjuS3N9An5qqbw3TKRmiy5GZaZu4osja3Q14Pic94GI0q/yh6rtMOEJ/hr3M4QFWJbN48SgdGJzXPbj2uA9/K1xJyZCkCIt2gxyi/za/rZa2oNS8U34zHQHghrJslxKUmsdqWSQJ97W8uy1HTHoX5o4encfW3NPOniepJLM/1mMDnmB7VEoRfco2DLvO5MiZvM1f7tahZ5QrH9RctwDJBaeCd0ai14VWkH4zMiqyrldKqvNp000+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT3Zkud/mE+wQ8ne/+xKHHtxHt8yIh5jjdtSMNW7KA8=;
 b=V5TajV6BlW1pc8fD3EYOqx1L+J+6mmST+rnzCxQw+Cze5IMCuDbtO+ZhUUn8PBsc3jvBKtwZd46Gn37YKKBECnsRTXA4z0p9/osmlOOWf3UWYBBu67Vt7sNN+MKQK/yH+LMeX1mFvrggz6irJTKV5GEaHBhaRbMX/JWVOr2VOqzsWr8lhEMj7Jo2n+RpWTjTURjWMT26mS4bR422YONehaUuM/gslJCEDoybReF29ZQvIBMHM7tGa2oEi4AhUpa0VDWgjMaBSqdWVeDqZgdFT/pc+Er7YUp28Oj0yaBe19RVIpINow1x7OIYGWoxR38RUzmtCNvYypHjPBttuUqLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT3Zkud/mE+wQ8ne/+xKHHtxHt8yIh5jjdtSMNW7KA8=;
 b=WS6k9xfMW3NiLFXxsBGk2luUH8LixmTmbnYowoQTu9IaP+eZf+SIL7SjSIm0z/QpWE35hVHHXDUZa/9v2/ZAS6o9AUM1c3PVmOSHazmxaZDs9RUCZRI+0PcklH1CBsWnq1W9FJWze9Zx3dQaiJCOmat2eJEjRbqgoTouOtOsXCx4ydz8Njq5WYABjMtkJg3qX9lbSiRXSglsKWvZJ9EV2WQYObxHI14OjRMdNprIoSiY2Z6Q5hP9oTuzDVRSQPZVLVxMr1H2CwNSyhvJbSwDpDohjBwdnyjTfLhsRLPO0jgS2qspkM2bvPP85S8yFAz3tYl+rVqHaUfm+KHDgIQ0DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 09:44:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 09:44:30 +0000
Message-ID: <613b4eb4-dbac-48a9-bcdd-79b4e94a7b66@nxp.com>
Date: Fri, 16 Aug 2024 17:44:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/2] drm/bridge: imx: Add i.MX93 parallel
 display format configuration support
To: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 peng.fan@nxp.com
References: <20240816080933.440594-1-victor.liu@nxp.com>
 <20240816080933.440594-3-victor.liu@nxp.com>
 <faf56b73-2143-4f5d-8e35-5cfe5f8d72d5@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <faf56b73-2143-4f5d-8e35-5cfe5f8d72d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: d606aa4a-c542-462b-0088-08dcbdd806de
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1FKMlhOeDdlclNzTk9ETDZJL1lyRFJKRjhpQVRMMnVMS2pmc3lMOUpObjdk?=
 =?utf-8?B?d3lUekdHSU1ieWNaTzF4Nzhma2paQ1hhU2JlQTNpV2dqUUN2NUQ4eUU2ZkNo?=
 =?utf-8?B?TVRKUWQzUElFbnR4bGFUNDNnK2RMb3M1dm1DRnVLanY0TDJZRHJuMGRQdE1Z?=
 =?utf-8?B?QklrN3FyUmJlaHJnY2lWOFVFeklpdXBiVmU0UFkwZjQ1S0hpUzJqR0ZHa3Ex?=
 =?utf-8?B?UjNNWlh5RTlwZE9lYXMrRXhTSS82eituZjBYNG9QMlhNL091cHdNZlJaMDlw?=
 =?utf-8?B?UnpVeTIvTnAzaVNJUTRyam5lZ3ZhNzkyNVlaWXBwTWhuQjN0NGtXRnBxVml6?=
 =?utf-8?B?N2FzNEJWaHJXMWFaV082aUFFUmJkM1Z6dlFUcGlxeFI3QzgycFhCR0hIZ21M?=
 =?utf-8?B?dDE2dUNuMnA0TkVxN25NVEc4RVFKd05za0gybFN0dTRkNDVFeFZlYkVYT2lo?=
 =?utf-8?B?OEVTcklXdGlyTExqZWdpOHVnWlM0NkhUcTBSTG84YS95b2tKMGt5U0pNbXhn?=
 =?utf-8?B?Z2RvSC9jU0RsZzN5MG1JMi96WVp3eTAva0U2eitibTk0T0tPZ0ZNRXhZM0o5?=
 =?utf-8?B?b1JXdkRJOWswMlIvdWduRzdMeHo5Z0tROXZLNWtGSnhST3RnT2k5c28wOWVC?=
 =?utf-8?B?N2ZnZ1RDVEg4N2J4Qm8yYU0vTXVNM09UNlpvbG5oMkpWU1N6ME5xTFUrMXJP?=
 =?utf-8?B?N1RheUZidjBjNTlVS28yZjFLcG9US1RaK09ka3hESVJpUjl5WkorR29RaElQ?=
 =?utf-8?B?cUpqVEZPUGJic2RlZW1xdnZsR3RWalZISVc3NGZNQ2hKaHpiY21uSkdiN0ht?=
 =?utf-8?B?TW5hdmVrL2pPVHpaazBjTlBFcWo3Z1JnNXNGVFFLUEhzTFRjYm13YXNTZE5G?=
 =?utf-8?B?YVI3c2txdm1BVjRQR3VRcUc4ZU82b1hmaVpTODR2S1lvelpSZXZVVnltZ09y?=
 =?utf-8?B?aHZ1a3BLWEI2alRsdGJySFlXbHNUdVhwakNyVEc3UEJXK21HQlE2ZkRWVUFq?=
 =?utf-8?B?V2tFZ3poZndJSElOS2twcXRaVTlOMzRseE56ZVJNcjJsVDhkeEE0VlVKZ0lz?=
 =?utf-8?B?THRkUHozOFZRWHkvNXZKTnBUc1dDRWVaK3NLNmsvQXZCc05ubXcxMThUOUlM?=
 =?utf-8?B?bGI1cHFMNHpoSHdZdXkzZGx4RTVnbjF0aS83UStsMTRpcDAzMzRVWUpFM2pK?=
 =?utf-8?B?Rml3cXQ3Q2U5a3RnTVBBM2wwVmx4YU5acXJuNVltcFpQQ1RGVWVTWmc3alV4?=
 =?utf-8?B?bGt2eGJPK2EyblBhNENMejBpbWprVFVGcFRGd1F4amhVdkVWSGtDMko5b0lX?=
 =?utf-8?B?Y3JybGhiRUtiWFZTd01lanltTGRpTUpDMzV3WWtSeFRXR01vV0hTbjdiNmJK?=
 =?utf-8?B?Y2IxSGwxMjZ2TGxHMUFENzcxcWU2MzZnUnBIV1phNkNtV2NpRVIvTzdoTk9W?=
 =?utf-8?B?L3FDWnVLU1I4bTlXMFpwS2xvK2FhazIxMm9jbzZrTk9lNnNHT3pFODZOQ24y?=
 =?utf-8?B?dExqTFpROEdnUklyUU1CbTJITCtiL2ZzNXBaRWQwNXQxL3pBTk51Yk00UWRv?=
 =?utf-8?B?aEY4UjdWTTNHNmUvN2VNazdJNXlIelFPWnRqd2dVT2lUbUlBTkRTYzgrTHAw?=
 =?utf-8?B?QVh3UTlEcmlSakFyN2FyMlNqdjhRMGE1UldRa0xFZ0d1eG5OU1p6cktkUDZk?=
 =?utf-8?B?aU5LNEdib3lMcGRtbmUwdVVjQ0lRREZjc0pycWxJV2JVV3pNNGdWMlVwU3Q2?=
 =?utf-8?B?akR6TlcwVC9FemlUbVlNT0E1V1hzYmVmQURtcmJoMTJsQVJDMFFMRWh1VkJk?=
 =?utf-8?B?ak9LTVlGVjVuVk1YK0M4dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnhKdktGTWpmbUJ6b2FZOU5LYzRYS2ZkSTdYQmVXNkRYTVY1aElqdHNQWmxB?=
 =?utf-8?B?VWx2bU9ldGtqaDhWeXo1bEZabEZpVkdCeUxKVUlKd2VYYVBGL0ZQa2NzQysr?=
 =?utf-8?B?RGRhVFU5aDhqdXJmZUlKTG9NTmp1VjNuZWttc3dzcXJRWHdqV0FQMUR4UEth?=
 =?utf-8?B?RUQ2RG5IRHgxVlVTclNLSlFZMTZ1RTZXRmkvbzc2bHBjMHBUK2d2bnJtS3ha?=
 =?utf-8?B?OXUxdDJMUFFmZlFYdWZQOVNVU1JsL3BoRlF6ZEVlMHFtMnpLYjNoOUVCaFN4?=
 =?utf-8?B?Z2tDVUxNeGZ0OWoyR3hLYXFVbnJZMGxVWUE5cWZpc1NZa1NsWEsrYjlBMk1F?=
 =?utf-8?B?eEhIeWV1bTV5K1VWY0YxYldRNWx5Nm9ibHV2d0JHaVZNNEFwYmJYcFpiYTRY?=
 =?utf-8?B?WVlqTjFJRkdRK1FkVTdoaElvU1Y2MmZlNGxKODdKYUNrVHZGaHNBeXdSeWRL?=
 =?utf-8?B?V1d1d05FVy80N1dKSXFaeEhKL0RFVHkvcm9MUk1hK2d3RS8wZTFFWDZoT051?=
 =?utf-8?B?TFc5OE93WW5UZEg2TzQwZmNabVNJMFFwSmlIWnJycEx1RVZXM0RqbHpnaGlD?=
 =?utf-8?B?djhzVkZNdys0WUdVVlFKUmFjSU5CcHQrZzF3ck1HakU4R1pZNm82aUExR3RH?=
 =?utf-8?B?bFlSR3Y5SWp5dU91ZmFmNFBzeVUxeEFFd1gyRnZ1QmljK00wZkltWGN4NUtQ?=
 =?utf-8?B?Ym9HZXVRTU1XaUhDN2pnNWEvR2p2WnhyVzkvS2ozTHBHcDYyL25OL2ZPd1Fq?=
 =?utf-8?B?UW1oSng3THc2UHV4bERUd2hNUG9EZ28wcmVYbUxpMU5pcXNPS0cwUUJHVlUy?=
 =?utf-8?B?cDV3Mmd5eldOSUNpUVMwMEUydCtTV1diMGl1NjFGOCtteVkvQmM3VExES1VS?=
 =?utf-8?B?YUppcUo5bmNNdTZUZGM5VWJtTHBIcDJ0YnpPYTRIM2FodENiRmhqVXExQXBq?=
 =?utf-8?B?WDlKWWdFSGNldnJCWXg2Mk13Wk92OGlTSjkxeWNYVzBoNisxa21vcUpBNC9J?=
 =?utf-8?B?TDhtT21Oc01sNmduL3ROdjIwNGFxd0JWakUvWi92cWptMk5ud0h0SkJaazIr?=
 =?utf-8?B?OXFnU1RWT3ZHa1ByelhaUVJNMzR6bytLNWwzTVJSY0VIdzNQbkJ5R0psNFc1?=
 =?utf-8?B?MmhXeS9PQ2o4blRsdE5kQXQweWlBSmxwS0lmNUJhYUUyVlFFbTQvaU1NVGpG?=
 =?utf-8?B?dzdqZXdRWjd6cHpqT21YUndsVStmcDR6SWZVRkRLdWFtRVBZME0wd05XcUFj?=
 =?utf-8?B?cmR2emszS0ZwSEdPcmFSN2NLamZzQ1VxM2ZyQ0FjdVpSOVdsckszOWs3b0g4?=
 =?utf-8?B?dlhud0RoYTlHS20weEw1R3M4dk1HYS9WT3M2RzJkbW9YaE5JRHZCYTRqL2RU?=
 =?utf-8?B?V09BK3BFVlNrTGxLb0tSQTI1b1hsNTV1emlNTjFpaldZS1BPS0Y4aU9uK1BB?=
 =?utf-8?B?WlcvbG9PcGd4UjdpdGEySHF6T0FjQkVTb0Y3bE11OWhtOHFZZERaWmFFUWth?=
 =?utf-8?B?NldZMkM5SnhEbWRIYmQ3a0J1NkM1TmtpWkpJMHBRVENVNTEyM3Q5MHlJWmZL?=
 =?utf-8?B?RWJlakNIUS9kd2lCc3AwSFZ0TXhML0JTK2JNdU0zRkhhSW9TVVB5SFFFNWJm?=
 =?utf-8?B?SVZwWC9UcnowNTVNay95TU1pQWJYakYrMmFjcGFWNG83UmphUld6RThEMkV3?=
 =?utf-8?B?b0Z0RkY4N1JFZHVWZ0hEY3hCejVJM0NUbzRNVFdBSDVsMW1lSDdaTXZPVGVo?=
 =?utf-8?B?MmMxS0lOU1MyL3k0Q2tqRDVDejAvQlluU1ZkaFVzZlF2YkFTRWdXQWdRamMr?=
 =?utf-8?B?RnRzRFU4S3BlRkJoVnBvTWx4L2ZLM2x6T2d2d2ZlZnRmcUJwSjFhU3dOTU5n?=
 =?utf-8?B?eUxHVFRFL05SNVh2SWs1ckc5VWhERVlseUFyeDJuaFRCOEowNkZVZjJxd1hm?=
 =?utf-8?B?L1JqeXNvem5FdTF2UStTQlJoa1g3NTFLODNVb3F2THM0N2xZUFhDeDZBeUVk?=
 =?utf-8?B?SmxhOEdFeG9idmJGcUNTaUNZSFk2MWFJdE5Tbk0rd0JvRmRPWjNlMm90WC9k?=
 =?utf-8?B?eTQzRUFxYmVFNnljSXpJYXBTUWdRVUNIUkF2QmNoTzFOdFFONGRmZnJBUW5V?=
 =?utf-8?Q?uwneyCT2R09+/EaIKV9p1exLt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d606aa4a-c542-462b-0088-08dcbdd806de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 09:44:30.8177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AstTrz/IX9BrMzAFl32DHdRyi/59pTOW6Oirw8PgBfHaOeeG1hSkQJJNkhq1S/2sRrnvlhIv5TNye1SZbEL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625
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

On 08/16/2024, Krzysztof Kozlowski wrote:
> On 16/08/2024 10:09, Liu Ying wrote:
>> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>> field. Add a DRM bridge driver to support the display format configuration.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
> 
> ...
> 
>> +
>> +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct imx93_pdfc *pdfc;
>> +	int ret;
>> +
>> +	pdfc = devm_kzalloc(dev, sizeof(*pdfc), GFP_KERNEL);
>> +	if (!pdfc)
>> +		return -ENOMEM;
>> +
>> +	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
>> +	if (IS_ERR(pdfc->regmap)) {
>> +		ret = PTR_ERR(pdfc->regmap);
>> +		if (ret != -EPROBE_DEFER)
>> +			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
>> +		return ret;
> 
> Nope, you just open-coded dev_err_probe. Syntax is - return
> dev_err_probe(). if you need wrapper for DRM, add such.

Will use dev_err_probe().

> 
>> +	}
>> +
>> +	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> +	if (IS_ERR(pdfc->next_bridge)) {
>> +		ret = PTR_ERR(pdfc->next_bridge);
>> +		if (ret != -EPROBE_DEFER)
>> +			DRM_DEV_ERROR(dev, "failed to get next bridge: %d\n", ret);
>> +		return ret;
> 
> Ditto

Will use dev_err_probe().

> 
> 
>> +	}
>> +
> 
> ...
> 
>> +MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
>> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_ALIAS("platform:" DRIVER_NAME);
> 
> Which other driver needs this platform alias?

Quote include/linux/module.h:

"
/* For userspace: you can also call me... */                                     
#define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)   
"

Anything wrong with using MODULE_ALIAS() here?

> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Liu Ying

