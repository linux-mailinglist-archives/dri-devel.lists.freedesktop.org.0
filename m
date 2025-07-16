Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D6B08094
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 00:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE2410E694;
	Wed, 16 Jul 2025 22:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PAYhyGiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C9F10E692;
 Wed, 16 Jul 2025 22:36:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCnRk4QH/hdRrME9hosLwr+31VnZ4orfhIRIWKO0GkLKTQ3WSyNwMlKFUFHiNEkTAVcfAGd3YXVoeG4yTzcznjf490HLc4sWLw+a25ZTYFIxmXxYKnY1WSFTttbw7xUaaEj6CeaLH588FIP2wQzgBx4Jxb6AUxxA3sRf4t+a7CwWCg+hv1KMWOI8Rg9usBAuiFW1mYSxhN5DqnY9c1Aqglwds5al9E8VF2S6YKzYbDtZBuLBRR84kAG97GtQWq7kBLmnulSuPGBd4q3v8BqR5FJ2x0WEgulnREtZvYf8TRRrxWUju618QPupZMJYMoo+47Mj5qsSPb+rGCMDSKjR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSJptVw25u3jsGuEeK4/mNnmMEBfLMLwV20i0v90FuU=;
 b=DsV8DEdigg8xWBJ52ZL/6B9EozFalcROdI3GhcfCQ0v/3RTWtnMouJ4CaaYqG0meDCQqb+DbR0VivCmFR0ZR2Z6NvTTIsUZIBdGjOgvw77qq3dnwDiGXIg709DMoD0zLLBN7p4ffAfbUlwvP5+kdu6X4hmwAvdBv5BR4MKnOBKtkJN/LUoOKkCcYVuJieJrTfmKZZA1pQjoOMLK60DOGhGHL/ApVe+farTtr32Chn2FH+TWRxBlopcMTAuTePU/PDYlKnC3fNTqaX87pHTtbxtQjgtMAm3K2yTawyp++s5MWd5h2rLcHqaJ1WV8lV8r9Y/FY2LzgEXhbFtnU5WvYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSJptVw25u3jsGuEeK4/mNnmMEBfLMLwV20i0v90FuU=;
 b=PAYhyGiw67sJJnSBE5kxIDVhumd/tcjnmDe2W6bgy2hZOBGs4/6iLVj4ZNMeRa7Qz10zaV0b1KrxO7tcyAla6oE762mcy5GfJTRZEzBd9ykn4Mk8LCIDhBj/AhkD3CjgaKTcrigNWGdmMTdbLLC+9jar4hh8e0IiJ9eFxOm36189ybwZsW1wLsb2BPjo/jUMX6V0fqbS8ffXm9Jswm0iv/4kMGBPSVxiJ86VTCnIhyInTliSPLK8FZ2SD2Z6eQ5l7nzjdlhofpTS4TLFCrR6fb1DdS7s6jlYqo7kmrsFbyIMWcOVVvREawP1g7pTNwwW9dX648i69vmAYifytJbdBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 22:36:50 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 22:36:50 +0000
