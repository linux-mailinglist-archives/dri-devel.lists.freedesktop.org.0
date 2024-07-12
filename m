Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF792FBCC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39B510ED1B;
	Fri, 12 Jul 2024 13:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o8RVfK5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C45710ED19;
 Fri, 12 Jul 2024 13:49:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnnCIXCFvHB+Tu8tOq9iTJXtp4PHCMfiRYZ5fxD1LsWe8z5XPwkY7FEzXnyRrdpoMtJWUdLZKDJ45fjs1Ue/T/jAgWQAZhJ6XJWKT/WFRE0mFMG8w0azxjA6XnCDvxNmPFp8lrfydxq+1R9GCGXzb1YMLlMCcDyZMmKG+LVGBgC1KP2++MTM8lE/5tLF4Fqz74soEwexleaGuuHZsG5y5q1X+Z75aFkCLo6/zTtTJoZnKinXGl7qUFqaybBzDqGwRxQvBYwPxYRWyJ7bJyVOBBF+mZwerigRmG81lhD65hPZVNYYPL2bChZzDUSAK1Zkayxp9SixuX9RES9ORCjAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvEASu/zeh5122Y6lcbk8zZOt7p0hDVa8JGog+qpekc=;
 b=nhGq9wMQ+ZCSh30r4Vh94iv3JrW0K6f7P6YAIxq5mUlETGm8usIcf6KCSm0YgWNJ4lyRBDuqoFX5J1pPaxbR/lk+jb7ZZsq3uYrl5KNYYCc3lCtdNgm8jZ1IHaMtn3w2+GyGrmyk3qHMTOnT8TeD0YVDR0sVRWvK11JKZFgi/7nhSPLU/iXf67v2FekAdDV5lsmkeQZ6AIIcVTau5pRmiaeFXf0+jeI8KcT0rYvzXD3ahzlwIvPE8wMnlw5x+i2maKy+YHUoxXKLH6AVMVoAHVlrPxH3VLgjUbOU0bWu0I+rDu+swXra8pHOn5roZdmfhOu/qBmjxiXo78R78fNz4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvEASu/zeh5122Y6lcbk8zZOt7p0hDVa8JGog+qpekc=;
 b=o8RVfK5lpMzgqbNqg9zLASEdnUlQ3z9sCDQ2F2FvBfBsI5hZvJtee083Wa7dOl31ubMvxW3mM1MZzXTyhDaGCQj3xi0e8porYhTLIZmACWrUVeijYTt4IzJ7BuI9XyTKCgYxqd4IyyeUQvji7va9QAKntt74MelsWFZhodo2sUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6234.namprd12.prod.outlook.com (2603:10b6:208:3e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 13:49:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 13:49:54 +0000
Message-ID: <27cb7158-5908-407c-a6b7-fa654c1186bd@amd.com>
Date: Fri, 12 Jul 2024 15:49:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] drm/ttm: Allow direct reclaim to allocate local memory
To: Vlastimil Babka <vbabka@suse.cz>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: felix.kuehling@amd.com, alexander.deucher@amd.com,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240708160636.1147308-1-rajneesh.bhardwaj@amd.com>
 <d32ac1c3-2e87-48c8-b481-0fddf5e052ac@suse.cz>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d32ac1c3-2e87-48c8-b481-0fddf5e052ac@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f411d5-2e76-45db-631a-08dca27982c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1JMcm90QnRkMDhZNzRFU2E1RmtNdmlWbGpYVmtFZmxRVDBjQ09weUU2U1Zs?=
 =?utf-8?B?cURXKy8yaVg5aXBsei9MOFF6WG54QnF6WS9pbnFJSThvbGRURGZFcDZxWDhh?=
 =?utf-8?B?WGIzTSthamdIcm1oRHdpbUY4OW42VEpUK1FvbE5JNmc4SytyeVMveDNkQW9H?=
 =?utf-8?B?azFtdjRsN1BpODIvZXRtRXEvcW5iYkIwU3ZqS0R4ME1LRTNrV2hIUXVabjAv?=
 =?utf-8?B?OUJIc0F5YklIVmYzYXJIbStFM3NGSzdWZHVHenJTSytSdGlxSkZqVWo3a3cx?=
 =?utf-8?B?SVlCc2FVNno2UkFpNkQvL25oTmdZOFZOQ0UzVU5KemcyN3JZS3BKaFJheFBt?=
 =?utf-8?B?eFJEWXhRVnFxcHBtUjJ4M1FEYzY4cFVSY3pOWVM4TkxxdW9vYmZmVHBaNFpv?=
 =?utf-8?B?dmtFUllaaCtPKzhQVWJ4ZDA0MDdyc2VvL3UzekNrZ2wvYXA5VTcxVGVSV2lL?=
 =?utf-8?B?MVY2bHhEMGlNU0FkR3JSTHYxbS80WHdEYkFtWWZaYzJoSmlqbXFoSXc2dHlh?=
 =?utf-8?B?VW5WOVkzQ0ozcTA5bDN4c2NyZHVTNFNlNVRCMmlvaktsdDEyUk8yUGJ6ekhz?=
 =?utf-8?B?NzZyZ1FlVmhUZGdjaVgwNXBnQ01YUGw3NUJpUFRxdTNCZmFiQVhzUUVMbHBR?=
 =?utf-8?B?NzVYL1NqeE43a00yazNsSnV0a1NkVFExSE54NFNjMzdhemE5czlodnA5NlB6?=
 =?utf-8?B?UC9iTjZ4WU4wMk1mM3d5eW1vbHRPYitMTE0wYVpFUy92eG03L1k0Z2pwd0sr?=
 =?utf-8?B?UFU5UWxwWFBSTU85YmlDNUVKLzBTNG9XQW5XWVduSk01VGhTQWlBb01ZL3lT?=
 =?utf-8?B?N3hLUE11VTNvRnMralJNMGdxbU9JZ0NLcXQxWnpsdWFKNnZUNkxKZjViQWxt?=
 =?utf-8?B?dkNzWW9JS2V5VHg0Q0ZqbDlGNVlGSFdKSHRRODBKM1oyL2p3aEc3TVlnMDNj?=
 =?utf-8?B?c0p0aDBMcUZuOHlrV1ZrekhnNmQ2bHkrcU1UczBmVEV0L1NRbFFVVUJkckRS?=
 =?utf-8?B?M1lNeGJoSG1rSG52cEdHSjhLd2lIM3p5c0hJTDZnV054WUhDMDdqWklGN1Ft?=
 =?utf-8?B?RzZmaWZYdTJnRzRoOFNFOXI5Tm9haFVXM040aGpiUUhhZ2VaTzBmd2s5WmRw?=
 =?utf-8?B?WklsWGhyS2RrbExKaG9rOGUrSnh4WVNVaDBsZjlqdXlPR211b25sK2hkeUxt?=
 =?utf-8?B?MnlyRHJOQ3dzWmt2R3M5cUlhTmZMYzBRZ1cxcmVscStGY1NvRmZlNjVvdG9M?=
 =?utf-8?B?QVVqZzZTcllNV2pyVFRXZ3FXVTYvSjgrYUdPbllEbldOVjVDVHk0eUo3NUxL?=
 =?utf-8?B?OHpxY0dQNnJnQ3pqUUQ4a0I4ZjR3Y1ZtQjd5RzlhYy9pZEI0OWZ0WHlxblpD?=
 =?utf-8?B?SldBWmVPS2h5bEZ6TXFGcjN6OGxRYUxBaTVmSEZvTmVDMmhRbHIySnhtV2Fa?=
 =?utf-8?B?SG8yQlRKcVM1L250S2NZNmk5QVNxQk5ObEtkK01CelpjZ2xWcFc4MXBrMCtj?=
 =?utf-8?B?eTBIZFJZUHNJTnJTTno4bHNGdHhTSHZBbnhzazVpVlBtamdoMmRGV051aDFF?=
 =?utf-8?B?SjNkbGVtbVZDNUp5VWp1ZUVYNitTU0ZwSUlFUnRKMkkwOHVxVmhWSTM2NGxz?=
 =?utf-8?B?dHhNUWk3L0tpRHNLMWtXNVg4TzJ5WDd1TWVjdUNFcmx4a2JLOWVobExPckJM?=
 =?utf-8?B?Zi9iVmIrOGp2czY0Ny93dHYwN2RMdkJaSlJmQ2JSZEVadGdzRnl4N3dDdlRu?=
 =?utf-8?Q?VYWxE1aKtoTK38GJ4E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWtQQVp4ek45U0crZ2hxZlpac1VqSjZ3dUZyVHlhVGx1YnNuUldqY2k0Nk9s?=
 =?utf-8?B?TGMzb09xdE9SSi94SXpxMEpHUEp3YmxuYlhoNDRvSkdENG1IT0h0Qk95QnZC?=
 =?utf-8?B?VXcvOE8yUmUzV2xyME5qcGlSSXZ4Rm13UXNWTTlKTkNUNHJBMTBHQUNYTFhZ?=
 =?utf-8?B?MVRUUDFrb29DVmFheEJ2V09pQ01Mb3ZCVGxmd3JNS0pkcHp3Tkg5ZVJ4MDhJ?=
 =?utf-8?B?MVZNYVRuRWVRekpWSCtia0N4blJzejEzbTR0QkVJdlVzMHdFbFVOOTF6K05p?=
 =?utf-8?B?RUhBa1E3Qm5VVTJWL3ZSNDB4YkNjVnJ3N1l0eDFCWm9ESkVhbkZCR1NlbUpX?=
 =?utf-8?B?SzErVElVZkxZT0xQWUgyQk51Z2VubHA5U1kwRFlMTVYraFhyUU9JSG1NK05T?=
 =?utf-8?B?L1VBSk1uN0hvM3g4V2NmdGVNTEpyZUw1NmUvaVlkTXpRZ09TL2Juc3Z0NVNm?=
 =?utf-8?B?UTQvSDl3clRVNFYwM3NnOEtscUlVYTMxMStRSzgzWFdlL0VzMWNQWDAzQ2Jn?=
 =?utf-8?B?RmJSRmpNYXpzN0M3M0JWOExzR0QxT2JBQWxUZlF0RDl2R3o5SGhDd1FtaGxx?=
 =?utf-8?B?RGpoRGpaWlNrS3BYTllKa1QzL2N4VzdCb3Npak80TzR6RW41Q1VWaVNGckhV?=
 =?utf-8?B?OWFXNmFKZld4bG9Venh2TFppZW44cmlHVmVlNlZDWm9ma2VKSnlrc2w5T1ZW?=
 =?utf-8?B?Q1ZlejVuMXpsL2xubUZvZkwwb2hLTjYwQS9aNnozSlBiWEFDK0tOL2FSNU1I?=
 =?utf-8?B?NGVsTDZ6cU9pYTRLQzZSbXpIdGg4U1Y3Y3lENENGV0RrNnZ2VHBBS2ZZT1hj?=
 =?utf-8?B?MVh2VG9XOERJMjhxbjRGS3JWZkRZYzdVSmJzWTNMclMrR09vUis3QTliRXNX?=
 =?utf-8?B?SzlPS2xJN1EyNmpzSHlVLysza2JyeGp1dGhlL0YwVVFJL0F1MUMxWUhqMlJo?=
 =?utf-8?B?ZDkvTjg5TDdXRkhoWG9tUW5mOWo5bElFQS9LanVWeVcybFAvVGU3djZlQXpU?=
 =?utf-8?B?ZkUzZW5DcE5VdHZ3NDhrU0g3U3ZibjkzOFViUTExcEJFekViZzJ0OVRhQW5X?=
 =?utf-8?B?MnY5TERVbWM0ZG5DeEhrV1FMUW1sSFk4OEppYXQwRDFnQjZYTW5nbjZJR3RH?=
 =?utf-8?B?eFhUNnhJOXlWWjA3QytxM2hJNFlpWVU3UFAzODk4RlNLZmtualdUNTF2YzQ1?=
 =?utf-8?B?dTVub25lanZMTU9zc3d5TytIT3NLNTg3VVNXOW5lNjhxeUNGYXhmU2prN3Bl?=
 =?utf-8?B?aGJ0d3o4U1RrZy9QNUVYZXNvWGRxR0E2SExWbEVLeUZXMkNFUUJpcjVZRDg3?=
 =?utf-8?B?ZTR5b083R2oxaVNHZThTZjBZMi9UZm5ITHYyRTU2N091eExtdm1tRW9aN3ZJ?=
 =?utf-8?B?b2NxbHFqTlVkVWZOZDhDcGlXKzRQdGMrZzRCS3hoSVdzYjk0MnhpTHF3dHRC?=
 =?utf-8?B?a3B6b0dEd0g5K1NBUk5WVVo5QTd5QU0rSllvelVnOXAyc0tLTENtU3ZXSXZI?=
 =?utf-8?B?UlEwQzkvTXRpSzNHNGcrZHk1NmZ1UEI4OElOalFUcmN2OXRhdnFNbldmOTFP?=
 =?utf-8?B?d256VlpvMFBKMktscHN1blErZTZndng1R3hCdGM4QW1jNVdxVmdrUDNYQlg3?=
 =?utf-8?B?S3RManlqM1VxRXlRdnViSk5mMnFDLzNsVW5sK1FxbFhjOHlySzRESFNEVDF4?=
 =?utf-8?B?N2JOTkFybmQ4dGpYZ2dvdWRGSVBFVnQyNWpGa2tPb1VTVHZyd004c2J6S0V0?=
 =?utf-8?B?a1NvQ1c0dXZpajhXK3NUaUxkZWVxc00xZnJRaTRZYXFjc1dMYU5TVkROY3lq?=
 =?utf-8?B?bExyYzVEdWhyQUc4OCtMSzFxZU1ubFNQRFgyVWZPQ1VZQ2JyaGZ2dEg3Nzlw?=
 =?utf-8?B?UE5VV0xQaHVCbmNPbUZsZWhjc3BOSng1WGVDWHhtMzFjOXJZaWhNdGx5WFB5?=
 =?utf-8?B?U0FuWE81MkhQc1R1eklkbFUwNHhqUzNFcVZRYmgrckVzelZFNnJFdHFvS1BY?=
 =?utf-8?B?RS93MUEyNmxyL3FTWm9PKzd2bnZUMXVPY3JMNVdMQ29pTERpczJOSkNRY3pF?=
 =?utf-8?B?RWhlVkxKb1E3ejk5QjUzTXRzNHNHbExVRUVsR1MwNmFBRW1EdCtXejMzYXVx?=
 =?utf-8?Q?t8alzs8agdbjg4etO8Pcmnnm/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f411d5-2e76-45db-631a-08dca27982c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 13:49:54.9489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujFaQspw1ebQyvkkEqcyusHETzCNCFiF+C2f535sPZMkmiNSfd9xfs+2tQDHTp2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6234
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

