Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C28669014
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1BD10E9AA;
	Fri, 13 Jan 2023 08:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C63310E9A5;
 Fri, 13 Jan 2023 08:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AF7+DzzMZiXsYn2Mp9iY1OxiNZzMGE0MY3X95TDQwqzf+3PU7KbUqqPaaFPTIGlfe6o7E9VkyI1aIlcaMpRu6v0jOKS6uk+3JbW3iCErFzgr6X0fLHLvXS5gnQXTlpXK5V3CV+S7lrsJVXI4SX2MSqWZQ7T4NoWhGXX2170bbDa98B6l8LF+1WgT+w0HBd8jsukV2uWTVG+TgV9DPaOdqOuqQwM+cENbiXMCnvYsLr+U3Wsff+2ZRak9SkNRzKeDMr66NLt2ejJTSWKcTSV43zTeGvnX3cyqwltNue5/rhm1JPBdgnE5WlJqIYg9Rlzf4T+Ue1O9Ig9VZkHCWFkTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9xfYhQv8c1yjtlNlXsbKfEKMI+Cw70b7XfObn+5wHI=;
 b=EQsZ03FHslvssbRdZWT1EdM8mwxLGV3pIJa0apNE/YHmYXsHGcO8gjmV1VNyJuMuWTXPIRuMJHLayrMQDK/P/04lbeNH0tv0p5mFZncsAwkmm7sH0Hhzq3cNuPdlvPhfhIjXaZCLMESogzFfR/dO8HBskGh15FLYQ8g8Oka9Pbi3AY09jdfTxF2xlLOOMYjvNqTOtRGnkNXkOPdypeD1MQji5WM71+DKsjaHRZnxubId0+5oD4buHok4msYK1TXSNVxejTTrKbTQngw+sgfXcis8ERAkVBBcvGQN74ub4yGmKPSmUm+e41eI7RNcf18HNh4SV+2H8QWYO5pL3xDtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9xfYhQv8c1yjtlNlXsbKfEKMI+Cw70b7XfObn+5wHI=;
 b=GstBZUk/6iN8Nzgvu8BAbhRdzxJA4o/8ZBeO1OC0uqFxZ397gHIpck+sddAOWHHwgngpraewHwNlaCZztXQQVpjouV4MKzsb1Ggsa9acT7lsG8Z/FGRkKSs3vhZmU/qVUa6iiAzAyhBccvfqs89V1sVUBwMTnaKo67BTY9UJJHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 08:06:03 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 08:06:03 +0000
