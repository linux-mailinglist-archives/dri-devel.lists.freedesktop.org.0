Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94262B24531
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E960A10E6AA;
	Wed, 13 Aug 2025 09:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lLe9XJGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F1010E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aImSV3s0X/18UYXhHmL6NHxGOGPgYIy7xom6zsdZNoIafNCm9iqFeccmyGxxKPxX7xNzc4ZZPZSiAKtWA0RYx/wch4TsLgYKPkUed0zQN66TWpK6XwTKVgglvN2gkSH9mWK+hbKli2sXccsCUikubfuaJehOkJmrIaVBywLy/UHHgwPPUEiNKXPPjBFFenoyE0xah8Kw4spnlzt/Q/evtx7k/zA7Reb2RTQGdxyp6x2P0J6KJv4cFeGN/MxhaJ706WKIkqke0FI788Bygw2ERCYLarI6ao4g1PTlq8jm9TgWUOjeDCsWh1crzjDXlJY7BKaRF5gXzIEJnd2JDKFKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0Zjwm+QeRk4J6IraXchUqYn5sasvU2NbaWpB/ykn50=;
 b=aLpVbiNIm0CSQClbmmcmMuZndYsG8i72b3D1SRwaXum8W5Z2H8QOlq9et2w0/JBk0IvhlpNFvldiDlM5vB3PhGoSRr48SPvwgFRmwCnxr3AqPjbCeYjh54qgntUvtp1Ln4qBgHN6k/au1fVmusZzuDk+wOH9rj8X3shHIPE3nac82c2C23AKZ3AkJeLN+DhJmP6NdjCDpGdwUZ7AiMGdqBKfSpqSRqnOl/FX86t3nwt50rlsWZBCbFWU9XWjqHe3xfrcZln4As1sBtO4LXXUFGkx1nNg4ajn0P9NkAKbF65IQpPPiXF8bGSkFlxPW5Ze2wCAgFRn1l6Otk6WJfYRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0Zjwm+QeRk4J6IraXchUqYn5sasvU2NbaWpB/ykn50=;
 b=lLe9XJGRenLHZpAwVmlCizVZpxWtsW/SzkFKtqIKS5yzvk5UpxRLWlCKNf6buqi+D0cHzULNWgWYucL4WMncG0m2QiLKCLY/VaTiTnWmvSsksCWL8oABCuAR+y5j/evDWYOFhgU/UZ90/ooxvV1VYNlx9IuLeR6OdPKYI7KL+EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6384.namprd12.prod.outlook.com (2603:10b6:930:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 13 Aug
 2025 09:18:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:18:48 +0000
Message-ID: <1633e373-df36-4e80-bb0f-d30a21059ef6@amd.com>
Date: Wed, 13 Aug 2025 11:18:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
To: phasta@kernel.org, simona.vetter@ffwll.ch, tvrtko.ursulin@igalia.com,
 airlied@gmail.com, dakr@kernel.org, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20250812143402.8619-1-christian.koenig@amd.com>
 <20250812143402.8619-2-christian.koenig@amd.com>
 <76e9e1644fd9c9cb19b7da3626cd0a579ccf3d4a.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <76e9e1644fd9c9cb19b7da3626cd0a579ccf3d4a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0375.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af02201-d13e-4935-e8ae-08ddda4a68e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlBtaDlEdllPb1hCZDVIc1lJbEJjR1ZZYTh1K0FrUWc1SHN3a3dsS3NFeXVl?=
 =?utf-8?B?Z1RSakpMN29iS3RjNGprK0UvVUMxRjR1QTNwMkNPVXh4dDlkbWxUcWZFU3Q2?=
 =?utf-8?B?THVXR2FGWTBBTFV6ek0za2Z1eXY0ampYdmhPenpuZk9XWVFUS3BFVTFjTDJs?=
 =?utf-8?B?bmFOQ3pIV0RuOTZJZFBhV2dvSUQzdGl5LzdFeUhYMkJXYlpEMkQzNVFLQ2ht?=
 =?utf-8?B?Z1RFZlByeUVsZjArYjVPZVRRMENESzlzNVdwemFidlE3U2U1eEtsVE1aOGF4?=
 =?utf-8?B?WnpvZG0wL0JzUjBJOE5DYm1NZDU5a2FQTWYxaHMwZ1NBRm9KZVRWeFFBbkFF?=
 =?utf-8?B?YUdiajRPSnVXNEozOUpSZFYySTd1a0g4UGd3OVc0L3N4cC8xNm5Qc1JrZHNV?=
 =?utf-8?B?M21oRXQyNjB0MW45RUhxejlneXloNVQ2cVhabUdraXVaWmhLdVRtdkZHeG5E?=
 =?utf-8?B?dVlXMkFwdFQweEVTbFMvbFFrS0EvTEF0R0FzVFFzVlQ1SU85M3pVZld2bHpB?=
 =?utf-8?B?QW9NVWZqUmtsK2VOV01tRnFCeVpSZ1dJR1g5bkg3RGJ6cmE3ZkkrYVQ4VFc4?=
 =?utf-8?B?elNCSTBEV2RuWEhMbEFuM1dRZ0hJRmtwV1ZnMnc3bTNma0JkRnZtUzB1QkpN?=
 =?utf-8?B?ZDJDRUlqOXlveEVhQlpYdTdPcm5seXRrSDV6R0lmN1lqbWpXbmxMdzl5cnFY?=
 =?utf-8?B?cHJqOHFBM3YwSW1qNWdLUUNxTExWdngwVC9ZaElTcTdEWFZYN3VvbHZ3dTVq?=
 =?utf-8?B?c3JxNStYZEE2T3BNOEVFQzR0K2pQT01WT1h0a1hVZllNVkx4Q1pkaVZxUXhM?=
 =?utf-8?B?ZVgrMDNQUjZVUkgzbDl1dUpoejYwVWgzZzFCMU40bVk2WWYwYWQ3L1A2bEx5?=
 =?utf-8?B?UnFHVGpYdURwYStudVBzMU9BTkcrZHhHaXZrSW1kN2ZOQzhJRVVaRWI1YzRx?=
 =?utf-8?B?TmkvQndjYkVjQWVhSzNoeXFQTDYvSTN5SlROR1NsNjYrVmd2Qk5aN1YzY3A3?=
 =?utf-8?B?Um9NbEZaZjQ3STZJQ0x4c2EvRktieCsyYXRhcEk2NU5KZDFmYmhZVEhmT09x?=
 =?utf-8?B?b2U0eWtiaEtQNVkremMyMTVGVy8zbW5CWmdMVm56MFRUWS9telljUzlzZkp3?=
 =?utf-8?B?OG84OWtXVENJL1JrcjZsLytQV1ZTcU9hRTFyUzZOVGtaMWNlZ2lOK2xpcXRt?=
 =?utf-8?B?Ym5qRDFvZjZwOVltZGo3UjJld01OU2k2TjVGYU1ucGovaGM3TUo4YXBNbGRp?=
 =?utf-8?B?eEVnVzFmKzZ4TXoxMzVhNlBkRG5zV0xZblZxazU3ZmNzWjhKVTg0MTZZRElX?=
 =?utf-8?B?VjMvK2dlSkZrOEUxYWdHNm55VStjVUQwUVFtWkpCcC9VNUVidlByTW83QUZu?=
 =?utf-8?B?UWtiQ2YvSjVDNnZHUjlKZXYrQURpNGJtb0xMQzRPRTY4TWtRYmFXVUJPREZY?=
 =?utf-8?B?SnFsUSsrdUtvKzJNSzdsUjRmdzRrek9taEtpbHpSZTU3Z2VRZ0NyUXRZekRN?=
 =?utf-8?B?SG1YYm43NThaZkVGQ3NYS2pjclJCSlBEU0F0UzJxYkIxZWNOSVNqRlBQQVBG?=
 =?utf-8?B?dld0NVJZVWxNbVJ3M2FJKzZmTUtLaTZYcCtSRk45ckx0dGE3dkJLTTBEMDY2?=
 =?utf-8?B?TXd0K2hwbmx2QTlFKzdEaCtuK2hTdzB3Q1doaUVIbjd0Nk4xWTY1bkp6dUtD?=
 =?utf-8?B?Sy9FSVBIdmpFeG9aemROeHNjUjlWUnM2RXB4cTNQSXlwYnlPN1J2SjZFZkNt?=
 =?utf-8?B?WkhsMDBVL0ZuYVBOWnkwbG9jWjJRRnl6OElSMzZSeVNrLzVDa1BJSGJQUHVL?=
 =?utf-8?B?WFZDRlhmT1hpL3FFM1dHK0N1VjFvd2RtaUxnaUZ6eVNOTnV5bW5vcklmeTNi?=
 =?utf-8?B?VWdzaVVPeThRbUNueWNjNTBMM3ZESEFwb1lwUFFTcVgyN1RKbStuK21yK0gy?=
 =?utf-8?Q?b4qI0OD2xhw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hpZVBJd0U0ZEpKakVoWndlK3pteVdiblhrVUV0UTdsQkQ0aklSRzRDZFp2?=
 =?utf-8?B?bjhkRWZOaUFSWFpvdVVPZkE0cllRd3dRSnh4TllaK0ErL2ZOUm9wdEk5bUg3?=
 =?utf-8?B?WWFwdjk5WmdSejBlOEpxYXlNZHFJL1FFRis0K21Sd0cwUkFxaVlBUTlFR2FT?=
 =?utf-8?B?RXR5eXc2cno2SVUvTVJ0WW9lY0s3cXp2Qkw3dUp2UDlIWmFNVk9ONkhiVWda?=
 =?utf-8?B?L0ZXT3ltSElncWVuWUg2ZThsVXBVOVNFY0VBajhwSVhXWFVnNzdTNy9zZmVx?=
 =?utf-8?B?aDBockh4MWphV3FCY2RhZVpDRnNSVDBVOENHTWxKd3JRWVIrejNjK2tTcEo4?=
 =?utf-8?B?a0Jac0JyMGRqNXAxVUhZUEJHZ2xDYndLdUw5bjRGQUUweXhub1R5Z3NibVZp?=
 =?utf-8?B?SWIveFlYbXRVbTkvVlFESFNEc2kxV3NGR3NHUUZDK2dUaE5XRVpYVGtPWHVB?=
 =?utf-8?B?RGRVcTdTZVNmK2EzSGdCQ05HSHdIYm1Qa0RuUEVDSEc3NGd5MEhMblBzWW1P?=
 =?utf-8?B?ZzBBWHFBNFdiNEF5Rmw1bGIxSDBXOHdTTHNVRWNET2ZQbEtkTG1EVnd3U0I0?=
 =?utf-8?B?WG0xb0FqZENpQWl5Ynl3MURiNk1TbTlITG44emgzVGJZQ00ycVBRdkppa3k0?=
 =?utf-8?B?N0JJSTladERLOE5XRWRFdU5qd0RTZXBjZmg1eW1Yd2h6ZUpjM1laUkpxaE9x?=
 =?utf-8?B?MXBkU2JSak5GS0hVdm9MQjZnSHN5OW1OVXVtTEY0TFd3Z3NqN2RuOFpITlBq?=
 =?utf-8?B?aDI5RC9leFVsa3BJVFUyMXA4SkVEckVEZnIxbktPNUxWWS81N2poZ25yc29t?=
 =?utf-8?B?anRQUzhyUkJkY2lKajUxUmRFRE1LNFNlemtLOTNGVHRPMzNtRm0ycHZ4dW04?=
 =?utf-8?B?ckZXUUNsVlBjQXFRUzAyRVFDRTdCNzlvVitBOE0ydjNuWkQvWCt6ZnlQeXlQ?=
 =?utf-8?B?RzhRT2pvYlNNVUJJVDQvemJFc0FlZkZIS0F1RTdmdEJ1TVp3cmE4dzVPUVlG?=
 =?utf-8?B?WG1XUXFjVXJyRlFHcTBvZXREMjAxU2FDaVc1RnIvOWFXekFwaEszOWVueFZK?=
 =?utf-8?B?dlhHWTBQdFNaTElVcVB2N285S0Z3Q1VLL3F2b09VSUxRR3VhZWdweDF1aE1Y?=
 =?utf-8?B?Qkp4eWlMVGNWRDN4cjV3MUV2YW90cTUrQWhRR0JzSXRKMHZYczB1WEdGbnFR?=
 =?utf-8?B?TnVEOTRrb0RwVHBtaXZmRmVvQlJ0Y2RKSWdNTjRiZGswNVF6MlNjL013VkRD?=
 =?utf-8?B?QmhncU0rcnRkSHdaTWlGa3c1ZjloMjlRdHQ5M25zZC9zT05ZVkxKb1ExbjY1?=
 =?utf-8?B?V3pGMG1RZGpyeEplNkVVZS9FbVBFZjVQWmo2OEpmNTNqVkQ4TmlqcmVKUTZa?=
 =?utf-8?B?UGpCbkhzZHlzNU5Damh5U3RaMXNQUGZoUysyN2ZSYkQ3RXViaTFvU1NYYXBT?=
 =?utf-8?B?SVBXOEpEQWlybTZ6Rmh0VnQ3dEplS3pZYWZodGZUVU9LbnpKNTFDL2dTcmR0?=
 =?utf-8?B?bWV6ZUlNVlRsbnpYcnVFckFhS1hGRVdtbGgyOUZqZ1Vsc2UxVFhnS3lvdTNi?=
 =?utf-8?B?S0ZXNldSU3NSR0tlV1VYQnhtemRqbU0wdk92eDlxczRvOEppNnlwbFpDWGpE?=
 =?utf-8?B?TDZDMzllWlBDYkRWazI1a3dBYjk3aHVEVnlWSklvZlBKb0p2dCtuU0dubkRM?=
 =?utf-8?B?OWtRSTkxc3VEcWNiZG5TNk9qais4RGptaGo3ZzYyZkZlZVY2a0p6SDBCNFVQ?=
 =?utf-8?B?UlNsbUZmSkV0WE8zTUdpRkxZNGdXd2RTVzcxSVZSQnkrUHRYWTdIYTltcHFm?=
 =?utf-8?B?WUxXMzdGTjVMZFZtSjJGVHhVUEdpQ2wvRnRQa2RWVlFmMXdyOGlyUllDU3Fh?=
 =?utf-8?B?dm9Cb1FwVFNkN2I4bWRrT0NDanZwSUY0QWJUdTRxNEEvY1g1SkFEbGtEaUZo?=
 =?utf-8?B?d0FPOHFuWVg2aFdtblVRVU5MMWJrb0tlazZBSHVoRzVhc3lOWVdxbFRXeE9w?=
 =?utf-8?B?WEZOMk1HbHZGOGE2U3ZmWS9wck5NaUx1OTBPOGFadURwSnNOSlZKcGphSWE3?=
 =?utf-8?B?emhZajE3a01COFQxUzExV2NiTksrRjVyUmVjQ1pvam45U1JpWFBXeUdCVGE2?=
 =?utf-8?Q?RKTTfup+a7pLYz9mSYthkCPCD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af02201-d13e-4935-e8ae-08ddda4a68e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:18:48.1727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDAmQZw+2HUf1xsnIZ5pErCF2ROAPMLxA4U5qHp059/Sdhnj1tez+/LbreBnduQR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6384
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

On 13.08.25 10:16, Philipp Stanner wrote:
> On Tue, 2025-08-12 at 16:34 +0200, Christian König wrote:
>> From: Christian König <ckoenig@able.fritz.box>
> 
> Is this the correct mail addr? :)

