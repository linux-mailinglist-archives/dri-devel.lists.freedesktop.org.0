Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7634132D5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D77C6E95F;
	Tue, 21 Sep 2021 11:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B996E95D;
 Tue, 21 Sep 2021 11:48:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lfb0HFL0CGh4Dt8XYc9GrKx9nxi2XjodKzFDaVAnfVuc10cjsD8oJRyqApOPwkWiLA7okxIcsKbAIywkW3SDUCfqL7jWCZoMIIj1I2FT2V96Uv2E3SO3ESrcnIqb+XuiFSlT7FyYuKv3OGkBBDCVuww2kzAJekB6G2/tt+n1EACw5rStVL+BQL0KxpCr+k9Gx08BhKlRafzpzX1viHJWtiE/zYsxTXiscfl5f806Zw1zWQBCOuxwkDndQqJiTzqgqHkhQW82ioK7HKE8tlSBhjFogHoem9mhe+we91+yn4SKer4kSpoZwYTVHejIaWCm3B/tooSxrOCwZNQHmn6REg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1H53PA4gIdptGHPIa1znP8y9jzfbz2RrC6TZYP5MibA=;
 b=NwmMgeOFHJUEddXNq400s6f5ztdKEDCNCmGTnATEpGXbfqvj6FLJDd4ZV+E70ho25N0soy+WQ051Z1q+7g4s/hWOMPRPT1KOrt7b2S5p69Cx75GAKbWT6t64IvhT5Jq4jDLwcLKbrFipyrJyoIo8OAIUODjxPSzvn6+3s9MYvtVL+B42RqKipGf+AUw/F8KxBXZbkTKjwenVDJkW2ZlJWwbFycR1J0ZGjuI72brV8nvLHH/2MOas29BG9Hi4zfxrdgiOmap39RROLV7wfA2gB9i6iL0W7M3mfznfkxHPtfOYOS9RfY4ZCHQx3sVlqf36GIb36mn5H2roeB1pwgHCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H53PA4gIdptGHPIa1znP8y9jzfbz2RrC6TZYP5MibA=;
 b=yeaZMwlWcLFjZ+9qZoEwYgQvp2S/bYLs8C7s84TpzYGKyyFQTGVMIPN1ShkvfXHFNv7GwQ9DKTWmWW3r4fYnBRwnV5aeGdKHgMV0Lu0LQEcyJpG/j64KWvZd3kXaT9qNnyry7bFvSTKY2JxLzduShEkVAxO4cjTISBOAHcnDPWg=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 11:48:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:48:41 +0000
