Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B034ADB021
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 14:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB5189BA3;
	Mon, 16 Jun 2025 12:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v7yXaDJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0974E89BA3;
 Mon, 16 Jun 2025 12:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTQKCvxVzc3drJ5ZKAkDVSf2gPFp7/KSXqAChrEcCeHSgWDtNNwEpv5PsbnFymg3jqW6Ok63qluoydj6k9klmWq6wRdhXyoz/z+/fh2bWPaizPgI+/Xw8LmveIHiHOhNw+7QRndT/PJe3kryAOzZZQOf4qywfqmWNq6sgEeHhcmAAb55QdoVWwawH2DD1NHvC20Q/Sz5rc5SyyG73Yn4u7ssd05KSg01E9aVQAFdYBwwcNG3ytisoccJJbwfV+579HdJ0zuqYCKDKhDhFpB5aUOgkXADodMD9Y7qpkO12zUwPDXxeBaD+gqH79ZsXYfQ94bu5m6AV4tbcmVx9sth6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gOp89wSDjGIM7+3/HrG60+l7+GjG6t68SjphxeO6eg=;
 b=b1w8RIQ9thr4E5qL5FA2rcfB8fpKmryFwBjL0s4dlIS4Q2So7XG0mgStLHRseu81Swv/EuWdjCgwX2ma5SqsfKTLpzrGWfqh4j1B4vkmDGuIJTVn5jr3h+UK2i7H6Gd8oUxYqATeVQ/2QMoKwB2daQDaLAU6stmbAgOLvuwyb/M6kXsPi3XGH02C8whJOlFOBGmn1bRYy6eiIsYRj7gFmzU1sYaN2CBshlgHpKgAjWqS6M8RmuMoh1uPJvHMBvpmT76H2eYt8EGqnefjN9RMM1wi+BGdln6Koa6ye0uwkZ8Gf0Le4bcUBUb/z1Z19wmvoY5de0FpVwmONZ7agMuLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gOp89wSDjGIM7+3/HrG60+l7+GjG6t68SjphxeO6eg=;
 b=v7yXaDJ6o39JkrU2d6YUy8JKItnELOzKl4gXOel/fKmlhVobEHQN9aGJAgTTjx5oy5O1zQuFggluQBLdMyUitU4aYIpdR1s8Bm8fF/+VRzEeBsY138rdZk4nthqHx30lsh/5AMf9Vm1Rep9hLaE2AlJyoB8Q9SbhhVeYXk6oeGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by PH7PR12MB6956.namprd12.prod.outlook.com (2603:10b6:510:1b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 12:25:25 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 12:25:25 +0000
Message-ID: <84af6984-bd2e-4378-a5c0-ee2356f96b8f@amd.com>
Date: Mon, 16 Jun 2025 17:55:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: add debugfs support on per client-id basis
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250616100503.1204166-1-sunil.khatri@amd.com>
 <20250616100503.1204166-3-sunil.khatri@amd.com>
 <3ca35236-377f-4ef0-becd-ba5d22b5edd8@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <3ca35236-377f-4ef0-becd-ba5d22b5edd8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::20) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|PH7PR12MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 37561190-dea0-4dd9-f145-08ddacd0def7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmFDNmp5bHBiUGxBUnVwNEZPV3krTDZXY3dpVlBVMmx5NnEwOHVIKzJLVmVR?=
 =?utf-8?B?bGpXTXNzOHZGbmNCU2tGVDdoQkI5LzdMVGM4QVhDYkdQS0dVUVNVa0s2NFZ6?=
 =?utf-8?B?MUVRRjZ3TDFmTU1qTWNpYXUwUlFteWdaUmdmVkwwVGg3YjJTSDlLeFpJY0Ri?=
 =?utf-8?B?S3dXSzZKR0xLM0J0djFyU1VjZFQ5ZmdzWWg3WTIvMWRjNHF4WEw4Z3lQUHFi?=
 =?utf-8?B?Vmo1eUt4RkRkVnJkUmhqTmFzSHlaNDdSNXFrUG5pL2hDWFdTVjdrdnhkcGFI?=
 =?utf-8?B?cnBnQ3RLdVA0c3F6dEJQazRnS2w0VjZYVU5ZY0NHQVpqbG1zRXBrWHlDK2ZJ?=
 =?utf-8?B?TkxLdlZIVnN3NmRyR1kzL01hN0JGUk9kb040KzdxS25keTdTMzA3RjRMUisv?=
 =?utf-8?B?c2hGN2hNUDIrMmlzR1g3L2RqeU83SU9UOEt6MHh2enpoYkJoVDZFN0xodm5n?=
 =?utf-8?B?dnh3cWhJSEVPYzlVM3pydzN3UU9FTDhEZmYrYis0NG11ekpGb1ZHRFJkU1lI?=
 =?utf-8?B?akRaYVhFc21saVVqSEE2UkNCcXFaeFlpU1c4RXdjR0xjNXc0VmNEK2dtNVFn?=
 =?utf-8?B?RnI5WDJPMk92amcyUHNDaGdVdFRtcUlkelV6dFdwZVoxM3hXVGFXdHBlSHV0?=
 =?utf-8?B?aVpaTkpSelFzR1dIa282OVpzbmJFY0d2UVdkN2IzbGgxb21WYmpIbTg4amMw?=
 =?utf-8?B?NjYwNmNJTklUdmJWc3NEV2s4cjlqOHVvb3M0UFdaZ3IxbG4ydC85cW5yVXkx?=
 =?utf-8?B?cXFWR2t4QThyekdRNmo2WVdWOWxiUVpOWXJFUXRGV2JFWEVvN1JHLy91dm1U?=
 =?utf-8?B?VFBjQm1kN2V4QmJ0ZXF5eW16S2VMSkNHRHR3czhrdEVYL3RjYmsyWDZkS1V6?=
 =?utf-8?B?OVd6d3V0aU55cGkxcTJWSm5FaDZBMjBUUmQrdmhGczMzSDV3UHl3QXdYdmc5?=
 =?utf-8?B?Ykx1SitmT1BaVkkvUFJaNWV2djBzZm1WbkNHTUxidE9TYTlkS1IycVNkUDR3?=
 =?utf-8?B?WUxBTnFjM0Z1YmRiUFdNQ2c1RWkycTBpbHZwU3FuclpOQ0xJTlJXYW92YVpM?=
 =?utf-8?B?dmhtQU02cDlUTE83NytjMDdJL2R0VjFZSDBEQ29hcmJWWmVCK1o5N0hsZUR0?=
 =?utf-8?B?V3FEc3IrWWZTV0NwblVoZm4yNGgxMXlJMnZQeW1OL1YzV0dOR2VxVFd2OUFl?=
 =?utf-8?B?cnNMR2Z2dTBJWE5jUmJ0RFU5N1RHSDVuZXlCaFVsck1KWTlnR2pHZUU5elVv?=
 =?utf-8?B?cytVTE9SdVBtZVY1RVdUcysrb1B1czhTQ2lUa3ZOaXZnTERZUU5nQ3ZWUU5M?=
 =?utf-8?B?c1h3U09TK3FpeC9NdnR0OHNoYk1LT3BpZ1RaSE5PNGVqYzZXQkdyVFJEemhJ?=
 =?utf-8?B?SktuT2lxNG4xQ0l3WHo1TlpvMEFpN1hEeDJZNWc1NDFxeWh5Z3V3aUI0UWtj?=
 =?utf-8?B?SEhpMWllRU03MnBMck90c1VJdTUxUURKYjBuenRYbHp1a3A4MGJ5VlErQS9x?=
 =?utf-8?B?OXgvNHI2bmV2ekNySnhkVEZFV0pqOFNRbnMrQVh2TThnaHNkcndxRXArbXFn?=
 =?utf-8?B?RTdUcFB5RiszRDhhclFXNlVneXhrN3dhTUZUSTlVNVgzTVFUc2sxVXhtUWJY?=
 =?utf-8?B?bkV4MWZsZkg0S1FlSHFjbTdZU2FMVEFrN2xrWTJOVmpXZzRONDM3Rk5wdkh6?=
 =?utf-8?B?M3d3TEgyS05pZzJmaU50WklzYjArZnZGLzNMaHRnMUExK1ROTHFqTXh1cUs4?=
 =?utf-8?B?MEJVMXJ5Qm9zZjdXOHlueUJyL2U3Ym5XcHFzb2o5WlJ5dWIyZkwyK3FINFYy?=
 =?utf-8?B?b1lZb1M3S01NMU1JNGtLRVlRTE45QXUzTEd6WWRKbGRRZUJWck9IS2Rucm14?=
 =?utf-8?B?d1dFeUYrVy9YeU5qYmo3OW1WMU05VHBsQ0hpVGhsajY2VUNaRWw0N3l1SnFp?=
 =?utf-8?Q?7tPnXZP5NI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFV5MFRXSmw1UTNEY3ZZZlYrU1ZSaWxLbmFtU3QxT3l5UkoxR25wL3FnTkF5?=
 =?utf-8?B?M2lndFZEYmJ1cU5jcThLbTlwUk5ncXF0ZjVSUzh3THZyR1dsQmxQV2RRTTh2?=
 =?utf-8?B?VFlWRlB4Q1NYWEwwaUpKNW5XdDNZSy9aVDkycmQ3OGo1NFVYRGtLVmNnZmVR?=
 =?utf-8?B?L3FTKzliUjM2WG1QcW9MSmR5YmU3NjRPL0NBcklsMThPMWx1SlJ5Q3AwTmJP?=
 =?utf-8?B?eXZSRjFnZjFNdkhHSTlBK1pXNDJ1OHVkOGNuYUcySGtQcE5HWDMyNlBvdlRx?=
 =?utf-8?B?aEtXSWlSY1JaaVA2RWZYNktSMnl6dGM0VWFDWWRYSFhNMWVub2hZdE5JcXRT?=
 =?utf-8?B?dkdTZmkxT25PbTBVb0lCd1BaN1lyZVduaHRvL2tySVM1bm9KOFUwN3lWZ1BF?=
 =?utf-8?B?V29Oak1neUd0NDl2YlVuSUo0WXc2TzR3QWhWUS9LNXRWM3dIOEhheHFOcFht?=
 =?utf-8?B?bnRQdVd0ekVCbWcvcVZUcHpYQ3NPN3paSXdtYWszOXh5aG9wbWwrRnYwellr?=
 =?utf-8?B?eSs0QUttN2Zwc3FLcHl3YmtTUW5qY1FBWnFmQURKN0VpTlZac3FVa2xmQkll?=
 =?utf-8?B?b050cHVTT3R4WGJkQmlDS2xVYmxXV1J2akx2N2t1V0VJbGZHczZTdEdYNXZu?=
 =?utf-8?B?Si9NY1ZnTnlFSFpUbU5KOU10WStsUEtBUzJFK0l1UkFXbFFucmtXVEgvZlhF?=
 =?utf-8?B?ckdzaDNKenlERmpxdUYxZGx5eU1YdlNKVCsvK2pEekxjLzJWcTFScWdGMzBa?=
 =?utf-8?B?SWYweUY4QUw1NkkrbjF0SDBtWHd5ZjVsbzBSMDJoUnlpczdQK2FPWTIwMHRt?=
 =?utf-8?B?QzJ4UUh3UmwreVRhUjlZTWlTZENMUzV5K2FDU1hhT3JvZFQ5ajY1ZnZpUTFZ?=
 =?utf-8?B?d2Z0VHlZR0Jqb0RrNm1NVDhUQXBPeG5ERWVncTg5bHF6UG45TkZXR3Y2c1Nz?=
 =?utf-8?B?cUYwUXVIR3hXYytnaTk5a28wT0h2Sjlva01RRDhMcGcyWVZPdUJ1LzVEcjRG?=
 =?utf-8?B?NG9UZThZcjB0RVBVN2wwNlh5dUVwYmN2U1ZCOVpZT3FjUkpONnp5ekxpcVVF?=
 =?utf-8?B?RkYybFRHMTNvdVVmRjFVUDV6SkduZVBPL1M2eE5DWTdSTFoxWmpYRk9zSU9J?=
 =?utf-8?B?MllqSjN6K3ZpQ3RHZ2pWSXhoVjdrbWJmMFpzaFlGOG1qRy83anBrVG9IU0I0?=
 =?utf-8?B?NHAwRWtlbzJub3V0cHcyVjFIV2FMcVJqTzFEMGEycG14WFJRWWpPelFHTnZi?=
 =?utf-8?B?ZmVtSkQxSlZsWVo1TnhUUUVGZnAxVFNGQWtCYkNSbHJVWXkyTEg0dW5IS3Fs?=
 =?utf-8?B?OEFhZ1Q0OWhWSXpha2MxdGZiaGxHb08xSHIyaVlNcWdQMW0yQ0tiWWVvYnpQ?=
 =?utf-8?B?M2pHS1V4aWFEc3hPL1FralgzL01uTFJnNUt5RmpRWTVDQWRsaG1aNUk2Q3pt?=
 =?utf-8?B?TUFaZHRzNXdBd2o3bHJYaWY2d0NIRDZOa3V0aWlSZ1Z2enorK0pnaFA5eEVv?=
 =?utf-8?B?N2g3RWl3NXh5UXJuQ2tuU3lNc016WHFHTlI2ZFJucGNZT0dnVzlOczJlVG1R?=
 =?utf-8?B?eHNES0dBeG1mNlB3QVFCZWwvRzYxYnhZRzNGU0xOdFkvQmZINnRUcjRuTnVT?=
 =?utf-8?B?MS85TGtkbUp6eW90WkFYcFo0bUtaUEFPeXNHTE1JTlhaVXBETjRnR212K2lG?=
 =?utf-8?B?QkhhYWpOZE4vVldjNXZQdXlUTzVpbDVzMitpU0YrbTRtZHcrd1pwU2pCN0hm?=
 =?utf-8?B?WDNiL2FIYmtlME5tcTR2RDNhQTlpTnlHTUV5WDEyakVvc0NjaEViTFByVC8w?=
 =?utf-8?B?bGFjbCt1VzhhSllCU3IwY0lmN2NFek5DMFZzeGFWUmp4MW90cmx2RXp2RER1?=
 =?utf-8?B?dnpqTXpPTTM2b242VUsxdk5ieXZVamtwbkN2TmZWaHJZYy9SUjRUQjJBcUky?=
 =?utf-8?B?UEhNUzBTTjFGYUx1WEhvUHBYbEZRV0pLU2ZrQzd1dVFNYzd1L3hXL0dPNGJW?=
 =?utf-8?B?a0k3TFhzTFFERlVxVjZzdWR6WnlHWURpcE5EKzlrczhoU2lQWUNUSmZJUHE0?=
 =?utf-8?B?eGtLRmpqZDJZV04yQkJWN0dlOFJDc05vbUk4Q3dtbWJtYmR1WmhsK0VNVmtL?=
 =?utf-8?Q?A6iAzEaryP/t4+pQKfUkIMRwM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37561190-dea0-4dd9-f145-08ddacd0def7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:25:25.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Up7Wep7Rpr69bALzJDqoPWcTxh0KotHWTvnlVFmWznCADfP9PNcFyDoj31dE/BqAQdPU5OfhnCgebpbQoDp1cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6956
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