^^ No it isn't and how the heck did that happen?

Looks like my gitconfig is somehow changed, but I have no idea why.

>>
>> We have the re-occurring problem that people try to invent a
>> DMA-fences implementation which signals fences based on an userspace
>> IOCTL.
>>
>> This is well known as source of hard to track down crashes and is
>> documented to be an invalid approach. The problem is that it seems
>> to work during initial testing and only long term tests points out
>> why this can never work correctly.
>>
>> So give at least a warning when people try to signal a fence from
>> task context and not from interrupts or a work item. This check is
>> certainly not perfect but better than nothing.
>>
>> Signed-off-by: Christian König <ckoenig@able.fritz.box>
>> ---
>>  drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
>>  include/linux/dma-fence.h   |  9 ++++--
>>  2 files changed, 51 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 3f78c56b58dc..2bce620eacac 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
>>  }
>>  #endif
>>  
>> -
>>  /**
>> - * dma_fence_signal_timestamp_locked - signal completion of a fence
>> + * dma_fence_signal_internal - internal signal completion of a fence
>>   * @fence: the fence to signal
>>   * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>>   *
>> - * Signal completion for software callbacks on a fence, this will unblock
>> - * dma_fence_wait() calls and run all the callbacks added with
>> - * dma_fence_add_callback(). Can be called multiple times, but since a fence
>> - * can only go from the unsignaled to the signaled state and not back, it will
>> - * only be effective the first time. Set the timestamp provided as the fence
>> - * signal timestamp.
>> - *
>> - * Unlike dma_fence_signal_timestamp(), this function must be called with
>> - * &dma_fence.lock held.
>> + * Internal signal the dma_fence without error checking. Should *NEVER* be used
>> + * by drivers or external code directly.
> 
> s/Internal/Internally
> 
>>   *
>>   * Returns 0 on success and a negative error value when @fence has been
>>   * signalled already.
>>   */
>> -int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> -				      ktime_t timestamp)
>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
>>  {
>>  	struct dma_fence_cb *cur, *tmp;
>>  	struct list_head cb_list;
>>  
>>  	lockdep_assert_held(fence->lock);
>> -
>>  	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>  				      &fence->flags)))
>>  		return -EINVAL;
>> @@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>  
>>  	return 0;
>>  }
>> -EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
>> +EXPORT_SYMBOL(dma_fence_signal_internal);
> 
> If it must only be used internally, can it be kept private, without
> exporting the symbol?

