Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17AD968C3D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 18:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D827110E0C7;
	Mon,  2 Sep 2024 16:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GPc+GU9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187810E0C7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 16:40:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42bb8cf8abeso34938715e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725295204; x=1725900004; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qxn7jDrhXcDat8mwJsxtE8edha00W1MVu07WpvK7c6k=;
 b=GPc+GU9Wjzn7ndaC8N51FtYvnvUnU4/eRQUEjWlxl/5Urp2rAzpVvnEPsY4WIoUWp8
 iszIsbNeM9nEqtDK2GPUp2exTTZJM4PLPCam+XZl4eHLKlFCSW7IikWF/2faaYlEWrvy
 +wZXcd6QD6whXvnHZwYnsP787jvzF1IH6YYgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725295204; x=1725900004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qxn7jDrhXcDat8mwJsxtE8edha00W1MVu07WpvK7c6k=;
 b=JzF+pLHsEaadl8iYA2f7SInXA9ZPU5UFgtWgqhmq/uNbTie3fDVZWaJHzmPIEGRcn2
 clzUMASQovBL3YjVtKPHOY+Vo2R4BtRzmJbFgurH4MDkpUPgDtNTwnd7OAPl6ti5eyH3
 H68N2mHFNBo4KS1/97d7XK6ewESL7Hsm4yOGXnboNxWYTeJLwx75GXSZR+UWuLJaezXH
 atY/+JPoP5n+46lYCF7pNoumsgiJCB5og4mEzu9Ocur3J6usrvRkgmR1gSvHbVF1hmS4
 4Zu2thpkVVS1A5BBhVPaADy+BR3vQw6GGHKGgP+gkZbj0twA96JDGLkdvun2NlBWnmeN
 19WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi9YwrDo4gL5VqYUBMrBljm2tokLf7cmf0YrQKhWvPsnuMUer1os/oTbblkSpQms+8BH5cJrTVsxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAN80XYMLPTpe8o+PvnmErfo2McRvkU1PoyOvy7fOd7EPhHTIm
 JLYQPc3cGle2OqhKwu1KI753yQaceKiFJDGUNvHmT8nw5etJwcUpZ+LFVG0O1G8=
X-Google-Smtp-Source: AGHT+IGE14ktT1PD1qJMhFnhMzNGipg0c4D+FGJxtT3YeSHoyJQBt14wG1cM+FJZoDWCYkaSr3vGdg==
X-Received: by 2002:a05:600c:1d89:b0:427:fa39:b0db with SMTP id
 5b1f17b1804b1-42bb01e5bffmr114062755e9.27.1725295203677; 
 Mon, 02 Sep 2024 09:40:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bacaac810sm162739935e9.33.2024.09.02.09.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:40:03 -0700 (PDT)
Date: Mon, 2 Sep 2024 18:40:00 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <ZtXqYGt3g_YY7RUN@phenom.ffwll.local>
References: <20240618233324.14217-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
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

On Wed, Jun 19, 2024 at 01:31:36AM +0200, Danilo Krummrich wrote:
> This patch series implements some basic DRM Rust abstractions and a stub
> implementation of the Nova GPU driver.
> 
> Nova is intended to be developed upstream, starting out with just a stub driver
> to lift some initial required infrastructure upstream. A more detailed
> explanation can be found in [1].
> 
> This patch series is based on the "Device / Driver and PCI Rust abstractions"
> series [2].
> 
> The DRM bits can also be found in [3] and the Nova bits in [4].
> 
> Changes in v2:
> ==============
> - split up the DRM device / driver abstractions in three separate commits
> - separate `struct drm_device` abstraction in a separte source file more
>   cleanly
> - switch `struct drm_driver` and `struct file_operations` to 'static const'
>   allocations
> - implement `Registration::new_foreign_owned` (using `Devres`), such that we
>   don't need to keep the `Registration` alive on the Rust side, but
>   automatically revoke it on device unbind
> - add missing DRM driver features (Rob)
> - use `module_pci_driver!` macro in Nova
> - use a const sized `pci::Bar` in Nova
> - increase the total amount of Documentation, rephrase some safety comments and
>   commit messages for less ambiguity
> - fix compilation issues with some documentation example
> 
> [1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
> [2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
> [3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
> [4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Ok finally stopped dragging my feet on this, went through my old comments,
looked at stuff again, and wrote some replies.

I think all but the question around type safety for drm_driver->features
can be sorted out post-merge, when we have a driver that needs it. The
feature flags stuff I think essentially makes the current abstraction
unsafe, and you can blow up when constructing a new drm::Device instance
if you're creative enough I think.

Cheers, Sima

> 
> Asahi Lina (4):
>   rust: drm: ioctl: Add DRM ioctl abstraction
>   rust: Add a Sealed trait
>   rust: drm: file: Add File abstraction
>   rust: drm: gem: Add GEM object abstraction
> 
> Danilo Krummrich (4):
>   rust: drm: add driver abstractions
>   rust: drm: add device abstraction
>   rust: drm: add DRM driver registration
>   nova: add initial driver stub
> 
>  MAINTAINERS                     |  10 +
>  drivers/gpu/drm/Kconfig         |   2 +
>  drivers/gpu/drm/Makefile        |   1 +
>  drivers/gpu/drm/nova/Kconfig    |  12 +
>  drivers/gpu/drm/nova/Makefile   |   3 +
>  drivers/gpu/drm/nova/driver.rs  |  85 +++++++
>  drivers/gpu/drm/nova/file.rs    |  70 ++++++
>  drivers/gpu/drm/nova/gem.rs     |  50 ++++
>  drivers/gpu/drm/nova/gpu.rs     | 173 ++++++++++++++
>  drivers/gpu/drm/nova/nova.rs    |  18 ++
>  include/uapi/drm/nova_drm.h     | 101 ++++++++
>  rust/bindings/bindings_helper.h |   5 +
>  rust/helpers.c                  |  23 ++
>  rust/kernel/drm/device.rs       | 182 ++++++++++++++
>  rust/kernel/drm/drv.rs          | 199 ++++++++++++++++
>  rust/kernel/drm/file.rs         | 116 +++++++++
>  rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
>  rust/kernel/drm/mod.rs          |   9 +
>  rust/kernel/lib.rs              |   7 +
>  rust/uapi/uapi_helper.h         |   2 +
>  21 files changed, 1630 insertions(+)
>  create mode 100644 drivers/gpu/drm/nova/Kconfig
>  create mode 100644 drivers/gpu/drm/nova/Makefile
>  create mode 100644 drivers/gpu/drm/nova/driver.rs
>  create mode 100644 drivers/gpu/drm/nova/file.rs
>  create mode 100644 drivers/gpu/drm/nova/gem.rs
>  create mode 100644 drivers/gpu/drm/nova/gpu.rs
>  create mode 100644 drivers/gpu/drm/nova/nova.rs
>  create mode 100644 include/uapi/drm/nova_drm.h
>  create mode 100644 rust/kernel/drm/device.rs
>  create mode 100644 rust/kernel/drm/drv.rs
>  create mode 100644 rust/kernel/drm/file.rs
>  create mode 100644 rust/kernel/drm/gem/mod.rs
>  create mode 100644 rust/kernel/drm/ioctl.rs
>  create mode 100644 rust/kernel/drm/mod.rs
> 
> 
> base-commit: 6646240d29b11de3177f71ff777d0ae683c32623
> -- 
> 2.45.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
