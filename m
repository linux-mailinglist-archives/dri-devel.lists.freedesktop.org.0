Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46276CCB877
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 12:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B338C10ED92;
	Thu, 18 Dec 2025 11:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2+R/q6I8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B7010EDC1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:05:43 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42fbc305552so368234f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 03:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766055942; x=1766660742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h3ZC/RuhXgR3ZPLee6QKXin6sxuebHRmcV4+nyImDTA=;
 b=2+R/q6I87/sO2+nMfxtXaY1tHPPrP9mRRrg72PtEmuXDzQC3TND9K/iYANsDMcE2+c
 ppOoya8ruIHtWjUkGxpQMB9fVOOe7zfJwwJNAbBJMQ9XHCT7hF9WB4AeP6Uz3pNgBvMc
 HxttmXpfX3NbpY1dtt08kFR1rd1KZtVxMNPDqmWiPmj2LO8RUDbH0qgAr7OxFFSYsm2c
 dkokGVGMe5at4OKMID/whAlRfF8xWb5c1uI0kLvZe9BTD5ixqQncd6p9tAwL1WtvB2X/
 5pmzQ0MYEhBUrYzj9Jw5f85xn1SEWYeI1ujsqw8HGfLgovOK9sXxVGqg6TzazlKLmugR
 +9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766055942; x=1766660742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h3ZC/RuhXgR3ZPLee6QKXin6sxuebHRmcV4+nyImDTA=;
 b=WyfhsacfujGFrsx+wDJKZxi8K+KUTX8tyebQ8Cu0Ph8x2gvQ6RAHSLFxN9weC4RsJm
 xjDTO0XxKMbLCyeXipFUnCrKQGJljQWB5vHTJGuSoq47JTQNJl1TmdH10Ibn1o0a24Xn
 /yVjiB1SRdlygH5NzGrYhQX9F98X2dBqunl689zGMd5vRwTwuE1ZrfVzoQC6TyFb7ELO
 8wpK7fGZbJU7IMf/QZdB/KBjtLVOr7kAjCJTAADRwCBCr+vfNkpOaMtdp/IxU35PyZFq
 rdFiEGQg0U23WjzLpBfOyXKQIYI3PyJMUaLm678ELHOYEuiFDzH+2KKuYcFf2pLU96Ry
 RYaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd8jZ63XxtJcLueyDiCJ4K+DgQd8UjwVnyldq+mUfNZeWtXUkz24HUFhXdFGX0XI+jkUIHNud5b2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpp9Q61oUw0fpWkEDc7ust4djvIcb0TD55mpzRmo/LF9trNYud
 +1g1YihrM40nD4sVcssHpSp7dgPcsuuY1kpMEujTH9XdajdXmhR9oH3LR0DQgGuMIr7+qKxxPE+
 QI3zTDc/u+5lL5OTnpBBLpLgg4ZdCHVVjMG+dhVRS
X-Gm-Gg: AY/fxX6W6ISUzpL64jMgKWBtOycPRZdbGc486TdbkvCDJTnOj6qZT+BDRIc+FqUAvt6
 vWyRaRGObry7+3oFXUl5uCcajVdMsVMEWwQoNgV0ccjUlAXtugirn67Jlaa1ZAZAfY3g5NI8mkT
 3aI7y3MHpJWFmPl/nq7gI7jwoShHaU/l7rcr1tcAYzQaNfdvtFKe2m0BvPJ6ObNCUJwPhgzLeKB
 ZzIqOGLOm23jM3KIdSZk34cicVtTDafGkNp8mmhkufG1sH/7ElBPeQ3qH89U0OfhQZuiotTl46V
 cQ/cywEyCGUq+R495VMJ+oPttQ==
X-Google-Smtp-Source: AGHT+IGXVDKrZjp+NvvA5/qC7WPXryh3eP96No0VLbAfD0dfrQ2PK6CbEoMBAf1PoLDqcVLWFCtzxrT0EkYfUfCTixI=
X-Received: by 2002:a05:6000:4009:b0:430:f5dc:d34d with SMTP id
 ffacd0b85a97d-430f5dcd49dmr17076013f8f.52.1766055941437; Thu, 18 Dec 2025
 03:05:41 -0800 (PST)
MIME-Version: 1.0
References: <aTV1KYdcDGvjXHos@redhat.com> <aTV1dc-I5vAw6i0n@redhat.com>
In-Reply-To: <aTV1dc-I5vAw6i0n@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Dec 2025 12:05:29 +0100
X-Gm-Features: AQt7F2onwZDT6I3RNp-8EABXxVlAZANhhJ-GMV1t61Vpqe-l1BJnOF3T8fFh0Lw
Message-ID: <CAH5fLgjWQ2+eG=DV-m-1ybfs_Mu1UM2Zj0z8LvU4BbE0m9NXvA@mail.gmail.com>
Subject: Re: [PATCH 2/7] android/binder: use same_thread_group(proc->tsk,
 current) in binder_mmap()
To: Oleg Nesterov <oleg@redhat.com>
Cc: Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 netdev@vger.kernel.org
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

On Sun, Dec 7, 2025 at 1:40=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> With or without this change the checked condition can be falsely true
> if proc->tsk execs, but this is fine: binder_alloc_mmap_handler() checks
> vma->vm_mm =3D=3D alloc->mm.
>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
