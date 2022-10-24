Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E3609A1A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 07:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480B910E25E;
	Mon, 24 Oct 2022 05:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC2110E25A;
 Mon, 24 Oct 2022 05:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5T6z0wYIP0jjIB8mFgLVja0XJyUXfHn89fPix8xwLznFuUu5NYf3o6p1eRvxY0vdHbf/c/IB0rLHMwslZGfuGQ/MFOzNYPhTiNoWtmO6rNJCUbkVP0yHvzfBYKpKCX+q9Byx0hmkxKKGSg/QoPAtAXWgyuSdDQtd+d2XTFDbrQL37LEu1RLok9HC7Jg6obPFQayglD6QQ0N7ZJEJMqQ1szvcpFSJmJijC3q/R+3IlEEm3rNIlM5uArlC1lSbBJi7CXhv+tA6vaecfs8AHEGLuHN/nTCGKK4mlJrVoPMCG74M9BVGIdjAFCEsmKjHSoViHSLq5bKBCD0lJ0zKAk0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hpvCQaUghqLDhvKXU+veE9Iw2Kxlw5HWv5k2ymBsYw=;
 b=RdBghSGWeWA1GBz1QE6Whj8MAsJKOBfMinrAretSoW2y2nOhJMo9Xu0BwFDT927B8EM3ybMRBggmMECi3LksoBJ6znEJq11cDvPICSKlbWGfqeRYfqB0+Wnbzb2LwBz0op5vEPoDDj32d7s0ldaEShYXQMMEdIFRcHAZLofC2XulTO54xdKUc4SIMaWYJbR7cEzoSsSiOurDuvJZL0M6rketa+qJcLXb3qzoY0BW3xxOpbtwNzowebDJJJcQx1nJn3NsOCjHzy2rj0h9ioX/glIPt6snY3BklOyt8iJCMZveh4oYKh9LbhCCSMGf6crgGGrGs+C+OoGx0mLXDhfnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hpvCQaUghqLDhvKXU+veE9Iw2Kxlw5HWv5k2ymBsYw=;
 b=YrMwKKoGOGo6AGCApCwqJrYrGT6ljfdCEGoL1AfW3ItZ14PQYkdMyzxhHozKJxWR49kEnSoT/g9UFReppjUp+WQy64aLbpDVSMQsTArcpW7m+nufiFV4jRbWkf7n49FG8t1z8t445F/TXBKtakJr55kUhU84s1rueSk/i42MMzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 05:55:39 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 05:55:39 +0000
