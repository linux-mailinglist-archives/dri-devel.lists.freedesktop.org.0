Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051290B816
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 19:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCAC10E479;
	Mon, 17 Jun 2024 17:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PuSSyQKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680D810E479
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718645464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=juqpYUpSamtTNsW6q/swUfH8SfdpZV3yTBIEFOu9PiI=;
 b=PuSSyQKHVbxrSKXlvI9EJEd104OLbIp7Joc7XnahLIAe3mZYwCWnwuODaGl4HavP1i2AX4
 VtPCQjLZiHw1DNR0mxdfbbYm0RWm4/W2ku0hp7dO8d+X5hvYwDzGg8bfiya2zrGSH8nZwQ
 nTM5NspXhV3O74EgG7mG+8rLACpMydc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-_bSzEyDrM1yKcW7Jbq0ycw-1; Mon, 17 Jun 2024 13:31:02 -0400
X-MC-Unique: _bSzEyDrM1yKcW7Jbq0ycw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42196394b72so29400875e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 10:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718645461; x=1719250261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juqpYUpSamtTNsW6q/swUfH8SfdpZV3yTBIEFOu9PiI=;
 b=dpyOP4L8b410shDAjsIambe4f/zAu548/JlPGagKTO5u+6KKqaebV46TCAqZis3Vtl
 0iHqek3F5mVqxMsQkS778z7HZyg1JHhNk6Ti3zQZ5AIXPlYAktUQLuHb5c6dUuWOws8l
 HyxNg7rLEadXaeQIVAqu5w1pSggnE/U1gePZzfYIoXJ+EfV4V9SYuBvDx5zPyAA5WZPg
 KNu7A7FKzbNtPsRQNWObaka3CdHCLcxJcLXaEvnQyceFO7lT+uTf2loHGD5O/K3kcKn3
 RQejINEqqXOPSJ2Ur7h4w3RDn9N6KU+KVhd1JGef2R9aDmhp24mha9G/brWKG58QCtJj
 pHlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlmlUjzUYD+zfg+u92sy5NJ+6Z7u3l/atLBO8oN3YDejwjw0T4iKFXefPj3Oj1hG4G2pInJCJulDkEs4JrS6RE+Y9gNEobH+yRBUapd/ok
X-Gm-Message-State: AOJu0YyfaEGkin0OPiROI5Na6dfy1+adlNN6TrTc98vnI6GAfz1+Mmcw
 OXiVN3Q/F06CehRJ8wfpJCSS90YfEU5iPlCwXdkoN9kCXsupTVCojPaf4fx8NpPnOwtMTAHU6Eh
 /lSJeWCslZ+U84CKskxxezuJWHlEX5HMXxbEdFxcnumZI78RX5v0tvvWz7HGa9so15A==
X-Received: by 2002:a05:600c:3107:b0:423:499:a1ce with SMTP id
 5b1f17b1804b1-42304d934c4mr95550045e9.32.1718645461400; 
 Mon, 17 Jun 2024 10:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuuUn6lZP3Cco1EFviVROxS7UNMzaF09QHLto0t/V4C1c4w3DijZqzlYQjGhO6a4+LZhg46Q==
X-Received: by 2002:a05:600c:3107:b0:423:499:a1ce with SMTP id
 5b1f17b1804b1-42304d934c4mr95549875e9.32.1718645461013; 
 Mon, 17 Jun 2024 10:31:01 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286eef9c1sm202576595e9.7.2024.06.17.10.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:31:00 -0700 (PDT)
