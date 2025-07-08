Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D3AFC5F4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 10:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C343710E5C1;
	Tue,  8 Jul 2025 08:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jHmbudea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A010E5C1;
 Tue,  8 Jul 2025 08:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbIF0o4jw10+V6NZ5D2sKGDmPFn/TzU9cSd/7T/RNu5DSITqoF4GnsZpbXpnYrmtatvCUJc95FXssL3afbGX0c0Wmib5iTTbBOT8M+O9hlqEAFR8Lx+58Y5r2bmQovB6HO+7WK1/mtW6BD4vCBNwHlMGyF0bz3YzLZ3PJqEE4dW2ZDkcTclawrnLQPFiU0o0lq5Ar7Cer3QAel03I8rxg73eYTyAROlIlDztROJ0prL6YM/2SYv7I9t/ZtI3C0W4wyfXGP492013wSfxoclij5ozZwsOtGAlk8j6ErI6ZA9hoysgNEObj1tOmsz3G40gsqgwKhKQ4WHMEAjVLSNsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKhlP52WgbCVb8TevNGqerk73NyrkAYMr2Zhfw/HxuQ=;
 b=ye7OFq913xTQ1yK2Kxsfa+ReEXtd0Zmhe29e/PUYPzr2Qk4c0vpYvR0P512aTZKf0wOyGhcF8yEi8et0urQb1JtEL43JqOwZT3JlZm7Eg7KvJX4e8BviFt/iZ8KlTfhAO6Ef4ezcgvUZFdA+UWR5ZsD5/Xh5I55PANky7Y2Op/n5WPCTaHlsJ42U6+zsyAXO0vkYDmSQ5SsrGn46G5tzhESfqbLEy2SihXiOkFxsGVt/ACkiRSWicQcs7ILlow8wuxgOEByDRtYRkgzqHnxYyrI/khThcHOPLtQR57B6TznwCc4aQN6z/dHWO7vAfG096I6QiVzZdTdMPazXdmHqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKhlP52WgbCVb8TevNGqerk73NyrkAYMr2Zhfw/HxuQ=;
 b=jHmbudeabW/FTGXDvH43NyI5YiLNGqsKuZ15lZQwnV43csEGhVelMqZV/Ui686D6iZxkrhFGW1xlyq96sqTqfLgEp/zWy72/zBAyKhVBf7aBGUCEBALQYJ1Nl/QmhGTfTNjB0+bV8fJULyavEF/YBaAgMKgdCeuexOgw/1Eh/B8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS0PR12MB7899.namprd12.prod.outlook.com (2603:10b6:8:149::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 08:41:55 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 08:41:55 +0000
Message-ID: <02a0608a-d0cc-4cc7-9a99-a29dc006fd72@amd.com>
Date: Tue, 8 Jul 2025 10:41:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/amdgpu: move GTT to shmem after eviction for
 hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 rafael@kernel.org, len.brown@intel.com, pavel@kernel.org,
 gregkh@linuxfoundation.org, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: mario.limonciello@amd.com, lijo.lazar@amd.com, victor.zhao@amd.com,
 haijun.chang@amd.com, Qing.Ma@amd.com, Owen.Zhang2@amd.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-3-guoqing.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250708074248.1674924-3-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0414.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::7) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS0PR12MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be2f5d4-6103-4bb7-ab46-08ddbdfb4b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2tiVkpwWVJlQ0kxdXJPZjk2Z242MmI2SWg4RTJFQ21JNW1aUDhyN0RPSUdm?=
 =?utf-8?B?cDhnNkR2V0pQaVE2NWdJRkNoY21aQWZHUXgzUVM4TGdhWHBURXFwVmFnS0hZ?=
 =?utf-8?B?UXJSbW01Zjg5OUNad2d5amgrMGtlc2YxOHJDVDNDY0lXakJzbmRLS3V2TFdK?=
 =?utf-8?B?cUtmUnZneXN5bFFvNXdFOExnelY2ZWZNbm82U3RTb0ZFVkw5TW05K01iNTZM?=
 =?utf-8?B?UUtXSlRIZWt6eG11eE9DSlBIc2VZbWdiRDc5VzF6VmlxaTFsMVpiank1UXJO?=
 =?utf-8?B?QVhVOUhVbkZyNWVTYWNMNUxPbG01eitLWVVadXNYT2JPVUpwbHJydU5URkV1?=
 =?utf-8?B?OHl5Z0NEOFB1SEZEbHQ5dTU3OS9oTTVONVg5UjRBclpDMHJkTEZYb3hVNTZj?=
 =?utf-8?B?TFdHdUN4MkMycVhwaVdKWVMrcmRyVUUrd0JVWks2VURtNG5EdGRicHVhalEw?=
 =?utf-8?B?M3VZOUx3RlhnSEJFTTVKYmRCdWFwVjhjRy9oZ1B4Nlh4V0FJVGZzMnhZV28y?=
 =?utf-8?B?ZEVCQy83U3JoTlVHZGk5dXlnY2RhVSt3eWhxUWp0VW9Ec3NZRzJNSlpvNm9U?=
 =?utf-8?B?UENvT255UjlwSkNoUFdIQkhvbTVJQmNrSUIrenVSV1RldlRkUS9teVRzcDZJ?=
 =?utf-8?B?TXlETCt5ajdOeTNYQXMxZWJkT1NCTnlxbVovQTgyTFEvNFRJVFVjNXlhWGFp?=
 =?utf-8?B?RGZCb21pUG94ZnNGaDA0YVA1K05MMmI0ZEFjNThyYkJtZHpybmFVSHBEc01V?=
 =?utf-8?B?YlVvUUp3NmNpaVVmZ1ozMGVTQmZFSzZnRkU3ekwyTm11UWQrK2tnYkd0elps?=
 =?utf-8?B?Y2tldmN2M3huUmduUnFRcDQ1T0FxQ3FRenJ5R08yTGZZL29oN0lOSE5oQm02?=
 =?utf-8?B?dFlzUmxpVVNxUDAweHRSLy9GMlVLVWxEaEI0aTVweWFrQ2RJNUVaR0lvakEz?=
 =?utf-8?B?Y2R3Wm1aZDluZmgyVEFXREh6WjVCVElTUnE5WWc1QWtzTEd2VERoL3h4ZDhw?=
 =?utf-8?B?QnJ3ZHVnejN6NWk3eUNSeXU2MUJMbHkzRUw3UDhnQTc1UmdKY001TDJLTW9Q?=
 =?utf-8?B?dEhQWnlYeXNhOUh2cXNVWjY4QzJ3c2tLUEs5TWRoZXppbm5ad0I3elRoTG8y?=
 =?utf-8?B?ODVxemVBWFYyMmlra3Bwc2FiOGpzeUdEMW5heHJLRDhhdGxkZDc0WVBoZ0Z4?=
 =?utf-8?B?ZEpkaVNTQTZzdjJhWnF4VWtzUlJEWUZVa3U2R3VUMkNobktNNm9LSzdITk9o?=
 =?utf-8?B?c1k1M3E2MmJRdXdKamUyVFZkVEd4NCt2TVNVK2xidTlRQ2d1aElEUGNDWEsw?=
 =?utf-8?B?NnpxblhhaHFCMU1mUGx4SVJpU0cwakp1U3YvQjh5YzQ4a2xGMFByK3BkSmdH?=
 =?utf-8?B?TUtsT0RXY2NDc2RSbDdlS2orOWZQTStWdnpiYmlvU3llVzc5ZXJoTW10WVFl?=
 =?utf-8?B?eFArVUE1Tm1ybk5Nd01OTHBtb3hhaWhhV2NUcFR1WG93MmovalM4WmYwUmxF?=
 =?utf-8?B?a1k2cysvYjFFMTdYT3ZmNmNpL3VVUkpzMEg5SE5sRVhGTzlaTFlvUVpVTVRS?=
 =?utf-8?B?cnQ0QUZnak5uVzgrV3gzZjVQSS9RdFA4cnVlbjZxaW8wQ3ltSEJUNlBvbXVS?=
 =?utf-8?B?RkQwdmFVOUg2VHMvZEVCODh3UFhxNW41TjVRc2g3MlV6OTBjYXRhbG9NM1A1?=
 =?utf-8?B?LzNUdXNnQjBlQmcvTmRTMHlVZ0R3Z0NrZk1PbnNERUJCYTRaMUJpOE5zWUVv?=
 =?utf-8?B?R0JhV0NLaHRBeFBPVlRYOHVyVHcwUzh6M0orV0dLK3FraTNiK29oR3BZWDNq?=
 =?utf-8?B?Q24vZWwvR2d1Wm15WGlza05SZDZMUy9JbG9aeW1IRVYvYWV3YU9OUllYYk1C?=
 =?utf-8?B?MkxjWGlITzcrSEU0R3hGQ0w1bTNFZHRnT05tTnphdzl2T2lhS2lqcEhBekJq?=
 =?utf-8?B?UWhOeklVSDNPMzZTTVNHYkdDckRoMC9DSHFvS09KbXo0RVppbkJjUDdZVFVT?=
 =?utf-8?B?WVVwQjBTVU1nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smc3TjU5aUdkWTdxcnIvUkk3VmM5dVpWRmlSRWlGeDhZNHprK1hmWk9VMklz?=
 =?utf-8?B?UkwvQzBUUnFId2dlMllNajZxaWR1bWNaT2JzTm5CaWVQcTdwUXhmc3JwS2cw?=
 =?utf-8?B?N2xxaDhRY2JKMjRPQjRqcXEybFJ3T2Y1VVVGTU5IU3ZkZzZzQU94ZVphanZ4?=
 =?utf-8?B?UG1xMWpMejlGTjA4cm5nTFA1b2ZYc1NTd3MrUWhOWW43WVlGcC9jbmJTQWVY?=
 =?utf-8?B?TzQyaFRHV2xkOEdqREJuR2RlYVpoeERjM1R6eEIwNlQ4V1ZBK2hqUTIzMTFo?=
 =?utf-8?B?ZFVBczZqWWNWcGwzaWhHcUtzSVRpbmhTb1J4N25hOTFaM2o4OW53TGZXYnBD?=
 =?utf-8?B?ZkdPUEovb1A4NmJzY1pQUjBhNHhEWndWa0Q2R09aRWl1UjlFZ0ZsSTQxWUY1?=
 =?utf-8?B?amZaRUZtVEdzV0w1MXc4dHd0bUZrTG5SOU5YY3BCWkJuRG5ZbnRza3B5VTEz?=
 =?utf-8?B?MFJPUGV5NFNNQ3dDZlVtNVVCamRlTndBcjhUdnJXUlBEcE5JUGlGc3BZcnNn?=
 =?utf-8?B?UVdEQmFwTEVVbTNVVWRuOWFGVUJqS2JoMnZXSERRRWRpM0s2ZWwveExOWmNt?=
 =?utf-8?B?TXp1V0owSDNnaEpMTFp3VnBFWU9OTnQ1Vk1GVUQvVFhPdlJUOENsNkZRaTIr?=
 =?utf-8?B?c1lBaUlFTnN6UnpQUG5LYzA4Wlh1LzUzWms0azFTNUVaSnY2ZDYzYVRCMkdG?=
 =?utf-8?B?SjczYVYyR25WWmdaSEpqRDJ3YklxR2JYdVFVS09WTHZIaTVJUGk0c2pxQTBG?=
 =?utf-8?B?YWd0OUUwWVhWd3hTMDZlTStYclE5cSt1dUlUemNucWFOSFB6cUp4dEpITHM4?=
 =?utf-8?B?dElyN0Q2SUUyalRlQXBnd1ZFQkxURmtjMzhjRThpMFhKM3ZpS05IUFJzV0Ux?=
 =?utf-8?B?VXM2YTlaUGZnL0I0VW1aaFYvcmxYRFVxODFzcGx0aGhwdUZ5d3RRaEM3L1pi?=
 =?utf-8?B?c3IvcWNITE1DTFE4VlNnM1dTa3hFNVIvQU5Hd0x2YW1reWlEMGxiZWdSZXUv?=
 =?utf-8?B?VGlLRzhrVlNZVjUyTlN6SkJCK281OWNqQkpNV1dJYk9yMHd2aDFUcjMyaHpQ?=
 =?utf-8?B?ekwrNWR6WnN3OFdYWXZjUkgrUnJSSExzZFhDd1BDZzJaZWVFcXN5V2pXTFZ1?=
 =?utf-8?B?SzhyUVp4MC9YcnV4Qkc0c1JxaUM2RjFnTlFBdERnWk1zbUFyMlBwY09rRStB?=
 =?utf-8?B?OU5uWE9EMkovR0pXVXdEaDF0Rk5qR0pWc3Z6U3VNUUUvRTlaNUdIR3FCcVpR?=
 =?utf-8?B?YzdESnJ1SzkxSjJ1b3ozdnR1WTB4S1RlM0Y3L1V3SWd5ajJwd0pCeldoa0Fs?=
 =?utf-8?B?T05iQ3pKbzNYTnozenFsQW5PREhXQTczSGw0U1d4K1pvbGNRM0d1MzQzSWl6?=
 =?utf-8?B?OEpOenBYYUxPMHphU29Cb0d3TmFXT0J6Q1FXWmY1d1lwbURyRndrb1ExakU1?=
 =?utf-8?B?cHROQW04UjVtNVQ3Qk9vR1F5Q3kvdS8zeDlneThMbUowRjB6ci82bjB3Tkcv?=
 =?utf-8?B?L3NUdTZBclN4ZmlJTkM2UWV3VXE3U1RTanNpS1RXcmViblNLeG5sMVFIc3ha?=
 =?utf-8?B?M3ZnV1cvYmRiVE50WjlKR2N6ckNlNEk3NWRycW90UFJNb0loZHhML1N4U1pY?=
 =?utf-8?B?d05PbzNzRkphdzdKMWJxSXNWSmdNWFBsU2VWanRTelo3ZWVtTjNZTTdqVGJM?=
 =?utf-8?B?cEFTRjBLOXFzMFVMejE5eGlsNXNXQXRWbjgyQVN4Tjd2NVRkZ0VmZFdCbnFx?=
 =?utf-8?B?SjkvbFc2d1VlTXhIdFJaeHFlZTBSbVVDU24wa3BBYko4ellWY1EyRGw4MmxE?=
 =?utf-8?B?OTE0dGh2N2pDK3dRTDd0S202RzRTdE85VUdudVVDeVVHSWFrYW0wMWg1V0I5?=
 =?utf-8?B?bDdRblBFaC9QNTFIdDhYaWJjQ2dCTXFKNmJkNForMnNHOUhFODZqQXBtSWdx?=
 =?utf-8?B?cVJwQXdoWVdDc083SkZWSklHaGNDa0xXT3VEZll3aTBHQ0JvNHNNTlROLys4?=
 =?utf-8?B?RGdvaWp1cHpxVURKZ2h6cjBCZmt4N1JEdkZxa1FESTFkQ2NheEw2SlF5Wk12?=
 =?utf-8?B?dE9EOGtmZWU1SHl1eng4L3V6M0tIU0hoaHdtL0xZZjRjMWlHZ1F5K2FkSjJp?=
 =?utf-8?Q?PG4kBKMPXBODiTD6R0DAJhpkN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be2f5d4-6103-4bb7-ab46-08ddbdfb4b38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 08:41:55.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nRW73q5dOAIcrwq30Do9ZHuZYzmRcm6pdeN0XHraNWN7++52RSn6gG7j5xq5F0W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7899
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

On 08.07.25 09:42, Samuel Zhang wrote:
> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
> to GTT and takes too much system memory. This will cause hibernation
> fail due to insufficient memory for creating the hibernation image.
> 
> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
> hibernation code to make room for hibernation image.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 684d66bc0b5f..2f977fece08f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5021,8 +5021,16 @@ static int amdgpu_device_evict_resources(struct amdgpu_device *adev)
>  		return 0;
>  
>  	ret = amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
> -	if (ret)
> +	if (ret) {
>  		dev_warn(adev->dev, "evicting device resources failed\n");
> +		return ret;
> +	}
> +
> +	if (adev->in_s4) {
> +		ret = ttm_device_prepare_hibernation(&adev->mman.bdev);
> +		if (ret)
> +			dev_err(adev->dev, "prepare hibernation failed, %d\n", ret);
> +	}
>  	return ret;
>  }
>  

