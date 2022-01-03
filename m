Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FF482EC1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 08:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A246D10E169;
	Mon,  3 Jan 2022 07:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F21910E14B;
 Mon,  3 Jan 2022 07:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Alwxcg4GDxoPLGUXyB7VTIzyW9zsDclM7l1yNWdiZe+i7nUwhqHDE/7nOlHSYzGFiuEGg2+rqRM3lOLCco1BNPcGRf0SyTfB5nK8qGeRpZKDXGcC3Tgsg90Tv/d9aDTodPxLcVcRE5stTED9PZA1WWYbNEod+jXNZ7s4li/kxjTAPTUd03I8SStUH1QTaN7xcOdj2tK3GVvBCDPDWW6qGOqT4jZu6dsq62lxu1AO3KdXv+qYWImC1q1kboygeBj2e9H7gSdsSS0XxRK/+HWOiydnrAaOYsaMpkyPNANJ8hnPsNhY+kHCOYS+GH/V31LWPjCNLvK6/BLyCfXWDNrTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SLDYPQI5ibc4fAqVHhcBTgeM7CQOknJLNrrO9xNLys=;
 b=Egles2AKIGYoYkRIB46qvpYXAnJx8SoMOwOgq1SuyGnM5ZczjpMp9EPKwyOCgiQAdtoNbDWLmxSuK7xDCNkpJkkYFV+piER7KvjkEqpRMaGXThshRVhCqexvzM2nwRBLURU47t33E7tGMGPhNtZiWr05tlnKv/D7vA7PbGzpCdCkxEDa4jU8hDLdAiOYrJwpG0Q43oVqqQH8wScX39aBqqgaKKUgxCd3yKvRSl1PK7lqsuBGAdjGcYQdJNqW7GUojuZ2Va+kQtKnsmPPpbjGPmI84E9HvhR+UbNsv5GZRJ6IQC+xcxgIEncGUFSNxdSp3XCiL749rhDH73e3hL1AQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SLDYPQI5ibc4fAqVHhcBTgeM7CQOknJLNrrO9xNLys=;
 b=It20qwHrNyGrLQTmbxWerOvlXWD/yci8AKZa4uUwo9Ust5cHa6e52kuW9FjykIJEErHIUDwYH82khLo8b4SeiRmf0EgSHMhzG0P9/I8b8OiBLbCkE5RV2D91OPMuGWKhxYGolsK4ljdGi/o7YGqAVFKLQw9YeSRxjI6t+XQZViE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0109.namprd12.prod.outlook.com
 (2603:10b6:301:52::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Mon, 3 Jan
 2022 07:41:38 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4844.016; Mon, 3 Jan 2022
 07:41:38 +0000
Subject: Re: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
To: Arunpravin <arunpravin.paneerselvam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
 <d76d347f-7dcb-546a-efc0-a324d773861c@suse.de>
 <fb3d8dc7-a0ff-f5ec-2fce-75515843eb92@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <76ea4e5b-e32f-67c8-7c9d-b110d0730185@amd.com>
Date: Mon, 3 Jan 2022 08:41:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fb3d8dc7-a0ff-f5ec-2fce-75515843eb92@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6P194CA0036.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::49) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe07b76d-7aba-4b50-2786-08d9ce8c7909
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0109:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0109CC8DF9893297AD25502983499@MWHPR1201MB0109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgNQ0FH9Ct9ktl0BEBBdPXvasVxG5OcudwEHpD1IS4jAy0U6UmfSLJ7IXAsUBbmCMUFuotltlNiGnw77p20h1Ouv4WpsNnJnc4LVJxuTebKwHKsZ1yQom04pilCqSS89EW0257L2hfowZPIOS24lLH13Ksi0LhR/xYrkaJ0bwiKz59kzrnox6yr0Lf+rKtmKX1hXxH6y5bd/YL8k5HfKTmlNX33jvWUfQiSLy3tjgaIWmNViDi0FhrCwIT/Dk/pmk4BRNDDizkE9ig2ZsPmohg4ysKH3N3BuoIHtXZJOQfVeI8/a65KXYMXiiYWMRv/vxpCyH1KIGtrDTmitg52A2s4EGi1aRNFVRa0+bCPPr1SlBC2av2KWFhCnmEFoJRfhug5hyexLrJ5/ze996EBoG9sbi7m/QulBWBNKI28cv9tY0Y25l/d/DLg/9JpT2myYezmSqQKg9sMPHYBQNLbiidIIpHT8O5KVEk02iwGQzoh++Y3VwG5cLv+p4t0g/4qvMoJdHJ9FQtozOFJgEXD2KA6cyy9ccD4+fKh529AzZ8h9Yc2PVGxUC/cPxgqfbyGp1yAxSn8S41bkCokT44NiV3O5MDdou7Vj1Bmp7HO9gm4eb5Pf//ZFbNYCtEvlYG9RgXzOnMg8S58/tYtImTS+qYrEtQl3UnwsN2zif2Sh66nr7XuMwhfh4wh4ZZgrdwKcc6/kORYpwCUYRoMIzFVEYkujMxNxbmcqBzbnGt3G9lw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(36756003)(2906002)(4326008)(38100700002)(8936002)(186003)(6512007)(2616005)(66946007)(110136005)(66476007)(508600001)(31686004)(53546011)(83380400001)(5660300002)(66556008)(86362001)(6486002)(31696002)(6506007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlPRGR5R0dIdmZPdWFoaUt1QzlzTnVlRUlyb3FzRmp6R0RWVVFONE9TVnBN?=
 =?utf-8?B?a0pmRHhvdU9nc1lwNTdjdTBONU56UFBXS1hVTWZRVVNQcFArclNpa282NVl6?=
 =?utf-8?B?OGxMUlFORUJUVnRmY0pyQ29WQVlhU3QzazEzMEZYVXcrT2QrL1B0K3hnWG8v?=
 =?utf-8?B?cCtkN2FMS1RZVXlQdU0xRmVIWVRhcDJvZWVJR2U0UUd3R01oK1owbFVDeXRF?=
 =?utf-8?B?S3RmVGlFOE04SVpjSDRjbGwxTWlkM0NBVkVHeU5tcUR0N2hERG1abC9nZFJV?=
 =?utf-8?B?clZ2b0Q2dHFITC84d3E5OHhOdTZDNFoxVmM3NDZiZHJLTkNaS1lITVE0aklq?=
 =?utf-8?B?a0FRTWw0M0tpRUV4K0xXY0pmbE5GVVlMeml0VDF6a2xYR2hrVGp4SkNTYUdm?=
 =?utf-8?B?cjJRU2dkODM5anp1UkVFZVdNRG5Wa2twM3hPMTluR0U4Qi8vQUJ5ZXpmRWgx?=
 =?utf-8?B?NjNWYnVYWTUwRUNsNm5TTmRUNm4xdXBZenUxbVFIWXNOY3JiQjNMNlZPYlM4?=
 =?utf-8?B?czBCdHM4d0d6NFpjN1dZdGh2QkFDMkJZZU1aQkRzZThDcHFIaXRKeDRJRTZ5?=
 =?utf-8?B?bUlsOFNodDFUNGNlZEdOQXp3TkJOUzIzcHhFRXh4dFc1dUxzWGV4c1EvQ2p2?=
 =?utf-8?B?YmpUY3h2YnZ1VnpOaUxDQXJXMEFsVHU3K3hYN05tcXl4UGV5NFlDQXIrd2ZP?=
 =?utf-8?B?c3ovWXVMd2lURGtPTGNJeXh1Mm4rRVR0SVpVNXVWZVV0MmJvNFNkZ1FPcktr?=
 =?utf-8?B?UWFjVFFFWXVUQW5uaXRzVWdyR0w3TFo1T0tOUXV4STBqcFA5enk0TVJuNDRp?=
 =?utf-8?B?SVJCYnNLTU11MXU3Y0ZaKzZGUUpJdDduWW0yQXU1b2gvVVZmR1ljSHpsTkR1?=
 =?utf-8?B?SDljQzhTSDNPOS9jWG1lRFUrZzhWVXY1cnpVdWEyVkRaYW5QeUFTeVNWc1Bl?=
 =?utf-8?B?dTZNUjJrWVFJMGJtdTNmTTVBU0dpTmU1Nm1xQldPc0thSHQrdjNvTklPL0VL?=
 =?utf-8?B?WEt5SEEyWWxtdGU5Y2VMcURuTUtNbkpOcFh6ZXdxUHZzWjNESjdza3NERzRr?=
 =?utf-8?B?clh5VzJiUEdGMUUyZmg5L0VuTU9YbHFzN0wvcDNtcy9vbE14Ly9MTU92NDFG?=
 =?utf-8?B?aUxUQmprZEZzVGt1ZGlWVTM3ZUpjTVNZZHlnVG03c3ZWUU5ialQ2eXJLZDMv?=
 =?utf-8?B?ODRsSTBKNndqVGVqVUtRWnhoY1g5ZTUrcFZPRExEa0l0anBXeDA4NUQvTThl?=
 =?utf-8?B?T0hLWWQyUVBtQ0J0QjNvL252YzhLbjRJTmlrUlpLTFBsY3hmRTBvUTg1a3M5?=
 =?utf-8?B?cUFLcnFaRHY0Nk0xUzJHSkNEUUgrMmJTZmJNSGdDdjBXT21sRlI4a0JFT1py?=
 =?utf-8?B?NnVKOEVJZitjUENDU1dhU2w4Mnc2SkVtcHhRTjgvWE5CVE1JZ1NmR2tBVTNk?=
 =?utf-8?B?dHFpc1FHeGpxbDF5QWN1bVpiNU4wc0g0VkRkL2xlcVNqNXJsNlhaNDgvZVJ2?=
 =?utf-8?B?NW5zcURrWGp1NGYyL1hTQUpRam9NYWFid2JHY3FsYnhFcU1Sa29xaVcweStp?=
 =?utf-8?B?YW11UVptMzRGZE9raGdDcTVJQzVZS0JJWFVhRFc0V05tVmt0ZEhmN09vbUdN?=
 =?utf-8?B?bmVmakJGUWFPaFUyUW1sZjg2bkpoZG5yL1J4YmQzYU1PTys3RDBWZ253TlVG?=
 =?utf-8?B?QnptY3U1SWtDYml5ekhnRWZCYzlRZERwUFdvQ3M3RVZybnpmeHU2L1RyZEdR?=
 =?utf-8?B?aWdxZ21xOUNQdVJlNU1xdWNOUlVNQ0JsQ2FlVkJvRVFzVXhmL3Bid2lVVG1K?=
 =?utf-8?B?ams5Q0MrY2pTcHRTNkpJODg0d0FBOVAvOHpRU1BZUlpQY0dkMHJTSGlGcmJn?=
 =?utf-8?B?WVQ3bExGS2cvMXNZWVZ3YWIvVjc3UUliTnBsRjErRUFDQ2c5UW81S0FNVW9J?=
 =?utf-8?B?V2NHcFRjR201WDhFMEhZcTE4ZXlNUkhJclNGUzR1N3VKRHZuRk1RSTZXWU1s?=
 =?utf-8?B?UnB6c1gxUGlWUHoxRWVVbklJT3g0em55VC91a2thZmV1SERyYnNnTEhtRGtN?=
 =?utf-8?B?eUxVWk5YRm4yMmVLaEgwY2pFRzFNcmFYV3pHTXZ0Q2ZSME9idUlNa3ZOT3Fw?=
 =?utf-8?B?amtnSDlEaUlKLy81akpMVXNNVytib3VpeGFxWVRaZE1CRnd2MThlNGRTbUs5?=
 =?utf-8?Q?nmh2ZczNer+NC6NeJO0cX/I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe07b76d-7aba-4b50-2786-08d9ce8c7909
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2022 07:41:37.9459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jd27anGJF9SO6eF1sHnhRfw6RGLplsRFC0I8qdN3lO3E33AY2gCVLyVEHIq0prQ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0109
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 26.12.21 um 21:59 schrieb Arunpravin:
> Hi Thomas
>
> On 16/12/21 5:05 pm, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 01.12.21 um 17:39 schrieb Arunpravin:
>>> - Make drm_buddy_alloc a single function to handle
>>>     range allocation and non-range allocation demands
>>>
>>> - Implemented a new function alloc_range() which allocates
>>>     the requested power-of-two block comply with range limitations
>>>
>>> - Moved order computation and memory alignment logic from
>>>     i915 driver to drm buddy
>>>
>>> v2:
>>>     merged below changes to keep the build unbroken
>>>      - drm_buddy_alloc_range() becomes obsolete and may be removed
>>>      - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>>      - apply enhanced drm_buddy_alloc() function to i915 driver
>>>
>>> v3(Matthew Auld):
>>>     - Fix alignment issues and remove unnecessary list_empty check
>>>     - add more validation checks for input arguments
>>>     - make alloc_range() block allocations as bottom-up
>>>     - optimize order computation logic
>>>     - replace uint64_t with u64, which is preferred in the kernel
>>>
>>> v4(Matthew Auld):
>>>     - keep drm_buddy_alloc_range() function implementation for generic
>>>       actual range allocations
>>>     - keep alloc_range() implementation for end bias allocations
>>>
>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> <SNIP>
>
>>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>>> +
>>>    struct drm_buddy_block {
>>>    #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>    #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>>> @@ -132,12 +139,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>>>    
>>>    void drm_buddy_fini(struct drm_buddy_mm *mm);
>>>    
>>> -struct drm_buddy_block *
>>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
>> Just a style issue. The structure is called drm_buddy_mm. For
>> consistency, I like to suggest to name all the public interfaces and
>> defines drm_buddy_mm_* instead of just drm_buddy_*.
>>
> Thanks for the suggestion, I think renaming drm_buddy_* to
> drm_buddy_mm_* creates a long name for the public interfaces, for
> instance - drm_buddy_mm_alloc_blocks(),
> discussing the style issue internally
> @Matthew, @christian - please let me know your opinion

I would prefer drm_buddy as prefix as well and I think we could rather 
drop the _mm postfix from the structure here.

Cause what we try to manage is not necessary memory, but rather address 
space.

Christian.

>
>>> -
>>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>> -			  struct list_head *blocks,
>>> -			  u64 start, u64 size);
>>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>>> +		    u64 start, u64 end, u64 size,
>>> +		    u64 min_page_size,
>>> +		    struct list_head *blocks,
>>> +		    unsigned long flags);
>>>    
>>>    void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>> I'd call those *_alloc_blocks() and _free_blocks(). Right now it sounds
>> as if they allocate and free instances of drm_buddy_mm.
> can we call those drm_buddy_alloc_blocks() and drm_buddy_free_blocks()
> Does this make sense?
>> Best regards
>> Thomas
>>>    
>>>

