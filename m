Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A334B0CC15
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A5110E3C3;
	Mon, 21 Jul 2025 20:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZeg7pbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874CE10E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 20:49:33 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-313336f8438so807574a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 13:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753130973; x=1753735773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jm4/f5kXKS+Wl1CcII+41ZXoz6y4+E758tZ9swKVMQI=;
 b=BZeg7pbgY9AZ3YsYfkBNLFXCa2DxMrgneu/tETzh1WlJWs1rKkWLl0gz5ekJX/Xmpq
 3yZhzl4d91mxoX82GfYP8wgL9HRi70DGKcNsW36Lt5ZKZKdFvQNlVvbLg5bs/11gdVj9
 iBUgHWpkrtqsKOgn++4iuFCxPN4gGX3T2/mt8CyLTHu7fPcWUj6ATsm7wFvenfKHkVrl
 ECW23AWvy3SEhm7n+EPz/GNBpSwLzmYxR56Qbj8gXZ+18W0VMsotghu9sPZ2eH0VGF0o
 dF25AeB2UML5gZckshJE3cdJkCITEOrZjDmlcQZ0tPaYWh0Pnd2v3DX+XDx6uNVr3I0F
 VVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753130973; x=1753735773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jm4/f5kXKS+Wl1CcII+41ZXoz6y4+E758tZ9swKVMQI=;
 b=RjP+rtLfWYP2Jqs/v++92eLBGf7kVujCbQS4/hPeB8iiSnX5ZEHBrjpirgmGVe2HUA
 xF4mf2ZQIXYA4ewjXUV3fhk/47Ah2djqK5vTPQOuLiI/BVXtS5ZSvbwDQy+t8mew94ri
 00AyQBRXlD1NSwnsgDGwFsaKzQIOzEr4pKCPp35JiGkmVN3uk0iVTAFQigtqgM+giCeL
 P0eJYfyGCxGuINX/v7ZahfvgoinSY3N/gjSAJNMHJFimJue4nwNY+vcajBjcRJJgbz6I
 vlYPR5uZPvSIKXXOdqN2+C+p3sNm+JdNsv7Kq57yFqvYBMmMcrenU3IJkTJAt1/d3ARD
 +afA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD+0iG99mR7cU+IvoJeRIVqI/VqJvrExxt1GCXRYWUGtgQzLWjdjCKfrITTtgCvEhD8DhKxEj6/TY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwZqYUz1Q8erS08KIeDTBalupJiFgydH79zAFK8kKZWm0bawm8
 iliSJk4WnGVo6tqYvXDNjmsuR87S8fm13Pm04Dn/hP8m9d00LSRK85TJ4kFPQkuLUY8fwM4zF40
 dIkh5aUUEYsqDSl4wBPeYvOLHAoUsgTY=
X-Gm-Gg: ASbGncvNPvUzj7m549QUKi7w2UROvBs7syV7a2d91UGvb2/gdyhUh3tR+F9rZ42sKgy
 mRk+hLUd+eIdw2D2/LAALOEHRsoHIHhTLQPUGUOz+v+i7onqHezq3VZRq/UnG5DdFdu3Xk8SdVV
 ryeQg/nfAau0pg0q9dbWUg/aB5JKkzsDcGKRSse5SCnMdK16lR0u45RicV4sFchy1AC0U85TEs/
 iRV1SD9
X-Google-Smtp-Source: AGHT+IGyu0ZkPugEWXzEljdlyIx6mfONy+WiSMjlOMcnsFBAw2hx+lOle+FP3aaXLnvDiZ06RuT2JKWt9T9VrBBHr2E=
X-Received: by 2002:a17:90a:da8d:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-31c9e75ef95mr11696365a91.3.1753130972963; Mon, 21 Jul 2025
 13:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
 <CANiq72mRWuQRFaouOSazi3GTXoHFaeVpyNMZcP0Lkymb+aXrqA@mail.gmail.com>
 <CAJ-ks9ne+YFezFvQ8nZH2UTjwqb3+3JtG0ztqecN-A46tC5SSw@mail.gmail.com>
In-Reply-To: <CAJ-ks9ne+YFezFvQ8nZH2UTjwqb3+3JtG0ztqecN-A46tC5SSw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 22:49:19 +0200
X-Gm-Features: Ac12FXxJIljI0Qgyxggn4RfqwM5u2m4U83LSCHwh8qf8prqbA__S0tFkUzwI8nA
Message-ID: <CANiq72nWsKd1DA=3O_XNYipw0PQ5iOX0gDyqYdGzMqTDZAdukg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] rust: use `core::ffi::CStr` method names
To: Tamir Duberstein <tamird@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
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

On Mon, Jul 21, 2025 at 10:31=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Yes, please do. I did indeed use b4 - and Alice also let me know that
> this was not correct. Sorry about that! Same is true for 2a, I'll
> reply to that email as well.

Sounds good, thanks for confirming!

> I believe it was for everything, as he didn't specify otherwise.

Sometimes maintainers may mean it only for the things they actually
maintain, especially for big series where it may be obvious -- in
Greg's case, it is harder to assess since the series is small and he
is a top maintainer anyway.

Cheers,
Miguel
