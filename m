Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156B56A399
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 15:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A2214A1F9;
	Thu,  7 Jul 2022 13:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7168D14A3C5;
 Thu,  7 Jul 2022 13:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWefag5Z7RwOHcXFJLSUYlTz8zdOn8aTetv4vuYosBSWY5tfFoWA58RszQyMhbTfQb0NejlBvdfspnGitA0JiRYcd0dYOdYQwE/uXfK218jCz99C5Q41Ls7roaXDIwdlxSfdS7Vv3F8qhB19NKATc3r45Lmybj9x4p8lzQxBjmUZ99e0/oEog4brlkyOeRCzZaiqFPxsTsYxeTfGRJ9SxUKl+OJOT/be6RjRauDrm3gDxohnyAHkpoqdcuGbRiPSXlbqt1pZwJ/PhL+DDU4DJNV38ArlXYt3G3yORhvJ/IwLJ7WBZ15zB9D0J41MkMBwJ408WnxY3wiUEAVIweVFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNg3XPpZ7z4A/1wjoJkpZsDgZkKOpBTYxj82RWdIeck=;
 b=VwpDKKzGc6tq9To6D3hoLp1eBpK9yPECu039pPKX+B5cGeoxzyxhyzcWber2kp0IZiaKtCAXjwvjrSSbNtrrbGS1lln+uWQqe4Hvs00swLHvlHEoJQz9JMAxe350rBc+cgaaUWrengVOXMmQv0/D8C7i9OMSweES64ZJNG4JvbqeGRZyvCyTf7h9KNB6ynTHHWguvmuzkKcktSjB6No0VHcEN2UzL6L1rKEZZJpHfIm9qlzt4M+qs1dk1gnZ8KiA8UFvra2G7bY5F4ZipgTppNeK3WyO0GMAjjRzp2/JsRSdnZI6XwLHQQTvIjPLKDL3WqZvKVRJlaH9WdvAOyDLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNg3XPpZ7z4A/1wjoJkpZsDgZkKOpBTYxj82RWdIeck=;
 b=pe2UIH3QiVF/aSvkpiB73hJMRQQv9GNSlAFqkezsGfSuZlJWRPLjRWAQUpSHk2t0wrtnMbyw4lWkksLKXsQ1pLJqKFpTffXTkYQHz4oR9WYKmTDTGq7xly+gZJAYr1nJ2JzWWVS49kC2ByTcWU+aD5tgl+JBHZ5gw5LbLqGGrDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1273.namprd12.prod.outlook.com (2603:10b6:3:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 13:27:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 13:27:50 +0000
Message-ID: <13a5c5ba-8860-512e-5e92-3f30beca2dc3@amd.com>
Date: Thu, 7 Jul 2022 15:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 03/10] drm/i915/vm_bind: Support private and shared BOs
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-4-niranjana.vishwanathapura@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220701225055.8204-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0044.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d2db53-c6ea-4fed-b381-08da601c7cd7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1273:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ir+8sA6hvqc5RJDgoBovl+7hX/pN2Pgs4G9Wt+i5H6pfuxErKiZ5DImTLyyI39ddUJshuxKf96lYGAI348o4HHjelZgPAaySRA1Wtymjv5RxY5Kqa5UTStnDGVt9jKGFes5Xb+tFSBoIt/8En3ccJviacZYz/tLzLNCJnGsd5cqirwO26xyXC1mP0cS3AAFa01i4nTlPC7zcew2yjFmzKVaHlqBQKMKOUTVp3Op6RUqT12/GbaJFcK1XksrO5t1YQIOZiEiMliTGpX0I4HrjepPM6dm3l1CihQKZn2PKF7BN6QHDE4Tl2PXfoGSNnZHxD9FuCVNZ9bS/a7584kCs74qdv68vZFjpmWfSjCYCVfp5T5kvnfE7VbbhZNzo9EEd05+azmRoaw354FxO6Z9u/6wTvgDwZ03VZuM3ZbtwwMo7RLuzT+VqzOEYh8LPfwa0LfEPtQxKFre7sPT9O7xB8bPaVbhjQcyAa0COtjn3wpeGL0cK+AD0YVCjYDyQEvXHTL8KsX8GDIf5q01m+fudcrQ6svoBYrPjhw/gOLvHRrP4DIwENokx+GRPef1WGfsINP5z0OdUkg/P6mpU5RrrXJf9+v+7uDMsyokVSeQ0E0S551ZbmdYWibD3dl7SufiGG29zcRXfKfuEH5tws+QHSKBAQuLjj7UoOfRKmaz+eLxi0JUkzEoaGHulKjHjUNiO3Y2dtJ/nnNxL2UrFAF6FZDjJqvwNCGSrV8IrPubHcmpf82u2bw0qYAGgne0Oul6Tz8/NQCaoplH/EozaSUjksZfHo7EGJsJF2SqAN4zNX7YhBfp16YM2UmY2s7A6WIFaVk5bp1buDOnaba6rLNOWIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(5660300002)(8936002)(30864003)(7416002)(2906002)(83380400001)(41300700001)(478600001)(31696002)(36756003)(86362001)(6486002)(66946007)(316002)(4326008)(8676002)(66476007)(38100700002)(66556008)(186003)(2616005)(6666004)(6512007)(6506007)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmROd0ZPNUU2SUVPMmlNcGxmMjdUNzIrbkEwQmpxcW1kUVBCemJBNW5Cc2VD?=
 =?utf-8?B?TzcvdldnMUt0d3EvWjlhTXVRYnpTVm45ZklYMVo1UXliYmpmMlp1YTEzRGN6?=
 =?utf-8?B?WGc3V0V4WXlNbEl5VjJhQ3owcmhWeUhMeHZ4R2xVdnd1K0VNSElPSjlPZUpu?=
 =?utf-8?B?ZThrMENxWC9WeitEWEw3R1JDazRrVzZFaG9TeDV4d0pzMnBkZ0czKzhjTFh5?=
 =?utf-8?B?YzVLUG1wcVZKR243R05QRlMzbWtOd2xYVTlLcEFiUDZYL2NBaVprNnZEdERn?=
 =?utf-8?B?OVBUbnNKZUx4Rko4dTEybEtLUUJMR2Q2ZHp1NUdvN2JSOEk3STMvSUthWjhK?=
 =?utf-8?B?dDJsa2ozMU9BT0o5eVNvM3dDV1J3Yk1PSmI1K2pBc2RBaldmU01nRDg5M3Ra?=
 =?utf-8?B?emJjRG1tVkdwMzlaTzdXMDJ6Z3A1S0hCcFB0TTg2UkdGTXNrdFc5MStsenE3?=
 =?utf-8?B?dllFYjd0c0xjWHk5QmpFQ0Q3QWxYZStEbmg4WHRkc1o0ZmhxcExDQVRheW05?=
 =?utf-8?B?bldvTFIrak8yTEd3R0d1SkVQVWk2K3B1ekJWVERCelljOTMyQksvK0hwT0FR?=
 =?utf-8?B?U0xacU93SjNpRnhUcTFuVWg0dHFOY3dxVzFCZWI2K3NDdE9iajB0L3ZURmVr?=
 =?utf-8?B?RVFHeWw5UjJDYlplKzZ2N254V0piNzRHTVZHaWZ5LzVVMDJIVUYzb0hxM1RN?=
 =?utf-8?B?NVFxRkFMUk5xL3BYQktxd0lkSWUzYThBNW15K2d6K3ZJeDUzOUhSeVBWOTk4?=
 =?utf-8?B?THFZWHNYZUpuOEhNaVpOYlJOaUJabGsvcWRkMmc4cGtjWk9ITnFqdVUzZVFj?=
 =?utf-8?B?VG9GV093NlhXY0Q1enBqODZuWXJ5eFNPOTJaVTQrTWdGUGdkUmg1U0U1OUts?=
 =?utf-8?B?TUMvQVAxZXkvQTNHUjB5R09vRERWZzZtVTluYm9EeGlZUGJBL0dJTTYrRXhl?=
 =?utf-8?B?UldBdVR1dnFlQkZscFRWOWlmTmVVbEJpSlVpK1JISlhzV0RZNm5veEl4TUFE?=
 =?utf-8?B?dks0bGhpL0UzaVFQSGx0Tm5qQi9sOXdGTUdPMmwxZTd0eGRXSHlzMDhuWVdE?=
 =?utf-8?B?TnN0UTZIVWFLa3VhK0N5WnZvTVVnZlA3Z3FETzNPMWtiNmhBUnJia0tqN1dq?=
 =?utf-8?B?QVFZME8zcHp5NGlOTXV3SmhBdWU1a0o2Sko2SmtqeFdwcHZwMEpqOURGZUdH?=
 =?utf-8?B?cGpGSUdlK3NPaGN4b0xteWE0T00wSW5JSUlhUk9JakpDWXZxVWhxUTdSLzM3?=
 =?utf-8?B?bzNGQ0k0RWJQeVROT3JEN29rZlp0L1JrT0ladXlqcWtLUmlwaWQzTTltbkxS?=
 =?utf-8?B?L1V5c2ZWdldYc2tsYVh6d3V3aVFvbmRreERLZEIxQTY3Q3E3dWtpUjBCSW5X?=
 =?utf-8?B?SjZKQ0Y3bHFGaDN2ZldhMEpaN1JhQ21qdFJDRUpXZEN4UkozbjVEMzlpZHEw?=
 =?utf-8?B?am8rNjFoWWlEdS9CQWFERzVZK2NoSUdqSndORUlXYzJaVW9oT3ptQThSQit2?=
 =?utf-8?B?WWw0ZXRKZmRhQWJoRlNGNFJhbTFldTJwSkNod29wTjFxUW4wTVNPOWtIL0xw?=
 =?utf-8?B?dDh0MlFXcjN3aDZoMHV1YW1hVlVyTFhWcGxCcXI3RG81V1RGZEZGUzhZbXE2?=
 =?utf-8?B?ZktsWjRadTJRMUdNNjQ0azg2MTNDS2hob2RFMlFkVk13VVFZVjZuVEdwb3la?=
 =?utf-8?B?MkZ4bW80VXYwM2NRRUN4bDY0T1pUcmw0bGt0dnc1bm1CRWdWZG9qa096MXhn?=
 =?utf-8?B?TTNXSEpwMGRrWGVNdkQ0bCt6YVBEcU42aGYyaDNnRGFXbnNHVE5yWkllK2o1?=
 =?utf-8?B?Rmw0dVg1UlJ4UmFUQzVVSVpwamdMRmpReG10UmVLSW1yVEg5ZnpEV3pxM2I1?=
 =?utf-8?B?S1Z3OUZKbkFqTGVsNWRWRHpLdnJnYThRSnY4Z09rZXJPMU1FdUFza081MFVP?=
 =?utf-8?B?SXVnU1lQR1ZOZGhNYW5WS0N2OEo0c25qRENOanFxSW5mOExXS2RJRGVZeGY5?=
 =?utf-8?B?TG5LMXVWcXQ0TnhxSkpQNlE2K0NtaWRpVHhGMCtRWUtUWFNoUVNvcW9ha0Ji?=
 =?utf-8?B?WG5YOTNCdXoxc052NjNkWmN3ME1zVXBGeUtqSEYzS1VsTnRFZ3NocDgyNW5l?=
 =?utf-8?Q?N+pwvbwFk1MxfE4rMr8EfHKmG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d2db53-c6ea-4fed-b381-08da601c7cd7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 13:27:49.9020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLydqwPSWVHKUoao6JAM4FFuiETKWIyj8zdwsU3INjylbB0083TArsQ/ZrQS3DxU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1273
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.07.22 um 00:50 schrieb Niranjana Vishwanathapura:
> Add uapi allowing user to specify a BO as private to a specified VM
> during the BO creation.
> VM private BOs can only be mapped on the specified VM and can't be
> dma_buf exported. VM private BOs share a single common dma_resv object,
> hence has a performance advantage requiring a single dma_resv object
> update in the execbuf path compared to non-private (shared) BOs.

