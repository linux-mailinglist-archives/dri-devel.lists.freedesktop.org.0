Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7ADADF948
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 00:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349B410E96A;
	Wed, 18 Jun 2025 22:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GJDD75fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F0A10E96D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750285193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pFuNa+gUNreWnlNmpSWHUm92+vfdGGa0hGa5LsPknNE=;
 b=GJDD75fkjgWXosvkiavNiXePEtmniJGibHTJ1zfTQxqtnsmvIdH7vAGcHKHZTsHStMaetA
 k7XKCbTHZSiNeXdT+SRHj/rsVIjmtlv1Qu/ZXb1q2SDb6vDw4vqFWU+B4y47N48Brn7XBH
 dHRXJBflTTPedXS8W1Btlwy/F41PpWE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-dNi_qI_OOf2wgJIETHnA9A-1; Wed, 18 Jun 2025 18:19:52 -0400
X-MC-Unique: dNi_qI_OOf2wgJIETHnA9A-1
X-Mimecast-MFC-AGG-ID: dNi_qI_OOf2wgJIETHnA9A_1750285191
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451d7de4ae3so710355e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 15:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750285191; x=1750889991;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFuNa+gUNreWnlNmpSWHUm92+vfdGGa0hGa5LsPknNE=;
 b=mLc269ffHV8a8Zl4NBuw/QX+1cBiiyaH0knPaFxvn4jdXj9E2ufJk5vdHM7tTYk/Nn
 QSWw+HLLOHuP5ZvPGiawpN4OB/76GdCqKXDlVUkLq7CJPsqfKF4MZaRaLc70T/QfmuLE
 ivHqqb2gVPYkvA+0Tw9cMifLNVVoOMQOmRijnri9RemVo0MJlnpCNQ1+ZC2LWYcB5ipO
 K1+8pFnz+RyAj7lTf8Fg5x5MuTUf58beUwnMl4nNBjkiFxtHZ/uv6Jj3zrLaR0qMhmG0
 3/ynbe/21I/e+936jca+0ebomuehOG3jJAMlpLBcli/XhOTMK+5QigFzJ7cyyQ8ayoUx
 35Vg==
X-Gm-Message-State: AOJu0Yw2OPbuGyUhB32GmrValc/yw+gCFFqVB54jHRmahN+tbEeFroGC
 ZJFwcyr+ksg4+q6tzCwl6fjFTPyAN4kXxLRHH3uQBT4ATlqqDc44iMtbfOWrzexbkBH3OcYiqZE
 VwX6suuknnSIXY3EZocHd1icixZ2lKPZnSZ1n6pRVB/vGWy1rdzsePwRnq/1SmOiDt9qlAQ==
X-Gm-Gg: ASbGnct10WXzUKNQoE37thbe1YziSeCcYJCZYCkTAK3UoiShfSRf2VIANhusz2ZIps0
 KDAt+N24wy1MGWmqxxOL9G+RUWQrrImeBkqZoL80aL8M4xObZt4Ca2EXt5FgpqbqLxskR8dP78I
 8GRed7lf9i6pjW7F/LTw7mK1QJ5pyfWLTds8FtL5H6ywnEEZCwLUeb903qT8xERqe1cV4kPjG1M
 sVRA/j3T6c4knDubWXq3xLlOSLipWe2a0wg8BaLVM2a/BjnZGD95tl4QPCtGENZEZRppArt53/Z
 UjrigHP1PU8=
X-Received: by 2002:a05:600c:1d06:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-4533ca7a286mr162136005e9.5.1750285191178; 
 Wed, 18 Jun 2025 15:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4VQdU3i4tTHqK1j6tdabdPmKkWW/Ow8y41UnXWvPN4xxmf9XyxkRHISIyMXY4Y6B/g33waQ==
X-Received: by 2002:a05:600c:1d06:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-4533ca7a286mr162135925e9.5.1750285190693; 
 Wed, 18 Jun 2025 15:19:50 -0700 (PDT)
