Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A338787D
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADAA6EB49;
	Tue, 18 May 2021 12:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4826EB48;
 Tue, 18 May 2021 12:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVgqL4IqgjOCOC0lelJRFNsfWocolAXjrJwX84bF3K/LcOHCw5FVBd/wQjeyyUIr72F+Yv8UmVDpJcJKiJTjjqEPFSyLUZgT4Ce9AQ+ajr+PlfLO8DJi4rZCM8Zm71TllmPUR8s20L09ziWzj2HURxvI87xZCVzNkqhwApqBi87blhiikt7PyvY3pBbIX/t56LEY3AjVR7l0hSVCZ9sE8w5mzenY4n2EgB6Bi+MObZnfZQF9pF4JCpiq8ksir19ONxCcygyUyLHrOi1/TuQs0vnAup/R4BbWjbCeVsTBFrCGsn69NoCKqV+4XhfdUGxutL07o0xlacHevNQyhWbsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFdqga/iNwAnwNYC4iqT84EwlpoxP4oYJAuy7uL2twU=;
 b=YoehBptDm6qbK2erLeqOjfVWAUMOtko9Bn9lX4M4PNO7+DRjwN1YdivRDxjiRM65BV+HaKnvvSkomrkB2/0AgFoJgj5Dfa212FDZL64fo4HvqLA9IY49jCeNyAkVxF/A7PT0f2hus7S/PbUwn5/ONC8QQfY03hPuSU+myuRmfrDDyaB2oeHpROedl/Mkkt7BHOu+wTHF52F37CJJH1v7IhpjRdb/CSoScxmPlJ9b/yqoGeAhsTvRGfKcSxsm7uZwx6GywD8/53yMjYLDHszHtvaBEVpAWfT7hH3q/4npHe58F1wOU+sDXJc9sr+4Q9JxrD6CBW9iX1xEp/AcghL10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFdqga/iNwAnwNYC4iqT84EwlpoxP4oYJAuy7uL2twU=;
 b=lTLzekzxfTA4iNR0kVAZJqHHgxLwYd4cEAeOYn6WX61amN/yB3wJSyHeP8r0XK/NwEPDeXs2SepiFBNnYz/d1NDYidmCKYI++SK3WVOj2xSmw5YJKqmxON4lDl4tRyJGL3O0nzXXUNv06miDRGWGwQf9CAaoFE9FcSc/+HV1tiA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 12:09:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 12:09:32 +0000
Subject: Re: [PATCH v2 08/15] drm/i915/ttm Add a generic TTM memcpy move for
 page-based iomem
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-9-thomas.hellstrom@linux.intel.com>
 <6149ee00-fa4a-3757-117a-8d622eb42070@amd.com>
 <45054121-954d-f20c-52b5-f375db7096e0@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d547a037-2aa8-76a8-375c-5da580fab631@amd.com>