Sounds like you picked up the per VM BO idea from amdgpu here :)

Of hand looks like a good idea, but shouldn't we add a few comments in 
the common documentation about that?

E.g. something like "Multiple buffer objects sometimes share the same 
dma_resv object....." to the dma_resv documentation.

Probably best as a separate patch after this here has landed.

Regards,
Christian.

>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c    | 41 ++++++++++++++++++-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  6 +++
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 ++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  3 ++
>   drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   | 11 +++++
>   .../drm/i915/gem/i915_gem_vm_bind_object.c    |  9 ++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  4 ++
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +
>   drivers/gpu/drm/i915/i915_vma.c               |  1 +
>   drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
>   include/uapi/drm/i915_drm.h                   | 30 ++++++++++++++
>   11 files changed, 110 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 927a87e5ec59..7e264566b51f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -11,6 +11,7 @@
>   #include "pxp/intel_pxp.h"
>   
>   #include "i915_drv.h"
> +#include "i915_gem_context.h"
>   #include "i915_gem_create.h"
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
> @@ -243,6 +244,7 @@ struct create_ext {
>   	unsigned int n_placements;
>   	unsigned int placement_mask;
>   	unsigned long flags;
> +	u32 vm_id;
>   };
>   
>   static void repr_placements(char *buf, size_t size,
> @@ -392,9 +394,24 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>   	return 0;
>   }
>   
> +static int ext_set_vm_private(struct i915_user_extension __user *base,
> +			      void *data)
> +{
> +	struct drm_i915_gem_create_ext_vm_private ext;
> +	struct create_ext *ext_data = data;
> +
> +	if (copy_from_user(&ext, base, sizeof(ext)))
> +		return -EFAULT;
> +
> +	ext_data->vm_id = ext.vm_id;
> +
> +	return 0;
> +}
> +
>   static const i915_user_extension_fn create_extensions[] = {
>   	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>   	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> +	[I915_GEM_CREATE_EXT_VM_PRIVATE] = ext_set_vm_private,
>   };
>   
>   /**
> @@ -410,6 +427,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_create_ext *args = data;
>   	struct create_ext ext_data = { .i915 = i915 };
> +	struct i915_address_space *vm = NULL;
>   	struct drm_i915_gem_object *obj;
>   	int ret;
>   
> @@ -423,6 +441,12 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	if (ret)
>   		return ret;
>   
> +	if (ext_data.vm_id) {
> +		vm = i915_gem_vm_lookup(file->driver_priv, ext_data.vm_id);
> +		if (unlikely(!vm))
> +			return -ENOENT;
> +	}
> +
>   	if (!ext_data.n_placements) {
>   		ext_data.placements[0] =
>   			intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
> @@ -449,8 +473,21 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   						ext_data.placements,
>   						ext_data.n_placements,
>   						ext_data.flags);
> -	if (IS_ERR(obj))
> -		return PTR_ERR(obj);
> +	if (IS_ERR(obj)) {
> +		ret = PTR_ERR(obj);
> +		goto vm_put;
> +	}
> +
> +	if (vm) {
> +		obj->base.resv = vm->root_obj->base.resv;
> +		obj->priv_root = i915_gem_object_get(vm->root_obj);
> +		i915_vm_put(vm);
> +	}
>   
>   	return i915_gem_publish(obj, file, &args->size, &args->handle);
> +vm_put:
> +	if (vm)
> +		i915_vm_put(vm);
> +
> +	return ret;
>   }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index f5062d0c6333..6433173c3e84 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -218,6 +218,12 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
>   	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
>   	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>   
> +	if (obj->priv_root) {
> +		drm_dbg(obj->base.dev,
> +			"Exporting VM private objects is not allowed\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>   	exp_info.ops = &i915_dmabuf_ops;
>   	exp_info.size = gem_obj->size;
>   	exp_info.flags = flags;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 5cf36a130061..9fe3395ad4d9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -241,6 +241,9 @@ struct drm_i915_gem_object {
>   
>   	const struct drm_i915_gem_object_ops *ops;
>   
> +	/* Shared root is object private to a VM; NULL otherwise */
> +	struct drm_i915_gem_object *priv_root;
> +
>   	struct {
>   		/**
>   		 * @vma.lock: protect the list/tree of vmas
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 7e1f8b83077f..f1912b12db00 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1152,6 +1152,9 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
>   	i915_gem_object_release_memory_region(obj);
>   	mutex_destroy(&obj->ttm.get_io_page.lock);
>   
> +	if (obj->priv_root)
> +		i915_gem_object_put(obj->priv_root);
> +
>   	if (obj->ttm.created) {
>   		/*
>   		 * We freely manage the shrinker LRU outide of the mm.pages life
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> index 642cdb559f17..ee6e4c52e80e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> @@ -26,6 +26,17 @@ static inline void i915_gem_vm_bind_unlock(struct i915_address_space *vm)
>   	mutex_unlock(&vm->vm_bind_lock);
>   }
>   
> +static inline int i915_gem_vm_priv_lock(struct i915_address_space *vm,
> +					struct i915_gem_ww_ctx *ww)
> +{
> +	return i915_gem_object_lock(vm->root_obj, ww);
> +}
> +
> +static inline void i915_gem_vm_priv_unlock(struct i915_address_space *vm)
> +{
> +	i915_gem_object_unlock(vm->root_obj);
> +}
> +
>   struct i915_vma *
>   i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
>   void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> index 43ceb4dcca6c..3201204c8e74 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> @@ -85,6 +85,7 @@ void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>   
>   	if (!list_empty(&vma->vm_bind_link)) {
>   		list_del_init(&vma->vm_bind_link);
> +		list_del_init(&vma->non_priv_vm_bind_link);
>   		i915_vm_bind_it_remove(vma, &vma->vm->va);
>   
>   		/* Release object */
> @@ -185,6 +186,11 @@ int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>   		goto put_obj;
>   	}
>   
> +	if (obj->priv_root && obj->priv_root != vm->root_obj) {
> +		ret = -EINVAL;
> +		goto put_obj;
> +	}
> +
>   	ret = i915_gem_vm_bind_lock_interruptible(vm);
>   	if (ret)
>   		goto put_obj;
> @@ -211,6 +217,9 @@ int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>   
>   	list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>   	i915_vm_bind_it_insert(vma, &vm->va);
> +	if (!obj->priv_root)
> +		list_add_tail(&vma->non_priv_vm_bind_link,
> +			      &vm->non_priv_vm_bind_list);
>   
>   	/* Hold object reference until vm_unbind */
>   	i915_gem_object_get(vma->obj);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 135dc4a76724..df0a8459c3c6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -176,6 +176,7 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
>   void i915_address_space_fini(struct i915_address_space *vm)
>   {
>   	drm_mm_takedown(&vm->mm);
> +	i915_gem_object_put(vm->root_obj);
>   	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>   	mutex_destroy(&vm->vm_bind_lock);
>   }
> @@ -289,6 +290,9 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	INIT_LIST_HEAD(&vm->vm_bind_list);
>   	INIT_LIST_HEAD(&vm->vm_bound_list);
>   	mutex_init(&vm->vm_bind_lock);
> +	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
> +	vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
> +	GEM_BUG_ON(IS_ERR(vm->root_obj));
>   }
>   
>   void *__px_vaddr(struct drm_i915_gem_object *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index d4a6ce65251d..f538ce9115c9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -267,6 +267,8 @@ struct i915_address_space {
>   	struct list_head vm_bound_list;
>   	/* va tree of persistent vmas */
>   	struct rb_root_cached va;
> +	struct list_head non_priv_vm_bind_list;
> +	struct drm_i915_gem_object *root_obj;
>   
>   	/* Global GTT */
>   	bool is_ggtt:1;
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index d324e29cef0a..f0226581d342 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -236,6 +236,7 @@ vma_create(struct drm_i915_gem_object *obj,
>   	mutex_unlock(&vm->mutex);
>   
>   	INIT_LIST_HEAD(&vma->vm_bind_link);
> +	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>   	return vma;
>   
>   err_unlock:
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index b6d179bdbfa0..2298b3d6b7c4 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -290,6 +290,8 @@ struct i915_vma {
>   	struct list_head vm_link;
>   
>   	struct list_head vm_bind_link; /* Link in persistent VMA list */
> +	/* Link in non-private persistent VMA list */
> +	struct list_head non_priv_vm_bind_link;
>   
>   	/** Interval tree structures for persistent vma */
>   	struct rb_node rb;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 26cca49717f8..ce1c6592b0d7 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3542,9 +3542,13 @@ struct drm_i915_gem_create_ext {
>   	 *
>   	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>   	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_VM_PRIVATE usage see
> +	 * struct drm_i915_gem_create_ext_vm_private.
>   	 */
>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_VM_PRIVATE 2
>   	__u64 extensions;
>   };
>   
> @@ -3662,6 +3666,32 @@ struct drm_i915_gem_create_ext_protected_content {
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   
> +/**
> + * struct drm_i915_gem_create_ext_vm_private - Extension to make the object
> + * private to the specified VM.
> + *
> + * See struct drm_i915_gem_create_ext.
> + *
> + * By default, BOs can be mapped on multiple VMs and can also be dma-buf
> + * exported. Hence these BOs are referred to as Shared BOs.
> + * During each execbuf3 submission, the request fence must be added to the
> + * dma-resv fence list of all shared BOs mapped on the VM.
> + *
> + * Unlike Shared BOs, these VM private BOs can only be mapped on the VM they
> + * are private to and can't be dma-buf exported. All private BOs of a VM share
> + * the dma-resv object. Hence during each execbuf3 submission, they need only
> + * one dma-resv fence list updated. Thus, the fast path (where required
> + * mappings are already bound) submission latency is O(1) w.r.t the number of
> + * VM private BOs.
> + */
> +struct drm_i915_gem_create_ext_vm_private {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +
> +	/** @vm_id: Id of the VM to which the object is private */
> +	__u32 vm_id;
> +};
> +
>   /**
>    * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>    *

