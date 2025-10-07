Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AB7BC1096
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 12:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF0110E185;
	Tue,  7 Oct 2025 10:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WEvSJ2eS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C218E10E185
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 10:42:54 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-28d18e933a9so10462535ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759833774; x=1760438574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t48xr98QD61VaWXPvBpaZ2yaPisBwVUmg9uYlxv8ngk=;
 b=WEvSJ2eSxSMWEij/zUfx3j/+82TVDLsFs2CLHAHws2sqBFy3JOSBvEt6V1Z9DcKnyj
 IwOF2sedKqjABewEqURwmz2YNULgbN3tCkNCrB9Qmzss+6oAhuC9hUnJFS0IsQTkd1Y1
 4yYs1dIiqwWuCNmWO3+kIg3L46K7icJLDJF7c47vwfLkxTkwA4DBKahOcTDPxW1jqD0p
 taw+pGeku7ARWwcpAs3zkOz0PKvaj6tRh3YS/sv1Ixl9X2CyWtvbOSlpsV3jzsHzlr+f
 giM+8bfOFKkv0P+jsuKq/ONdVkTrZd2DTPL9rRAGEUN+loi0ehpij8lb5WijouHGWGqt
 2pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759833774; x=1760438574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t48xr98QD61VaWXPvBpaZ2yaPisBwVUmg9uYlxv8ngk=;
 b=h+if/C4eJtDThX6pukv236HFWnZB92bqV6UJC1aZhNKu7P4OZ7zzvCb/LsKSvySWZk
 IrgPAvfGvypmmQhQZ/LtsJzathr5ihCYAP4gpuQ7VVJ2H5s7+ruHgLUAq49QxPt/m+xT
 UtKNPFEf4eJM08mUHDyyM3GQc7cP7cQj98ydY6FkdA9PzV6vLlLfyvEicwA3qE2dIikr
 k0CvT1xmg2qg1JmBhWm2ZQpGWgoBWsayANWeE3au+IXJKLt8CxLgPUEqiBKexY2cy0N6
 1Fpj4rZ1IFtf9oKx1QXuLvlyZ6TkbkUh7fVtNFgM+q5swQ6eR4cH9RnOyO8u54cTVtGZ
 VRcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwWmp2perIQHZgk96YcKA3aQwvGUrognTe1H1AEvlAafeekwn/fRLEaLn2QeAKXPpJJf0IEOiZECQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzOjt1koYQvMknaEMHOVGWLL+oit2Lo5ZTfDB/xawMKzwmCXdY
 hL2b6xV6DyDHZ9//HxwoYbHt+Vg92x0gvwxOILvrMGj7V2iou6K0cxKpKekypD7yb4JFx89kZqp
 PSdgY9HYN4PCpw2fe67ZD9Y3iUb7BxAs=
X-Gm-Gg: ASbGnctJ8ZHnJgEPFZ/nMFO8fmyxKK8J01NoVqv8z4hI2lWjUAQJ+w4tgepvunWY9/H
 1xWqVUWjTdnPFn5JBSgc3gluv6QMkdG84ZSrFMxowC41tLtW7gHgJv0PRjK0rCaklSBo0E3APRl
 VWpK8r9LP2v5BOFGq4c3vby9Dl7BhxVJ7VrUgbiytZQVHgUgo3rwBhZzDP41/6/cMiKXNvPpBL0
 Q8VQ7PXnNaqfP3MvBQLZehi/X9ihlG+PeERi0YLGhOPKWGetMjaCULIBOMJaTQP+VmPYSmMk2dH
 02Ckm7p4a34hGAJw4DPEuFImZxDIBDX5/HT+D0gAdSgljHpP4A==
X-Google-Smtp-Source: AGHT+IG/tceer4xDFHi1fbtvymQWQEX0cfdjfz7qa3VEV1S1lLa9ROogqCppnvlWvrXrppWg7CAeyI7raGFpenio+L4=
X-Received: by 2002:a17:903:1a68:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-28e9a5a2ea2mr112471585ad.4.1759833774205; Tue, 07 Oct 2025
 03:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
In-Reply-To: <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 12:42:41 +0200
X-Gm-Features: AS18NWDpvGktuowJke8BSxfgUaurFD3miGBpRkLVS9T4zoCecLy6NtllLzWGBNs
Message-ID: <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
To: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 nouveau@lists.freedesktop.org
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

On Tue, Oct 7, 2025 at 12:36=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> We can assume maintainership of this of course, but is there a problem
> if this falls under the core Rust umbrella? As this is a pretty core
> functionality. Miguel and other core folks, WDYT?

I think what Yury may mean is that this should get an explicit
`MAINTAINERS` subentry even if it falls under `rust/kernel/` -- I
agree that is a good idea.

Thanks!

Cheers,
Miguel