Message-ID: <9f6a1410-83f6-4a25-94a1-ae614897cc1f@nvidia.com>
Date: Wed, 16 Jul 2025 15:36:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] Add Format Modifiers for NVIDIA Blackwell chipsets
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
References: <20250703223658.1457-1-jajones@nvidia.com>
 <CAOFGe94OaQ0raM_c-AHsmmNE8WkdMVqvpTDdPaCEJ9d4Xy1uOA@mail.gmail.com>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <CAOFGe94OaQ0raM_c-AHsmmNE8WkdMVqvpTDdPaCEJ9d4Xy1uOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e83584-6fe1-4166-7834-08ddc4b94171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzJpcWZkL21sQUNYNjl5anFucEFIdURtMDFoNDAxRGR2dGEweFZPTlg0Y0pD?=
 =?utf-8?B?cTFKNFl1M0ZvUVc0QkxsWWQwLzY0VThocjIzTEQza2xqcW4vTnJWL0VjS28y?=
 =?utf-8?B?K1FBeXNTSlFOUDZMQkQzK0ZibEtSa0x0NHRjckU0Y1BscGRLVkJNZnNvazBT?=
 =?utf-8?B?d0R3UDdHTjRkTXdVS0RBaGhFd3E2QXpWdzR5bVJVRzhiU2Y0OE5jbFZyTURs?=
 =?utf-8?B?a3Uxa2NvSFlEdk90NzRFMUMvUnRYdnZVWk1BT3pXK05QRFNpZ1FtQi85VXQw?=
 =?utf-8?B?QUpWT3JpZ3Y1b25HdmJITkhoUXFEYVFUVGc4YlM0NFVibTNFSjdXdmZsQ2xn?=
 =?utf-8?B?T0R5MVkwMnQxLzE2bjRrZnA1L0tuLy9lWHlhNmNlZ2oxWlgzcjFNbnAvQ3Vx?=
 =?utf-8?B?aWlpQ0tnQkhWdDZQVWVVQTRLeVh2ZEdLVERhSXVmWVJnbHN0a1dFa2ZjMFda?=
 =?utf-8?B?OHVES1FQN2ZiWVpJNlBBNC91TlV5ZUh0S05YRUxyZVNkZjhFQ2k0NzlLY2J6?=
 =?utf-8?B?Z1pkRHRab0tDanVad0xIYzhhVTc1aVFiQmJQY3JrM1JkZkRHTGdJdVNrUFJj?=
 =?utf-8?B?OXdUUkRxei93Mmt6c21ERVJRQWY1TTF6ZVowZGNuc2dLYjZTTFhxekgxQnZm?=
 =?utf-8?B?c2s0bjQ0STl6ejQ4UzB3T3JWdVFXSmV3ZzJHMkhidXhkVFhTZ0krQXh2Y1F4?=
 =?utf-8?B?RDhvY2hvcHQyRTdNems0Zk9pZEI2OHhqR2V3MUlFVzVrTkxHcGZXWDVIZ25u?=
 =?utf-8?B?c2RsOERGSVU3aUZlZzBlb214c2tVMDNrRCtQUzlpaXNIWGZCOHVVOFhUdmll?=
 =?utf-8?B?OHRHbkJOUi83UEZWR0sweERWbXBCNEFNd3kwMkt5L0FPYi9zS1ZBN3dFTmF3?=
 =?utf-8?B?N0dvcVZVK2p0WkZPMUVOSEd0ZEtsRFlHSVFwdllqSlMxUUwzS0JDZzliYjVs?=
 =?utf-8?B?QjRORGd5eTdpUlo3NjVjWWtNbm1pK3loNWRXTUNTb21hYUk4aTJ6emZ6UW9k?=
 =?utf-8?B?U00vbDlPZmhaSFdyeC9WUmhIeU9ObHR4MkRqdmJLMTMrN08vVFRvUjlJL0Fn?=
 =?utf-8?B?azNwVUNoUGliRUpKYVRmNmpyUXRIRU1mRTRQckt3SHZvMUZMMWc0by9mWDZ6?=
 =?utf-8?B?T0ZQQjVEbXphNERwYjhoclNWNHo0cEhuNXE5YUpIYmVPakozK1U4RWlFODVT?=
 =?utf-8?B?V2M1dmVKdFBrOGxuVkZwTDF2T2IycHBjeVJJTTRTUkpQb21ka1gwbkM5ME4r?=
 =?utf-8?B?NW9oTlo4Mm13YS80R09rSFRqZVY1RWozOHJKM2x6TFRza3hrNHZNTStLdXNE?=
 =?utf-8?B?REUxRjJxTzg0QVJsZGJyN2xldk1wK0dnTW1qYk5VOTBZVng4ZVlHNjhrQnpW?=
 =?utf-8?B?eENWV2JOaTdIengvdGdpcnd6S0ZLUjZEcUtNTTVzdlIveDJ0Yy9RZHNUQWkw?=
 =?utf-8?B?cW5Ob2dGNkFPNitlU21lRlc5MnhQTmovQlRoY1N2dytQM1ZyUzZQano5YU5T?=
 =?utf-8?B?OFBVTWkxR0xpVnkwQlRHQTAyZlhialJCY21nRVVjYUR2L2lveExZWU95S2Jp?=
 =?utf-8?B?WVpTM0FGWlpNdTd5QjFpZ3hJUHZiZEZzazVXdWRFOENXMks2V09IMUw5NTcw?=
 =?utf-8?B?SUxMSXh0cHUwWmoySTQybHovNlN5N2dXYkgyL2czcXZTWVlPN0hGMHBMT2R4?=
 =?utf-8?B?ZnU2RFFZME9pZHdySXVvMDVYcHp1a0diVzNSbTV1ODFoUWx5NFpabVpsbTQ0?=
 =?utf-8?B?TFdNbXlHeG5mdXVyMU9FS3dVVGQ4NTcrbUF3clo4OXEwYlFZaklGM0FvU2tR?=
 =?utf-8?B?bDRQeDNpdCtWTVh1Z0YzRE5hVzNkb2NCTnVuaHBTQ2p5UjlTNHNvdFFBQUkw?=
 =?utf-8?B?bFh2WUF5MnlkT05yZ0pnWUk4TDRmTzlkVVhoVW1vaTI3dVZhajFJQ2hBMUNM?=
 =?utf-8?Q?TXhmCFIcSvs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzlRcmxRT3JQVmhvQ0Y3ZlFrRUFVeFlFWnNLVDlYRXIyd1lHVjZDSDRYY09Y?=
 =?utf-8?B?RTI3MVdyMTBjMXVPWVZTZWJmdkpFQmlaK3RuMHRSUlR3OGpsc2RZNTF0SWFn?=
 =?utf-8?B?WEZWU3psNHRDTTlqbkI2bGtTaDdPK1lidDVuT2E3Wm4zZndNRUtUbHYwcVB2?=
 =?utf-8?B?VFdYejlPSUVBK0RucVFwZ0hmTWRsdFZyRnlBY0RaNmx3MVUyRzJucmpKUVR1?=
 =?utf-8?B?Z2JlTzlVT1Fqb1A2K2tIc2JucUJRb1BkTkI1VjZXMXBCZU5OZlJlSW9NRlg4?=
 =?utf-8?B?cTZEWlRRcEo3RDFjampRUlhvZFJ4VGJCNUtuenRLMVVpTXlhTnhsOTQ3YjZp?=
 =?utf-8?B?UlBmVXZkaHNWTy96VWYvVzROb3o0VWlnRHNQbnNjTGxLUzZmUHcyZmZDVXBE?=
 =?utf-8?B?clJhUWdGSkFiSzZjMHZFVStBWFQ0QlJGVFdGSEhLNTRaWHA1SXNPRXRNVm43?=
 =?utf-8?B?bGp1RVJNUE53dzJ3WnNMQTZXZVZ1NWZSMmxlc29HeFVKNlAvVDY5dWxDaVlj?=
 =?utf-8?B?bUl3clcxbGtDc2FzSlhEZWc2QndOd2pvNk1yN0NVU2xMbDRxZjg2b3lVUEYr?=
 =?utf-8?B?NVQ4ZzJWRVY4cWl1ODVsMUh1Y25BRXg1VnpSdkRuVFJRdWprMUI1S29KLzV4?=
 =?utf-8?B?a2k4L0gwSGJvb2d3RHBBa2tDZWgvU1JTZVBQcVZFQ3BhWE5nUVNxWVVjdjU0?=
 =?utf-8?B?NW5sTFl0Q2ticXZ2cXlRK2V6V1FTQURxd2ZwVjJUUXdnek5mcXVTMDhjUk0z?=
 =?utf-8?B?a2NERWtidVhXenkwaFF1RjQ1VGVjaVZBZE9OY1FVQU1CSkUrVDV5bWg5VEhX?=
 =?utf-8?B?Q0hxRnNuYXNKVE85dW9IbGVUdWQ4cTZDTXVtMHBoZjBEeDlMTTltb284TG1O?=
 =?utf-8?B?c1Nab1k2QklqalQ5THRCUkhkUTlxSW1uZG8rVUdDOEJydVF1R0pXS0pvTTB0?=
 =?utf-8?B?VW1VdVFkK3h1ZGVYa3JibFNDMXY2M0tzWnpraG5FTzhGRE4zMXN4czFJWmJw?=
 =?utf-8?B?QzFPL0xhNjNBd1EzY2ZuTU1HQ0I1VEx1bmMrdld4S1Q2bG90Nk45Tnl4NXlR?=
 =?utf-8?B?ZjZlQzdZY0FCdElUeWw5cUxqVzAxN2ZZV1lhRE1aRjdvUXNoZ1RDUDFFa1BN?=
 =?utf-8?B?UTRnRnFTWk5WQllJVW5IZTVKblluQ1J2YUF4MWlwajJKUFQydW1aOEozb1pz?=
 =?utf-8?B?M0pMdUNhUEVSUUNDTDh0NWpKSnRiU3ZERUtzNmwyNitkeUdwSHZhREVxQUVR?=
 =?utf-8?B?amlBS2RiQUVhMytCbERXTndiU0haSDNyZitYT3ZjWWNWUC9lTkpYcjN5eHds?=
 =?utf-8?B?VTZ4MWdUY2VLZ3RxODdzUlhmaE1kSFY4TklCRFRqZmNvQ1gyS0RGbUFxRHZq?=
 =?utf-8?B?MG5ZRTlRM2Q3LzROQmtOVEJiVmx5ak5nR05zWWRPTGdQaHNyRXFpNDBRWVIv?=
 =?utf-8?B?Z3lHR2pZUWNDSDVTYXJWR1dtcTJad1JicWdicitFNWlJQ2pvNS9udThWSU9m?=
 =?utf-8?B?YXBsa09xS2hLYzU3dGNVOExsVERoL2JKSkVveWtVUXVUeFlGQU43RWQvOWFr?=
 =?utf-8?B?KzMwMlJpNERVek5qS0VLb2NJODNRMnV5NnhjamJ0L0VmMGMvM1gvZmdmTzRh?=
 =?utf-8?B?d3NJcDB2MEhwazFOR0dUVkJWN3lxQUdrUFdDbEhGaGpVTUFGdUFIOWhscEpj?=
 =?utf-8?B?OGJUY2RadGZ1cGJGVy9HUnZ4TEU3YmZNNTVUQnpCZDUrOU8rcE96aE5FZWgw?=
 =?utf-8?B?YVpWdWthNnUveklXcHNKaTRVbzc5UWY0YXVyeTRkVmVqSGdXdzZqY05VeFF1?=
 =?utf-8?B?bytmc3BYREVaQ05ScHJvOGlkZUNUYVM5SHRSMGtkUFlFc08zcnBMcFRMMlpI?=
 =?utf-8?B?UEVwQmxaaTlsM3JadTVJdFV1SytkYnRDQWFjZ00rR1NxM3p4OWl5dENFOWlt?=
 =?utf-8?B?QTlmZTVydHd5RDVpemV4Qm1uZlZ2MHBQQ3k3aWJjZWpnZTBzWWpoQlFrU05V?=
 =?utf-8?B?alc5WVNKYThnT2I2S0dBREJtSjRMRFF1aVdUOU9ocmVudWtXWWFFM1NoaFgw?=
 =?utf-8?B?M2gzTmxTeTYzMmRKN3hBeEF1ZjJBQlo2RWZsM1F5WTNuTlF2MnpkdXc2SXNo?=
 =?utf-8?Q?W8Rc6NI5DVdDYmu2WpZzv2gdC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e83584-6fe1-4166-7834-08ddc4b94171
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 22:36:50.4545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oir2xKjA+aLSWQGJbjhevw7R+DEXkqGrCmWRPOQ9/hdkxKUyGZ538ri52j+kM6M5Oe4jEpbrfkl7wKTpnVDVKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130
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

