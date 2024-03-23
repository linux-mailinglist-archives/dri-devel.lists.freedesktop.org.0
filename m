Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45C887A47
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 21:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A1C10E996;
	Sat, 23 Mar 2024 20:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rxTaa99U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6D210E4A1;
 Sat, 23 Mar 2024 20:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKa7zpSso4U8FIj6xDcoZ/KfM8E/IUM40cigRvYyeExSu+b4Bvk+aZgIiIWK5pQud+wCMMrbEgLiip4cCGgvebGZGN04vH09y1nNDb5IDWM+PMmVqud0ehLqPmePx7zQ9fA6nHiDXCWlMBFvot5zvC5T5L/2wJgknwT3snKYj+t/wr+z4RCg50ZmU0FMIq4TYUWjOuhigu0ZHmUOKZoagolV1cef4dpJiPiZ/CUl4cFaLtp/6jph5uPMdeLUs9PhFN1IsLbfzbNt1X0BXqSiXGFCbTRyMj8mQt3t3OMYLs6GqM510YOtLAwFQP3AvVJ8QohVLCFqHbpTdV+NDzxK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUMXOzM0GJAQzfzs97pBoY+qOmi1pw4wqeafYnN9b10=;
 b=AHnYZXRGqn1r7lVMc6kqGythH4u/6GFfDoJwAL9z89Isw+jVVkr95b7ApSEzZosuRZIY+IujCVWtiPmKLO0IxWGU1PeKTxeUT/XW0TzQkrW5q91gCF5YVDEtl6ud3MHfVxVWGaUgRn14Ra/Frxz9n80H/4kj/KE198EKD9wmvebUv1JCNfVBhxzfUCy6Vx7NTFQ8UXdqUeWjPyAM6YYWN7FyUWmxdHvesYt+tY2nqMctbmUtlDi/TMTnC5ElAaFbU13DMULarnfX0fwLI+hrSqKwhQGmx294w79tw+3XoIogbGqepsXQ2NkkGq/kxu0qQsZFC4y+9bY1VIqmqApAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUMXOzM0GJAQzfzs97pBoY+qOmi1pw4wqeafYnN9b10=;
 b=rxTaa99UrUeQpaZfftDum33n/lm8t/XDQxhmXOygJqAkbHxciI/PY6XrnJ81FMxaNlaKrfSgx0Sr0oXiGOcP7i+UOD4taLA/rVrHemxwYvw00sWmJPDezb+jzJJ5j7YWAOfyTIo9ua419YTALjcfX2WeXky2zZK9zWEhmu1clFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.28; Sat, 23 Mar
 2024 20:21:37 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b%5]) with mapi id 15.20.7409.023; Sat, 23 Mar 2024
 20:21:37 +0000