Message-ID: <630c5033-f410-a7d4-77c2-a4163fa876b3@amd.com>
Date: Fri, 13 Jan 2023 02:05:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 3/6] drm/amdkfd: Improve amdgpu_vm_handle_moved
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-4-Felix.Kuehling@amd.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <20230112013157.750568-4-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:610:4c::24) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d326570-2c4e-4c8c-7055-08daf53d0382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Z1pMtDkV4bxrG13L7IZfhxe3aOrnUGbygp1t0+LhUhk1Ama36hpbTwlehU/dggW1R1KHUc1kk/Z9023G0xAKsD07oUjwIVjEFZBYbyoQ+YX26yHrUNx/WGD1FM2j1Ro+O9It7Aafmiklc2Hox6LsFvRy6pJx0Z5poN9l9Fe8JJQ1BDHl5fFHUYRe0Iu4reueq35o9GniTwAjsRtMN1WRBQNd6FRnbkP0RnUDdwWfU52CvgqXJZ3NqFz9b6hPFpKfSwjR0FDec69u2dpmkvEmqNvIDEM2yEN0Rg+BnTlEHqUEc0S8CGV/fuHIz30zAvZxMmTMyErPIB7GhgWNBKFaF9a28FKgGz9gYWUxefVmRRYKVeAbPkMAspUxOEuoGYt/PvVtx86sJcWCgQvGJdWcAoSPhBmF07QXdQUjxgGQsyCZ3Vc4T0CKJMG04aBAPMMryMgsF4Zc40pbXYEpkO4lUEgxiAtZ1lJkIQWRTxYJXZiQZQSDqtjdxjKEgfc3EtriebycbkSmx7Gzs85xD/4vchv/6d18b8okBDTNGdWf2k6y7iHIehTi3fHQQWEZW8lEeh7DJxMM9dGAEehox5UAzr6eUiPE58d0yFfJSoDIq0FEASVEvK8UorCA6lViPSh1ZoyGsHOa9Y6usLb9MEGo9RM7AkSHK/3efx7VQi/MWizALf75dJGm1Ex7uT68x11l7R3D9RkRgt+JZyg0GeiCZzlin9uEl8fP9XoSDkcL/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(6512007)(31686004)(186003)(26005)(478600001)(53546011)(66946007)(66556008)(316002)(2616005)(6666004)(6506007)(8676002)(450100002)(66476007)(4326008)(6486002)(66574015)(38100700002)(8936002)(5660300002)(41300700001)(86362001)(83380400001)(31696002)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFkbkNCS1lSaWJPVzRuUWR5OEQxYmw4RjFWOTFWNDdSRG5FN3B6SW40UkVj?=
 =?utf-8?B?Z3lMOVVHQ2EwMEZ2MHJ1V3hoV0hOZGgzT3V6QUJqNWRMWG1tNll5ZlozaDhl?=
 =?utf-8?B?VmhibFMxZFNadWNja1hQUkdBVTA1TWZaUFFQWGdGQkVFMlBKcXZ1SkpBY05p?=
 =?utf-8?B?WVg3RmJ0Z1NqbVFrVTFTZHRHYkxCRzl5bW9uT00zbnBvOThrZnd4UUMyWFc2?=
 =?utf-8?B?dk8rUUdBVnVlU1Q1aDhNUDdpWHZydk5oNEVzZWpZL3RjMFlHS05jajlkbWhN?=
 =?utf-8?B?MHVDbThxQWMzNjFtWU1JTmt2d3dpNmZxdi9hYklYQ0RVTGlkV1FYTkR4SGxu?=
 =?utf-8?B?YzlNSVdOenRkenA0VkF0cHhBWG9TSjd6TzFvWDcvaHZ1YTNMMTJsdGhiYXJT?=
 =?utf-8?B?UU9UYlF1ZFRZdG9OTUtNWCtMKysrcmEyTngweFBtdDM5YTc0cmg5M2RyV3VQ?=
 =?utf-8?B?T3E5UjdIWFNnTWlZejM2QytUUklJQ01VN0FFSW82NGI3MnZhaWZXVmp3RDFm?=
 =?utf-8?B?enIzU1pvQ0pTa09hVVNnZmxIM0FHbUxQaE1zay93WGNQQUxVNzhSOU41ZDdX?=
 =?utf-8?B?MHdRR2djNXZsNm1rdFRkcE54KzZJVWt2QUlaSFAxQi9jaHVMTTRPVTJpNDZS?=
 =?utf-8?B?VDZzcTZ1Ym4rellaaWtyQnNrSG5ET2l3dWFLQXo1N29QdWV3VmxDYkpsK1hW?=
 =?utf-8?B?NC9kem56QWEzMEMvYkRrMk55RloxYTlvYlROQ0dzeWFZSTRxaVZEb0pycnlt?=
 =?utf-8?B?anJqY3grdXUyc3R2ZTJad1dtK2NsaTRPdWdTS0FhOHAwcEZ3MVh5SXBJdHAy?=
 =?utf-8?B?eWhIOHRaZFJDcEZWaU5NcWdHekF2cTVmNXUycWZIVU4yM3YwQzJ5RU9hWUZz?=
 =?utf-8?B?Q3ZubEVuRTFhdnQ5RWtRa3ZPcWRXRFFwSGpKeDZ0YTF0TlhCVm81clZ1bUVW?=
 =?utf-8?B?Si9WUHFidWFnd05YNVpxNkJSNXpNdXVzUU9RUUhpbUUxWUFQQy9VallIS1Jh?=
 =?utf-8?B?WUVZcVdndEFXYm1kQVRTelgvSW5YNVpoVGV3blZmODlZc1JjaEJlM2hlSVBt?=
 =?utf-8?B?UWp6WEtJUk9wcUtRWEtWaThFUE9IcTRZcjB6V09YV3JuSlFIUXFROGcrOTEz?=
 =?utf-8?B?cTJqTWVKcGkwUk5qS1BnYndHUXFPTnNCa3cvTFdlNFlEamZ4c1FlWWkyeTdp?=
 =?utf-8?B?VUpwOU5wTDVVRlQwUkRvWURrcks0RThLSGhGd0p2cm9WR0FJZlNYVnFSZElS?=
 =?utf-8?B?WnlVYm1nNkRXQ3pIMU9rMFNPc0VhRXlKRTJvNmhhUnE5ZTNVRUFkS1dnZWlQ?=
 =?utf-8?B?c3d5bEl0T0tQOFdrM1RkWW45TjIwMkZrbFVCVU1JNlFPUlUrVnZtS28zZ1Nm?=
 =?utf-8?B?em5qWXQ0RzR2ZVJha2hFQ0tNM1JXY1g0a1pOYXB6TVprdFdjQ1U0YVVnWnZY?=
 =?utf-8?B?ak8wUGIwdWRPeEt6QWFxdDRVRGdZQ0VWbHMrdWgwQzRReGVHVC9lUUJWYlJS?=
 =?utf-8?B?K2pWdW5MYm0xQjJnMEE4OC92YnV2eHdIS2phZWs4bFFLUzkwQmVqNXVUZkc4?=
 =?utf-8?B?ZytLa3RiV3lFTkoxZEVvVWMwL2JSb2V0Vzdjd2E3OURVSnFkWUt5R2YzcWc3?=
 =?utf-8?B?R0tINnh5a1NzNW1jZk1QdTQvbm1PU284RkRIVng3TVlKa1R0Y3ljOTZ1Y05z?=
 =?utf-8?B?OXpiWVQ0MVVIUXpiTjRYWmhDZGJFUHpVeThMRVJ5SHdGSm94RFJISUgrb3JV?=
 =?utf-8?B?Ui92U3NyVDBtR2tzdG4vR2V2NWNHVHRPUlRvbHZkMENyRXQxN0h6N210ZVdP?=
 =?utf-8?B?R2h6TVVRck9nMkxQTDk3YW1TMGpGRCtYV3ZCSXIvdEVGRWYzMzdGTjZ6RHJy?=
 =?utf-8?B?cHZvYVNTY3JTNkUrTnpuTmdSdytWNkZaZ2FqWHlFWXFoZ2FLVzAveVR1Y3R6?=
 =?utf-8?B?cmZMYVNLVEVLUFh5UWhLYkRvTkxLN2ZvcFg0VlI3UHQvYlhJT3grTWRKejJJ?=
 =?utf-8?B?NVVlTnA1OWFzdnA5b0ZzUGlIWjV3VEhlMWw2SjlvdGlqTkVDQlJIQWdGRkNX?=
 =?utf-8?B?QmozL2dCd0wvbEVZZjFUVFN4ajgvQTc5Y2llWE14YXBKOFVqRTk4Q3ArT0FL?=
 =?utf-8?Q?7368=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d326570-2c4e-4c8c-7055-08daf53d0382
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:06:02.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9X8Uf+ifbAVnm7E6Y0EYrIWT8lSXNgRE0gUfCzoutIlizLByuxrS1hKa0xQROb4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Xiaogang Chen

