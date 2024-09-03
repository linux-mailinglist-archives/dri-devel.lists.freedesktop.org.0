Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E169969B11
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91FB10E198;
	Tue,  3 Sep 2024 11:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SMvtZCtH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68C310E414
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:32:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-374d29ad8a7so636792f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725348775; x=1725953575; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jStyz7cF/GRPSLiBq7afoHfr3JzNU62RShSwfRKzITo=;
 b=SMvtZCtHavOoC37wsT0kwrO0ywLGRn+6pMbDVTEzdA8wn7vKFTM1vabUrGyLio2GeY
 cBnvo9glEUkvaUsbNgG5zj2+CekxSOYPXy+pRhX7WrcosqoFUaYeuWeS02W4VPdEYjFO
 nTLJ4i9OMmBWpIhJ/DbJ3C1rOr+4U/tidJsu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725348775; x=1725953575;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jStyz7cF/GRPSLiBq7afoHfr3JzNU62RShSwfRKzITo=;
 b=p3Moq7jVqaDxNiepSIf5wBJ7HwF1iECYyFwIK/D+ZryJw3PmtmI12lOxRc+/Q9oePz
 xOQCgynwU8naurdrlTspAuCy/8Kpsf83yKq5JObXUekeKHNm9DFhth5JAI5Rzc6gAvYD
 2O85QMP6tg+B8vYyCRaOvvmlGrnVZEXwifUozyPx1wgmWmqBANR8NPGbjo+jyIXybvXY
 kZDLqtUQgeEF84eoTc9lG4MPd/q5eDok0xxUyVlEwTpHdMJ/6PGUw0NHn2SGiGEgj3tE
 DDgfviMDM0eQdxlWfOm6ezn+sBL4FMn+jTX70VeJLYd/R/GhNhQO1d57NFRZDqxxmGQa
 7ThQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKWOJ2tZqP7ivKCO589GCvss/1EZqeSLG3osdLxn5uFss6tK7kqryHUZFWCmmgcDu3vqTjskFVkKw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8e+AtPUogP0kN7qJSl6GqD9X5bt6py2i1PZ7o3ZEduqJKxjZ5
 GAp5TMzfWI9pz9dl5p2M1WhzFz/BR/S/3dQm/5eGIIaSXSBGqjpIHbpuD+dVZR0=
X-Google-Smtp-Source: AGHT+IGgQUY7p0fwPG8ckVOXs6G5z6LEBN/3GIwOhXGelUa0A/UnYm2cH9vzWq0+BrRRjfVRAHkMdQ==
X-Received: by 2002:adf:fc4d:0:b0:368:3717:10aa with SMTP id
 ffacd0b85a97d-374c9455425mr3438719f8f.11.1725348774560; 
 Tue, 03 Sep 2024 00:32:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cc75a5fbsm4256548f8f.80.2024.09.03.00.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 00:32:54 -0700 (PDT)
Date: Tue, 3 Sep 2024 09:32:51 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 robh@kernel.org, daniel.almeida@collabora.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 0/8] DRM Rust abstractions and Nova
Message-ID: <Zta7o089vlSbfZbq@phenom.ffwll.local>
References: <20240618233324.14217-1-dakr@redhat.com>
 <ZtXqYGt3g_YY7RUN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtXqYGt3g_YY7RUN@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.9.12-amd64 
X-Mailman-Approved-At: Tue, 03 Sep 2024 11:01:31 +0000
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