Am 12.07.24 um 15:40 schrieb Vlastimil Babka:
> On 7/8/24 6:06 PM, Rajneesh Bhardwaj wrote:
>> Limiting the allocation of higher order pages to the closest NUMA node
>> and enabling direct memory reclaim provides not only failsafe against
>> situations when memory becomes too much fragmented and the allocator is
>> not able to satisfy the request from the local node but falls back to
>> remote pages (HUGEPAGE) but also offers performance improvement.
>> Accessing remote pages suffers due to bandwidth limitations and could be
>> avoided if memory becomes defragmented and in most cases without using
>> manual compaction. (/proc/sys/vm/compact_memory)
>>
>> Note: On certain distros such as RHEL, the proactive compaction is
>> disabled. (https://tinyurl.com/4f32f7rs)
>>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 6e1fd6985ffc..cc27d5c7afe8 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -91,7 +91,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>   	 */
>>   	if (order)
>>   		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
>> -			__GFP_KSWAPD_RECLAIM;
>> +			__GFP_RECLAIM | __GFP_THISNODE;
> __GFP_RECLAIM includes ___GFP_DIRECT_RECLAIM, what if the caller is a
> context that can't sleep?

That's unproblematic, all callers should be able to sleep.

>   Then it would be a bugy to add that.
> OTOH the only caller I see is ttm_pool_alloc() which seems to start with
> GFP_USER and that already includes __GFP_RECLAIM, so either way I see no
> reason to be adding it here, other than it might be a potential
> bug in case other callers are added later and have more restricted context.

Ah! Good point, I was already wondering why changing that didn't had any 
effect.

In this case we should probably just drop __GFP_KSWAPD_RECLAIM as well 
or stop using GFP_USER as base.

> As for __GFP_THISNODE addition that should be fine as this seems to be an
> opportunistic allocation with a fallback that's decreasing the attempted order.

That's what we wanted to hear, thanks!

>
> Also I note that the caller might be adding __GFP_RETRY_MAYFAIL
>
>          if (ctx->gfp_retry_mayfail)
>                  gfp_flags |= __GFP_RETRY_MAYFAIL;
>
> But here adding __GFP_NORETRY makes __GFP_RETRY_MAYFAIL non-effective as
> __alloc_pages_slowpath() evaluates __GFP_NORETRY earlier to decide to give
> up, than evaluating __GFP_RETRY_MAYFAIL to decide to try a bit harder.

That's expected, __GFP_RETRY_MAYFAIL is just relevant for the order==0 
case when we don't add any additional flags.

We could drop that as well since I don't think anybody uses that any more.

Thanks,
Christian.

>
> That's not introduced by this patch but maybe something to look into, if
> __GFP_RETRY_MAYFAIL is expected to be useful here for trying harder. If it's
> instead intended only for the final fallback order-0 case where the
> gfp_flags adjustment above doesn't apply, then __GFP_RETRY_MAYFAIL will
> cause the allocation to fail instead of applying the infamous implicit "too
> small to fail" for order-0 allocation and invoking OOM. If that's the reason
> for it to be used here, all is fine and great.
>
> Vlastimil
>
>>   
>>   	if (!pool->use_dma_alloc) {
>>   		p = alloc_pages_node(pool->nid, gfp_flags, order);

