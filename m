Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E8591C581
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CD310ECF3;
	Fri, 28 Jun 2024 18:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="W+6416L2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29FC10ECF6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:13:36 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec4e9075e0so1309951fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719598415; x=1720203215; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=huxmsGyg+iUWrBMicDmaxHSG7pbm8X2WK1OQEgwi0+I=;
 b=W+6416L2uhsREPPUsZtM3+KpJCkX62ngePgSI7cSZIkmnFm4AgOjChClK5K5KxrCHh
 4LHsJgtOhvZh3f09IQD91YFNc3mydDerY/B8f/KSTbC0vAew+80RwRPwJF+1aQx5EZZl
 blNlVg/TMzmk2dXN4NzmArK7eff1x2Kb3uJI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719598415; x=1720203215;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=huxmsGyg+iUWrBMicDmaxHSG7pbm8X2WK1OQEgwi0+I=;
 b=jLP+ywRXFMUYa/5ItZbzO+FgLEtBjPdpQe1OkI3YUEWKeqrpwJhOeORZEmDwN8tI5m
 jFvetoxdx5QCwsCmnLl28Da/9mpYal9D9RAXvGXe1xenz+3QwDUdUmXfE29MCQ2fVOh/
 t7mNH/VaJb7N7l1JgBSs8ENSXqRNXqxPrOm1CxSdlnA8NvcFXsr7rTCtBDU3BP3oZJcc
 2JH/dA2/BkcPpB8NGj6PTESEdoccxLbmtL6t+HHhYqYCeVVzgwPJp4z3xA2A1ChwDLsD
 Y3eIy/DbOLqiuHtjiHHmP2yTXxqnpZJZp3CrmKE59PMwIqsywSNCWG/c4u6Oz6s4lt9G
 Hf7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIQ7mRP8gW8OGGJgWoJchm9dreyfQRb9K+3r5lWhpR6jf9tXTK2SYw+M+M4nswFNJJQxMhkE4y+lKHPsDgmCcXr33N8avl1h5w3HghCP4Q
X-Gm-Message-State: AOJu0YynZ/EXmKsmkkZ9pn/tyWyE99Pb0OB+EMpZCZ+LieRW7yRRzwvQ
 +VQlDKGn5qWoiB79s/EnNlX+AuVZhbzFGslD6OP12nBnwbtfySMKIvY+981t+WsWt7sM+IaBtZN
 QQsc=
X-Google-Smtp-Source: AGHT+IE5lOHbq58vJ8cWAIxbIekJmFwVNdX2XgbfvBOtIf4Qv7xRVWjSmCHxNA5l5enxjRzWddwS1g==
X-Received: by 2002:a05:651c:1986:b0:2ec:5365:34d3 with SMTP id
 38308e7fff4ca-2ec560e8d60mr148913521fa.1.1719598415010; 
 Fri, 28 Jun 2024 11:13:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm44777175e9.47.2024.06.28.11.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:13:34 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:13:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/ttm: Always take the bo delayed cleanup path for
 imported bos
Message-ID: <Zn79TNg1WfERV7gj@phenom.ffwll.local>
References: <20240628153848.4989-1-thomas.hellstrom@linux.intel.com>
 <Zn7cBbi/iZ1cxWPb@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zn7cBbi/iZ1cxWPb@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 28, 2024 at 03:51:33PM +0000, Matthew Brost wrote:
> On Fri, Jun 28, 2024 at 05:38:48PM +0200, Thomas Hellström wrote:
> > Bos can be put with multiple unrelated dma-resv locks held. But
> > imported bos attempt to grab the bo dma-resv during dma-buf detach
> > that typically happens during cleanup. That leads to lockde splats
> > similar to the below and a potential ABBA deadlock.
> > 
> > Fix this by always taking the delayed workqueue cleanup path for
> > imported bos.
> > 
> > Requesting stable fixes from when the Xe driver was introduced,
> > since its usage of drm_exec and wide vm dma_resvs appear to be
> > the first reliable trigger of this.
> > 
> > [22982.116427] ============================================
> > [22982.116428] WARNING: possible recursive locking detected
> > [22982.116429] 6.10.0-rc2+ #10 Tainted: G     U  W
> > [22982.116430] --------------------------------------------
> > [22982.116430] glxgears:sh0/5785 is trying to acquire lock:
> > [22982.116431] ffff8c2bafa539a8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: dma_buf_detach+0x3b/0xf0
> > [22982.116438]
> >                but task is already holding lock:
> > [22982.116438] ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> > [22982.116442]
> >                other info that might help us debug this:
> > [22982.116442]  Possible unsafe locking scenario:
> > 
> > [22982.116443]        CPU0
> > [22982.116444]        ----
> > [22982.116444]   lock(reservation_ww_class_mutex);
> > [22982.116445]   lock(reservation_ww_class_mutex);
> > [22982.116447]
> >                 *** DEADLOCK ***
> > 
> > [22982.116447]  May be due to missing lock nesting notation
> > 
> > [22982.116448] 5 locks held by glxgears:sh0/5785:
> > [22982.116449]  #0: ffff8c2d9aba58c8 (&xef->vm.lock){+.+.}-{3:3}, at: xe_file_close+0xde/0x1c0 [xe]
> > [22982.116507]  #1: ffff8c2e28cc8480 (&vm->lock){++++}-{3:3}, at: xe_vm_close_and_put+0x161/0x9b0 [xe]
> > [22982.116578]  #2: ffff8c2e31982970 (&val->lock){.+.+}-{3:3}, at: xe_validation_ctx_init+0x6d/0x70 [xe]
> > [22982.116647]  #3: ffffacdc469478a8 (reservation_ww_class_acquire){+.+.}-{0:0}, at: xe_vma_destroy_unlocked+0x7f/0xe0 [xe]
> > [22982.116716]  #4: ffff8c2d9aba6da8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x49/0x2b0 [drm_exec]
> > [22982.116719]
> >                stack backtrace:
> > [22982.116720] CPU: 8 PID: 5785 Comm: glxgears:sh0 Tainted: G     U  W          6.10.0-rc2+ #10
> > [22982.116721] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 2001 02/01/2023
> > [22982.116723] Call Trace:
> > [22982.116724]  <TASK>
> > [22982.116725]  dump_stack_lvl+0x77/0xb0
> > [22982.116727]  __lock_acquire+0x1232/0x2160
> > [22982.116730]  lock_acquire+0xcb/0x2d0
> > [22982.116732]  ? dma_buf_detach+0x3b/0xf0
> > [22982.116734]  ? __lock_acquire+0x417/0x2160
> > [22982.116736]  __ww_mutex_lock.constprop.0+0xd0/0x13b0
> > [22982.116738]  ? dma_buf_detach+0x3b/0xf0
> > [22982.116741]  ? dma_buf_detach+0x3b/0xf0
> > [22982.116743]  ? ww_mutex_lock+0x2b/0x90
> > [22982.116745]  ww_mutex_lock+0x2b/0x90
> > [22982.116747]  dma_buf_detach+0x3b/0xf0
> > [22982.116749]  drm_prime_gem_destroy+0x2f/0x40 [drm]
> > [22982.116775]  xe_ttm_bo_destroy+0x32/0x220 [xe]
> > [22982.116818]  ? __mutex_unlock_slowpath+0x3a/0x290
> > [22982.116821]  drm_exec_unlock_all+0xa1/0xd0 [drm_exec]
> > [22982.116823]  drm_exec_fini+0x12/0xb0 [drm_exec]
> > [22982.116824]  xe_validation_ctx_fini+0x15/0x40 [xe]
> > [22982.116892]  xe_vma_destroy_unlocked+0xb1/0xe0 [xe]
> > [22982.116959]  xe_vm_close_and_put+0x41a/0x9b0 [xe]
> > [22982.117025]  ? xa_find+0xe3/0x1e0
> > [22982.117028]  xe_file_close+0x10a/0x1c0 [xe]
> > [22982.117074]  drm_file_free+0x22a/0x280 [drm]
> > [22982.117099]  drm_release_noglobal+0x22/0x70 [drm]
> > [22982.117119]  __fput+0xf1/0x2d0
> > [22982.117122]  task_work_run+0x59/0x90
> > [22982.117125]  do_exit+0x330/0xb40
> > [22982.117127]  do_group_exit+0x36/0xa0
> > [22982.117129]  get_signal+0xbd2/0xbe0
> > [22982.117131]  arch_do_signal_or_restart+0x3e/0x240
> > [22982.117134]  syscall_exit_to_user_mode+0x1e7/0x290
> > [22982.117137]  do_syscall_64+0xa1/0x180
> > [22982.117139]  ? lock_acquire+0xcb/0x2d0
> > [22982.117140]  ? __set_task_comm+0x28/0x1e0
> > [22982.117141]  ? find_held_lock+0x2b/0x80
> > [22982.117144]  ? __set_task_comm+0xe1/0x1e0
> > [22982.117145]  ? lock_release+0xca/0x290
> > [22982.117147]  ? __do_sys_prctl+0x245/0xab0
> > [22982.117149]  ? lockdep_hardirqs_on_prepare+0xde/0x190
> > [22982.117150]  ? syscall_exit_to_user_mode+0xb0/0x290
> > [22982.117152]  ? do_syscall_64+0xa1/0x180
> > [22982.117154]  ? __lock_acquire+0x417/0x2160
> > [22982.117155]  ? reacquire_held_locks+0xd1/0x1f0
> > [22982.117156]  ? do_user_addr_fault+0x30c/0x790
> > [22982.117158]  ? lock_acquire+0xcb/0x2d0
> > [22982.117160]  ? find_held_lock+0x2b/0x80
> > [22982.117162]  ? do_user_addr_fault+0x357/0x790
> > [22982.117163]  ? lock_release+0xca/0x290
> > [22982.117164]  ? do_user_addr_fault+0x361/0x790
> > [22982.117166]  ? trace_hardirqs_off+0x4b/0xc0
> > [22982.117168]  ? clear_bhb_loop+0x45/0xa0
> > [22982.117170]  ? clear_bhb_loop+0x45/0xa0
> > [22982.117172]  ? clear_bhb_loop+0x45/0xa0
> > [22982.117174]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [22982.117176] RIP: 0033:0x7f943d267169
> > [22982.117192] Code: Unable to access opcode bytes at 0x7f943d26713f.
> > [22982.117193] RSP: 002b:00007f9430bffc80 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> > [22982.117195] RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00007f943d267169
> > [22982.117196] RDX: 0000000000000000 RSI: 0000000000000189 RDI: 00005622f89579d0
> > [22982.117197] RBP: 00007f9430bffcb0 R08: 0000000000000000 R09: 00000000ffffffff
> > [22982.117198] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > [22982.117199] R13: 0000000000000000 R14: 0000000000000000 R15: 00005622f89579d0
> > [22982.117202]  </TASK>
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: intel-xe@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v6.8+
> 
> Patch and explaination makes sense to me.
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I guess for stable this is good since minimal, but after Thomas explaine
what he meant with dma_buf_detach_unlocked I think that total sense as a
follow-up patch maybe.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
> 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 6396dece0db1..2427be8bc97f 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -346,6 +346,7 @@ static void ttm_bo_release(struct kref *kref)
> >  		if (!dma_resv_test_signaled(bo->base.resv,
> >  					    DMA_RESV_USAGE_BOOKKEEP) ||
> >  		    (want_init_on_free() && (bo->ttm != NULL)) ||
> > +		    bo->type == ttm_bo_type_sg ||
> >  		    !dma_resv_trylock(bo->base.resv)) {
> >  			/* The BO is not idle, resurrect it for delayed destroy */
> >  			ttm_bo_flush_all_fences(bo);
> > -- 
> > 2.44.0
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