Received: from pollux ([2a00:79c0:6b9:ae00:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e99ee8dsm9098185e9.37.2025.06.18.15.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 15:19:49 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:19:47 +0200
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
Message-ID: <aFM7gyGEJSVpQe1y@pollux>
References: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
 <aFMuV7PNfSZVWb-b@pollux>
 <CACSVV00MJDTXk-qVB3FZV36CPuJ4LLtCDPFpF07EQXBfyqncuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACSVV00MJDTXk-qVB3FZV36CPuJ4LLtCDPFpF07EQXBfyqncuQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tb05i3W4bfFpwiYEZx0DmLsx70_BWtkbcjhf1CKcr3o_1750285191
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

On Wed, Jun 18, 2025 at 02:56:37PM -0700, Rob Clark wrote:
> On Wed, Jun 18, 2025 at 2:23 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> > > On Tue, Jun 17, 2025 at 5:48 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > > >
> > > > On Tue, Jun 17, 2025 at 2:51 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > > > On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > >
> > > > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > > > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > > > > > > >
> > > > > > > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > > > >
> > > > > > > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > > > > > > >
> > > > > > > > > Please note that for exactly this case there is the op_alloc callback in
> > > > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > > > >
> > > > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > > > > > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > > > map/unmap overlapping an earlier map, which
> > > > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > > > > > > sure why this isn't a problem for other drivers unless userspace is
> > > > > > > > providing some guarantees.
> > > > > > >
> > > > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > > > >
> > > > > > >         vm_bind {
> > > > > > >                 for_each_vm_bind_operation {
> > > > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > > > >                         drm_gpuva_for_each_op {
> > > > > > >                                 // modify drm_gpuvm's interval tree
> > > > > > >                                 // pre-allocate memory
> > > > > > >                                 // lock and prepare objects
> > > > > > >                         }
> > > > > > >                 }
> > > > > > >
> > > > > > >                 drm_sched_entity_push_job();
> > > > > > >         }
> > > > > > >
> > > > > > >         run_job {
> > > > > > >                 for_each_vm_bind_operation {
> > > > > > >                         drm_gpuva_for_each_op {
> > > > > > >                                 // modify page tables
> > > > > > >                         }
> > > > > > >                 }
> > > > > > >         }
> > > > > > >
> > > > > > >         run_job {
> > > > > > >                 for_each_vm_bind_operation {
> > > > > > >                         drm_gpuva_for_each_op {
> > > > > > >                                 // free page table structures, if any
> > > > > > >                                 // free unused pre-allocated memory
> > > > > > >                         }
> > > > > > >                 }
> > > > > > >         }
> > > > > > >
> > > > > > > What did you do instead to get map/unmap overlapping? Even more interesting,
> > > > > > > what are you doing now?
> > > > > >
> > > > > > From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> > > > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > > > > > can only really work if you perform one MAP or UNMAP at a time.  Or at
> > > > > > least if you process the VM modifying part of the ops list before
> > > > > > proceeding to the next op.
> > > > >
> > > > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > > > >
> > > > > I went through the code you posted [1] and conceptually you're implementing
> > > > > exactly the pattern I described above, i.e. you do:
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuvm_sm_xyz_exec_lock();
> > > > >                 }
> > > > >
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuvm_sm_xyz() {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // create custom ops
> > > > >                         }
> > > > >                 }
> > > > >
> > > > >                 drm_sched_entity_push_job();
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         for_each_custom_op() {
> > > > >                                 // do stuff
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > >
> > > > Close, but by the time we get to run_job there is just a single list
> > > > of ops covering all the vm_bind operations:
> > > >
> > > >         run_job {
> > > >                 for_each_custom_op() {
> > > >                         // do stuff
> > > >                 }
> > > >         }
> > > >
> > > > rather than a list of va ops per vm_bind op.
> > > >
> > > > > However, GPUVM intends to solve your use-case with the following, semantically
> > > > > identical, approach.
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuvm_sm_xyz_ops_create();
> > > > >
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // lock and prepare objects (1)
> > > >
> > > > I currently decouple lock+pin from VM modification to avoid an error
> > > > path that leaves the VM partially modified.  Once you add this back
> > > > in, the va-ops approach isn't simpler, IMHO.
> > >
> > > Oh, actually scratch that.. using va-ops, it is not even possible to
> > > decouple locking/prepare from VM modifications.  So using
> > > DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> > > actively bad idea.
> >
> > Well, you would need to unwind the VM modifications. I think so far this hasn't
> > been an issue for drivers, since they have to unwind VM modifications for other
> > reasons anyways.
> 
> Only thing that can fail at this point are the drm_gpuvm_sm_xyz()
> calls[1].  Which should only be for small kmalloc's which should not
> fail.

But what happens *if* they fail? How do you handle this? If you don't unwind all
preceeding changes to the GPUVM's interval tree at this point your VM is broken.

Glancing at the code, it seems that you're allocating the GPUVA ops. And if that
fails you just return the error, leaving the VM in a broken state.

What we could do is to implement a helper that calculates the worst case number
of ops and pre-allocate them, but that's not exactly trivial.

drm_gpuvm_sm_{map,unmap}_exec_lock() only really makes sense if we can prevent
the need to ever unwind, so that's a precondition.

Alternatively, you can also decide to accept that your VM is dead if you can't
allocate the GPUVA ops, I guess. In this case you'd really have to shut it down
though, otherwise you likely risk faults in your PT management code.

> But all the "usual" errors (bad params from userspace,
> interrupted locking, etc) are dealt with before we begin to modify the
> VM.  If anything does fail after we start modifying the VM we mark the
> vm as unusable, similar to a gpu fault.
> 
> [1] ok, I should put some drm_gpuvm_range_valid() checks earlier in
> the ioctl, while parsing out and validating args/flags/etc.  I
> overlooked this.
> 
> > Do you never need to unwind for other reasons than locking dma_resv and
> > preparing GEM objects? Are you really sure there's nothing else in the critical
> > path?
> >
> > If there really isn't anything, I agree that those helpers have value and we
> > should add them. So, if we do so, please document in detail the conditions under
> > which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_BIND
> > ops *without* updating GPUVM's interval tree intermediately, including an
> > example.
> 
> Ok.. in the function headerdoc comment block?  Or did you have
> somewhere else in mind?

Yeah, in the function doc-comment.

