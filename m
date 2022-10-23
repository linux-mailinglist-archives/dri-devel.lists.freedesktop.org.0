Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794F6090AD
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 03:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AF010E045;
	Sun, 23 Oct 2022 01:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD13510E045;
 Sun, 23 Oct 2022 01:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKs015s35Hec++QpfP7yQd6ZHPFkVzkm0IUChLqwu0fsFSJVru/uStRcySAtZ1tliLwpgK6ma7XF0elTr04g1a2LKAbG9+70LsPuWttKZLQQInYeGuSl4NULDwzQFYreNuISmhAwIDMR8aixucOiOFBrJlu/nC8Q6BMFXCUIU+2mOeXIrwnJeQzc3s5SO/V1XC7G5+CNFEdUYwlqLZAu0gPJoWL9NoDMKrncnp1eUhE33OCxmcFaDu9HDZlnD8DqqBRR9nchK+4hkvo92CGEau9PpcCSuJXCUzcSmJsiyuEzn6C1lGTa4sjxCuid+ZuqrpaToUVuadEARZtR89i1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UGAZdGedH5rw+fd8sL67SGsNx4NxAmqcAwgYvTY+mg=;
 b=PVfhdXPPNAJHSLhWQNux9DjmjBwgxcicPchguSoOkqvn/L0EEsRQLClGRBczwLkRXJw3j6e584L9dfr5xRcX3Y/dTMC+uK60oiqbwjgMGqZr7UxO4sq/4mtvCEeBl+5KPnZE3OKO4RAjysCFnjF/u5DGQBA5ULAZ0pI1wsZeY7EBQazkJRc2xQPma+2hV+QGviLs6VnINw2rU6H3BFByzH1/OjPDoMK1vmTk0hnbNdj1OjzIF+zCjCOn4+WeXDTORWWn4NMMu4rpDI0kPaiapxPYK7sbt/T5qW/87MdRmQxi8JCa+c+hB1g8WiAafNY5B/SWr3JLLvg3OwvYb8LK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UGAZdGedH5rw+fd8sL67SGsNx4NxAmqcAwgYvTY+mg=;
 b=tprrQDlNApo4LUkIQ60skrenNBNfyOD57hhDdQbCYlbqoMFJqT6nCDzmWDln+vbiz7kXxnDXsrHyqKZ5U+obM7gVViFa8JdS0VLAXD3xK37F3mdD8UyhO0vTZFdwjvH7fWuZaPamvVQxVFNRyjB4+El0yj5Z2TLM247mDVhG7wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sun, 23 Oct
 2022 01:25:24 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.021; Sun, 23 Oct 2022
 01:25:24 +0000
