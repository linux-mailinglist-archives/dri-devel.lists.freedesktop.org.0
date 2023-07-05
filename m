Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B6747FBA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA9C10E325;
	Wed,  5 Jul 2023 08:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8972410E325;
 Wed,  5 Jul 2023 08:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwpL9MhaiidOpQXhfcMXyfISaTvBxGt5ROASLwkkBrG5UqWK8v1s+HVOVshfSwVOYPdybE4mgCPbA5w88hP7gBxh2zc8uxesWQocZ+wXKzdfRJyQR6nnH8e96IceyHSmJhiUlFyfD1uF5otRK8N3aEiXCC/g+hTsp/RVih2YWP4RuGDHaYfBeTqvros3uRIX7cpSRrWQi7vqM+0PyIbEv0G/U8N/WEmpykdwmpkW1udCDaCC8K5KfqSvjym94/+kJnAC7bcpPvnt/IAqnp9dCrx71Os9O9YnaUzdQIQa5B9UelVn+tGOgodgMC23PQtsRIriL9kENTeUYu40P5GF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmt+VhMTzEGetiHHMM+atdkl6JlA72OIGtVlFu8TyVk=;
 b=bxm+fFd7zXOl8/VilYVZ0StzX2XwiNWRbadb119leKKfkQ2w+FxVTHTmeRml1UC90AE5dPKWiokunlJ7v8RmdT/SB77HMG7Kskz08NvecP96NPFTM7nZjO95bprSVRFj9CdW+U5gG/Md9/uXBNWMxh1CaPEhcIqfBGddoAvHNiMomPRKRdRDxT2s/7L/dUqbdXexUb1Fp4Zji8umeqjq6t805Uy0hJXwh9u5/GUqNrGPJ3UikAIZ3K2eJK8IChr6dVOBj7mpFkKFI8Q+/UERnOTvQOKwdFAjKb4Juox8YHq/LMBGWpW35lieJwO12Q8Olraq9nPA/lo79Unvei8zxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmt+VhMTzEGetiHHMM+atdkl6JlA72OIGtVlFu8TyVk=;
 b=dx3v4ruWzxhFGqwxxTzRqzCNng4YCcCx2U0kU9eo7R2gzMPc5Ibf367lLqijFYih4bFzo2S5BknCdZK33V+6mw43OQ2gsKXMTpvBjHEco0342O0extTOy7+WwwaJ3JdQX8A2Z5HZX0TAVfOvPkBlm23LQcoewQR30Q/UsVf/hdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17; Wed, 5 Jul 2023 08:31:37 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::c4f0:c05:8644:5637]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::c4f0:c05:8644:5637%3]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 08:31:36 +0000
Date: Wed, 5 Jul 2023 16:31:27 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/ttm: fix one use-after-free
Message-ID: <ZKUqXybB2yCIinNX@lang-desktop>
References: <20230705053544.346139-1-Lang.Yu@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705053544.346139-1-Lang.Yu@amd.com>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DM6PR12MB4250.namprd12.prod.outlook.com
 (2603:10b6:5:21a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4250:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bdab3c-1527-4f5f-a316-08db7d323f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQ2ziFSl6uypG4TTuO3QvtSl+YHzhsZwbsE8YkX+9SKMG2WcdFsdz6tuhQXE2dxylrCp6VYp9dy4c4wKcH+yMNrNsC7NAyIe+4Pb1S93L9g7CP3M7gEbr7qTLuY87rC5W7MLqO5shdVkeh116v5OJEr87IefedM1tlsPqSSuKwJxay2mPDJK42ZaU70roktn98E5JB8iZ4ebh6S5YQkF2GAOMFdQxbDX6BXZcBVIY7vs9iBuoBlGgf5GAUq8eHVzOtaeSvcJadhMHI9aS2ybElBGa9cc1BOFwwdPbUOC8gMviIyxaj/xPJgYUW9PjxsHUxd++FKJe9QQpOK9P/Q/9S9L6yEoI5evE2mpk0WuXVteGgFotJ624TofJyhSnEmGVNkPMMv0JJKZluyZ6iigRGYTSk//JFc+bFRNZQqZVWeQR+5PR74gK9/HK2dDzKOwVKPX5YZfqn667zsuahvzilMyZqo25+4dmx3QBJ6cuDIgPF6psM2rYxGfs5VUQNeIhbYvEnudnSDd/CneGu8lvOp0PPxf/JMsgoQz0H/rnWD8jqGqfy0pSxqjExUabqgs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(7916004)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(478600001)(6486002)(6666004)(450100002)(186003)(6506007)(26005)(9686003)(6512007)(2906002)(66946007)(33716001)(41300700001)(4326008)(66556008)(316002)(5660300002)(8936002)(8676002)(66476007)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKlUZkIcxtEzM9PYTm0WWsITYRKE/euN4Mmi/641bG0od/2uTu+Y3Yk21vtV?=
 =?us-ascii?Q?q103wL+zH685aKQpQpVy7kJD1tUPQvUDj7qdP/7ZF+DNBd7QHkm86T9yOzo1?=
 =?us-ascii?Q?Doa3OM7kPtdlDIN6rJNWat3bFXYGXleHOKgq8Oy9DP5u1FKItqCPywlEKXkq?=
 =?us-ascii?Q?0fMtz4eTTiyxXm+FsGgNBDo9D07fihHBkVk6qAweZxfm804J/sf3JakUyfOj?=
 =?us-ascii?Q?NTiQCfncwtGeTWXNIX4DfVNUsrz9dxqecWUhkA7cCgASgvB00OH+wRGF1cEC?=
 =?us-ascii?Q?W83OThec6FSBcveJf8eOd3BH8hHDBNkCxv2LgReyInRpvJ3s7ILFIOjdTx6g?=
 =?us-ascii?Q?vwW/MWBM+w5TVPf+CgJwg2e+mAfFUzPuS7uef4utdx3lvwSF8J5ey7NAS008?=
 =?us-ascii?Q?DDXri4IZJM/t71Fz2WyU8i92fQQJAJngCXPXJwX+gQsDKIDRbquoo6Q0Q65z?=
 =?us-ascii?Q?yLW2PhefvCSluiiVytA8vT26FCDxmTXnKLCDqHgn5Llv67We9sasKDc3ZfS5?=
 =?us-ascii?Q?/L02eaHavS8zh4+aLkBl7XhMxCZfLmBgmF+EvSfTGebj9B03xEA1g2uVgHak?=
 =?us-ascii?Q?tqrlXzFfF7gjTNDASQ4A4xl2icXOQ/nR+J1XJEYTX0+Mlb+mYrC1MvpDBBdS?=
 =?us-ascii?Q?rCU46H694N44pD2hPuFlO3y8Ld8Eg31cITKVfVM0V3dG5G1FJBmx8ndf6Xn2?=
 =?us-ascii?Q?38sbjma4ilEW/uDnNtJWLRN2giEGdptTZchQju3oPW/sU8Ibxn+Wi9co86kN?=
 =?us-ascii?Q?ka8yxOxtt45vYe3Lm33NmDaiFVfSrEkCl9opiGdXxhXXTn1ul1buqVjSTpPx?=
 =?us-ascii?Q?OwRgCsJwrmBVBhb94Mb38vuNZrSmREHkLuTsh8SklbqrLPSy45/yMvKGxKSA?=
 =?us-ascii?Q?9X3njGxmkUkuVLBbaRVWRiie+ZbDz1L1xKQiA30ovwVdTcDzJzQQ/V0UUN6J?=
 =?us-ascii?Q?03P0BUOBYs3pUZ5oduOG5HRGcTYffQxQPNsbNRc414xiLMIr5lr7lHuVWLcr?=
 =?us-ascii?Q?SzammCffVgcxcukrHKXsVO5egd5LurYcMx1EdOpq+sSEqxUKx9j2RFWqmjW6?=
 =?us-ascii?Q?TTP+T/GLJgB8USa5/mKqiVWReNwriLDrFbdWeCyxk/dzUOPfY+xvx9ylqr3W?=
 =?us-ascii?Q?dolw6RnWJYTdyB/kZHzApLuoITE7gAlsKJ0jvlh00SFr+FS6YERRrcq3WVfV?=
 =?us-ascii?Q?wh8x5sn+rLLRLWXcyuxlKmHi9eYia/73BHxby4kvYstIyQnC4Dm7nxAcZkLo?=
 =?us-ascii?Q?2P7dQ6AGsmzmNroiOW0GaEHq4TpijruMUAjc3NEw10LyojEAX6ZgUCcJFq5u?=
 =?us-ascii?Q?vo1zMJkPc3HiFOUpSavNJxa+6qz/hMNgiHrKEyh3qbKNaJNeUQZfJroACbPZ?=
 =?us-ascii?Q?2cc6U0lelyVnb+vGEzzPFYlaZUGrs7UijEqgkWK+84UdWCLjXp7uTUXinT7C?=
 =?us-ascii?Q?nCxLPJPMMe73vFvgYRm4JjKF9j98vaPIJYVE43GsqiwTaC+/RYjsMURktlr3?=
 =?us-ascii?Q?tNX5Puq6lZIImhNv475urD9Y9EgZD+qiMfMKx2MrfItTX166omSMBWeFHlSL?=
 =?us-ascii?Q?wM5sTN4dw4UOjVaoQMgYMPCvskR9Jmjvd1lrkVsa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bdab3c-1527-4f5f-a316-08db7d323f30
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 08:31:36.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nP6MDrYB3XC1sVNooxYwxSVauPJYQcPVBMTsHRgdfFskeA1es3Go6xqYaRxvIy54M32SdBgidAV7PWo08RduWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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
Cc: Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Please ignore this patch, it will cause another issue.
Will send a new one.

Regards,
Lang

On 07/05/ , Lang Yu wrote:
> [   67.399887] refcount_t: underflow; use-after-free.
> [   67.399901] WARNING: CPU: 0 PID: 3172 at lib/refcount.c:28 refcount_warn_saturate+0xc2/0x110
> [   67.400124] RIP: 0010:refcount_warn_saturate+0xc2/0x110
> [   67.400173] Call Trace:
> [   67.400176]  <TASK>
> [   67.400181]  ttm_mem_evict_first+0x4fe/0x5b0 [ttm]
> [   67.400216]  ttm_bo_mem_space+0x1e3/0x240 [ttm]
> [   67.400239]  ttm_bo_validate+0xc7/0x190 [ttm]
> [   67.400253]  ? ww_mutex_trylock+0x1b1/0x390
> [   67.400266]  ttm_bo_init_reserved+0x183/0x1c0 [ttm]
> [   67.400280]  ? __rwlock_init+0x3d/0x70
> [   67.400292]  amdgpu_bo_create+0x1cd/0x4f0 [amdgpu]
> [   67.400607]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
> [   67.400980]  amdgpu_bo_create_user+0x38/0x70 [amdgpu]
> [   67.401291]  amdgpu_gem_object_create+0x77/0xb0 [amdgpu]
> [   67.401641]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
> [   67.401958]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x228/0xa30 [amdgpu]
> [   67.402433]  kfd_ioctl_alloc_memory_of_gpu+0x14e/0x390 [amdgpu]
> [   67.402824]  ? lock_release+0x13f/0x290
> [   67.402838]  kfd_ioctl+0x1e0/0x640 [amdgpu]
> [   67.403205]  ? __pfx_kfd_ioctl_alloc_memory_of_gpu+0x10/0x10 [amdgpu]
> [   67.403579]  ? tomoyo_file_ioctl+0x19/0x20
> [   67.403590]  __x64_sys_ioctl+0x95/0xd0
> [   67.403601]  do_syscall_64+0x3b/0x90
> [   67.403609]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> 
> Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")
> 
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bd5dae4d1624..e047b191001c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -308,6 +308,9 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
>  
>  	bo = container_of(work, typeof(*bo), delayed_delete);
>  
> +	if (!ttm_bo_get_unless_zero(bo))
> +		return;
> +
>  	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
>  			      MAX_SCHEDULE_TIMEOUT);
>  	dma_resv_lock(bo->base.resv, NULL);
> -- 
> 2.25.1
> 
