Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A51B2D546
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A3210E35A;
	Wed, 20 Aug 2025 07:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N3ScXdX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FEE10E246;
 Wed, 20 Aug 2025 07:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReKdIosPGCpPNQk4+6cN3rP3rViMLcErdD4t0SSWWpY1cfeMaqAPbb6p+GBfAkxA8y7/0GifHFZ6drnSseZsLt1u54d9gp6M/x8vtQGHkUGky01trb0qnpADefS1v4EUBVv3fvAflEc+BorNZoSXoIyG8ZiGNDxrWLOHyorfhbT6ZfR94r8SMu6jblZsZ3BEOSuigxe2xyXl3L5k4vP/uyXaogPZYke5C1z+1N+U1k+ahUiF1zvTRX+ntApLVIqQlnSOyvEJ2RzMObDF6/hcpqHaep+XK1b3roORuu/5nL7CRWwj7/Z2DVfIVRi1cF1JCo3Jdfh+8aacm1pZeXYwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkOnrgiOSGevuyKvjfQG+pPcrKzALpo7RtbqOcTG5k4=;
 b=svbsb8iWHu12q41FSCa2VtoUxg+sdflZ/rwzKCp3AbQtPRwLpeI4vhbCaBaHghtBtiJ8VCPEZHplBcT/hslvMAfQjKpnYnsUjwF3mrAtnYdDgq0Vyd9T6FfKoXxwsJCpWKMeM41yMTFK0Tk2bl/0C7f1w4CtmwV07ZRhNTmB3SDJfnXtY+Q5OeZ6J9Q4srdjycGy5/GrFhEpllGpLe3sgaXdflRbO8ppvqL2nd9/AoYT9SkN/aIr4Wse6XV6nbft/YOWv/zpZOcwJpBUnM1Tz7FIJ5oH0f7W4/xFAscTTOyEyVzvcJ3wNgUT6Bpa0JiVPq0ngySCsjKcARAgXPhHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkOnrgiOSGevuyKvjfQG+pPcrKzALpo7RtbqOcTG5k4=;
 b=N3ScXdX4NVYzfPmRjYS+pqVd98f8OkiM8Ix0F/x8faqmtaTjLAN1dqG4vDj62gCbIlVryq1eLoU7mEHyRR24YHTY/Uf4rBGDKHoD/WLFLUZzXG9CleRUNAoQfdBwMhIZGHY37CQFWv363TkqQgaiFY+SMs6Wk4wC/VGHyMhFJlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DS5PPF6BCF148B6.namprd12.prod.outlook.com (2603:10b6:f:fc00::652)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 07:57:01 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 07:57:01 +0000
