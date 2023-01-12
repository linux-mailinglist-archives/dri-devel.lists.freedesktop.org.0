Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13A668720
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A58910E947;
	Thu, 12 Jan 2023 22:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE7410E947;
 Thu, 12 Jan 2023 22:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHj2BsLTSs01G6DBKx7pFCkUrPFgIkJcXJl0+M+p4Qq75HIRBsHrno+kQngkZziwKatcEtbx6hl2dYhFAY/j5fdpX3Zu56rtPObG5mpaZ+aAwEM+nbHwTQ+LyPZOjlfTCCzSCBpNzL2kF4GcLCy/KEn9J3eKI/pTU68JrqLBCe8bYY+86SI/yP18YlH594/PG08Na0+QJGfXi+vdtsxLClUsmf+EWrzP43CTWPbPfzWiqVUj/TrzX5TSMhWa0u298Ya8uRiJjWvovJA8U1CNeX8GQ8Dik6BAuOO6Cvm+jB8CbjegsXu/1V0X/KFmkFyS0Ai4wvDp7uo+sPC+n/Ellw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sueKWU5OLeCx4iLnILPyLPi2dX2z0rvzS6Y05ce2R8=;
 b=kZYLAZz+kf56scSOPbIGlIHiEZZevz/Pwo6nlPFwWkdYx2SyHmO5EtEEHVTxWcJJtB5AqR6g5HzZiP0UrTIpPKjCQmqdcJKG7KzrBIawTiQwfgemzV8LXuDueQCp+bd6Eej1WJmwlyeVX7qJ4/I7hHvzVjTkBTDuple9dWGo5ykVWoWmcrTX1gY28j/OtOOUTc/9x4+f9nXlcBtL4rmkp0UBNnT7Z07UJfTHPBFlq/WyFb3Wht47j82y5v/EbkDGP2M+vq4PkVxWZFAtJGi26OQ215nGqyLm8OdA6NUkXBIR1PdOOVbfHSR67LcRNFpdcve93tjfzEqRaiSt4hMgQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sueKWU5OLeCx4iLnILPyLPi2dX2z0rvzS6Y05ce2R8=;
 b=36g3RJlYZhd+FCxWuAfpTinbhPgzSwQ9QEWw3eUQZX1XiWG8kV2xohD+YDW2JnneNkwHC91U8xuEAa68fdpCbBerjHI61OrdvZ7GvMdG/hXhWVmAnR4NBYh8YHNuNUXJ57hY1LSrOU0Ks6nwA/RyhL40L8TcMY+mMzOi2yKcayA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 CH0PR12MB5060.namprd12.prod.outlook.com (2603:10b6:610:e3::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.19; Thu, 12 Jan 2023 22:41:37 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b%4]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 22:41:36 +0000
Message-ID: <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
Date: Thu, 12 Jan 2023 16:41:33 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <20230112013157.750568-2-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::11) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|CH0PR12MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a732b5-4d79-4a2d-50f4-08daf4ee29c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jKtPYLRppnSSvytJTntxHXarKvdWqAtPdrZU8GxVmwGJEJjgVVL01u+tp4Dw/GmbTbZ8xcUswXzpleUuCESENwuU3W6ecmdWD1OPf8TRFdmfKwRDElqH2ec+moco2lGynyYH435i0Yd1t8+Jizi1VHHefdShqP14S3eYDxidoYsdgwyy3cgNs880Qb17C+x8itfVeDMYVnrs7aIgbnvvdE2tDHfoLmsjpNUWsDik0aGCz/UIeeCOS3NZWMS1GU+u8NSKUv33cRWQfkGAOd0zr56Brq0FSZj6iVFwh5XoTWz64FJQK3nxXMmQ1OJL/f7EW6DB0RwNK2bzIqkNhuzHAouZYxgc//gNVHbuIPVycAigJHO6f7pPj/wX7JDIwr3a61e82tw0EgYPflzNmFco2f1CVu6TMQV7DMoSIQVVC+vtQwHz55zYpqGHbdosiq7GoZLUryzMDB3gkpsLrl7XU8Blpbz7Xm3e21fcW3uOBlVreA+DpFmstx+IPDsLbqb1usIzAE8+E8h3Ff0wqGij0oX7liOA3IeNFq76dH+jgGhuVse/tpzTJpMS3J0E1hcfNw12Tsk45HzJF5xhn+w0Rs6EgPBztdQP1CQgHplHNPzFrDKKtNRPZPNDZ+V1AApD9lByLT5KGOCSV0hQQxJ+yxEQUGo7MiJ7HETCCL/H8O9zsx9AOeriQX1KRaCdfPPXRu966VPfaz2RtqGXx6x7hQKMuXBMiYsMS1DDXpGavyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199015)(83380400001)(8936002)(5660300002)(41300700001)(86362001)(38100700002)(36756003)(2906002)(31696002)(31686004)(478600001)(26005)(186003)(6512007)(6506007)(6486002)(450100002)(4326008)(8676002)(66476007)(66946007)(53546011)(316002)(66556008)(2616005)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm1ETmlCSEc4bHdKS0xVNHpqeUUxRERIRFpJaGpGK0Y2cmg4NWMxWjJsVVFk?=
 =?utf-8?B?eHZLWDV0QmRmenN1MW1aUVgrRUJBekdieXdiOFIvdVBpN2lDU2p3S2NxVGhU?=
 =?utf-8?B?azVHaGtxNWwwVWtnOTBwKzVrSGYzb2hzN3BSS0R3cmFxN2dKSEJvUmdGamNa?=
 =?utf-8?B?MndhUjlScnFXUWk4YmYyOXRPTVNESjBHWkI4cjBxaGZqZWdMWXc3U1RGS3lJ?=
 =?utf-8?B?Zi8wV014cExvOWFDaUIxeG1PRkdzN1JScWFXS1FUY0RJT2dqcVh3dzBrMFNT?=
 =?utf-8?B?djNGTVJFWWNLamthdVNZcjd5SUVGOEdoTmRqb1VxeW9yUWdjWXlvRGdlY0Yw?=
 =?utf-8?B?K2pReVpURW01emlCcmorNGpSZUJGYTVFc0VSWFZicEdtK0tlR3pGU3huKytF?=
 =?utf-8?B?T29LODg5amg0eGR1UzN5TjVpTld0eFByd1hudVlqamIvSkdWMi80WVhjblNE?=
 =?utf-8?B?Z3ZNOEdaa1dYTWNrTkhmRUJMejFkTnZlemZ5ZHBTb09aaFc3U0dYQU5IZno0?=
 =?utf-8?B?djdXbGdkUWtINkdSWmRJdjVCaVlYQkV1b2FZSlNCbmM5STRTVzJ4endvWG5V?=
 =?utf-8?B?K2k4cE80YmMxTU8rZEdiR0dUTlJseGNHT0NrNjNyaG9JN2JLN3ZhL0xaWDBD?=
 =?utf-8?B?dVR5MW1mRzJycTY0WXNqWVlsRUJHMXljNXN0YUxYUndFZ3MzcERSeStlM01n?=
 =?utf-8?B?eU1NTmxHM29DZFhHdVZoWTB3S0dqSWRocGdIeGJ2cjcxenJiZXU3cy9saU5m?=
 =?utf-8?B?YmRnV0NaaTNiTUFEcDVja29aMHh4alNmSDgrRUdYN0pnUVJmek54dWNQT0o1?=
 =?utf-8?B?ZTF4MG1PV1JTRU9DMkNnR050WnhKbGcwSEhUanVBemRNenFreTZNRjRXR294?=
 =?utf-8?B?LzRLVUlIbXBaYTkyWjJvb1crdmxNQ01oY0tNQWVDWkJaOUxvcmtXQjA3MEh4?=
 =?utf-8?B?WHRmeTN0TWR5VXF5c3NGQ0t4YkE1L0RFeTBHTEhYUFR0TUIxTTdrOTloOGc2?=
 =?utf-8?B?ZlNVeGRpYjV3Z1pIT3E2UkhYclZOajF2NEtrN0Z6d1h2RDZka3BxM3NGdHpC?=
 =?utf-8?B?Z2ZKNDNKZWFxSUIrQjBjejRBanB5cjZKUlBLcXp2emJVU3h5YWkxdkF1TFp4?=
 =?utf-8?B?TmljWlQ3bDF4QTR5d3l3aGJ2ZGtFVUlDaWczWVQ2ajQxVXdad1RTd204U3JG?=
 =?utf-8?B?aUV5MHVETUNPeTh0QU5wcE81YzlHaWo5Y1Z4emg3Y2xkeVdRUys3Ty9UWWRk?=
 =?utf-8?B?bkpzM2NxNVNxL1hzNDRncUpoNGxHcStDdmptODdhaXZpZnYrYXFSUXY3QVlF?=
 =?utf-8?B?WGNjdFo4RHRiQ1R3WXpOTHo3cVpJbXVSVUloL1IzbC9jb1hER1E3V0NyYTdh?=
 =?utf-8?B?YmJvVzBSRldORFVraTFoTHF3VkZjallraGNEMEh1a2xwU2c1RVNQbDVpbnI1?=
 =?utf-8?B?RHlTUXpSd0VYNXJnaFRzOHBuWExodnRCekZ5Z2xRV29zWWhheVdpanlQOFN0?=
 =?utf-8?B?ODVxUVB4bXArMGt5MXJNR054Wk5meE0rdlpwNFEvbDEwemk4ci9YVUN2ZUN5?=
 =?utf-8?B?b1lZQlU4OHN3SDR6OS8yZVhrSmJMdUhNemhXWVJSZ29YUHBVVXV5TUNHU1V1?=
 =?utf-8?B?bjcrRGQ5QVVSR2RtOVNLVXB6NHVEbEJXK055STR4TW43WGo3b0VGLzU4N1NR?=
 =?utf-8?B?UlFNYU5YNUwzR3lVTy9mdTRvN1ZzOFZNSkJwK3FLN3RNczZ3dFB1aW1MUjFW?=
 =?utf-8?B?NTkyYTY1REdoRUpsSDlZT04xc1doSTBlNHNFY01pT3lBSmU5N0g0eVcrclpR?=
 =?utf-8?B?ZHJ2TFhydVNNUUxodUhjSml1UkhKVFVBdkNDZWxLb2RObXRRbWlwV1NRUlJZ?=
 =?utf-8?B?Zk5aSW9kUVliZkgwa1BFdVZZcWs0bFhEQ0tSVmJQMzFSemxzY21TampDWDFv?=
 =?utf-8?B?T0lsWm9Xc0FYeGdjdUpNNVY5SW93ZHZtRGpwQ0t2NWY3Q2YyTHV4M204K0ll?=
 =?utf-8?B?SnlUZGlRZkgxc0RyT0RLM25qMXptSGRyV2NxRW1kaWFmMzNDWWNHazNzaEox?=
 =?utf-8?B?VjJEdW9HWkpFSHNiaXNqOWFWS1dFS0lOTDVjU1VUbGNoelFVVG9XUFVwb3hD?=
 =?utf-8?Q?2z0U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a732b5-4d79-4a2d-50f4-08daf4ee29c8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 22:41:36.8452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sdps4Wyosxo/I4kP30hkLu8ajNOJmDbD+gK/Lw+ng3AEzcTixsacEHA6nUXKYrJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5060
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


On 1/11/2023 7:31 PM, Felix Kuehling wrote:
> Use proper amdgpu_gem_prime_import function to handle all kinds of
> imports. Remember the dmabuf reference to enable proper multi-GPU
> attachment to multiple VMs without erroneously re-exporting the
> underlying BO multiple times.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++---------
>   1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 6f236ded5f12..e13c3493b786 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -2209,30 +2209,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   	struct amdgpu_bo *bo;
>   	int ret;
>   
> -	if (dma_buf->ops != &amdgpu_dmabuf_ops)
> -		/* Can't handle non-graphics buffers */
> -		return -EINVAL;
> -
> -	obj = dma_buf->priv;
> -	if (drm_to_adev(obj->dev) != adev)
> -		/* Can't handle buffers from other devices */
> -		return -EINVAL;
> +	obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
> +	if (IS_ERR(obj))
> +		return PTR_ERR(obj);
>   
>   	bo = gem_to_amdgpu_bo(obj);
>   	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
> -				    AMDGPU_GEM_DOMAIN_GTT)))
> +				    AMDGPU_GEM_DOMAIN_GTT))) {
>   		/* Only VRAM and GTT BOs are supported */
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_put_obj;
> +	}
>   
>   	*mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
> -	if (!*mem)
> -		return -ENOMEM;
> +	if (!*mem) {
> +		ret = -ENOMEM;
> +		goto err_put_obj;
> +	}
>   
>   	ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
> -	if (ret) {
> -		kfree(*mem);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_free_mem;
>   
>   	if (size)
>   		*size = amdgpu_bo_size(bo);

Hi Felix:

I have a question when using amdgpu_gem_prime_import. It will allow 
importing a dmabuf to different gpus, then can we still call 
amdgpu_bo_mmap_offset on the generated bo if 
amdgpu_amdkfd_gpuvm_import_dmabuf also ask mmap_offset?

> @@ -2249,7 +2246,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>   		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>   
> -	drm_gem_object_get(&bo->tbo.base);
> +	get_dma_buf(dma_buf);
> +	(*mem)->dmabuf = dma_buf;
>   	(*mem)->bo = bo;
>   	(*mem)->va = va;
>   	(*mem)->domain = (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) ?
> @@ -2261,6 +2259,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   	(*mem)->is_imported = true;
>   
>   	return 0;
> +
> +err_free_mem:
> +	kfree(*mem);
> +err_put_obj:
> +	drm_gem_object_put(obj);
> +	return ret;
>   }
>   
>   /* Evict a userptr BO by stopping the queues if necessary
