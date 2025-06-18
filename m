Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69487ADF8B1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 23:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B7710E960;
	Wed, 18 Jun 2025 21:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GB40cQNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4AB10E960
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 21:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750281820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
 b=GB40cQNOblbY2o3qcszXeN/510fUoUs7/awKM7JOhpGLcz4bG83bMb9sC3ywiYw9fhQBXB
 vRe00QFeXVxRkBMjMqU+2bfd2awcOlDqhkSd+XjFxkmGwXU9/Q4SGq2JF5ZVvdDrALSpFe
 raGNZ1sB6qHDvZVDzkrUajYPJyjZJaA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-gmXzY2AQO72UElsIW7PF3Q-1; Wed, 18 Jun 2025 17:23:39 -0400
X-MC-Unique: gmXzY2AQO72UElsIW7PF3Q-1
X-Mimecast-MFC-AGG-ID: gmXzY2AQO72UElsIW7PF3Q_1750281818
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4ff581df3so28817f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750281818; x=1750886618;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
 b=DWDvgE6/R82YfyQUPCkXylzerwOmwxc563VnADP7w/kwyrMb38E7f4leFna7HBDDeA
 0T22LSms0KcYhQSiam3owEWy0rlQyJ3Auih427j4HZntoo8EaK1mW3LgUML2dW/vpRzo
 O4KEtUti+npWXbE7GbCdHOUvVaUcJbxeOsGyEQdZDChMbjKoXbzA3iu5ZFo1wjDeEMB2
 3YhmQ83B8Ry0kPIHDZZZHLGpIYFH/lIr4dM7J7elhH6SqpEFLlwB7JYY4sp6G/8Hd0HY
 vSBxZOAzEQETYhu13iY9dUEYno9P8XE+gDsiwGUrJNfgXgT4Wabc+vs5pnn4se+dnAR4
 3aAA==
X-Gm-Message-State: AOJu0YwE9IiWuCbEZsYpj8lNVBew2/T8aEmKFAp/WV/V65AZnb4lsO06
 3jDp+41vd8PYGLbKaV6juGTF3v9A3lNeITHXfxkpO4uyytUZAmvMNGfvOBOmCuYD9wT9lH4pL9q
 cWMKs/LJWp5hB8CU0nvvXIPc93bJosXI07uHMNhRJ0Udd8XBjYnsROKL9Ks7Aa1VNk3HYZA==
X-Gm-Gg: ASbGncsp18WJ5Z2yho29RqmzVWCggO00060SSvJAO1V2rgbGtGZgf0/x4NNBBgtXO1R
 IJ4VIaymptfnYE3y+U+ZRvtVhX31YbZVqtXGdDOBAjgyGkg+ybMXyEYZcxvM0widIb0uwgLuSPk
 3o2NvBpvD05SJT2MzGkLh5AWs2UCQFvelFxTmeDjC0U5VGbwTZBoFw3W/u2ubMn2T/Azyh8aRj8
 s1RF/uxUyPpCYYB1BnfKbrg0/7rZW2hH6oerfWWJxgC1YFvSUdukkRpTvZvMbAuRR1HF2ARtRnW
 bbUhlRDGE5s=
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id
 ffacd0b85a97d-3a6c962b2d8mr700663f8f.0.1750281818005; 
 Wed, 18 Jun 2025 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu4QU3bk7dkTV8y21m8O4yJStIuE5s16gVEUTckk6g/n5f2Lm6JEA/tzq7cPIYOVYMNwo42A==
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id
 ffacd0b85a97d-3a6c962b2d8mr700648f8f.0.1750281817462; 
 Wed, 18 Jun 2025 14:23:37 -0700 (PDT)
Received: from pollux ([2a00:79c0:6b9:ae00:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5780c5004sm14370775f8f.56.2025.06.18.14.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 14:23:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:23:35 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
Message-ID: <aFMuV7PNfSZVWb-b@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MJi9Ijml5o7rLTH7IoJ0YoHr7YrX9Y4FavcF2EwIlos_1750281818
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> On Tue, Jun 17, 2025 at 5:48 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Tue, Jun 17, 2025 at 2:51 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > >
> > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > > > > >
> > > > > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > >
> > > > > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > > > > >
> > > > > > > Please note that for exactly this case there is the op_alloc callback in
> > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > >
> > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > > > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > map/unmap overlapping an earlier map, which
> > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > > > > sure why this isn't a problem for other drivers unless userspace is
> > > > > > providing some guarantees.
> > > > >
> > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // pre-allocate memory
> > > > >                                 // lock and prepare objects
> > > > >                         }
> > > > >                 }
> > > > >
> > > > >                 drm_sched_entity_push_job();
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify page tables
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // free page table structures, if any
> > > > >                                 // free unused pre-allocated memory
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > > What did you do instead to get map/unmap overlapping? Even more interesting,
> > > > > what are you doing now?
> > > >
> > > > From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > > > can only really work if you perform one MAP or UNMAP at a time.  Or at
> > > > least if you process the VM modifying part of the ops list before
> > > > proceeding to the next op.
> > >
> > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > >
> > > I went through the code you posted [1] and conceptually you're implementing
> > > exactly the pattern I described above, i.e. you do:
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_exec_lock();
> > >                 }
> > >
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz() {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // create custom ops
> > >                         }
> > >                 }
> > >
> > >                 drm_sched_entity_push_job();
> > >         }
> > >
> > >         run_job {
> > >                 for_each_vm_bind_operation {
> > >                         for_each_custom_op() {
> > >                                 // do stuff
> > >                         }
> > >                 }
> > >         }
> >
> > Close, but by the time we get to run_job there is just a single list
> > of ops covering all the vm_bind operations:
> >
> >         run_job {
> >                 for_each_custom_op() {
> >                         // do stuff
> >                 }
> >         }
> >
> > rather than a list of va ops per vm_bind op.
> >
> > > However, GPUVM intends to solve your use-case with the following, semantically
> > > identical, approach.
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_ops_create();
> > >
> > >                         drm_gpuva_for_each_op {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // lock and prepare objects (1)
> >
> > I currently decouple lock+pin from VM modification to avoid an error
> > path that leaves the VM partially modified.  Once you add this back
> > in, the va-ops approach isn't simpler, IMHO.
> 
> Oh, actually scratch that.. using va-ops, it is not even possible to
> decouple locking/prepare from VM modifications.  So using
> DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> actively bad idea.

Well, you would need to unwind the VM modifications. I think so far this hasn't
been an issue for drivers, since they have to unwind VM modifications for other
reasons anyways.

Do you never need to unwind for other reasons than locking dma_resv and
preparing GEM objects? Are you really sure there's nothing else in the critical
path?

If there really isn't anything, I agree that those helpers have value and we
should add them. So, if we do so, please document in detail the conditions under
which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_BIND
ops *without* updating GPUVM's interval tree intermediately, including an
example.

