Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F2C48A384
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 00:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ADA10E43B;
	Mon, 10 Jan 2022 23:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B2610E30C;
 Mon, 10 Jan 2022 23:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EauWvIdUw9ez2+fepkRyBJAhnIzikZSDfNBFUMm5GW0g8Sq1wwBQgFLd535bYGIs9SibxPxJxvk5VLgqmLkMN7ZUvTOBt/fieFtHDmvM9T9KKZKO3tv5i/48lLueFXSXLwnQR4UG7YACzmSfpG2ccEAq9AFyWqh20K4+Jyujb3SD0bQHXrSynxck+E1hddlfwucbelqMmH4UuDAEUxn2zt+387WH4fTt1x8bP7JoGqaUiYREzbNucdFuUp9i5XXd1HPYYGrSnK7UPKwcIEtKdWIKoiLkH9PqM4X5qrjb3DNQThUSYCl41/0VIUJUsbmhc5hVCFc4LR75ORtMq7nH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDrNSfcH2FmNtg/iCH/13SuA9kDcmz56VszxXNwCq/4=;
 b=gm0YHUQklBDrV9NHAAZgnlyxkC0ZMM2bdueb+TLRBkwU8c+y18wKMJGC99W+UAOESipnZeOY607NcmORN2JXnExFOQKbDPTZ+IcloOmfGPXICmU+LpYuVKs/GHc6NO8N6qrwxDYsuYi5zgK4i8w05mkanOOV6hlIiJL7YI21x2e9k13cYFFcoaY7blbawQmFgCSsaKAB4bv73G9wDCa+MeYmJWSiHbvwxPFQrvwT/O6KWQdJc8mJwWeoT7dvDefuAcVWw28COyc4clTGURWTTVrhpjJsLlA0fBp8VIcYj+0T+UZk+i2rME/SuzBj6mNeyuDoVfX5d/35LasaBDdV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDrNSfcH2FmNtg/iCH/13SuA9kDcmz56VszxXNwCq/4=;
 b=LwZ2X+a97beA/F5MQzRnkEAMCeLtjRB44Lcluo9bLoElFS5WLxaIRk8KMmnFSyrdzPDO5j8crZWI7ffIIqUyDEiSBq0ELuWJWPbkYTW4Z/er+GyOuWds584ZUtchIAmlTJAOPWOLT4YwXUrKvOag9LWp7KkvLducV4St3D+MVtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 23:16:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:16:28 +0000