I have gone back and force about that as well.

We would then need to uninline dma_fence_is_signaled().

>> +
>> +/**
>> + * dma_fence_signal_timestamp_locked - signal completion of a fence
>> + * @fence: the fence to signal
>> + * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
>> + *
>> + * Signal completion for software callbacks on a fence, this will unblock
>> + * dma_fence_wait() calls and run all the callbacks added with
>> + * dma_fence_add_callback(). Can be called multiple times, but since a fence
>> + * can only go from the unsignaled to the signaled state and not back, it will
>> + * only be effective the first time. Set the timestamp provided as the fence
>> + * signal timestamp.
>> + *
>> + * Unlike dma_fence_signal_timestamp(), this function must be called with
>> + * &dma_fence.lock held.
>> + *
>> + * Returns 0 on success and a negative error value when @fence has been
>> + * signalled already.
>> + */
>> +int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>> +				      ktime_t timestamp)
>> +{
>> +	/*
>> +	 * We have the re-occurring problem that people try to invent a
>> +	 * DMA-fences implementation which signals fences based on an userspace
>> +	 * IOCTL.
>> +	 *
>> +	 * This is well known as source of hard to track down crashes and is
>> +	 * documented to be an invalid approach. The problem is that it seems
>> +	 * to work during initial testing and only long term tests points out
>> +	 * why this can never work correctly.
>> +	 *
>> +	 * So give at least a warning when people try to signal a fence from
>> +	 * task context and not from interrupts or a work item. This check is
>> +	 * certainly not perfect but better than nothing.
>> +	 */
>> +	WARN_ON_ONCE(!in_interrupt() && !current_work());
>> +	return dma_fence_signal_internal(fence, timestamp);
>> +}
> 
> So this now is the point to decide what we want: do you want to *allow*
> drivers to do it, or want to *prohibit* it?
> 
> If you want to prohibit it, then (additionally) returning an error code
> here would make sense.

