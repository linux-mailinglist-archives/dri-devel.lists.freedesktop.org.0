Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9014C0AD21
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 17:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CE410E2F6;
	Sun, 26 Oct 2025 16:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCjY8R+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BB910E2FF
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 16:11:15 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-28d18e933a9so5136315ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761495075; x=1762099875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQau2nuAPBGeqn7nXR606yrFTjooTnZ5gmJ89ZW511o=;
 b=lCjY8R+tE1vtQQ2xzH6BMxRC10J1SeS4wXL1PBGfTWffhiu5Mr37eO62YowBqF/Yqw
 DtYPhlXuhQYrnJeqMMWzp8+/HK9hB8ew4OHnuXmN3DXVyyqcIvbFClucEKwpePzvLgQu
 7oP2viLZge46XS+VzBMcqPTIHypqQKhZUshbzhuxblH9+bYrnMa0EsrsEGgUcNlRePZB
 lAgwygTJ1374hDNAJjWI7XB0Ijx6z775dCWs6oDcP/B4+/0lnIOMlPWqB2o14+TQgbNJ
 hmTXbLLDxH/Jr3J5nk6ano66xgZ7XCHaRDXhCxhacU2Rfqxv4hauTLl4YUj4vOll8iW2
 sl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761495075; x=1762099875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQau2nuAPBGeqn7nXR606yrFTjooTnZ5gmJ89ZW511o=;
 b=Y9TfCAJs4BNYSFAQzf19eW7HkpLt8qDK74FycMRB8hoSZyYyzJubzGGVdHaxzl4S7s
 +fH8C3atlkUayw3HwFWxzlub/TPGQb5wr1hemOXZdMIeXjCFO+DlK1elRQkeGX4XGFMo
 C2fBKyD2neLAcwWEYQgY7QERMSZHiVRBwoeLLiAdJCbsLwp6Jgq23dtAhixBzfRgQn6c
 xMB1Ps8Ir5d0tCIiFnPG6K8mGYxEwxbjtW2MB1Be9YTDJx3Axgd1bI2BDFddssaGSHeV
 WKxBTMyEzMVHoc5C7mr5aB6pJX1HQZOju7ne3OquUuYFulRjx0a5MFgmJbx0QYizVa0a
 aM9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmajAEawt6PuBseQRd7W3TcC/YhVc4gGGF4GdI7CLzo+6eKVtVYe2SoH0qhuOoQcwFatlKSKtMmvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC5Vy6QBg4MMs/BGjEgGAJ8FR5dJa7VjL7qKIPopEi3g4LItyo
 9qLcZDr9IVSThqiR7LYl0vHBS4lRVg3rH9MjAa10fFZ1e3eT0LQQBqs7ToSj6+DQ8tjKxuB1ybi
 K2L63fQRBO/yTHG/DI14NMcdD0Suikho=
X-Gm-Gg: ASbGncuJte4AL1M2T9sp+edhm4eVCASnR/nGTozfAr/g94r7V+Pqh+raMbu1zu5ngsO
 sRKI9FwbitbUeVhoc37SW6tTAt/kxXR1iN/DpaVRsZNa/DQZzesDUdNOG4khbc/9lv+Vqn9ppA5
 LlXKxoK+jc/vMVtqR/49q2vrkNi73uXeGcjbRqWuvXq+ijyJ4XcNPJC/Y+RS8vF9KWc0FXbbPKd
 Xd2myjYYdzXY7O3d5qOHhwCjODqziuBIg/p7aQCY4qsjrHc3xrJJF9VGqHN0UrmdsFYn+7LC+HD
 FYUEkDo1tOkI2BsJOQmz2K8B2Rj54zlQhuull8ClIzXFd8lk/ZUG63olMg5RUrQM4Seb8w69L2y
 qSNM=
X-Google-Smtp-Source: AGHT+IFI6sg3xeU/Y+7ewS/quTbjQS82OqC83SGue3QsM3IMT+1H7kuNPGEtqVWO3pz2NXoXOmWS4q2L435vkLC65I8=
X-Received: by 2002:a17:903:1a0b:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-292d3e50f14mr137740975ad.2.1761495075335; Sun, 26 Oct 2025
 09:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-7-60c78726462d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Oct 2025 17:11:03 +0100
X-Gm-Features: AWmQ_blYJsh-bUnlNpdDu-je1LAAZ23ehLx8sNiiMWM4JI3qmhDsJ4Jmtvqb2i4
Message-ID: <CANiq72m9ms-OznWQ5+4_JvAs4yruwgBRcm1u0gCAnasqO8uJOA@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpu: nova-core: justify remaining uses of `as`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
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

On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +            // `as u32` is used on purpose since we do want to strip the=
 upper bits, which will be
> +            // written to `NV_PFALCON_FALCON_DMATRFBASE1`.
>              .set_base((dma_start >> 8) as u32)
>              .write(bar, &E::ID);

We are not very consistent on this yet, but I would suggest using `//
CAST:`. We are working on getting `// PANIC:` in Clippy, and we could
get others like this one eventually.

Cheers,
Miguel
