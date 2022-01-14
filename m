Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF548F219
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 22:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A80210E23A;
	Fri, 14 Jan 2022 21:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0614210E23A;
 Fri, 14 Jan 2022 21:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX7pKkMBeJSciU8TYv9rCH3XsrVMxTLUOAHQxuGj8f7wCH7bcixo1eiDPRnHRuLdeC9K3w9sO92PUVAcm9VA9PG3YcE9TVwYA8QO0tZotJtziny0ensgTY7H6zfLAALR6n2+Ekq6tqPQP71xD1z03+h+YHqUphQHiPysMgENlF+CL4vOb9AjS7g2KIOnT9MTfJeOqCLZY3PzykcgGNTF0BvXxo21RZF0P5VcXRwxkBsSDGmgbuTleNk/G0GufCvIjXK9ZSJVeZw50leCpXx4KadYAaHT57gq2U9T08s8bh2zSSebWluivr7631VHoSuV7c5/+TnrpkgH1C/nkVS6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bF72+YxH0A6CQjuyw2VPQRLvduCLZeAJqedftwU+otI=;
 b=bbhQCDsBVqtWBhc3imN8uHmBJ6XCzb8eOcminhUmKDNHqI89nyMOZOV8gKaffSRP/EyE62S36OSArpQYxtwEvB5uTsUYfOayQg/pY6TMDtB2l2xWUbFXu8mxl3nZqmsGDs+8c+yjUj1DBIIu1aywwECr83VwDCYsycW91jSoS4Cyu1n0KePIXPviWcZ12HJlZ2TBmQ6kEzrkI6jxIWDMpLLqqIB52a8QUju8Ayz8lDgMqYx/sw7vk6KLpQhrnBkt+mj0Iu9zR1IX4J8EcBRARpkQE66dCkW0fS8dzfqPUTaZK3+NGW3L/UNqiZW+8GjGS/d56Urf2ZzlbfBdDj+yuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bF72+YxH0A6CQjuyw2VPQRLvduCLZeAJqedftwU+otI=;
 b=n9e9QUYoM3K6d9CEopuYyLaHkQOVrCMi1yhkqZErnVS/YPHQLhQb/uRwXu7oS5ssmGdiILQ/YwJZM1CleLYYDlXTH4ntwVN9/DX4KTwlOncKgiqK53uR7Jtsj5Z7HbHm9UTdO4SWhqiVgyT1b0J8Y+dovz+VcnarpIi2uFZlUfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB3230.namprd12.prod.outlook.com (2603:10b6:208:108::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 14 Jan
 2022 21:43:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 21:43:49 +0000
Subject: Re: [PATCH 1/1] Add available memory ioctl for libhsakmt
To: Daniel Phillips <daniel.phillips@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220111013955.3214767-1-daniel.phillips@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <616c6d75-0eae-896c-d321-db69d9d4e90d@amd.com>
Date: Fri, 14 Jan 2022 16:43:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220111013955.3214767-1-daniel.phillips@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5895a413-684d-4f77-4eaa-08d9d7a6f2bc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3230:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB32302FA5FCB05E2AC47D9A7D92549@MN2PR12MB3230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7oluP3coDCTsCIFVYkM7l6RYO16qbR3yZlgJbGzk3mQpv88hBMc/USrgyXNgDBl3gEaMAxpFGagaVQ967lhPzSEc7awH/SWZ5xBnRUoAAUKuOsaN9g7Cq4uEOpPu0bCIhiM1itoRcrW4QbCgs2U4cgLigSryaD2SkMw9MFwAyA9xyzwEcJB2asUz+OmwluD8w+R8o5E2XM5JpqoLC/32y5a5cXR8dAY75NvbkeJ2bGqfLP1edZkP97WcVvtDh20k43lMeeaCrOFK7IY6whHyupSxRrUPXhorxI8uFxIrmS0WYKTcTjEKENGuT/USGcG4Bmdxlk8/ym+JCKXRVpmxtXYTZcFKMp6ZyCwpL7K1EhkJUTuGRWSd/vy14nwI9SZridGQLyTxx73jXiA4yqsxEM8lxZQVrQ3o6u+yXFQUzKoIV5qbEHyvQsPAuSEs2Nl2unt2rbR7OFUHA0sRJcc7NLJrRz+Sp0cWS97oAXE/f6gu6o1Y6+UXDLV+wFSvyrnJZVBiZigRClS0MCbe73zxkXpnvYI84mizqZMN0bpz2aeMNWBuYGxv2PhTJryfCahXT0+UCGAKPr3O7IgI6SRFIAO06DW/V4sbYXNRsCrFBC/5I+k4LpS7cUksrUAYRPs0gxun8hyQYyXG4ixB95rhHitJ8K9FLU4v1BU/Y8nbgN+7cXnwa/m2FZZq6ZNXlzY3DvTujYVJeFDZDZ+GRiF42zUWq38r/RDXHtpggE08bCRIDZwy5pjoa1BaFXmxJAUoluWWkKUGUIOFVKpsYsT2oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(36756003)(508600001)(2616005)(316002)(31686004)(31696002)(6486002)(8936002)(38100700002)(450100002)(83380400001)(2906002)(66556008)(6506007)(86362001)(66476007)(44832011)(966005)(6512007)(26005)(5660300002)(66946007)(186003)(131093003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RKMTVsNkw1RVEyZmRSZzd5ak9IRVVBWk1oU2RNRDUycVkwZ2gxSG0wVTE1?=
 =?utf-8?B?VDhDczhhVTdMSWlWcUVzNkpaSWc0T2RvdDg1STdLWDQ0SWZ2TDI0OGJEWnZ2?=
 =?utf-8?B?blJ1bkZaZkxDZkNRSWV4OHFaRjNvUFFLV3JxMlloSUNUeFowQ2QxbHo5d3Aw?=
 =?utf-8?B?QnNmSUxVa01iN1BydmN3OXhzUXBzOENYZ1Rhb2hmM2VwR2puV2lCTFhBMkhQ?=
 =?utf-8?B?TVlyR215cndZWDRhbnhqbGYzT0I1VWNDd3lhWTJpNFp3Z1FsSmRtakVWM3FH?=
 =?utf-8?B?T0hOZ2VuRm5NTDhDeUhhbGMyMjZFRHY1MFJBc213YzdtUy9mQ2I0NzJwR3gr?=
 =?utf-8?B?VWNNVEJyZnZreUlaczQyMURRejBjSkExNlRGaVIrTkpwencwb3NGdHVsS3Vo?=
 =?utf-8?B?YUFRcXdPcEFIcDFsdzgvYlhCVWY2K1gzQXU1ZHJXek9vb0NMRWZHN2YreUxN?=
 =?utf-8?B?Ky9yUGdiaFE1VlhFdW0vaytya0NqV1pzMkVBMkpwZEIxeE9zUlJJZ0dYUVYv?=
 =?utf-8?B?eHdId1N1WDZ5TnhqTDJIbDJwZS8vTFpBcXRGRnFJOXozODJJVUxSQVlkRDdH?=
 =?utf-8?B?ZnFUSzRTWWZuVzZSczJ1c2FCZGZCdzhhR2dGcHkzQzUzWGFDdEcyTnFBWkxk?=
 =?utf-8?B?VEwxVWF1aXowdUFjdUJ2RHppM042ZkxoVjllbm0ybTJUOTZGZ0U0c09QellI?=
 =?utf-8?B?R0pwam1jc003UjNzV2V2RlNlZk4vMFIvaEsxNUNFbEcvVjkydXpaeU9DR2NF?=
 =?utf-8?B?dnI2VFRyQmFTQlVseEZDVCtPdkx6WVBuQjdVTGZkSTk5b3BjTU1LZHhlRzBB?=
 =?utf-8?B?OHoxeCsvOXFiTDNkWDlxOTgrU280SUk1dlhJZ051UlNPRHRqV3MzYUlUODZZ?=
 =?utf-8?B?bDVFMjh3NTh2elZxWGtJN0ZuM2JuWUxkSHdndTN5MkcxR1ZXU09KMDBib21D?=
 =?utf-8?B?cFltOGhlQmNNUC8zeXR4azRWamUycFFSZVFwWFFuVGxZWFZFaUxxd01LeWJ1?=
 =?utf-8?B?bWR2eS9yU3N2ci9aOTRWM3dVanAwT3BWc0tkSEhPaE1nMGREc0t1N2l1c3lQ?=
 =?utf-8?B?NWhKaEU2ck5DUzVnQW9BZDFzNUJtbnRhV2hwYXc4MFArU0hWU3FZZEJaOWVL?=
 =?utf-8?B?VkowOElXRmtlWHgwWThvbU5yL29tQm0rdVdEa3ovNHBEVnhkeStlNlhXWnlI?=
 =?utf-8?B?UUVMNDNMbVpCZHJYMFZlbmpRQ0szdG4zbkUxMjBKVVlTN0Yzc1Z2T2Z1R0Vm?=
 =?utf-8?B?UEgrWXJNanZaMERlMkg5QVJQUTJsdklGZzYrbWdDL3RtRjcxN1kzcjl1M050?=
 =?utf-8?B?YnE5UEkwM1VrZWpIUjVtYVlVNyt3VGdPL0p0K0NBeGt2WEtaZ3NJeVFUdXE4?=
 =?utf-8?B?TFhLUDU1M3ZBRXBGMStrSGUrci8zZjVEOERHNitYZklEVlVreDZEcjh2b2Y3?=
 =?utf-8?B?dmJIYVVkNTBnckJCYkRXQlhocnJtdUdYSzRRRjFVU1FRZG55TlFwWUFiLy9j?=
 =?utf-8?B?UzI5ZC9wN09ZazhoN1lIZU0ycWs2TFhpcXJQaC9TRUVJR2FCYzhWQkY3K2g4?=
 =?utf-8?B?clhqMEdEYVpaaTB6R1d4YlFYSnFxNjhqb1k1Q2lMYWR5Z1dKUzlPZnBkandZ?=
 =?utf-8?B?WmhaazBLWUxKWnZwTTFSL3ZnNVNrU2RKeVo2L2VBOVlJRm5RZUczUDVhVzdP?=
 =?utf-8?B?Smdab3pRai9VaUx5dEhoTE9JcnZtaW0wcVFhY0Mva1FCSndVVkdBSi9reVNK?=
 =?utf-8?B?YjErWlZNOUZ1RUtsWDA2WHgzeHZkTVRnUVkrNEI5eWptRTloNUtkakprelFM?=
 =?utf-8?B?aVg2UEJlUjA0dGljTisxRkREZU1RSVZ2T2pXVU1PdC81NEZLVVBBSVI4Unhm?=
 =?utf-8?B?Qk03ZHRNL21aNzY4Q0I4eW9BSExPUFBCM3RBZElURThoUzZMdmdYUGkvYW9R?=
 =?utf-8?B?WXR1UmhUOGhlYno0SlM0SVV3RzMvcjZET3pVOFRHU1huM2I5b3Y2bG1uRXNs?=
 =?utf-8?B?cnVDeU9kbDFrcUVsWWlOZ3o5T2lHU1AwSVdPVnpienRlTnByRllDbHRPTE9P?=
 =?utf-8?B?YlRRZFY2OWJDMXJpUk81Z1dndmxGTytmUmM0MUtXbkRydEk3NURFcmFYc0ZT?=
 =?utf-8?B?Rng3YmRTd0xMdm5sMVpHanFrWTBwZnFIcGJablJ0SGhzQ3pKQ2lxOHYyWmpu?=
 =?utf-8?Q?y1Pj4xk6fk6o7EliI8aWr3U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5895a413-684d-4f77-4eaa-08d9d7a6f2bc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 21:43:49.0511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4qZ+OsAw6WB5SJUSK46W72Hwh4PDLCoHc2AIitWl6kgz99QrpiaHUJP5IHaY5zNUs/LOV807YFPynWq7Hjaig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3230
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

Am 2022-01-10 um 8:39 p.m. schrieb Daniel Phillips:
> Add an ioctl to inquire memory available for allocation by libhsakmt
> per node, allowing for space consumed by page translation tables.
>
> This ioctl is the underlying mechanism for the new memory availability
> library call posted for review here:
>
>    https://lists.freedesktop.org/archives/amd-gfx/2022-January/073352.html
>
> Signed-off-by: Daniel Phillips <daniel.phillips@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h      |  1 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c    | 14 ++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c        | 17 +++++++++++++++++
>  include/uapi/linux/kfd_ioctl.h                  | 14 ++++++++++++--
>  4 files changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index fcbc8a9c9e06..64c6c36685d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -266,6 +266,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>  void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
>  					void *drm_priv);
>  uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
> +size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev);
>  int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>  		struct amdgpu_device *adev, uint64_t va, uint64_t size,
>  		void *drm_priv, struct kgd_mem **mem,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 86a1a6c109d9..b7490a659173 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -190,6 +190,20 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct amdgpu_device *adev,
>  	return ret;
>  }
>  
> +size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
> +{
> +	uint64_t reserved_for_pt =
> +		ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
> +	size_t available_memory;
> +
> +	spin_lock(&kfd_mem_limit.mem_limit_lock);
> +	available_memory =
> +		adev->gmc.real_vram_size -
> +		adev->kfd.vram_used - reserved_for_pt;
> +	spin_unlock(&kfd_mem_limit.mem_limit_lock);
> +	return available_memory;
> +}
> +
>  static void unreserve_mem_limit(struct amdgpu_device *adev,
>  		uint64_t size, u32 alloc_flag)
>  {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 4bfc0c8ab764..5c2f6d97ff1c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -486,6 +486,20 @@ static int kfd_ioctl_get_queue_wave_state(struct file *filep,
>  	return r;
>  }
>  
> +static int kfd_ioctl_get_available_memory(struct file *filep,
> +			         struct kfd_process *p, void *data)
> +{
> +	struct kfd_ioctl_get_available_memory_args *args = data;
> +	struct kfd_dev *dev;
> +
> +	dev = kfd_device_by_id(args->gpu_id);
> +	if (!dev)
> +		return -EINVAL;
> +
> +	args->available = amdgpu_amdkfd_get_available_memory(dev->adev);
> +	return 0;
> +}
> +
>  static int kfd_ioctl_set_memory_policy(struct file *filep,
>  					struct kfd_process *p, void *data)
>  {
> @@ -1959,6 +1973,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>  
>  	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
>  			kfd_ioctl_set_xnack_mode, 0),
> +
> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
> +			kfd_ioctl_get_available_memory, 0),
>  };
>  
>  #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index af96af174dc4..94a99add2432 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -32,9 +32,10 @@
>   * - 1.4 - Indicate new SRAM EDC bit in device properties
>   * - 1.5 - Add SVM API
>   * - 1.6 - Query clear flags in SVM get_attr API
> + * - 1.7 - Add available_memory ioctl
>   */
>  #define KFD_IOCTL_MAJOR_VERSION 1
> -#define KFD_IOCTL_MINOR_VERSION 6
> +#define KFD_IOCTL_MINOR_VERSION 7
>  
>  struct kfd_ioctl_get_version_args {
>  	__u32 major_version;	/* from KFD */
> @@ -98,6 +99,12 @@ struct kfd_ioctl_get_queue_wave_state_args {
>  	__u32 pad;
>  };
>  
> +struct kfd_ioctl_get_available_memory_args {
> +	__u64 available;	/* from KFD */
> +	__u32 gpu_id;		/* to KFD */
> +	__u32 pad;
> +};
> +
>  /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_policy */
>  #define KFD_IOC_CACHE_POLICY_COHERENT 0
>  #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
> @@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {
>  #define AMDKFD_IOC_SET_XNACK_MODE		\
>  		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
>  
> +#define AMDKFD_IOC_AVAILABLE_MEMORY		\
> +		AMDKFD_IOR(0x22, struct kfd_ioctl_get_available_memory_args)
> +
>  #define AMDKFD_COMMAND_START		0x01
> -#define AMDKFD_COMMAND_END		0x22
> +#define AMDKFD_COMMAND_END		0x23
>  
>  #endif
