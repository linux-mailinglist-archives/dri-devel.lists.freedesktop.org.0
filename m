Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4FCB19C02
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5416B10E340;
	Mon,  4 Aug 2025 07:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MqddZeGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C473110E340
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:12:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-458a84e2917so33341065e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 00:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754291576; x=1754896376; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pins6pCk0Fa4rQAmFrWg25RZups1O5EoRcd2l2gX4sE=;
 b=MqddZeGP6pAixNPauXafwf8SKbq+HQE/ZeeDXZbhV6ke8jpVNFiIgUWyIYcqqxqVk/
 akUdO4a1tI5OM3ilxMbjGqFDAmjlrp0CQqT3yHtIFh8kORyV72NBmMahfNnW5v0Sd7Ja
 LzVgtZUC8/SXzzPI/glFFuQweH1ZE9Wiz0CiMSfKW7olGokUZEelicfGjge2LgQYJhdE
 O+yASvsQB/UL7VLmY/iykIOW3rnAzWYFiLn5Ctak0WcOXbpat+hMfoyBcBx4Nromj0IO
 0j4m57dFRmKO8dm8pOSuhvrNCvAsvSM6sTgO9LWWxRJFBNwZCtQJIZTDi/KnSPaySgnj
 25Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754291576; x=1754896376;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pins6pCk0Fa4rQAmFrWg25RZups1O5EoRcd2l2gX4sE=;
 b=Z6Cz12ihqBgInE9eHFvt5rBqutOcQs2S5cDJ0CkMX2vktEzBHIwwdnViO7bMkiLJuj
 /y/rRAgErrtWxMw9cQqetalUCAIVEv9F5r11WLiJHBMcc9iDcwHy6/k/ZZgwirUwoNby
 VCuf0GJ/lA/dvkw/OFY04lM0tUG1Sajpwy5JmnmFfS81IQqgjxWo3gO/hXdp9qBi750s
 s/vJNiwTji/OX1ZTKS6HzuembuibyplqGz3KtdvG52TyieuOBTNp2zmvCkm3vcIhzs71
 q9Bl6Fuo2Ekf/5mpiF/LlZdmvQurQCfM0gOMXqBQplHec884jZJlLK1YFkHaLUNhmQNL
 TrCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1pBK8lPy7Hz9yOsmKYJs1/DSYOPtwUp0VTa5FnKGwSiYMDTjI5LPOonB5qRfl9n70053HMfISjdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxh6zdxpx8d7RPhIn3tfsGqAXOm6dC3Bz/7RwjkE+MYIWzWVRg
 U6GlUX8Faue9p/Zc3/C8uyOy8OSjmfEYwtUSj1tn/W3dX0+KeqSOG7YrSzEltyILuz4=
X-Gm-Gg: ASbGncvVdlQyagKgQ8ZbpSLggDU1Urp/gS3NVa0JGWXuEIB6PH8b6foTcwsJhBJNbJu
 UZ3S7qiRCO9pOT3n1UdOFzaV+LX62NUQM2dkc533N92DnrHmjVaAxujgFZ4c/mn4q6qDtbaSGm7
 QdS8oxB+8EPRZkO8A4NWlTnc1okAKF7H+oD2t8RtsUHtNcwYWonHGcZdhuXsItmoa40ui2TcF2f
 wbv9W5T9mu0pnfn1q9ZQgscAjpfcrAJKJ06rBxiq7k67/f8UXCemGvbMvMQfMHRHNWIuEQ+yBdF
 9zlzqduHe27SnE+qAKA45CAgJPKbySFbBDaxzeO7MkwLis0fHQHzX6qRrmM5zRzNrGSIJMGw3Xz
 +8yYJL4nqKqXB9LCPbBRUzLWej00=
X-Google-Smtp-Source: AGHT+IFRLwySDJxGy6saRiUmoXuk2+5KeKGSB+JTT7r9m1nznyH/1R8mONHfgSxX/9MUe5BEsJDY3w==
X-Received: by 2002:a05:600c:4450:b0:453:9b7:c214 with SMTP id
 5b1f17b1804b1-458b6b43c1cmr59832095e9.29.1754291576213; 
 Mon, 04 Aug 2025 00:12:56 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm203814495e9.17.2025.08.04.00.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 00:12:55 -0700 (PDT)
Date: Mon, 4 Aug 2025 10:12:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: Add VM_BIND ioctl
Message-ID: <6117eece-fe02-40e5-80f0-66003b85997d@suswa.mountain>
References: <aI3C8c4iR3PmIMGE@stanley.mountain>
 <CACSVV00Bv+P2rzi0Wpnxba8VCTiVT_kK3voRZEZJGKrupSbigA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Bv+P2rzi0Wpnxba8VCTiVT_kK3voRZEZJGKrupSbigA@mail.gmail.com>
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

