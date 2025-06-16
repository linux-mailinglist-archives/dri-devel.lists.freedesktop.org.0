Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D53ADBBFB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 23:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FFC8913D;
	Mon, 16 Jun 2025 21:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N9s0yTSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491E68913D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750109941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
 b=N9s0yTSi2DUgcDMwl2XLDF+1jzncb9KWx1Xk9/E9u6Owqe69wQeJNQozswUu7atK7qQpzt
 ykdGCClt9H5rHwROBU7eKBkbMSI0I2dB8xDaL0/CQUxnKDc74OwIdDkcg4jTMQF9/I3cbQ
 rAE6R/MY2JxfGixoRhgwPtUZz0qJEG0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-o8Iiv4RDOxKhmNSzfPyB6Q-1; Mon, 16 Jun 2025 17:39:00 -0400
X-MC-Unique: o8Iiv4RDOxKhmNSzfPyB6Q-1
X-Mimecast-MFC-AGG-ID: o8Iiv4RDOxKhmNSzfPyB6Q_1750109939
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a50816ccc6so2796440f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750109939; x=1750714739;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
 b=f/hoJrFusyvOkAElLwRDle2jNiCDWpPdgjCBQQhJc9/5eZ8SCEmIA6iuuC5wcSwx1a
 sFPcd2boW3EUhm2aX8k/CDJ4PzRufa1sRX12s8pFGxDkICY1+dXaRanDIWPkxj8+6ga2
 PkuhCuTZViOS6WTxU+bVxT161Y3dAfrhMt7M2mydb/fyuLHvrO9T7Q6mcorGW5XXLRPz
 Or6Sd3X9tlMP9XfWqXcsvDDchvcIBC6TNMXPgkp/wDXHtDGvHzqohZ+D/0jVO3b/IZ/J
 JErnA6VcaW6EB3NykS63znap0OVcQKZCAumQ20xHqV1LpBq4UI6fyrf9jCTFHWGYULp5
 l3wA==
X-Gm-Message-State: AOJu0Yw5+0e4eMN4rU+i6h6rDSaS7iWgh6im/vey6KPu9kLA8363nwbL
 J/Jo/ST26umP/BbvAqMYVCfyxXWUyE6avelYOQi08rcT9adFcyjDai61FcdH0Kp2RHdZWZYvU22
 MXazCmUNg/iAexSXpXIS+Lot47zHDbsrcOQDsZjMP1CG+K4S+vwvkZXfdp1eGLGPO8lKGmg==
X-Gm-Gg: ASbGncszAektWrw6T1qdoFD3JIvkh5I0DuWzF80gRQCmRiVM/Q98c8c5SNl57R+9Teo
 yK1NWo30WjHJ2y3tn6TETf3TkbzDDOwQ2aOUcVN4h265fztNSVAsVGHQyGN+gBnoWUF6lh+q1+V
 vG5oKBH4Ooo1XlcdyTOOXajOxTADBMv/VQ4RcUKDtAafBDRxEWe2FRjOFFHBS9uUpQKguMCFI7w
 V5aU5beuRItP05WZazN0xq6ToGRA+hFPQkxT2GrWEPRmpdo4imqiWC9JA+9y7u33EMLngax9Vdh
 T9Ycn+AaTP8=
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id
 ffacd0b85a97d-3a57238b522mr9595366f8f.10.1750109938545; 
 Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzpDB07Ow6Aq7oaibwATYH2bwGc1v46BbhwhcmxYHu7okQGHS3ELJ0eFf8b83N36p9EgRDvg==
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id
 ffacd0b85a97d-3a57238b522mr9595351f8f.10.1750109938128; 
 Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
Received: from pollux ([2a00:79c0:662:b300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b089a7sm11887641f8f.49.2025.06.16.14.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 14:38:57 -0700 (PDT)
Date: Mon, 16 Jun 2025 23:38:55 +0200
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
Message-ID: <aFCO7_RHuAaGyq1Q@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: erjkMZMW1RvqM-KfYqo4vnkOJ7xmUJ75mQf9sEb8DFo_1750109939
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

On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > VAs.  These helpers handle locking/preparing the needed objects.
> >
> > Yes, that's a common use-case. I think drivers typically iterate through their
> > drm_gpuva_ops to lock those objects.
> >
> > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> >
> > Please note that for exactly this case there is the op_alloc callback in
> > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > msm_vm_op) that embedds a struct drm_gpuva_op.
> 
> I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> VM_BIND series, but it wasn't quite what I was after.  I wanted to
> apply the VM updates immediately to avoid issues with a later
> map/unmap overlapping an earlier map, which
> drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> sure why this isn't a problem for other drivers unless userspace is
> providing some guarantees.

The drm_gpuva_ops are usually used in a pattern like this.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// pre-allocate memory
				// lock and prepare objects
			}
		}
		
		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify page tables
			}
		}
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// free page table structures, if any
				// free unused pre-allocated memory
			}
		}
	}

What did you do instead to get map/unmap overlapping? Even more interesting,
what are you doing now?

> Once I realized I only wanted to defer the
> application of the pgtable changes, but keep all the
> locking/allocation/etc in the synchronous part of the ioctl,
> vm_op_enqueue() was the natural solution.

But vm_op_enqueue() creates exactly this list of operations you would get from
drm_gpuvm_sm_{map,unmap}_ops_create(), just manually, no?

<snip>

> > > Note that these functions do not strictly require the VM changes to be
> > > applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> > > the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> > > call result in a differing sequence of steps when the VM changes are
> > > actually applied, it will be the same set of GEM objects involved, so
> > > the locking is still correct.
> >
> > I'm not sure about this part, how can we be sure that's the case?
> 
> I could be not imaginative enough here, so it is certainly worth a
> second opinion.  And why I explicitly called it out in the commit msg.
> But my reasoning is that any new op in the second pass that actually
> applies the VM updates which results from overlapping with a previous
> update in the current VM_BIND will only involve GEM objects from that
> earlier update, which are already locked.

Yeah, it's probably fine, since, as you say, the only additional object can be
the req_obj from the previous iteration.

