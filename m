Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0A984222
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43AB10E681;
	Tue, 24 Sep 2024 09:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NzpsVvjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7C10E681
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:30:57 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so4353063f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727170256; x=1727775056; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l0IzNs3mZ/9+Ti4g3nmPXn8fO8mrgCN0A7k7AfsL3yg=;
 b=NzpsVvjCOTZZfIgHiMHpwZ9qjRrOQllimJWH7u1hEEd2lBSUH4fHOr9PfPv5oNlge1
 gR7ON2VUuqDunslL2A+SvbhX2p+dcTS+CSTkd09GzIbgDD5AxKr+iB4DjMQopFEwZ5Y2
 IdU047EWAkBHAlvRY7L3ctJm7flKmO743Ub54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727170256; x=1727775056;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l0IzNs3mZ/9+Ti4g3nmPXn8fO8mrgCN0A7k7AfsL3yg=;
 b=ecoKVrtD58yt6/hsOfkikgQKlP8YTTIEwxGznk6+pJC/gnj0UGAcpi7YWRqgG+v498
 2sFtrk2tu41TG2okK6JY8DOwapq0wCd7uQYLxql+xZ+sV62Eosu58WJuPigC4h2ye72s
 M9OYwGCPQt4sD3N7iDnbCVr5PgpnkWaoZpIb9T48ENvVc9wULZabiQ8JFq8hrSpU18j6
 fXrNtBGovTqnNHFipGIp9OganQh840qn0t1YArSkEo/+QSnAM7PWWeIos0vh4PYjt7kQ
 uVhjmm9ImmGnHKE0pGi2Ga1euqUjmKsc7mUZf2RA800LbUy8m3TctjxRwdCCiAZOCUqP
 IIfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULAvdcuDljG+KYvbNUQpuMBIoym42wjfeLv77GlcjeokoGHvB3vJIUDXYkpn3r7yAgfvh6eIohYvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQoNcGMbvGfM9KE6paGXZSewnuRCNoyvjB4za0qWWAeK0/4tTg
 RilPrGyY0RxxmOsiJ5e+wfOUKfJp2OZ5eJAECSSXAD36A2stbV9TaGIDbcYV7mY=
X-Google-Smtp-Source: AGHT+IHQutkY/TCr1KP9oL2iUCdMSZnk89AOwG9+fb/0brGUyCIn/76UTYosZbdpfo+DuaEsyk25nA==
X-Received: by 2002:a5d:452e:0:b0:374:c847:867 with SMTP id
 ffacd0b85a97d-37a42367b0fmr13320658f8f.47.1727170255860; 
 Tue, 24 Sep 2024 02:30:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f791csm62794866b.171.2024.09.24.02.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:30:55 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:30:53 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
Message-ID: <ZvKGzSeA7OT-hZQS@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
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
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
 <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

Apologies for the late reply ...

On Wed, Sep 04, 2024 at 01:34:18PM +0200, Christian König wrote:
> Hi Boris,
> 
> Am 04.09.24 um 13:23 schrieb Boris Brezillon:
> > > > > > Please read up here on why that stuff isn't allowed:
> > > > > > https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
> > > > > panthor doesn't yet have a shrinker, so all memory is pinned, which means
> > > > > memory management easy mode.
> > > > Ok, that at least makes things work for the moment.
> > > Ah, perhaps this should have been spelt out more clearly ;)
> > > 
> > > The VM_BIND mechanism that's already in place jumps through some hoops
> > > to ensure that memory is preallocated when the memory operations are
> > > enqueued. So any memory required should have been allocated before any
> > > sync object is returned. We're aware of the issue with memory
> > > allocations on the signalling path and trying to ensure that we don't
> > > have that.
> > > 
> > > I'm hoping that we don't need a shrinker which deals with (active) GPU
> > > memory with our design.
> > That's actually what we were planning to do: the panthor shrinker was
> > about to rely on fences attached to GEM objects to know if it can
> > reclaim the memory. This design relies on each job attaching its fence
> > to the GEM mapped to the VM at the time the job is submitted, such that
> > memory that's in-use or about-to-be-used doesn't vanish before the GPU
> > is done.
> 
> Yeah and exactly that doesn't work any more when you are using user queues,
> because the kernel has no opportunity to attach a fence for each submission.
> 
> > > Memory which user space thinks the GPU might
> > > need should be pinned before the GPU work is submitted. APIs which
> > > require any form of 'paging in' of data would need to be implemented by
> > > the GPU work completing and being resubmitted by user space after the
> > > memory changes (i.e. there could be a DMA fence pending on the GPU work).
> > Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
> > that means we can't really transparently swap out GPU memory, or we
> > have to constantly pin/unpin around each job, which means even more
> > ioctl()s than we have now. Another option would be to add the XGS fence
> > to the BOs attached to the VM, assuming it's created before the job
> > submission itself, but you're no longer reducing the number of user <->
> > kernel round trips if you do that, because you now have to create an
> > XSG job for each submission, so you basically get back to one ioctl()
> > per submission.
> 
> For AMDGPU we are currently working on the following solution with memory
> management and user queues:
> 
> 1. User queues are created through an kernel IOCTL, submissions work by
> writing into a ring buffer and ringing a doorbell.
> 
> 2. Each queue can request the kernel to create fences for the currently
> pushed work for a queues which can then be attached to BOs, syncobjs,
> syncfiles etc...
> 
> 3. Additional to that we have and eviction/preemption fence attached to all
> BOs, page tables, whatever resources we need.
> 
> 4. When this eviction fences are requested to signal they first wait for all
> submission fences and then suspend the user queues and block creating new
> submission fences until the queues are restarted again.

Yup this works, at least when I play it out in my head.

Note that the completion fence is only deadlock free if userspace is
really, really careful. Which in practice means you need the very
carefully constructed rules for e.g. vulkan winsys fences, otherwise you
do indeed deadlock.

But if you keep that promise in mind, then it works, and step 2 is
entirely option, which means we can start userspace in a pure long-running
compute mode where there's only eviction/preemption fences. And then if
userspace needs a vulkan winsys fence, we can create that with step 2 as
needed.

But the important part is that you need really strict rules on userspace
for when step 2 is ok and won't result in deadlocks. And those rules are
uapi, which is why I think doing this in panthor without the shrinker and
eviction fences (i.e. steps 3&4 above) is a very bad mistake.

> This way you can still do your memory management inside the kernel (e.g.
> move BOs from local to system memory) or even completely suspend and resume
> applications without their interaction, but as Sima said it is just horrible
> complicated to get right.
> 
> We have been working on this for like two years now and it still could be
> that we missed something since it is not in production testing yet.

Ack.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
