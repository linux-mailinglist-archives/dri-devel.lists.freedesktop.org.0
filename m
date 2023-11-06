Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D4D7E25E7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC23110E320;
	Mon,  6 Nov 2023 13:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F44D10E31E;
 Mon,  6 Nov 2023 13:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnH70WpB9nLSz/t9jRUx26xs4nrVXLJmQuuo38sCnJkcR0G3jawtSMIlN3TnpDO+P7O1WY73aU4Hdem0wHK2UZ5sTW6Feho9vXnwzSU6+tbo+bkWJAfA2KizBXEMt7ES6hmLVDwiQurWSBjRppBM+Ug5cWErSr3i1UzJbFjc9UV5WSJjlmFiqthkHZIODy1bmi5RyaDslZb1wYvSXfXuwe47OdPjTfS/vzF1x8BonqldZiXGtQB/lJEZLcS74ZCulvYNGtRz41QJoaUijAok8cFpALGYKDEEwUf26S1wnYMoDEQmrn95CMLx1tBuGpmnzzv1aQqZzk5Tm1GyBBmCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJPnn3Be5tG/w9DLVZXxSRRZRIoXSzaCs/Epb+K+cak=;
 b=nH6mQPli4OHiFfW+ShfPYbBoqzgHg/8iXuMTSOwk6CDGEmxMqd+7TTL2XK8K9SzMn7uo/T+HoUmmwNI/a+uDLT7Rt0YdkpvNezaV6fXnC72Jyl7ePk+X2sU3VGjkErc11HJgNeZ1KEQeSScxMqJsciTNQpJl8euct4QIMiuMfF2zKpent0XLWZoCU1YKozvI7ribviYzcX9tieflTesNG/WHNYo3lgdPlh1xHuvVAnZM1j8ZR6W6gnFoDZ3/WVq8sM74P7QG3id17KoIeNjOCh6uQC5e6qv9fi03LrfO2Tb5/S4G+KqxAwqpN4sOCLqJTbBMwu2qWXGJXY2uEeU3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJPnn3Be5tG/w9DLVZXxSRRZRIoXSzaCs/Epb+K+cak=;
 b=5mYdSNHRFHzcdjvRyL7KWBiZNRWWg1dNbVu9AwjeK4ODkRbEZz+1RMj3VEFErcI8q8H1GYoAOF9TyF6CpO+APccAqJEUHgzA73bnyFCPyaUAhdlytL5eB+J6f12eEKHuvwvEIcfoQ2JoVtsncDaK4BCMovetAwkIMATIT0o7nMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 13:44:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 13:44:21 +0000
