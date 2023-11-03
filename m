Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151EE7DFF5C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 08:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E15710E48A;
	Fri,  3 Nov 2023 07:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FE310E484;
 Fri,  3 Nov 2023 07:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeAC1ueOBP4NOidIVfRygaOmnf2Vr6Wdfp5mjMcx7GfH2/HRztcYXEjNVDkkkAvJpKsG3yMLqEWYXbW225HtgUrT+8/zPtzR1Py6fzy28xH54ymttg44UEy/A9+0k0jDIsb15LWsrsdyFGrOyockkKv5nVxNYUQ61YXPyRCGP+FEevpWNbg5nL7AkZB30ny80rF55zdXr2aLW7J72KEG68yZINFtUvyJlEsDqu2N4vFQQAnwdzIanTukrdHJ9l0h98AU0zUtEkQ4IG3e8ZNPKr+VwNBZOz84D4gtacpwXDvOD7jJ6gxsAvf6pBWXqxEr2NBgQwFyMuVw6FZ+zFZoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RL+JnlpMR0gHVgIZYD/RvWW1VOSrdfZmLmV5YjJauSc=;
 b=d7E+rSg/UI5lSqYM7kcWN3aP+q7SLQOK+74MHrbtKuqg3xvH/qs2uWjbc4g/wtAztBYWvsbEJgV59TbjCqzpDoSPo8KbZ5FOAgCVAmSR4j9KX42CxxQEX5hwUwI6sHJdcC2oRTKuQk0klxrTpAIG71dOJciM/UFx/xr2ymNt8akJMQHQSZ7tvD9zPlXS+bSGSGUYOQV2g0tbyDU8rAOe0OGABPM719GwVPpIrcBA3IrOhwbYDd2GBSpf9NFhuELZ486hWXZZs5XNw52IcJYZvtTIwQL2aUCanX4lJ9AUd7/0AjOV3TcvWbuKquWgpo8YqzJnN8komtalmNIOVktemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL+JnlpMR0gHVgIZYD/RvWW1VOSrdfZmLmV5YjJauSc=;
 b=EGVg4JouQNMRsqn+twd6Q/66bXpicgjNo02epzQ2+2YqnQH8Ac5EOQJpKY6Y7WTa/cwHGXrfVNJOqkOLaxuwhj0d4/JeOQlgur944/eLMWN4v2pUZalVXMGW/+3KgH6BHKwCj8e87myLX7NqvM+sFAYIYjso9iBmCeqeGg1bYNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB7001.namprd12.prod.outlook.com (2603:10b6:806:2c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 07:18:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 07:18:40 +0000
Message-ID: <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com>
Date: Fri, 3 Nov 2023 08:18:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith@gfxstrand.net
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231101233113.8059-10-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 79049052-6f1b-4ff1-eda6-08dbdc3d1ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tmTI+2sYqj1fcuTFA69WYAQdcu4rwtU9buEs4a0FHfyKIEExXtXMvQUb10RU4b0NMJc/sl2YM1tulnEfnRbi6KJHu6iPTKhtRV1/qRjqctr8PRK/qeWmFXcMKDsDnBl36QVZeZw/JEzcf3TQ3DAezMp4xxx8+WgSf0/UR3p4LXGG3AlPHn/zpeKkCfda6Uw5GWpLhVHVVXPj7cB4ABLkRuQDhFSiZCXgLgNr1/1gXbYqZ9XQJRtBEU6gD7xy0yw0vMDmJxQPVWKFjuA4lyN5WBncEdDXGQBq5Azk2vBpX5PO1sE2TcadxKIOdSkfw+WedqkG6UagU/V+W4ag4myMR/E+6tE7e+3BFS79wCSRq01lD3ARfYNmiI9p2QKx6HnVlXuPehdGg7lfQN7Fi/X1hybiIMC6qUsBQJecTwj+geTieyYtPoGPDVJeddnmnUuxXBtBQU4Db1vvBY+NlMAnRWqZWWXkiy0prp/jG2CMRqDhZaMffF0AvK1FPSc1wuJhph43s1B6DYgF6Y9EoGgeT6s3frOccnLUhd6x8JfY57A41hre+e55bWeFoXVbPZafyjFsQLRHNEd2fmltCXBe5SNocFzLfkSc2NnjAUqSVdmSmV5/Ifm8PVzIz+Mg8bRHKRLVMxGu/ksz+1JyTqMbCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(83380400001)(38100700002)(2616005)(4326008)(86362001)(7416002)(6486002)(31696002)(8676002)(8936002)(2906002)(41300700001)(6506007)(66556008)(6512007)(6666004)(5660300002)(316002)(66946007)(478600001)(36756003)(66476007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1lWklXbHgzWXloTlBKbUk4UVJiZ0k0M29wV1lyV2lzTkgxZmc3QUc1Q2o2?=
 =?utf-8?B?dm5OUGJ6TldUTHZES3NwSzJBY2ZpZW0zYnZWVkZyNVZhSGJIQ2V3QTJ6T2Q5?=
 =?utf-8?B?OHNWN0Myd25paFpraGZSK0VQbUx6Tmpya3pWQ1MzWnArMWFyV1lvdkdnZ1hn?=
 =?utf-8?B?YTFmTGFJbm4vNklNOVpLaFFHRDBzVGc0b2c3anB4a3U1VUNrUWMwOEVBbThp?=
 =?utf-8?B?dTBrV2I1R3NwUnBlUU1IQ25CWUZJTGpIdUtkS2wxb1pRWFl5enVVaFNHZVdu?=
 =?utf-8?B?UThUclhrTzZGU2c3V3UyV2FEL084cWdKZk5Dekt3UXR5bVhJKy9qeHF0T2wv?=
 =?utf-8?B?UDRFb242dHhORHR1R2hZcUp2eXVnOUNPVnl6VFNCV3NpTjdjV2cxMnp3YjEy?=
 =?utf-8?B?Qjk0WnNLRmtLMTE5cDF2a0JlZGpWZEh6Z3YwU1BqMytuNGk1OUpSN0dLa0JZ?=
 =?utf-8?B?Z3MxQzljd1ppUUlVZmhpRXRTUW1ibWtlR04wSVhKbGY3STlsSkdFT0hIVE83?=
 =?utf-8?B?aHcrK3ovUTdOT2ZwZnhCaXlRdThmblNkTUxXNVpFYzVnN1dCakQ5VzNRaXV0?=
 =?utf-8?B?VHVsakxFUkVwVktkd09OTFZ2WkprR002THBIZU40aU5nMjQxbStKWUt0RHh0?=
 =?utf-8?B?UU1BVmMva2E1NnkrcFZsOGRFMEY1TnRqd2owM2Vlb0pWSEpXejFNWk5vTDdY?=
 =?utf-8?B?N0FRTTFJQ08xWHdLSzBIMGczbEsrRWhoK1BvUkFVeHZ5QVZVRDhOZG5lYTFy?=
 =?utf-8?B?Q2N6UHp0VFNUN0dLZmJSSENza0NsVFN4cVp1UitTS2tWN1JYTnBZbHIxbW03?=
 =?utf-8?B?eUlTTFZjZEFWVHZjV3ZLU3plSzdGOExmbFVpV0lNM1JEUFIrb2FjU2l0UFBi?=
 =?utf-8?B?MXZXQ013a0NKS0ZWeCthRFVKYXNpUUxaSFJnS1dtNENaOHVHMUhkSS9ZVnhY?=
 =?utf-8?B?M3BqOEo2ZkZENHd2VTlmS0krYlYzUmpSS25DODhSQnU3UythQlFrUHRBcDli?=
 =?utf-8?B?ZVVEVlpSak5ZY1NGVkxqR1U5cTFIbGNhTnhaeWRkTEpkQVNPSWl3K2xUY1dx?=
 =?utf-8?B?NmJ4RVlVV0I4UVA0ZmRnQWZ4QmwxcjdEUy9JYUhGV0daczJ3TFZsRkNvVkFB?=
 =?utf-8?B?enFrL1ZuTWJIQnlkYVhhallyS3lwdEh2QVB2amdKNGdvTC9GY0ZOY0htbjJt?=
 =?utf-8?B?Z3FCaXFLbFNmRzFxNW9sV1MwR3VYV3QwcVRxUXBYQXFkTkhKSk0zcEdqREly?=
 =?utf-8?B?THJEaEF4SFdmTGhoQks1L1hWRllsdXlwb1B5WkZTdTdqblpFaFc1aW5SUlor?=
 =?utf-8?B?ZEFVWXVBaVdBalowZkNHZ1NkRm5MZExZWEp5RGdmenI5VlVHeE1yMVI5OUwy?=
 =?utf-8?B?bHNxSXpSS0VMUTV0RWZSRE85bS9POFhxd2NncnNvUkhWNzF1dXdJSThHeENM?=
 =?utf-8?B?WmI5T3pRRHZMMGVMa09Dc3VnYnNFdGFiOFA0ZkYwRmJBLytESm9HM204d2Nm?=
 =?utf-8?B?aHcrQzJPVHI1SytNZFU4UHVaNzhBM09DYUNLVDNtZzNGbGxRQ3JYeFR3d0xO?=
 =?utf-8?B?Z3ZSQTdUTzNwcDZUTzFrNUZhaXJqdXJCL05WcDR3ODd2MlYyOXFMa210MC92?=
 =?utf-8?B?OGNaM2NSWXNOUHhCdUN5TWFWMCt1dWFtMHBPb3RxU0J0Q1pQNTlBbnNSK3JY?=
 =?utf-8?B?ZmtZZ29uYS9kK2N1bE9jRDE1TW9SSGxLcU5pZ0tyUTlPbG42SEZZc29TamlJ?=
 =?utf-8?B?OUxKR1FwTWNqUThJSS9TQkljRko1UU5HL0p0QlJMRmcrazg3MWx1dkxETXBL?=
 =?utf-8?B?VEM2RXFXc0dSUjh0Wks4RjI2M2pybStGaUJFN3hFZEpVazN2aWdEOGptQVhN?=
 =?utf-8?B?b21Db0dMbFhJWGFrQ2xZNW5SdllReE5GbHRvLzBwOWdhRUJhR3gzZjRSMXRm?=
 =?utf-8?B?dDk4NUhJV3NzZnBpSG9ib2dKR0RmSTdDbCtvZ25KZlJ5NXRDUVFad3pWZWNI?=
 =?utf-8?B?b1VQaVZnWGZadlpoekhYVWNYZUNsTmNxSUJ5d2lJbW94L3ppNlpGZUFaUXNm?=
 =?utf-8?B?S0hwdHlXNmZ0NjNUZUVTVE1iNEhrcm1zWTdTQzY1NHRIQVl2TmI1OHNGTDhp?=
 =?utf-8?Q?4sbTRNYC+gpf6g/k3oMIn4FDP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79049052-6f1b-4ff1-eda6-08dbdc3d1ae1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 07:18:40.6892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59RCy46+VjKqV/vMPOnDNJGKWadf1CbuxBM3eGFO9b7Rmbwf6dybLFJuqdHMQxdP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7001
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.23 um 00:31 schrieb Danilo Krummrich:
> Implement reference counting for struct drm_gpuvm.

 From the design point of view what is that good for?

Background is that the most common use case I see is that this object is 
embedded into something else and a reference count is then not really a 
good idea.

Thanks,
Christian.

>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-------
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
>   include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
>   3 files changed, 78 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 53e2c406fb04..6a88eafc5229 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>   	gpuvm->rb.tree = RB_ROOT_CACHED;
>   	INIT_LIST_HEAD(&gpuvm->rb.list);
>   
> +	kref_init(&gpuvm->kref);
> +
>   	gpuvm->name = name ? name : "unknown";
>   	gpuvm->flags = flags;
>   	gpuvm->ops = ops;
> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>   
> -/**
> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> - * @gpuvm: pointer to the &drm_gpuvm to clean up
> - *
> - * Note that it is a bug to call this function on a manager that still
> - * holds GPU VA mappings.
> - */
> -void
> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> +static void
> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>   {
>   	gpuvm->name = NULL;
>   
> @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>   
>   	drm_gem_object_put(gpuvm->r_obj);
>   }
> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> +
> +static void
> +drm_gpuvm_free(struct kref *kref)
> +{
> +	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
> +
> +	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
> +		return;
> +
> +	drm_gpuvm_fini(gpuvm);
> +
> +	gpuvm->ops->vm_free(gpuvm);
> +}
> +
> +/**
> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
> + * @gpuvm: the &drm_gpuvm to release the reference of
> + *
> + * This releases a reference to @gpuvm.
> + */
> +void
> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
> +{
> +	if (gpuvm)
> +		kref_put(&gpuvm->kref, drm_gpuvm_free);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>   
>   static int
>   __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>   	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>   		return -EINVAL;
>   
> -	return __drm_gpuva_insert(gpuvm, va);
> +	return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_insert);
>   
> @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
>   	}
>   
>   	__drm_gpuva_remove(va);
> +	drm_gpuvm_put(va->vm);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 54be12c1272f..cb2f06565c46 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
>   	}
>   }
>   
> +static void
> +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
> +{
> +	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
> +
> +	kfree(uvmm);
> +}
> +
> +static const struct drm_gpuvm_ops gpuvm_ops = {
> +	.vm_free = nouveau_uvmm_free,
> +};
> +
>   int
>   nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>   			   void *data,
> @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>   		       NOUVEAU_VA_SPACE_END,
>   		       init->kernel_managed_addr,
>   		       init->kernel_managed_size,
> -		       NULL);
> +		       &gpuvm_ops);
>   	/* GPUVM takes care from here on. */
>   	drm_gem_object_put(r_obj);
>   
> @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>   	return 0;
>   
>   out_gpuvm_fini:
> -	drm_gpuvm_destroy(&uvmm->base);
> -	kfree(uvmm);
> +	drm_gpuvm_put(&uvmm->base);
>   out_unlock:
>   	mutex_unlock(&cli->mutex);
>   	return ret;
> @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>   
>   	mutex_lock(&cli->mutex);
>   	nouveau_vmm_fini(&uvmm->vmm);
> -	drm_gpuvm_destroy(&uvmm->base);
> -	kfree(uvmm);
> +	drm_gpuvm_put(&uvmm->base);
>   	mutex_unlock(&cli->mutex);
>   }
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 0c2e24155a93..4e6e1fd3485a 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -247,6 +247,11 @@ struct drm_gpuvm {
>   		struct list_head list;
>   	} rb;
>   
> +	/**
> +	 * @kref: reference count of this object
> +	 */
> +	struct kref kref;
> +
>   	/**
>   	 * @kernel_alloc_node:
>   	 *
> @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>   		    u64 start_offset, u64 range,
>   		    u64 reserve_offset, u64 reserve_range,
>   		    const struct drm_gpuvm_ops *ops);
> -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> +
> +/**
> + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
> + * @gpuvm: the &drm_gpuvm to acquire the reference of
> + *
> + * This function acquires an additional reference to @gpuvm. It is illegal to
> + * call this without already holding a reference. No locks required.
> + */
> +static inline struct drm_gpuvm *
> +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
> +{
> +	kref_get(&gpuvm->kref);
> +
> +	return gpuvm;
> +}
> +
> +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
>   
>   bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>   bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
> @@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>    * operations to drivers.
>    */
>   struct drm_gpuvm_ops {
> +	/**
> +	 * @vm_free: called when the last reference of a struct drm_gpuvm is
> +	 * dropped
> +	 *
> +	 * This callback is mandatory.
> +	 */
> +	void (*vm_free)(struct drm_gpuvm *gpuvm);
> +
>   	/**
>   	 * @op_alloc: called when the &drm_gpuvm allocates
>   	 * a struct drm_gpuva_op