On Sat, Aug 02, 2025 at 06:12:56AM -0700, Rob Clark wrote:
> On Sat, Aug 2, 2025 at 12:49 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hello Rob Clark,
> >
> > Commit 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl") from Jun 29, 2025
> > (linux-next), leads to the following Smatch static checker warning:
> >
> >         drivers/gpu/drm/msm/msm_gem_vma.c:596 msm_gem_vm_sm_step_remap()
> >         error: we previously assumed 'vm_bo' could be null (see line 564)
> >
> > drivers/gpu/drm/msm/msm_gem_vma.c
> >     521 static int
> >     522 msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
> >     523 {
> >     524         struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
> >     525         struct drm_gpuvm *vm = job->vm;
> >     526         struct drm_gpuva *orig_vma = op->remap.unmap->va;
> >     527         struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
> >     528         struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
> >     529         bool mapped = to_msm_vma(orig_vma)->mapped;
> >     530         unsigned flags;
> >     531
> >     532         vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
> >     533                orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
> >     534
> >     535         if (mapped) {
> >     536                 uint64_t unmap_start, unmap_range;
> >     537
> >     538                 drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
> >     539
> >     540                 vm_op_enqueue(arg, (struct msm_vm_op){
> >     541                         .op = MSM_VM_OP_UNMAP,
> >     542                         .unmap = {
> >     543                                 .iova = unmap_start,
> >     544                                 .range = unmap_range,
> >     545                                 .queue_id = job->queue->id,
> >     546                         },
> >     547                         .obj = orig_vma->gem.obj,
> >     548                 });
> >     549
> >     550                 /*
> >     551                  * Part of this GEM obj is still mapped, but we're going to kill the
> >     552                  * existing VMA and replace it with one or two new ones (ie. two if
> >     553                  * the unmapped range is in the middle of the existing (unmap) VMA).
> >     554                  * So just set the state to unmapped:
> >     555                  */
> >     556                 to_msm_vma(orig_vma)->mapped = false;
> >     557         }
> >     558
> >     559         /*
> >     560          * Hold a ref to the vm_bo between the msm_gem_vma_close() and the
> >     561          * creation of the new prev/next vma's, in case the vm_bo is tracked
> >     562          * in the VM's evict list:
> >     563          */
> >     564         if (vm_bo)
> >                 ^^^^^^^^^^
> > NULL check
> >
> >     565                 drm_gpuvm_bo_get(vm_bo);
> >     566
> >     567         /*
> >     568          * The prev_vma and/or next_vma are replacing the unmapped vma, and
> >     569          * therefore should preserve it's flags:
> >     570          */
> >     571         flags = orig_vma->flags;
> >     572
> >     573         msm_gem_vma_close(orig_vma);
> >     574
> >     575         if (op->remap.prev) {
> >     576                 prev_vma = vma_from_op(arg, op->remap.prev);
> >     577                 if (WARN_ON(IS_ERR(prev_vma)))
> >     578                         return PTR_ERR(prev_vma);
> >     579
> >     580                 vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
> >     581                 to_msm_vma(prev_vma)->mapped = mapped;
> >     582                 prev_vma->flags = flags;
> >     583         }
> >     584
> >     585         if (op->remap.next) {
> >     586                 next_vma = vma_from_op(arg, op->remap.next);
> >     587                 if (WARN_ON(IS_ERR(next_vma)))
> >     588                         return PTR_ERR(next_vma);
> >     589
> >     590                 vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
> >     591                 to_msm_vma(next_vma)->mapped = mapped;
> >     592                 next_vma->flags = flags;
> >     593         }
> >     594
> >     595         if (!mapped)
> > --> 596                 drm_gpuvm_bo_evict(vm_bo, true);
> >                                            ^^^^^
> > Unchecked dereference.  Possibly if we're not mapped then it's non-NULL?
> > If so then just ignore this warning.
> 
> Correct, the !mapped case will only happen when the shrinker evicts
> BOs.  The case where the BO (and therefore vm_bo) is NULL, is MAP_NULL
> mappings which are backed by the PRR page, not a BO that can be
> evicted.
> 
> Would adding a WARN_ON(!vm_bo) convey to smatch that this case should
> not happen unless something somewhere else was rather screwed up?

No.  WARN_ON() doesn't mean something can't happen.  Just ignore it.
Old warnings are always false positives and if people have questions
they can find this thread on lore.

regards,
dan carpenter

