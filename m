Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133DF48EE98
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 17:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935B210EABC;
	Fri, 14 Jan 2022 16:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFD510EABC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 16:44:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r28so16618298wrc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EDlCEslCn6FWKM6jGMAUwIWHsu6SQfw6Ox95I7gpdco=;
 b=Pv56IGYYZK/WbxLk6D2URYYWkexWCQ1RPdebSk/7N89/OnnCXfxLLCWXQekccWYJsG
 3EarR9obxfXiWDggfH9la5pQzDHBjPtXkbG1yKLrIoz2d6E4qoBqCIR+jQTRoHAccO/5
 UexASHK9ZBms6jXk4SytMVHAgC0UIFwf94KyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EDlCEslCn6FWKM6jGMAUwIWHsu6SQfw6Ox95I7gpdco=;
 b=BK5HDfY6BvgkR2dt+2lj9jCjTe4pN1wM5mwQeo5f2VDxw7sWcmQWyKX6JPnZ3ZNPG+
 1t7J7HFogm7XWqprmtuUlGnDv+ZSKgSLeOLGJf2xVMnq6U2vmf1S/FGDv5L7ATSc3VxJ
 kdZ5+GyYfumbiPQO+7Jrmrn9ongo4Bu11hdmGLmPtIdE4KjC8mJqrxsPDS3r9MUVTHUr
 EKvBWPb8yiouUQOXJDn/qgAhYQ+RljVN/YjHc1fSnPwbwj2Fd5jcWPYGc8wxNu3e2LZx
 v/vK0OceUw8JRftHUXbLqEUqojDQytvUFUWZUCCZ8z2nrIPFLeYgv9YEw7qiDxJ/stUr
 8sHw==
X-Gm-Message-State: AOAM5322TKi6bb4LUL56ReKVt9y24DJfp5qr6KSMBj6oycH6mkt9z1qV
 V7c1OMDxz54pm5CaBF7BVFIrXg==
X-Google-Smtp-Source: ABdhPJyS2XZu0j7uRiL3V5zPX4tlWPV2f3jGMORloNk5mCD2Fnj66hSyakzZmPx4Za1Vr0q/exORTA==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr9183173wrb.268.1642178648749; 
 Fri, 14 Jan 2022 08:44:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e12sm2722856wrg.33.2022.01.14.08.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 08:44:08 -0800 (PST)
Date: Fri, 14 Jan 2022 17:44:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Message-ID: <YeGoVhLgMDOJS15K@phenom.ffwll.local>
References: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
 <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 dri-devel@lists.freedesktop.org, David Yat Sin <david.yatsin@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, airlied@redhat.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Top post because I tried to catch up on the entire discussion here.

So fundamentally I'm not opposed to just close this fork() hole once and
for all. The thing that worries me from a upstream/platform pov is really
only if we don't do it consistently across all drivers.

So maybe as an idea:
- Do the original patch, but not just for ttm but all gem rendernode
  drivers at least (or maybe even all gem drivers, no idea), with the
  below discussion cleaned up as justification.

- Get acks from userspace driver folks who know real-world gl/vk usage and
  khr specs in-depth enough to be able to tell us how much we'll regret
  this.

- Merge it. Or come up with something new. Or maybe stick to the Nack, but
  then maybe it would be good to document that somewhere in-tree?

This entire can of worms just feels way too tricky to have it be handled
inconsistently across drivers. And trying to fix these kind of low-level
things across drivers once divergences exists is just really painful (e.g.
trying to make all dma-buf mmap VM_SPECIAL or the herculeian task
Christian is doing to get our dma_resv rules consistent across drivers).

Cheers, Daniel

On Fri, Jan 07, 2022 at 12:47:45PM -0500, Felix Kuehling wrote:
> Am 2022-01-07 um 3:56 a.m. schrieb Christian König:
> > Am 06.01.22 um 17:51 schrieb Felix Kuehling:
> >> Am 2022-01-06 um 11:48 a.m. schrieb Christian König:
> >>> Am 06.01.22 um 17:45 schrieb Felix Kuehling:
> >>>> Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
> >>>> [SNIP]
> >>>> Also, why does your ACK or NAK depend on this at all. If it's the
> >>>> right
> >>>> thing to do, it's the right thing to do regardless of who benefits
> >>>> from
> >>>> it. In addition, how can a child process that doesn't even use the GPU
> >>>> be in violation of any GPU-driver related specifications.
> >>> The argument is that the application is broken and needs to be fixed
> >>> instead of worked around inside the kernel.
> >> I still don't get how they the application is broken. Like I said, the
> >> child process is not using the GPU. How can the application be fixed in
> >> this case?
> >
> > Sounds like I'm still missing some important puzzle pieces for the
> > full picture to figure out why this doesn't work.
> >
> >> Are you saying, any application that forks and doesn't immediately call
> >> exec is broken?
> >
> > More or less yes. We essentially have three possible cases here:
> >
> > 1. Application is already using (for example) OpenGL or OpenCL to do
> > some rendering on the GPU and then calls fork() and expects to use
> > OpenGL both in the parent and the child at the same time.
> >     As far as I know that's illegal from the Khronos specification
> > point of view and working around inside the kernel for something not
> > allowed in the first place is seen as futile effort.
> >
> > 2. Application opened the file descriptor, forks and then initializes
> > OpenGL/Vulkan/OpenCL.
> >     That's what some compositors are doing to drop into the backround
> > and is explicitly legal.
> >
> > 3. Application calls fork() and then doesn't use the GPU in the child.
> > Either by not using it or calling exec.
> >     That should be legal and not cause any problems in the first place. 
> >
> > But from your description I still don't get why we are running into
> > problems here.
> >
> > I was assuming that you have case #1 because we previously had some
> > examples of this with this python library, but from your description
> > it seems to be case #3.
> 
> Correct. #3 has at least one issue we previously worked around in the
> Thunk: The inherited VMAs prevent BOs from being freed in the parent
> process. This manifests as an apparent memory leak. Therefore the Thunk
> calls madvise(..., MADV_DONTFORK) on all its VRAM allocation. The BOs
> that are causing problems with CRIU are GTT BOs that weren't covered by
> this previous workaround.
> 
> The new issue with CRIU is, that CRIU saves and restores all the VMAs.
> When trying to restore the inherited VMAs in the child process, the mmap
> call fails because the child process' render node FD is no longer
> inherited from the parent, but is instead created by its own "open"
> system call. The mmap call in the child fails for at least two reasons:
> 
>   * The child process' render node FD doesn't have permission to map the
>     parent process' BO any more
>   * The parent BO doesn't get restored in the child process, so its mmap
>     offset doesn't get updated to the new mmap offset of the restored
>     parent BO by the amdgpu CRIU plugin
> 
> We could maybe add a whole bunch of complexity in CRIU and our CRIU
> plugin to fix this. But it's pointless because like you said, actually
> doing anything with the BO in the child process is illegal anyway
> (scenario #1 above). The easiest solution seems to be, to just not
> inherit the VMA in the first place.
> 
> Regards,
>   Felix
> 
> 
> >
> >> Or does an application that forks need to be aware that some other part
> >> of the application used the GPU and explicitly free any GPU resources?
> >
> > Others might fill that information in, but I think that was the plan
> > for newer APIs like Vulkan.
> >
> > Regards,
> > Christian.
> >
> >>
> >> Thanks,
> >>    Felix
> >>
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> Regards,
> >>>>     Felix
> >>>>
> >>>>
> >>>>> Let's talk about this on Mondays call. Thanks for giving the whole
> >>>>> context.
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>> Regards,
> >>>>>>      Felix
> >>>>>>
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