On 7/4/25 07:45, Faith Ekstrand wrote:
> On Thu, Jul 3, 2025 at 6:34 PM James Jones <jajones@nvidia.com 
> <mailto:jajones@nvidia.com>> wrote:
> 
>     The layout of bits within the individual tiles (referred to as
>     sectors in the DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
>     changed for some formats starting in Blackwell 2 GPUs. New format
>     modifiers are needed to denote the difference and prevent direct
>     sharing of these incompatible buffers with older GPUs.
> 
>     This patch series proposes first adding some helper macros and
>     inline functions to drm_fourcc.h to make the NVIDIA block-linear
>     format modifiers easier to work with given the proposed solution
>     makes them harder to parse, then extending the existing sector type
>     field in the parametric format modifier macro
>     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() by another bit to
>     accommodate the new layout type.
> 
>     There are a few ways the parameteric format modifier definition
>     could have been altered to handle the new layouts:
> 
>     -The GOB Height and Page Kind field has a reserved value that could
>       have been used. However, the GOB height and page kind enums did
>       not change relative to prior chips, so this is sort of a lie.
>       However, this is the least-invasive change.
> 
>     -An entirely new field could have been added. This seems
>       inappropriate given the presence of an existing appropriate field.
>       The advantage here is it avoids splitting the sector layout field
>       across two bitfields.
> 
>     The proposed approach is the logically consistent one, but has the
>     downside of being the most complex, and that it causes the
>     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its
>     's' parameter twice. However, I believe the added helper functions
>     and macros address the complexity, and I have audited the relevant
>     code and do not believe the double evaluation should cause any
>     problems in practice.
> 
> 
> I think we'll converge pretty quickly on the last patch. I'm less sure 
> about the first 3. While I like the idea of having static inlines for 
> modifiers that are shared by everybody, we can't actually use them from 
> NVK because our image layout code is in rust and bindgen can't generate 
> bindings for inlines so we're going to end up re-typing that all anyway.

(Sorry for the long delay. Back from a series of vacations now)

Oh, that's too bad. Is there some better way to express this that can be 
consumed by Rust or a Rust generator script? Maybe just some defines for 
the bitfield offsets and sizes? I'm not sure how to clearly encapsulate 
the split sector field that way though. It might be useful in the 
Nouveau kernel code below, but would probably have the same problem 
moving to Nova. Might just have to type that part N times in each client 
codebase. I'll give it some more thought.

The main purpose of including all the inlines before the actual format 
modifier update was to illustrate that although a split bitfield can 
sound nasty (Or did to me initially anyway), it can be encapsulated well 
enough to make it a non-issue. I'm not wedded to the actual 
implementation of the helper code. If we're in general agreement on the 
modifier layout, I'll send that out stand-alone and we can iterate on 
the helpers as needed given they're much less urgent.

> Also, I'm not seeing a patch to fix KMS to advertise the correct 
> modifiers. Were you planning to type that or should I ask Lyude or Ben?

This was just an RFC, so I didn't want to type everything out given it'd 
take a lot more time to test it (I lightly tested the RFC patches with 
some hacky one-off test code). I'll take a look at what's needed in 
Nouveau to advertise the right display modifiers and see whether it's 
something I can realistically sign up to do.

Thanks,
-James

> ~Faith
> 
>     James Jones (4):
>        drm: macros defining fields of NVIDIA modifiers
>        drm: add inline helper funcs for NVIDIA modifiers
>        drm/nouveau: use format modifier helper funcs
>        drm: define NVIDIA DRM format modifiers for GB20x
> 
>       drivers/gpu/drm/nouveau/nouveau_display.c |  12 ++-
>       include/uapi/drm/drm_fourcc.h             | 100 ++++++++++++++++++----
>       2 files changed, 92 insertions(+), 20 deletions(-)
> 
>     -- 
>     2.49.0
> 

