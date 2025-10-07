Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E581FBC20D1
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE9E10E6E1;
	Tue,  7 Oct 2025 16:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CHGR4XKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E7810E6E1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:12:20 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b6319dc3fc1so50446a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759853540; x=1760458340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5E7iWUmZ2vIjSTqtzT1C1NtPApyBCh7aJPO7S699wwM=;
 b=CHGR4XKyAuhKXhgngWTLtRQhUQaMf3rm/8JD+SZ95duuwGhcosnlouIgAq194mV0Y0
 q2swAiVcVD7Rq5vzHaJOpIGaenHKiSkng+BP60rw9FJZ47ikzBTot1pc1HRJG51TIrnm
 JurFTPpZ/run7+bNOREIY6R2aW4mnkzubNVH2khduwrmgyP6pWjkFf3mhIfyF50ETmc5
 u0YuSxICtHYAu4s1gAuaLJNbhC8nI5/T8eZSm65qPo40UqZz4ooW71rbDOGH2RhoTGrK
 9QflvJUrM1jGQnPthgAl/UHK0nUURh5drSmwU9R5Z7C22x8RKz13EMNPVTG0PLxZjtId
 gRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759853540; x=1760458340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5E7iWUmZ2vIjSTqtzT1C1NtPApyBCh7aJPO7S699wwM=;
 b=Sxl7viNFkNZ2bhLUNKI0OFmJmt7tfgCPu9Y6A9N3vhJbNaDgrfcoYnaVG3cN+HkpJ5
 aU5WcklewLafQiRpT1LIartj8w2/LnSXb6II9DATQQWkOMab8vqHtPBqzrAnQrSBYSFO
 U9GMeBG1cPEphyfAbnjqNbk4puhItthXPXLSPzi+Ogg+WPzJ5gpRSS6nEJjy6ItpYbzg
 8RjL5JS0UiImtesl5BGzhH/IeBxDbXZ3wOkV7443huXzrspxCAQDfwnMuRCpuRG+tIEY
 xFz7QE67ZE5gExxqL/WFzSGLqOlu6xeMRu/udBnOER8WHL84hl/25XwQrWgKVW/tXJ5Y
 VRFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViZO9/F3rusOOuMtzFAm6MJ+S5LxWGZgwKCGh2wo4yKmoTd/mxMYPNNmS1v6m2ehJ9mAVrfDxfOLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1nU2QdLnGicHLSGr9bHTehMuBq8O6R+ZF1rcAT5NDVtNqDi/N
 Kt7botwCYgxtNCxEw465CkVpqeTipJjTHgnw1suHP6W+rMA0pytn8gvF0S6uifTDaJfVNEv96wI
 bfQ/RRp4nNxWXZVJIQybw3rwghw7bjEg=
X-Gm-Gg: ASbGncuUER+DyyEfT+MDYffoRveb7k+J4Ey74+WedeqpDwPv6Xr7Vq68m4OJ2zXw0rL
 34I1mwx/nHONTAqV9RqMOoR7lp6AmhheAXks+s6H9QS7QxJ60r2mGr0Il/yDlxvmBXV9ItZ/0PM
 ybOheyFAMlyuNzQxzJxaPNg7m1O23GWsSwDjuml0r9g3Rv0dXHfFipYjNm6v1rUfKsvrlpk6jxy
 qjFid+XTYToH2GjBoBY+C74DnfS5QRl2uE1aZcwuyyncLSoNZNuIomykX2gFB1h2NQD5OBHwt1a
 TtvjCvQE1VgBjr11XOR6Hjm+R+JyNf3bWPZ5kzORpUgUvo9ihA==
X-Google-Smtp-Source: AGHT+IFCzHpcrXLGR1ie60smXpk8UuckeKOb000I2PbnwCKR7UoPdsv6hdVQqjL0vFW9FH9QZdEfImMvB9toz+HjmvQ=
X-Received: by 2002:a17:903:1a68:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-2902733fb0dmr2059795ad.11.1759853540296; Tue, 07 Oct 2025
 09:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
 <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
In-Reply-To: <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Oct 2025 18:12:07 +0200
X-Gm-Features: AS18NWAPdykPHVe-VPSk9QmwsEQUF86AhW888gSoYNbxgNmy_9MCu-o1i7ygLqA
Message-ID: <CANiq72kykzwdv2fOmRMeJ_FPztkkU2a=PFDH1fo9+XbGAeKsaQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
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

On Tue, Oct 7, 2025 at 3:21=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Ack - how do you expect things to work in terms of code flow? Do we need
> to have a dedicated tree and send you pull requests? If so, should we
> host it under the Rust-for-Linux Github org?

In general, if there is a better tree (i.e. an existing C subsystem),
then what we always do is ask those maintainers first.

But, otherwise, if there is no good choice because it is something too
generic/core, then yes, what you propose would be ideal (and it should
be easy since you are already maintainers of other trees etc.).

If the amount of patches ends up being very low, we can skip the tree
and I can take the patches, but PRs are simpler and scale better for
me.

Thanks!

Cheers,
Miguel