Message-ID: <c8efae98-3cf8-c21c-bfa4-d5998ab92a0e@amd.com>
Date: Sat, 23 Mar 2024 21:21:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
Content-Language: en-US
To: Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240307221609.7651-1-hannes@cmpxchg.org>
 <c411dce6-faaf-46c3-8bb6-8c4db871e598@gmail.com>
 <20240314170948.GA581298@cmpxchg.org> <20240323145247.GC448621@cmpxchg.org>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <20240323145247.GC448621@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::6) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: b23381b1-6d14-4025-8259-08dc4b76d74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyGHjGutXFKr+3CDWeGO89UNvBzfZf2PWaKU84prYhF/6h9cTurvhxNH3J4weUByRNOCGNS3uHUhqRSvZs4aFhWPpx6UGryyiYZv/jh7ck3FRnlQ2Q4C9c0P1uKMrVhPRjL94quFcyDWjxgqAVxvRBcP/2hJT9V7GkJevtegK/gCH8Erizypf4uLDOgmLiiK4mM8JeCZsMHe6sZRs+SAtzZaKBORCYpjo5e4OpQxS6n9n7GbA2yodNfMAPazaQ64QrpEPHOMG9uUT04xtpzLLuS48T4czY7VqHriQa4GW7csiFJOgQ8A/yU9tSnC755nLmTWKBzfrU78AlsmfRDUuoaAxtMfT7ysvprFaZlM5jv1rxWfRdmTqvn/N11LMGWorLLtotN/nc1zus0VnITB4upwRkLF4oYRGnDbcrbQsynbyT9QqgTGmf7aBVZhuLfXEcVYBBuJnqdSybzShM99QdRTOFQ6Mwmr4HFHjIYp7FoMkO0QWqx8l87vcrFmsB/TjgaamPm6sL35t6hcjOphG4tL5eQp9mPpqkDw0CazqSNyrim283w0VA9V0AlPJgzBpWncO2CmHfLP+1ySIXm0a7nTKGfLUT76Jl4ztNbp+l96QdmdHVOEP+cznKgIc1fVI8vxFMvzN/h57DmBev4WWEjpB4XjEYCtD6PXCalEqCM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFA0M0xsTCs2WUdSMk1qT1BsZXprMTVua1ZQdXI0OVZ1VmhlYlN3RGRvbkFM?=
 =?utf-8?B?SVBTQk5ncGExMU1qbmduY1ZZMkMxNU82OWw5V2VxQmpMaGRXN1N6dHBsazFZ?=
 =?utf-8?B?Y0JIM296Z3Y1M3BkS3R2cWU4R2xKVW5SRkFnTVJsaDlCZ1R4Zkh1Nkt0bjlw?=
 =?utf-8?B?cHVYbTV0bXJvc0xaaEtNMmpDQ1pLTHcyeDFEVkpjQmlMMHFicFhLTUpZQmJC?=
 =?utf-8?B?L3E3c2RYRDNDYlQ1R1BUSWo2ZlBWRDJSVitFRzZXTzVUTWNsSFZZSFZJcVpX?=
 =?utf-8?B?SjNZQmlSdU5FRW5SY1R4Rk9QTnEzdDZJQnRKeDlOS2orMlhsNHI3MjNkbWFR?=
 =?utf-8?B?eTJwLzR0aGZLTzRmVExuTG16VnErcm1XT09CM0RYODNtVk1zekU5UlJrNW9a?=
 =?utf-8?B?Rys4dnI4Q3JuQjVybml3WkgzdGdCYzM1UUI3TFBJczZTeklQOTZnK2w4aVFv?=
 =?utf-8?B?Y25JeS9QU3ZCOU13eDlVTjhHZWVtRTFWMDZ3eDNBQzgxSEJMc3BaVURFV2x1?=
 =?utf-8?B?MlA0MC9lM0dIQnh0VGYxa0laTmdLblJEZncyZURxcExQaFhRenk1NnJLbzlu?=
 =?utf-8?B?VXhzNlBnTEpKYXo1ekEzZEdQQzNRcE1ZMllERG9hT2FGZjZGZ2M1dVQvemk4?=
 =?utf-8?B?bFFrRHBhK2NhVHJ4V2tIcDdYNlNBV1ZpeXZWeFRlNGlNcjUrOXVJR1publR6?=
 =?utf-8?B?NEoyaUJMc2ZOYkxqVmNPclJKc3F1c011YUpBSlNiamM3OHpvak02dUJMQ1E0?=
 =?utf-8?B?dG80SHJ2eXFTR0ZjMXNPeEhlbWdXVHZjR3RDS1YyT0dmTUJmR3pYYks4Ykpu?=
 =?utf-8?B?dE5yWmdicHhLcVMvMzAwRDYzck5kMDNuSDdMTVJhaEwyeDdZc0tzZXlQWStN?=
 =?utf-8?B?STZhUkF3b3VyYnI0amJyMWdBRnNtYkRCNFlFN2VEOC8yOVpKQm55RFZDMXky?=
 =?utf-8?B?TkdoQVNpYnRyYTk2WW1YcWJKRVhCRGF4UUNYcnZkN2VIbkhxdE1CbHNCZTZL?=
 =?utf-8?B?TVo0SjUzT3BpRUFMaEdUVDBKa2pNQ2lxMmYwVm1sWUFSaXRtNisxV1Z5aGdk?=
 =?utf-8?B?OWVwWkJGNzE1dVVXdXdXdDFNZ1JLMjBjTWhkY3hiN2pob3cvRDk3SkdCZDlH?=
 =?utf-8?B?SkdYRFdpdFRLb05keWdCNEpqNndGUTcvZUVLVnI5TTNZY2RDMU83M0hEb2Zh?=
 =?utf-8?B?SGdRQm82b09RMEtjdUZWMkNZeSt4MzI2S1k3S2RHeFd4dC9iM2YvbFlGd05N?=
 =?utf-8?B?TENwUU15YWhRNXdYTHh0bGljV0VDb0ZGTWx0S2F2TEU1QmNJc3FlUGVaMkFx?=
 =?utf-8?B?dmFTYnovdDltYzhuNjRPYlNyR2hwTG45aFk3aGROcGs1bnJtcnVCZ3FaSkZ3?=
 =?utf-8?B?S2V1RUxrbStRVnZDN0s4VWVqdWh4THZ6SFlxRU1WbUNZbG1XTE9BTnQybkRs?=
 =?utf-8?B?dUYySnJMZ2hadHdxQWg3ZTRwSFJpN21TZ2lJN0dUSDdwMTJVQWx4NjhUU0R1?=
 =?utf-8?B?cENlY242RldSY09hWXM4ZGNTM0s5emtTcENPMWdJSWZISjhRTUxwQnlqQUl6?=
 =?utf-8?B?VkFGLzMvWTZTYzlHK2lRU2g4UjBMeFZnRFFlOFl1N29jRjU3OHhvNUlFd01z?=
 =?utf-8?B?aGtESDFIZlhISVEvK0pMcW44K1phY2MwK2xabmhzdm9lS0dYOWhMRVo3TmRS?=
 =?utf-8?B?S25oUFl4bXVCTGJ3VmZxS1RTVWRCMDNycVhKVnBKZkw2UTRzT29QK1QzdWkz?=
 =?utf-8?B?cXNrK1EvUFFtM2kzcmVKeGVIdXpzUTE5R2xtcXhEZE1kYnpSeHZwTzZhKzlH?=
 =?utf-8?B?ZU0yMjNZSGR4emtxbG5GVmYvekgzUTRLTXJJdFZtRjZZZnJYTENDd2ROSDlV?=
 =?utf-8?B?SWU2eVhNeHVDaGNucXZXTEJBR3hoUUJnTVBsL1lBbTlRdGFZR0pmdjZVd3Fl?=
 =?utf-8?B?bTd0aXJTS0JtR2tyUm1wZDkwRWNxYzAvN09aZ2lMVm44V2krSjUzR2NYbWpy?=
 =?utf-8?B?NjIrQ2pXbnptMDRrSS9qdlI4M3h2ZGhJQlFxa3ZvQlBWQUdENHlYUllKdDZx?=
 =?utf-8?B?dmdiWTJyMEJkSXJuSWtmcGRtQTRYRWRueitLSGFTSlROSm9GeWI1ZVc3WmRR?=
 =?utf-8?Q?+FQxyIWfahlxobg7J6O4uJzGd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23381b1-6d14-4025-8259-08dc4b76d74d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2024 20:21:37.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeW2gZyuDOMkDdlF9RDOWZGtqDzUK4NDrbE6lKRezTxNazY2Ttrb1wZ4fkeQR3B5UehFXQyseem/GSB0qODLVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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


