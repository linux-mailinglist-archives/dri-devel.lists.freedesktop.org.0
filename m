Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F033C5B3C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 13:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930C889B4D;
	Mon, 12 Jul 2021 11:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A28989A92;
 Mon, 12 Jul 2021 11:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9o2ZfiDLsa7l6mIk28Wq9z11YA5EEoAO9mBvq+I7RuBQZRGDfdWstbxBM8uix2iVDdE0HU0MoQOgE5/5aLDNPJRW5PFvvlWNn1MQOJ8s//7KJyWgngGMSANPoEYg2GBZSHRRtakHR2CNrb/pJtdI/WVoyipaxrCAUkfSJ8MJORmJrq/al/315q3eZy3Vp/90gpHr8hwzuevo2iON5/6l04wRGCcwLk4Z/v0kblF5b+rCa2M8Coknmd273QQo/PjMwunZrZb9Lqm4cCmlCBmHFLTlXhKvdDiAwwirVe5wIo0m/DU4WNHL6yeb4Sa1VQnf1gN/WOb2uB6xmBjYAeWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E1edyzgIWY017S78yKWDMsRTGP0uSgfcgYwDjmYTxM=;
 b=E04bKjp/4rGpnFqA1k4sU8j14Q2ztu7euC/dsfbdkpp1Ol7wFdopnXLOSuPRPiSeEHzTPL8sQMguWRFraOQ+EopVSVmfgz0XQcv6/TRW/XiCLTGFMHSMpv0HgAAJNhFvkryA5kma6NueOnof6zCRnOznpc/AkM20xn5UgUOuv6zHrj3TdlrkSqM0sahk13kYO9jrQIF9MwuJRloWD1/66Foq09T0kSk4PioscWZOaGp+uSTVMzQJxCO/Ocwo9ekO1PRVGUVhfw+uQ+4ZWGoQSD1ZEswyp3X5MEiCKDv9rXTAyhjOH5X0xN02tybNfP0u2Qr4kPdv/kpiJIfKWUZt3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E1edyzgIWY017S78yKWDMsRTGP0uSgfcgYwDjmYTxM=;
 b=3zrnDXgAnFj/u6kLrX42yi///W972LvZoSkjInY0Gk8lGxYWliwdUiTtN477uuWffBGV0p+71r7oyYA0/+F/xIqi3SmYbx2K742POUKsMceZov99ZvmNNkn7DzfdG1eu7BZY/YnABCQ1M7bI78ZUV4M/sLpKy5fx4IaVZMM+ShM=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 11:29:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 11:29:18 +0000
Subject: Re: [PATCH 2/2] drm/ttm, drm/i915: Update ttm_move_memcpy for async
 use
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210624193045.5087-1-thomas.hellstrom@linux.intel.com>
 <20210624193045.5087-3-thomas.hellstrom@linux.intel.com>
 <ce389058-2ec8-3aa8-b332-ff34705e8b2c@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <71bd5bb4-1ed6-7869-9684-05099643a259@amd.com>