Date: Mon, 17 Jun 2024 19:30:58 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC] GPU driver with separate "core" and "DRM" modules
Message-ID: <ZnBy0jOshdyyLmkL@cassiopeiae>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240613170211.88779-1-bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Jun 14, 2024 at 03:02:09AM +1000, Ben Skeggs wrote:
> NVIDIA has been exploring ways to better support the effort for an
> upstream kernel mode driver for GPUs that are capable of running GSP-RM
> firmware, since the introduction[1] to Nova.
> 
> Use cases have been identified for which separating the core GPU
> programming out of the full DRM driver stack is a strong requirement
> from our key customers.
> 
> An upstreamed NVIDIA GPU driver should be able to support current and
> emerging customer use cases for vGPU hosts.  NVIDIA's vGPU deployments
> to date do not support compute or graphics functionality within the
> hypervisor host, and have no dependency on the Linux graphics subsystem,
> instead implementing the minimal functionality required to run vGPU
> guest VMs.
> 
> For security-sensitive environments such as cloud infrastructure, it's
> important to continue support for running a minimal footprint vGPU host
> driver in a stripped-down / barebones kernel environment.
> 
> This can be achieved by supporting both VFIO and DRM drivers as clients
> of a core driver, without requiring a full-fledged DRM driver (or the
> DRM subsystem itself) to be built into the host kernel.
> 
> A core driver would be responsible for booting and communicating with
> GSP-RM, enumeration of HW configuration, shared/partitioned resource
> management, exception handling, and event dispatch.
> 
> The DRM driver would do all the standard things a DRM driver does, and
> implement GPU memory management (TTM/HMM), KMS, command submission etc,
> as well as providing UAPI for userspace clients.  These features would
> be implemented using HW resources allocated from a core driver, rather
> than the DRM driver being directly responsible for HW programming.
> 
> As Nouveau's KMD is already split (in the logical sense) along similar
> lines, we're using it here for the purposes of this RFC to demonstrate
> the feasibility of such an architecture, and open it up for discussion.

Generally, I think that approach is reasonable and I like it. There's only a few
concerns I have for now.

We've already had (and still have) quite a few difficulties due to this split in
Nouveau. Especially when it comes to VMM and handling page tables. There are
cases where the locking architecture must be closely aligned with the upper
layers, i.e. the (VM_BIND) uAPI.

Having a separate (local) locking architecture doesn't work out well in this
case due to the implications of dealing with dma_fences and their signalling
paths.

Unfortunately, we can't even argue that we solved this problem in Nouveau. I
think it's fair to say that we found ways (without rewriting / restructuring a
lot of the VMM code to use a more global locking architecture) to make it work
in practice, but surely there are still conditions that (at least theoretically)
can lock things up.

I'm not saying that it's impossible to work this out, but having a strong
separation is likely to make those things quite a bit more difficult.

On the other hand this is a problem we might have to deal with either way, it
shouldn't matter too much having separate modules for VFIO and the GPU core.

Besides that, do we expect semantical changes in the firmware that can
potentially propagate up in the following sense?

[GSP firmware -> Host GPU core driver -> VFIO driver -> Guest GPU core driver]

If so, how do we deal with those? In the context of ensuring compatibility, can
we ensure this can't lead to increasing maintainance and testing effort over
time?

- Danilo

> 
> A link[2] to a tree containing the patches is below.
> 
> [1] https://lore.kernel.org/all/3ed356488c9b0ca93845501425d427309f4cf616.camel@redhat.com/
> [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.03-module
> 
> *** BLURB HERE ***
> 
> Ben Skeggs (2):
>   drm/nouveau/nvkm: export symbols needed by the drm driver
>   drm/nouveau/nvkm: separate out into nvkm.ko
> 
>  drivers/gpu/drm/nouveau/Kbuild                      |  4 ++--
>  drivers/gpu/drm/nouveau/include/nvkm/core/module.h  |  3 ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c               | 10 +---------
>  drivers/gpu/drm/nouveau/nvkm/core/driver.c          |  1 +
>  drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c          |  2 ++
>  drivers/gpu/drm/nouveau/nvkm/core/mm.c              |  4 ++++
>  drivers/gpu/drm/nouveau/nvkm/device/acpi.c          |  1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c       |  1 +
>  drivers/gpu/drm/nouveau/nvkm/module.c               |  8 ++++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c     |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c      |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c       |  3 +++
>  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c     |  3 +++
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c      |  2 ++
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c       |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c    |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c     |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c     |  1 +
>  19 files changed, 33 insertions(+), 16 deletions(-)
> 
> -- 
> 2.44.0
> 

