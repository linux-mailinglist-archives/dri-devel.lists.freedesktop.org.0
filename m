Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D296A9CB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 23:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE7410E5B4;
	Tue,  3 Sep 2024 21:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="BOx1kafY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54A310E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 21:11:35 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-374c5bab490so31498f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725397894; x=1726002694; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8YgAUS2Ry5Qk+wWPJPy+cWmdjbMTWXvNp2C7CLDuQik=;
 b=BOx1kafYUUekKQW1EP3flKtwbI6JzcYrRbQydSRNU6dt5ypnuD3Y5Lsm1VilTH2sOd
 m1jfURpZqV0ajRNfipLWsCuJPSZSOVnEPVunx9hg1jfBOwurvyWkVJHxDVSXf0GpWjuS
 wT8OE/8gpAOvMMtS5qZqDBc8NqsAkYHwhp21I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725397894; x=1726002694;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8YgAUS2Ry5Qk+wWPJPy+cWmdjbMTWXvNp2C7CLDuQik=;
 b=orb8so6XXcXB9cb8iETvSZW7UUasRhC5V/dn3h68CrrhBFFn1nUB2OiD1e/vdw+m9b
 gSg0teoU9eR0mHqj/Sl14OOocruJRAMDotaHPZFOmSCHCB6oOe8hdmCQg2ZFLwkPeX3I
 NiSZsfpmqAEADjju9pQpaLjXuuTTdqz1nVH/lsD+d+gxIJPW1DCLTfgQQoQDsfO4FTix
 59aolmG0zWbzx+t0bGTO4NXl2341QKonq6IS/DxTYhEMgy31M9jajEv8e2H10GUqmbYK
 yjXjBCAgjSOJ69hC4Mfw8D236mg/Foei6q35jnxMfnX7Zq10mkMlXtouLlbXACtpYDOt
 pGrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ZBEHI4oIphLMYKDeFDHLSV2t49MA2GNscXTzzlV1kfh4a8R6jbSvyxYmVG4wrW3CK8yYVnSZCsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGTvAl6QSwBJxbTUrO8LYUc2g6xaNRGJc1i1ZjK7dHQAI7yu/9
 bRTfV/NYFSHl39BQKyCk9BdGIIXOf3eoMN3XQIT34oCXE9387iYDRUbCP4E1uqY=
X-Google-Smtp-Source: AGHT+IGTAmkFpaLIX21kpLx9BQXwTM1hqlVv5C+ltwv+zwHAusBxHFX4IUm4ArGw6G3xCPOuhsZ0Gw==
X-Received: by 2002:adf:b31a:0:b0:374:c618:7fd2 with SMTP id
 ffacd0b85a97d-374c6188127mr6317040f8f.8.1725397893741; 
 Tue, 03 Sep 2024 14:11:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c39eacdfsm8993826f8f.42.2024.09.03.14.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 14:11:33 -0700 (PDT)
Date: Tue, 3 Sep 2024 23:11:31 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
Message-ID: <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Sep 03, 2024 at 03:46:43PM +0200, Christian König wrote:
> Hi Steven,
> 
> Am 29.08.24 um 15:37 schrieb Steven Price:
> > Hi Christian,
> > 
> > Mihail should be able to give more definitive answers, but I think I can
> > answer your questions.
> > 
> > On 29/08/2024 10:40, Christian König wrote:
> > > Am 28.08.24 um 19:25 schrieb Mihail Atanassov:
> > > > Hello all,
> > > > 
> > > > This series implements a mechanism to expose Mali CSF GPUs' queue
> > > > ringbuffers directly to userspace, along with paraphernalia to allow
> > > > userspace to control job synchronisation between the CPU and GPU.
> > > > 
> > > > The goal of these changes is to allow userspace to control work
> > > > submission to the FW/HW directly without kernel intervention in the
> > > > common case, thereby reducing context switching overhead. It also allows
> > > > for greater flexibility in the way work is enqueued in the ringbufs.
> > > > For example, the current kernel submit path only supports indirect
> > > > calls, which is inefficient for small command buffers. Userspace can
> > > > also skip unnecessary sync operations.
> > > Question is how do you guarantee forward progress for fence signaling?
> > A timeout. Although looking at it I think it's probably set too high
> > currently:
> > 
> > > +#define JOB_TIMEOUT_MS				5000
> > But basically the XGS queue is a DRM scheduler just like a normal GPU
> > queue and the jobs have a timeout. If the timeout is hit then any fences
> > will be signalled (with an error).
> 
> Mhm, that is unfortunately exactly what I feared.
> 
> > > E.g. when are fences created and published? How do they signal?
> > > 
> > > How are dependencies handled? How can the kernel suspend an userspace
> > > queue?
> > The actual userspace queue can be suspended. This is actually a
> > combination of firmware and kernel driver, and this functionality is
> > already present without the user submission. The firmware will multiplex
> > multiple 'groups' onto the hardware, and if there are too many for the
> > firmware then the kernel multiplexes the extra groups onto the ones the
> > firmware supports.
> 
> How do you guarantee forward progress and that resuming of suspended queues
> doesn't end up in a circle dependency?
> 
> > I haven't studied Mihail's series in detail yet, but if I understand
> > correctly, the XGS queues are handled separately and are not suspended
> > when the hardware queues are suspended. I guess this might be an area
> > for improvement and might explain the currently very high timeout (to
> > deal with the case where the actual GPU work has been suspended).
> > 
> > > How does memory management work in this case?
> > I'm not entirely sure what you mean here. If you are referring to the
> > potential memory issues with signalling path then this should be handled
> > by the timeout - although I haven't studied the code to check for bugs here.
> 
> You might have misunderstood my question (and I might misunderstand the
> code), but on first glance it strongly sounds like the current approach will
> be NAKed.
> 
> > The actual new XGS queues don't allocate/free memory during the queue
> > execution - so it's just the memory usage related to fences (and the
> > other work which could be blocked on the fence).
> 
> But the kernel and the hardware could suspend the queues, right?
> 
> > In terms of memory management for the GPU work itself, this is handled
> > the same as before. The VM_BIND mechanism allows dependencies to be
> > created between syncobjs and VM operations, with XGS these can then be
> > tied to GPU HW events.
> 
> I don't know the details, but that again strongly sounds like that won't
> work.
> 
> What you need is to somehow guarantee that work doesn't run into memory
> management deadlocks which are resolved by timeouts.
> 
> Please read up here on why that stuff isn't allowed: https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences

panthor doesn't yet have a shrinker, so all memory is pinned, which means
memory management easy mode.

But also this means there might be an uapi design bug in here, and we
really don't want to commit to that. My stance is that panthor should gain
a proper shrinker first, which means there will be some changes here too.
And then we can properly evaluate this. As-is it's a bit too much on the
toy end of things.

That aside, I've thought this all through with tons of people, and I do
think it's all possible.
-Sima

> 
> Regards,
> Christian.
> 
> > 
> > 
> > Fundamentally (modulo bugs) there is little change compared to kernel
> > submission - it's already fairly trivial to write GPU job which will
> > make no forward progress (a 'while (1)' equivalent job). The only
> > difference here is that XGS makes this 'easy' and doesn't involve the
> > GPU spinning. Either way we rely on a timeout to recover from these
> > situations.
> > 
> > Thanks,
> > Steve
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > This is still a work-in-progress, there's an outstanding issue with
> > > > multiple processes using different submission flows triggering
> > > > scheduling bugs (e.g. the same group getting scheduled twice), but we'd
> > > > love to gather some feedback on the suitability of the approach in
> > > > general and see if there's a clear path to merging something like this
> > > > eventually.
> > > > 
> > > > I've also CCd AMD maintainers because they have in the past done
> > > > something similar[1], in case they want to chime in.
> > > > 
> > > > There are two uses of this new uAPI in Mesa, one in gallium/panfrost
> > > > (link TBD), and one in panvk [2].
> > > > 
> > > > The Gallium implementation is a naïve change just to switch the
> > > > submission model and exercise the new kernel code, and we don't plan
> > > > on pursuing this at this time.
> > > > 
> > > > The panvk driver changes are, however, a better representation of the
> > > > intent behind this new uAPI, so please consider that as the reference
> > > > userspace. It is still very much also a work in progress.
> > > > 
> > > >    * patch 1 adds all the uAPI changes;
> > > >    * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
> > > >      the required objects to userspace;
> > > >    * patch 3 maps the doorbell pages, similarly to how the user I/O
> > > > page is
> > > >      mapped;
> > > >    * patch 4 implements GROUP_KICK, which lets userspace request an
> > > >      inactive group to be scheduled on the GPU;
> > > >    * patches 5 & 6 implement XGS queues, a way for userspace to
> > > >      synchronise GPU queue progress with DRM syncobjs;
> > > >    * patches 7 & 8 add notification mechanisms for user & kernel to signal
> > > >      changes to native GPU syncobjs.
> > > > 
> > > > [1]
> > > > https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed
> > > > [2]
> > > > https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads
> > > > 
> > > > Ketil Johnsen (7):
> > > >     drm/panthor: Add uAPI to submit from user space
> > > >     drm/panthor: Extend GROUP_CREATE for user submission
> > > >     drm/panthor: Map doorbell pages
> > > >     drm/panthor: Add GROUP_KICK ioctl
> > > >     drm/panthor: Factor out syncobj handling
> > > >     drm/panthor: Implement XGS queues
> > > >     drm/panthor: Add SYNC_UPDATE ioctl
> > > > 
> > > > Mihail Atanassov (1):
> > > >     drm/panthor: Add sync_update eventfd handling
> > > > 
> > > >    drivers/gpu/drm/panthor/Makefile          |   4 +-
> > > >    drivers/gpu/drm/panthor/panthor_device.c  |  66 ++-
> > > >    drivers/gpu/drm/panthor/panthor_device.h  |  35 +-
> > > >    drivers/gpu/drm/panthor/panthor_drv.c     | 233 +++++++-
> > > >    drivers/gpu/drm/panthor/panthor_fw.c      |   2 +-
> > > >    drivers/gpu/drm/panthor/panthor_sched.c   | 408 +++++++++-----
> > > >    drivers/gpu/drm/panthor/panthor_sched.h   |   8 +-
> > > >    drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
> > > >    drivers/gpu/drm/panthor/panthor_syncobj.h |  27 +
> > > >    drivers/gpu/drm/panthor/panthor_xgs.c     | 638 ++++++++++++++++++++++
> > > >    drivers/gpu/drm/panthor/panthor_xgs.h     |  42 ++
> > > >    include/uapi/drm/panthor_drm.h            | 243 +++++++-
> > > >    12 files changed, 1696 insertions(+), 177 deletions(-)
> > > >    create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
> > > >    create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
> > > >    create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
> > > >    create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h
> > > > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
