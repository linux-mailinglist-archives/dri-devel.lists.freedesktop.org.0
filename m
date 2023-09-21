Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D0A7A9230
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371AA10E573;
	Thu, 21 Sep 2023 07:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526C510E573;
 Thu, 21 Sep 2023 07:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5ElhLLd07T1AYHp7AU2b2DckkqLL1krNVfFgIfgAAplbVcXwKxfsgtBey9gKOYNb1nt+PlxUTkXYoguw60ozuWfFO+POwzgziwhqM10ugyAL6xOLITBT9OQCEY8tM5Fm43ReWNFGTMDqq9AJ6VygTUYVD2As97NaM4VPl/Sw4i3llQb2ebPDZP4HKXV/tdJGY3aCgUBeqG42rwjoEDbAlXEgHTYog+kKnVba4X0JzpuuVlueBn+gffwTI7+MCyEC9IuW4oLBIdaPWhQ1DLbfDLhEIRfB5cs85OhbdxdY6fG1Oz8Ltg0jBPjzBUsg9GYhvka/8xPc+DsFBx0PZIv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I8ZTFM0TYPVRKX+xRp/8N7svLu4T86/ECyoxQdGzJs=;
 b=mkGsSc1xqV/T6nnoCsLlYiO2K9ssVTc1Tt6rhSuMmWYNjxrZ/EEgUCE1qButzVUj4GM8KuxsGJXBwPZuL8AOTFZzIyf4bOkirGosbWsL/9VY23wnuXBH8yPBIai7E1LFG7GhdMzsjdQ5v7ycfMNq3nfCJhm4fqeuPMDCAuxYHcZrz6kyk1UqJP0uEbSBGqZ5x+PPCdwnPR/YW76k78WFT+WcJiHr6BGVra4Q75gNnAJLECyUIEFWAeJkV5eXG/70iaYF5JHJdDjTFH21Q848scyInLvl5ZEYLocvB0HRcT2r5UOKYc8PLeh/qB6Mv3FA6sNRfIaa4muC+9/Yuyh3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I8ZTFM0TYPVRKX+xRp/8N7svLu4T86/ECyoxQdGzJs=;
 b=GfEKwHXKMZQurNRZqGl1FA4zEcS8XhDmpIWXKqr4+dtP2XWO9P7Xxm7XEHz4v2DftW79v9MrHTiKv+3Rl3PmIy+7EhJs0eOLRR9Ur6nDUMlVjXmkeEf5y3SBaKpf9hc2w0UN/DG+a6Q+2rzvRlohNG6Ev6s6A0M6gmOKqeu9Ii0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB9123.namprd12.prod.outlook.com (2603:10b6:610:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 07:39:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 07:39:14 +0000
Message-ID: <7951dc11-6047-6beb-8ef8-98c862e26ec3@amd.com>
Date: Thu, 21 Sep 2023 09:39:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next v4 4/8] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-5-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230920144343.64830-5-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: 02627924-c1c7-4887-9efa-08dbba75da81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tucGfkQdfiSeqHKKlUgGO+se6m0Efoj4xwSJ7z+mDy8xCqJcqbIHNwpedB+RbL8rmTHkJf2V01xURbjKTeG6tpAf/fkoCKXFoqi6XP4tLwuHzfqtMNA57OxFlDBVvGqHhfpTE1trjhPHMzXu+3WvLBHA+fDsYQSPTAKTHMecURczwN3QZg7NfFeM6tUjXiOOYTgKXtzUwAhm2qsbZlQX8mXBvIKmiCxnJXCw+3caq4fjeR+pXKxCB6a7yUFm1OEb4xHCjCgnbTW3Qu74RKAMV7e+6isaKsN0kWKPL4rePiN6baR7De7O65I3NhV+L9YYJvru8mJGQicKbciyQYf2++rZMJu/KgFGvp+ksq+RSjYDbqiRPw4Ea0PcEfwEifXkXOs2t1YldTmy7wXlMMraC47BM8p5J5L7EZdBmvGXmky9rYbbVPKhgh7eEIyhFfUB2sVkrxDFQBMlqo6J+ZV+RfC8DCZ5MeuR48YJlHZXn82F/wOOOK4ngQrnroVlN+6+Tvz6ijn/oqAzSkXmodN07DxBLGq7tmapMcfa3UVPO7wHeayvgxvwPkZ0z/PZz10/M/R0BkNJKJbV94vWyl8EKrOtcBrcHaCwLX6d1n2brPGM5QMqTyX3FIbF3h7f8KkMZeleTKmjEkLkye4A6y99/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(186009)(1800799009)(451199024)(478600001)(31686004)(6486002)(6506007)(6666004)(86362001)(36756003)(31696002)(38100700002)(2906002)(26005)(6512007)(5660300002)(8676002)(83380400001)(8936002)(41300700001)(2616005)(4326008)(7416002)(316002)(66476007)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFoY3FVb0t4OC80Vy8wbWxpbTlIL1RrVUM1UUNGWjgyMmhxWlVLQ0t0eVpC?=
 =?utf-8?B?SGkxd3F5N0lWTFgxLzBsb2ZaUU5ma1Nyb3JkMk5pQ3FpUkY5T3BJb0twUDdh?=
 =?utf-8?B?T2htT3dIRGdMM1kxS0V3VSs0VElYaVJtNG9TN08zWXRsUm5kR3FRRUxMNTd1?=
 =?utf-8?B?Z01JR2hzcEUxL1Y5VFVCWUl4aEtCcVBQUDc2MGFvdWtSL29jUjdpZDA5ckpy?=
 =?utf-8?B?WnpEOTIzQ0tKQ0c5UVlzV1h0dGV1NGxKam8rNWJqQUQ4SjhSb2JoZWNMWWdK?=
 =?utf-8?B?ZElhVi8wdStLampKUnJKWHlxVnQwUUtrQTdmVFlPQmx3V0lsRlhnVEl2T0lT?=
 =?utf-8?B?Y0NtZnYzOEtnU1phKzF0d0FYWmRsZVFMcTNKK2tyUDhjbUsxZmJhQmhFZzUv?=
 =?utf-8?B?VEZ3MlU5dTJiclBDVFZIUXAwdHVETHBlbEYvOFdIWGxNbU1nOWtiSHlkVkU2?=
 =?utf-8?B?UVJBUWhGcHlpU3RRaGRZbkRxSXRFRk9VcTdrRDgvQnkzUk9mN2pjMWd6WFZi?=
 =?utf-8?B?MUZ0Rk41Yi8rcEpNTk9xU3JYclpUSjNNdWYyczd3czJRQUZXSlNINDBzTDVM?=
 =?utf-8?B?OUMxOEVtdkw5Zmt4aGlZbW82ZHRpYVkrcVFBRWo1QzNodkF5TDJmc3dBcXZQ?=
 =?utf-8?B?Zm42d3ZlOENYVHpLTnNXRTZRYmhFdnV6a1R0VEU5V0tjUjJ6SDdXbFJRelpj?=
 =?utf-8?B?RmNFV3ZycXdhaE1WVDZ6V3lac3piUEZ1REZrNVRwa21UbWppcDdXdTY2UGpY?=
 =?utf-8?B?OHllTGhQZHRsZEhJaGxvVnVBWVZlV2FOZEs3QVA3WEVMQ2tUYkFJYXBFMExG?=
 =?utf-8?B?WUJIajduTEwwUnVGZWdvWm1kU0dkMTB3KzNnaTRVc1pTUzg2NEpHZmdkNGpO?=
 =?utf-8?B?ZTRueWRwbW14UzNUa2YrYkR1VnphRUZLa0tzUHFLL0YzSExMTnMySHc5ckRp?=
 =?utf-8?B?REFZMko4MC8wb3pPQUlnZVFEb3dZMTNFZFl5U2doejFnZlNrRHZxTGpkOXNl?=
 =?utf-8?B?UVNEclZjOWc5eDNCTGErUm9RNDZydlUyTG1JM00vR3dLZkR6ZHJXL2FwbXht?=
 =?utf-8?B?VnhUY3lIWkpyRW5iOHI3TmNpN0FtY3c1RnFqZ2paaUlXMnhrbHRCTWlCZytF?=
 =?utf-8?B?SzFKY3J1VmF4Wld6R0pPdkxEM1dFUzhEZTNtTWE3dEN4WFNZaHEwanFwdzh1?=
 =?utf-8?B?UkozdHEvV1RSc0pic3h6bFJidkM0N09kbmdpeW16T2VSQ3hNb3V3TUJLUmJs?=
 =?utf-8?B?MS9tNE1Bb2NNd1hVY21SR3prMEdZblRrTnZhandCZDNHbHl2UXN3YVk4NUhP?=
 =?utf-8?B?VWNUZTNFeFJLZGttSHZCaFlFa0RyQUZXaE9taW03YzZweW1mZHA3cXFzSDZs?=
 =?utf-8?B?YXdzaWZYQnVqNFoveGN4T09aczh6bXNUZXQ4S1lnbmlDUDFFUVd0RHBWREEr?=
 =?utf-8?B?OWU1QU9iMzdqR3FpdzYrdU5yQnlYbnMyY3AzYTJ6NVVIaDhFVWFTdDNuUEpK?=
 =?utf-8?B?NWhXS3FhenVEWDNSYTg3Q1V2UWxmbk4rMk5GMC9GRkJ5RHNSMUFxVGdZMER3?=
 =?utf-8?B?WHZHZ2VaY0NLalk0RWxWc0pGeTFMeVB5OVhRUTh6OHp2WHE0VDZSZDg1RklY?=
 =?utf-8?B?Vmp4aDZyanpHNkNQRlBxUnE4U1pwVGhvUXlacnVNbjFFYVV5YXg3Ym16a3oy?=
 =?utf-8?B?N25aZ0ZNUmc2K1ZrZHpSUy94bUpFWFVrQ0NZL3BRaTJ1ZzFNSmd2OEhUNjNQ?=
 =?utf-8?B?cVNqR3RrbHVsM0pxTkdNS0pqQXUrUUZHVXJVMjRlUEtENVJnR0NHOWJoZVBm?=
 =?utf-8?B?aFZkekF4aXpzUVVKWFRaOUlSWFU3TXNUMGV3SWthUlZxaGFJeVY1bDVtUFox?=
 =?utf-8?B?MTVMVmM1YnhYWGtUNlYvVVF5VDdRNkFTSzdkUGNLQWhReUNpWmhWSWpwN1BH?=
 =?utf-8?B?dDFyMThXbXFDZU95RU80L09PUEhVYWZ3cEpEQ25OaUVMOXJKRGZ2NWdiZVVm?=
 =?utf-8?B?RVdndXRUOUhlODg5OGlieDhDVHY5c3l6ZlE4QWxwWTVQcFA3RngrVG9UL3pZ?=
 =?utf-8?B?NEsxai9BUUpRRjRqNHdSUGFueWd6TWhCeVJLMEltSFNWdFpBUFNxRC95SGVx?=
 =?utf-8?Q?cSPOoGIdk40jATO7uSl3nxbpm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02627924-c1c7-4887-9efa-08dbba75da81
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 07:39:14.4945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOqJu8zsdveR2p5qfhBj4nozUZZGS1t+XIhtgeYgp9ZJtt8C46HXfNNEfYnLZq4Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9123
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