I'm actually trying to remove the return value for quite a while now.

IIRC nobody is actually using it any more since it doesn't really signal an error condition.

Thanks,
Christian.

> 
> 
> P.
> 
>>  
>>  /**
>>   * dma_fence_signal_timestamp - signal completion of a fence
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 64639e104110..8dbcd66989b8 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
>>  int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>>  int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>  				      ktime_t timestamp);
>> +int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
>>  signed long dma_fence_default_wait(struct dma_fence *fence,
>>  				   bool intr, signed long timeout);
>>  int dma_fence_add_callback(struct dma_fence *fence,
>> @@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>  		return true;
>>  
>>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> -		dma_fence_signal_locked(fence);
>> +		dma_fence_signal_internal(fence, ktime_get());
>>  		return true;
>>  	}
>>  
>> @@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>  static inline bool
>>  dma_fence_is_signaled(struct dma_fence *fence)
>>  {
>> +	unsigned long flags;
>> +
>>  	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>  		return true;
>>  
>>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>> -		dma_fence_signal(fence);
>> +		spin_lock_irqsave(fence->lock, flags);
>> +		dma_fence_signal_internal(fence, ktime_get());
>> +		spin_unlock_irqrestore(fence->lock, flags);
>>  		return true;
>>  	}
>>  
> 

