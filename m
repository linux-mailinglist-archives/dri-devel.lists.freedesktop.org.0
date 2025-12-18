Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AE2CCB889
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 12:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F08710EE60;
	Thu, 18 Dec 2025 11:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kGC6N5Nj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971A210EE63
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:06:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso2012025e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 03:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766055989; x=1766660789;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YdmSp98VOpb4w/1T9TrcnGT6vsEQNrGtK2z/qAxMy0I=;
 b=kGC6N5NjuC79ag+Se67nwyJPwl9hM426ltjpUow7XFJysle1ql8fIZ6U3aNUoLw6Bt
 db1PkYnxPEwwhBBVjawt/Mt2kbDGyy43cez3VhFb4H9CMQoGIiTamH0I4W8HB6qg2Wox
 8PMS0VOu77kB0r2Vplr/UAJPU/LiLrbJLCHPoZe4j5D62JZjhh/xPWQ7j+On2AhahV6O
 RqchS5FwfpVjFaAs7/OlM6r5f/ED06L0L2LUB5D8KWXcSZ/zXwkBHARXrw3U5tWhAmu9
 hGDZBDQoPX9kEn7mArWeXOJeUCswXLOMDGJgntdneMcsvUcBY34DPq35QIxO0KKRZKi0
 nAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766055989; x=1766660789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YdmSp98VOpb4w/1T9TrcnGT6vsEQNrGtK2z/qAxMy0I=;
 b=rEt5eR3NVILMq4qRnWuzf8PjF8vilyV4l3aBN+bmxIUy633H/MhLshkwIPiyTNLzFT
 4Y+DidJDUpzTiu5jHDb8dNlFIxXwRE/ilTJbxjrEX/va2e8q8IqPKtFb5GdXvrPZLgij
 tRR673LVDXlLrQYzKYFpPI0u20hS2dlVo8BIHnj+GP9OKgHozvs/grSZVwBEn9hRmvFX
 LOIw0fdhyFeM2V6ONs/QlEXxcpDZh7QLnOpmGP9rPRw67B+iHNd/j08QP8v7N+vzErMg
 VXcMZp25AU3ZeJLeqvsSHzzHjGWY5rPa02Y+WMQDj37G8DinL8af5mYNoxB8rtcDENul
 h3VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxZaLLvi6h/T2zl9hg/HxUD0+ADdpJ+cl/PuosvDsFsWMZYYa4MNujLFQaogs8nT6KRGTtAkqR6j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZpsS46bjGZx9xd1YjSGMjSlZUx323GNy2U0FmXjGVqtqwOk0t
 eTx+S2wKYP3LJmzE/B8ZNvyIwmKxH948RaXpE0RG6lsl8VLztQTVLYGQrtxi6GxOEqpXv7h14oD
 JNbwLzNzHIvQNngN0F0TszcFEvV+cfNulgx0BphCy
X-Gm-Gg: AY/fxX6BQRoWRfdWS+ZyxSYajqIxqfNbUj5vf53483i2/biA4oid2uRNtwcS4JddJ+w
 aMlqWwha7w03Q6KwP2h59jihy3qaX8EP2e8BtDngoL7gORzdIdLE/v/q4GF4CHQB/CZVLh1f00k
 6xCooSe9/lyFuRHi6JjvEtELEK2yqpp1i6znb2EUjNYmNicwpS8NUEDJ2pxmXmLLneDLNR+UIwp
 Myx6MjvDga5/Zgiilj54f9KSzb6M60ySv+Zv2swLdkPXQG4dx5YtLNmLyw5zsZxNmIvqRyxO8QZ
 gLUxrOxdF+B+ARuKqgjmQa401Q==
X-Google-Smtp-Source: AGHT+IHUVbI/1P7zakDM7Wi5UCm2XC9PsUzzgUmoBdz1wcDrZw0JyEjKaERyGFb8Dk6P9ewUvmrPIJy5bf6RJ2inAko=
X-Received: by 2002:a05:6000:2311:b0:431:266:d150 with SMTP id
 ffacd0b85a97d-4310266d59dmr10262959f8f.44.1766055988640; Thu, 18 Dec 2025
 03:06:28 -0800 (PST)
MIME-Version: 1.0
References: <aTV1KYdcDGvjXHos@redhat.com> <aTV1aJVZ8B8_n2LE@redhat.com>
In-Reply-To: <aTV1aJVZ8B8_n2LE@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Dec 2025 12:06:16 +0100
X-Gm-Features: AQt7F2oOZgjISObSjjmOs0kcLH0arkernyhqWoUniY0Q3NRwv2tC-Isq-vwEzQQ
Message-ID: <CAH5fLgiYyfrwvmPyVGYD=sbsyY_2G5Z3mbfNRDa4uC2PS6iQTQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] android/binder: don't abuse current->group_leader
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

On Sun, Dec 7, 2025 at 1:39=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> Cleanup and preparation to simplify the next changes.
>
> - Use current->tgid instead of current->group_leader->pid
>
> - Use the value returned by get_task_struct() to initialize proc->tsk
>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
