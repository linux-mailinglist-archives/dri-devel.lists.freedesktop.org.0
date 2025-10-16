Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8534CBE5364
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB78F10E0B4;
	Thu, 16 Oct 2025 19:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ULZaOTcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A83410E0B4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 19:19:06 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-27eca7297a7so1574445ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760642346; x=1761247146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkNb2DeKO+13qtb+PBXoKP6RFeVYVbqfpbvDK5KSaF0=;
 b=ULZaOTcXb2h1JC7Bl7LMad0whuqjedwsD6TdJjIQ6E1YJxLqx7JFnWu64tg5368A+7
 rpeojB8hGpjxareQ9tTlQ2Ov1y+SadNpYHg97us1Vs4Hb2z6QkpIo1HFymyxBw1ELhrv
 aKY9ciYPERyiSkW1iYN6weZLC8RtohxTHmkWTKGpJR715jaXdvd/q2SRo5stCcvl2t0y
 yEK4qfTJ8+4GdXcFfkC53yiKnPUzmW/8WHutx1c6M+9Z52nP0GGtmtfn+sO03uvQzmSB
 TBiQoZMr9Y4UhyWPmViGOc60Ci/SxVINIS8m9siDxwXh37OrswD3qsmEdDx93wbiIuak
 vv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760642346; x=1761247146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkNb2DeKO+13qtb+PBXoKP6RFeVYVbqfpbvDK5KSaF0=;
 b=qX72EOp5oeXIJeKXs6lK5hQbT5qO3uR22DLjHjTcWd91FGE3kf2s/KNsp/CAUJF+Oa
 uP1GCeLZYK4eMTB2QMmyRFi+Z4lWnFMH+P8ssU5zXdhZjUzxLdiFvDR2qJVvIod9UBWD
 vdbYn4QFdDgw4zFbRI0/EeKvw5ohZiH/xCfl8kS9AhdWjoQzxndMAPaR5Rmc7KCOUcYA
 5N2TwQeLBAH8jDiaiwIr52llaSa5HtUBHKgOX9P12jMnATkMTR8z4FY8fMLz6BaaeBBg
 QiWoKqyxuyP5deZ8mdhjIakn6tgWxib1rCTeCab0QUhDUfc+6SHES3DlG1398QXBWBd5
 xIVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3KEFA8MgBGD2HuhhsTIEBRBwiCHFbXga/Zqy6rtLrt/Yja/pFkEY8DE87L7FBCNnsow8vZoVHQf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzhTWxnzefqnsHm+4gUXlfmX+58c2R3ZzOKKehlBFBUoAvfdCD
 jeTx60UivAFPZC2h65wse3UnlY8kMDYxyfawAUfJPB5ljKLsiplkdg+l3G7U1WlwIg0WUE+J33D
 +wBbi7KUUVMMevkLjVMN/mA0a8OFTmgY=
X-Gm-Gg: ASbGncurs1ptp9fu52CaVSdTg+wDYmnuz2vdqfiNpWaAXDjq459BjyLafMWpiZpPm9D
 U9fkkdG9m3Ij+oQXvoXs+JRzeS+jJkd64GZaHwJo5CuRyBNAQEYDhqjkCKDJEqE11sTDGVY8Bhu
 hPZfOJ74b7hyfEk8i4p7dna1MYc0OsKzfv44l4k9+OisOGZNa/SPYrxaItlhdbuRaHdGp3qhBn4
 UXiKVvnBRHWq5VsX3KQ09clt+mxe+uFmuh+Un+BRFBCsExJQ2NJjMJZ1hB6d35TrIJwhKVHCqse
 TVkLpLxImOmR2l/nhoqPjjoEvBDgBs67FsD0rYi6P5QTHhNm8XsHUFyCT1E/oIp7FO0UtjKkfHt
 IReM=
X-Google-Smtp-Source: AGHT+IH0YWgGKSo65cgBPX5W3p7j4HkK3bVU7l78fZ+js9jI7tU4OLEp6GPUbGx58mDOvsKGfrW9fh+1rWFnGpM/2VM=
X-Received: by 2002:a17:902:e950:b0:290:7634:6d7e with SMTP id
 d9443c01a7336-290cc4ea8f2mr6194375ad.11.1760642345509; Thu, 16 Oct 2025
 12:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-5-apopple@nvidia.com>
 <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
In-Reply-To: <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 21:18:52 +0200
X-Gm-Features: AS18NWCOXO5Nlj8i8ZNj-U23NNA7RJ1ucE47naAt3VXCGXJAjL5KZrU7UJiyBhk
Message-ID: <CANiq72kpgPT8=-UPj8Bez_ui=MTVauCPg7CabDau=jxOB8qdow@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
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

On Thu, Oct 16, 2025 at 8:23=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> >
> > +/// # Example:
> > +///
> > +/// ```
> > +/// let mut buf1 =3D [0u8; 5];
> > +/// let mut buf2 =3D [0u8; 5];
> > +/// let mut sbuffer =3D SBufferIter::new_writer([&buf1, &buf2]);
> > +///
> > +/// let data =3D b"hello";
> > +/// let result =3D sbuffer.write_all(data);
> > +/// ```
>
> This example doesn't build - there are several things wrong with it. It
> is also missing statements to confirm and show the expected result. Here
> is a fixed and slightly improved version:

Yeah, I mentioned this one in a previous version -- the section header
is also still wrong too.

Alistair, please check the link I gave:

    https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

or other code in the `kernel` crate for examples on how it is usually done.

It is not critical today, of course, but the further it is from what
will be needed in a few months, the harder it will become to start
building the docs and running the examples as KUnit tests.

Thanks!

Cheers,
Miguel