Date: Tue, 18 May 2021 14:09:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <45054121-954d-f20c-52b5-f375db7096e0@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: PR3P189CA0053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 PR3P189CA0053.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 12:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49186861-6fd3-4660-6441-08d919f5cbb9
X-MS-TrafficTypeDiagnostic: BL0PR12MB4947:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4947B2B491D48202589C1106832C9@BL0PR12MB4947.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JE7/RH4zegJXQYstMOL5ujw6vG0Ap4aYJAqkJxKQRlOOs1hffVf6Ec58NuFEZcicbKjwKT/HBfYu6YkwqPqypEK9t/mi+tQzHNDNCCLmVZTWbKlEHg4agjisjmW+TvrHIWpm1vqCOlNh5wbTUneNePbqQu9dqVMh/D/tw6al5SQGAr9/gHOTAkJkdPZ847y1SZ9sjOUqLhY/Rd6gDhnUuKhKL4k0M6cN+dmCZi4GNvyxMG1m0nE5bd1uyayF2AGoB3fmwfqIGrPWGXCdwLMnmSFLzpv29kL4K9osm3+Q/I9iX5tpja4PN0h1DjF6cl3RSLwCqvD4XmGCWNAr9Tb5Xyc9lgtQ5BRM+rRZCKi4YFy5FJTou8s5UPluRUVTWVgZswi1pK4bF9o3p6DDp1hDc440/LM0mCm+TYGTRIJBF9bgHQKxLNrsiOQ4jMp90yelAZNP5dYjM8wStOTp8fu1ckhgYKsMBirOPHU7SFMZQE/wwPbm13GBUK5qGif7g0mvcKv+SqB/Ee5kQ8HK1AFOV2r4ANwJpC+5nVoPfA+QNNvdjVfAyiqqSPaRqLkIPTUsB8L7xQmxufiKftAlTvYVabLZpkrRhG9wy3bv17YOlpINXfSS7WuVVpo0GA0yECm7pH9UJ3POw+TX48WpZHqKGB/xG8/dZHfMWCU5TUsLWNxOe9fVMilwxW6DXzd4o2s4WFy9Pt8xgDdY9cYdh0cbqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(39850400004)(376002)(86362001)(6666004)(66476007)(16526019)(316002)(36756003)(2616005)(6486002)(66556008)(53546011)(186003)(8936002)(31686004)(38100700002)(66946007)(52116002)(478600001)(8676002)(31696002)(66574015)(83380400001)(5660300002)(2906002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YWNhVVowTGU4ZVdtSDcvWWlvckV6cWNHYmF1bGR4eWJiYk02V0ZwZWFYVm0r?=
 =?utf-8?B?SlBJQXdHSFM1MnlydVEweDZ0TkVIYlcrSDZMd3k5TlpDL0k0a0Y4OXBFbHdV?=
 =?utf-8?B?ZjJWWGhvRms4UVhHWHlrc0tNSlJvaWUvNXo3aExJMzhBY2hLS3p0NEZQTTRa?=
 =?utf-8?B?L1gxejRzRW9ZZW5zUmxqRFBQWjhvckt6SldNUmFqdisxL0lVOVYzZlZWRW8w?=
 =?utf-8?B?VUtTTzdtRFJWeUZSVHM5bjl5UGQyNzBVZTgrQysvZC9GZHE2OUJTZnJtaENk?=
 =?utf-8?B?Wks5ekxaQkprYm9hMEJtT0ZubnNxYnVNcUl4RzVuK3JIZmpRTmdmNnhxSzhz?=
 =?utf-8?B?V3hnL1BIU1dLMXZVbERNNEYzaFVacWd4NzhFa3dyc3lKK25LZDVad3kxeEEx?=
 =?utf-8?B?VWNmWmUwV3dKVERNcHgvODUwd0k2d3Z3MW5iUkY2OGpObG92M2JkSS9lcWpC?=
 =?utf-8?B?TllIU3VWeTZIQzNmNEp4VVBGOFRnWktBK3JQR3pvalovR1llRXVnMGdTeDk3?=
 =?utf-8?B?Ulo1cCtzMDRQS2FRcC8yQUxoMzdxYW94K3NzaEFGT01YSTZvcU0rRldLWUxC?=
 =?utf-8?B?Uy81UHpKWXYvTytoS3RmRDN0bW5CQTFzcXVINkVYQnR0Vnkrb082SXFnMm8y?=
 =?utf-8?B?cHdwQm1VTWpjaTN2ekVObFVwUU1TMWpES21kTjd6bnpGYnkwQjIyZVdJamNh?=
 =?utf-8?B?L2R6RFk1aWY4cU43UTBvQ2FlNmNxZ2VVYWhhY21rMFpLSW5CVmVjZG1nZWFU?=
 =?utf-8?B?MDhTd09PUVova3Qza2JsTU92TDE3VjhFN1NvWmgvU0NLd3E4U0F6enRyb1VM?=
 =?utf-8?B?eVVEUEVxZC9hMGs4TWgyUlp2TWVOT0FNajZpZ2xiMWVWWE55WWZJcnluWnpV?=
 =?utf-8?B?VkNuUU9NdzdTa0RydSs2aWxKUWlURE83dTNuREorYTRVMG1lZkI5M3J1KzRP?=
 =?utf-8?B?bHZiMmZ0RnZhY2txZytzTXEwQ2VwK0grbFlQdlNyamRhVG5wb3NYTGVTR2xW?=
 =?utf-8?B?UUNnUzQvNUYwUlJpRjlQOVFvWGxKeXExc084aHhwdEl2MmtTa2QvT21WK0xZ?=
 =?utf-8?B?NnhaenllVlNUYTVDN29KeVFCSDZMVmRvTFFhRVpNaVFNWHRZZUowNmtkZjV2?=
 =?utf-8?B?aUo3Zk9ZNUFadFRzREJRNW9BOVgvT0xMTUFtMVFKM2thTkJYTEVmTU04RE5q?=
 =?utf-8?B?dHRSbXZOTmFVQ3pDWDBHNW16Ly9mdHNWSjMxYUI1ai93UHgzV085TFpKeXB0?=
 =?utf-8?B?SVpNaXlybHhIUGxPQlV1ck1GcnUzWG9SanBaTDkwNUFId0pyQzRjaDVEdkRm?=
 =?utf-8?B?ekVkNXc2ZWJLcEpOODI1ME1KWWFoUVRjVXlRazQ3WXNqalRnVEk0VSs0YThU?=
 =?utf-8?B?UmlPQWc1dlB2S3ErSkdCRExtQThETUhVRjlIcWxhaWd1eUJNd0VwSmVtMlpz?=
 =?utf-8?B?S09LcVYvL0RCb0tnZ2liL3hVUE8rRGxsUG5QMm4yNVAyTE15L2ZzMjdsSjU5?=
 =?utf-8?B?ZFk4L2JJZkkvQWhmOCtmdHVGQkx3US9QSTJGZWIzUjh6cFhuZnVIN2JSVS9C?=
 =?utf-8?B?L0FFWVlLSG5rS1pEZWtjMm9QZDRPdmxPNm1wOE9tZk81SXMwajZnQnd2WUYx?=
 =?utf-8?B?NXlNdE9oeHRhTUhYRFFWTmg1UVN1WkwxcG5xMDJiN0FMcG55a25pcGdxWkhx?=
 =?utf-8?B?R2lydEZFU0htcXp6eHptc0poVzNqMGk4aU13cG5vYlMwWDJ2RmlmSWV4bFk0?=
 =?utf-8?B?ZW11SllJTHJxMVMyU0FkUkdTNmh5SXNZS1JXNUo3aE5aR0tUUmpMTTJUQ2Nn?=
 =?utf-8?B?YmhzWGRKUjEyTVZuNm1kY0hEOFhqdFU5NndRTFhBc0pGdWFRWDFCN0VKT3Rs?=
 =?utf-8?Q?GsAcWysLRvK7P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49186861-6fd3-4660-6441-08d919f5cbb9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 12:09:32.7950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tA7kx9PKXGgOAzViu7zttbZp1UoMTeW4s2eauDGoAcsozjq+DkH4IOb54Zb9guXG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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

Am 18.05.21 um 14:04 schrieb Thomas Hellström:
>
> On 5/18/21 1:55 PM, Christian König wrote:
>>
>>
>> Am 18.05.21 um 10:26 schrieb Thomas Hellström:
>>> The internal ttm_bo_util memcpy uses vmap functionality, and while it
>>> probably might be possible to use it for copying in- and out of
>>> sglist represented io memory, using io_mem_reserve() / io_mem_free()
>>> callbacks, that would cause problems with fault().
>>> Instead, implement a method mapping page-by-page using kmap_local()
>>> semantics. As an additional benefit we then avoid the occasional global
>>> TLB flushes of vmap() and consuming vmap space, elimination of a 
>>> critical
>>> point of failure and with a slight change of semantics we could also 
>>> push
>>> the memcpy out async for testing and async driver develpment purposes.
>>> Pushing out async can be done since there is no memory allocation 
>>> going on
>>> that could violate the dma_fence lockdep rules.
>>>
>>> For copies from iomem, use the WC prefetching memcpy variant for
>>> additional speed.
>>>
>>> Note that drivers that don't want to use struct io_mapping but 
>>> relies on
>>> memremap functionality, and that don't want to use scatterlists for
>>> VRAM may well define specialized (hopefully reusable) iterators for 
>>> their
>>> particular environment.
>>
>> In general yes please since I have that as TODO for TTM for a very 
>> long time.
>>
>> But I would prefer to fix the implementation in TTM instead and give 
>> it proper cursor handling.
>>
>> Amdgpu is also using page based iomem and we are having similar 
>> workarounds in place there as well.
>>
>> I think it makes sense to unify this inside TTM and remove the old 
>> memcpy util function when done.
>>
>> Regards,
>> Christian.
>
> Christian,
>
> I was thinking when we replace the bo.mem with a pointer (and perhaps 
> have a driver callback to allocate the bo->mem,
> we could perhaps embed a struct ttm_kmap_iter and use it for all 
> mapping in one way or another). That would mean perhaps land this is 
> i915 now and sort out the unification once the struct ttm_resource, 
> struct ttm_buffer_object separation has landed?

That stuff is ready, reviewed and I'm just waiting for some amdgpu 
changes to land in drm-misc-next to push it.

But yes in general an iterator for the resource object sounds like the 
right plan to me as well.

Christian.

>
> /Thomas
>
>

