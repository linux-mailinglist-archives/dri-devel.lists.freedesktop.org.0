Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DBA6717A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 11:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B68210E1B8;
	Tue, 18 Mar 2025 10:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GEaiDJwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BAD10E14F;
 Tue, 18 Mar 2025 10:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcli5KlC0JNgZkhBnWKhvXDKXYoxx/XkIys+FzVNc7g09Au9sLSbzonYCd+eow33zqdFwxzs8TUvuw7XO2/pU/0P34Y/x8ThN9ReeoKtFT+Gohw2DmM3c3EYLLsNTbeLW/8ldsg9Uw2mPSIwQrLNNLWF3veqzzwsOUT76PokfYKhmx5JLtGhPpM3xx1UGaWcM7k5NNVTZqor+ZGlnGEX+VyHzw7uDAlFCfkZlIDz+oXNZYY7E2h+t6Xn07M6uBjKbQRSoTGCYXFWmFftdWtyft9QOSuJkFOkWXtZcSgjj5/Q9NH96y9NYqhbo8IuaSTX8Ga7HrXV3R85BO5jMfOlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgsHhyVT6ZrdPTDWZctopaP6R8TN5dtCsWBlYdmbhtM=;
 b=v9P6wcg+eUobrdHZBWcEko1jIElzJkW7o4RXU0G5EcokQDETk94lAVxV/nAAjXJ3zndm51zoAc9HB51V6AThrkGWeGVyDU8fCoqSPY3Ein8vHZeB3PtT4Wrpqd03Imwv4oswweASgiRUQtOWPMgWUmGOXozCAG8jEIu7Hfl8GaHnyutM+JZU8lWb9Os3UekMjm1BfAXDpxeHFXjPmqJ6n5OKMRf/Ilm9gvW3n3+BGU28xiL5O9FpuxXnoh3IUrvb3qqjEaUx16Rtg3PDnmESgAdlsmsWgZ/vZ12VlJdAERQa3hcK9lqhyuyTtODfjfGC5X0nv8QJ1zahe5zXNuv04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgsHhyVT6ZrdPTDWZctopaP6R8TN5dtCsWBlYdmbhtM=;
 b=GEaiDJwSfmM9R/Gq7g+h8sY9ikE5Y4TwSCmcAseh2L8ag+y/MLvEqabD+BLoPHc2pCq0D30ga4DlTzpmbOL6WmOGwNP6fVkn+JBxLjuacPilxRrEZmMEi0g1OJ/556T06wQR7kR6wnonjNfbXyuaHpmXDs76tsAiqRf1wCHGT20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 10:37:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 18 Mar 2025
 10:37:53 +0000
