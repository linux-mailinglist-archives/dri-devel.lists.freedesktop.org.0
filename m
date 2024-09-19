Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768E97CD19
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 19:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A5710E732;
	Thu, 19 Sep 2024 17:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gj5FEd+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F67F10E732
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 17:35:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGZddYWld5aQNOToh9vWhexZVFb2EQIHerrn4VI9fiu+gu6ebWnxJG1GUlQBilerI7fOju2SGyxnrBM69/lhvUsq04Ki+rY6j1n26ZNz00yz1UIxAQjIXDCzbDeIe/trjAyv+VeFemCcqXdY3xtlVeaNcEip100U17FxzgSFDil3Ul0CEOBAkWnA4Ebht/t7saIEfnjj+9h/pE3Hr99fUzlnB+Q2tssXrtc0val7dCATsvUqxW6iFaBlQU6y71QyRQkvjgIQkOTBTrMtxckDsPPgolcefHtlONYpNa/kR4/7MZq+VjAowXI4i/Lh9wCd4ZyWWGlCewgZHzahpiTPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFWywz/KEgwnxxke9Cpx+Hyq3uoj24ap622s/JEy8fk=;
 b=wcBMev1FWisdq9jiGHEWTPONdhPVDvOozLioykVDvt8+2oVtaYYba9QDvrAhauf/ec08bWL/UUGASFrjth8uF3Amb9FFwexgxPwooNAz67t/yD2AuvR2hrUPp0CI8GnBet1FCxEwrFo7RbPlBIfSni4bXmIiKZAjAGJET4lZ2+k8wEtpq2cpjEX+1aHhOkIWzQf7e05nqsr3YfdTDP1ZqSgMdcM2qFIN0KDOZRmefpC2E6ZpOK+fVtCdk3jE+61/k5CEQN1z/7iGzBUA4a2CaFRxMvZkG6a+PHkpvovQD0VTX9mX/JoHEptYmKTuzdP79doaGFBlJN2KgbhZ49UUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFWywz/KEgwnxxke9Cpx+Hyq3uoj24ap622s/JEy8fk=;
 b=gj5FEd+D/P6ShouyGaDeTAbBjom0QbpIx+LIrrMsZiTzg4Qxr0dpp9Qcrv7iWo7QF9n4+e21NXaI/90jZqCvjAZakoiJEnVRpqsxfSxM0TmVbcEDc6Ln0Mx/0/J2PgOXQ7pra5obxRA+aZX67hgydFdTdI3FfKo2PZR93NXU7Vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 17:35:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 17:35:32 +0000