Message-ID: <808ed8b2-ac3f-0476-df64-1a8d1749de0f@amd.com>
Date: Sat, 22 Oct 2022 21:25:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 05/13] drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-6-christian.koenig@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221014084641.128280-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2bbccc-54cb-4a86-6706-08dab4957589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qSVy8JiX+as4AGi83KDsGyVvXKcqD5upRT/Sh0NSsi4dhv1rdPpfJT2h0kZW9kcpXIIZI8wXJmCmSLYh98yQTK074+1UA0pu0P+ovL0sUYwvMChS0LoileXrLbKi8+Lile2gLlvKalXO6tL2kWAkB/lmk+7SPD8wzGPSk8HVmvXjuTBeButWS7iD4GWVi8iQPggaCjTUfF76IxJUvG7vkT8ZeRN7Q831POwWjAHNIDeIwWrMGIZFPq2QCsQyMVo2MQJ4YVq6NMoBwkb5s47kT673JkJI3/V1g4Ir7bLmWLfZPdzsg24m5G1ODoDJaXut89nVSuidWl29CkNOTBTWGb/Q3zwwdrn+vKlpjPylkoPrCuGgjjjRx8iRWKcrb5ssP8V7d+IOVL02CN8fYp3ycsUk9w3jTG+i0SRY+Szcsi5N/E+1zyWCbMhevlVQu9EPRVz2VdoGG79hOBCK7UPC6WeJ8xx8X/EcQlLp/WjsTx3VhU8ner9orNvWsq1bz1XTwOwymFbaHQG6m8GWF4voA/+7d1kQ7nHiauSzx+8guH/TIGqmjQ8ZHQWhEFtlim3apOAT+3pParEEziUyzGjtGED8BSGNajiq9/RBwyziGk3D+ESfpv0zPPU++3r/KCcHTvPX1a+FsBUH2u2RpP8O9tYPrKVAoUSfMtsNYNiZYad3yb3+89B+2hByu5KtPlRlhpyk4hOE2xO0IKo/fGFdkv1IcG7d/YojZERhCzbBlDbsbgHzM9C4Aq4va7dNawLQI2jmgaS14UsrEXhXrttypsaT7hCEBPcXFhQd7R94TLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(86362001)(31696002)(36756003)(31686004)(38100700002)(2906002)(5660300002)(186003)(44832011)(6506007)(26005)(6512007)(2616005)(4326008)(6486002)(83380400001)(316002)(6666004)(66574015)(53546011)(4001150100001)(8936002)(478600001)(66946007)(41300700001)(66556008)(8676002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGlIZ2cwWUJpcTU3cElaZGROaUQ4bmswckZLcEdna1Jwb21KbjkwOWd6V0RF?=
 =?utf-8?B?dXhjM24yMXE4UjI1SWkvK3RVK2h5OWxvUmhvK2pURUN1YUtKWUF0WGl4b3Ju?=
 =?utf-8?B?RllYcWJBN3pWY2NHQ1VscldFcU5OdlhRSks3ckZUOEhRWUFvc2NmWm1ITWVS?=
 =?utf-8?B?WmRablk3L0xRUnN3MjQ5VSt4V3NJWHcyZXRZdmZRaXBNbjFLNytyelJpZDM4?=
 =?utf-8?B?YjNFY3RIbU9DYnRzNk1HaW41cmFkUmdUNnZJVVpyekRyY0c0TkR2Q3ZnVUc0?=
 =?utf-8?B?SXB2N3pLZkJocEFtdHd4QytaajVNeWJJUW5kcXdUSmo4YlV4cldZWXFCUlZu?=
 =?utf-8?B?ZGt2Q1RzZ2VoVEdYYktZekd1V0cyMHN5VXBPUzlEQ1R5d3JpS1lERmlWT1lC?=
 =?utf-8?B?Y3EvZ0NvRFZVZTA3WVltbXRvMEdzSExtNVU0c2xYMHFjZGNWNUdGVzV1b1lT?=
 =?utf-8?B?UUROWlJiYlZTVkRUaXVaSEMwK3QrTGhJTjJhRVBuTlQ3NEpCNFJFNnhCWHA1?=
 =?utf-8?B?TzlWWklKaU9wVU53aG5GazNHUUlXcSsyWW9FOE5VREQzaTdKWktoNUNDNmsv?=
 =?utf-8?B?SzNNc0twSnpWaGx1c2RNa08vdU01UnJNYjZEM1ZlcVNkbmxQRHRZRmdDc29H?=
 =?utf-8?B?V0gvd3lkNWpsVEhrVWhBYytNWEFsakQrMHpmOGxpQTkvUmZjdXNVcjBkV3E4?=
 =?utf-8?B?U0lDWGZTaTVSKzlnOVE1SHc0QWE4djAxOVlHRnJ3cTBrS09renRGYjZqeTZy?=
 =?utf-8?B?MTg4eEhQV3UyUW5mSFRoa2FKeU93L09IcDFvaDgreFhTS1dqbWxrRFFzRTA5?=
 =?utf-8?B?clE3V0l5WnFsS1hRSm1OUGtNNDluZ0xLMExCVk94UkViKzkxSTdmcTJCRXgz?=
 =?utf-8?B?UlZocFBwRnpSaVZGdGs0Vnl2Q3Q2aXI2NC94cUdqa04zb0tBVy85ZEl4ZmF3?=
 =?utf-8?B?YzE0ZEZ2MjQ0ZkRoRnp4OEdERlVKdFpCbDViaHlldmNsNEY4YjlQUXRHYjVv?=
 =?utf-8?B?SHdHQzVVSHg3YzhhUCtxM29vK05ncTFCUmJVOHB4NEttUE9CRWQ2UzZ2VHJW?=
 =?utf-8?B?alY4d05RUUVjb2dLTjFqVkptWG5iR1EzdENzTndiR1JoMkRxNTFUZHMwNkVU?=
 =?utf-8?B?S0c0TWZucjl1eDRhMjFpMGFMbzI4M1F4UU1pSXhFSGxGQlpPNUhGMGFkMWZM?=
 =?utf-8?B?clowUGRrbjNpM1dBU0dST2xaRUovWmIvQkNSMnpxM0hHazQ3VFFGN0poWFo5?=
 =?utf-8?B?WWd2a3FpaEUrRTVyUmNPNW5LTnpVL1ArbUFSMWdLNW5OTkZNNERiUk5YSlBL?=
 =?utf-8?B?UTJicEluR2dYUWhXWVo1OEhaZVhxazRKbWJtTUJiYWtMRnAxbUVieEwzYUMr?=
 =?utf-8?B?VlVBSVA0WHNzOVg5dHRIQ2pmeGYwSVRyYTV6MWZucWh6WjNPa0JXZnlLOTlw?=
 =?utf-8?B?aXVoWjIvSTdNQ0Fhd2VtZnpHM3FJSEs0NWNUZFpmY01RaWFNdmNBbHFHaGw2?=
 =?utf-8?B?ditMRkFsSFd4TDBINmpVRUtsTmpDcVU2VTYyUFV1dUhVWG94OGRod1g5Zk5a?=
 =?utf-8?B?L1lOdkdIOTkxWm5wMVBFU1YrRHU0RDZpSGFtM2trQXF4M3JIbC9wRWNkMStV?=
 =?utf-8?B?bWxxRWVGcmtwczBaZ0g1Skh1aVhNS1BJSCsxeXRsL084RWxmc3N5YWlkSDdG?=
 =?utf-8?B?cm5zaHA1UEpZanlseGNIVnp0SUZLNnJiTDNBNnU5Qkc0QldKZFdxajR1Rlp4?=
 =?utf-8?B?SGNUNEpxRHQxVHBRM0p5OGRPWHZwWC92R29QMWNXM3hWZ1J2bUxNUzFpeDVL?=
 =?utf-8?B?cGtLalVYUmRJa3N5Szh2VDA2aVVRMllwUTVycDZOd1R0RXQ4WGFFb2JCdERO?=
 =?utf-8?B?UWRIeENlb1RoaitSVXlYdExFelNCdlBhWUQ1dWVxZmhmYVpndnYvNFVuY0NW?=
 =?utf-8?B?YUVLcGt2blVvSkJURzhUYlVXYUIrZnl1TTEvSEd6MDBqZkFYYkdwd2xjbnYr?=
 =?utf-8?B?YXM3bVpvNUVHWWRhcFc5ZWkveGtDK3lPbWZleGJ6OGhYdmVOQ0VidndZYm14?=
 =?utf-8?B?UUlHbk9aVVBGY0tEakVaSXp6OS9BTzJOdS96Zzgyb213eStFT0FjZ211VWhQ?=
 =?utf-8?Q?BK9D48Sc7+z15fSZoS1LS+8lV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2bbccc-54cb-4a86-6706-08dab4957589
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 01:25:24.2506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLCXjSBBDE2HtFXsnaz55/Jh+ZV69BuYylNYf2ttU5iJJHHdaKHuKJL2HywuHLXM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491
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

On 2022-10-14 04:46, Christian König wrote:
> Instead return the fence directly. Avoids memory allocation to store the
> fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 42 +++++++++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 12 +++----
>  3 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index b76294d4275b..2a9a2593dc18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -170,26 +170,27 @@ bool amdgpu_vmid_had_gpu_reset(struct amdgpu_device *adev,
>   *
>   * @vm: vm to allocate id for
>   * @ring: ring we want to submit job to
> - * @sync: sync object where we add dependencies
>   * @idle: resulting idle VMID
> + * @fence: fence to wait for if no id could be grabbed
>   *
>   * Try to find an idle VMID, if none is idle add a fence to wait to the sync
>   * object. Returns -ENOMEM when we are out of memory.
>   */
>  static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
>  				 struct amdgpu_ring *ring,
> -				 struct amdgpu_sync *sync,
> -				 struct amdgpu_vmid **idle)
> +				 struct amdgpu_vmid **idle,
> +				 struct dma_fence **fence)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned vmhub = ring->funcs->vmhub;
>  	struct amdgpu_vmid_mgr *id_mgr = &adev->vm_manager.id_mgr[vmhub];
>  	struct dma_fence **fences;
>  	unsigned i;
> -	int r;
>  
> -	if (!dma_fence_is_signaled(ring->vmid_wait))
> -		return amdgpu_sync_fence(sync, ring->vmid_wait);
> +	if (!dma_fence_is_signaled(ring->vmid_wait)) {
> +		*fence = dma_fence_get(ring->vmid_wait);
> +		return 0;
> +	}
>  
>  	fences = kmalloc_array(id_mgr->num_ids, sizeof(void *), GFP_KERNEL);
>  	if (!fences)
> @@ -228,10 +229,10 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
>  			return -ENOMEM;
>  		}
>  
> -		r = amdgpu_sync_fence(sync, &array->base);
> +		*fence = dma_fence_get(&array->base);
>  		dma_fence_put(ring->vmid_wait);
>  		ring->vmid_wait = &array->base;
> -		return r;
> +		return 0;
>  	}
>  	kfree(fences);
>  
> @@ -243,17 +244,17 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
>   *
>   * @vm: vm to allocate id for
>   * @ring: ring we want to submit job to
> - * @sync: sync object where we add dependencies
>   * @job: job who wants to use the VMID
>   * @id: resulting VMID
> + * @fence: fence to wait for if no id could be grabbed
>   *
>   * Try to assign a reserved VMID.
>   */
>  static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
>  				     struct amdgpu_ring *ring,
> -				     struct amdgpu_sync *sync,
>  				     struct amdgpu_job *job,
> -				     struct amdgpu_vmid **id)
> +				     struct amdgpu_vmid **id,
> +				     struct dma_fence **fence)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned vmhub = ring->funcs->vmhub;
> @@ -280,7 +281,8 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
>  		tmp = amdgpu_sync_peek_fence(&(*id)->active, ring);
>  		if (tmp) {
>  			*id = NULL;
> -			return amdgpu_sync_fence(sync, tmp);
> +			*fence = dma_fence_get(tmp);
> +			return 0;
>  		}
>  		needs_flush = true;
>  	}
> @@ -302,17 +304,17 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
>   *
>   * @vm: vm to allocate id for
>   * @ring: ring we want to submit job to
> - * @sync: sync object where we add dependencies
>   * @job: job who wants to use the VMID
>   * @id: resulting VMID
> + * @fence: fence to wait for if no id could be grabbed
>   *
>   * Try to reuse a VMID for this submission.
>   */
>  static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
>  				 struct amdgpu_ring *ring,
> -				 struct amdgpu_sync *sync,
>  				 struct amdgpu_job *job,
> -				 struct amdgpu_vmid **id)
> +				 struct amdgpu_vmid **id,
> +				 struct dma_fence **fence)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned vmhub = ring->funcs->vmhub;
> @@ -367,13 +369,13 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
>   *
>   * @vm: vm to allocate id for
>   * @ring: ring we want to submit job to
> - * @sync: sync object where we add dependencies
>   * @job: job who wants to use the VMID
> + * @fence: fence to wait for if no id could be grabbed
>   *
>   * Allocate an id for the vm, adding fences to the sync obj as necessary.
>   */
>  int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
> -		     struct amdgpu_sync *sync, struct amdgpu_job *job)
> +		     struct amdgpu_job *job, struct dma_fence **fence)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned vmhub = ring->funcs->vmhub;
> @@ -383,16 +385,16 @@ int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
>  	int r = 0;
>  
>  	mutex_lock(&id_mgr->lock);
> -	r = amdgpu_vmid_grab_idle(vm, ring, sync, &idle);
> +	r = amdgpu_vmid_grab_idle(vm, ring, &idle, fence);
>  	if (r || !idle)
>  		goto error;
>  
>  	if (vm->reserved_vmid[vmhub]) {
> -		r = amdgpu_vmid_grab_reserved(vm, ring, sync, job, &id);
> +		r = amdgpu_vmid_grab_reserved(vm, ring, job, &id, fence);
>  		if (r || !id)
>  			goto error;
>  	} else {
> -		r = amdgpu_vmid_grab_used(vm, ring, sync, job, &id);
> +		r = amdgpu_vmid_grab_used(vm, ring, job, &id, fence);
>  		if (r)
>  			goto error;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
> index 1b1e7d04655c..57efe61dceed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
> @@ -84,7 +84,7 @@ void amdgpu_vmid_free_reserved(struct amdgpu_device *adev,
>  			       struct amdgpu_vm *vm,
>  			       unsigned vmhub);
>  int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
> -		     struct amdgpu_sync *sync, struct amdgpu_job *job);
> +		     struct amdgpu_job *job, struct dma_fence **fence);
>  void amdgpu_vmid_reset(struct amdgpu_device *adev, unsigned vmhub,
>  		       unsigned vmid);
>  void amdgpu_vmid_reset_all(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 13b752687b30..e187dc0ab898 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -238,12 +238,12 @@ int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
>  	return 0;
>  }
>  
> -static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
> -					       struct drm_sched_entity *s_entity)
> +static struct dma_fence *
> +amdgpu_job_dependency(struct drm_sched_job *sched_job,
> +		      struct drm_sched_entity *s_entity)
>  {
>  	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
>  	struct amdgpu_job *job = to_amdgpu_job(sched_job);
> -	struct amdgpu_vm *vm = job->vm;
>  	struct dma_fence *fence;
>  	int r;
>  
> @@ -254,12 +254,10 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
>  			DRM_ERROR("Error adding fence (%d)\n", r);
>  	}
>  
> -	while (fence == NULL && vm && !job->vmid) {
> -		r = amdgpu_vmid_grab(vm, ring, &job->sync, job);
> +	while (fence == NULL && job->vm && !job->vmid) {

In preliminary application of the patch series, checkpatch.pl complains about comparison to NULL,
and wants !fence, instead:

	while (!fence && job->vm && !job->vmid) {

I can see that it had been like this before... and I know it's out of the scope of this series,
but we should fix this at some point in time.

Regards,
Luben