Message-ID: <9a1dddba-7020-482e-8636-4f0f31c3bbfc@amd.com>
Date: Tue, 18 Mar 2025 11:37:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris.p.wilson@intel.com, andi.shyti@intel.com
References: <20250318103408.3566010-1-nitin.r.gote@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250318103408.3566010-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c38e7d-d8ea-4357-b0f1-08dd6608f05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGIxR3F2eWp0aXVzSUhscjdYS2ZIRytLbWxCZWUrZXpua2RUcHdEbkxkM3NC?=
 =?utf-8?B?WVIyaDZ2S1BWcm9wYzMyNTJKZVFVNVJIUEF5WEdBV1JwbnlqYnJzd1JGV2Vv?=
 =?utf-8?B?VXdvNFdOdHZUNUxJSVJ0dndadlpyZGpQSWJ2c0VrZUZDblBqSU5BSi9KV3NR?=
 =?utf-8?B?MjIvS2R4MDMxclNuMnY5M2pmc1JsdGZiZjdLQ2NxMUNqYmN2ZkZ5TU44TUtw?=
 =?utf-8?B?dkplZnQvb3N4MW5LWDdhNUx5MGVBeXJySHJ5M0pvWG5SeG9YSkxUdk5id0kv?=
 =?utf-8?B?QWtRTllrZkxhbEE0eVpDR1pVOWhEdCtEUTloWWZrY3Z2UmhPTWYxYUVNak05?=
 =?utf-8?B?YlIyRjhyVTNsQjJ4ak00R1hiblZlOWtkVSsyVkdxeG1IKzVPb0pjMmh4amF6?=
 =?utf-8?B?Mmo3amQzK3BVL1NtSDYrNGd0V2xuM20yM2NlNGdQbWR4T0YycWQrL2dYdWNI?=
 =?utf-8?B?QitpbjBlYmVpMUZ4NVpoeW1vc3k1MUZpTC9aS1VXNGZEZFk2d3BVTU5IbDBS?=
 =?utf-8?B?MFg5WUs1Q1MzanJvNC96ZFdHemlMTWZ2eHZsakw5aG5WOWZLNUFJcVFHMEtm?=
 =?utf-8?B?WkppNi9UUG1sUWZpQm1QQkJqU0U4cXBic0FsTzNoeUdWaEFUTlMzajJwZXlL?=
 =?utf-8?B?TlRRejZQOUY2ZFljK2VER25tS1dBdFgzbUUybzJCTnpBaDA5d1NyMXBrRlR0?=
 =?utf-8?B?dEszOTk5UDVHVGhLeHk1Rm9YcXNJS2FRKy83c2lPcVZzaWFJQk1Xb3NMWGpB?=
 =?utf-8?B?cEhmaWJ1aDJLMkQwbitxTCtpcE1DOUlKZDJLd2NvbFYyVHRhdmZCQjg1L1lw?=
 =?utf-8?B?WlZwUkk5ZTh5RXNDQmdFOHNHQ3lzUnQ5eGNTMk1pK0lFLytLWTFXZ0ZjWnhk?=
 =?utf-8?B?MG5qUEYyT3FKRU9aVkNJRzY1MmEwREZjR2dhWldPNGYwM2J2UGdtTmd0M0Mv?=
 =?utf-8?B?VG0vN3ViV0xYUDlLOTZmNTRxcEJBZ0NyemRlaUZseWNNOE44Q1VlK3VLQkRv?=
 =?utf-8?B?WHMzUGgzcVFJSEdEOEw2Yk0wWGpyMWhTYXp1YjBIYTlMSVl2SWltTUZESTdr?=
 =?utf-8?B?N1MySkpRZE5ybnRFSzlGRVBsam5kdldXYWk0NVg5c1RGTENNWE55YXhJb08z?=
 =?utf-8?B?anUyY2pWdlhKRFhYelRkMkE2dzdXemVoc29OU3BMb3FOZTZIOUxTNzJBNWtj?=
 =?utf-8?B?bUpFQUhMQUFXSVd3eUx6OTY5TlIxcDV3SUtSMTdxQUs3ZDZpeWZVMFpGdkg0?=
 =?utf-8?B?ajFMbVhMTjQ1TzNtWWdFY1NNL3VCajNzdFpaMHhaUFZGOSt4THVPRlVQRXh6?=
 =?utf-8?B?RDF2RXMzbUE0UFltZ3hMWEdCYkVrZy9TdXZKR2VtWktQbHR0MHV3TWI5V25R?=
 =?utf-8?B?dkxiUVJSRkljWXQyVWNxU3A4Nk5lbS8vYmlmck1qMUdnYjdtd2l2dmorSXVV?=
 =?utf-8?B?dDVjUlRybDlxYkpHU1pCNlIxbnY3OTBVODlkRUpPZ29pNXA1OEJqTDg4VWxD?=
 =?utf-8?B?aG8wbFNTdDJ5N2ZRblFGM3ZFeDM3U0tLaGRMaDhnR0M1NTdjV3d1UFpWZU8y?=
 =?utf-8?B?ZkpmazA5WXNOTGg2RUhJS3NUQ0xPVUJ6U0tTOVAwdDJzUklCbTBUaVc1RDNR?=
 =?utf-8?B?VUJBVGVESDlyazZZRlhCYnFlTFRNYng2SU5JREJ1K0E4UWxORkFzMnovQzk5?=
 =?utf-8?B?eFNkRi81MC9YS0R0aUMwR1BNcWhtTzRoYkthV3J1Q0tqNnZncmZLOTRiS3l5?=
 =?utf-8?B?OGhpNmEvZUQ1alJ0UXVZMkhqcFRSd3RlMDdaWFAwQW1UR2JKdE9abUNZQk9X?=
 =?utf-8?B?NGJ6N2pLeVF4K2VtREkwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXlnekcyWXA2MVhWcW0yR0RZU3grS281cTRtVjhlNmhMSFB6enZSMmE2Y1V3?=
 =?utf-8?B?QjU3bklDMURUVUlnUUR1NWVBNWpvK0tZNjJITlVnQ1dzYS9vZjZhSHhad05i?=
 =?utf-8?B?MTJyR1k0TWkzUkl6cHpENG1mcHJ4UG5tVHJQVnJsNTgzTW9iMlNsVGN4UGlW?=
 =?utf-8?B?U3ZvNzIzYk10b3hxMGJWSEtLWHc5by9lSTdrVHpZNWFianBYOEhCaEduTlBw?=
 =?utf-8?B?M3V1UjhQcDRta1c0Yi9NOWRZYW51K09ub0V0MzRmZ3k2SmVyUk5jQUhtb2VX?=
 =?utf-8?B?YUsxNk14WmQ0cTFleVBCOU1qS2Z0WkxFK1ZIbHp0RWNrLzF0dlI5K2dVeGJH?=
 =?utf-8?B?ZHZtelpTNjBadURuK0I3ejk4bHR1UWJqUUowQUU5RDJXSjBmUUc0VXNjN2Qx?=
 =?utf-8?B?RUpqVG9sQk5hVkhRblpTWXMyQ0gzS3Bid3JNeUkyTmZkUmdjVG55dkYvVDJh?=
 =?utf-8?B?YUl4dWtEM3dHSFgrRmdOcUswQkF6T1JBL2U5d2pabTRhSjQ1dmovbktKQVFa?=
 =?utf-8?B?M290THhDMTJ6Zk5zU0krMGNCS1BVdUU3Q2ZScVdrNlJQK2JjUGEyemQwTnBP?=
 =?utf-8?B?eDhOVmpXQldxSUxvNm1mcmNWUjAvM0xnV2F0alQzT0ZLQmxQZ083MWRscVZh?=
 =?utf-8?B?OWtrZ3pJRldCUHZsTFNIaHh4Y0xOS2ZHWEk2Qk5xVWhiZGpQU1dCSm1BSlVQ?=
 =?utf-8?B?SitSd2t6LzdGc2FEQ3R4OWVMeGs3aUQ1aytXeWFTVG9FYjI5OWZDbHZRWU0r?=
 =?utf-8?B?SVVyZUIwd2xPWVJJelFhRmlRV01lSDNOODhYRG9wbmNBSlU1OGNiUEJWQzNs?=
 =?utf-8?B?S2kwTDJ4VnJWcGh5R3I2bDRldlJTaWdwYzk1OHdadC9NZFRpWWp4N3JwbVls?=
 =?utf-8?B?QWc2OWIzclZrRy9qVldTcEhmeTQ5WkFodUZ4dTY3ZWZoL1BWS2VlNDdSWnp5?=
 =?utf-8?B?MVVBd05rT1EvTnpndGJhc2FGVEV6dWVFV2FQcWF1aWhmSXVZVkozbEtHVkly?=
 =?utf-8?B?OG93bm5nTjVhUmtxcDZFbnRIU3FOT1NNTkdsay9lYVpNbkptdmJzWjZGMnJT?=
 =?utf-8?B?c3pZS3FwTTFHVmo5eWEyRUpGYVR3bndhZmlzSXgweTRHWXo3Y2t1SFc4ZEw5?=
 =?utf-8?B?NEMweTNnS2ZoMkR2NHNORThPV000d3NaakpMMXJSRVBKekFOM2k4RFFiL3JQ?=
 =?utf-8?B?cC9UeEt2d0JaOWJaYVVLUTJJenBrOU9jRTdmU2YwQ0VWM3R1aUlYWG1pdkNW?=
 =?utf-8?B?MmIxRWwxbU5sSkVpMDUwYmNmc0EvcGZTYjVTTHRCbEFaZUpUY2taenVYazJB?=
 =?utf-8?B?enJaUUlmL21vYk4xVHRBL3FWMWIybUc5OHNrdHFBbWR4Mmg2dFRtYmhiMkI4?=
 =?utf-8?B?VFQwZUdoL1FWQ3RpTUVCRDU0NmZKRWxQNmxjZ0ZSSDFudGU3aDluM3QzZlV4?=
 =?utf-8?B?WUY3MlprUTRJbk5wV3VxU1E0QWs0VFlrQm9YaVNUQVJsV0p2MVdWb241Y3ZJ?=
 =?utf-8?B?alJjamE0UC8zVlREOGNUQ0l3eW5tdGd4d0lXOExOZENpeE11NWNubFRqaG5u?=
 =?utf-8?B?Ujlvb1c1RlVJS21tNXQvc2MvWXhGbW1MMks5WU80dnRaZ2JBQjIzNmJVL3ln?=
 =?utf-8?B?NnBpRDkrTHc4UytSZnpFMzVlanIxR0JUMzBYL0dRUXd1a3NlR2ovanRVcFNI?=
 =?utf-8?B?L0Jod2tGQmYveHVHcVJ4elJLTXRGRThwWG5yWWVpK01ZU29MVW5SNTRwdHdN?=
 =?utf-8?B?WnlPYnQzOGk5aWN2TnFMZFlKMHdxdlM0WWRhY2lKVGZJNzJYV2tIZ0dGUEx5?=
 =?utf-8?B?WnpDOUN1b2Mwd24vMEdOTXF3bFpOTmZPczFwbUZxU0kzUWVvM3ZXejJlN3lC?=
 =?utf-8?B?VllycHBxdlJsUlZYd1Q4b0g0QW52MWMvaEdiN2FVTFdlV29UVDlrUGdrQ2Vn?=
 =?utf-8?B?aUd1SEltNU12alc2ZjNoQUZvNmpFQ1NmZ0RCamRrcy9uM2tycDlJUmJqUXpG?=
 =?utf-8?B?NzN5ZE1XbVpnL2d4emlYa3BDeW8vTHZxTFJndjNua1ZEZHNWeEhHSG9KVStt?=
 =?utf-8?B?QUxiRSt5emtoZlNLUDZtdElpZlhJc1lTVHZqUFB3clcvTUowa1hucXpMelpm?=
 =?utf-8?Q?wMlAv/QqowfOGyRSYxBiyb8h8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c38e7d-d8ea-4357-b0f1-08dd6608f05c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 10:37:53.7928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vNtcLgxFJtpdkKGHg8EYFaC59KI57zutzolLIovRhTP3DGFO9Of7dSmMTb5ZW6F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781
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