On Mon, Sep 02, 2024 at 06:40:00PM +0200, Daniel Vetter wrote:
> On Wed, Jun 19, 2024 at 01:31:36AM +0200, Danilo Krummrich wrote:
> > This patch series implements some basic DRM Rust abstractions and a stub
> > implementation of the Nova GPU driver.
> > 
> > Nova is intended to be developed upstream, starting out with just a stub driver
> > to lift some initial required infrastructure upstream. A more detailed
> > explanation can be found in [1].
> > 
> > This patch series is based on the "Device / Driver and PCI Rust abstractions"
> > series [2].
> > 
> > The DRM bits can also be found in [3] and the Nova bits in [4].
> > 
> > Changes in v2:
> > ==============
> > - split up the DRM device / driver abstractions in three separate commits
> > - separate `struct drm_device` abstraction in a separte source file more
> >   cleanly
> > - switch `struct drm_driver` and `struct file_operations` to 'static const'
> >   allocations
> > - implement `Registration::new_foreign_owned` (using `Devres`), such that we
> >   don't need to keep the `Registration` alive on the Rust side, but
> >   automatically revoke it on device unbind
> > - add missing DRM driver features (Rob)
> > - use `module_pci_driver!` macro in Nova
> > - use a const sized `pci::Bar` in Nova
> > - increase the total amount of Documentation, rephrase some safety comments and
> >   commit messages for less ambiguity
> > - fix compilation issues with some documentation example
> > 
> > [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> > [2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
> > [3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
> > [4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next
> 
> Ok finally stopped dragging my feet on this, went through my old comments,
> looked at stuff again, and wrote some replies.
> 
> I think all but the question around type safety for drm_driver->features
> can be sorted out post-merge, when we have a driver that needs it. The
> feature flags stuff I think essentially makes the current abstraction
> unsafe, and you can blow up when constructing a new drm::Device instance
> if you're creative enough I think.

Oh one thing I've forgotten: I think for the subclassing pattern in rust
there's clear consensus now, at least from my discussion with Lyude on the
modeset side of things. Well maybe aside from the little issue that rust
doesn't guarantee uniqueness for static const ops pointers, but apparently
that's getting addressed. One thing I'd really like us to be consistent at
though is not just the pattern, but the naming (like RawFoo vs whatever
else people came up with) of the different struct/traits, so would be
really good to document that somewhere for drm and make sure we follow it
in all the gpu related rust bindings. Unless upstream has that already
(maybe as part of the device/driver binding stuff).

Cheers, Sima

> > Asahi Lina (4):
> >   rust: drm: ioctl: Add DRM ioctl abstraction
> >   rust: Add a Sealed trait
> >   rust: drm: file: Add File abstraction
> >   rust: drm: gem: Add GEM object abstraction
> > 
> > Danilo Krummrich (4):
> >   rust: drm: add driver abstractions
> >   rust: drm: add device abstraction
> >   rust: drm: add DRM driver registration
> >   nova: add initial driver stub
> > 
> >  MAINTAINERS                     |  10 +
> >  drivers/gpu/drm/Kconfig         |   2 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/nova/Kconfig    |  12 +
> >  drivers/gpu/drm/nova/Makefile   |   3 +
> >  drivers/gpu/drm/nova/driver.rs  |  85 +++++++
> >  drivers/gpu/drm/nova/file.rs    |  70 ++++++
> >  drivers/gpu/drm/nova/gem.rs     |  50 ++++
> >  drivers/gpu/drm/nova/gpu.rs     | 173 ++++++++++++++
> >  drivers/gpu/drm/nova/nova.rs    |  18 ++
> >  include/uapi/drm/nova_drm.h     | 101 ++++++++
> >  rust/bindings/bindings_helper.h |   5 +
> >  rust/helpers.c                  |  23 ++
> >  rust/kernel/drm/device.rs       | 182 ++++++++++++++
> >  rust/kernel/drm/drv.rs          | 199 ++++++++++++++++
> >  rust/kernel/drm/file.rs         | 116 +++++++++
> >  rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
> >  rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
> >  rust/kernel/drm/mod.rs          |   9 +
> >  rust/kernel/lib.rs              |   7 +
> >  rust/uapi/uapi_helper.h         |   2 +
> >  21 files changed, 1630 insertions(+)
> >  create mode 100644 drivers/gpu/drm/nova/Kconfig
> >  create mode 100644 drivers/gpu/drm/nova/Makefile
> >  create mode 100644 drivers/gpu/drm/nova/driver.rs
> >  create mode 100644 drivers/gpu/drm/nova/file.rs
> >  create mode 100644 drivers/gpu/drm/nova/gem.rs
> >  create mode 100644 drivers/gpu/drm/nova/gpu.rs
> >  create mode 100644 drivers/gpu/drm/nova/nova.rs
> >  create mode 100644 include/uapi/drm/nova_drm.h
> >  create mode 100644 rust/kernel/drm/device.rs
> >  create mode 100644 rust/kernel/drm/drv.rs
> >  create mode 100644 rust/kernel/drm/file.rs
> >  create mode 100644 rust/kernel/drm/gem/mod.rs
> >  create mode 100644 rust/kernel/drm/ioctl.rs
> >  create mode 100644 rust/kernel/drm/mod.rs
> > 
> > 
> > base-commit: 6646240d29b11de3177f71ff777d0ae683c32623
> > -- 
> > 2.45.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
