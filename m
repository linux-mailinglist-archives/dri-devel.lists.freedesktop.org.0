Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53D68B9A4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5C910E17A;
	Mon,  6 Feb 2023 10:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172F10E17A;
 Mon,  6 Feb 2023 10:15:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK+13CUko+LcExvZWVqPUr0Gjd0SB5vvAfweSLrRAc7mwqKQWfsr+1YeB1D+MX9JaVBiwyZVdP/3cwYo+4D5h563+4X5I5w6I4zORv5fcIdjDtKEenFVuXX0YPtInLzH5c+Wo1bIO5HCEQuAqkY9AsX5vfnzc5781JSNHZ7ISVK3D4oOXyM3WGQ2jzwPUynWi2hFVbrpbrRYNA34sry7sBZ5bzVSf8HWw4cgzYWQIzt0jen0Plas/RUtyeaQtLyMMxU5532H5QhcaCW5KE4fyv9XLNoNy1E0LU2A5pWesUMrbfUkKodu7wEUt425wGwUwul+qDpBbsimOs27HbFawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlQosZJpb9/aNSVY1/+NOqsHh7n5TmsSm15/6p4LFMk=;
 b=XyH8r2Q5neuOpqVMUrd9aAmX93yMflUInHlW8UyjbtfenSPEX0n7cUCVzi+288WOe+5/+N8XKBUk6TzvY7WpBKJIAYEKvp9WhBQlKTODRFuLOqCoL+SFupG1oM9cJB340/QQ6QlIsiTo8nU9tB+ejsJ3B31rSJ2/kridz2WFyUaV9V6Q0yDP4DD372FmGetUikegfusJeTkoNbMoE31As49ZdW+zfDsyuAveFKhVEWjy/v6x9QXFxK6eplV/C+eeUdOAfhu0vdxqkY7nWVuDmbZ/R2DlFUD5hfD5aoiWS5hASCX0+6pNulV3UJv3K8bZtsPY11Xq1ydpbVltnG8fyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlQosZJpb9/aNSVY1/+NOqsHh7n5TmsSm15/6p4LFMk=;
 b=5RVBcrRsGplPBAxU4dHOzRRRjkT5TYpu3XUMamISxZjY7s2FwapSgfSJyGuJ8HJfVJ1aMbqeRFpVjF7JDt+nz6owMZfiu6V3Tt7W39Qn0jBI9MOtFmkZQX5iM7wypcnriw6V/t3AIVVay02rK1WGtm/N/fKG5oRaWie0VPJgmZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4166.namprd12.prod.outlook.com (2603:10b6:610:78::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 10:15:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Mon, 6 Feb 2023
 10:15:01 +0000
Message-ID: <2d5fc6f8-2247-8a8b-1174-eccdc2b08064@amd.com>
Date: Mon, 6 Feb 2023 11:14:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu: Fix potential race processing vm->freed
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230203181005.4129175-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230203181005.4129175-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ee179e-4afc-4e03-e7b2-08db082b0217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kyNrxe+93bAkQS8byEZa12p50OJ7mZ4QJyTzBBjcDAAibtEbH3qlOTudkA8R4C+d7FIacrnCjXwuXVuIL4nUc5N1hyNcVI8brjo4Tiw29oUkloAM79YET2ddtXUqrcJIkj3+BfAJJeNLctmnynzRicESq/Op/lzSBskXjiwOQmiuhFxBNPDC5L6oqX60gzfYjpxtsB7XyRBFrJNBJRRJUxVm2B9VFF+CP2GFQaeWrGEkiep7evD1681owNPn0jQAgGFYg58mF8ns+Hmm2sTTecYyZtZLn79O3/3NQGn8f23FITZNI0YzPPtxP0nZiSYFxi8xpulooaiGZDyMNGIdt5PLBIzdftsyyirtm1GsJuKNLxW6KTi53fb6rBoOrxipUisMIGJEpOB8/SZjlOg0cuo9z3agjCNBJHXgHGg2LOpT677nq+shaiB5Elw9w+JN58xcJRHlMIdrNsQ6yQ+i0mpx/yhWB+e0rxb2rs1ORBogQA6INxp3f2sMl/m4ZCJRZQy7+H7w9lzhymlQSbUlQgam4FFXLbEjB1Fcn0chfdViNY1+D6fVp3PuSkbwtlnp6OmfFQ3OyI9wfxQ3pRhTNpnDOAYJCikQVp05Osr+XQZbgWwSD+/9Lol2DOIBZ9kVSAYZNJ8xUd+q7jib85QfiCwEcMXvs/kJ1dqiIL4gm8uUXDA9DpZk0IZTxj2e0P3Z4J8dRg5WZMck3Xeh52sicaoQmOX5jwsBp/CtQoSgsNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199018)(478600001)(316002)(54906003)(6506007)(6666004)(2616005)(6512007)(26005)(186003)(31686004)(31696002)(36756003)(6486002)(5660300002)(86362001)(38100700002)(83380400001)(66946007)(4326008)(8676002)(2906002)(8936002)(66556008)(41300700001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SURsWlVYRHFDQ2lKUXJlTkZ4cmhJSy8zQklmWkk1ZDRWSm5EQVRBODE4blkw?=
 =?utf-8?B?OEtyREx6U0lTOXhzbEllRkthUXh3V0xJS0xiU0Nyc1pWZU80MkhYeURuN0pE?=
 =?utf-8?B?ZjVPNlQwdXdGQUZFTFp2ak02Z2NwdStjUjFQSW1yZXA1UG1PMG5xNVJ0K05o?=
 =?utf-8?B?eTZBSVNJOFRWYUNLS2l3anVncWY5RHJtRld3VlJwM0VRcGozSWRqREpLTE9m?=
 =?utf-8?B?bUFkQnFKMkxEVitmdnFMUno5N1EyQlhJbnh4VjlqZkt5VlV6MkJTQ2NyZnhD?=
 =?utf-8?B?N29BTXNNWEVaNXI1TGRsMlAzMTNyMHNIVlFoREUrZWV2dEFmM1BMU0sxRGls?=
 =?utf-8?B?NmhnZzcreGJGZFZCNVR3R2VCQkQrQWhrQU05bHcyOE9rQUVOQUlDMmhsZVRG?=
 =?utf-8?B?NTNycjhCV0JEaStRYXZlZ3RkL3pneEFKdTYyVFc4WnJ4QlEzdjZFcU4wMzll?=
 =?utf-8?B?c3FsUHpWT0pjam5KZmVwRWJNazZlOWpaVE5FNm50ZTEyUTFhRFgrTTg3MHlH?=
 =?utf-8?B?a2w4THFYVVVDOGZ1YldPZitXR1F5QisyMWc5VTEyWGg4b3dVUFQxRU4waDBB?=
 =?utf-8?B?S251dHJickVueDRZdmdGcnZFOWFEZnJHc0tSNDRQTDRxaTMzenRqcHlnSzd3?=
 =?utf-8?B?UU1TckM3Rjk2QWs3elRSVDBrWllKb3o4WHZCeEdoYnFackVBMEk3NGNjQlBi?=
 =?utf-8?B?SDgxbmhqL2tvMDcrOXVBWkVNR2pyZDM2bU9Eb0hxODlRWjNWU3FNQ1JtRnhl?=
 =?utf-8?B?YStibDlmSjZjdEd2aUJ4RGZMY2R6V3NOcSs4emc2RWI5eXRYc0JZNVRJU24y?=
 =?utf-8?B?eGtsNFJFT0VINmV6eEE1VEVXeHlud0x6UkZzdHFtV21OUEpEb3lFUUFPTko2?=
 =?utf-8?B?VWNoT2RTYlIvai9WclRMUDVHVm5iQmsvR05Hc3RqQ3JjMyttVzJMWDNnSnBH?=
 =?utf-8?B?dWpnVVE3ZU00VlQyWXA2TTN0bzRrQXd1K0tMVWpFVDlIWXpvemgxYmZOem9j?=
 =?utf-8?B?Zll0NFhXOUlKakVRZlhqWGwvTUhyQlMvKzJldTJDRGJZTE03RENzbFhGMHpq?=
 =?utf-8?B?dys5dm52eGZPL3M2SFhCUG1QQ0ZQRHZCQ0t4RVRsajVrQXFRY1I0bGNkVnhR?=
 =?utf-8?B?MGl3bDVKNzJUUVpCeUIwQWplc0dVTEtDTVQyQm84RGFxOTAvTFNHNGpUYndm?=
 =?utf-8?B?Uy90NDI3SUdOSUcxYk5rUjIwSWVwWS9PWkhSakd3WUhaRUZLczNPelc1cEE3?=
 =?utf-8?B?d0FTMFlSei9HMkJBK1RxelVuMEJxTjMzTjVqN3I3aDMxNzVHdjZSSjU5Rlkv?=
 =?utf-8?B?NThLc1UvMTBJYzNKWk51aVhJNnRKYXovT1JKK3dtN2diT3ZiOThtTjNsU0Nh?=
 =?utf-8?B?azdqZkQyNUZtVnVXSlVrMG5ZN2I4cGQxZEYvTkkyd3pNRHFzZG0yeDkwOHYv?=
 =?utf-8?B?d2Zxa2dldlZEcFl6Zy9ReVlVM09IcWpXK0NaTjJaZ0lGV293RE8vZEsyZm44?=
 =?utf-8?B?cUt0UWE2WFk3Rjd4VTJlNmpnSVBhQTZVOExoSFArbXM0WUtVK04rQUg0UlFr?=
 =?utf-8?B?OE9ndURyQnRoVUxYZkVjcjBIbDRUR0lMeklMc0lWcDZnODVieDc0VEZmY0Mz?=
 =?utf-8?B?WUJnL3pZcjI4VzNnTktiWUtneVM2VkpOeEV0aFRVL28wbEQvcmVtd2RVSENi?=
 =?utf-8?B?MDBobnIyVlE2WFRrS0FIRW54QjRxMEZuSlZIck1EU3VEL2cwSWd4dW80K3hh?=
 =?utf-8?B?alp3dlhnSElJenN6SUw0enJBWlROSVpxamJkUXp2anF1UXQ0Umg1V01aNGt3?=
 =?utf-8?B?ZzhMRlhQcnRBbVRBN2I5TkFYbnJ0NEp3aUZEeS84eDJZY2lWaDJ2TzNWcTAv?=
 =?utf-8?B?WW9tcGV4SENzMjU4bmtMYnJtam5sTmZrVW1kZWRXQ2JaNm41ZWptSFRiLzBZ?=
 =?utf-8?B?TFdoUEppaitkRVRscEpOZmpPWVM5NGRVSUpINDdlcVV1YVduMkhyNkFzeXAr?=
 =?utf-8?B?S0F6akFXTVg3MmRxL09mb0djMUk1bkhPL0w3SURCVjJvZSs5VTdiTklTQjd4?=
 =?utf-8?B?L1Vyay9IT29pM2pidUZwa0dmeG41aWJ4TmdjRlNtM0xuMDBNNDhrYVREblYv?=
 =?utf-8?Q?ZbOvzQEYKoKCAaPTp15u3mDzQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ee179e-4afc-4e03-e7b2-08db082b0217
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 10:15:01.6981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncMfRGA3MjLy6Gp/fAtGQMt39x1Hfpmx85WdVeSNYgjMcwiMsVRJtnQ2PapJ9GnO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4166
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Yang <Philip.Yang@amd.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Qiang Yu <qiang.yu@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.02.23 um 19:10 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> If userspace calls the AMDGPU_CS ioctl from multiple threads, because
> the vm is global to the drm_file, you can end up with multiple threads
> racing in amdgpu_vm_clear_freed().  So the freed list should be
> protected with the status_lock, similar to other vm lists.

Well this is nonsense. To process the freed list the VM root PD lock 
must be held anyway.

If we have a call path where this isn't true then we have a major bug at 
a different place here.

Regards,
Christian.

>
> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 33 ++++++++++++++++++++++----
>   1 file changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index b9441ab457ea..aeed7bc1512f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1240,10 +1240,19 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>   	struct amdgpu_bo_va_mapping *mapping;
>   	uint64_t init_pte_value = 0;
>   	struct dma_fence *f = NULL;
> +	struct list_head freed;
>   	int r;
>   
> -	while (!list_empty(&vm->freed)) {
> -		mapping = list_first_entry(&vm->freed,
> +	/*
> +	 * Move the contents of the VM's freed list to a local list
> +	 * that we can iterate without racing against other threads:
> +	 */
> +	spin_lock(&vm->status_lock);
> +	list_replace_init(&vm->freed, &freed);
> +	spin_unlock(&vm->status_lock);
> +
> +	while (!list_empty(&freed)) {
> +		mapping = list_first_entry(&freed,
>   			struct amdgpu_bo_va_mapping, list);
>   		list_del(&mapping->list);
>   
> @@ -1258,6 +1267,15 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>   		amdgpu_vm_free_mapping(adev, vm, mapping, f);
>   		if (r) {
>   			dma_fence_put(f);
> +
> +			/*
> +			 * Move any unprocessed mappings back to the freed
> +			 * list:
> +			 */
> +			spin_lock(&vm->status_lock);
> +			list_splice_tail(&freed, &vm->freed);
> +			spin_unlock(&vm->status_lock);
> +
>   			return r;
>   		}
>   	}
> @@ -1583,11 +1601,14 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>   	mapping->bo_va = NULL;
>   	trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>   
> -	if (valid)
> +	if (valid) {
> +		spin_lock(&vm->status_lock);
>   		list_add(&mapping->list, &vm->freed);
> -	else
> +		spin_unlock(&vm->status_lock);
> +	} else {
>   		amdgpu_vm_free_mapping(adev, vm, mapping,
>   				       bo_va->last_pt_update);
> +	}
>   
>   	return 0;
>   }
> @@ -1671,7 +1692,9 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>   		    tmp->last = eaddr;
>   
>   		tmp->bo_va = NULL;
> +		spin_lock(&vm->status_lock);
>   		list_add(&tmp->list, &vm->freed);
> +		spin_unlock(&vm->status_lock);
>   		trace_amdgpu_vm_bo_unmap(NULL, tmp);
>   	}
>   
> @@ -1788,7 +1811,9 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>   		amdgpu_vm_it_remove(mapping, &vm->va);
>   		mapping->bo_va = NULL;
>   		trace_amdgpu_vm_bo_unmap(bo_va, mapping);
> +		spin_lock(&vm->status_lock);
>   		list_add(&mapping->list, &vm->freed);
> +		spin_unlock(&vm->status_lock);
>   	}
>   	list_for_each_entry_safe(mapping, next, &bo_va->invalids, list) {
>   		list_del(&mapping->list);