Am 18.03.25 um 11:34 schrieb Nitin Gote:
> Give the scheduler a chance to breathe by calling cond_resched()
> as some of the loops may take some time on old machines (apl/bsw/pnv), and
> so catch the attention of the watchdogs.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> Cc: Christian Konig <christian.koenig@amd.com>
>
> Hi Konig,
>
> This is not a functional issue in test.

Exactly that doesn't sounds correct to me.

> We wish to prevent softlock and allow the
> dma-fence-chain test run to completion to verify it's functional correctness.
>
> The performance issue takes about 5ms for the dma-fence-chain to be signalled on
> older hardware which is an orthogonal issue and to be debugged separately for
> which the test has to run to completion.
>
> So, reverting to cond_resched() which fixes the issue instead of
> delay functions.

See what the warning is all about is that the CPU *busy* on something for more than 26seconds. Even on older hardware that should absolutely not happen.

So what we either have is a bug in the test case (perfectly possible) or we have a bug in the dma-fence-chain implementation.

As long as you don't come with a good explanation why the test case keeps the CPU busy for that long this patch here is a clear NAK from my side.

Regards,
Christian.

>
> - Nitin
>
>  drivers/dma-buf/st-dma-fence-chain.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index ed4b323886e4..328a66ed59e5 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -505,6 +505,7 @@ static int signal_forward(void *arg)
>  
>  	for (i = 0; i < fc.chain_length; i++) {
>  		dma_fence_signal(fc.fences[i]);
> +		cond_resched();
>  
>  		if (!dma_fence_is_signaled(fc.chains[i])) {
>  			pr_err("chain[%d] not signaled!\n", i);
> @@ -537,6 +538,7 @@ static int signal_backward(void *arg)
>  
>  	for (i = fc.chain_length; i--; ) {
>  		dma_fence_signal(fc.fences[i]);
> +		cond_resched();
>  
>  		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
>  			pr_err("chain[%d] is signaled!\n", i);
> @@ -587,8 +589,10 @@ static int wait_forward(void *arg)
>  	get_task_struct(tsk);
>  	yield_to(tsk, true);
>  
> -	for (i = 0; i < fc.chain_length; i++)
> +	for (i = 0; i < fc.chain_length; i++) {
>  		dma_fence_signal(fc.fences[i]);
> +		cond_resched();
> +	}
>  
>  	err = kthread_stop_put(tsk);
>  
> @@ -616,8 +620,10 @@ static int wait_backward(void *arg)
>  	get_task_struct(tsk);
>  	yield_to(tsk, true);
>  
> -	for (i = fc.chain_length; i--; )
> +	for (i = fc.chain_length; i--; ) {
>  		dma_fence_signal(fc.fences[i]);
> +		cond_resched();
> +	}
>  
>  	err = kthread_stop_put(tsk);
>  
> @@ -663,8 +669,10 @@ static int wait_random(void *arg)
>  	get_task_struct(tsk);
>  	yield_to(tsk, true);
>  
> -	for (i = 0; i < fc.chain_length; i++)
> +	for (i = 0; i < fc.chain_length; i++) {
>  		dma_fence_signal(fc.fences[i]);
> +		cond_resched();
> +	}
>  
>  	err = kthread_stop_put(tsk);
>  