Message-ID: <1cbc0cda-549a-4333-9045-470c51981af5@amd.com>
Date: Thu, 19 Sep 2024 12:35:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] acpi/x86: s2idle: handle screen off/on calls
 outside of suspend sequence
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-pm@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: platform-driver-x86@vger.kernel.org, luke@ljones.dev, me@kylegospodneti.ch
References: <20240919171952.403745-1-lkml@antheas.dev>
 <20240919171952.403745-3-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240919171952.403745-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0171.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5e0732-36f1-4685-1c72-08dcd8d175fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjdKUFVGSnZzMHkyTk9DemRGR2Q4RW1SNkRLSFhnakpQMXVIMWRJYnZXdklh?=
 =?utf-8?B?YVg5bUZpZ2hib2tLS1A0Z2xhdmVUSmcyeEt5MEw2YjhRZHBJOHRqWndGSlZO?=
 =?utf-8?B?aThoRklEVXViSlZuNTZSVWdhd1lkbU1wNkp1U2NRY1lDdElLR21IWVlPY2Jv?=
 =?utf-8?B?a1hYZytOTnlPTkZLczRBVUIwVHpleUdvMWtIQkNwLy9PUmo0UzloRjEvenBW?=
 =?utf-8?B?SnpkY0hoOXk0dndrbUxFSkJvR2lRVEtuRmhhRndyY3RzRVlDOG54YTM3cW4w?=
 =?utf-8?B?SmZvWjViWUcrbmc0UVF0VU91T3FBUlpicllkTm5seTM2cDJqdEUvd1J5WWNC?=
 =?utf-8?B?b2o1cTJtblhFd3BxVVlteEh6OGoyMktSL2x4VTlaV0JnZm51UmsrSUFQMjFM?=
 =?utf-8?B?WFVGWU9sYUswZ3RsT3FIS2Q3dVN0QzFENklSanJSS1ZYM2VLKy9MVW5scTFJ?=
 =?utf-8?B?c00wbUxhVGEyWnF3Y1hrTWRodVZkUlY0YkNjZWU1MUtwY0RaRm1GNUNLc2JU?=
 =?utf-8?B?amlVRG1xOFZJOU1wbTZrT3d1QkFzVGhaclRkY2twdVhxSDc1Z1VrUTQyZHYy?=
 =?utf-8?B?VVlTOFlabnJidEg3bzJlclBGaE14dTR0ZU9BZS92VkNaQ0czendBeENjeSta?=
 =?utf-8?B?QnRuT1NOUzVKWFRMaW5qZ2xuSjZyU3VFemI4ZkxpV2U1T1BxOHBKVWxGbXVN?=
 =?utf-8?B?blA3N1IxQ0d0b1lKeUROYTN1WlYwbzRJSVhoaE1tZmZUYUdnaVJWTytZZkVQ?=
 =?utf-8?B?dG90L2hzOVZGYjhuS1o2NHpXWkdLQkFEVUE5RHBONTFZY09aSHp1aUhHcFRU?=
 =?utf-8?B?OFJIcjVKWTYvVkhLdmd5TWsxeUxTbC9FSEZPWkFEQjdsSWtiY3Y1N25YTWJU?=
 =?utf-8?B?SzY4QUR3QnVhWm9lOXA2VmZnSmRaNWpSUjh1cFQ0aEliY1RyY1h6UEZ0K0tt?=
 =?utf-8?B?a1VkUWtFVU9maXY4UE4yZWpacmNwbGFiK2ZWTEdub1FtNytoKzZlOUVpU3lY?=
 =?utf-8?B?VjBDQzdEWHgrVUt6bjNEMUpKZElweEw0UXpHZklkMGFDVDZYME1CSFhZaXli?=
 =?utf-8?B?SmFFZVRxc1RISTR0aVVLREc4aXlSdGwydjNrcFZhbURiR1RNVE1WQWhkWkI0?=
 =?utf-8?B?UFRrQVZXZFZDaUU0NGF1a05ibVJBb0Q1c0hFT3BYZlZzcTZUTldwS01SMXNl?=
 =?utf-8?B?VkE5c0grc3loVTdMbzg5dGxJU2IvMENSL3VFK2xrUHA0VCthV0R4bCtsYjRF?=
 =?utf-8?B?VHJnZktPM0ZZSmtxU2NucVFGanpjVEh1L1pzVHZ3SVVFM2RqdkVJS1oxZXNj?=
 =?utf-8?B?TnRhcjFlM3R6dXVydVRLOWpjWmg1bEt0NUc2SzRIOVNSUTRXNUdRWVVhUDRs?=
 =?utf-8?B?WG1WdzZlQzJFck8rbnVoMmpmTlJLNTE0WWE4a2ZsZ2QwR0UwdWtzOXJTazNM?=
 =?utf-8?B?WVc2c1NZQklnVjdnVE42RnE5cWpnc2NNQklZeTYwSXQxc3pmZVViQ2N0czND?=
 =?utf-8?B?TkFNYVBKVGhwc2JuaG5oZkNPeTBlZEVKeUJEQnFtUTZLUG44ZjVKQzlTSHFl?=
 =?utf-8?B?d2tjamhjTTdJYWlwcXVtaU9GMW5xZVBTZjhNWWlabE5yQ1ozM2lhWkxZTThx?=
 =?utf-8?B?ZytMNklhTHJ4cnM5TURqZTBDdlloc3AzVnpJZnkrWCtFRXF3bGFuVU9ROXNr?=
 =?utf-8?B?WVYyNytEVW4rTGpBeldqdkZ4TnpRNjBxSjAwTGtRcmtLZDhCanJjdmpxZHBQ?=
 =?utf-8?Q?g2xt2wAKBcDBhlJ0WA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3paS21IMzNqVHZaVzRLamU5Y2ZVRzNmT0U2YURjSEkrQ25rbVlZU08vbGdY?=
 =?utf-8?B?c2dGMHI0QllhOE0zcGpEWmRoRTF0NllFbHRJVnk0clFtMzB1bU9KcnI1d0FL?=
 =?utf-8?B?QnNBWi9PT0E4c0F2SWxtNzVDZ2VXZDhYZkNOTUF3alFZL3U2cFVIMnZZT3pC?=
 =?utf-8?B?d0V1d2M4WTF2aTFvRXk5VWorNjN4Y1ZXZEJDNWhZazcxYStBeTk1OVhBNlor?=
 =?utf-8?B?bVBVYVdnNTNCVVpoSjVQZExpQjdCMEF6VjNzdExYOEFQVElnUEJBK1BWRWdT?=
 =?utf-8?B?eGM5ZGl1WmE5aWRsVWk5SE9TMzNXR3lZMFFLK29ybzVTbWpFM2ExdUh3cW45?=
 =?utf-8?B?em5kV3lQMXRUU29FaUQxVU92VnhZcTZUa2NUN1VBWDRkYmZ6N3JJNnoyUGVm?=
 =?utf-8?B?L0tKYmw5Sm1HNThpTFdGY05BTUxlSm5jalVWbjkwTElLbThkdmpGOVE5WGw4?=
 =?utf-8?B?aitUVXRqeTJmeml4UUQ2am1LbmtjdmtSZStyWDZSTlNnT1I1SXlpQ3RnZ3pS?=
 =?utf-8?B?U0YxSUhkWlZEa2t4Y0ZtQVVxTFNwZ2hJa1QzcmgyK1lFR25sc0pacUl1VEFO?=
 =?utf-8?B?Z3R5cDJWREY3Vnd2ZTNSdmk0S1E0Vytsd3k4bTdOWFlGc0FJSVBFbDN1a3l0?=
 =?utf-8?B?MlpaNjlNRDRMQjMxMGxpNVpXeWsxZXpJcjdkVjBrTHFkcTRMbUcxVSsyMW1P?=
 =?utf-8?B?Z1hLZXlFb1Z2UUJxdFRDM1ZRNHI1SEJhSU1Ccys3NUNKTXhIUjArRUJIT3dF?=
 =?utf-8?B?RUNNTnUxWStvbFJIam9uZXZyblNCdlg1MW5GaktpcEhUdXhEbmNSVVducjE2?=
 =?utf-8?B?NG1GOWw3c3NLdmxicnpQd2Z6bCtrQmpKOWw0U293MG9Mcy9zOEdRWU5iOXpB?=
 =?utf-8?B?Q2t3WWJpZnBPeDZ2UXRoUFJEMndoQ3JBdEJ1WHhFamNGMWhiblJ6Y2g0dUlh?=
 =?utf-8?B?OGsvdEYzSllpR2Z6R01GQ3lGS3BxSnlEYU9kWHZOTVE4Y0hSM000UDJDVEtp?=
 =?utf-8?B?eTU0dlQ1QUlFY2xqQ0pOZlFpb05XbGt0dVA0S1BhSjRFQXJPYkl3a0wyamc0?=
 =?utf-8?B?b3JFY1RYS0tGUXVESE12STNYTzgxRDE1M1RLa0w2L0RhUDZhemtxS09EcXJU?=
 =?utf-8?B?SkFYWGc2THNrRm5Ec2kxYmptTFE1WDYrOStwNHpQRmtXRDhZTVl2blB4WFVJ?=
 =?utf-8?B?WFZTZVJiZVZYR0drVEVIWHJXbkFsS0lJOHhTelVQSTFDbVpZc3R0MHVsbVZC?=
 =?utf-8?B?MmZKRnQrTHRMSXNsT3NVMjdNRTV1V0dtbEpvNU04NkpBRG1sRmJjSjVhUlFy?=
 =?utf-8?B?NTVxV2RVTVplMS9sSTN2S3Z5VVJIQXVEekJjSWFJWEJRMnBOTGpac0YyS2ZB?=
 =?utf-8?B?bzcyMCtzY2pGRzVoZDRRSFBlbkZ5M1VQekdzNHc2NGpCeS91MHA1S0l6aExI?=
 =?utf-8?B?c1RGTDFoWHl0UXJ5eUJlMWo1S1JCdDF6RjVRand6OS9aZFkySW5VSXhMWDBn?=
 =?utf-8?B?YVNDaXk0ZlVkRXZVczRVSHRvblFHNnBQbW0rdHRHK0o0LzB5Y1BSSWx2bnBx?=
 =?utf-8?B?dmtHZk1QOVNXKzhzVzZ1SEtQci9DNkx2YjRSbkRFUzRiUWdReFdHdjBieWNp?=
 =?utf-8?B?SHNGYVBlTWE0ODZvVE1iY0N3Q2xOWWZIM0lPZDRoWjlCdXFVL0JSU2c5L21j?=
 =?utf-8?B?YWxSTUY4ZlNZa2dRd1VuZW9BTnRBZGRKSURkYnZJVy9Ka2NFaUxNNFZzeGFp?=
 =?utf-8?B?QUdmbVJpaVAxdTRqMDV3K0xRWXFGM2l5amF6M2pxaE5pSjBNWmxpSHF3U2FM?=
 =?utf-8?B?RXJ2c0dxaTgyZWxjcTFuZno4RXZqOFE3REh1MzdGeHdtMWhaTmZuYVBHRGQ5?=
 =?utf-8?B?MWVxV1BJVTNxZWFyUG1kUnplMjNtcS9BZEw0czNVQlJ5d0dkdkpwRjgvUUJB?=
 =?utf-8?B?ME4vMUtNZ0RyTnIzdVhBbmZJbjk4bkdpMUJ3ZzA1Z050eXorc2ZyODZOVllX?=
 =?utf-8?B?UkdWL0pISVJDTjJJcDZBb3lmY3FDNmFoTjU4ZEhJclhsNVZOMlZsV3B3a2d3?=
 =?utf-8?B?a3lhVHFXNkFIRm8zQW9Vc01Salc0R2l1WlU1WFdoTEpxaVQ2R1lDYTkyclBQ?=
 =?utf-8?Q?9CV1nQDDCkI+MS/IcYg4fG16X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5e0732-36f1-4685-1c72-08dcd8d175fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:35:32.0105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44CwTzXMC9Jwb1wP8j1XtdvEhpY2duc2lQSOH93iszRM3JcwH/7TvGs/REJDcCoERE8qvWZRDtXNs+7JoUZC5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469
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