Subject: Re: [PATCH v4 10/14] drm/i915/ttm: hide shmem objects from TTM LRU
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <20210921110121.3783395-10-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <92d33ac7-f1b9-26e4-d39f-c351c4220dfa@amd.com>
Date: Tue, 21 Sep 2021 13:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921110121.3783395-10-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:8582:d9f8:1318:9d2b]
 (2a02:908:1252:fb60:8582:d9f8:1318:9d2b) by
 FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Tue, 21 Sep 2021 11:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e79d9d10-a6c0-46c1-5b87-08d97cf5c1d5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-Microsoft-Antispam-PRVS: <MN2PR12MB444016C328B631D349AF922C83A19@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GoXJMckFedUpv5D908bF7pHjRiM5OrrZBiKLQt5ZS/c09v5JumtbDXMrfqyv+Qi94lsnGEdPsDokTuYBO+2TujDmdZfyyq5weVTDs0myFoThAprIvu6OSxn+jtjifW4FQ8v2l+a4Bi+d3ghQzkrLVHN4GrhZ0hneYQhnLcc9KDYQH2gTU8Ik7Co5KYjdREHcqZftLYMaXnlXawmZHyN4KD2v+iWwZqP8ot+Jx1mW4ZaKOWikEcahba19WY5n/Q0JBKfoSlB6xuPR1K0TKeqagoPXVa2VH/RDXclPbB6ZV3XZTz1Bgi5GEMHt1J3zz8DjQI6D7pJ3tkZP7kQ3mJu3ystS760dLxa8PiupOuyfY5RxPlBa/7nsszMQvCgVC/h3Q3WSOgMRA2sOg6zTJITN1Uw44s9rT69l0dN05CKStEKKwMD0U0VYZ2eHhMXlpAca8WJ6O8WB0RMTSSdYily+lrIS7BoUUjFVjyv9tkdXKUfY5qcXwKkhMP0g4pNpoYSZe2tW1v1+cM9RydEe6xGddMDUQQ1siQPIJIF1RDqgAng3WqkArGScJOXWhVCOiUkeSUvdNEaADm3EHfU5k4z7VwK4CLK2aboK+eVetzLDFVdXzc63o5D4jEmW+JpUdSlL/TC4mmr5nt7Uklg0u4fXOABZS659kyUdr8GH2k1IRed8nVYRi/sle70SYQ1b2VqU057n011WoXfwtJR0Wq7LGqDxIa05B/+7erZI40AD6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(66946007)(8936002)(66556008)(66476007)(2616005)(2906002)(83380400001)(316002)(4326008)(36756003)(38100700002)(186003)(6666004)(508600001)(31686004)(86362001)(8676002)(5660300002)(6486002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2RoT1JCaDN3V0JrQ2hCYVJ5bzh4TVBsWEh6cHlDQllmZmp2UHVkOTZqMG9C?=
 =?utf-8?B?cG5kdTFmazZDbm5TWDdPVWhqbDRCUmc0U1E5Z0hBdWVpaTVnSmtDT2sreVhF?=
 =?utf-8?B?NzR4WmVHUnQva0VIMGRXV3NYcU5vYzc2Mk5WSi81RndMajFVbEFNYzI5SFJI?=
 =?utf-8?B?YzJ1ek94a0tQN1l5Q2d3ZTZxTExjVTJSZWdpRDRJRVNFWFFIZUVGVUZoNUdR?=
 =?utf-8?B?UGRqSUwrTWx6NS9iWmNTNktMcGxRVkpzYWhjRVJtR0NxMjhtZUVXSWpYTUcx?=
 =?utf-8?B?eXBOZFF5Y0ZidFpmSlVyTE01SXJQc3Yvc2pxd1A4ZVVtclRvYnhLdGhmbEIz?=
 =?utf-8?B?UW9QQ1F4YldlZFd4TERoTFVwdjEzWEJDKzZyT2JiOVNGem1yQ2xpM2lHTE1R?=
 =?utf-8?B?TDRrWlFCUUdiejcyWittSGtzSCt6dnNFalpNUTFOazZ4am43eW5yNU9oNjhs?=
 =?utf-8?B?aEZmdlVqTzlWOVRrM3VzVEhJZHBqM1R3cC9EeTNHRWVLcnVJb28xdHlEcXJq?=
 =?utf-8?B?Y0E5S05JU0JIdW1LaGwzQThBMXBUL05sdHNDTTR5WjBjYXc1WnlqVGxuQUp4?=
 =?utf-8?B?QTlDT3d4eGdHcXlYLzh5SS92cXJUUmdFMzBqdkZYdW9RQkxtcU1Gcm5teVNQ?=
 =?utf-8?B?MzcrWjhpeWo4eWtOSG40cFN4cFhqbWlxYy9xN1RINW02U1k4ajJIMTRFaFh4?=
 =?utf-8?B?bEp2WHY2azZNclcvZ05pM0crYVhuUzlCeit3TTkwQUVmQndkcmtqMXFIdEpH?=
 =?utf-8?B?aVhJR3dDdjZzbkFlc2JWMm9UK2pEYjZNMjV5M0pDY0hqUTkzYVVJczRETjVH?=
 =?utf-8?B?TGg0VndGRlhtcVdYYmd0R2IwWE1hazE4Wm1RdDVBM3NPcy9rdm5VMHRiWW43?=
 =?utf-8?B?dWcrU3ptVzMrYmhCWGordlhsT2ZNVHUxTk1Gd21VZ3g0a0RGSXBnMWJYZy9Y?=
 =?utf-8?B?M1pvc2Q4dmNXL3dzUGFaTEpRd2hoamZjQzgzRXFNTmh6RGcxaEJXaHJUemFK?=
 =?utf-8?B?Zm1LTUl3bzczS1RhZTZCOXlkdGVZZmc0VTdGRnNZeGY5MTFFNWhrQW1PbStn?=
 =?utf-8?B?bEc2djlRSUFYRG9hVjRNdGpBT0loTHYvbkt2Tmd2eVp1cXhLbm1Db3hvZXdk?=
 =?utf-8?B?NDFVemIzZDIwV0x6dFN3NkdFWTl5c3RkRVJ5QzJOd1hkQmcwS1JBMGMzZlNH?=
 =?utf-8?B?bGVGcGFLdVRkUXhuamJPd2xaUERGTjdqN1U3ZVRSeW51WFFCU0tONGhCSGh1?=
 =?utf-8?B?ZXUySVk0dkVaMkQ3RWh5Z0J5K0FCSVNHNmpNeWlpcWROSXhGUHhjY0xRT1M2?=
 =?utf-8?B?T2tJeExYUDg2alNYNzVqNVVIRmJYTFZjL0ZXMDM0a0ZwUFFoWGY4U0p5MnpF?=
 =?utf-8?B?ZjIrWnJ0YlJ0akhOUXZLQ1lDRDF2dWZiY1ZLbUsxQm5PK0R3Y3dubWczczBj?=
 =?utf-8?B?RVV5LzRKSzVLZmlwYlpIQ1hFMjNuODRhOHhaSVptVUNRTHdHNEx3V1VkYXgx?=
 =?utf-8?B?YlU5NFZJWG5uaFVQSFFqTWYya0xtWjlBNCthK0Vub1kvdFA4S1lrTnRyaUNF?=
 =?utf-8?B?R1Z6ck9lUkpWRGtpVjFlMlByYVB1U1VoNUpLU1hJclZ4OTQxNGExUXk5NDUz?=
 =?utf-8?B?Rm55STM0cVpjV09UMFcyNk1IODdBWmt4YXZkTmg1R3hMZFBZMVRwbEQ5ODRN?=
 =?utf-8?B?SDJaaXl1dTBUcmlqQ0xUNDdxb0kxK1UrQnRKUTNSc1VIMlJHeTJFdDZ5Vzcr?=
 =?utf-8?B?TDJWVTB2cVRlRG4vR3BVbGhwUXNvZ0c0WEF2TCs3RUtVVnRwRjJ1TUlaUzkx?=
 =?utf-8?B?L2c0SzdTUmk4eHlRVTFkdytGYmd4Mm9PVzhRUnp0L0hYNHVEMEl2QURiamdi?=
 =?utf-8?Q?sxqfA7vQgFKxD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79d9d10-a6c0-46c1-5b87-08d97cf5c1d5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:48:41.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikV7j5szssL9AeYKdKukYpv2SDkU6nTy8JLzcmwNUMUXLquMlxT+DVJTgZN7I/Q/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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

Am 21.09.21 um 13:01 schrieb Matthew Auld:
> This is probably a NAK. But ideally we need to somehow prevent TTM from
> seeing shmem objects when doing its LRU swap walk. Since these are
> EXTERNAL they are ignored anyway, but keeping them in the LRU seems
> pretty wasteful.  Trying to use bo_pin() for this is all kinds of nasty
> since we need to be able to do the bo_unpin() from the unpopulate hook,
> but since that can be called from the BO destroy path we will likely go
> down in flames.
>
> An alternative is to maybe just add EXTERNAL objects to some
> bdev->external LRU in TTM, or just don't add them at all?

Yeah, that goes into the same direction as why I want to push the LRU 
into the resource for some time.

The problem is that the LRU is needed for multiple things. E.g. 
swapping, GART management, resource constrains, IOMMU teardown etc..

So for now I think that everything should be on the LRU even if it isn't 
valid to be there for some use case.

Regards,
Christian.

>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 174aebe11264..b438ddb52764 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -800,6 +800,22 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
>   	return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
>   }
>   
> +static void i915_ttm_del_from_lru_notify(struct ttm_buffer_object *bo)
> +{
> +	struct i915_ttm_tt *i915_tt =
> +		container_of(bo->ttm, typeof(*i915_tt), ttm);
> +
> +	/* Idealy we need to prevent TTM from seeing shmem objects when doing
> +	 * its LRU swap walk. Since these are EXTERNAL they are ignored anyway,
> +	 * but keeping them in the LRU is pretty waseful. Trying to use bo_pin()
> +	 * for this is very nasty since we need to be able to do the bo_unpin()
> +	 * from the unpopulate hook, but since that can be called from the BO
> +	 * destroy path we will go down in flames.
> +	 */
> +	if (bo->ttm && ttm_tt_is_populated(bo->ttm) && i915_tt->is_shmem)
> +		list_del_init(&bo->lru);
> +}
> +
>   static struct ttm_device_funcs i915_ttm_bo_driver = {
>   	.ttm_tt_create = i915_ttm_tt_create,
>   	.ttm_tt_populate = i915_ttm_tt_populate,
> @@ -810,6 +826,7 @@ static struct ttm_device_funcs i915_ttm_bo_driver = {
>   	.move = i915_ttm_move,
>   	.swap_notify = i915_ttm_swap_notify,
>   	.delete_mem_notify = i915_ttm_delete_mem_notify,
> +	.del_from_lru_notify = i915_ttm_del_from_lru_notify,
>   	.io_mem_reserve = i915_ttm_io_mem_reserve,
>   	.io_mem_pfn = i915_ttm_io_mem_pfn,
>   };