Message-ID: <0af2a7d9-f5c5-4d82-a631-1c2924a5a35a@amd.com>
Date: Wed, 20 Aug 2025 13:26:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250724104640.2319-1-Arunpravin.PaneerSelvam@amd.com>
 <868ec7ee-442c-4f78-84a8-0c1f966ecc60@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <868ec7ee-442c-4f78-84a8-0c1f966ecc60@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::33) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DS5PPF6BCF148B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f31943-d5f4-4349-80c2-08dddfbf252b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTNnOTFQNEpGYWwyaEhMSjV6L3NCbysxSDRHR2l3MithM0JJZHJDVFZYb0RM?=
 =?utf-8?B?N0dMeXVmazRyWVk0WmxwS1VqcXlzVVpGWDZjNnFneTZMTFh6a2thc0VZNkJV?=
 =?utf-8?B?MVJ0VDQ5UnBoQ1hrQnJqRk5iNk93bkJHajYxREpnZEVDSlA5SWFzQnRDZURD?=
 =?utf-8?B?U05xMjFZMEVPaWVEUjdEcVVsM3lGbGJ6M1ZnM0w1NEM1eGlUb2xocmdCQmcz?=
 =?utf-8?B?ZC9VTWJXRGxYVHNxMTUrSVBKM0pBQ0ZGT0JWZzBuem5pajVlbDdsem1wMVV0?=
 =?utf-8?B?L3l0WkdsQzIybENmVzdEZVY5ZjFuc0x4R2JZYXE2WnNlbUxqakhZd2YvbnRv?=
 =?utf-8?B?V0EyUitVQmE2VkkwQ3QvZ0tlTXR1YmxRQWxkb3ZOQThhb0dnV1RXcTllVUs0?=
 =?utf-8?B?RGkwSGYzTWc2ckF2T1lINVlPUjZFeW0rUm10MTV5U0lEZ3RRUmh2N1hYNFZB?=
 =?utf-8?B?YzBXQVJSMU00L2hLQkV6YU52aXRkUWJlTHVScEV6VGVQTERLV1J2a2pSVHlD?=
 =?utf-8?B?Z1AvRUVUWXBwUkY5Q3QrNVNvVVNDRFhOTWRUMUNLcFJiY2RmUWxkWHlJS0Vz?=
 =?utf-8?B?L2djaWM1NG5CWG93YTZLVjFVa05EQnVnc1NZSndQNXNLMDVqSFFRTFBjUGF2?=
 =?utf-8?B?MmVJVWZyb1hyeGVsOUducXVNV2xNb1NuUjZEYndQenhCaVdCWHRWdFQ0V2sx?=
 =?utf-8?B?UUlBZkpicGdjUGFYUDEzUXRRUStQQ25ZMW1VS2JVN01MdVRNV0tPVjNYck53?=
 =?utf-8?B?WFpDQTZHeXZETUYvak4wQ0VUY2tHRENSakMxcDZBT0d2NE9RWDRCakg1SEgr?=
 =?utf-8?B?L1doUVV0elUwVnoyNVM2NEdoZWhESUs4eExmbHgyVHV3VWV5OFlUUGFWaHFU?=
 =?utf-8?B?N1ZGNzNvanFBbkQ0NytDZDdzdGI3N1J4b1UxZmkzWWw0NTJoak9NV0cybkFp?=
 =?utf-8?B?M0lMWTV0Uis3K2R5cUpJczdWd1FLYnYvaHNXbmZCUW9NbWh6dEo2RGR3N01h?=
 =?utf-8?B?V3dDNUZFSG9wQ3diMFlPcDdrazV3L3A3TVZENEhFRms3dkJzNFZXR053eE9u?=
 =?utf-8?B?RCtnQTF5bVJyY0lRNVJESkJFdFB6eGIvVnZzNjhTQXAvRWczZ1NkdjhsZVk0?=
 =?utf-8?B?NGNwbGpPMXA3aHdxd2FkZ2lYUCtDUXJWUVVKMmo4Q2w5aEw0M2xyRXJseDNP?=
 =?utf-8?B?SEdUY3czMWdVdWptaURIM1g5anB0R3k4ZkV5WkhHbnZoN2EwZVR2U0cwSFRB?=
 =?utf-8?B?Wm1PYnc1MHFTakxKY1JCNDBVeWplc0Vxczd5eU1teTZoUnY4V2x4aTYybkYy?=
 =?utf-8?B?dXNNVlhCZzB2MnEvU1p5OHlxRGtpQjF5NEpvNXlmRzN5aktxeVZRRlBRbDU3?=
 =?utf-8?B?ZDdCRlpHZ2hEaFFGWi9ZTU9mdTF0dGZmVHJoanJNcG1qTTdjYUVkUnJVMzB0?=
 =?utf-8?B?OVJadS9pT28renM2VUh1Q3FDcXJPTlBrZGJDOGxEbUxJZWg4dzNNZHd4SEh4?=
 =?utf-8?B?VG5ab2tNdEhzcVROVlI5dC9DMTI4WlNZN25uU0NVRTNXbFMvV01rZU96b1pI?=
 =?utf-8?B?eGFQNGIveTFzTG5uMmsyamd5V01ZN1puQzJQS2JvcUVJV3hQYzIxOVBOVmNt?=
 =?utf-8?B?QVVzemVOS2gydzkyd2YrT0g5NW5OSEllVk9iZFQzd0ZaNndxZ3Z6UXN5N2NJ?=
 =?utf-8?B?NjUxUDJVcHYzNkxuNlo5ZzgyUE0wa3hrb1F3WTNrb0J5bGI4bEV3THdpd2Ux?=
 =?utf-8?B?ZDY2S2N2c0VsMGFuMDErWW1iU3VsS2FkS0tlVmhCOU9RTUVvY3NzK2pSNlc1?=
 =?utf-8?B?Z1BGTVNub3FDK0RHdjN3Yzh6ejJEMjFhY3c1alhMUEU4QUtJWEVIT3hyclhw?=
 =?utf-8?B?QVBqblU2aThpSU05VVFVNlhjR3p3TkJPTDhGWERtdkQ2WHlhcnpRdENTZHNR?=
 =?utf-8?Q?Ud/klfBd87c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW1qY2d3TWtkeUJtNkNIR3YrTnhDMnlZbXh5QnFGMzJPZFo4Mk52NGNud0tE?=
 =?utf-8?B?MS9sQmtza1lINCtTWjhzeHN4b0NlcDJJeG5jUE01L1IxVmFWY2RJTnltTUZj?=
 =?utf-8?B?VUI0UlhYUWFUTHpUUDIyUzFITDN4OE5xVFJVbDdFTW14UHJXTkpxay9lZlcx?=
 =?utf-8?B?Q21sb21ubFJTT3hFQUppQVg5ME9NNWZSQ29xVzdsN1RWRjQ1eEZpS1VXK3dm?=
 =?utf-8?B?NmhuUG1qc2RETVdKbEwxWEY1SVBNMHhVTkh5ZU5tVURBZUpGYU4zMW5EUlgr?=
 =?utf-8?B?R2VkUk01SWx4OStVeDhlZW1EWE40MDh2ak5xMlFDMlRmbVZoTklEQVBoNlhs?=
 =?utf-8?B?eWxWd3dDditTMlFQZHNGbkRXb081VHFHQjRkMXhyNW01ZGg0VzJSdHhISVNr?=
 =?utf-8?B?SEZJblJYYzFrSkw2bGtCenpDN0RCUk82UWJ6NUluTWc4Q0NrWDYvT0tEenNX?=
 =?utf-8?B?Kytub0tVSDQxbWZDZEdBT2l6R2RCVXhhTmtHdjc3NzZacGdERHIwRzdBdE9L?=
 =?utf-8?B?SXFneDFvNXpnUU9TV3hQVGxyMXhleFVVQm0rTVJWVGhSbjRJbXg5b3ZzWWNy?=
 =?utf-8?B?RzlUMjJIa0Ntc2dESXFjRTcyTGpHQzhhb3pySjMxZHJjWFo0WE50Y0RVWUto?=
 =?utf-8?B?bVo5emJWQnNpVFl2ZHVCbzRsajBxSXRYWW50bTBlUmxta1dwQXM1Y1FXdTh3?=
 =?utf-8?B?OTVKdTFOd1lwOThwd2tHNGlYbXE0SzlYUjdpVzBVZHRSY0ljc2F0Ulk1bkFH?=
 =?utf-8?B?d1BYczRHU0VnZFhaR3dEVkhrVWRjUEkvU3o5NklVbkl2VUIyZzExcUJydFVQ?=
 =?utf-8?B?b0p2ODRVTDJtOWhJYzZXUVFGNTNTZDd3SG9lYjlzc3BOR1FyMmxCUEZ1S0Rj?=
 =?utf-8?B?ZFRYaXgrT0IvQkFtTnNXcUUvSGNhMnhUYUdjWEpVcklqOGZsQzd5MnZEd0Jo?=
 =?utf-8?B?Um8vSkdhUllhaUVZSXVQU2ZsZ3dlWjd4MFBkL01BYndUQk9lY1hYV2NwcXJD?=
 =?utf-8?B?NWJPWVBuWkVqdEpQeUhDYm5Mai9YUDJISXBRTFZ1djJOamxUNTByRjVxNjVz?=
 =?utf-8?B?UEtXNUVYaGx6ZE12NFRVWEF3S3VZR3JrNi9EU2RvWWpic1BDbm9oYmdnUzVn?=
 =?utf-8?B?VU9oRmhKSlZoNyt2QnE1d3JUajB2c25ybEg1dldpZ0lXOG84bnVYVTkvL1l3?=
 =?utf-8?B?QjdJemRZTzNXWTB5UGM4emV6dytaVVpuWjhJTDJ0UXhZdi9UTEZiMDRTSVFH?=
 =?utf-8?B?aXJjQXVtQW43aHR3b2RNUnZ5K2RBYWpTT2wrdnpPRlNLb2FTUGtSRmpLMzNn?=
 =?utf-8?B?V2dZb1hrMjFGTW1JY2NMdUhwbkR3SFlnWkpCV2lPQzdzcFdjSlBCWk9qdzBG?=
 =?utf-8?B?ZUo4UjlFQVdvZnlFMHJHZ2Q1dnp6ZUtxbExFRjc3K2VGNXFSWXdNSnFmN0Vq?=
 =?utf-8?B?RWppekR2NkRXNmxqdjcxTCs3UUZxL2hrTkZFaUJGNUlVUUpHQmZwUjRkRnY4?=
 =?utf-8?B?SUcyaVhaRFVsSXZpOFBlTXorUDJ4OE1SNlNOUzM5MVMyaHo0VTcrTTd4Qmpw?=
 =?utf-8?B?eXp4d0FXL1dBdFAvZ2VsVllodk9DRThFUDNjKzN1YUZpdDJiNzdLWG5zVCsr?=
 =?utf-8?B?N1hCaTdBakZOOFVpMms1MGo1RWE0UXF0UkhkSXE1MlhDV3pYTzEydm14enJW?=
 =?utf-8?B?MEJYd0R0OWhkSmY3VXVEZG5Hcksyd3QrK0RtaGNUOE5lRjkzRS8rVDNERFov?=
 =?utf-8?B?RDQ0Vk1RcUJpbTFXUTdwRStzRjFRdDNkR081MmFIVkoyVGZaTkdrZUdsaGNW?=
 =?utf-8?B?dDFxQXNCcUNqeWpwRHc4RlY5NFdQa0Z3VGRRRTllcW9lejFuQzlkTVBsS2RL?=
 =?utf-8?B?dFFGYlhSdEdnbFJmM0hGNTc4V09oQUxoVFgzU3BKM3ZhSWp1bGI1QS9wakZO?=
 =?utf-8?B?ZWVRekN2YVhlSG54QW8ycnVISk9UT1RpTjBGc2hzaVFWbk40dElrTXF1K0E1?=
 =?utf-8?B?WWdna1YxMUlrbUlHNEU2VHVoSzlmZW1IQnBsRllTbHlqRldFcWVMOHBUSUlp?=
 =?utf-8?B?NDZmbU1jekQ0M0dGa0hBcXNQTy8yZFRkK1hDU3ltcnozcGRmNkJmWUdxL3pH?=
 =?utf-8?Q?kwytJXltBYnwEibFdc8j43g2a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f31943-d5f4-4349-80c2-08dddfbf252b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 07:57:01.4093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yn5Rfize9ywn3iN+H805Y6rskaXjAE7dLpKqg9NNwXeUSvLKMb/ni/JNURJH9MbAEeKuItoF3jQCUmKWjLwUsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF6BCF148B6
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

