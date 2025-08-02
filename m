Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB62B18B2B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 09:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C198110E0FF;
	Sat,  2 Aug 2025 07:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EbhniN2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56F210E0FF
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 07:49:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3b8de6f7556so13063f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754120949; x=1754725749; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jc41eAaTwlF+ilpjGXVXKV/B+JMC260AXywvrCae45I=;
 b=EbhniN2XhhLpxsUdVy2QSZiKEqpq7TcE50gqbXNryECbeV7Q8f6S5oDraUdgUCtgL1
 Dtta2QwetpNFrWKYBuzNm4T8ddNQ/KQxiBYOaO0HRoVCHU4nmVXeXtk+ZTZkN1z6NSAx
 KmBmo+NjXZ4rPg0TNWJ3LF46MB2xjv1FKa51BWzN+3ajQz8EWrUGd/YYwpx2x16Ygoi3
 KykGwiZSELoMPKJcbfNVx364rj4EN1w/eQ5wZGTWx63/4QyXUAhoBlwK/ZDugY/QFr+v
 zOkCUrtanPulEwGp8cE1elH+iKQLnJ4InWlTATkS0KmAv6SlSJXszuR7j+1KnY3qyT6L
 9xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754120949; x=1754725749;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jc41eAaTwlF+ilpjGXVXKV/B+JMC260AXywvrCae45I=;
 b=DU5GT5okQGHDUlPSAyXh4pe4GyjKcjmjG0JYMAXmorhDkPkFV0ey7cJu0qS2I1IoGg
 FA9Nrp+kYMf0ZMV+oy/c5L2Tb3Ldrv3CSJUf9p06lkq8d8Ye94CYeh2po0FvvYnYGmG8
 d7N6seZQjY0w6SJFijGL4tOB5phn1BZwiNAkxDKsCkCjCBb/5sLbMhYcR8aYL5ikCkgR
 J/hcOHerQMqkfEowAWdx/t6hR6n2amWrL9YpniK+TQ2uTZYKIzuGbCeLEssJ0ZjaD+o1
 baqezmMgsgf8htLQO/NmEVNfM5BcmFPTCPbcYPZnNb5Ll0eRrpOylcgnDpN9+OV3MGxb
 JLHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKXb7hG94DrKN1h5Lg5EzcPOE+O0fQOC/0hQeCY0PNy/x3g9GNRKRsZ+P/d17I4piiuCsQ6eeFcIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx++HALNdnHWq+I+ejVF6NFJIhhGSxr+tXF1aeTEQiTUWqWPvOc
 qMqyg7AB1RtBvDE3jFL5TfBuSCVK1XaoG26AbxUamu6dtTcpSxCXwYfAekdXKkHni5KQ2l7HOwo
 8SzNY
X-Gm-Gg: ASbGncuWFRALlnQxLQq41r6Yckl/hmAEyfAX3Dyx0gpuTpQS/Tv3PI6xdDG1MCoKnkF
 jFx8So3WnBcYG/lPe8eGEBbYWpDTZjJMVPuNybrpSS9bN9m5fOl7aGxsxuv8hgW//HvJV08vPgF
 Fv5L6vsFfE5c4mID6SMjm6MLpcFEkX8IzVpPnpmEIomZYjLmv6WEIA5ixA6fgAORiM7y7Ac9cuO
 qQ5lJGXF54BFWr0/KKzTmh1Ye5eGoSS1XeOqfAEtytf4rusrvzkUw98jQXJhrWH3+bqoForc0EQ
 89pKxQE/UyXAqFJdBgi0W2OVBvwO5cMYe4IbsefTNuT0WrVyhP8ZHlnzp6wVR3Sd4PbfIl6Qdty
 aeGswf9prt4KWFN35XIoYx+Pkatk=
