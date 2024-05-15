Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8E8C6D2A
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 22:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB44310E2D9;
	Wed, 15 May 2024 20:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="frgbgqrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327EE10E2D9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 20:22:17 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5727dc6d3edso2460662a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715804536; x=1716409336;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZlA7HkqGGky3+qx2udfV2DjY9LzoSxvenoXojxQkMi8=;
 b=frgbgqrJmQpn+1+FWGIEjAy3bPfCdfCaM9tJ5XAGVjOkZQwegOCKyXTdWHnlKpkMeR
 hfvzCYRUUwuZg/4tHCb2sHlVzZdcOgKQTZswz/PBFS1AkqPgZj2HyHmXv4tg+apuziVM
 O3qk3FmAZZ/WGYwxVUlhTIlxMlqWlfAmtzG0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715804536; x=1716409336;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZlA7HkqGGky3+qx2udfV2DjY9LzoSxvenoXojxQkMi8=;
 b=ITFg7u758b+5xI1zDZyMm6LxYc4tVq48bOitUQNmXWa+j1noQNx9/jM+GG4Yq8HN49
 6JodmgTXdUO3UfHzrzHGHwUOVrFd9VuiOKRFhOPboncb9Na3ymZRopaBSrmfqha7E1D6
 JUkZcDHQBAZguSwm6t6DY9+RtPwSgZSbjti56HjpXsr0+P4Vfpa/WpLvLRatqherwBeA
 Tb85UMrAonQgXf60AmtiF771lHDyyv6Uq1mVjABepoJ93GAbpV/9ewvRYEbmQX6v4k3X
 zuOfEoEa3Bm/M0HcvRuzlvVn4JI0qZv7SVbPwyiRlP4FF0zaq/6FPYmDcHZptdP8hsRa
 9ebA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk4vIM2dogzgTqt9C9pxdBl7PMi2+jJDhouf5PSfib4GxeDOnzXt0BVrBk7g6Awx3EONRWdHRPTDemlgQbFWq0GpK+iqPcjoSSwqCmaQdL
X-Gm-Message-State: AOJu0YxQQhp/wsqwIGTZiDq8UTLE+7tVHgGruBDIRLxdvlGgAf6BGlPg
 aEQxslUiH45o3JVNWYjw7ZGwvCDlLTlzgLKIEno7SKYRvI2yIyd/4fqJOp6PjBFK6txWpXDhUxO
 a0TNT6Q==
X-Google-Smtp-Source: AGHT+IHvSIfYKh6gDRd4o3XNOk22Sw4fFK0tBOe/L59rLZOyUIgq5F70Fy9LQw0sxUlaiIsQsQ+gNw==
X-Received: by 2002:a50:8ac2:0:b0:572:4faf:ed68 with SMTP id
 4fb4d7f45d1cf-5734d67b076mr11329402a12.27.1715804536007; 
 Wed, 15 May 2024 13:22:16 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed0af0sm9545834a12.49.2024.05.15.13.22.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 13:22:15 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a59b58fe083so208476366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:22:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUK83ZqKKHmuksCHYZOo0YpakTEyTQ3ZRCDcPKjwq2CPDJL2VHQ+gNj9quFMeN6MB7smsmiwjFVIMJiaZFdR5rZ50Qlf7gnUpF6ennq+B9R
X-Received: by 2002:a17:906:eb18:b0:a59:c844:beea with SMTP id
 a640c23a62f3a-a5a2d676a37mr1093027066b.73.1715804534952; Wed, 15 May 2024
 13:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
In-Reply-To: <CAHk-=wge0et+3PP47OBnNx66Q=i_XgqfGfrSmDGHSyp=Jn-CgQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 13:21:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
Message-ID: <CAHk-=whTqHgXZ4Aj8dNO3Peg9Rf0sh2F7zGWRUOmBwfMDxgvbQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 15 May 2024 at 13:06, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. There's something seriously wrong with amdgpu.
>
> I'm getting a ton of__force_merge warnings:
>
>   WARNING: CPU: 0 PID: 1069 at drivers/gpu/drm/drm_buddy.c:199
> __force_merge+0x14f/0x180 [drm_buddy]

Adding likely culprits to the participants, since it looks like this
is all new with commit 96950929eb23 ("drm/buddy: Implement tracking
clear page feature").

Sadly I can't juist revert that commit to check, because there are
many subsequent commits that then depend on it.

I guess I'll try to revert the later commit that enables it for amdgpu
(commit a68c7eaa7a8f) and see if it at least makes the horrendous
messages go away.

Anyway, this is some old Radeon graphics card in my Threadripper:

49:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev e7)
(prog-if 00 [VGA controller])
        Subsystem: Sapphire Technology Limited Radeon RX 570 Pulse 4GB
        Flags: bus master, fast devsel, latency 0, IRQ 130, IOMMU group 32
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Memory at d0000000 (64-bit, prefetchable) [size=2M]
        I/O ports at 8000 [size=256]
        Memory at d1c00000 (32-bit, non-prefetchable) [size=256K]
        Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

I think it's a "Sapphire Radeon Pulse RX 580" or something like that.

                Linus