Message-ID: <40be8f6e-a706-a4bd-a398-ed8eec026ac0@amd.com>
Date: Mon, 24 Oct 2022 01:55:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 10/13] drm/amdgpu: use scheduler depenencies for CS
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-11-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221014084641.128280-11-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 2844c587-0775-4fd1-7a9a-08dab58460c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /8Q15cQb4oAWvRJSjm6vnnd5V6DkaDfiVChwcOtmuw7uIlKU9rjUucA689oRXylQjLRyUdnDYJMJz0cp8m0CiseALLutJMzhl744AOecr5P4V0N0eWm+6Q9yDqQ1ICcW/AbEN/rqLlS7rGPp6N+f8V+tOy8PY2+r+ihLkuNbjklHMpfS4w7y1bbdH6Kkl2DMGiU5SMfIUXl+vpnZ1MAY/Ph8+SPiyaPNVtLbHC0Oc+Hta/cfifHIodYTM+ZOHd4uAm+BmrHd2eCf8AihvQQwLWKN+tB92xHZJ3IS2MD5rPdR+kLxzvD4co3GYdOdUBLw46wpzYRKp6/lHoodmKeAs5Lw+lkMhxwV6EWgIomuXsHH6RTr18pwQYpBAjDAAgHmIOoOGknZrZIVeZ0cYQnv0UjWXra4nMBmyFIcn7bUcdwpcLgpJTmLk8fhF9ZkNlAKnuStv9OM2SujThrJFEO6vACR94M/+kgH4MnBchpjJaB7XXtJhV4UTnTtKjCSgY/nTfdi9zSYmjqygyNrJc3cGFpD53Ku8bOlbRpHzVEetxuKH8Xm/IAhg4AsvDYsf+TnSwhQKNimkTgGw0eh3mBn1+0T+oA9+MC5m+ba0+EV8cb0lAoXPE5dJlxDHk7fTm8eUs8wsI0CCEgi9Hwuqilnhiwio7fsfFx1WjkGMYkTPOr2kDwT/5tpvSxXtM0Um7rFlGi7YSFrBSnjOQy/C0stdTZrvQ4qgVqTCdMFaZiOm4IuFEnlQZarREmGruPDNrl40FjmmNIzI9Tlj6vjZhhCQjO5wmaYUfY6Nx+meZ798Fc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(5660300002)(4001150100001)(2616005)(86362001)(83380400001)(66574015)(41300700001)(38100700002)(66946007)(53546011)(31696002)(66476007)(66556008)(44832011)(4326008)(8676002)(6512007)(186003)(8936002)(6486002)(316002)(6506007)(2906002)(26005)(478600001)(6666004)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2krbDF2VU9ETnRyMk5MV2hkd2FzWExJVlRnYTlKT2EvT3BycFBnWnRsVE5N?=
 =?utf-8?B?cnNrTGo1K2VrRE1ZWEVQYWVYTmlzSTZWL1lvTlpKdVlaUTBYT1VrSlFSYld5?=
 =?utf-8?B?WkxONklHQ1B6eXhuU29BcVVGMTkvZENKS0s2VUdjVEd3Q0MxQ04rbTF2ejMr?=
 =?utf-8?B?VWIxLy9odXR0bE43SmkrR2daUHdnL21kNkt1Nm5kWk9zWEFpZk5jWFRQYmRu?=
 =?utf-8?B?OCtWeHZpNWM3SVBNWEZNNUtUdzBXdm5FS0M1YUt4NGhyRlN6d0IzcmdkT24v?=
 =?utf-8?B?R01MZlNaUWM1US82NUs4MmdkSUF6SzZBN1VsUVd5SklMU25ZQVRNUW5KZ1lB?=
 =?utf-8?B?TjkzYWJlVm1PRmpmZjdENTFJYVRqYWE4VVowcTgrbnBSRitROEtJanYxaEZq?=
 =?utf-8?B?QllvSEgrajNSc1NyWlJQZzFXVXQrLytZUVlnN1ZKTS9ET2ducG9uakduYld4?=
 =?utf-8?B?M0tlQmwvR0I5OVNJSzZDQUo4TnBZK0c5aTV1UEFJZ2FwOUJlOTNwWEdQWlov?=
 =?utf-8?B?MVJwbERzcVZvSUFub0F4dlBFd3JRV24xSEl6NUhYcjZ2aHJqVFpzeWhLS1Bv?=
 =?utf-8?B?UWpaNzNHTW81dWEvMi9HWWQwUUw1SUpTMVZiekFUd1RnUFNvS0wrb0V6ejNm?=
 =?utf-8?B?OEJCRHFFdUJlKzdqZmxWaWx2VWFyN29lOVRPTndjTHRRK3ZDK1E0MitRMGd3?=
 =?utf-8?B?L0NlSXJuQnUwdzR3UnBnSE9vTzEvU2IyZ2FESWtxYWdBMmhCT2Fzb0xRenFy?=
 =?utf-8?B?eHVtTjBUT2JHQVd2MlR6b05LT0RKQWJlZUpaNnR0SElaNDFkQ29za2VJNy9X?=
 =?utf-8?B?ZU9DV284N3lNUVhla0lLUytYRTQ3UExlaWhCOEh5ODUvTWlKK2xwVjBzeHUv?=
 =?utf-8?B?alhkUHdkZ1BrZUE2ZUMyK3JJUE4vdmJjSVlDamdFL3FjSS83dXdrMjBEOFM1?=
 =?utf-8?B?bVFVTkQxV1JVcFU1WHpzYzFmTXdBdTdZREZ1Ym5lK3pyZXVHTHVXM29qV1Ez?=
 =?utf-8?B?U1Q0YTVUUHNnbnRVakcyTVlMNjFMOThIdTIyZGVNckc1SHp6WU5abWFHb2dQ?=
 =?utf-8?B?L2Faa2ZjZzdKbmg1Y0lOTGtSL2o2dUY4MkdVeDJBVFU3YjRtQmZ0VWIxaHh6?=
 =?utf-8?B?cnllTUpFY2FzK3gzWGJmcTlHNEZqNTFic1Z3SitjRExqVnU0dG9DNGo5STFX?=
 =?utf-8?B?UXo2bHN5aDJLSE5vQndkTGoyWEpkTVE2UC9PS1FIc0FJWWx4U2hnTkVqeXZS?=
 =?utf-8?B?QXh6R1Nzemg4YTA2dzB5L3plMnd2a3pMOXZzenJBMXd2aHZ2S3pxVU81eGZ3?=
 =?utf-8?B?Zk9YUFk2SWtPbncvdmdYQjlEQk1keFZsV1lHaWhpZVJiNEp0b1I3NmdnT3FJ?=
 =?utf-8?B?eFVaSkZ2eFd6cG5qZ0cvRjJERmZiNStFNHAreDdHeXgzUnRod0VPaW5Sd0F4?=
 =?utf-8?B?NmJ4TmZYVHlvVml5aDhQOVNEcFVGQ2xYKzZmUnRKT3BFWkNoOEZkSWR4TVNE?=
 =?utf-8?B?emtMMzBqVUFoSFQzY1NYUFdQejV6cG8rcHZHL3FtTW5QVytveDdhT0NBeFBU?=
 =?utf-8?B?K2NxT0puR3NjdzhqWTNLcVRORFpZMW1HdjAxOFlMSkR0bWRucHd4QklHNjhW?=
 =?utf-8?B?K09TQW85cHlmNlNwRlNFZ2lVRkpnVURmWXhaajdKc0ROMk1ZanhSMFdPakYr?=
 =?utf-8?B?NEFUV3JTd00vcU12dXhFT0xoMGtWakRDeVBZRzJUeGVxSTZqdTk2dkJXcUxB?=
 =?utf-8?B?MzNoYVMrazVkUnMwZTJDenRQbmpFU3BIMUg4bm5aVWllZWtnem5HUEZmbi9p?=
 =?utf-8?B?bmpIdWllMlhtMVFONjd3UU1ERXRHcmwrR1U2b0F6RGxKZzR6WURVTEV6Vmpo?=
 =?utf-8?B?RXMvZlo5VWJnenhHbjRMd1owQWJxdFowNnpBQTFjTWQyYVJzT2U4aGFRNlRx?=
 =?utf-8?B?V21CYU1oYXFoZTgyRm5JMXJ3bWVKdUtEa2xKclpjcmt4d05TalhwVGljV0Ft?=
 =?utf-8?B?cnBZYmI1ZlhBYi9ocmhjVjM5YlVmTE1ITThUcktxM3JwY1FjekptM1VDYnkz?=
 =?utf-8?B?OWdUNGlseFRoNDVKQit5WWVqWGh0TytuWko0eENhMmVZNUhNZ29xKzM3aEMw?=
 =?utf-8?Q?wY4I3uNV4HhIH1b9LnriJbC07?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2844c587-0775-4fd1-7a9a-08dab58460c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 05:55:39.1683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1ulTLxbm0Wl5gr0BmM+1BYsAfBFl4CElJLhedxQ4eHNJhDe6RTSznauNJgfxw84
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Title: "dependencies"