Hi Matthew,

On 8/14/2025 4:15 PM, Matthew Auld wrote:
> On 24/07/2025 11:46, Arunpravin Paneer Selvam wrote:
>> Replace the freelist (O(n)) used for free block management with a
>> red-black tree, providing more efficient O(log n) search, insert,
>> and delete operations. This improves scalability and performance
>> when managing large numbers of free blocks per order (e.g., hundreds
>> or thousands).
>>
>> In the VK-CTS memory stress subtest, the buddy manager merges
>> fragmented memory and inserts freed blocks into the freelist. Since
>> freelist insertion is O(n), this becomes a bottleneck as fragmentation
>> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
>> with the freelist, compared to just 0.03% with the RB tree
>> (rbtree_insert.isra.0), despite performing the same sorted insert.
>>
>> This also improves performance in heavily fragmented workloads,
>> such as games or graphics tests that stress memory.
>
> Neat. Also please Cc intel-gfx@lists.freedesktop.org and 
> intel-xe@lists.freedesktop.org on the next revision so our CI can pick 
> this up.
Sure, I will add on v3.
>
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 141 +++++++++++++++++++++++-------------
>>   include/drm/drm_buddy.h     |  39 +++++++++-
>>   2 files changed, 128 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index a1e652b7631d..19e9773b41be 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -31,6 +31,8 @@ static struct drm_buddy_block 
>> *drm_block_alloc(struct drm_buddy *mm,
>>       block->header |= order;
>>       block->parent = parent;
>>   +    RB_CLEAR_NODE(&block->rb);
>> +
>>       BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>>       return block;
>>   }
>> @@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
>>       kmem_cache_free(slab_blocks, block);
>>   }
>>   -static void list_insert_sorted(struct drm_buddy *mm,
>> -                   struct drm_buddy_block *block)
>> +static void rbtree_insert(struct drm_buddy *mm,
>> +              struct drm_buddy_block *block)
>>   {
>> +    struct rb_root *root = 
>> &mm->free_tree[drm_buddy_block_order(block)];
>> +    struct rb_node **link = &root->rb_node;
>> +    struct rb_node *parent = NULL;
>>       struct drm_buddy_block *node;
>> -    struct list_head *head;
>> +    u64 offset;
>> +
>> +    offset = drm_buddy_block_offset(block);
>>   -    head = &mm->free_list[drm_buddy_block_order(block)];
>> -    if (list_empty(head)) {
>> -        list_add(&block->link, head);
>> -        return;
>> +    while (*link) {
>> +        parent = *link;
>> +        node = rb_entry(parent, struct drm_buddy_block, rb);
>> +
>> +        if (offset < drm_buddy_block_offset(node))
>> +            link = &parent->rb_left;
>> +        else
>> +            link = &parent->rb_right;
>>       }
>>   -    list_for_each_entry(node, head, link)
>> -        if (drm_buddy_block_offset(block) < 
>> drm_buddy_block_offset(node))
>> -            break;
>> +    rb_link_node(&block->rb, parent, link);
>> +    rb_insert_color(&block->rb, root);
>> +}
>> +
>> +static void rbtree_remove(struct drm_buddy *mm,
>> +              struct drm_buddy_block *block)
>> +{
>> +    struct rb_root *root;
>>   -    __list_add(&block->link, node->link.prev, &node->link);
>> +    root = &mm->free_tree[drm_buddy_block_order(block)];
>> +    rb_erase(&block->rb, root);
>> +
>> +    RB_CLEAR_NODE(&block->rb);
>> +}
>> +
>> +static inline struct drm_buddy_block *
>> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>> +{
>> +    struct rb_node *node = rb_last(&mm->free_tree[order]);
>> +
>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> +}
>> +
>> +static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>> +{
>> +    return RB_EMPTY_ROOT(&mm->free_tree[order]);
>>   }
>>     static void clear_reset(struct drm_buddy_block *block)
>> @@ -70,12 +102,13 @@ static void mark_cleared(struct drm_buddy_block 
>> *block)
>>       block->header |= DRM_BUDDY_HEADER_CLEAR;
>>   }
>>   -static void mark_allocated(struct drm_buddy_block *block)
>> +static void mark_allocated(struct drm_buddy *mm,
>> +               struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_ALLOCATED;
>>   -    list_del(&block->link);
>> +    rbtree_remove(mm, block);
>>   }
>>     static void mark_free(struct drm_buddy *mm,
>> @@ -84,15 +117,16 @@ static void mark_free(struct drm_buddy *mm,
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_FREE;
>>   -    list_insert_sorted(mm, block);
>> +    rbtree_insert(mm, block);
>>   }
>>   -static void mark_split(struct drm_buddy_block *block)
>> +static void mark_split(struct drm_buddy *mm,
>> +               struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_SPLIT;
>>   -    list_del(&block->link);
>> +    rbtree_remove(mm, block);
>>   }
>>     static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> @@ -148,7 +182,7 @@ static unsigned int __drm_buddy_free(struct 
>> drm_buddy *mm,
>>                   mark_cleared(parent);
>>           }
>>   -        list_del(&buddy->link);
>> +        rbtree_remove(mm, buddy);
>>           if (force_merge && drm_buddy_block_is_clear(buddy))
>>               mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>>   @@ -179,12 +213,17 @@ static int __force_merge(struct drm_buddy *mm,
>>           return -EINVAL;
>>         for (i = min_order - 1; i >= 0; i--) {
>> -        struct drm_buddy_block *block, *prev;
>> +        struct drm_buddy_block *block, *prev_block, *first_block;
>> +
>> +        first_block = rb_entry(rb_first(&mm->free_tree[i]), struct 
>> drm_buddy_block, rb);
>>   -        list_for_each_entry_safe_reverse(block, prev, 
>> &mm->free_list[i], link) {
>> +        for_each_rb_entry_reverse_safe(block, prev_block, 
>> &mm->free_tree[i], rb) {
>>               struct drm_buddy_block *buddy;
>>               u64 block_start, block_end;
>>   +            if (RB_EMPTY_NODE(&block->rb))
>> +                break;
>
> If we got the block from the rb tree, can it be empty here?

I saw a crash earlier without this check while running graphics 
workloads, but it is not happening now. I will

test with more workloads and remove it if everything looks fine.

>
>> +
>>               if (!block->parent)
>>                   continue;
>>   @@ -206,10 +245,14 @@ static int __force_merge(struct drm_buddy *mm,
>>                * block in the next iteration as we would free the
>>                * buddy block as part of the free function.
>>                */
>> -            if (prev == buddy)
>> -                prev = list_prev_entry(prev, link);
>> +            if (prev_block && prev_block == buddy) {
>> +                if (prev_block != first_block)
>> +                    prev_block = rb_entry(rb_prev(&prev_block->rb),
>> +                                  struct drm_buddy_block,
>> +                                  rb);
>> +            }
>>   -            list_del(&block->link);
>> +            rbtree_remove(mm, block);
>>               if (drm_buddy_block_is_clear(block))
>>                   mm->clear_avail -= drm_buddy_block_size(mm, block);
>>   @@ -258,14 +301,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>         BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>   -    mm->free_list = kmalloc_array(mm->max_order + 1,
>> -                      sizeof(struct list_head),
>> +    mm->free_tree = kmalloc_array(mm->max_order + 1,
>> +                      sizeof(struct rb_root),
>>                         GFP_KERNEL);
>> -    if (!mm->free_list)
>> +    if (!mm->free_tree)
>>           return -ENOMEM;
>>         for (i = 0; i <= mm->max_order; ++i)
>> -        INIT_LIST_HEAD(&mm->free_list[i]);
>> +        mm->free_tree[i] = RB_ROOT;
>>         mm->n_roots = hweight64(size);
>>   @@ -273,7 +316,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>                     sizeof(struct drm_buddy_block *),
>>                     GFP_KERNEL);
>>       if (!mm->roots)
>> -        goto out_free_list;
>> +        goto out_free_tree;
>>         offset = 0;
>>       i = 0;
>> @@ -312,8 +355,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>       while (i--)
>>           drm_block_free(mm, mm->roots[i]);
>>       kfree(mm->roots);
>> -out_free_list:
>> -    kfree(mm->free_list);
>> +out_free_tree:
>> +    kfree(mm->free_tree);
>>       return -ENOMEM;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_init);
>> @@ -323,7 +366,7 @@ EXPORT_SYMBOL(drm_buddy_init);
>>    *
>>    * @mm: DRM buddy manager to free
>>    *
>> - * Cleanup memory manager resources and the freelist
>> + * Cleanup memory manager resources and the freetree
>>    */
>>   void drm_buddy_fini(struct drm_buddy *mm)
>>   {
>> @@ -350,7 +393,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>       WARN_ON(mm->avail != mm->size);
>>         kfree(mm->roots);
>> -    kfree(mm->free_list);
>> +    kfree(mm->free_tree);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_fini);
>>   @@ -383,7 +426,7 @@ static int split_block(struct drm_buddy *mm,
>>           clear_reset(block);
>>       }
>>   -    mark_split(block);
>> +    mark_split(mm, block);
>>         return 0;
>>   }
>> @@ -598,7 +641,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int 
>> order,
>>       for (i = order; i <= mm->max_order; ++i) {
>>           struct drm_buddy_block *tmp_block;
>>   -        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>> link) {
>> +        for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
>>               if (block_incompatible(tmp_block, flags))
>>                   continue;
>>   @@ -624,7 +667,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int 
>> order,
>>   }
>>     static struct drm_buddy_block *
>> -alloc_from_freelist(struct drm_buddy *mm,
>> +alloc_from_freetree(struct drm_buddy *mm,
>>               unsigned int order,
>>               unsigned long flags)
>>   {
>> @@ -641,7 +684,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>               struct drm_buddy_block *tmp_block;
>>   -            list_for_each_entry_reverse(tmp_block, 
>> &mm->free_list[tmp], link) {
>> +            for_each_rb_entry_reverse(tmp_block, 
>> &mm->free_tree[tmp], rb) {
>>                   if (block_incompatible(tmp_block, flags))
>>                       continue;
>>   @@ -657,10 +700,8 @@ alloc_from_freelist(struct drm_buddy *mm,
>>       if (!block) {
>>           /* Fallback method */
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -            if (!list_empty(&mm->free_list[tmp])) {
>> -                block = list_last_entry(&mm->free_list[tmp],
>> -                            struct drm_buddy_block,
>> -                            link);
>> +            if (!rbtree_is_empty(mm, tmp)) {
>> +                block = rbtree_last_entry(mm, tmp);
>>                   if (block)
>>                       break;
>>               }
>> @@ -728,7 +769,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>             if (contains(start, end, block_start, block_end)) {
>>               if (drm_buddy_block_is_free(block)) {
>> -                mark_allocated(block);
>> +                mark_allocated(mm, block);
>>                   total_allocated += drm_buddy_block_size(mm, block);
>>                   mm->avail -= drm_buddy_block_size(mm, block);
>>                   if (drm_buddy_block_is_clear(block))
>> @@ -806,7 +847,6 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>   {
>>       u64 rhs_offset, lhs_offset, lhs_size, filled;
>>       struct drm_buddy_block *block;
>> -    struct list_head *list;
>>       LIST_HEAD(blocks_lhs);
>>       unsigned long pages;
>>       unsigned int order;
>> @@ -819,11 +859,10 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>       if (order == 0)
>>           return -ENOSPC;
>>   -    list = &mm->free_list[order];
>> -    if (list_empty(list))
>> +    if (rbtree_is_empty(mm, order))
>>           return -ENOSPC;
>>   -    list_for_each_entry_reverse(block, list, link) {
>> +    for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
>>           /* Allocate blocks traversing RHS */
>>           rhs_offset = drm_buddy_block_offset(block);
>>           err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> @@ -933,7 +972,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       list_add(&block->tmp_link, &dfs);
>>       err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>>       if (err) {
>> -        mark_allocated(block);
>> +        mark_allocated(mm, block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>>           if (drm_buddy_block_is_clear(block))
>>               mm->clear_avail -= drm_buddy_block_size(mm, block);
>> @@ -956,8 +995,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           return  __drm_buddy_alloc_range_bias(mm, start, end,
>>                                order, flags);
>>       else
>> -        /* Allocate from freelist */
>> -        return alloc_from_freelist(mm, order, flags);
>> +        /* Allocate from freetree */
>> +        return alloc_from_freetree(mm, order, flags);
>>   }
>>     /**
>> @@ -974,8 +1013,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>    * alloc_range_bias() called on range limitations, which traverses
>>    * the tree and returns the desired block.
>>    *
>> - * alloc_from_freelist() called when *no* range restrictions
>> - * are enforced, which picks the block from the freelist.
>> + * alloc_from_freetree() called when *no* range restrictions
>> + * are enforced, which picks the block from the freetree.
>>    *
>>    * Returns:
>>    * 0 on success, error code on failure.
>> @@ -1077,7 +1116,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>               }
>>           } while (1);
>>   -        mark_allocated(block);
>> +        mark_allocated(mm, block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>>           if (drm_buddy_block_is_clear(block))
>>               mm->clear_avail -= drm_buddy_block_size(mm, block);
>> @@ -1161,7 +1200,7 @@ void drm_buddy_print(struct drm_buddy *mm, 
>> struct drm_printer *p)
>>           struct drm_buddy_block *block;
>>           u64 count = 0, free;
>>   -        list_for_each_entry(block, &mm->free_list[order], link) {
>> +        for_each_rb_entry(block, &mm->free_tree[order], rb) {
>>               BUG_ON(!drm_buddy_block_is_free(block));
>>               count++;
>>           }
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 9689a7c5dd36..a64d108a33b7 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -10,6 +10,7 @@
>>   #include <linux/list.h>
>>   #include <linux/slab.h>
>>   #include <linux/sched.h>
>> +#include <linux/rbtree.h>
>>     #include <drm/drm_print.h>
>>   @@ -22,6 +23,41 @@
>>       start__ >= max__ || size__ > max__ - start__; \
>>   })
>>   +/*
>> + * for_each_rb_entry() - iterate over an RB tree in order
>> + * @pos:    the struct type * to use as a loop cursor
>> + * @root:    pointer to struct rb_root to iterate
>> + * @member:    name of the rb_node field within the struct
>> + */
>> +#define for_each_rb_entry(pos, root, member) \
>> +    for (pos = rb_entry_safe(rb_first(root), typeof(*pos), member); \
>> +         pos; \
>> +         pos = rb_entry_safe(rb_next(&(pos)->member), typeof(*pos), 
>> member))
>> +
>> +/*
>> + * for_each_rb_entry_reverse() - iterate over an RB tree in reverse 
>> order
>> + * @pos:    the struct type * to use as a loop cursor
>> + * @root:    pointer to struct rb_root to iterate
>> + * @member:    name of the rb_node field within the struct
>> + */
>> +#define for_each_rb_entry_reverse(pos, root, member) \
>> +    for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member); \
>> +         pos; \
>> +         pos = rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), 
>> member))
>> +
>> +/**
>> + * for_each_rb_entry_reverse_safe() - safely iterate over an RB tree 
>> in reverse order
>> + * @pos:    the struct type * to use as a loop cursor.
>> + * @n:        another struct type * to use as temporary storage.
>> + * @root:    pointer to struct rb_root to iterate.
>> + * @member:    name of the rb_node field within the struct.
>> + */
>> +#define for_each_rb_entry_reverse_safe(pos, n, root, member) \
>
> Would it make sense to give these a less generic name? Something like 
> for_each_rb_free_block_* ?
>
> Also should this be exported or rather kept within .c?
yes, I will change it.
>
>> +    for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
>> +         n = pos ? rb_entry_safe(rb_prev(&(pos)->member), 
>> typeof(*pos), member) : NULL; \
>> +         pos; \
>> +         pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), 
>> typeof(*pos), member) : NULL)
>
>
>> +
>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>> @@ -53,6 +89,7 @@ struct drm_buddy_block {
>>        * a list, if so desired. As soon as the block is freed with
>>        * drm_buddy_free* ownership is given back to the mm.
>>        */
>> +    struct rb_node rb;
>>       struct list_head link;
>
> I think we can be slippery here and make this a union? They should be 
> mutually exclusive AFAICT?

AFAIK, we need both, rb_node rb is for handling free blocks and the 
list_head link for adding the allocated blocks into

the driver's list.

>
>>       struct list_head tmp_link;
>
> Otherwise it should be possible to get rid of this instead, and just 
> re-use link? Could be done as separate patch, if this makes sense.

I think we cannot use link here since it is needed to add the allocated 
blocks to the driver's list and tmp_link is already used in

alloc_range() and alloc_range_bias().

Regards,

Arun.

>
>>   };
>> @@ -68,7 +105,7 @@ struct drm_buddy_block {
>>    */
>>   struct drm_buddy {
>>       /* Maintain a free list for each order. */
>> -    struct list_head *free_list;
>> +    struct rb_root *free_tree;
>>         /*
>>        * Maintain explicit binary tree(s) to track the allocation of the
>
