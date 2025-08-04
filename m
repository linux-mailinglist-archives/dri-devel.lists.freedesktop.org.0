Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3EB1A3BA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 15:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ABA10E550;
	Mon,  4 Aug 2025 13:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uQJuBgga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5843810E209
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 13:45:16 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so30804545e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754315115; x=1754919915;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lVxfLjqZpUxA7k2P1DVAmCagXBwL2u2PCEjKY9dcPbA=;
 b=uQJuBgga1wCdaUOmAnll8dgQsuRd1/ntYtZmJfsPsIXQUQ6aY0/RE2FDqLquuBu8Vd
 4o+xt5HQ1ZFa8JBO+jHSSZg/RqZ/3BUcnB3LnPCfUnIFaodJjPwb2oGn3KptGQ8P4fjh
 yxM/cDZ4+7xwz/k4wR0oakmxlHLd1eay3o/0UYo5fGHAqYSx1br5kd8LMZQVFslOvUjl
 8ics7uoIZgoqTXmoo+4cnWpRIDn2XGaToEJ9QA4Ei/8bSe39sRFRd8pRiy6rrS3j1YFA
 QR3Fzj2X5U5+w/HTIKNGIgDTAcBTyckWWpxl0Rc9SOdrTZHcyw5ZmbEZhXAEJyeuEtK9
 uREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754315115; x=1754919915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lVxfLjqZpUxA7k2P1DVAmCagXBwL2u2PCEjKY9dcPbA=;
 b=bw02PIhAYQjE+cQ1uX9ncpr2q7XCPX2zXeoAj+9zzzTToUspgDaPvcdwQqklQyCojW
 v4dK2G1Xj5k/Y5pmL4TWAGOF55U4iGBGzkM/SgI1ebVc5yItUrt05D18+bYzmcivK3s7
 JGh85xtAwwjIHMV5C+YGw/JPr9MMrTtZJkD7Lokha+SLJdVehEAfo55wDQqGIFGa8AqT
 aXTtdQHvSIvkRZBq5CmGBHkJSPf7WGM7UgUsbukejsu6pjmXtmYhYL0LO8iUqUCCP+wW
 TfPn0HaZNpbMCLnWjjS0hdO1nXP1lU4a1cs9X2PLv44DhTlosEWtiM+S77xpUXG/TUoD
 pj4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU69nMvSl01qtK3LobuVTRqPUIeivLjLRpIopXf5vnBeeZcAAW6yTeSK/scoip6dLF6GAJ5yrE4ZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJZHX48OrtmJyH7hqzRQ9MdvEUVvTuDzgVAWtGV3UeJwabF1iL
 v81ELUa7Y4jYy8ZaDZl4iIVSewpquVVzoJQcCeeAvyIFgaOcPss4TkzTwtBzYnRnGj8W49zA4Kn
 svc9Qvh9XH0ATCDBtrcNNhSWqNwKL5PoBTsYiqhNE
X-Gm-Gg: ASbGncuqF41hBmQdTtcb/VwQD/nquDsv7Q+Jlk5bIHuF6qCeKioW4f/bBrzUVMfIvsn
 L5QbpD0P5nQEMJVT0mxKFq0eW3wsVZTK4RQ2Zka/n/c6O3LesfYNDFOQIYS8WnQ3/1G61JBXvra
 mMZtn59yakxUCOwQyKorSXfIKUJogf7mv0bxsVPO7dTtA/brUFYAifAWTHcI+ySmw+Y488K01Lp
 UUwm01enmoR7rJvOh57EyG5CPVq8H4qM03ml5LvlHC1xRE=
X-Google-Smtp-Source: AGHT+IFaotM+JyQ2Vpzm4IHwFj1sDugJTvhpJmHMDtD0C27FQSVnxByFTiRHFKX89CZ7UXKQfqoZ8hHgvXXbgq0byS8=
X-Received: by 2002:a05:600c:4692:b0:456:1a69:94fa with SMTP id
 5b1f17b1804b1-458b69dd831mr67244495e9.13.1754315114601; Mon, 04 Aug 2025
 06:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-3-dakr@kernel.org>
 <aIyGdr8vKV4XE6Io@google.com> <DBQZHIS4VQBN.WSKBML2WYQE@kernel.org>
In-Reply-To: <DBQZHIS4VQBN.WSKBML2WYQE@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 4 Aug 2025 15:44:59 +0200
X-Gm-Features: Ac12FXwUx656MFEW5kmkNucJ1NlP5WVIBqML9iOkHHqR2MZNAaCDmASPCCRrZcU
Message-ID: <CAH5fLgi6W0g1mp6EyR16ayk_JT8pYJUUZbWXc-hyNxSxU_VeNQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: drm: ensure kmalloc() compatible Layout
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 1, 2025 at 11:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Aug 1, 2025 at 11:18 AM CEST, Alice Ryhl wrote:
> > On Thu, Jul 31, 2025 at 05:48:07PM +0200, Danilo Krummrich wrote:
> >> drm::Device is allocated through __drm_dev_alloc() (which uses
> >> kmalloc()) and the driver private data, <T as drm::Driver>::Data, is
> >> initialized in-place.
> >>
> >> Due to the order of fields in drm::Device
> >>
> >>   pub struct Device<T: drm::Driver> {
> >>      dev: Opaque<bindings::drm_device>,
> >>      data: T::Data,
> >>   }
> >
> > I'm not convinced this patch is right.
> >
> > Imagine this scenario: T::Data has size and alignment both equal to 16,
> > and lets say that drm_device has a size that is a multiple of 8 but not
> > 16 such as 72. In that case, you will allocate 72+16=3D88 bytes for
> > Device, but actually the size of Device is 96 because there is 8 bytes
> > of padding between dev and data.
>
> Are you saying that there is an issue with
>
>   (1) the existing implementation with uses mem::size_of::<Self>() or
>
>   (2) the proper one that uses Kmalloc::aligned_layout(Layout::new::<Self=
>())?
>
> I think neither has, because we're not allocating
> size_of::<Opaque<bindings::drm_device>>() + size_of::<T::Data>() as you s=
eem to
> assume above, but size_of::<Device<T>>().

Yes, you're right. I misunderstood how __drm_dev_alloc works.

Alice