Am 20.09.23 um 16:42 schrieb Danilo Krummrich:
> Provide a common dma-resv for GEM objects not being used outside of this
> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
> external and evicted object handling and GEM validation.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/drm_gpuvm.c            |  9 +++++++--
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>   include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
>   3 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bfea4a8a19ec..cbf4b738a16c 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>   /**
>    * drm_gpuvm_init() - initialize a &drm_gpuvm
>    * @gpuvm: pointer to the &drm_gpuvm to initialize
> + * @drm: the drivers &drm_device
>    * @name: the name of the GPU VA space
>    * @start_offset: the start offset of the GPU VA space
>    * @range: the size of the GPU VA space
> @@ -668,7 +669,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>    * &name is expected to be managed by the surrounding driver structures.
>    */
>   void
> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>   	       const char *name,
>   	       u64 start_offset, u64 range,
>   	       u64 reserve_offset, u64 reserve_range,
> @@ -694,6 +695,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>   						     reserve_range)))
>   			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>   	}
> +
> +	drm_gem_private_object_init(drm, &gpuvm->d_obj, 0);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>   
> @@ -713,7 +716,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>   		__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>   
>   	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
> -	     "GPUVA tree is not empty, potentially leaking memory.");
> +	     "GPUVA tree is not empty, potentially leaking memory.\n");
> +
> +	drm_gem_private_object_fini(&gpuvm->d_obj);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 6c86b64273c3..a80ac8767843 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>   	uvmm->kernel_managed_addr = kernel_managed_addr;
>   	uvmm->kernel_managed_size = kernel_managed_size;
>   
> -	drm_gpuvm_init(&uvmm->base, cli->name,
> +	drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name,
>   		       NOUVEAU_VA_SPACE_START,
>   		       NOUVEAU_VA_SPACE_END,
>   		       kernel_managed_addr, kernel_managed_size,
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 0e802676e0a9..6666c07d7c3e 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -240,14 +240,29 @@ struct drm_gpuvm {
>   	 * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
>   	 */
>   	const struct drm_gpuvm_ops *ops;
> +
> +	/**
> +	 * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
> +	 * dma-resv to &drm_exec. Provides the GPUVM's &dma-resv.
> +	 */
> +	struct drm_gem_object d_obj;

Yeah, as pointed out in the other mail that won't work like this.

The GPUVM contains GEM objects and therefore should probably have a 
reference to those objects.

When those GEM objects now use the dma-resv object embedded inside the 
GPUVM then they also need a reference to the GPUVM to make sure the 
dma-resv object won't be freed before they are freed.

This is a circle reference dependency.

The simplest solution I can see is to let the driver provide the GEM 
object to use. Amdgpu uses the root page directory object for this.

Apart from that I strongly think that we shouldn't let the GPUVM code 
create a driver GEM object. We did that in TTM for the ghost objects and 
it turned out to be a bad idea.

Regards,
Christian.

>   };
>   
> -void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> +void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
> +		    const char *name,
>   		    u64 start_offset, u64 range,
>   		    u64 reserve_offset, u64 reserve_range,
>   		    const struct drm_gpuvm_ops *ops);
>   void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>   
> +/**
> + * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
> + * @gpuvm__: the &drm_gpuvm
> + *
> + * Returns: a pointer to the &drm_gpuvm's &dma_resv
> + */
> +#define drm_gpuvm_resv(gpuvm__) (&(gpuvm__)->d_obj._resv)
> +
>   static inline struct drm_gpuva *
>   __drm_gpuva_next(struct drm_gpuva *va)
>   {