X-Google-Smtp-Source: AGHT+IGJDg+6ps6Mjc9ekjWCPSzQ0GJRPDNUWN8QdOsqxwaMblKCLjyVVDDVhNK92I/A+0L9596+VQ==
X-Received: by 2002:a05:6000:258a:b0:3b7:8984:5134 with SMTP id
 ffacd0b85a97d-3b8d94708c7mr1655077f8f.16.1754120949205; 
 Sat, 02 Aug 2025 00:49:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458bc39e694sm9541765e9.19.2025.08.02.00.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 00:49:08 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:49:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: Add VM_BIND ioctl
Message-ID: <aI3C8c4iR3PmIMGE@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Rob Clark,

Commit 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl") from Jun 29, 2025
(linux-next), leads to the following Smatch static checker warning:

	drivers/gpu/drm/msm/msm_gem_vma.c:596 msm_gem_vm_sm_step_remap()
	error: we previously assumed 'vm_bo' could be null (see line 564)

drivers/gpu/drm/msm/msm_gem_vma.c
    521 static int
    522 msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
    523 {
    524         struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
    525         struct drm_gpuvm *vm = job->vm;
    526         struct drm_gpuva *orig_vma = op->remap.unmap->va;
    527         struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
    528         struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
    529         bool mapped = to_msm_vma(orig_vma)->mapped;
    530         unsigned flags;
    531 
    532         vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
    533                orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
    534 
    535         if (mapped) {
    536                 uint64_t unmap_start, unmap_range;
    537 
    538                 drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
    539 
    540                 vm_op_enqueue(arg, (struct msm_vm_op){
    541                         .op = MSM_VM_OP_UNMAP,
    542                         .unmap = {
    543                                 .iova = unmap_start,
    544                                 .range = unmap_range,
    545                                 .queue_id = job->queue->id,
    546                         },
    547                         .obj = orig_vma->gem.obj,
    548                 });
    549 
    550                 /*
    551                  * Part of this GEM obj is still mapped, but we're going to kill the
    552                  * existing VMA and replace it with one or two new ones (ie. two if
    553                  * the unmapped range is in the middle of the existing (unmap) VMA).
    554                  * So just set the state to unmapped:
    555                  */
    556                 to_msm_vma(orig_vma)->mapped = false;
    557         }
    558 
    559         /*
    560          * Hold a ref to the vm_bo between the msm_gem_vma_close() and the
    561          * creation of the new prev/next vma's, in case the vm_bo is tracked
    562          * in the VM's evict list:
    563          */
    564         if (vm_bo)
                ^^^^^^^^^^
NULL check

    565                 drm_gpuvm_bo_get(vm_bo);
    566 
    567         /*
    568          * The prev_vma and/or next_vma are replacing the unmapped vma, and
    569          * therefore should preserve it's flags:
    570          */
    571         flags = orig_vma->flags;
    572 
    573         msm_gem_vma_close(orig_vma);
    574 
    575         if (op->remap.prev) {
    576                 prev_vma = vma_from_op(arg, op->remap.prev);
    577                 if (WARN_ON(IS_ERR(prev_vma)))
    578                         return PTR_ERR(prev_vma);
    579 
    580                 vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
    581                 to_msm_vma(prev_vma)->mapped = mapped;
    582                 prev_vma->flags = flags;
    583         }
    584 
    585         if (op->remap.next) {
    586                 next_vma = vma_from_op(arg, op->remap.next);
    587                 if (WARN_ON(IS_ERR(next_vma)))
    588                         return PTR_ERR(next_vma);
    589 
    590                 vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
    591                 to_msm_vma(next_vma)->mapped = mapped;
    592                 next_vma->flags = flags;
    593         }
    594 
    595         if (!mapped)
--> 596                 drm_gpuvm_bo_evict(vm_bo, true);
                                           ^^^^^
Unchecked dereference.  Possibly if we're not mapped then it's non-NULL?
If so then just ignore this warning.

    597 
    598         /* Drop the previous ref: */
    599         drm_gpuvm_bo_put(vm_bo);
    600 
    601         return 0;
    602 }

regards,
dan carpenter
