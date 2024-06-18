Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C815C90C557
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CDE10E601;
	Tue, 18 Jun 2024 09:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KpXn9f1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD81710E5FF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:31:14 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-362468852c8so23845f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718703073; x=1719307873; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AjCqaadfaUUjMeT7paTPDvr56RvpDbYR++opJ2dRPII=;
 b=KpXn9f1hOi2Yojsn+6wbP12eXdrENy0XM0bwJpZkCK0t7YbPbaVgHJyJ1wBiBEhSrI
 zPiCehTxS08gccRLzqWDWVBrKtsd2zJ20RnEtaq4f4VqM+uGU6fKJ/td+BWb07kCXzJe
 U/MlYIWZ5i/VD/2/sMAPhiQr7xH/EQeEiEM8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718703073; x=1719307873;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AjCqaadfaUUjMeT7paTPDvr56RvpDbYR++opJ2dRPII=;
 b=iF20KwUVKIgAVm5XovD1eTJDpXqubdQvgtqCRdtpRnoyr02kfHrW7yvY1JvsXOJ1s0
 UAbThQT9atX6awBvTnHKpMocPRIQj9mALO52vUQVBuAEEIZcTg8L6PlnKRXyAU02Ps6M
 fFsbkNcVj+Ivm3XtbYAz0a2FbS3wuNZQvB0vE++5usvTXqV9wr70iYcNe/SKy9ytiTRg
 7XmyUJwAQHDegs6zJ/nsPAJugqxQpa7RTGZUfZBT54z08RZ3EED8IvN395kzX5QlcLPO
 JLbv9goTxOvPLbPL+aqWCzZQQkAiAVd36Hks/yuSYdaRWUkCbm43ZImefZ1gZ4KkPgOq
 Ly1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS5mJ6VzXcQliwgeQsdAZKt59uphPVnMtSXrbGhCyy+P6tVxTR3zYEwTCaOGaSceiN37nDaiBuNUn6oCQW9xTpujtbMvvJbxPhs/OdLwf7
X-Gm-Message-State: AOJu0Yxb7jqApqcsHf8PUO+LS1sj7VrS3V4CXaWCziiJYesq+ik/jezz
 cAnzMtCK5rNVUji+ONSciNW/xA0oYQnb5QXGfFfKkLMnnGphSstxPMXzK5u3quE=
X-Google-Smtp-Source: AGHT+IHZKdFICWmVVUU27o03WaTapDIDPXbCjPM2F84jp87bVbeAoOl97/4FoHYkjs5nURGnZskBDw==
X-Received: by 2002:a05:600c:1d1b:b0:421:74d4:f32c with SMTP id
 5b1f17b1804b1-42304d7f7b9mr89538005e9.1.1718703072978; 
 Tue, 18 Jun 2024 02:31:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de618sm222337225e9.37.2024.06.18.02.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:31:12 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:31:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC] GPU driver with separate "core" and "DRM" modules
Message-ID: <ZnFT3u9S-qf8M5Bf@phenom.ffwll.local>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
 <ZnBARgjk-83NXC5S@phenom.ffwll.local>
 <f5dc9d9e-23ac-4dec-a76a-c2a44ae158f4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5dc9d9e-23ac-4dec-a76a-c2a44ae158f4@nvidia.com>
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

On Tue, Jun 18, 2024 at 04:23:17AM +1000, Ben Skeggs wrote:
> On 17/6/24 23:55, Daniel Vetter wrote:
> 
> > On Fri, Jun 14, 2024 at 03:02:09AM +1000, Ben Skeggs wrote:
> > > NVIDIA has been exploring ways to better support the effort for an
> > > upstream kernel mode driver for GPUs that are capable of running GSP-RM
> > > firmware, since the introduction[1] to Nova.
> > > 
> > > Use cases have been identified for which separating the core GPU
> > > programming out of the full DRM driver stack is a strong requirement
> > > from our key customers.
> > > 
> > > An upstreamed NVIDIA GPU driver should be able to support current and
> > > emerging customer use cases for vGPU hosts.  NVIDIA's vGPU deployments
> > > to date do not support compute or graphics functionality within the
> > > hypervisor host, and have no dependency on the Linux graphics subsystem,
> > > instead implementing the minimal functionality required to run vGPU
> > > guest VMs.
> > > 
> > > For security-sensitive environments such as cloud infrastructure, it's
> > > important to continue support for running a minimal footprint vGPU host
> > > driver in a stripped-down / barebones kernel environment.
> > > 
> > > This can be achieved by supporting both VFIO and DRM drivers as clients
> > > of a core driver, without requiring a full-fledged DRM driver (or the
> > > DRM subsystem itself) to be built into the host kernel.
> > > 
> > > A core driver would be responsible for booting and communicating with
> > > GSP-RM, enumeration of HW configuration, shared/partitioned resource
> > > management, exception handling, and event dispatch.
> > > 
> > > The DRM driver would do all the standard things a DRM driver does, and
> > > implement GPU memory management (TTM/HMM), KMS, command submission etc,
> > > as well as providing UAPI for userspace clients.  These features would
> > > be implemented using HW resources allocated from a core driver, rather
> > > than the DRM driver being directly responsible for HW programming.
> > > 
> > > As Nouveau's KMD is already split (in the logical sense) along similar
> > > lines, we're using it here for the purposes of this RFC to demonstrate
> > > the feasibility of such an architecture, and open it up for discussion.
> > Sounds reasonable.
> > 
> > Only bikeshed I have to add is that the blessed way (according to the cool
> > kernel maintainers at least or something) to structure this is using
> > auxbus. Definitely when you end up with more than one driver binding to
> > the core (like maybe some system management interface thing, or perhaps a
> > special compute-only kernel driver).
> > 
> > https://dri.freedesktop.org/docs/drm/driver-api/auxiliary_bus.html
> 
> Hey!
> 
> Yes indeed.  I sent this[1] series at the same time, which was initially
> written to so that nouveau.ko would still get auto-loaded alongside nvkm.ko.
> 
> Ben.
> 
> 
> [1] https://lists.freedesktop.org/archives/nouveau/2024-June/044861.html

Oh I missed that you've already typed up the aux bus conversion somewhere.
I guess just land it all :-)
-Sima

> 
> 
> > 
> > Cheers, Sima
> > 
> > > A link[2] to a tree containing the patches is below.
> > > 
> > > [1] https://lore.kernel.org/all/3ed356488c9b0ca93845501425d427309f4cf616.camel@redhat.com/
> > > [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.03-module
> > > 
> > > *** BLURB HERE ***
> > > 
> > > Ben Skeggs (2):
> > >    drm/nouveau/nvkm: export symbols needed by the drm driver
> > >    drm/nouveau/nvkm: separate out into nvkm.ko
> > > 
> > >   drivers/gpu/drm/nouveau/Kbuild                      |  4 ++--
> > >   drivers/gpu/drm/nouveau/include/nvkm/core/module.h  |  3 ---
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c               | 10 +---------
> > >   drivers/gpu/drm/nouveau/nvkm/core/driver.c          |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c          |  2 ++
> > >   drivers/gpu/drm/nouveau/nvkm/core/mm.c              |  4 ++++
> > >   drivers/gpu/drm/nouveau/nvkm/device/acpi.c          |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c       |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/module.c               |  8 ++++++--
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c     |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c      |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c       |  3 +++
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c     |  3 +++
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c      |  2 ++
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c       |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c    |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c     |  1 +
> > >   drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c     |  1 +
> > >   19 files changed, 33 insertions(+), 16 deletions(-)
> > > 
> > > -- 
> > > 2.44.0
> > > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
