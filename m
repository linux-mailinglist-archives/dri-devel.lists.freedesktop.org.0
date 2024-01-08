Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8E82768F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AF110E0A1;
	Mon,  8 Jan 2024 17:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEBF10E0A1;
 Mon,  8 Jan 2024 17:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQR4Q+MDqZc+3G57d5XPfhADaTlSZ06defko1sK4rmi7xeYaaqDyIDPmeQa8Cd+tUVRhTemQJsK8aPkSIS/j2vMp77/TcN3sLScomiYZXE+unEdth8xlS+C8Tq24jTWthL0BWutuxyseJksVogMRbLTY2nlxEkyNnqifNa9cwAw/G63joz1g8eKcTtAB2rQgJdJ3ePWhLYv42ICiCJa+5VS5/PQUgI0HGESEcAkUSjBZFxD6Z/o65mcO1cOLKKYjX6rFrrLypyAKUbpz7ipqh/HEG1/GU4dIFoWh5BpCU10wuElhjqES4WtVHQxD6wBdivbhaWXnXnGSnwwK0fzFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=672wEsQ2eA8lgGR+kJXpVrDxHO7FM61KO0KBOnIjsCA=;
 b=FwOZgKw3YcbBk8qATo/ULN++DMY7Ayu5PAC/ywvzBr0Bag85aC4v3MuBehbLgayfn4IwxZ4eNnAOUx0Cld9Ymi6fPWpbHfQ4vmSJhju7tmlc3BKZzLusBky+YrgyW8m/yWJKMvG4p645hyX4Hz5DUEWXAsocZBJ+TCC/bWbhFx3cvXh9Ws5Uti9qwy3quPx86CWEF4/SqcXeQZWWSEyn9yh8QQfAvEbevWAPPpR2lphZRShQz0BP9bhXp2N8JRJ8Na8VNz21Q76y2hvOGvJo2bx+RMbSiSq7CHu1zGuHubJ1IcTFcEmOEWdGun+nPEPyPfCC1NqwXfKDcXX0/mOBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=672wEsQ2eA8lgGR+kJXpVrDxHO7FM61KO0KBOnIjsCA=;
 b=uECOjSX9tJnZid8aWIXCijYvFsfjebQO4TMj/tSRGU3l+HbTE/x1nXRaRTRH1aEjoeRIoaENnyqfzxB4VGnpcHQ3eC2/dSOIzjnb2B63TrbhgfpS/R+0P7kKhczK8kwiJ0DeHCVRZKfTuvy0z2B2Bu7GBgGVmVOtZucWJ4t2w9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM8PR12MB5461.namprd12.prod.outlook.com (2603:10b6:8:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 17:51:31 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 17:51:31 +0000
Message-ID: <a415dea8-095c-4a65-bc55-0f10176daeb4@amd.com>
Date: Mon, 8 Jan 2024 12:51:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdkfd: fixes for HMM mem allocation
Content-Language: en-US
To: Dafna Hirschfeld <dhirschfeld@habana.ai>, dri-devel@lists.freedesktop.org
References: <20240107130700.1165029-1-dhirschfeld@habana.ai>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20240107130700.1165029-1-dhirschfeld@habana.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0269.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM8PR12MB5461:EE_
X-MS-Office365-Filtering-Correlation-Id: 419621f5-4640-4d63-163b-08dc1072729b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iverg+RbIpvQqCnbYytinku2RSOO/14aJXLVpfL0osIGs+CgTHe0+GcScYyE/ejwhm6cxcxNO3m/dJUAt6/PtINhUNM+++lFyfKgUB8svkHgSzpMME5H+eq614zbIkq0HSSze93upkALjjSZSCeMuUzlVC4kx9QpJVa9qN62MADRZO73zsqXOEGiWdA+aKviurB/5jbPK1KD4yJKSmO60rlGjgSRCcaILZApH0SmQFedPeToGIhTT+qSGQ8xDDHksqiG+FZpiF8O8DBwnJYdkVvKuYWq2ysDkebicRjcYj7dfH8q37FSuGgGnJteQYGuxExi5/8YWHjBxF4WX4hh3pz/3UQd6+VNwgRkLkVhmGg3T/nbm1OMgqJn5KCG/0Pw6Uju4WDU1IR7FmR4lLJM6bKCwowli7BfNXDlJ00e7fnbkQ2bv0ce2xFliCDINbTyqu/mmxGSTpzoIyt8nFYuXaBvxFuBTww6HoYqKUq4FD1hYK3B2MimttRii1dUWleUsIdaYBgwWmwDWPQK4lmXLpXC9HweQB61F/jQJg9mYOUbh2aG2fiwaeWafYaYUXWifdUdbX5FhRNYb1VFhYGMbpgKj7oy6fi2epiDCy6DFUr5hLTTXp2SrgSe/FvEG9vZqOk0b7/cN3ornk0pifP9ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66946007)(66556008)(66476007)(316002)(8936002)(8676002)(26005)(478600001)(2616005)(83380400001)(31696002)(2906002)(5660300002)(41300700001)(38100700002)(31686004)(36916002)(4326008)(86362001)(6512007)(6506007)(6486002)(53546011)(36756003)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXhJQzVRZzF6bnlhSmk4c3VjNjNiMEhCKzFmd2YzRnpQRWZvakdIUkhXcGcv?=
 =?utf-8?B?TUFyYjJHU1ZOUXpNbzFmZ3pmR1g1YmtRdXBWcG9STWVMMWpoNEQ5SVBLSTg5?=
 =?utf-8?B?QU8yNzZMcmxvTm9TbHNtMmRiVlVJUFlBSDFTK1p1TjlVTXRTZlFmRjJuY1hG?=
 =?utf-8?B?TFFNZHR0TDBsZ00zYVJmRVBwWUhsN3ZFeVhGblloMzZDZ2pQVGR6YWlvK09F?=
 =?utf-8?B?M2hleHI1TjM0VVppVGR3ejNiQTZkWUJpZFJEVStQZ1o0T3NRSnI1UTBsUWRF?=
 =?utf-8?B?eEs1bEE2bm5YUGhJbVNYZGZyRmVDSE8xajNFQzlTakZxbW5GL0x5eUt0THd1?=
 =?utf-8?B?Z2RzYVFHZHJ3dE9oZ1NrTnczTE5EYnlNR1E4UDRSenY0V2greDh6eUdzOHZS?=
 =?utf-8?B?YmFsUkRodTYvaklUMkN0UEJYZFZBbElaT054NUVRSUNQY1pmb3BEQzh1clI3?=
 =?utf-8?B?cnRycmRyVG82MlhLUGpVeUxEMlgxY1lRUWxpVTlnK2JycUpUYkJ5RGV3Qk1u?=
 =?utf-8?B?Vkx2b0szRWM1VFpOcXk3MEFrSjhmM3QySU94QlplQzNLOFVhaWFJU2N3SGla?=
 =?utf-8?B?Y3ZhMExZaTJVRGFIR0c0S0p2M0EzQzZDOEJBd0FhZUNPTlVqWDhyb2ZUSkZu?=
 =?utf-8?B?ZU1sK2J5TTB2b0N6U0FRTldZNWhqMlFFTnI4bEpmU3lYWmg3U0RYRXAvMGdP?=
 =?utf-8?B?UUFTcmt0dldOd3FHU2dFVllWM1NjbkhydmgxUnZKb2kyZkhKMUFSLzhkdUx2?=
 =?utf-8?B?R0wwN1UxNWo4VFdrWExoeEtiNWVUazFqaStwMXJ0QWg2OGtKSnM3VU9vLzFQ?=
 =?utf-8?B?UVdhbjlOZ3EzMWpvRE5qMGx3cWtkTjZydjJxZmpPem8zdXhEbkxXQnhZWm9p?=
 =?utf-8?B?N0ZBUE91b0w0UGNZcDRVeWNvc1NsZUlqcC9WQTFnK1ErZHZEZ1FVV1MrZlVy?=
 =?utf-8?B?NHFaYzFCa2NKQXByLzM2YUUwSjlGVTRDb0pERVlJWnNUY1Z2WkpaRUJWR0d5?=
 =?utf-8?B?cXhYUW0vdDFCQWNKWEQwVmpJMDdVcWI3aGp2dzRUZXd4UmJlM1hlR3IwMkpZ?=
 =?utf-8?B?bUduU3ZrbWZiODFCeGQxcHBvNzEyaFRvT2RlN3kvQ0Y3NzhNN3d3VmhSa25i?=
 =?utf-8?B?MkxzY0pyVVpxOEFDSG9qeHpDY3JMZXlKWGE5T0VJMEgyQmtlK3NFbWdjTjNa?=
 =?utf-8?B?RUxGWE8zRHdWS29oZDdaQTJISjZBWGxBYmdsTmdGVUlWOWxJQzQ0MTNpaGZx?=
 =?utf-8?B?NHp0ZCtLcWw5MDlNL2NQWHRaZFVjLzdpOFpYeXkrV3cxZXd2WStENGZrZGZo?=
 =?utf-8?B?NzJ3R3JCaUhoQ0ZQRmF2VGpPOTllL3d3dXBJbjNLQlR0ZGx3L2xtYVA4Znds?=
 =?utf-8?B?QUNjQ3JJWVdnY2JlZ2VEYjB5anpIY09NVmwxRXFWVzdVODNWWnFtWjRjaEV6?=
 =?utf-8?B?SXUrcDJuNGQ3aGFNcGFvOHVzejhZdDZjRXppQUlGZXZEYm81amhVYU5WOG5D?=
 =?utf-8?B?NWJOQzRyMnVGRW93Smpxcm1WNFhCOEx0ZnBVaUpGejFSbllFczQzQlNRYktO?=
 =?utf-8?B?R3Nrdis3MU9EaFFJSi9pdzlEMTlhVGdBSnJWQnVMcjAzK3d5RkJCRkZVa2s1?=
 =?utf-8?B?a3MvQUR1ai81SkdqaU5TWVZFcjh2MzFVSmZUV01lVmRvencxYzBYbnU3R0RT?=
 =?utf-8?B?VFh6QndjYm9ZWm5YYzRkK2xvdzgxYnR3WnJlOGdPdVRkeWNPOHdqVitSeFBl?=
 =?utf-8?B?QzlMQzhHaGR5VFhVY0dSVVpOSTJLWFIwZDhkV1hFWHJkbkZFZXZpRmkyNy8x?=
 =?utf-8?B?em9NbUxObUg0eFRtQzJXazdxQXo2NEZYRnk4MDFibG9JSW8ycS9aQnhNUUlU?=
 =?utf-8?B?QU90aEMwUmJ2MkpDckRna0o5RHpLQVhydkFsYWdLRUZwcmRUdU4yeXRxRjI0?=
 =?utf-8?B?cTV3V1p1cVEzcXZBMmNESGhibG1Db0M4MEtwZGZzRFhqdDBFUUo5aVB0UkhY?=
 =?utf-8?B?aXpQV2FvTzRUVmxxQ3BPRmpjbFNHbi9Rb2NjUjZ2c2x5QmV0cndsREVkczJG?=
 =?utf-8?B?WFpzWmxrVVdnYkVHbmFIOThuTnVqakQwWXJPR3hrODNVdmN6YXZmTzBzMjFY?=
 =?utf-8?Q?DzPquOSdo7Co8CcAvRMH938Sk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419621f5-4640-4d63-163b-08dc1072729b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 17:51:31.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Elk4bjW5O7/xgV/fiPutsI5mrmiKWWL8DYkBZ/ZUro8QsImdHNdhF9zVSW+khjs1c1ZndEcYnhW/os3ihIdzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5461
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
Cc: ogabbay@kernel.org, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 obitton@habana.ai, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2024-01-07 08:07, Dafna Hirschfeld wrote:
> Fix err return value and reset pgmap->type after checking it.
>
> Fixes: c83dee9b6394 ("drm/amdkfd: add SPM support for SVM")
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> ---
> v2: remove unrelated DOC fix and add 'Fixes' tag.

Thank you. I'm going to apply this patch to amd-staging-drm-next.

Regards,
   Felix


>
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 6c25dab051d5..b8680e0753ca 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -1021,7 +1021,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>   	} else {
>   		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>   		if (IS_ERR(res))
> -			return -ENOMEM;
> +			return PTR_ERR(res);
>   		pgmap->range.start = res->start;
>   		pgmap->range.end = res->end;
>   		pgmap->type = MEMORY_DEVICE_PRIVATE;
> @@ -1037,10 +1037,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>   	r = devm_memremap_pages(adev->dev, pgmap);
>   	if (IS_ERR(r)) {
>   		pr_err("failed to register HMM device memory\n");
> -		/* Disable SVM support capability */
> -		pgmap->type = 0;
>   		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
>   			devm_release_mem_region(adev->dev, res->start, resource_size(res));
> +		/* Disable SVM support capability */
> +		pgmap->type = 0;
>   		return PTR_ERR(r);
>   	}
>   
