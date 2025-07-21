Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064FBB0CBD5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14D010E3BF;
	Mon, 21 Jul 2025 20:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l0wR5rLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5405F10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 20:31:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-555163cd09aso3869020e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 13:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753129911; x=1753734711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5A9KOanO+cfCnC2DzKbBgwUK1XEgUVRRT2guId11mE=;
 b=l0wR5rLUSkvrt5UIzK2454ohaTC5hLIT1ddHkvw7x1c/bxOWoq77UKM68wrWCzrIV5
 8BxGhSLLzbgO3r4dfpPeODgxdR5dQ7E9Ck91cT3vy6b79TcK1jX2WC2fHw5LoTal8jh2
 HAorKOZsUDTXt3DWh5W1ldioU0exv22p+1Oi6WqUljCj1xf+iuNcPVfasW0gB1Oc5Vcy
 yMkDnsusWMRjvK4ulAqbeclxaKHswhSeKttWX3qcozfpXIdIEc3Cf3bbe5hoJsYfUdaM
 XTRHW2BaKiCMEM0AMOHE0wvKSyDHY24VXxyLBkN5baMNcjgW14+750F3hEFXMsdY/gN3
 xeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753129911; x=1753734711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5A9KOanO+cfCnC2DzKbBgwUK1XEgUVRRT2guId11mE=;
 b=FHR6AqBuzO6H0hAJFYKKj4IchqrSp1de5zi8eFrQYH200xH5Y0Ugio1+PtMamCCDJe
 QAiiItUpeVAs3C95BHl2UqoJ+CumUb+eFKwCH4jKks6dyec6GMOXjeUAWdy5qsE+JCYw
 DWMm+0dCaCKRxzmwipVREzt/WZ7Hjz0XaF+IXH33kdlhqHp/JwSetv2Jx9nAhLN73nI2
 uUjIllh6KE8vZIXxY2TnJMiKFfgdwNu/2oSY49Sajq1qmRRYRZ1EAXMYCDUIfn7miQGv
 6U2lLhBfUom5MwzfvaVFaJD41kSvT5XKxwWgo4wUQAX4d1xqFexi0d6ZVmULbPF08kRs
 osyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7PMAo5Ij764rzb0zGKLuR3HTEgW844l24c/DQ7Cf3fS5GmWc8IfGuLVxQuA3ZjyfBKlASHJGzERU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM2xED6+AHIFmDAYh+pcbZ9+Jv8YZwllK3xwHX0NT4tT0G2+5F
 QqC4FcFvVQf3L1cd7KrO9t7EAL9jK1XtfT4u6K35DiSLeX5S1lAYLzF/nZ2XHr9yd8NnMVHDxwO
 5wsZSAYIl8u4+S+C55bv9XR6hcCRe4NQ=
X-Gm-Gg: ASbGnctkyQwOQJtEQM+gkhTlOR4KNselQ8seVqsMyNMq8oZdorlSp+DxcBi6YntWQV9
 QfHZi5BOjUK7Pg/GNtIGg3YlA1TMo5+WanpZRhzVd46vaYBpae2sX2g6xY4VujStN55L9LQaLZj
 6h0LQE28G+faHae0vFlgS0v5omWzXHCeQTWeumF9UiYMUdy4x2YgtQJbWaf0BqGDxSBYKW7CmWZ
 UDiK3OfS1PJZQ2MNaY=
X-Google-Smtp-Source: AGHT+IFR2lRHIzOwJj3JIlIo6gx45Mp51Ht2b7RDYiFrG52gvnrp+p/uZ3Tj+777Jg5nVJOtwaPjIzJjlMYwrAVYkHM=
X-Received: by 2002:a05:6512:398d:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-55a29729104mr5367527e87.50.1753129911239; Mon, 21 Jul 2025
 13:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
 <CANiq72mRWuQRFaouOSazi3GTXoHFaeVpyNMZcP0Lkymb+aXrqA@mail.gmail.com>
In-Reply-To: <CANiq72mRWuQRFaouOSazi3GTXoHFaeVpyNMZcP0Lkymb+aXrqA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 21 Jul 2025 16:31:15 -0400
X-Gm-Features: Ac12FXwThiyNWkPFtuHHqyDRKx2RF3BqA4YU0Qjx3AoUK2MCPhmxxwTXBXJI9Qc
Message-ID: <CAJ-ks9ne+YFezFvQ8nZH2UTjwqb3+3JtG0ztqecN-A46tC5SSw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] rust: use `core::ffi::CStr` method names
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Mon, Jul 21, 2025 at 4:20=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jul 20, 2025 at 12:42=E2=80=AFAM Tamir Duberstein <tamird@gmail.c=
om> wrote:
> >
> > Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> > can be taken through Miguel's tree (where the other series must go).
>
> Did you apply this with `b4`? I think you picked Danilo's Acked-by,
> which was for a subset, for other patches too. I can remove it when I
> apply it.

Yes, please do. I did indeed use b4 - and Alice also let me know that
this was not correct. Sorry about that! Same is true for 2a, I'll
reply to that email as well.

> (Greg's Acked-by may also have been just for his bits back in the
> previous series, but in his case he didn't say anything explicitly)

I believe it was for everything, as he didn't specify otherwise.
