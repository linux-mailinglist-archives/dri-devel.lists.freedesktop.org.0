Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8DE3F77A0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450046E283;
	Wed, 25 Aug 2021 14:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECB26E25B;
 Wed, 25 Aug 2021 14:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Re3Xv75hfO7g3TkY776rKaexgqDbEbs25rRGS/A1q2Ms7EL2/vscuibZwUbph8p9KjEjtLW1Q+tBt4Oo6LZcMxdllpVlUkIe7QTkkjD8vtbdxKXEuFM8paUEEBqofkpDbMHceEYkSd8a1vhPT35LZOAhSd3Qar2tIe2QAzNfaq3vXzu1NlwIgg+wKORzqGoOxUkvuruF91erxBhrh5sUFGA60mbqq8E1G4Q9ZfGMskF9rrGUBUL31y/UPReDSZNRI2m8Zh+J6k92vddza4uZbPLSa5N6YiotJQJIa0o4FD9fQTTkU6k4TkRjZfiQV1DFTc+IAU4igSgRc2oiqz3bcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOpOLhivv8azLaMxe3rYuuXYfawz8Ua5PUPspDHrROk=;
 b=dfuwhFDMHOG8a5BL0k8uxjrRKmjAvlSYlaP+GbWFjxRbfSaEalx1IVaHwluszsZB43xyAyMYwqCj1gG1BAC7traQqlKF+2RG92SaPTJ9aky3zmGdsuIGkTC3BIPNp/sUv9cAsAPekKE4otIZi+4PJNd424L00zGjBTr7nsLZ9BADZSISkildTKd16F7zklhQuHfZydmIkv+WVD9TgP6aNctYNOSB3pLRGJBh6tP0Sf1ZJjEksXFukmCRmVPK3DjZ3Z+MFULG2oK2f5BBFWbT5jUNd1u8eQaSQ5l8LubB7DgVs6SUnCSlLnlesyhvV2Mt1RhcZhlegDBu0JAnLz+4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOpOLhivv8azLaMxe3rYuuXYfawz8Ua5PUPspDHrROk=;
 b=QYGmEctgydSiKkrdI8rWCFZPY12mZ38vgeXs8QAujZYqrfzD8zPpwZSBuVNuCN5O5VM+HWc+nMHlYJzzmoOGOYEJCv547Fv4svrYWkKak/0FdlOnHe22JRHNi3phjGViMhnbR1vzSh3AT2aXC0m8JE32WlDQKFSY5N/Cjf6PA1I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5289.namprd12.prod.outlook.com (2603:10b6:408:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 14:45:48 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 14:45:47 +0000
Subject: Re: [PATCH v1 06/14] drm/amdkfd: add SPM support for SVM
To: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jgg@nvidia.com, jglisse@redhat.com
References: <20210825034828.12927-1-alex.sierra@amd.com>
 <20210825034828.12927-7-alex.sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <c16b9cdc-76a3-896f-3723-c8128aed1e70@amd.com>
Date: Wed, 25 Aug 2021 10:45:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210825034828.12927-7-alex.sierra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::25) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 14:45:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c905386-04c1-407c-405b-08d967d7068d
X-MS-TrafficTypeDiagnostic: BN9PR12MB5289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB52892620775FDCBD55B8809C92C69@BN9PR12MB5289.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WslBdmhHceuC0PEcgNbTcJerYm+UU7u6Pr8EE0Gu3eaKS/xEwFz854y3mSREodfnizs4xcfZ3i4xRBS59cdosWfrlyt4BPUBuZXNQHBVpLPcLpAok7yaXoEgcf6vWw/Rj4WcqXoSQKRF3TmSOYFdGSxN+OwvZjnNEjM5QFHsjv8D+3AUvuy03HQifL445NUPxUgoCpn1vWtgwcC/6J8Q+1rGVmy2JvbnY7b36enMCptaCsQEqXqVtXNKceQ8fHjxAcO557PRg1dtq6FXy7vixe8qSSRxDhi45TcdL/fC9Dea3QnggGfXU3jX/KI0BiQ4DKUL242NLSc0Kv6pd+Th0Ig6SjfH/FmSn8RLJQtld2Q9UsvCmyux0wlu9GWuc8eM8CFXDOlDg8JthdRlXPJUsIuPHbRhjXKUVsTpo1RhWgE1kLzMGzLNoDtqPFTNeywjth1g3BEf41+hyXYdo7R4q5tMBjiyNwstqTzCR0fSwaUlToXUfpDG4BS20us8T4gZ02LIBFMz+1S2OA+YaLkX8oTHStX271eiWSiMdLVUKtH/PaUyCHBsYd4fc917O9iZll/VqYg7Llqd98xSKWtrbs99YgPu8jPRpKgUPTnpyyG8MT+UkP26rG/hK3QOxQlHCRsbRWGV/Jp2PR1Ilij3Wu5onJJJfRZnQPn2xIAHfC0M7OEb+oE4VGrxylvr4QI4ASBHrniJJz4j26oUD0PP9xqWpbw3JVqHI9TA5SwnYGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(8936002)(83380400001)(5660300002)(86362001)(186003)(478600001)(66556008)(36756003)(66946007)(66476007)(4326008)(7416002)(16576012)(31686004)(44832011)(38100700002)(2906002)(316002)(956004)(2616005)(6486002)(8676002)(31696002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGhBZkFVZkxXNXJmc09hTnFUaklCZ204UFJ6eDBkcUhFSENkbzRMdzQwK2gx?=
 =?utf-8?B?cWI5S09DZ0ZraDVVZVhDOHhHZnZId1VKZUVzZzVqRHAvK0FNRDA5R1prQVpv?=
 =?utf-8?B?ajdIVmFRcXJVRjdtOFZjaTRYRkpwL0xIMkdLaWxvRmVYUWdMQUNNNCtzOU82?=
 =?utf-8?B?ZHU4aDRtQzNENHB1Yy9SQzROTlBSdVFLT21YVjdzd1RCSEhjSUxVU0wxUzZn?=
 =?utf-8?B?NVlCdGpUVE1XRnJjNlJNQ1RFSVBVL0dsaHU4RFJRU0JSQnNNZHlZTFRpeDZy?=
 =?utf-8?B?akFjclpqdHdRVWxRU0ZIb1JqU1pxekJ3a05TZkdZc3VoaEdZVUh6d04xdTRw?=
 =?utf-8?B?RlRyK3BGckNIYkpYMjlRMVltQWU0YU9Pd3FkZE9vV2JtdWc2UVNMV0JGL2lY?=
 =?utf-8?B?OHdLMXZZc3BZelNteGt0ZldOdlI3R01HNHluUVBuZzltY0UwNUs0MWJ2dDB4?=
 =?utf-8?B?ZXhnSWxSd1FyYnpDYk4wOEFoMlBnZlVNNDZWdTMxVHlsVGxXandKdjFYSmVV?=
 =?utf-8?B?YUhuV2NHRVVzajBOOGVNSFpMZXBRaG1IRHNCV0tyQU9WTDVUNXY4dzliclhV?=
 =?utf-8?B?MWhCT0dpU0tIeTB4ZkZSV09oNkVXKzJmdlk1K0l2UElqaUZNNWxSNXJpNjhl?=
 =?utf-8?B?K0lqQWFtb3BiQi95emxWZzFOdUdyWks2eW9JMXFBdGFaMTZJRnRKVGhCbVVh?=
 =?utf-8?B?NGdpNnFqSEpaQThYOExwTmI4bWpyVytLbXNwK25FTzVnS1ZvbFcwREx2bHRS?=
 =?utf-8?B?MDlFWDRwMGl2ZDduVktnZHd0aFZVSGZLODNpU2RQc042aVlZWnZBYVh5UGFt?=
 =?utf-8?B?WmtkSkc5dm9LU2g5Q2EyV0xxSk54Nk95SUVSL0J1bTVmYlBoeDBpeWUyOGJt?=
 =?utf-8?B?dloxSmJwV3VPUlBycXMxMzNBVndPWlgwQUZkVU41dXFIM2xUbUM1OExpaVVE?=
 =?utf-8?B?ZUdKRDVnV0xVNlQ5TVQ1SGdCdmFWTzJhSzA1ekMvR3VnRDRqbnlFOG5za08z?=
 =?utf-8?B?c3lxMGRMeXBzMU1nTHpHc0tzd3pIRVo4eHFHSGFPWFpSV0s1djBlY3p2STky?=
 =?utf-8?B?R0RDSmJSajZCZTlIbDNSUk9PMzJnUjIzZjdjL0c2eDJwd3V1eTcxVHdQSVZj?=
 =?utf-8?B?QW1hSjk1ME1EenRTSW1WdkJjdEErRXJBM0VMMmJvRlZ4eHZIVU9YblpIL09K?=
 =?utf-8?B?N2VBMGRtaTJxU2IxN0swYmlmaGVOSG1WSVo5dXp5VmdESUhhMjdtSkpOQ3ZG?=
 =?utf-8?B?U25uVGM2bnoweEYrcVRJNE9CZzFjSjNiV0toa2FVV0l2dWh5WmdVSDk4V0hr?=
 =?utf-8?B?c1YzRnJYbUt5Qmw4aFFITFZXNTByNlp1T05GbWZLT1k0YU5iNFRKL1Y0UWNZ?=
 =?utf-8?B?NDdxcXJxVmI4Ky9SRnZ5Q3hweHBJVEF2ZVlJejFNTE1TRGJuMTFLamtKWEN3?=
 =?utf-8?B?UVdkVWtSV0xaYkZHSU44ODVVdW41ZTJUWWNsTEtRSVI5THFNMmFDRTREVWJx?=
 =?utf-8?B?Wk9jam9TcWhwNWNzWHVIRlVmZkxBaVU2dHllUUE4d1diZGk2NHJKMEZxQmxU?=
 =?utf-8?B?TnJ1alhuQ0MvNVRBRExpbGY4aDBhVmhiNHpKbG0zN2RpSVhpWGQ2TTN5QU43?=
 =?utf-8?B?ZnNoWGo3RHBKU3RNNUp4WWJ0anQzMFN6bG1oWWxzYjlsQmFyWFgxdTBJVTBI?=
 =?utf-8?B?N04wMTBlRlFlQXYrRGJHVVYvcGhRQXprWTlidHJTa2xWSVU5aENud3RGTEEr?=
 =?utf-8?Q?cYKY4zNHMkt7bVLigl28foZaWBR+s6+rWQk5Ul+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c905386-04c1-407c-405b-08d967d7068d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:45:47.6738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FldHZo8UW+9AGD51zvK1ifzYtSdOs83uDOHZ8o0GJw1MBnhDiUBFFIfxbWn6sir945yQGgUlnSxCpEnVgToGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5289
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

Am 2021-08-24 um 11:48 p.m. schrieb Alex Sierra:
> When CPU is connected throug XGMI, it has coherent
> access to VRAM resource. In this case that resource
> is taken from a table in the device gmc aperture base.
> This resource is used along with the device type, which could
> be DEVICE_PRIVATE or DEVICE_PUBLIC to create the device
> page map region.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
> v7:
> Remove lookup_resource call, so export symbol for this function
> is not longer required. Patch dropped "kernel: resource:
> lookup_resource as exported symbol"
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 29 +++++++++++++++---------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 47ee9a895cd2..dd245699479f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -865,7 +865,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
>  {
>  	struct kfd_dev *kfddev = adev->kfd.dev;
>  	struct dev_pagemap *pgmap;
> -	struct resource *res;
> +	struct resource *res = NULL;
>  	unsigned long size;
>  	void *r;
>  
> @@ -880,19 +880,25 @@ int svm_migrate_init(struct amdgpu_device *adev)
>  	 * should remove reserved size
>  	 */
>  	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
> -	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
> -	if (IS_ERR(res))
> -		return -ENOMEM;
> +	if (adev->gmc.xgmi.connected_to_cpu) {
> +		pgmap->range.start = adev->gmc.aper_base;
> +		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
> +		pgmap->type = MEMORY_DEVICE_PUBLIC;
> +	} else {
> +		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
> +		if (IS_ERR(res))
> +			return -ENOMEM;
> +		pgmap->range.start = res->start;
> +		pgmap->range.end = res->end;
> +		pgmap->type = MEMORY_DEVICE_PRIVATE;
> +	}
>  
> -	pgmap->type = MEMORY_DEVICE_PRIVATE;
>  	pgmap->nr_range = 1;
> -	pgmap->range.start = res->start;
> -	pgmap->range.end = res->end;
>  	pgmap->ops = &svm_migrate_pgmap_ops;
>  	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
> -	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
> +	pgmap->flags = 0;
>  	r = devm_memremap_pages(adev->dev, pgmap);
> -	if (IS_ERR(r)) {
> +	if (res && IS_ERR(r)) {

I think the (res && ...) condition means you only detect failures for
DEVICE_PRIVATE memory. Why are you ignoring failures for DEVICE_PUBLIC?

For DEVICE_PUBLIC you can skip devm_release_mem_region, but you still
need to detect and return the error. Also, using res as an indicator is
a bit obscure. I'd put an if (pgmap->type == MEMORY_DEVICE_PRIVATE)
before the devm_release_mem_region call.

Regards,
  Felix


>  		pr_err("failed to register HMM device memory\n");
>  		devm_release_mem_region(adev->dev, res->start,
>  					res->end - res->start + 1);
> @@ -914,6 +920,7 @@ void svm_migrate_fini(struct amdgpu_device *adev)
>  	struct dev_pagemap *pgmap = &adev->kfd.dev->pgmap;
>  
>  	devm_memunmap_pages(adev->dev, pgmap);
> -	devm_release_mem_region(adev->dev, pgmap->range.start,
> -				pgmap->range.end - pgmap->range.start + 1);
> +	if (pgmap->type == MEMORY_DEVICE_PRIVATE)
> +		devm_release_mem_region(adev->dev, pgmap->range.start,
> +					pgmap->range.end - pgmap->range.start + 1);
>  }