Subject: Re: [Patch v4 07/24] drm/amdkfd: CRIU Implement KFD resume ioctl
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-8-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <33495aa4-0a1e-3ae8-93a5-4d69b6b6c112@amd.com>
Date: Mon, 10 Jan 2022 18:16:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211223003711.13064-8-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL1PR13CA0387.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::32) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf3cc97f-e5a2-4f14-1231-08d9d48f3ac2
X-MS-TrafficTypeDiagnostic: BN9PR12MB5257:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5257B4FF029D7590392C625292509@BN9PR12MB5257.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sd6oudIkqyJBiy6y45B0Y6mBWCwM74Hr5Te1XWQnmpAJ8W+7UAc3SlldytTwzb7/7ks6OnPZ/UHAucFYbQ7fu5/CJnCtRSIOocc0LO+VhXQsTO84Qv0AxiETpBfLwSAHUeueAHxX5arz1qhUSzrDf6ZMfcGDY12iebl1vAMyUZmRY/mS7pjinQgD7aswAPLpHi1/DgBTp5aF9IxuW1ImUWPqBJmKi6r9xsxgGB117gBsckoCptoByac2Npv0tBz8xFCqBIrUtWNlKhDjnnsw5af2UCGaAeI59VadAKy9QVmYD4mToMySZUhFT7lpyN/GYKbE31g+50+UY98JWpgzjtdLr3w3rsX0g3TSV4wz8PwxvBrXxevZb5juTkIsfqgCRZOOfXYo+QGIJmFjDWfM8SVB5qbXJi5TLfahKGgG0Puyc+QDkDYIq6eWFiBouKquhFsZFmkkgBARkxX+namUXDZdiAlVc8kR29zfR1Y/4sAewZi8mbx8ZXZ9gVQt8thBkCU57nE1TJRaDGSgv9JUgTCrQI/wZXgGxHh7jlN2qDMICvBaQcR8m1JkMofQHHIO7YF46r7w9KtWxQIk1npFnfFndZyjJhFGLaw8zjzqf0VwfhYRJJw7ntv/lSVSgmL4aXDfoWhsEIT62s3ft6d1JlOJBpT4MSmxti0ZVAtwm7zOFcetq7/nuCH1LT8vEn0kTAbS87vU/ikBixfT88VobHdXy10AUwZl/s+3LUpZ2CYp5zYQeXKLsRZaWOl8aUAB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(4001150100001)(6512007)(36756003)(26005)(316002)(31696002)(31686004)(8676002)(86362001)(30864003)(83380400001)(53546011)(8936002)(44832011)(508600001)(2906002)(4326008)(6506007)(66556008)(5660300002)(66946007)(36916002)(2616005)(186003)(38100700002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNuZjYrL0U5eGNsUjlCdXlsRUkvbjZMTHpFSjJJYXdiZ3hIWWo5UGFoeDIr?=
 =?utf-8?B?bDdSOHNpQzg3T011aEpVM2Mva0I3WWwrM09nTi9OTXNKTzROMkx1UTU2R2Zi?=
 =?utf-8?B?MGNQSGVQZUtlNEhJcU1WLy8wd05hU3BTMHZCcXE3RTVPc3lwOEk5YWJVQWRN?=
 =?utf-8?B?cXZBQzJSWndvMGMvakYxS0NiODltdHcvTmpaQzd3RWhxdnhIWi9CQ2FsMnFo?=
 =?utf-8?B?UjdUYXhQK0NvTzlwb216TTV3ckt5bUJtQVZicVZ0NzZOYjRTdWU1TnZRSEZZ?=
 =?utf-8?B?UGt4dWNMbEgvMXJJVFpqalhRL0xZQkIyV0RLZXhUUXR1WnRGcFlNakYwQmJh?=
 =?utf-8?B?TExoWG0wcS9vOFVXd0cwN1ppSThIUzN5aEtNOExBaERyMHFhSzVjY09NbnZW?=
 =?utf-8?B?eG5HS3R0dVd1K0hYNmJqM0VhSVZYdDVsWlJRQ3RmK3V4Z1kzYmRtR2x4WjNS?=
 =?utf-8?B?Nlg2UVJjanV6RkRFSjVxaXVlUjEwcTB1RUMweTZYVG5Xc2RFcWQvbi82WUZt?=
 =?utf-8?B?cCtFUUgzTFZUNzN2QkpCb1QwUDhQYzlmcHRhT2YrZjlpdnZMMTZiMGt6WGNO?=
 =?utf-8?B?ZXFyMWlCeFZ4UERjTjBjWXlFUTZNMkNZRHVSNC9hRjJuREFJL00reUQyM0Zo?=
 =?utf-8?B?Z0hZdFJSYmkzUHlTUDJWT2t1UGxzMHVCeWpIa0hmdVk1NC93eTMrNThMOHpn?=
 =?utf-8?B?VkRGblo0YjVON25yNEpLV2Mvb2J0TlRmZlVtYm1ZVFluMjNtaUwxdUR2TUw2?=
 =?utf-8?B?YkJoenE0YStmVFRXWmhzc2QyWUZONzNEZW1rbzA0QytjRUtBM3Bib1YrSjI0?=
 =?utf-8?B?NnY2MHBScUZnZWxJMmdSeTVhTUEwcmxmOXFPQXhsSTRscnkrclFjc2wvanY5?=
 =?utf-8?B?R1EvQ3JsU0hiS3pxTDd5em9jdGk4MlhleUhtYmtOTS9kWDg3OW9UZTZ4eWpy?=
 =?utf-8?B?ZGsyYU9CeDRhR0pJRWZmblB3Y3c4aTJKZDByNEQ2ZDNsRnRWbXByc01GMzBL?=
 =?utf-8?B?MisyY01helJuaEdieFRCanQ4dXdGZ0pLYVY4dUd0NXIvc2FGWE50dXRscmJy?=
 =?utf-8?B?U3hWOFJxd3NHeS9rLzJRUFBmL1N2aEppK1ZVenJ3SDRkWTVtR1lLa1Rxei9i?=
 =?utf-8?B?ZEhyQWNHMFR2eVIvUy81NXcwSENNZGRwSWt3VllyZ0NHbWRETE9OYXdmcG05?=
 =?utf-8?B?M25yZUF2emtsLy9WZGx5cGo3SDVmRGFDU0c3dE1EZWl2d2pVd2lnNHJtWkE5?=
 =?utf-8?B?YU5weXVpVEZUNmFEMmdpWkdSVUJ5ZE80a2IzNnVGYlNiWlF0SmVJUkpMa1Zq?=
 =?utf-8?B?aHN6SHc2c3RNbzhRRWFmM3RoOGVheHpnMU1YOWVyY3lrSm9NTXFwbEZRSkJm?=
 =?utf-8?B?SFVOM1JiRm5Pa1Zoa3NpVGFtM2RxQStDK2Nob0JDazVqdjQvMGhlblROOFdD?=
 =?utf-8?B?Y0ZVS0ZzenRMTHV1czRIRVlob2NoRmFyaEFJbHppdDF3aEMyT0ZZK3owSzFZ?=
 =?utf-8?B?OFZES0VlMUdrMTBrWllzeWFrYVQzOTlpb0VvVmJ2NnBvWUhUMUJONXZiMDNV?=
 =?utf-8?B?dTlGbE0xVHNUUzZ0LzI5cFBOdXhnM0huWXVIQ3VEdERGMXZmaEQzZFRpKzZN?=
 =?utf-8?B?MW1WWG1vRmNsVVl3Yk1KbTVTUHNYVjlleDZ3eE1rSU9QVXNpUElNN3VnUVF5?=
 =?utf-8?B?ZFJHQVdsVnVrTEEyMTc2UzdFbTgwcENaS3NQTnIxQTNjU09HV09jZCtueTY5?=
 =?utf-8?B?d0RxL2RWWFZaaVhqRmVaaFU5OUEyUzR2ZEYyRHh4L0NRTVdqT1BGcjJKdXUw?=
 =?utf-8?B?YmtqQTFxRHo3RWNlSHJuMWZZLy9mdFhIOWh2ekF0NnhDRG9nWUJRWXQrTHFY?=
 =?utf-8?B?Q1BzMjVVWGJ3cmhuQzh2MnFDdHBiUWVtQ0ZJbDJjZ2VldE42bURtR2daMS9k?=
 =?utf-8?B?SVVNZE96ZFB6Nkx1NGdtbnZVSXBYNjlCV3dUZ1RXVTIyYXNQNGdYUTRFSGk4?=
 =?utf-8?B?eUpucDU0YUVRRFFvWnBSbnBnUjEwUS9NSW1qamo5V1ppeHRQRFNOcCs0VU14?=
 =?utf-8?B?djFLV2xlT3BtK3NGQStTUm9qRXAxNGZYYlFMbjk4cUkxcHl0K2FwT1ZFV3Fi?=
 =?utf-8?B?clRqQlNHeW1BdjhURFhsQTBGbFBlajl5OGN2RUg0VVhEVFFxNE96cCtnRHdt?=
 =?utf-8?Q?UHVIqXmqh8cP7QlCfbhzmXE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3cc97f-e5a2-4f14-1231-08d9d48f3ac2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 23:16:28.2095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tuCU/o99b+5E+5aDygkKq58m0IXBX5pyKDpPaGOybA8b98y7o/z+q47TyalqvyXjQCF0r3xPPZH7RKii7NCXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5257
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
Cc: alexander.deucher@amd.com, airlied@redhat.com,
 David Yat Sin <david.yatsin@amd.com>, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-22 7:36 p.m., Rajneesh Bhardwaj wrote:
> This adds support to create userptr BOs on restore and introduces a new
> ioctl to restart memory notifiers for the restored userptr BOs.
> When doing CRIU restore MMU notifications can happen anytime after we call
> amdgpu_mn_register. Prevent MMU notifications until we reach stage-4 of the
> restore process i.e. criu_resume ioctl is received, and the process is
> ready to be resumed. This ioctl is different from other KFD CRIU ioctls
> since its called by CRIU master restore process for all the target
> processes being resumed by CRIU.
>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 51 +++++++++++++++++--
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 44 ++++++++++++++--
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 35 +++++++++++--
>   5 files changed, 123 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index fcbc8a9c9e06..5c5fc839f701 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -131,6 +131,7 @@ struct amdkfd_process_info {
>   	atomic_t evicted_bos;
>   	struct delayed_work restore_userptr_work;
>   	struct pid *pid;
> +	bool block_mmu_notifications;
>   };
>   
>   int amdgpu_amdkfd_init(void);
> @@ -269,7 +270,7 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
>   int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   		struct amdgpu_device *adev, uint64_t va, uint64_t size,
>   		void *drm_priv, struct kgd_mem **mem,
> -		uint64_t *offset, uint32_t flags);
> +		uint64_t *offset, uint32_t flags, bool criu_resume);
>   int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
>   		uint64_t *size);
> @@ -297,6 +298,9 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
>   				struct tile_config *config);
>   void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev);
> +void amdgpu_amdkfd_block_mmu_notifications(void *p);
> +int amdgpu_amdkfd_criu_resume(void *p);
> +
>   #if IS_ENABLED(CONFIG_HSA_AMD)
>   void amdgpu_amdkfd_gpuvm_init_mem_limits(void);
>   void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 90b985436878..5679fb75ec88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -846,7 +846,8 @@ static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
>    *
>    * Returns 0 for success, negative errno for errors.
>    */
> -static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
> +static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
> +			   bool criu_resume)
>   {
>   	struct amdkfd_process_info *process_info = mem->process_info;
>   	struct amdgpu_bo *bo = mem->bo;
> @@ -868,6 +869,17 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>   		goto out;
>   	}
>   
> +	if (criu_resume) {
> +		/*
> +		 * During a CRIU restore operation, the userptr buffer objects
> +		 * will be validated in the restore_userptr_work worker at a
> +		 * later stage when it is scheduled by another ioctl called by
> +		 * CRIU master process for the target pid for restore.
> +		 */
> +		atomic_inc(&mem->invalid);
> +		mutex_unlock(&process_info->lock);
> +		return 0;
> +	}
>   	ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
>   	if (ret) {
>   		pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
> @@ -1240,6 +1252,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
>   		INIT_DELAYED_WORK(&info->restore_userptr_work,
>   				  amdgpu_amdkfd_restore_userptr_worker);
>   
> +		info->block_mmu_notifications = false;
>   		*process_info = info;
>   		*ef = dma_fence_get(&info->eviction_fence->base);
>   	}
> @@ -1456,10 +1469,37 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
>   	return avm->pd_phys_addr;
>   }
>   
> +void amdgpu_amdkfd_block_mmu_notifications(void *p)
> +{
> +	struct amdkfd_process_info *pinfo = (struct amdkfd_process_info *)p;
> +
> +	pinfo->block_mmu_notifications = true;
> +}
> +
> +int amdgpu_amdkfd_criu_resume(void *p)
> +{
> +	int ret = 0;
> +	struct amdkfd_process_info *pinfo = (struct amdkfd_process_info *)p;
> +
> +	mutex_lock(&pinfo->lock);
> +	pr_debug("scheduling work\n");
> +	atomic_inc(&pinfo->evicted_bos);
> +	if (!pinfo->block_mmu_notifications) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +	pinfo->block_mmu_notifications = false;
> +	schedule_delayed_work(&pinfo->restore_userptr_work, 0);
> +
> +out_unlock:
> +	mutex_unlock(&pinfo->lock);
> +	return ret;
> +}
> +
>   int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   		struct amdgpu_device *adev, uint64_t va, uint64_t size,
>   		void *drm_priv, struct kgd_mem **mem,
> -		uint64_t *offset, uint32_t flags)
> +		uint64_t *offset, uint32_t flags, bool criu_resume)
>   {
>   	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
>   	enum ttm_bo_type bo_type = ttm_bo_type_device;
> @@ -1562,7 +1602,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   	add_kgd_mem_to_kfd_bo_list(*mem, avm->process_info, user_addr);
>   
>   	if (user_addr) {
> -		ret = init_user_pages(*mem, user_addr);
> +		pr_debug("creating userptr BO for user_addr = %llu\n", user_addr);
> +		ret = init_user_pages(*mem, user_addr, criu_resume);
>   		if (ret)
>   			goto allocate_init_user_pages_failed;
>   	}
> @@ -2072,6 +2113,10 @@ int amdgpu_amdkfd_evict_userptr(struct kgd_mem *mem,
>   	int evicted_bos;
>   	int r = 0;
>   
> +	/* Do not process MMU notifications until stage-4 IOCTL is received */
> +	if (process_info->block_mmu_notifications)
> +		return 0;

This runs without holding the process_info lock that protects this 
variable. To avoid subtle race conditions and unexpected compiler 
optimizations, use READ_ONCE to read block_mmu_notifications here and 
use WRITE_ONCE wherever the variable is modified.


> +
>   	atomic_inc(&mem->invalid);
>   	evicted_bos = atomic_inc_return(&process_info->evicted_bos);
>   	if (evicted_bos == 1) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index c93f74ad073f..87b9f019e96e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1325,7 +1325,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
>   	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   		dev->adev, args->va_addr, args->size,
>   		pdd->drm_priv, (struct kgd_mem **) &mem, &offset,
> -		flags);
> +		flags, false);
>   
>   	if (err)
>   		goto err_unlock;
> @@ -2107,6 +2107,7 @@ static int criu_restore_bos(struct kfd_process *p,
>   {
>   	struct kfd_criu_bo_bucket *bo_buckets;
>   	struct kfd_criu_bo_priv_data *bo_privs;
> +	const bool criu_resume = true;
>   	bool flush_tlbs = false;
>   	int ret = 0, j = 0;
>   	uint32_t i;
> @@ -2114,6 +2115,9 @@ static int criu_restore_bos(struct kfd_process *p,
>   	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
>   		return -EINVAL;
>   
> +	/* Prevent MMU notifications until stage-4 IOCTL (CRIU_RESUME) is received */
> +	amdgpu_amdkfd_block_mmu_notifications(p->kgd_process_info);
> +
>   	bo_buckets = kvmalloc_array(args->num_bos, sizeof(*bo_buckets), GFP_KERNEL);
>   	if (!bo_buckets)
>   		return -ENOMEM;
> @@ -2203,6 +2207,7 @@ static int criu_restore_bos(struct kfd_process *p,
>   			offset = bo_priv->user_addr;
>   		}
>   
> +

Unnecessary whitespace change.


>   		/* Create the BO */
>   		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->adev,
>   						bo_bucket->addr,
> @@ -2210,7 +2215,8 @@ static int criu_restore_bos(struct kfd_process *p,
>   						pdd->drm_priv,
>   						(struct kgd_mem **) &mem,
>   						&offset,
> -						bo_bucket->alloc_flags);
> +						bo_bucket->alloc_flags,
> +						criu_resume);
>   		if (ret) {
>   			pr_err("Could not create the BO\n");
>   			ret = -ENOMEM;
> @@ -2228,8 +2234,8 @@ static int criu_restore_bos(struct kfd_process *p,
>   			pr_err("Could not allocate idr\n");
>   			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
>   						(struct kgd_mem *)mem,
> -						pdd->drm_priv, NULL);
> -
> +						pdd->drm_priv,
> +						NULL);

Unnecessary formatting change.

Regards,
   Felix


>   			ret = -ENOMEM;
>   			goto exit;
>   		}
> @@ -2383,7 +2389,35 @@ static int criu_resume(struct file *filep,
>   			struct kfd_process *p,
>   			struct kfd_ioctl_criu_args *args)
>   {
> -	return 0;
> +	struct kfd_process *target = NULL;
> +	struct pid *pid = NULL;
> +	int ret = 0;
> +
> +	pr_debug("Inside %s, target pid for criu restore: %d\n", __func__,
> +		 args->pid);
> +
> +	pid = find_get_pid(args->pid);
> +	if (!pid) {
> +		pr_err("Cannot find pid info for %i\n", args->pid);
> +		return -ESRCH;
> +	}
> +
> +	pr_debug("calling kfd_lookup_process_by_pid\n");
> +	target = kfd_lookup_process_by_pid(pid);
> +
> +	put_pid(pid);
> +
> +	if (!target) {
> +		pr_debug("Cannot find process info for %i\n", args->pid);
> +		return -ESRCH;
> +	}
> +
> +	mutex_lock(&target->mutex);
> +	ret =  amdgpu_amdkfd_criu_resume(target->kgd_process_info);
> +	mutex_unlock(&target->mutex);
> +
> +	kfd_unref_process(target);
> +	return ret;
>   }
>   
>   static int criu_process_info(struct file *filep,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index e611366fbc34..cd72541a8f4f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -949,6 +949,7 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
>   					int handle);
>   void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
>   					int handle);
> +struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid);
>   
>   bool kfd_has_process_device_data(struct kfd_process *p);
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index f77d556ca0fc..d2fcdc5e581f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -64,7 +64,8 @@ static struct workqueue_struct *kfd_process_wq;
>    */
>   static struct workqueue_struct *kfd_restore_wq;
>   
> -static struct kfd_process *find_process(const struct task_struct *thread);
> +static struct kfd_process *find_process(const struct task_struct *thread,
> +					bool ref);
>   static void kfd_process_ref_release(struct kref *ref);
>   static struct kfd_process *create_process(const struct task_struct *thread);
>   static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep);
> @@ -715,7 +716,7 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
>   	int err;
>   
>   	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(kdev->adev, gpu_va, size,
> -						 pdd->drm_priv, mem, NULL, flags);
> +						 pdd->drm_priv, mem, NULL, flags, false);
>   	if (err)
>   		goto err_alloc_mem;
>   
> @@ -816,7 +817,7 @@ struct kfd_process *kfd_create_process(struct file *filep)
>   	mutex_lock(&kfd_processes_mutex);
>   
>   	/* A prior open of /dev/kfd could have already created the process. */
> -	process = find_process(thread);
> +	process = find_process(thread, false);
>   	if (process) {
>   		pr_debug("Process already found\n");
>   	} else {
> @@ -884,7 +885,7 @@ struct kfd_process *kfd_get_process(const struct task_struct *thread)
>   	if (thread->group_leader->mm != thread->mm)
>   		return ERR_PTR(-EINVAL);
>   
> -	process = find_process(thread);
> +	process = find_process(thread, false);
>   	if (!process)
>   		return ERR_PTR(-EINVAL);
>   
> @@ -903,13 +904,16 @@ static struct kfd_process *find_process_by_mm(const struct mm_struct *mm)
>   	return NULL;
>   }
>   
> -static struct kfd_process *find_process(const struct task_struct *thread)
> +static struct kfd_process *find_process(const struct task_struct *thread,
> +					bool ref)
>   {
>   	struct kfd_process *p;
>   	int idx;
>   
>   	idx = srcu_read_lock(&kfd_processes_srcu);
>   	p = find_process_by_mm(thread->mm);
> +	if (p && ref)
> +		kref_get(&p->ref);
>   	srcu_read_unlock(&kfd_processes_srcu, idx);
>   
>   	return p;
> @@ -1675,6 +1679,27 @@ void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
>   		idr_remove(&pdd->alloc_idr, handle);
>   }
>   
> +/* This increments the process->ref counter. */
> +struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid)
> +{
> +	struct task_struct *task = NULL;
> +	struct kfd_process *p    = NULL;
> +
> +	if (!pid) {
> +		task = current;
> +		get_task_struct(task);
> +	} else {
> +		task = get_pid_task(pid, PIDTYPE_PID);
> +	}
> +
> +	if (task) {
> +		p = find_process(task, true);
> +		put_task_struct(task);
> +	}
> +
> +	return p;
> +}
> +
>   /* This increments the process->ref counter. */
>   struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid)
>   {