+dri-devel

For those joining late; this is the full series for context.

https://lore.kernel.org/linux-pm/20240919171952.403745-1-lkml@antheas.dev/T/#maee308be5349d8df25c8ccf12144ea96bbd4cbbd

On 9/19/2024 12:19, Antheas Kapenekakis wrote:
> Currently, the screen off/on calls are handled within the suspend
> sequence, which is a deviation from Windows. This causes issues with
> certain devices, such as the ROG Ally, which expects this call to be
> executed with the kernel fully awake. The subsequent half-suspended
> state makes the controller of the device to fail to suspend properly.
> 
> This patch calls the screen off/on callbacks before entering the suspend
> sequence, which fixes this issue. In addition, it opens the possibility
> of modelling a state such as "Screen Off" that mirrors Windows, as the
> callbacks will be accessible and validated to work outside of the
> suspend sequence.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   kernel/power/suspend.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
> index 19734b297527..afa95271ef00 100644
> --- a/kernel/power/suspend.c
> +++ b/kernel/power/suspend.c
> @@ -507,6 +507,19 @@ int suspend_devices_and_enter(suspend_state_t state)
>   
>   	pm_suspend_target_state = state;
>   
> +	/*
> +	 * Linux does not have the concept of a "Screen Off" state, so call
> +	 * the platform functions for screen off prior to beginning the suspend
> +	 * sequence, mirroring Windows which calls them outside of it as well.
> +	 *
> +	 * If Linux ever gains a "Screen Off" state, the following callbacks can
> +	 * be replaced with a call that checks if we are in "Screen Off", in which
> +	 * case they will NOOP and if not call them as a fallback.
> +	 */
> +	error = platform_suspend_screen_off();

It's a bit muddy; but I wonder if calling 
drm_atomic_helper_disable_all() makes sense here.

> +	if (error)
> +		goto Screen_on;
> +
>   	if (state == PM_SUSPEND_TO_IDLE)
>   		pm_set_suspend_no_platform();
>   
> @@ -540,6 +553,9 @@ int suspend_devices_and_enter(suspend_state_t state)
>    Close:
>   	platform_resume_end(state);
>   	pm_suspend_target_state = PM_SUSPEND_ON;
> +
> + Screen_on:
> +	platform_suspend_screen_on();

The problem with my suggestion above is what would you put here for 
symmetry?  drm_atomic_helper_resume() doesn't look right to me.

Maybe it's a no-op from DRM perspective and the drivers handle it.

>   	return error;
>   
>    Recover_platform:

