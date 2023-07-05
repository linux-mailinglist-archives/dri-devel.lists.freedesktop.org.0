Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467E7482DD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 13:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A5A10E157;
	Wed,  5 Jul 2023 11:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A27F10E154;
 Wed,  5 Jul 2023 11:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyFrek+0Gr9pNuHXOzvImIzoCpjEDDeIGExRtjQ9Vvtm4Q6IRIVCFkTUYmJR0fEQXM1IEWbtsN1Qsb9872QR2j1l4Yy5E73UM9VXqE1UBPM7DPWEqK3Mw/HwSDJV31zZR/gTaTS6wQh69x7//cFH3oaj/9RdnSh57Dg9/VRqxOUg0xSHteRtoHL0h0sI2fNYQX+ZGC4YVKEK7xkxUO4/475pI7SHBXrBNu5xNeD/rfWVydA8Q6dltQzwyQQssauOYnDQsmKaOZbqmKOwx4ydU9F2h+2P96s54FVfwsWLOSaPk889SToTUlXLKEJCwtyIu2G7hiZuVqMtx7nRiWW4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixFxBeI3h8+QNMIIeR+BBFsVXOS0/p+v80HWRYm3UXk=;
 b=Ib75w+a7UFHBY0oEdHQ5fIZ0xj+BkYHXXkaMpdKGKdjlAZ9eq5aPgTUcGRujXnrUJvt7tQdya5vuD3KggQgWZOs/Zb/eZtdV25qspJ9D0sVKIgkSKdBbcjOFZljNE8CTdsvVYdyDb4LeNwgiTfTcObaOkUIYh5AvBJ28dSP+PCQRcqzLVI0vkqOypg8GoYv9vAEywptOFXllFGCXkj7jD+iPbSq4uyLqUJlSab1sE3UfDmwjhzYKj/vG15N8NIpZzTske0iOpP4bLBo4wwQL77wI4prXjE1CafFtWkp5T7P9mfHSPIe48xASayc/jpicjwEGzF+bIft8E5fJ+fwiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixFxBeI3h8+QNMIIeR+BBFsVXOS0/p+v80HWRYm3UXk=;
 b=EU12+yGEqCEctcKW5CJMctDYrOfbOABgUWTPuTaPCSj6HAZ2BntAyaVE6zZn/aq2WNXR+n3ZzbK5f/4Mucirob+mbxD4BTO1VmD6yF/2ntN/rW5wee61UgNUTvc1vcMg48PxtI5xjk5bWy2VN5JHxpVLduWTS2mvPOpKr77ZiKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM4PR12MB7624.namprd12.prod.outlook.com (2603:10b6:8:107::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17; Wed, 5 Jul 2023 11:21:00 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::c4f0:c05:8644:5637]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::c4f0:c05:8644:5637%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 11:20:59 +0000
Date: Wed, 5 Jul 2023 19:20:51 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [PATCH v2] drm/ttm: fix one use-after-free
Message-ID: <ZKVSEw3nCsUnNUQN@lang-desktop>
References: <20230705100732.432835-1-Lang.Yu@amd.com>
 <CAM0jSHN7=8Kbnm2oTnSQ4HZd0sv+nf6R5nEfyXdmHedsr-t6rw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHN7=8Kbnm2oTnSQ4HZd0sv+nf6R5nEfyXdmHedsr-t6rw@mail.gmail.com>
X-ClientProxiedBy: TY2PR0101CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::14) To DM6PR12MB4250.namprd12.prod.outlook.com
 (2603:10b6:5:21a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4250:EE_|DM4PR12MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1d002c-2f89-4c45-23c1-08db7d49e8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIFvNq12Ap15uOZjSd2jGb5CKKls5ilPvKuhm+I0Dfj/O3kgYm9kjVnCoialPEMK8rn7G2kkFhXUmySNU//Ejifs6fp9qfbPyr1nPjeS1/oB/B9RO5rPBpxa0Zza+J0s0aT1PUgyx3GJBuNT7AcAxwbjpFKcpGsAVeAWc7Ol7GzKU78FS/CudGpWxkYhaibtONdonTkH0oMxh2xCBcSJNFyQUA3HOBVvq8EBa+k9h349M5KThZCGLn1z0+Ay6ImPSsEMgBrrq8MKmJgflX04SYyMw7/7wav2iEE4SqUEdbDm8+LyMsNA0NRxrV1sjEoXU78RlLBgfvblMkoa/+oky78s7HzOfbKrW5foHEWIbBGr8Ehd3qskoGVTw836MyeveUHVR7P3XhjMM08cIWOhhf0SqeVBjqiFEH5NDxiHIxhuyhPSxX6z+ktCIfCuMbxTXIAEJ+NGeqXaFwKEXW3ns8GQyOinCPo3YZocrsqpSdwP1T/3izBiERmNfqqpBysIR1mwR3jqwvRZZiG9MhNqdVijlRe76xa4qqd4f3+/7v61FukOWOowyYejP18tMDMc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(7916004)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(5660300002)(6506007)(26005)(186003)(41300700001)(6666004)(6486002)(66946007)(4326008)(66556008)(66476007)(316002)(83380400001)(6916009)(478600001)(6512007)(9686003)(38100700002)(86362001)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jNSyu2vZ9bZUXnQBPGssbNc7+4+c7VPLGZIiz4nK0ttn82Enp+eu7ER1XvXF?=
 =?us-ascii?Q?/DTrqfrCAoQF2bgiOhdHZp9KP3ihqMsyT1JmoE6IyvScYsxV+yoa5Xc8EAcI?=
 =?us-ascii?Q?/RTD4y6+7XB/rHtF7+5Bxit1pQiu28dJxrKc8oHMMMoN3D/yCXUchSXwf7Tx?=
 =?us-ascii?Q?IvHDqFCSAI36XANmv9HsfuCJA1Ebf8B1M5mjZiCi7ypPpUZggqpbYnmuK0/M?=
 =?us-ascii?Q?w1Z/F+7BrWD4sArEDxMHmBz/RzOprExU3IIioWTL8C6NcASWL+gigMNy6JxX?=
 =?us-ascii?Q?u4uMtKcSN1zxzVGuCcuis/4tI3H6jwpvlQljuCI0cQRnjoLTalJytb0I7FvY?=
 =?us-ascii?Q?QRz7xdJfXk6FIuTmMDv4FsIfUXYgqUZons0VRzRnJaEkeZnQUr/4ehqgS2ua?=
 =?us-ascii?Q?ZOjqEa4URCym67S1BN6qMauTx57XQrCGrGeJ3bh3J9LpW1jE8blL8par9vid?=
 =?us-ascii?Q?DX3MVnD0YVYfdlMwcM4THUJaO2hy+cTvyrZFfui+fPoa8RSzyyIUbNjwDkdA?=
 =?us-ascii?Q?Q5JdMybPxHOtcSPg/ojIVr4h7HoPsI2lKnN+smGxvGWfoqcn8eOVNarWyd1D?=
 =?us-ascii?Q?XyZii0KhOl9fBGtnTaNPOuJM/UH1rnoh2C9txHKkG2Tx2WW66F0KWP8WgVhM?=
 =?us-ascii?Q?NDGFx8NKVhZbqdDgiZnTsxCaJGGlMz9o/ZJGdW5+pIWTGtomnLPKWnJ9q0zY?=
 =?us-ascii?Q?q7c4yn165UByhXN24O18ZX6N6747soQ5DchCSJWJc+9C6xMiaupQaSlC3WpD?=
 =?us-ascii?Q?tZE4ux4vgs0lJcNp27DjD1ldFBme8knSIYCMAnjKPf8oCf8neVu+TIfY0r6o?=
 =?us-ascii?Q?+E2m4G2XEbr4Vv2TdxCv/7UsSZg2/HLxhJ1l934g5jdUb+TsU8jyN5M+pJFz?=
 =?us-ascii?Q?CF6n3gxlpqazY+n/Wx5vmQ8AjyoZ50o6TmncR5naJz+XAmw7p3cnEd0LGeSV?=
 =?us-ascii?Q?j0tfUu9cqS1yoVZLL6rnoxGhM1QU9ZX8O72txf2MStUFfFpF52wj3aHDodfQ?=
 =?us-ascii?Q?c++qZbxoglMV4pIhAzLf7jzMJXXvCOMa0sq6jls8OEAUPncJUKD6lhLFrObI?=
 =?us-ascii?Q?6wTcxQ28gATZvVzfttyJjjyhgTAicCBrRBft+mCcIqV5pg6uGonwfX5CjaYQ?=
 =?us-ascii?Q?Hy6wKsrv4ySH3L5+iQt/VrhBb6Jr83JrMu4BIsNeQpMjWjgqb6s08Zhi2KHj?=
 =?us-ascii?Q?Jia2SYmjvT3mh0dSl+tKYk0yIkKi8UEN7mRSqSPhK2uTR3BayJ0M95lmDNE+?=
 =?us-ascii?Q?x/R2SoQnSj5amkbaxhTpxmFKpLOwfIv7tR1citk/PlKS/5wll+YksbPiVViG?=
 =?us-ascii?Q?zdKsfmRuA4rWO00I2pTsFMxnKkcvlWLIef8vWGaHh1d+BsdeUx2mKBa8nYO4?=
 =?us-ascii?Q?aBq7XNq9n21VmHIjkU1cMZWk/qN9JV95La/7cn656xeKKvcENGoavXmsMoT1?=
 =?us-ascii?Q?zfJq4tsGMeUYOIG3udPKmb5kZ2ci4DQno3hfP7lk/xmenaJQrdnMCeqJaolH?=
 =?us-ascii?Q?SeBb4ICYV2qcr7rdJ1vFCQGAIQC240gGjOAZ+bDD2Y5aa7MRWDuy1zrA6qPC?=
 =?us-ascii?Q?Pux0zxHTIzsH/e0e6w/fij7u3h1jFYMk/e3yiyMk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1d002c-2f89-4c45-23c1-08db7d49e8d9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:20:59.7230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvCSK9g9ToxGCvT4QxWi4Ijg86UO9VIJQH96g5diM/Dz1+hBNAyLFvx2JdZIA2qaBUHyI2ORb805VPxLPnBpEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7624
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/ , Matthew Auld wrote:
> On Wed, 5 Jul 2023 at 11:08, Lang Yu <Lang.Yu@amd.com> wrote:
> >
> > bo->kref is increased once(kref_init()) in ttm_bo_release,
> > but decreased twice(ttm_bo_put()) respectively in
> > ttm_bo_delayed_delete and ttm_bo_cleanup_refs,
> > which is unbalanced.
> >
> > Just clean up bo resource in one place for a delayed deleted bo.
> >
> > Fixes: 9bff18d13473 ("drm/ttm: use per BO cleanup workers")
> >
> > [   67.399887] refcount_t: underflow; use-after-free.
> > [   67.399901] WARNING: CPU: 0 PID: 3172 at lib/refcount.c:28 refcount_warn_saturate+0xc2/0x110
> > [   67.400124] RIP: 0010:refcount_warn_saturate+0xc2/0x110
> > [   67.400173] Call Trace:
> > [   67.400176]  <TASK>
> > [   67.400181]  ttm_mem_evict_first+0x4fe/0x5b0 [ttm]
> > [   67.400216]  ttm_bo_mem_space+0x1e3/0x240 [ttm]
> > [   67.400239]  ttm_bo_validate+0xc7/0x190 [ttm]
> > [   67.400253]  ? ww_mutex_trylock+0x1b1/0x390
> > [   67.400266]  ttm_bo_init_reserved+0x183/0x1c0 [ttm]
> > [   67.400280]  ? __rwlock_init+0x3d/0x70
> > [   67.400292]  amdgpu_bo_create+0x1cd/0x4f0 [amdgpu]
> > [   67.400607]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
> > [   67.400980]  amdgpu_bo_create_user+0x38/0x70 [amdgpu]
> > [   67.401291]  amdgpu_gem_object_create+0x77/0xb0 [amdgpu]
> > [   67.401641]  ? __pfx_amdgpu_bo_user_destroy+0x10/0x10 [amdgpu]
> > [   67.401958]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x228/0xa30 [amdgpu]
> > [   67.402433]  kfd_ioctl_alloc_memory_of_gpu+0x14e/0x390 [amdgpu]
> > [   67.402824]  ? lock_release+0x13f/0x290
> > [   67.402838]  kfd_ioctl+0x1e0/0x640 [amdgpu]
> > [   67.403205]  ? __pfx_kfd_ioctl_alloc_memory_of_gpu+0x10/0x10 [amdgpu]
> > [   67.403579]  ? tomoyo_file_ioctl+0x19/0x20
> > [   67.403590]  __x64_sys_ioctl+0x95/0xd0
> > [   67.403601]  do_syscall_64+0x3b/0x90
> > [   67.403609]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> >
> > Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo.c | 89 ++++--------------------------------
> >  1 file changed, 10 insertions(+), 79 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 326a3d13a829..1e073dfb1332 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -224,82 +224,6 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
> >         dma_resv_iter_end(&cursor);
> >  }
> >
> > -/**
> > - * ttm_bo_cleanup_refs
> > - * If bo idle, remove from lru lists, and unref.
> > - * If not idle, block if possible.
> > - *
> > - * Must be called with lru_lock and reservation held, this function
> > - * will drop the lru lock and optionally the reservation lock before returning.
> > - *
> > - * @bo:                    The buffer object to clean-up
> > - * @interruptible:         Any sleeps should occur interruptibly.
> > - * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
> > - * @unlock_resv:           Unlock the reservation lock as well.
> > - */
> > -
> > -static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> > -                              bool interruptible, bool no_wait_gpu,
> > -                              bool unlock_resv)
> > -{
> > -       struct dma_resv *resv = &bo->base._resv;
> > -       int ret;
> > -
> > -       if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
> > -               ret = 0;
> > -       else
> > -               ret = -EBUSY;
> > -
> > -       if (ret && !no_wait_gpu) {
> > -               long lret;
> > -
> > -               if (unlock_resv)
> > -                       dma_resv_unlock(bo->base.resv);
> > -               spin_unlock(&bo->bdev->lru_lock);
> > -
> > -               lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
> > -                                            interruptible,
> > -                                            30 * HZ);
> > -
> > -               if (lret < 0)
> > -                       return lret;
> > -               else if (lret == 0)
> > -                       return -EBUSY;
> > -
> > -               spin_lock(&bo->bdev->lru_lock);
> > -               if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
> > -                       /*
> > -                        * We raced, and lost, someone else holds the reservation now,
> > -                        * and is probably busy in ttm_bo_cleanup_memtype_use.
> > -                        *
> > -                        * Even if it's not the case, because we finished waiting any
> > -                        * delayed destruction would succeed, so just return success
> > -                        * here.
> > -                        */
> > -                       spin_unlock(&bo->bdev->lru_lock);
> > -                       return 0;
> > -               }
> > -               ret = 0;
> > -       }
> > -
> > -       if (ret) {
> > -               if (unlock_resv)
> > -                       dma_resv_unlock(bo->base.resv);
> > -               spin_unlock(&bo->bdev->lru_lock);
> > -               return ret;
> > -       }
> > -
> > -       spin_unlock(&bo->bdev->lru_lock);
> > -       ttm_bo_cleanup_memtype_use(bo);
> > -
> > -       if (unlock_resv)
> > -               dma_resv_unlock(bo->base.resv);
> > -
> > -       ttm_bo_put(bo);
> 
> The put() here is indeed broken and leads to some nasty uaf I think,
> but we fixed that a while back in: c00133a9e87e ("drm/ttm: drop extra
> ttm_bo_put in ttm_bo_cleanup_refs"). It looks like you are using an
> old tree? Perhaps the issue you are seeing was also fixed with that?

Thanks. I can see this commit in my tree but it was overrode by other
patches. It fixed this issue.

Regards,
Lang

> > -
> > -       return 0;
> > -}
> > -
> >  /*
> >   * Block for the dma_resv object to become idle, lock the buffer and clean up
> >   * the resource and tt object.
> > @@ -622,8 +546,10 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
> >         }
> >
> >         if (bo->deleted) {
> > -               ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
> > -                                         ctx->no_wait_gpu, locked);
> > +               if (locked)
> > +                       dma_resv_unlock(bo->base.resv);
> > +               spin_unlock(&bdev->lru_lock);
> > +               ret = ttm_bo_wait_ctx(bo, ctx);
> >                 ttm_bo_put(bo);
> >                 return ret;
> >         }
> > @@ -1146,7 +1072,12 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> >         }
> >
> >         if (bo->deleted) {
> > -               ret = ttm_bo_cleanup_refs(bo, false, false, locked);
> > +               struct ttm_operation_ctx ctx = { false, false };
> > +
> > +               if (locked)
> > +                       dma_resv_unlock(bo->base.resv);
> > +               spin_unlock(&bo->bdev->lru_lock);
> > +               ret = ttm_bo_wait_ctx(bo, &ctx);
> >                 ttm_bo_put(bo);
> >                 return ret == -EBUSY ? -ENOSPC : ret;
> >         }
> > --
> > 2.25.1
> >