Date: Mon, 12 Jul 2021 13:29:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ce389058-2ec8-3aa8-b332-ff34705e8b2c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0147.eurprd07.prod.outlook.com
 (2603:10a6:207:8::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e521:a414:2ae6:6045]
 (2a02:908:1252:fb60:e521:a414:2ae6:6045) by
 AM3PR07CA0147.eurprd07.prod.outlook.com (2603:10a6:207:8::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Mon, 12 Jul 2021 11:29:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add1f544-f62c-403a-22dd-08d9452847d7
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49322C21AF183698C178F48D83159@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TrKkIXxVfKom21zwuWavebOdMntF73u37KdKpG2FZbokhq4HucJr+sRXLugWNTXydrdjiRY+2FzDvFSabvvM5UKFflkV7EIDC5RdTPYJrxX2LJW0PHGEsxrr4vtvRhot5jmpsDcriCzLYGWPJE9NE62gUpBB2D+Zfz5ZxSCs0FEGBEL+js9yULBqlVYFPPDhIDz+rjMebcvwCWUU6rEUNjeWbfGJIxib19OT72lQB5+yQqCOBwPuX/24cpT6fJPGXIdZCgzjNMMxAb35Ybu4a8Hp1Izf0PWWK661Y6Hbwe9Dt+a5b5uKZWLPSeY6vX6EfJakIM4G6VYyhCm2ufELU8JbweI4H+M4rYfCc/hy1XBC4j3W0lybWk+5PLC/SAqnF6p/dfFw6+E/S37mLqL37peH1ulO07+M8ZdDbBrS90/PFYs3aJBg0XdS+HjnoBOCWgwYozCEvFHuuz+LZB2dVYquPwLbfdJlJL4Y15s4upbbcd3BxWIgZp0dz/Zqy7KJsL0QBfu0r8X3PFkEbKhruMbNN+KPx5+ynU2+Nq5JqC42lQqYKW+c2jLySeaJ70D/X/A4Ym7fH4dDQfnbT43E8mEWlVZFFL4NUhgf7e+pE6YUWV5qLcImqQxYLGfb390K2FYuolieyojtlzV2zAE8VyrhR+JHxP+RiGl39PArMDJkAQEoc5VzkiIAuE2d+LsDbyM7wyG/GuazmSSAgZ21RCoGs0hMpvfEFiql9wW7afGaXxhS+evgFQwYeHq/P2f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(66556008)(66476007)(66946007)(38100700002)(5660300002)(478600001)(8676002)(31686004)(316002)(186003)(36756003)(83380400001)(53546011)(6486002)(2616005)(6666004)(86362001)(15650500001)(4326008)(66574015)(31696002)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHdvcURKUE1oWGVFdUVSY3o1dm5kaStjV0xrUVpreFFQelJFMEtGb0xzY0ZH?=
 =?utf-8?B?T2FwYURsenJmQnh5K3k1VThkVjlvajRBZ2F2cFJyWHZnVElYazdSZmg2cEkv?=
 =?utf-8?B?b3gwa1NPUk1hUGdYMjFHYXpXcWlXVEp1TndzaVVpeTcxUWF2R1hFM0RwdWpI?=
 =?utf-8?B?SVd5K1psQkxQM3Z0bE45alBnUFA5N3haRDE4QWF1eHYzbllOQlluRDhkRjVL?=
 =?utf-8?B?dm1uTlo1aTlxYUVqVDNSYS9nNjRUVSs2dDZPSDJ3RTY5cVN0OEVoZzVWRThH?=
 =?utf-8?B?V2RoTE4yN3pXdEszYnlaUWxEd0M1MDloOG5XUFFJNUV5dE9pckpEdVVIb1Z4?=
 =?utf-8?B?d0lRWXNDRHZEZERXYWVxOWFvQnd1UkVqeFRuYXJMV3hHYm1aZFprb1Uzalo1?=
 =?utf-8?B?ZTQ0cmszZ2xMRnc2c2ZWSnFwZWxHNGVKVCtrYnVWSElqTEpQRDlLMFJoc1pO?=
 =?utf-8?B?TFFIeUc5RmxQaFFkS2JhSzVtajd4cjkyUk5kY3kzUURxZUhSQlRFMXk1UWh4?=
 =?utf-8?B?d0d5enFPSHVVeG5FdnVsaWxKOVg5RGtQdXdnSHRKdldGUGExRkcxTkhhQzZs?=
 =?utf-8?B?ZnArWDlNUXowKy9ERW9sNkdGKy8zREFsK01GMUZLekhHaVVOaFhlbFFGeTBB?=
 =?utf-8?B?VGFNdlhNcmhRNFVOVitHdGZWYklHcDc4SmMrNTVNcEkxWndOZXpyaWpzTmpU?=
 =?utf-8?B?cDNPdDZ5Q0ZESGJsdzZXdUorTGFxRm44alBRd01rVE45SGEzN2szM0w3UHcr?=
 =?utf-8?B?OGwreVZsWm13SUd5RWdrMkVCVCtsYnJJMFV6NVU5cnhMcjR1Y2VsMjJ5TXl4?=
 =?utf-8?B?Z1p3N3dvVlF0NmdZUU9qdHlnUkVzbXJVSzFDN3BiUW5SaUs4OHQ1Y0ZSTGFa?=
 =?utf-8?B?RzY2U0JNeEh4dmoyR3czL0hNUWsyU1MzTFlQb2l0bXVnUUx6ZjVIT0JMVG5K?=
 =?utf-8?B?a3VnU2tlMVM5cUF3d2czNHNnRjhYZFI4UDB3Y1NPb1h4OHpPcy9lSjdRWUhv?=
 =?utf-8?B?RThrUVNJWEprNmpUaFd0WjJzbzlDR1JUWmtHbUhIRFhDOXdHbUJPYVVlOE9x?=
 =?utf-8?B?Z0dwV1lLc3VhNDRQNTNWZWEwUThhK0loZzRqalozTlh5VXg5MGVIZUpWM2E5?=
 =?utf-8?B?NnFkV0dUbVd0YytCZDRpNURpZW9uRkJMTkZOYjl3NEVWZzhtQ1V0dGt6NnBh?=
 =?utf-8?B?Z00vK21tYmFxbk9LdHBReDBCb2JULytROUNBQTJTcnRLazNzd3lFaldmblRL?=
 =?utf-8?B?SEk2WU1JbW1QRUY4dWg1QmVTQVVTbXVxd2IvOVFMQUs2OWo3SjJFVnMySFpC?=
 =?utf-8?B?TnRrYkxvSUI5bncrUnpQdUkvVXd5NlZCZ25tWVVaUkY2NHIxZnVKaGgyUmp2?=
 =?utf-8?B?eXBaSFVuWGpEVGsyMHlIQ1Vvb1orczlTd3lDY2VsakhoYjc3ZSt5bUk3OEpD?=
 =?utf-8?B?U2xzTTF6cU85ei9ROFRURFBSOUw3MXFnZ0p1cVRQcUV0TXRCNDlsS2xrTDdl?=
 =?utf-8?B?ZDF5ejk4OTVmMFJubDNEK3VoZ3BZVXVaREkrTjczcWdFUk9zVVUzL3NEWEhT?=
 =?utf-8?B?d0Y1MGRuUURvVWNsZHorNExmZXpSWmU1SXdieWcwTENTU2ZzZWplU2pLSXZH?=
 =?utf-8?B?cEhCeTB4cTdsS0VQNmIxa2o4QVBKekNnQ0dENENBeEZpN1pndlYwZ0pVU3kw?=
 =?utf-8?B?T0cvMXhUWERCc0w5aUV4RGdkWmk2S3gvUjVVQ0tUWHJxLzN4ZWViUXJIZjFo?=
 =?utf-8?B?dEVCSDBLVEpqNDY3ZGEvQi9UR1N5dTVUTVQ1ODc5RmF4SkpqeWsrUHJ4ZmZN?=
 =?utf-8?B?d1g1M2ZNQWYyTEF6RVVPbkdLUkVNTkt6QWxJK1MzZWo1UDh2YnRHZFNjcTFF?=
 =?utf-8?Q?UnRObDjLqXc/e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add1f544-f62c-403a-22dd-08d9452847d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 11:29:18.4389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcVLMSUppltHkdQx42kY8MhpVUH06ebaU002JFRPjB7ux0qjpVHYvb51E6rseKxB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 28.06.21 um 13:21 schrieb Thomas Hellström:
>
> On 6/24/21 9:30 PM, Thomas Hellström wrote:
>> The buffer object argument to ttm_move_memcpy was only used to
>> determine whether the destination memory should be cleared only
>> or whether we should copy data. Replace it with a "clear" bool, and
>> update the callers.
>>
>> The intention here is to be able to use ttm_move_memcpy() async under
>> a dma-fence as a fallback if an accelerated blit fails in a security-
>> critical path where data might leak if the blit is not properly
>> performed. For that purpose the bo is an unsuitable argument since
>> its relevant members might already have changed at call time.
>>
>> Finally, update the ttm_move_memcpy kerneldoc that seems to have
>> ended up with a stale version.
>
> Hmm,
>
> Not sure where the Cc: Christian König ended up, but in any case 
> Christian if you find this patch ok, Ack to merge through 
> drm_intel_gt_next?

Please send out the patch once more.

Only nit picks, but I would re-order the parameters for example.

Regards,
Christian.

>
> /Thomas
>
>
>
>
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  2 +-
>>   drivers/gpu/drm/ttm/ttm_bo_util.c       | 20 ++++++++++----------
>>   include/drm/ttm/ttm_bo_driver.h         |  2 +-
>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 4e529adcdfc7..f19847abe856 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -517,7 +517,7 @@ static void __i915_ttm_move(struct 
>> ttm_buffer_object *bo, bool clear,
>>                            obj->ttm.cached_io_st,
>>                            src_reg->region.start);
>>   -        ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
>> +        ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
>>       }
>>   }
>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 2f57f824e6db..e3747f069674 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -75,22 +75,21 @@ void ttm_mem_io_free(struct ttm_device *bdev,
>>     /**
>>    * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
>> - * @bo: The struct ttm_buffer_object.
>> - * @new_mem: The struct ttm_resource we're moving to (copy 
>> destination).
>> - * @new_iter: A struct ttm_kmap_iter representing the destination 
>> resource.
>> + * @clear: Whether to clear rather than copy.
>> + * @num_pages: Number of pages of the operation.
>> + * @dst_iter: A struct ttm_kmap_iter representing the destination 
>> resource.
>>    * @src_iter: A struct ttm_kmap_iter representing the source resource.
>>    *
>>    * This function is intended to be able to move out async under a
>>    * dma-fence if desired.
>>    */
>> -void ttm_move_memcpy(struct ttm_buffer_object *bo,
>> +void ttm_move_memcpy(bool clear,
>>                u32 num_pages,
>>                struct ttm_kmap_iter *dst_iter,
>>                struct ttm_kmap_iter *src_iter)
>>   {
>>       const struct ttm_kmap_iter_ops *dst_ops = dst_iter->ops;
>>       const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
>> -    struct ttm_tt *ttm = bo->ttm;
>>       struct dma_buf_map src_map, dst_map;
>>       pgoff_t i;
>>   @@ -99,10 +98,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>>           return;
>>         /* Don't move nonexistent data. Clear destination instead. */
>> -    if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
>> -        if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
>> -            return;
>> -
>> +    if (clear) {
>>           for (i = 0; i < num_pages; ++i) {
>>               dst_ops->map_local(dst_iter, &dst_map, i);
>>               if (dst_map.is_iomem)
>> @@ -146,6 +142,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>>           struct ttm_kmap_iter_linear_io io;
>>       } _dst_iter, _src_iter;
>>       struct ttm_kmap_iter *dst_iter, *src_iter;
>> +    bool clear;
>>       int ret = 0;
>>         if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
>> @@ -169,7 +166,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object 
>> *bo,
>>           goto out_src_iter;
>>       }
>>   -    ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
>> +    clear = src_iter->ops->maps_tt && (!ttm || 
>> !ttm_tt_is_populated(ttm));
>> +    if (!(clear && ttm && !(ttm->page_flags & 
>> TTM_PAGE_FLAG_ZERO_ALLOC)))
>> +        ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
>> +
>>       src_copy = *src_mem;
>>       ttm_bo_move_sync_cleanup(bo, dst_mem);
>>   diff --git a/include/drm/ttm/ttm_bo_driver.h 
>> b/include/drm/ttm/ttm_bo_driver.h
>> index 68d6069572aa..5f087575194b 100644
>> --- a/include/drm/ttm/ttm_bo_driver.h
>> +++ b/include/drm/ttm/ttm_bo_driver.h
>> @@ -322,7 +322,7 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, 
>> struct ttm_resource *mem);
>>    */
>>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>>   -void ttm_move_memcpy(struct ttm_buffer_object *bo,
>> +void ttm_move_memcpy(bool clear,
>>                u32 num_pages,
>>                struct ttm_kmap_iter *dst_iter,
>>                struct ttm_kmap_iter *src_iter);