Regards

Xiaogang

On 1/11/2023 7:31 PM, Felix Kuehling wrote:
> Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
> the caller. This will be useful for handling extra BO VA mappings in
> KFD VMs that are managed through the render node API.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
>   4 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 275da612cd87..a80d2557edb2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1121,6 +1121,10 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   			return r;
>   	}
>   
> +	/* TODO: Is this loop still needed, or could this be handled by
> +	 * amdgpu_vm_handle_moved, now that it can handle all BOs that are
> +	 * reserved under p->ticket?
> +	 */
>   	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>   		/* ignore duplicates */
>   		bo = ttm_to_amdgpu_bo(e->tv.bo);
> @@ -1140,7 +1144,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   			return r;
>   	}
>   
> -	r = amdgpu_vm_handle_moved(adev, vm);
> +	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 271e30e34d93..23a213e4ab2c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -404,7 +404,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>   
>   		r = amdgpu_vm_clear_freed(adev, vm, NULL);
>   		if (!r)
> -			r = amdgpu_vm_handle_moved(adev, vm);
> +			r = amdgpu_vm_handle_moved(adev, vm, ticket);
>   
>   		if (r && r != -EBUSY)
>   			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index dc379dc22c77..75dae2850e75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1286,11 +1286,12 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>    * PTs have to be reserved!
>    */
>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
> -			   struct amdgpu_vm *vm)
> +			   struct amdgpu_vm *vm,
> +			   struct ww_acquire_ctx *ticket)
>   {
>   	struct amdgpu_bo_va *bo_va;
>   	struct dma_resv *resv;
> -	bool clear;
> +	bool clear, unlock;
>   	int r;
>   
>   	spin_lock(&vm->status_lock);
> @@ -1313,17 +1314,24 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>   		spin_unlock(&vm->status_lock);
>   
>   		/* Try to reserve the BO to avoid clearing its ptes */
> -		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
> +		if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
>   			clear = false;
> +			unlock = true;
> +		/* The caller is already holding the reservation lock */
> +		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
> +			clear = false;
> +			unlock = false;
>   		/* Somebody else is using the BO right now */
> -		else
> +		} else {
>   			clear = true;
> +			unlock = false;
> +		}
>   
>   		r = amdgpu_vm_bo_update(adev, bo_va, clear);
>   		if (r)
>   			return r;
>   
> -		if (!clear)
> +		if (unlock)
>   			dma_resv_unlock(resv);
>   		spin_lock(&vm->status_lock);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 094bb4807303..03a3314e5b43 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -400,7 +400,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>   			  struct amdgpu_vm *vm,
>   			  struct dma_fence **fence);
>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
> -			   struct amdgpu_vm *vm);
> +			   struct amdgpu_vm *vm,
> +			   struct ww_acquire_ctx *ticket);
>   void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
>   int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
