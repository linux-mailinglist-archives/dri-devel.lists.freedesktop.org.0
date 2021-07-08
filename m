Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037403BF833
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 12:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0D06E1B4;
	Thu,  8 Jul 2021 10:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8D86E1B4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 10:14:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i8so6781609wrp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 03:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lyZCbSZRs5QWa1dAagrTMwok1IOCe43lUm9egUvvmjE=;
 b=YsWy2dZQ8V2dTOBrWzfjmF8JYnlC01sLZmPobTY0Z1t+E/+uVaOWbx+qRXzpHmpIpF
 1TMtK0sNeOL4yit/Cq8HU9H8LDqDESljP0jr8IbTBrZjDlz/Fs6Xc3i7zmpHR8QbNXbO
 At7M3Pivl7ODe+rGWSmIED8uFP90Y7IEvvFN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lyZCbSZRs5QWa1dAagrTMwok1IOCe43lUm9egUvvmjE=;
 b=LuvpclEd9MLcXzzWFfR9gikTMD0fSJ5ADEq1OVfKQzwhxpm7W1BSIhTjlQYwXL0inH
 HEUCr9TbA6Tue4vutY0C7UKLNl8I25bJCbmGEISRM34ghlpayON+rvG9Z2Yvbn2KmJLt
 72SkxY1iUFWQCTCuVtpUCpy7tUej/iYen7j2jbvEAgb/zob/hofW34G877bGU7CjCBQn
 w6qTQVyxDDV4POuUwdO6CimeJLYhc0bA31ikXAQERGdv+zakN/qOnXpmVtKeN9frtjRU
 EPT1k56/ohrLj2m3UxNKQme6djlGQzO/hUfCMW19/X0nuA2+oNhJ22qdUXp08qKcbHhc
 heKA==
X-Gm-Message-State: AOAM533tjnYQyabut55bonlSiJK5q6m162t0w6X0t/hmp1nhoN4bIVH/
 IDN9T9Tpi2kUVRbFfg/Em107Nby5ddU4gQ==
X-Google-Smtp-Source: ABdhPJw+gxkuXEz3dzYYYuXUCF5AHqh/yOIb+/ETtITv8fSb9Zn0wsySyXbTp42rNMCoq9+uMyOf0w==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr15255644wrw.166.1625739266789; 
 Thu, 08 Jul 2021 03:14:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w13sm1750870wrl.47.2021.07.08.03.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 03:14:26 -0700 (PDT)
Date: Thu, 8 Jul 2021 12:14:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Roberto Sassu <roberto.sassu@huawei.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Dave Airlie <airlied@gmail.com>
Subject: Re: Oops in qxl_bo_move_notify()
Message-ID: <YObQAIhvrZXlQ5HX@phenom.ffwll.local>
References: <3c414722f5d84875a9251b3cc120a26a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c414722f5d84875a9251b3cc120a26a@huawei.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 04:36:49PM +0000, Roberto Sassu wrote:
> Hi
> 
> I'm getting this oops (on commit a180bd1d7e16):
> 
>     [   17.711520] BUG: kernel NULL pointer dereference, address: 0000000000000010
>     [   17.739451] RIP: 0010:qxl_bo_move_notify+0x35/0x80 [qxl]
>     [   17.827345] RSP: 0018:ffffc90000457c08 EFLAGS: 00010286
>     [   17.827350] RAX: 0000000000000001 RBX: 0000000000000000 RCX: dffffc0000000000
>     [   17.827353] RDX: 0000000000000007 RSI: 0000000000000004 RDI: ffffffff85596feb
>     [   17.827356] RBP: ffff88800e311c00 R08: 0000000000000000 R09: 0000000000000000
>     [   17.827358] R10: ffffffff8697b243 R11: fffffbfff0d2f648 R12: 0000000000000000
>     [   17.827361] R13: ffff88800e311e48 R14: ffff88800e311e98 R15: ffff88800e311e90
>     [   17.827364] FS:  0000000000000000(0000) GS:ffff88805d800000(0000) knlGS:0000000000000000
>     [   17.861699] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   17.861703] CR2: 0000000000000010 CR3: 000000002642c000 CR4: 0000000000350ee0
>     [   17.861707] Call Trace:
>     [   17.861712]  ttm_bo_cleanup_memtype_use+0x4d/0xb0 [ttm]
>     [   17.861730]  ttm_bo_release+0x42d/0x7c0 [ttm]
>     [   17.861746]  ? ttm_bo_cleanup_refs+0x127/0x420 [ttm]
>     [   17.888300]  ttm_bo_delayed_delete+0x289/0x390 [ttm]
>     [   17.888317]  ? ttm_bo_cleanup_refs+0x420/0x420 [ttm]
>     [   17.888332]  ? lock_release+0x9c/0x5c0
>     [   17.901033]  ? rcu_read_lock_held_common+0x1a/0x50
>     [   17.905183]  ttm_device_delayed_workqueue+0x18/0x50 [ttm]
>     [   17.909371]  process_one_work+0x537/0x9f0
>     [   17.913345]  ? pwq_dec_nr_in_flight+0x160/0x160
>     [   17.917297]  ? lock_acquired+0xa4/0x580
>     [   17.921168]  ? worker_thread+0x169/0x600
>     [   17.925034]  worker_thread+0x7a/0x600
>     [   17.928657]  ? process_one_work+0x9f0/0x9f0
>     [   17.932360]  kthread+0x200/0x230
>     [   17.935930]  ? set_kthread_struct+0x80/0x80
>     [   17.939593]  ret_from_fork+0x22/0x30
>     [   17.951737] CR2: 0000000000000010
>     [   17.955496] ---[ end trace e30cc21c24e81ee5 ]---
> 
> I had a look at the code, and it seems that this is caused by
> trying to use bo->resource which is NULL.
> 
> bo->resource is freed by ttm_bo_cleanup_refs() ->
> ttm_bo_cleanup_memtype_use() -> ttm_resource_free().
> 
> And then a notification is issued by ttm_bo_cleanup_refs() ->
> ttm_bo_put() -> ttm_bo_release() ->
> ttm_bo_cleanup_memtype_use(), this time with bo->release
> equal to NULL.
> 
> I was thinking a proper way to fix this. Checking that
> bo->release is not NULL in qxl_bo_move_notify() would
> solve the issue. But maybe there is a better way, like
> avoiding that ttm_bo_cleanup_memtype_use() is called
> twice. Which way would be preferable?

Adding Christian and Dave, who've touched all this recently iirc.
-Daniel

> 
> Thanks
> 
> Roberto
> 
> HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> Managing Director: Li Peng, Li Jian, Shi Yanli

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