On 6/16/2025 5:41 PM, Christian König wrote:
> On 6/16/25 12:05, Sunil Khatri wrote:
>> add support to add a directory for each client-id
>> with root at the dri level. Since the clients are
>> unique and not just related to one single drm device,
>> so it makes more sense to add all the client based
>> nodes with root as dri.
>>
>> Also create a symlink back to the parent drm device
>> from each client.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c |  1 +
>>   drivers/gpu/drm/drm_file.c    | 26 ++++++++++++++++++++++++++
>>   include/drm/drm_device.h      |  4 ++++
>>   include/drm/drm_file.h        |  7 +++++++
>>   4 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 2d43bda82887..b4956960ae76 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -296,6 +296,7 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>>   void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>   {
>>   	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>> +	dev->drm_debugfs_root = root;
> We should probably just move drm_debugfs_root into drm_debugfs.c instead of keeping that around per device.
root node above is needed in the drm_file.c function drm_alloc and there 
is nothing above drm_device where i can get the root information. that 
is the reason i mentioned it as drm_debugfs_root as root node of the drm 
subsystem itself.
~Sunil
>
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 06ba6dcbf5ae..32012e39dcb4 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -39,6 +39,7 @@
>>   #include <linux/poll.h>
>>   #include <linux/slab.h>
>>   #include <linux/vga_switcheroo.h>
>> +#include <linux/debugfs.h>
>>   
>>   #include <drm/drm_client_event.h>
>>   #include <drm/drm_drv.h>
>> @@ -133,6 +134,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>   	struct drm_device *dev = minor->dev;
>>   	struct drm_file *file;
>>   	int ret;
>> +	char *dir_name, *drm_name, *symlink;
>>   
>>   	file = kzalloc(sizeof(*file), GFP_KERNEL);
>>   	if (!file)
>> @@ -143,6 +145,27 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>   	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>   	file->minor = minor;
>>   
>> +	dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>> +	if (!dir_name)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	/* Create a debugfs directory for the client in root on drm debugfs */
>> +	file->debugfs_client = debugfs_create_dir(dir_name, dev->drm_debugfs_root);
>> +	kfree(dir_name);
>> +
>> +	drm_name = kasprintf(GFP_KERNEL, "%d", minor->index);
>> +	if (!drm_name)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	symlink = kasprintf(GFP_KERNEL, "../%d", minor->index);
> Better use dev->unique here, minor->index is also only a symlink.

Thats a good suggestion and doable. Will update in next version

~Sunil

>
>> +	if (!symlink)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	/* Create a link from client_id to the drm device this client id belongs to */
>> +	debugfs_create_symlink(drm_name, file->debugfs_client, symlink);
>> +	kfree(drm_name);
>> +	kfree(symlink);
>> +
> Move all that debugfs handling into a function in drm_debugfs.c
Sure, let me try that and push another patch.
>
>>   	/* for compatibility root is always authenticated */
>>   	file->authenticated = capable(CAP_SYS_ADMIN);
>>   
>> @@ -237,6 +260,9 @@ void drm_file_free(struct drm_file *file)
>>   
>>   	drm_events_release(file);
>>   
>> +	debugfs_remove_recursive(file->debugfs_client);
>> +	file->debugfs_client = NULL;
>> +
> Same here, move to drm_debugfs.c

Sure, let me try that if there are not challenges.

~sunil

>
> Apart from that looks solid to me.
>
> Regards,
> Christian.
>
>
>>   	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>   		drm_fb_release(file);
>>   		drm_property_destroy_user_blobs(dev, file);
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 6ea54a578cda..ec20b777b3cc 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -325,6 +325,10 @@ struct drm_device {
>>   	 * Root directory for debugfs files.
>>   	 */
>>   	struct dentry *debugfs_root;
>> +	/**
>> +	 * @drm_debugfs_root;
>> +	 */
>> +	struct dentry *drm_debugfs_root;
>>   };
>>   
>>   #endif
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 5c3b2aa3e69d..eab7546aad79 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -400,6 +400,13 @@ struct drm_file {
>>   	 * @client_name_lock: Protects @client_name.
>>   	 */
>>   	struct mutex client_name_lock;
>> +
>> +	/**
>> +	 * @debugfs_client:
>> +	 *
>> +	 * debugfs directory for each client under a drm node.
>> +	 */
>> +	struct dentry *debugfs_client;
>>   };
>>   
>>   /**
