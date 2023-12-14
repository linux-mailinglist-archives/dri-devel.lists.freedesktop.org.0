Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E181812B92
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 10:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5A810E942;
	Thu, 14 Dec 2023 09:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652CC10E91D;
 Thu, 14 Dec 2023 09:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f85OO7SFGdi/4XKAK+LVaoLV7NR9CDkwhzdUovIieYgrShj7WfsT2sg8tibNHfoy+SDErGLDA6GgkCQ3aDnwLyXM/9nQcQx1VATtmmsg8fL6C0obMdfHU683s/YE0M/xoJOD7dLtD43gqibWdLAjnPQ/7U6bxDfV0Q3BRza1dAxTzx5wxE2wVv/9x6p76695YtEWsxyYEtWVTmJtHz/7tVV9QqPUeyz6YVwZJKl4i4eVEJ9xkktJGCWyLqOuCKEQJ2kTI2wDpvI+rft/EUuXJfiirWkiQMri79Vsi8lvaW9aea2SdgUCdoPKq0FdwqKOSPGyAMcf5hV5KySHoIB0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hby5dpmTJ8JFGbkSDeXPTs2KTDtj8GfNQfmpUzyKlLk=;
 b=ItaIH9dGfKB/PjxwS4/qTfFMRQSdXRKW2EXkPEv6NHyNDNh54e6iM+UfKClE7CJkzAwmjiWSPqWwiK86Hv5HZ8VUJCVLxslwMizsGIdpnGje0B81TAYxwJBW/PexDPFzTCoDzpQzFwo/52V3aIL7kynn+VcLpqehs3KBiw7ub7e2L+CK0xFSEgQa50wJRvWbvYoWcoVSv3FR3t12GLMwo5waysl5EE+7mvcV9SJdAdLB/CwLy1jUX7nvqBD8+PxfYlSiuGn8/81/wcU95Lm4XO5v2FyMaIN68EbI1l/ZY07Nj97/PcqO8f4DupIF4PLxJ4IoUYbpbT7lYKNyp6GiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hby5dpmTJ8JFGbkSDeXPTs2KTDtj8GfNQfmpUzyKlLk=;
 b=VtAR61NkquDr8QX15GproIPZYufsZFNwbIu/WJOzplvXZaY4LRDdmjHWrYubuJqE/rEPwYpabVOX58HBEmGfMlm33nrueSMVNcXhAt5ayU9isTNIz+ilIIB/hXbtOoNiumMfLVpD3AY5Wv7UeDoVO7fhIaQ7Saw4F7Y+Q+iV6MqVH8IMLwzAXk+jTf+F2fnN7Wi7t4XCnyFfjlnePk/aGegmdO3reGkd7i0I1yH0lly1LaHcQ3hxQ7RNHNPuBd2V5XRd//FlBBeQJvshr1rjitqg6bsuExjh8GLcgANDvZhyCDWa82V28glZcLRDJJCi003WRMMK4aN3Iwk1C3eDlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) by
 DS0PR12MB7947.namprd12.prod.outlook.com (2603:10b6:8:150::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.28; Thu, 14 Dec 2023 09:25:23 +0000
Received: from DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::e557:fd55:457:12]) by DM8PR12MB5445.namprd12.prod.outlook.com
 ([fe80::e557:fd55:457:12%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:25:23 +0000
Message-ID: <7887037c-9fe4-4121-9280-58b3cceaa3e8@nvidia.com>
Date: Thu, 14 Dec 2023 09:25:00 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Fixup gk20a instobj hierarchy
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20231208104653.1917055-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20231208104653.1917055-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0432.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::23) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5445:EE_|DS0PR12MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 4089e08c-6a97-49cb-511b-08dbfc868f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: exeZAIP2q/2gVBPiTwrnFYoZPpER87r69HVA5Q99F1DSvF41JJJkrdpmXyYShaBaCRv4TdmcnixjoAHxgLO2JIEDXJ6QLrq9utDQxIk3cST2wrEgA0mjSGra88fxEnvYTwHy1gP+vkPSQfk8eCli8IorXN1ZOZrxrhXE+LuqgFXMUOFME1fZjVMLgSndOQofBrtjuHAsGIWPioMQj2E9A+F9JstWpgt0SH8nWKU5wkB7BfTe0VaJeXMcFzHTUDXs5PMxdztxYF6uCLVvfqPoLMgPuIfGO49k5wEG8FbTE5alsUHvm8G/Lzx/fORHsH4nXpXFwm24oq+isAgy0qG8DxvCZhlLOfqxvoc3WSeZ10LFfLBHciSivAqjubywTla5s+f44lBCD0ideI7lL0I/qnPKrj/i70b8OLk6AlyZinjpo3uMDUN1PidPkrDNqUbFTeewv+qpYgVVS4mBhGsgln2hn2I9Sz8XfO+mIl8QvVm88vC5Dxcv6Cv/l6HDZP/XKjKxO9yK9VATF2xpgnXMKByWE5+Rc5RvWpInwc2HyJjL5bkqCMiVFp6GKaHZ9G8j2GbTy1rO+WoBj1+AQrfZKD1A89xRpuM9mTpIWZxBOHxZk1iTNLLdDnVOdt68+Gwrdois/rM9e53lQMSo5fEAuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5445.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(86362001)(36756003)(31686004)(31696002)(55236004)(6506007)(53546011)(478600001)(6666004)(26005)(83380400001)(6486002)(110136005)(66946007)(66476007)(66556008)(6512007)(316002)(2616005)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhLblpFOG9OWk4yTmlBNlZuQVppMGpWbVVJTzhqWE9PQzdGcUN5RXJ6cjJl?=
 =?utf-8?B?TUp5VVJvSmovbXNnZE01bjhZTUtPbDl5ZWFKdWFlK3NPdXduODFpZE1zOFBO?=
 =?utf-8?B?YWVaOU1NTDZJVFVGUksrSGdYT0ZOQkhzU2JWQ0dmdHhxODhnU1ZwL243SGVm?=
 =?utf-8?B?cGQ3L21CUU5oMVp4c05oL2JrZXlsU2ZiZWFCSFN4QitBcHljTmlZbjUyb2FY?=
 =?utf-8?B?Q1RMaDNxbFBaQnBFMW9VK05NN296YUJ1VFhYbE4vOTRSUHRZWk5OMCtCVi9r?=
 =?utf-8?B?QzJBeVRCQW54djFCc3d5aUVxMm5XNm9ZSmhmdlowS1RpNUFXcnhqVDg1dGxX?=
 =?utf-8?B?OTgxMm9uak0xL1hRbkFhSkwvK2w1WmN4T2Y5eDFBZUpaZHlpWVJQejJLRW9G?=
 =?utf-8?B?d0d5bDNzdkM1Y2xYNkt1aE94QURSa2lwSG5WTS9RbnRvTXFxaFNIcDVjdExZ?=
 =?utf-8?B?UlRyWER1SU1iMlpHWm0vb29GSHFNVXZqZVBjTjR1cVBZNzZ5Njh5d09aRmt5?=
 =?utf-8?B?N3pXSnU1WGZ1U1JXUUQ0S0srd1c2VjFHa3h0SFYxZjBPdlJrV3o2M0k0RUcw?=
 =?utf-8?B?SlFxVEcvbmNiRmpXcXFuZWJpRHhaRXdrRWQ2b2dZZlROcEZ0QUlXZnFVdFgy?=
 =?utf-8?B?akljTUlIRyswbi9WUHhFbjNocUJPbmZFdUVuK212Q2FYdmRPU1VGcktIOHFB?=
 =?utf-8?B?dkpCcnZteE1BRzJxNU1xcUpkRkc0M0JiR0VSNitNMDNoNzBkYVZLdHJNMVBX?=
 =?utf-8?B?VHJZOXE2LzF0Z3R3bHd1NnJMWk8rWXRjSHlnelYxWFlhaFpMb1R3WEdzN0VF?=
 =?utf-8?B?RzZVbEYvbzhNaHQrakpjVW9FNmgwZnhVenUvRW5UNlVwckU2b0JnaWs0d0VV?=
 =?utf-8?B?WjBCZ1B2NEZUSXVUVVFkMGpLMFQvSWV4dmRzUWxvVnFTVzB1cUpLMWVLYTBy?=
 =?utf-8?B?L3BwWXJ3WHlwaDlMZ2JQTVVGTXhKcGZwR1MyWnFOSm5IL0VIQWtFNWJuZUhC?=
 =?utf-8?B?SUhGNTlsWjVnWGtEWXFzTUFRem52NXE5ajgwc0FuVW52RDNwdDA4blZpdEpY?=
 =?utf-8?B?RFRhbDNUenY5ckx0UFIyL2VZRkt0VHVBRUxnNkYvQUFJc0FDa2ZXVVlxd01I?=
 =?utf-8?B?enZpOVRrQVJFSWJRWUpzRGZoMnU3aURZMWN0RktMR1B4NDZSU0lOYjBFcnh4?=
 =?utf-8?B?YzQ3My9UbWhXY3Boa0tBNXVHM3BtNVNLUXBvRmNleEdPOVd6ajM5bUw1RVAz?=
 =?utf-8?B?UFBYNUZSQjhlY0dXV0JhMU95NTh2RDJwZkxpVlU4a2NpckJYYk1lNGdmalB1?=
 =?utf-8?B?ajVXN1luTzRGR29hazE3eU43VUFEN3FJbzhsbVE3aHJ3WFBaT0Y2cGdoZE92?=
 =?utf-8?B?NENmL1luR2ZzbHFCUGJCTzZuTklWTnQ4ancweXlFQkk5clBKbkZ6Um5qMXdB?=
 =?utf-8?B?SzFYejA4Rkd6QnNTUlJWT1BVUnRac21XOXZ3U1NIT3VsSVRkWFVYa2FqNUdW?=
 =?utf-8?B?eEsvcjRZQXBPTm82NS8wMkR6a0VtY25UdlJiYzRDZldPZTlTNlpQMlZoVXZz?=
 =?utf-8?B?MGQyVFdGNW5IUEhjVUI3NHlpZUVCOXN3MmZKaHZEaHBZSGRVZFdNakxQdnFR?=
 =?utf-8?B?a2FCUjdwTjREQ25WSEo2MEJ6MWxtb2NTNHNVTEorK2xRd2NRQVNKcjJPeFpQ?=
 =?utf-8?B?Y2xkTG5Ka3RsVURkS25saXF5Skxncjg2OE1lYXF1bXhBSG8rWWVxTERweWdU?=
 =?utf-8?B?TnhGbU5TRHdLeFluRmZvbEhXcCtDckhpZ3RjZkl6ME5mV29reFNMeUdKcFMv?=
 =?utf-8?B?bkxwOVBwTVVtYjE5dVEvYTgyZG1tWFI5cUtjZitVWENIR2V1Q1A1RVZyY2ZP?=
 =?utf-8?B?cVFFU1RWZmhaeXpXWTNoRCs5QmM3WjZISWRmQmtZM0I5aG90TUFmY2o3MkFp?=
 =?utf-8?B?VEdvcFNsKzhaZ0R4dWRvUW1tSWYxYWhrTFZqa2dIZmIvN1g5MzBVT2xMd1pE?=
 =?utf-8?B?UWdtanlXc3g3SmxPbkdGQlI2YjliVUlKcFZibDlnc1EzYlFSbnMyNnRja09V?=
 =?utf-8?B?aEVjSC8zWG0vSVQ5L29vMFVseHVxRU1NcCtUdjBaeW91UEozUE1XcFBIZTVO?=
 =?utf-8?Q?guYEfkOVP92kvQZaSXdWqTSYN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4089e08c-6a97-49cb-511b-08dbfc868f82
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 09:25:22.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpXlcpSRDibsiYM0h8OQ/1XvG4q7iB7Qp7JVLx+lbZuLpUnSZZmonNdMivdmx6rProWfqOOrWRpFfcIXpB4dQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7947
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/12/2023 10:46, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit 12c9b05da918 ("drm/nouveau/imem: support allocations not
> preserved across suspend") uses container_of() to cast from struct
> nvkm_memory to struct nvkm_instobj, assuming that all instance objects
> are derived from struct nvkm_instobj. For the gk20a family that's not
> the case and they are derived from struct nvkm_memory instead. This
> causes some subtle data corruption (nvkm_instobj.preserve ends up
> mapping to gk20a_instobj.vaddr) that causes a NULL pointer dereference
> in gk20a_instobj_acquire_iommu() (and possibly elsewhere) and also
> prevents suspend/resume from working.
> 
> Fix this by making struct gk20a_instobj derive from struct nvkm_instobj
> instead.
> 
> Fixes: 12c9b05da918 ("drm/nouveau/imem: support allocations not preserved across suspend")
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Note that this was probably subtly wrong before the above-mentioned
> commit already, but I don't think we've seen any reports that would
> indicate any actual failures related to this before. So I think it's
> good enough to apply this fix for v6.7. The next closest thing would
> be commit d8e83994aaf6 ("drm/nouveau/imem: improve management of
> instance memory"), but that's 8 years old (Linux v4.3)...
> ---
>   .../drm/nouveau/nvkm/subdev/instmem/gk20a.c    | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> index 1b811d6972a1..201022ae9214 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -49,14 +49,14 @@
>   #include <subdev/mmu.h>
>   
>   struct gk20a_instobj {
> -	struct nvkm_memory memory;
> +	struct nvkm_instobj base;
>   	struct nvkm_mm_node *mn;
>   	struct gk20a_instmem *imem;
>   
>   	/* CPU mapping */
>   	u32 *vaddr;
>   };
> -#define gk20a_instobj(p) container_of((p), struct gk20a_instobj, memory)
> +#define gk20a_instobj(p) container_of((p), struct gk20a_instobj, base.memory)
>   
>   /*
>    * Used for objects allocated using the DMA API
> @@ -148,7 +148,7 @@ gk20a_instobj_iommu_recycle_vaddr(struct gk20a_instobj_iommu *obj)
>   	list_del(&obj->vaddr_node);
>   	vunmap(obj->base.vaddr);
>   	obj->base.vaddr = NULL;
> -	imem->vaddr_use -= nvkm_memory_size(&obj->base.memory);
> +	imem->vaddr_use -= nvkm_memory_size(&obj->base.base.memory);
>   	nvkm_debug(&imem->base.subdev, "vaddr used: %x/%x\n", imem->vaddr_use,
>   		   imem->vaddr_max);
>   }
> @@ -283,7 +283,7 @@ gk20a_instobj_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *vmm,
>   {
>   	struct gk20a_instobj *node = gk20a_instobj(memory);
>   	struct nvkm_vmm_map map = {
> -		.memory = &node->memory,
> +		.memory = &node->base.memory,
>   		.offset = offset,
>   		.mem = node->mn,
>   	};
> @@ -391,8 +391,8 @@ gk20a_instobj_ctor_dma(struct gk20a_instmem *imem, u32 npages, u32 align,
>   		return -ENOMEM;
>   	*_node = &node->base;
>   
> -	nvkm_memory_ctor(&gk20a_instobj_func_dma, &node->base.memory);
> -	node->base.memory.ptrs = &gk20a_instobj_ptrs;
> +	nvkm_memory_ctor(&gk20a_instobj_func_dma, &node->base.base.memory);
> +	node->base.base.memory.ptrs = &gk20a_instobj_ptrs;
>   
>   	node->base.vaddr = dma_alloc_attrs(dev, npages << PAGE_SHIFT,
>   					   &node->handle, GFP_KERNEL,
> @@ -438,8 +438,8 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
>   	*_node = &node->base;
>   	node->dma_addrs = (void *)(node->pages + npages);
>   
> -	nvkm_memory_ctor(&gk20a_instobj_func_iommu, &node->base.memory);
> -	node->base.memory.ptrs = &gk20a_instobj_ptrs;
> +	nvkm_memory_ctor(&gk20a_instobj_func_iommu, &node->base.base.memory);
> +	node->base.base.memory.ptrs = &gk20a_instobj_ptrs;
>   
>   	/* Allocate backing memory */
>   	for (i = 0; i < npages; i++) {
> @@ -533,7 +533,7 @@ gk20a_instobj_new(struct nvkm_instmem *base, u32 size, u32 align, bool zero,
>   	else
>   		ret = gk20a_instobj_ctor_dma(imem, size >> PAGE_SHIFT,
>   					     align, &node);
> -	*pmemory = node ? &node->memory : NULL;
> +	*pmemory = node ? &node->base.memory : NULL;
>   	if (ret)
>   		return ret;
>   


Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