On 23/03/2024 15:52, Johannes Weiner wrote:
> On Thu, Mar 14, 2024 at 01:09:57PM -0400, Johannes Weiner wrote:
>> Hello,
>>
>> On Fri, Mar 08, 2024 at 12:32:33PM +0100, Christian König wrote:
>>> Am 07.03.24 um 23:07 schrieb Johannes Weiner:
>>>> Lastly I went with an open loop instead of a memcpy() as I wasn't
>>>> sure if that memory is safe to address a byte at at time.
>> Shashank pointed out to me in private that byte access would indeed be
>> safe. However, after actually trying it it won't work because memcpy()
>> doesn't play nice with mqd being volatile:
>>
>> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: In function 'amdgpu_debugfs_mqd_read':
>> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:550:22: warning: passing argument 1 of '__builtin_dynamic_object_size' discards 'volatil' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>    550 |         memcpy(kbuf, mqd, ring->mqd_size);
>>
>> So I would propose leaving the patch as-is. Shashank, does that sound
>> good to you?
> Friendly ping :)
>
> Shashank, is your Reviewed-by still good for this patch, given the
> above?

Ah, sorry I missed this due to some parallel work, and just realized the 
memcpy/volatile limitation.

I also feel the need of protecting MQD read under a lock to avoid 
parallel change in MQD while we do byte-by-byte copy, but I will add 
that in my to-do list.

Please feel free to use my R-b.

- Shashank

> Thanks