Message-ID: <d044c075-3030-4d76-b507-398be639fa50@amd.com>
Date: Mon, 6 Nov 2023 14:44:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/amdgpu: Add flag to disable implicit sync for
 GEM operations.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-3-ishitatsuyuki@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231102140436.180989-3-ishitatsuyuki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef1583d-f071-4342-f303-08dbdece7b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9herjFTpF8lOFEJRVZeeIUxDUWy2xwL2nPxljjLbpEVZjImAmxLJgC/hGXA1jTHnJtN046CF8oU7fCJqTGQl8cTVAkwQVXIIZEjQr5eWhdEU+73up41jP9zansbZ1VKFkc0UeQtjPh2O/tEDK7loec5oqd+Z6tf1RBsZBDU3UjLVUKSaRdLr1dJmoPEegM2zcSbb3ve/292lwS4jVmc17imIaUWBSWoIFU3K5GCMqj7BorjKe+7zSCoU5p3zO82b8PrXhQZVZwUBGNOS03dRrzsXzMgnrfP1klB1pgQlTcjQ6qXa/hSNktl55R9d97M4RyEtUevWOVZZ2J7gMIyocYhP36yijQwruOSIpAuDWXYAcC/X0UAzZLWxFlmvSX2BqdyCCc1keIy+khb2iTurIpzem1a2CU5xWO2x5PpmsYt89ixLXtKO8N8sYIDuKraWZ6ufqpvS4OD96mZcfMNRztBZpN49KdG+YT0zX1ApShm1+naNe6YxXDzcCbBPPdQ6DihjYqfv4ghtN33b/oPU2f3RdD39W37CjT+TRSEXmu4aQGt+s81bcUSETtV+QD/oErBxCTBFL8ENz+hnTHX3cb9IlahuY+ZY9yY+oh+Pja4csE5xp800DkbeeySeNGUqRkFNPkXkFqX2IgmaQFEww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(36756003)(83380400001)(8936002)(8676002)(316002)(66946007)(26005)(66476007)(66556008)(5660300002)(2906002)(30864003)(41300700001)(478600001)(6512007)(6486002)(2616005)(6666004)(6506007)(31686004)(4326008)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGY5bGh2VDROOXMzZVNrVjVabERkZGNXOVR2YzBtM1kwamVqNkJHYzRBYkFh?=
 =?utf-8?B?UklGckY3NDNMSWlwU0RQWWF6MTM5NmJ6bjcvdDhrbnVkaVZycmJuT0JJMWlY?=
 =?utf-8?B?N1JORHBudi9EdXdXcDFMaDB0MGd6WEc1NHlSMDdEdUdhTEMyaGRzSVZDU0pS?=
 =?utf-8?B?Y1kya1BoNXQyLzRuZm1GNFlDK0FGVkk2ZzhMeUxwNUVobUJMajJUcTFDL2lX?=
 =?utf-8?B?blk4QjV4ckZWOFpoSWVlazltejZhMmVuby9ROWtEM3FPRFpDd2d6L0xZSXZ3?=
 =?utf-8?B?ZE1vd1M4dWVXTkM4dEsxK0s1S0wvUXRjaUo5azNJdFFaRlB4R0I4ZWFEdDhr?=
 =?utf-8?B?NHp1MDBWdG9GMmFzSkhkQzI1SlExK3ppRUwxOXR1R0lIbU5WQVdFZTltZFZL?=
 =?utf-8?B?WmFlaFZwMnVab2FOSnVta0R3SDZoUmk0TzFLWVU3TDBmd3ViWEpNMk5YR1lo?=
 =?utf-8?B?WXBKakVFNmk4Uk9NZENUV3JJSS8zd2daTmFmWCsxZ3FuMk82Y3BDMlFvT2tl?=
 =?utf-8?B?MWFjdTNUQUdCSFZKYVFSanQvQVJDVHZKUk1rQ0FnVWk3amdXcFRTNG92VStQ?=
 =?utf-8?B?TTRtTHFuYTlnNGJoTWdRWVl3ODE4UHZLbUJPeUR6NmV3bElhTG5Db3dTVzNW?=
 =?utf-8?B?OU9JRVZwanNrSHNzSUZ3ZlpRdjZ1Wmd0V0VLU2RrUkhIMmZ4aExjUGQ0N0ZN?=
 =?utf-8?B?K29GaUJUZlE3MGxuUkhQdGhOSXhWeEsrb3pJbFVPWGI0elAxUGhlWGtlcGFl?=
 =?utf-8?B?UnQwcmVNTkt0aHFLeDJZcHRMYlU2WVViYVJSRSs1TXJuaUh3MWdPd21FOUQr?=
 =?utf-8?B?UDdZMlpDUUxRTHQ2NnNvQzA1d3hmVzYyeUVwWmxUaGQwYjdyMHR6NityYVFK?=
 =?utf-8?B?L0d0bzhkMHJmTjBqSzFxdjNqZXcyZUlVdllxbXZwYVpqa1dPdmx6RFd3YTRQ?=
 =?utf-8?B?ZHRCNlR3eFIyUGsxUTIvQW9PVFY4emU4WE54bkpsVCtKQ1o4NnNFNWxucmNN?=
 =?utf-8?B?VmR4SEpHOExZTWQ3bWJHazVVMndrN1FKQ0hWbXZiOTJVNkFVR2I4bTc1OTA5?=
 =?utf-8?B?eHF1UWhmU0lXOFNkT2RzeUdWOW5Lc09SSzFobUlZQTVrR3dGd01kVkp1cks3?=
 =?utf-8?B?TWtkc2ZYcUNPOHQ0eUl0VmRSNEg2eGErM0lHS3dVOEM5RENtRmFVZDlxR3c2?=
 =?utf-8?B?ZUtIdjFreWZtdWNtbmRUOEk3Tzhod2ZsRnNaZGdlajhCVlA5T0xzZExIR1VG?=
 =?utf-8?B?cFJhTWVvWmhKenMzRFdmOUtVMGZPRE5FRFJQdHkvR1NDQnloL0ZKQnN2b3pF?=
 =?utf-8?B?NkhlMkVyS1V1aTJLdUxVemthSmg3dGRTajRpdnh2eENQR3ZtRkwwK0MraUE2?=
 =?utf-8?B?b1ZVVnVUMzlwaVRUQzJzZzU5bUd0V3phN0p3Z05KZFA2OHJsRVlFN21VWWsr?=
 =?utf-8?B?RGxVQ1A2aUNlN3N1VG9jSW5id08vQVVYMkVVZ3ZJNUdOMW9UYytvMzEyblpv?=
 =?utf-8?B?MnV3RXFjLzNWbjErUEVpdXZDR1dNSitVSHg1TklEQlg4aEdPamFad0IzMmlq?=
 =?utf-8?B?dnk4MU5VTCtVNlBncG1DN3A2NzdaV2sxSkg1MUxwZHMxNDdBOC9KRHpKSldL?=
 =?utf-8?B?SldNNGVRaW1rNmVKNUxndEV5L1ZxK3djNDVBbW12TnJrMVU2TFYxRzV0VGFS?=
 =?utf-8?B?azhoVVNNS0x3WXByUDkyZFZWQ21WdlZRNzZYT1ZRT1dtVktTRUpCQndJVExP?=
 =?utf-8?B?NFp5UXJwTGFWNDIyejJPNFFjRERLeVZxeW1xN08rbXlRa2ZsYldob09xNEVJ?=
 =?utf-8?B?RCtTLy91bHFFejVQMkhQZ1B0U0RUYjlHeXJvK2tmSllobVBUaElpYW1SU0hQ?=
 =?utf-8?B?a3YveXdLanVDZ1dqdURKRGwvUkh1MUYzeXFMbGRYOFJtbXlpczB0ZkxFajIz?=
 =?utf-8?B?K25PS2E5QUxzNDZCZVV1N3l1NDBVYWE2NUxOOTlBOWZnN3pqNzFjZm9xb2M0?=
 =?utf-8?B?OW1RNEFYbjNuM2tlQXhjc2NKQXMrSHZVc1VJZzhSeDIweElhVmwzc2xOOGtr?=
 =?utf-8?B?UG5QTVVpZGw0SHFCSWxXK1J0dVI0VitlN25NTW4wYlFJTllrMDFxdDBwMDk3?=
 =?utf-8?Q?st1A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef1583d-f071-4342-f303-08dbdece7b4f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 13:44:21.7427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJaFwA6BPxNG5FsoV0X515xyqFCx+MrZegvnYzL1Px+/e9UV7pCTySPg3FMtXRHP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7800
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

  Am 02.11.23 um 15:04 schrieb Tatsuyuki Ishi:
> In Vulkan, it is the application's responsibility to perform adequate
> synchronization before a sparse unmap, replace or BO destroy operation.
> Until now, the kernel applied the same rule as implicitly-synchronized
> APIs like OpenGL, which with per-VM BOs made page table updates stall the
> queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag allows
> drivers to opt-out of this behavior, while still ensuring adequate implicit
> sync happens for kernel-initiated updates (e.g. BO moves).
>
> We record whether to use implicit sync or not for each freed mapping. To
> avoid increasing the mapping struct's size, this is union-ized with the
> interval tree field which is unused after the unmap.
>
> The reason this is done with a GEM ioctl flag, instead of being a VM /
> context global setting, is that the current libdrm implementation shares
> the DRM handle even between different kind of drivers (radeonsi vs radv).

It would be nice if we could make this more future prove by not using a 
flag, but rather a drm_syncobj.

You can extend the drm_amdgpu_gem_va structure by adding a drm_syncobj 
handle and timeline point at the end.

If the syncobj/timeline point results in a fence we give that as input 
dependency the operation has to wait for.

And output fence can come later on as well, but that one is much more 
harder to handle.

Regards,
Christian.

>
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 14 ++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  7 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 47 +++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 23 +++++----
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 +++----
>   include/uapi/drm/amdgpu_drm.h                 |  2 +
>   9 files changed, 71 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 7d6daf8d2bfa..10e129bff977 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1196,7 +1196,7 @@ static void unmap_bo_from_gpuvm(struct kgd_mem *mem,
>   	struct amdgpu_device *adev = entry->adev;
>   	struct amdgpu_vm *vm = bo_va->base.vm;
>   
> -	amdgpu_vm_bo_unmap(adev, bo_va, entry->va);
> +	amdgpu_vm_bo_unmap(adev, bo_va, entry->va, true);
>   
>   	amdgpu_vm_clear_freed(adev, vm, &bo_va->last_pt_update);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> index 720011019741..612279e65bff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> @@ -122,7 +122,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		}
>   	}
>   
> -	r = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);
> +	r = amdgpu_vm_bo_unmap(adev, bo_va, csa_addr, true);
>   	if (r) {
>   		DRM_ERROR("failed to do bo_unmap on static CSA, err=%d\n", r);
>   		goto error;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index a1b15d0d6c48..cca68b89754e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -667,9 +667,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   	const uint32_t valid_flags = AMDGPU_VM_DELAY_UPDATE |
>   		AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE |
>   		AMDGPU_VM_PAGE_EXECUTABLE | AMDGPU_VM_MTYPE_MASK |
> -		AMDGPU_VM_PAGE_NOALLOC;
> +		AMDGPU_VM_PAGE_NOALLOC | AMDGPU_VM_EXPLICIT_SYNC;
>   	const uint32_t prt_flags = AMDGPU_VM_DELAY_UPDATE |
> -		AMDGPU_VM_PAGE_PRT;
> +		AMDGPU_VM_PAGE_PRT | AMDGPU_VM_EXPLICIT_SYNC;
>   
>   	struct drm_amdgpu_gem_va *args = data;
>   	struct drm_gem_object *gobj;
> @@ -680,6 +680,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   	struct drm_exec exec;
>   	uint64_t va_flags;
>   	uint64_t vm_size;
> +	bool sync_unmap;
>   	int r = 0;
>   
>   	if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
> @@ -715,6 +716,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   		return -EINVAL;
>   	}
>   
> +	sync_unmap = !(args->flags & AMDGPU_VM_EXPLICIT_SYNC);
> +
>   	switch (args->operation) {
>   	case AMDGPU_VA_OP_MAP:
>   	case AMDGPU_VA_OP_UNMAP:
> @@ -774,19 +777,20 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   				     va_flags);
>   		break;
>   	case AMDGPU_VA_OP_UNMAP:
> -		r = amdgpu_vm_bo_unmap(adev, bo_va, args->va_address);
> +		r = amdgpu_vm_bo_unmap(adev, bo_va, args->va_address,
> +				       sync_unmap);
>   		break;
>   
>   	case AMDGPU_VA_OP_CLEAR:
>   		r = amdgpu_vm_bo_clear_mappings(adev, &fpriv->vm,
>   						args->va_address,
> -						args->map_size);
> +						args->map_size, sync_unmap);
>   		break;
>   	case AMDGPU_VA_OP_REPLACE:
>   		va_flags = amdgpu_gem_va_map_flags(adev, args->flags);
>   		r = amdgpu_vm_bo_replace_map(adev, bo_va, args->va_address,
>   					     args->offset_in_bo, args->map_size,
> -					     va_flags);
> +					     va_flags, sync_unmap);
>   		break;
>   	default:
>   		break;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index f3ee83cdf97e..28be03f1bbcf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -67,7 +67,12 @@ struct amdgpu_bo_va_mapping {
>   	struct rb_node			rb;
>   	uint64_t			start;
>   	uint64_t			last;
> -	uint64_t			__subtree_last;
> +	union {
> +		/* BOs in interval tree only */
> +		uint64_t		__subtree_last;
> +		/* Freed BOs only */
> +		bool			sync_unmap;
> +	};
>   	uint64_t			offset;
>   	uint64_t			flags;
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 2fd1bfb35916..e71443c8c59b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -276,6 +276,7 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
>   			     __field(long, last)
>   			     __field(u64, offset)
>   			     __field(u64, flags)
> +			     __field(bool, sync_unmap)
>   			     ),
>   
>   	    TP_fast_assign(
> @@ -284,10 +285,11 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
>   			   __entry->last = mapping->last;
>   			   __entry->offset = mapping->offset;
>   			   __entry->flags = mapping->flags;
> +			   __entry->sync_unmap = mapping->sync_unmap;
>   			   ),
> -	    TP_printk("bo=%p, start=%lx, last=%lx, offset=%010llx, flags=%llx",
> +	    TP_printk("bo=%p, start=%lx, last=%lx, offset=%010llx, flags=%llx, sync_unmap=%d",
>   		      __entry->bo, __entry->start, __entry->last,
> -		      __entry->offset, __entry->flags)
> +		      __entry->offset, __entry->flags, __entry->sync_unmap)
>   );
>   
>   DECLARE_EVENT_CLASS(amdgpu_vm_mapping,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 7b9762f1cddd..a74472e16952 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -844,6 +844,7 @@ static void amdgpu_vm_tlb_seq_cb(struct dma_fence *fence,
>    * @immediate: immediate submission in a page fault
>    * @unlocked: unlocked invalidation during MM callback
>    * @flush_tlb: trigger tlb invalidation after update completed
> + * @sync_unmap: wait for BO users before unmapping
>    * @resv: fences we need to sync to
>    * @start: start of mapped range
>    * @last: last mapped entry
> @@ -861,8 +862,9 @@ static void amdgpu_vm_tlb_seq_cb(struct dma_fence *fence,
>    */
>   int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   			   bool immediate, bool unlocked, bool flush_tlb,
> -			   struct dma_resv *resv, uint64_t start, uint64_t last,
> -			   uint64_t flags, uint64_t offset, uint64_t vram_base,
> +			   bool sync_unmap, struct dma_resv *resv,
> +			   uint64_t start, uint64_t last, uint64_t flags,
> +			   uint64_t offset, uint64_t vram_base,
>   			   struct ttm_resource *res, dma_addr_t *pages_addr,
>   			   struct dma_fence **fence)
>   {
> @@ -902,7 +904,7 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	/* Implicitly sync to command submissions in the same VM before
>   	 * unmapping. Sync to moving fences before mapping.
>   	 */
> -	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
> +	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) && sync_unmap)
>   		sync_mode = AMDGPU_SYNC_EQ_OWNER;
>   	else
>   		sync_mode = AMDGPU_SYNC_EXPLICIT;
> @@ -1145,10 +1147,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>   		trace_amdgpu_vm_bo_update(mapping);
>   
>   		r = amdgpu_vm_update_range(adev, vm, false, false, flush_tlb,
> -					   resv, mapping->start, mapping->last,
> -					   update_flags, mapping->offset,
> -					   vram_base, mem, pages_addr,
> -					   last_update);
> +					   true, resv, mapping->start,
> +					   mapping->last, update_flags,
> +					   mapping->offset, vram_base, mem,
> +					   pages_addr, last_update);
>   		if (r)
>   			return r;
>   	}
> @@ -1340,7 +1342,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>   		    mapping->start < AMDGPU_GMC_HOLE_START)
>   			init_pte_value = AMDGPU_PTE_DEFAULT_ATC;
>   
> -		r = amdgpu_vm_update_range(adev, vm, false, false, true, resv,
> +		r = amdgpu_vm_update_range(adev, vm, false, false, true,
> +					   mapping->sync_unmap, resv,
>   					   mapping->start, mapping->last,
>   					   init_pte_value, 0, 0, NULL, NULL,
>   					   &f);
> @@ -1572,6 +1575,7 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
>    * @offset: requested offset in the BO
>    * @size: BO size in bytes
>    * @flags: attributes of pages (read/write/valid/etc.)
> + * @sync_unmap: wait for BO users before replacing existing mapping
>    *
>    * Add a mapping of the BO at the specefied addr into the VM. Replace existing
>    * mappings as we do so.
> @@ -1582,9 +1586,9 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
>    * Object has to be reserved and unreserved outside!
>    */
>   int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
> -			     struct amdgpu_bo_va *bo_va,
> -			     uint64_t saddr, uint64_t offset,
> -			     uint64_t size, uint64_t flags)
> +			     struct amdgpu_bo_va *bo_va, uint64_t saddr,
> +			     uint64_t offset, uint64_t size, uint64_t flags,
> +			     bool sync_unmap)
>   {
>   	struct amdgpu_bo_va_mapping *mapping;
>   	struct amdgpu_bo *bo = bo_va->base.bo;
> @@ -1608,7 +1612,7 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>   	if (!mapping)
>   		return -ENOMEM;
>   
> -	r = amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size);
> +	r = amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, size, sync_unmap);
>   	if (r) {
>   		kfree(mapping);
>   		return r;
> @@ -1633,6 +1637,7 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>    * @adev: amdgpu_device pointer
>    * @bo_va: bo_va to remove the address from
>    * @saddr: where to the BO is mapped
> + * @sync_unmap: wait for BO users before unmapping
>    *
>    * Remove a mapping of the BO at the specefied addr from the VM.
>    *
> @@ -1641,9 +1646,8 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>    *
>    * Object has to be reserved and unreserved outside!
>    */
> -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
> -		       struct amdgpu_bo_va *bo_va,
> -		       uint64_t saddr)
> +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
> +		       uint64_t saddr, bool sync_unmap)
>   {
>   	struct amdgpu_bo_va_mapping *mapping;
>   	struct amdgpu_vm *vm = bo_va->base.vm;
> @@ -1671,6 +1675,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>   	list_del(&mapping->list);
>   	amdgpu_vm_it_remove(mapping, &vm->va);
>   	mapping->bo_va = NULL;
> +	mapping->sync_unmap = sync_unmap;
>   	trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>   
>   	if (valid)
> @@ -1689,6 +1694,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>    * @vm: VM structure to use
>    * @saddr: start of the range
>    * @size: size of the range
> + * @sync_unmap: wait for BO users before unmapping
>    *
>    * Remove all mappings in a range, split them as appropriate.
>    *
> @@ -1696,8 +1702,8 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>    * 0 for success, error for failure.
>    */
>   int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
> -				struct amdgpu_vm *vm,
> -				uint64_t saddr, uint64_t size)
> +				struct amdgpu_vm *vm, uint64_t saddr,
> +				uint64_t size, bool sync_unmap)
>   {
>   	struct amdgpu_bo_va_mapping *before, *after, *tmp, *next;
>   	LIST_HEAD(removed);
> @@ -1761,6 +1767,7 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>   		    tmp->last = eaddr;
>   
>   		tmp->bo_va = NULL;
> +		tmp->sync_unmap = sync_unmap;
>   		list_add(&tmp->list, &vm->freed);
>   		trace_amdgpu_vm_bo_unmap(NULL, tmp);
>   	}
> @@ -1889,6 +1896,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>   		list_del(&mapping->list);
>   		amdgpu_vm_it_remove(mapping, &vm->va);
>   		mapping->bo_va = NULL;
> +		mapping->sync_unmap = true;
>   		trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>   		list_add(&mapping->list, &vm->freed);
>   	}
> @@ -2617,8 +2625,9 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   		goto error_unlock;
>   	}
>   
> -	r = amdgpu_vm_update_range(adev, vm, true, false, false, NULL, addr,
> -				   addr, flags, value, 0, NULL, NULL, NULL);
> +	r = amdgpu_vm_update_range(adev, vm, true, false, false, true, NULL,
> +				   addr, addr, flags, value, 0, NULL, NULL,
> +				   NULL);
>   	if (r)
>   		goto error_unlock;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 204ab13184ed..73b7b49fdb2e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -423,12 +423,12 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
>   int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   			   bool immediate, bool unlocked, bool flush_tlb,
> -			   struct dma_resv *resv, uint64_t start, uint64_t last,
> -			   uint64_t flags, uint64_t offset, uint64_t vram_base,
> +			   bool sync_unmap, struct dma_resv *resv,
> +			   uint64_t start, uint64_t last, uint64_t flags,
> +			   uint64_t offset, uint64_t vram_base,
>   			   struct ttm_resource *res, dma_addr_t *pages_addr,
>   			   struct dma_fence **fence);
> -int amdgpu_vm_bo_update(struct amdgpu_device *adev,
> -			struct amdgpu_bo_va *bo_va,
> +int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>   			bool clear);
>   bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
>   void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
> @@ -444,15 +444,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device *adev,
>   		     uint64_t addr, uint64_t offset,
>   		     uint64_t size, uint64_t flags);
>   int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
> -			     struct amdgpu_bo_va *bo_va,
> -			     uint64_t addr, uint64_t offset,
> -			     uint64_t size, uint64_t flags);
> -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
> -		       struct amdgpu_bo_va *bo_va,
> -		       uint64_t addr);
> +			     struct amdgpu_bo_va *bo_va, uint64_t addr,
> +			     uint64_t offset, uint64_t size, uint64_t flags,
> +			     bool sync_unmap);
> +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
> +		       uint64_t addr, bool sync_unmap);
>   int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
> -				struct amdgpu_vm *vm,
> -				uint64_t saddr, uint64_t size);
> +				struct amdgpu_vm *vm, uint64_t saddr,
> +				uint64_t size, bool sync_unmap);
>   struct amdgpu_bo_va_mapping *amdgpu_vm_bo_lookup_mapping(struct amdgpu_vm *vm,
>   							 uint64_t addr);
>   void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct ww_acquire_ctx *ticket);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index bb16b795d1bc..6eb4a0a4bc84 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1291,9 +1291,9 @@ svm_range_unmap_from_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   
>   	pr_debug("[0x%llx 0x%llx]\n", start, last);
>   
> -	return amdgpu_vm_update_range(adev, vm, false, true, true, NULL, start,
> -				      last, init_pte_value, 0, 0, NULL, NULL,
> -				      fence);
> +	return amdgpu_vm_update_range(adev, vm, false, true, true, true, NULL,
> +				      start, last, init_pte_value, 0, 0, NULL,
> +				      NULL, fence);
>   }
>   
>   static int
> @@ -1398,12 +1398,12 @@ svm_range_map_to_gpu(struct kfd_process_device *pdd, struct svm_range *prange,
>   		 * different memory partition based on fpfn/lpfn, we should use
>   		 * same vm_manager.vram_base_offset regardless memory partition.
>   		 */
> -		r = amdgpu_vm_update_range(adev, vm, false, false, flush_tlb, NULL,
> -					   last_start, prange->start + i,
> -					   pte_flags,
> -					   (last_start - prange->start) << PAGE_SHIFT,
> -					   bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
> -					   NULL, dma_addr, &vm->last_update);
> +		r = amdgpu_vm_update_range(
> +			adev, vm, false, false, flush_tlb, true, NULL,
> +			last_start, prange->start + i, pte_flags,
> +			(last_start - prange->start) << PAGE_SHIFT,
> +			bo_adev ? bo_adev->vm_manager.vram_base_offset : 0,
> +			NULL, dma_addr, &vm->last_update);
>   
>   		for (j = last_start - prange->start; j <= i; j++)
>   			dma_addr[j] |= last_domain;
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index f477eda6a2b8..3cdcc299956e 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -556,6 +556,8 @@ struct drm_amdgpu_gem_op {
>   #define AMDGPU_VM_MTYPE_RW		(5 << 5)
>   /* don't allocate MALL */
>   #define AMDGPU_VM_PAGE_NOALLOC		(1 << 9)
> +/* don't sync on unmap */
> +#define AMDGPU_VM_EXPLICIT_SYNC		(1 << 10)
>   
>   struct drm_amdgpu_gem_va {
>   	/** GEM object handle */

