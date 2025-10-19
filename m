Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE8BEED28
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 23:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE5A10E227;
	Sun, 19 Oct 2025 21:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iMkpatBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1012510E226
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 21:25:44 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2699ef1b4e3so6332005ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760909143; x=1761513943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
 b=iMkpatBwJjUg/PZC0Yai5724pygxU54RRrpv+TWIJ5B8D2bJgcgghmdWTD6+CJ/YmN
 pfWilqeQ3WvVrAVf+1sBOLBBbcuiucxBnIcO/82LPuKwetgDUQu1gFmTA8fTPcl4Y1mX
 5wvN2exlWtyOfVHtHlTK1A+yHqJRdj+ktLmehk9kKz58r4PHvFZI6zjhV4ImAbUIKHdc
 r7l35Z7oH0UwmqnlO+JrOwLcdhLvhPDyLQoMFEDsuGXKBEvrIOaDXBvYSf3Ci/FyVWhQ
 soxg/P7bRt73BRXLkFgi9T0J/UdLdoG3Co+gVpH8l7KUnXV0m9Ga/mrjZ2i433GxEzQs
 wizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760909143; x=1761513943;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uA5vTOIALbcdwmrJpSZvDL4908AXryA4bzuPW04xPwI=;
 b=HLxYXszYXUpTWtniGk1bh9kPb0ne7/PWt1x1hDGzapkzXVtxKG5lhDIbO3TYzghcvZ
 1cOlDKS7GgO7Zsf5QuZEJ9UCqJ/AH3AmblYY1AtTmDj7tvwQ6yBYnpdwUMeGwZh1Kzvu
 U3ruxxyyAU4cBQB7JDL7Y3OzFrwOgVad5WnEsYMXSqhWwiVqvEpHDTSA/iBpzoMHCyfP
 vLorz+saHJIwRZjObVQ17kPvyo4nkCRvG5zPVlg/4m1rk+qMrAh9pUgiNiWyxdG96bul
 pMZ1ks33Ghk7TjVBwtFTWh/8VOwUKhA1L/gTxWfZGfuiNHIiZFsXnjKLs7gBTyjAZRzf
 CnJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcTg1+FALZH4RNQhgmTbu0wA7pXUBOHdBeCCp+uUJ1RR+buf8teEjRDyMlr8PpDQNBw3xyOyXuJ3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBXbDndcJhxqENd9boQ+HcOS6kCU1jpWX+BT1KaPoNSHzXk9DC
 yirxBQ15mOlpsRhl2hwE2aP6yINuV+DP6OuqT642LIrME7HohGyAtdXQw8Wx/+ZfAQMkEkCA/b8
 zXvLQ+w/rDIo6GQw2RXs5we2cxLuS7Ek=
X-Gm-Gg: ASbGncvsqUtcZHWzxfdYuGsHKkqSK6cFc9LfYeM4cLEI4CAgc5n7YHuFkPEwhxyGw5J
 ixiWYa7aBwtN/okAWk0PLXj+dXYzvUU/Md7w+LCk8NHxNMSo2ncaIZYwGb8fUt2BuSDeAbIJWqQ
 a//Itjhb5vlqIhGlY+djWyjQSMw9AEINYQISWGcM1c8qqEuQAux2Pdu099d9VKrYXcyI6vsB5JA
 9F25Sia4imxcI588hvanYfplUUKnucbn2LmjcDQ3TkUxrUH3TRfdHtfzWCdsmolxVtltC1ZZRbM
 sQtcgzmKJO7xSv7Hy0M05b5GGN0jAk9DalBlgXAKb+nud5liuo3SnhSjxEJDVgYhHmFrfGrEIhF
 9pPe5ekGWU7RksA==
X-Google-Smtp-Source: AGHT+IG+Xq8GXKfGoMwbFFQSVjc1IKmL7pMM4P5v7DRrKR2eAYMxLjwbrDpo8D26g74EqZuNpH1jVIwhs5ozgrDthtg=
X-Received: by 2002:a17:903:3d0f:b0:274:944f:9d84 with SMTP id
 d9443c01a7336-290ccaccc47mr70983905ad.11.1760909143546; Sun, 19 Oct 2025
 14:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
 <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-12-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:28 +0200
X-Gm-Features: AS18NWD0bEVrj3eqcMBbtrKdDrdonGG9WGD9YJjG46fNVzfrXtIBr4GqiIVIqEs
Message-ID: <CANiq72=c3Zs+mecvDVJ=cyeinzezhGz7yqC9r6FG=Q4HAdb98Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 12/16] rust: configfs: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
 Tamir Duberstein <tamird@gmail.com>
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

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Andreas et al.: I will apply this since it would be nice to try to get
the flag day patch in this series finally done -- please shout if you
have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
