Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D1ADC713
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 11:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D096110E5C0;
	Tue, 17 Jun 2025 09:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V3icgjyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A74310E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750153901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
 b=V3icgjynnqKzpZL0WwnVGF6HB6ljYCkr18QiuchJ4mWtk2QCI9n5IAJaxnV5HISMEZIRfl
 VR36lAauZM9u7mdOwM4pZsz71SuoJD2AM65FS4zWHiB+GadTCIbwBf3li/4H0NrXTtmd4U
 9xt1zsnN+1bmQh0MUWkP6+sOjFFHpNI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-gTjMCXVdN62dEYm5gnqnHA-1; Tue, 17 Jun 2025 05:51:38 -0400
X-MC-Unique: gTjMCXVdN62dEYm5gnqnHA-1
X-Mimecast-MFC-AGG-ID: gTjMCXVdN62dEYm5gnqnHA_1750153897
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450eaae2934so44757785e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 02:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750153897; x=1750758697;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
 b=OpHLdyvSui9Boh/PdEv1KqT/pbGLu6Wg5vv7cGu/croUCCUK2VpPbEhwImr7tMO6LI
 +MWFjS/9XxXLi2r3xwcOZeHIpjQR34OdfFGVlMEzDeeVvDfrbZ+9OjENXl6Bxq2rewRL
 wuY376r0NIULd69ooS16Cf7dHqS+L4984vXlN17LJ1mtunR+26PYIg0eTWDQ3UcS1tLq
 YiSYswfCJP6sELOYiJDT2hTAopQ92W/lydw2SaCiKon5gzASMHIKd0QO6ORE3EkZtVp9
 r3EWoV3fd7Igfzin20VeTtH73cN2ZiQSRiwVc73yUwpdBcC4UNgA3ujyPoTqazjDiYgr
 PnGw==
X-Gm-Message-State: AOJu0YzUKDeh/PjmJvzSiZ0aN+8nUEYIqdKG2l8ZTjCmi9Vqkta1ecrH
 quQkqwKZ9B1FDF8ZxdNQbmb7w7wDgBnULx6GYMA8v4KNWJmBFdrahrUg2FGLno5hF1u4noPl757
 zjhpGHl5tGOyRjZiB4EFk4eotoxIpkz2Sirs3BGtYm/iJ3TeLEqzE3xfsxmyadjGJ14XS3A==
X-Gm-Gg: ASbGnctrF0sw8fODjhhq1dEg6B/NtiZYL4bQeobYMEbrnvriWydo4bR3bRDVcOvgQpa
 inWH8zClVklPrk0PoWZBbQYSAmWNhNEBHd4PXRNNKn4IodsQOmGTJWmfnkCvR3zqJBJ8zyWOvWu
 ZYDFyhA0XwPnLmpUTb6y36pvZ2fpMHKSwvquVXg0AQxarX1wBwOStyLxwmj4iPo/BEgBH+FMGVo
 C61ACroZE/6+s7Z2qoiXW5rql1icfIU1qeMziYCE5eH9ZBXTsnQc6sYXbQnn8+nAM3SIjPQs3VP
 NuAJsXEubP8=
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-4533cac9179mr105803355e9.23.1750153897088; 
 Tue, 17 Jun 2025 02:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFldMEnuo9yC084iP1KvhWhShNC4LmtmIc7iidP4b8onqmO+ZGv8akFrhh6Cvt1pfxb1j8zTw==
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-4533cac9179mr105803085e9.23.1750153896629; 
 Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Received: from pollux ([2a00:79c0:62e:9200:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e224600sm171952695e9.8.2025.06.17.02.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:51:34 +0200
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
Message-ID: <aFE6pq8l33NXfFdT@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WZfJ8-9SU3ZcyU6r6iGSAOfcn337xTODVnqEA3fKByo_1750153897
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

On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > >
> > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > >
> > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > drm_gpuva_ops to lock those objects.
> > > >
> > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > >
> > > > Please note that for exactly this case there is the op_alloc callback in
> > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > >
> > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > apply the VM updates immediately to avoid issues with a later
> > > map/unmap overlapping an earlier map, which
> > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > sure why this isn't a problem for other drivers unless userspace is
> > > providing some guarantees.
> >
> > The drm_gpuva_ops are usually used in a pattern like this.
> >
> >         vm_bind {
> >                 for_each_vm_bind_operation {
			    drm_gpuvm_sm_xyz_ops_create();
> >                         drm_gpuva_for_each_op {
> >                                 // modify drm_gpuvm's interval tree
> >                                 // pre-allocate memory
> >                                 // lock and prepare objects
> >                         }
> >                 }
> >
> >                 drm_sched_entity_push_job();
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // modify page tables
> >                         }
> >                 }
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // free page table structures, if any
> >                                 // free unused pre-allocated memory
> >                         }
> >                 }
> >         }
> >
> > What did you do instead to get map/unmap overlapping? Even more interesting,
> > what are you doing now?
> 
> From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> doing drm_gpuva_remove() while iterating the ops list..
> drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> can only really work if you perform one MAP or UNMAP at a time.  Or at
> least if you process the VM modifying part of the ops list before
> proceeding to the next op.

(Added the drm_gpuvm_sm_xyz_ops_create() step above.)

I went through the code you posted [1] and conceptually you're implementing
exactly the pattern I described above, i.e. you do:

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_exec_lock();
		}

		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz() {
				// modify drm_gpuvm's interval tree
				// create custom ops
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			for_each_custom_op() {
				// do stuff
			}
		}
	}

However, GPUVM intends to solve your use-case with the following, semantically
identical, approach.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_ops_create();

			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// lock and prepare objects (1)
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op() {
				// do stuff
			}
		}
	}

(Note that GPUVM already supports to extend the existing OP structures; you
should take advantage of that.)

Hence, the helper we really want is to lock and prepare the objects at (1). I.e.
a helper that takes a pointer to a struct drm_gpuva_op and locks / validates the
corresponding objects.

[1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drivers/gpu/drm/msm/msm_gem_vma.c

