Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E057901656
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 16:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A6F10E078;
	Sun,  9 Jun 2024 14:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aH7eJ7TG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9816C10E04A
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717942699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cMyIMuZIV0J4WT/bbuPywT6mF+m6iBHlzM2Be2NV7Fg=;
 b=aH7eJ7TGMwjekjAUhFK9xuioVVMb/dEmxlUkPtncPl1BbnzTJHiLneyUl5lY8eVtROL8iA
 i+of4eCxV0wDPMPNJIW3I8GipoJTDTkSI5/1Ky86pYNJaZ7DjRbMAgokI1sBbxgxlDFrvs
 TA11uKDLG4GyHq4G/tH+GLUMHFdv+q4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-UVIIFVT5M8evjC9o_QJUSQ-1; Sun, 09 Jun 2024 10:18:16 -0400
X-MC-Unique: UVIIFVT5M8evjC9o_QJUSQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6f9615f7affso2566448a34.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 07:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717942696; x=1718547496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMyIMuZIV0J4WT/bbuPywT6mF+m6iBHlzM2Be2NV7Fg=;
 b=r996Qe/HEoM+x2dBb0n91W7+hGOEXhLMNhCaW2+7yoMOT1Rmgy9PGz31dsqa+tiajQ
 oO4SZjLkkXWHCb+VlOhxCb00IEdIkJD+nT/soGD8Blb2Cx6UUGPBzAPDYcsPTY3dhYJR
 zNLW/KzGwkQKzkpTJuZ1BRspt8gN7FFYk/66srtCOfJdbzFet6a72/iPebQvaAeo9DnJ
 q4zSnq3lCYjN/4qsOAKA3wbbihLVZh1zRCP/ZfQ3wepka0HDKLjrTH1Ln3g1CNxjptM6
 aBePtoTgehGs6JU/Myg21FMhetKFk8vco+vlECO9vmG+K1L7pZHYKCuunbf6G48aoYiN
 gQpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA9q4AiPVU29YzNDZYQbyVwMo/AlOu6uIrp9iv0iEVaPuG3XwLQ2hkXrZgSiNKS8aSz+w/LHnPrhrgXlLbj6+Eptf0CBnoHbCMeRJysxww
X-Gm-Message-State: AOJu0Yy3g8p0XZHkNgTGKoiD1cUyS/2e00RHKKbFMKnVOoCHp23e4hnE
 LJvQfkx0gq+ykPBAJSUQLsYwWvRgPHOoCdEP2e7LgzdCYaf/XiUT4rTuWrWZxOp6ONEwSV27d/b
 7MmfrN8UQrhY6rsO05Z8k51ZSb3qmYkWYNdTNnfsNar/6ta9sOybtLCkdCSiqDq896w==
X-Received: by 2002:a05:6830:1306:b0:6f9:b071:28c6 with SMTP id
 46e09a7af769-6f9b07129eamr776371a34.18.1717942696149; 
 Sun, 09 Jun 2024 07:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEgFJzPhPL9AfxoVR1rmqk6GbXBxcYfuvjBNWJrBUiacSd3hziDK5FPsK0p/sHN42elFxnZg==
X-Received: by 2002:a05:6830:1306:b0:6f9:b071:28c6 with SMTP id
 46e09a7af769-6f9b07129eamr776339a34.18.1717942695725; 
 Sun, 09 Jun 2024 07:18:15 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:34d8:5ea8:12d:c9ae])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-6f97eb7c200sm513850a34.20.2024.06.09.07.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 07:18:15 -0700 (PDT)
Date: Sun, 9 Jun 2024 16:18:09 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Asahi Lina <lina@asahilina.net>
Cc: Rob Herring <robh@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com,
 fujita.tomonori@gmail.com, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Message-ID: <ZmW5oT7knQh9nKeD@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org>
 <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
MIME-Version: 1.0
In-Reply-To: <641bda93-35f3-429e-b627-a9485505b6bf@asahilina.net>
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

Hi Lina,

Welcome back!

On Sun, Jun 09, 2024 at 02:15:57PM +0900, Asahi Lina wrote:
> 
> 
> On 5/22/24 6:23 AM, Rob Herring wrote:
> > On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> >> From: Asahi Lina <lina@asahilina.net>
> > This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
> > I suppose some are legacy which won't be needed any time soon if ever. 
> > Not sure if you intend for this to be complete, or you are just adding 
> > what you are using? Only FEAT_GEM is used by nova ATM.
> > 
> 
> This was developed before DRIVER_GEM_GPUVA existed ^^
> 
> I have this in my branch since I'm using the GPUVA manager now. Danilo,
> what tree are you using for this submission? It would be good to
> coordinate this and try to keep the WIP branches from diverging too much...

Trying to prevent things from diverging was one of my main objectives when I
started those efforts a couple of month ago (I also sent you a mail for that
purpose back then).

I am maintaining a couple of branches:

In the RfL repository [1]:

  - staging/rust-device [2] (Device / driver, devres infrastructure)
  - staging/dev [3] (common branch containing all the Rust infrastructure I'm
    currently upstreaming, including PCI and firmware abstractions)

In the drm-misc repository [4]:
  - topic/rust-drm [5] (all the DRM abstractions)

In the Nova repository [6]
  - nova-next [7] (the Nova stub driver making use of everything)

I regularly rebase those branches and keep them up to date with improvements and
feedback from the mailing list.

The device / driver and PCI abstractions are getting most of my attention
currently, but there are some recent changes (besides some minor ones) on the
DRM abstractions I plan to send in a v2 as well:

- static const allocation of driver and fops structures
- rework of the `Registration` type to use `Devres` and combine the new() and
  register() methods to register in new() already

There is also some more information regarding those branches in the cover
letters of the series and the links included there.

[1] https://github.com/Rust-for-Linux/linux
[2] https://github.com/Rust-for-Linux/linux/tree/staging/rust-device
[3] https://github.com/Rust-for-Linux/linux/tree/staging/dev
[4] https://gitlab.freedesktop.org/drm/misc/kernel
[5] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[6] https://gitlab.freedesktop.org/drm/nova
[7] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

> 
> That said, I don't think there's reason to support all features unless
> we expect new drivers to actually use them. The goal of the abstractions
> is to serve the drivers that will use them, and to evolve together with
> them and any newer drivers, not to attempt to be feature-complete from
> the get go (it's very difficult to evaluate an abstraction if it has no
> users!). In general my approach when writing them was to abstract what I
> need and add "obvious" extra trivial features that didn't require much
> thought even if I wasn't using them, but otherwise not attempt to
> comprehensively cover everything.

Fully agree, I think the point here only was whether we want to list all the
feature flags in the abstraction already. Which I think is something we can do.
However, I'm also find with only listing the ones we actually use and keep
adding further ones subsequently. It just shouldn't be random.

- Danilo

> 
> ~~ Lina
> 

