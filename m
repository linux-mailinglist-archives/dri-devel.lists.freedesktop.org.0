Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC348A1A0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 22:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91D10EA58;
	Mon, 10 Jan 2022 21:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2059.outbound.protection.outlook.com [40.107.100.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98AA10EA58;
 Mon, 10 Jan 2022 21:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrG3gKvo1nl47magdtKzJ6qHSznSeGOqTSmV4/hZgPUOSKiIBzdWr4YYzaEHYDmn4Okx4NMUlBQnr/8cwfF0WbiTHTmv4Z6OwyhuRovcfrN9/9CU3hkcRr8G+p8DuxoBad+u3XST169bxXE/fJZRMtoYXVha89RJUAtKCBgGb94lPMEGYAkfsEUC9W+FJOxr5qJt2Ljg2BDUNe+WpZ7USMgKh4SCYUZ3JMh197fPkdTVmKNOMt9O+s3qiRjls4Rlbz79T5THSfh12xoAy9PerPVxrp7EmkkI9Y4r+Ih14zgocY8wCQNLofdrTWBbHTMUdPdZNJ9bsyrvKWpk9Ri1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy98L4DYEUShTconFyn9Jt/XM0WpxyU5cA2jJo7/0r8=;
 b=FdJiy00IZMgVGmOZDk+t227EN3ygvzhkxhcyGkGqyzbn9SsT9icCNLieDUyG7tJE4N+3euKaiIkDL6P79nRSKGVRApgr+k1888gVBS5Zm/5am0JVQESp0Ey4N4nVMCm1LnBD/v3uL5MqaaboqwJ3bB4sYrmnIlwEd4+PtLjGJXtccV7Q2kanjFY7KMIwtq3iBsI1hCZ+izhUGOE3Z3mUI/ZrHcZp0q5eCHKGgi0mJHK00vZgX12HyIxWNQ/Caj1GahpCefpf2ie9/Rty2YEX0wInIERi/nSb67OJfGp0t72cO0hQpOa1DRyLM3GE2K+8D2vgyKy5EfwfFCGMiaiqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy98L4DYEUShTconFyn9Jt/XM0WpxyU5cA2jJo7/0r8=;
 b=O8Cd1MXyfgzDaVn5ctQ+Rjl3NcV0rPv9maSasZPTh/r/FHS7n1e2za9iuHuaZjq2gv1Wcbkn3j31VuyHBGBdPCjwrfwxznm4efkIGCiTqSYjTmJFeWQGcUiATRoWCU7OSiQeNGWzRvzdXyQE6rQQm3VAYPnmEhNGFxvnCx9bIf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 21:15:06 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 21:15:06 +0000
Subject: Re: [PATCH 1/1] Add available memory ioctl for libhsakmt
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Phillips, Daniel" <Daniel.Phillips@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220110205457.3165572-1-daniel.phillips@amd.com>
 <BL1PR12MB51449917D93BE664ECF3E5B5F7509@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <f9c628d3-5a31-d407-8760-1f6859b7a1d0@amd.com>
Date: Mon, 10 Jan 2022 16:15:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <BL1PR12MB51449917D93BE664ECF3E5B5F7509@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL1PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d16af610-2099-452f-0195-08d9d47e467d
X-MS-TrafficTypeDiagnostic: BN9PR12MB5243:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5243A64201CB20A9C657A05792509@BN9PR12MB5243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBoHpz2g1tI44SO8KYPc0dtz2Wbfu21ZU4hxSsHxOgt3kMelC5gmsraF++IzsASYT9fccAuscEnSj3i4vZ6F8eXwhnDP0pwYEFQg9ytuM/7nGkpdH8hzfYMwGEgNimwPZ9BSz6sTRXSgRAJNMOqFsGIvOrJ9rJKHuw0PsHXYpZAEiZ8G5Y19bDyPwCIAGl5G6r08fkprOSFXPONByf8ltYfesOez8enycHnsCNZN/cUYhULgIZ0WEaskas5tPernK/sQ1PJu1NZlLMdyEPRokB/Q/sXz0iDHTcIYt3gdFh2SsHvBP3SXW8uiN9KtZq+1Jja1ZnG2P8/WqnD5y9TvMS3L841QqW9CtFIvdJZdjGnTcnPhtVLq4vQhG0vNle7PjvxN4pSGoUqUgN0/wBL4RLnX1ei71eIfVKMq/oeV7imGrQyNmhjJlj7BJDE5RSOM1GgOv5/if/RcVM80tqQHm8U7DG3tAT8bULMNxgLuSniCoAwAtBR+DFiTeM59UGFhbq0y/ri8JLl+3oAN1BgcB45iz4vcc7ivoYSuT1dvBf8CTZTzJhm+Ng6wOLsT+RT9Yc6RB0eKJQLbwPYbb1QHZ2iO/eUGzDVDyYOQ+eIgu7Gv0I5NG1UM8UOgeggkczFWUomvfL+qi7bQlOOvSvmRTH2zEzzwfxQ31sHwIVSZN0rLvnLpHniUqXZ87JTUUM8CtH5jifflN918v2e80rP25Zbqz1iblVaOPI1oELjC3nrSVIHXPRLIX8KGTuerbwGXS9vWu/dX1cwWIeJvXNl2sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(36756003)(26005)(66946007)(450100002)(31686004)(316002)(6512007)(83380400001)(44832011)(66476007)(31696002)(66556008)(53546011)(2906002)(86362001)(2616005)(6486002)(8676002)(186003)(5660300002)(508600001)(6506007)(36916002)(110136005)(8936002)(131093003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?EWvrF5Uskk8nMldjRQKqDFtLp90F6VaL4JD0/HsC6uASDMgmGU+CjNJV?=
 =?Windows-1252?Q?V29aJJu6yjKGHAmeWDoVbGO0/2wKWbkeWkLvf2FcyAlx2iEu8IF1ZScj?=
 =?Windows-1252?Q?Hj1Y1EjhvG6tlPsAzMSgNUdru2RqhYOrVoyN+bOP0MnnNwT8uZRjsfOt?=
 =?Windows-1252?Q?r5DfK+TaTltIx9W72Q+Bl3ERMbT1+Ad8IbU83NGvvwpvHXk0OMeC7TFK?=
 =?Windows-1252?Q?snAhGLMnCrDYBOe2A8I+Nysj4Mf6znwZt+C7OPRycju0yE0EJhO/OSQv?=
 =?Windows-1252?Q?yL9pQRoghbdT5eUxsySQNhbEuM3O0tdmgOAPUfrNRqWI8WGRm+yA8c8R?=
 =?Windows-1252?Q?WrKwupOFXTlkGgxVfXf8DhLz6byslP572l7gVylEcAY+eycc+eD+jWmq?=
 =?Windows-1252?Q?GPhZsYKwbsudz1ckMdpfl8UxQq/EWignGnSqkr5VZBkBA5hF6XGqVzWe?=
 =?Windows-1252?Q?ugUHiiUlxL+PgD9XiUWn8c2FlFqf/gLBdzB02ioQgEeLnU3IlLZMsEPm?=
 =?Windows-1252?Q?mmqKCxmmJhboLnxh5frXP7uAcr/rOVPsnmSjhMiDWeW68b4IacKVgI9o?=
 =?Windows-1252?Q?lnjrxHb595bnjMIIfGEUInK8rxV2bvvAiQWwqPe2IFD1+hedAn4DdxjM?=
 =?Windows-1252?Q?WHMV9l4FWCBNXlEE/Ksyz7K9rjJRN0KSjNVT/9Z4EMvVeOWKciKRFaUx?=
 =?Windows-1252?Q?yxo185J5ALbwFphB+Gc1lNxHXhHvI/m4VJhiTKwd3bnsOMZTd4s2JLkm?=
 =?Windows-1252?Q?uSuWf2lhG/XM7b4AS+xpFAD1Q937t30ut15VeFs1q9mWvbWEv36F2yLa?=
 =?Windows-1252?Q?BqM6oH6seJQtbE22KiNhHtBbDjgmzaR1L6QSfSfDkx2+vV2JbBnqftU7?=
 =?Windows-1252?Q?tW4aTZXNpb56RGEtGDQ/pU1HcSMgH+6KmjI8PprgqNX9IQrzcZI77se4?=
 =?Windows-1252?Q?/4rv+Yf0Payr2RnZTQH1G87sAgLiRcEAW16NmXbu4hBQt2MyjoROdcPi?=
 =?Windows-1252?Q?lXLOYCJJvuMX8YBhKgBy/sHM0b3DPDkUpIG/mpMXfSbvu6j2dgIdOHnG?=
 =?Windows-1252?Q?XHfI0lJsRRcSOWWdxVAFXoRJpzFKjbaFFYeUPc2r6xYsPnqDo/Q09XhY?=
 =?Windows-1252?Q?dBcVkFadI7wCgXtNffrYrBnMXaTZ83Kc/sT3YyTerGCTYpLYuEAeO/K+?=
 =?Windows-1252?Q?IlnYcQ1yRgiHTBIsRnEgsJ1Yhy5a9TPWlGGyNQfHmy2qfHGOZommBCp8?=
 =?Windows-1252?Q?C90lkc1o+nCexRFQU8OpZfCRhE/tWPlQN0kmOSiDAs6VgYviehMKw8wd?=
 =?Windows-1252?Q?v/iP0ZP+W6r0IkqoSy1zu1mYTn66M/AfnofALsVULCJ8cDQnX4GBuVDr?=
 =?Windows-1252?Q?RMHEDAiJAAjZV8lA12ioX4NHNRai2NFEvP3ehMfDl+oUyiwaAIA9ofIf?=
 =?Windows-1252?Q?Kp2OGC3LjUwJtbVfM0S6ovpf0kMhOOiFCKmifSxbZxGh65hYc3HSCSho?=
 =?Windows-1252?Q?YBCnIOWTjhe+QQ80kCIDgWQmvHzV3dC+jdpFr1xeC3zAr6YLn+jlenrA?=
 =?Windows-1252?Q?YAwng3HhM1xO9hElB76sm3vm8hEK+t1M3PsZexKvPccmt4Brbf37zNVq?=
 =?Windows-1252?Q?ZKyynETgiWI0c3BAggjQ71Zn2h1ip94eCVxTEh7xQ70coSLs4r2xYys+?=
 =?Windows-1252?Q?rdyt3t5CZ00NF+jgaw7aGv7gQMMWTQ54+7rSRCsv/kzoPgdgHufc2N6S?=
 =?Windows-1252?Q?kEsenaXhe0uQtmDX68c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16af610-2099-452f-0195-08d9d47e467d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 21:15:06.4919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HutSH9McdPd1rx4Gz6pdA6XfKJtFFqQLvyZ2gCHicHMunNO1Foa4iy8Yi/84qKe1Ze/0RyyXyYl0sfdU+D4XZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243
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

On 2022-01-10 4:10 p.m., Deucher, Alexander wrote:
>
> [Public]
>
>
> [Public]
>
>
> This is missing your signed-off-by.  Additionally, for UAPI changes, 
> we need a link the patches for the userspace component that will make 
> use of it.

I've asked Daniel to send the Thunk patch to the same mailing list. 
Should show up any minute ...


Regards,
   Felix



>
> Alex
>
> ------------------------------------------------------------------------
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> Daniel Phillips <daniel.phillips@amd.com>
> *Sent:* Monday, January 10, 2022 3:54 PM
> *To:* amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; 
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
> *Cc:* Phillips, Daniel <Daniel.Phillips@amd.com>
> *Subject:* [PATCH 1/1] Add available memory ioctl for libhsakmt
> From: Daniel Phillips <dphillip@amd.com>
>
> Add an ioctl to inquire memory available for allocation by libhsakmt
> per node, allowing for space consumed by page translation tables.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h      |  1 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c    | 14 ++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c        | 17 +++++++++++++++++
>  include/uapi/linux/kfd_ioctl.h                  | 14 ++++++++++++--
>  4 files changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index fcbc8a9c9e06..64c6c36685d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -266,6 +266,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct 
> amdgpu_device *adev,
>  void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
>                                          void *drm_priv);
>  uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
> +size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev);
>  int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>                  struct amdgpu_device *adev, uint64_t va, uint64_t size,
>                  void *drm_priv, struct kgd_mem **mem,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 86a1a6c109d9..b7490a659173 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -190,6 +190,20 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct 
> amdgpu_device *adev,
>          return ret;
>  }
>
> +size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
> +{
> +       uint64_t reserved_for_pt =
> + ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
> +       size_t available_memory;
> +
> +       spin_lock(&kfd_mem_limit.mem_limit_lock);
> +       available_memory =
> +               adev->gmc.real_vram_size -
> +               adev->kfd.vram_used - reserved_for_pt;
> + spin_unlock(&kfd_mem_limit.mem_limit_lock);
> +       return available_memory;
> +}
> +
>  static void unreserve_mem_limit(struct amdgpu_device *adev,
>                  uint64_t size, u32 alloc_flag)
>  {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c 
> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 4bfc0c8ab764..5c2f6d97ff1c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -486,6 +486,20 @@ static int kfd_ioctl_get_queue_wave_state(struct 
> file *filep,
>          return r;
>  }
>
> +static int kfd_ioctl_get_available_memory(struct file *filep,
> +                                struct kfd_process *p, void *data)
> +{
> +       struct kfd_ioctl_get_available_memory_args *args = data;
> +       struct kfd_dev *dev;
> +
> +       dev = kfd_device_by_id(args->gpu_id);
> +       if (!dev)
> +               return -EINVAL;
> +
> +       args->available = amdgpu_amdkfd_get_available_memory(dev->adev);
> +       return 0;
> +}
> +
>  static int kfd_ioctl_set_memory_policy(struct file *filep,
>                                          struct kfd_process *p, void 
> *data)
>  {
> @@ -1959,6 +1973,9 @@ static const struct amdkfd_ioctl_desc 
> amdkfd_ioctls[] = {
>
>          AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
>                          kfd_ioctl_set_xnack_mode, 0),
> +
> +       AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
> + kfd_ioctl_get_available_memory, 0),
>  };
>
>  #define AMDKFD_CORE_IOCTL_COUNT ARRAY_SIZE(amdkfd_ioctls)
> diff --git a/include/uapi/linux/kfd_ioctl.h 
> b/include/uapi/linux/kfd_ioctl.h
> index af96af174dc4..94a99add2432 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -32,9 +32,10 @@
>   * - 1.4 - Indicate new SRAM EDC bit in device properties
>   * - 1.5 - Add SVM API
>   * - 1.6 - Query clear flags in SVM get_attr API
> + * - 1.7 - Add available_memory ioctl
>   */
>  #define KFD_IOCTL_MAJOR_VERSION 1
> -#define KFD_IOCTL_MINOR_VERSION 6
> +#define KFD_IOCTL_MINOR_VERSION 7
>
>  struct kfd_ioctl_get_version_args {
>          __u32 major_version;    /* from KFD */
> @@ -98,6 +99,12 @@ struct kfd_ioctl_get_queue_wave_state_args {
>          __u32 pad;
>  };
>
> +struct kfd_ioctl_get_available_memory_args {
> +       __u64 available;        /* from KFD */
> +       __u32 gpu_id;           /* to KFD */
> +       __u32 pad;
> +};
> +
>  /* For kfd_ioctl_set_memory_policy_args.default_policy and 
> alternate_policy */
>  #define KFD_IOC_CACHE_POLICY_COHERENT 0
>  #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
> @@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {
>  #define AMDKFD_IOC_SET_XNACK_MODE               \
>                  AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
>
> +#define AMDKFD_IOC_AVAILABLE_MEMORY            \
> +               AMDKFD_IOR(0x22, struct 
> kfd_ioctl_get_available_memory_args)
> +
>  #define AMDKFD_COMMAND_START            0x01
> -#define AMDKFD_COMMAND_END             0x22
> +#define AMDKFD_COMMAND_END             0x23
>
>  #endif
> -- 
> 2.34.1
>