Regards,
Luben

On 2022-10-14 04:46, Christian König wrote:
> Entirely remove the sync obj in the job.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
>  4 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index d45b86bcf7fa..0528c2b1db6e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -426,7 +426,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu_cs_parser *p,
>  			dma_fence_put(old);
>  		}
>  
> -		r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
> +		r = amdgpu_sync_fence(&p->sync, fence);
>  		dma_fence_put(fence);
>  		if (r)
>  			return r;
> @@ -448,7 +448,7 @@ static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
>  		return r;
>  	}
>  
> -	r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
> +	r = amdgpu_sync_fence(&p->sync, fence);
>  	if (r)
>  		goto error;
>  
> @@ -1108,7 +1108,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>  	if (r)
>  		return r;
>  
> -	r = amdgpu_sync_fence(&job->sync, fpriv->prt_va->last_pt_update);
> +	r = amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update);
>  	if (r)
>  		return r;
>  
> @@ -1119,7 +1119,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>  		if (r)
>  			return r;
>  
> -		r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
> +		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
>  		if (r)
>  			return r;
>  	}
> @@ -1138,7 +1138,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>  		if (r)
>  			return r;
>  
> -		r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
> +		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
>  		if (r)
>  			return r;
>  	}
> @@ -1151,7 +1151,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>  	if (r)
>  		return r;
>  
> -	r = amdgpu_sync_fence(&job->sync, vm->last_update);
> +	r = amdgpu_sync_fence(&p->sync, vm->last_update);
>  	if (r)
>  		return r;
>  
> @@ -1183,7 +1183,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>  static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>  {
>  	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
> -	struct amdgpu_job *leader = p->gang_leader;
>  	struct amdgpu_bo_list_entry *e;
>  	unsigned int i;
>  	int r;
> @@ -1195,14 +1194,14 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>  
>  		sync_mode = amdgpu_bo_explicit_sync(bo) ?
>  			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
> -		r = amdgpu_sync_resv(p->adev, &leader->sync, resv, sync_mode,
> +		r = amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode,
>  				     &fpriv->vm);
>  		if (r)
>  			return r;
>  	}
>  
> -	for (i = 0; i < p->gang_size - 1; ++i) {
> -		r = amdgpu_sync_clone(&leader->sync, &p->jobs[i]->sync);
> +	for (i = 0; i < p->gang_size; ++i) {
> +		r = amdgpu_sync_push_to_job(&p->sync, p->jobs[i]);
>  		if (r)
>  			return r;
>  	}
> @@ -1248,7 +1247,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  		struct dma_fence *fence;
>  
>  		fence = &p->jobs[i]->base.s_fence->scheduled;
> -		r = amdgpu_sync_fence(&leader->sync, fence);
> +		r = drm_sched_job_add_dependency(&leader->base, fence);
>  		if (r)
>  			goto error_cleanup;
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> index cbaa19b2b8a3..207e801c24ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
> @@ -75,6 +75,8 @@ struct amdgpu_cs_parser {
>  
>  	unsigned			num_post_deps;
>  	struct amdgpu_cs_post_dep	*post_deps;
> +
> +	struct amdgpu_sync		sync;
>  };
>  
>  int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index ba98d65835b4..b8494c3b3b8a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -106,7 +106,6 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	(*job)->base.sched = &adev->rings[0]->sched;
>  	(*job)->vm = vm;
>  
> -	amdgpu_sync_create(&(*job)->sync);
>  	amdgpu_sync_create(&(*job)->explicit_sync);
>  	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
>  	(*job)->vm_pd_addr = AMDGPU_BO_INVALID_OFFSET;
> @@ -174,9 +173,7 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>  
>  	drm_sched_job_cleanup(s_job);
>  
> -	amdgpu_sync_free(&job->sync);
>  	amdgpu_sync_free(&job->explicit_sync);
> -
>  	dma_fence_put(&job->hw_fence);
>  }
>  
> @@ -202,7 +199,6 @@ void amdgpu_job_free(struct amdgpu_job *job)
>  		drm_sched_job_cleanup(&job->base);
>  
>  	amdgpu_job_free_resources(job);
> -	amdgpu_sync_free(&job->sync);
>  	amdgpu_sync_free(&job->explicit_sync);
>  	if (job->gang_submit != &job->base.s_fence->scheduled)
>  		dma_fence_put(job->gang_submit);
> @@ -246,10 +242,9 @@ amdgpu_job_dependency(struct drm_sched_job *sched_job,
>  {
>  	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
>  	struct amdgpu_job *job = to_amdgpu_job(sched_job);
> -	struct dma_fence *fence;
> +	struct dma_fence *fence = NULL;
>  	int r;
>  
> -	fence = amdgpu_sync_get_fence(&job->sync);
>  	while (fence == NULL && job->vm && !job->vmid) {
>  		r = amdgpu_vmid_grab(job->vm, ring, job, &fence);
>  		if (r)
> @@ -273,8 +268,6 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
>  	job = to_amdgpu_job(sched_job);
>  	finished = &job->base.s_fence->finished;
>  
> -	BUG_ON(amdgpu_sync_peek_fence(&job->sync, NULL));
> -
>  	trace_amdgpu_sched_run_job(job);
>  
>  	/* Skip job if VRAM is lost and never resubmit gangs */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index 9c10b9bd0084..6558839fda03 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -47,7 +47,6 @@ enum amdgpu_ib_pool_type;
>  struct amdgpu_job {
>  	struct drm_sched_job    base;
>  	struct amdgpu_vm	*vm;
> -	struct amdgpu_sync	sync;
>  	struct amdgpu_sync	explicit_sync;
>  	struct dma_fence	hw_fence;
>  	struct dma_fence	*gang_submit;

