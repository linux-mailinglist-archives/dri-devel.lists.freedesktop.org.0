Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ABFB97F89
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 03:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2807510E211;
	Wed, 24 Sep 2025 01:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EMHxJx/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C763210E211
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 01:09:31 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3635bd94f3eso48684321fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 18:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758676170; x=1759280970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lll/ssUUyzpdCEieMHN7OfODTvGl3B3jSAMJ3V0c2x4=;
 b=EMHxJx/SUV1mJSlN6BXCoh5amhIRd/gOZdSXelrR135P2afS6E0sgOKyWZJd7aKeAi
 m9mwU+PskOQLRf/egaRhgJqeP3EMpJqxoaAE6DtUNJHqFQUJVxJceHlR4eZnjefY3aOi
 vOhgOP0u+PX3OkD4AzE3TqR8Idr8gH9VH6KU496UpwRdTfxGt1pEz4TXbaOzNIhMZnck
 /UUIwUP/TVIX69iNx6l40nw5sI23S41QI7v0mUkjwv82mwgNPa1hZ3dt8y10FATWItNl
 ptN6ALNI6codSGtChRRgOAANySvZK2xniRFhKqgA41n05S/rVOqzg9O87NBYSdbcWx+p
 Y0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758676170; x=1759280970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lll/ssUUyzpdCEieMHN7OfODTvGl3B3jSAMJ3V0c2x4=;
 b=Fd39rbg28Fnxa7ocsRjLXfRMe0IWchW9ByfYOzkju/aJHYJ3/hLhZvbAVi/3ADkSQX
 jjMSvltz/8vKGaNmcN0mUMgzpgZe1O6ZHDcggGm5JdMDfY+Yj4PUtRhaGFX5s+EjiYos
 JWbySmsDWUchCXoaBBZ6puIfe9CqO+L4f0sKvIWEyawkIPSDcp+WQU3dyF19iVqczXiu
 WI06xebHhGWDIVMOjBYO4k+CWszVAVmTyMRkweSXRnqECoECia8PaEco5B3Lsndmet9d
 c4GAOE/nOvnmuaQCyajcMhxHdItKNZEz13zhIVBwLrlnI0hA3n6DDw0Xi3AL7W/obi7s
 dZrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhWB6w3spYu84nZhpji9wAES6HPBJhPZf8FFQyE59NhJYo3zXkIRSDryntQbS9xLSwSxTo1zTYvM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTJo1Mp4jGzeGV9lTipbpNLW8BZr4pUDApVLS/fRtplNbGZMc8
 3FtCqbjzOeBEPn4XdwctHXdQoKKG1PMw4mIaZrEQcPkHCaNYwB+SHa/SQWbBSgPVLxJFyJWHy6g
 BRXpXhm5rhqtPiPqC5q6CQNMx48bYIMI=
X-Gm-Gg: ASbGncuhxrPZcEVMuOP9koeZyzMpnZQ6bjJMbRBq0cilWsiTX0CT3OaakwVozgo2hcB
 bJl3MvWzWGD/LDLIoqCni963bHsTVActQGcBlMDGzyefOlIR4Pyyrrc+KXs6dIcXUUDoU7FxaTs
 RFZ1LVyrK/s9opVI8AmqfFyCdsZ/sm7JafL3fKZ7/6851k39y+zRuEoHNYElURDdEwGE/DX37Of
 0XdHkt4CpzZJJuGm3kYFgJclkjg1Wj4g9TENi3x5ubCq0ZfwBVqVdDre+1fCgneyWF/Xsi1Oz++
 NnueHlLuOvffScXWTniJMA==
X-Google-Smtp-Source: AGHT+IHbXAiH1s8VtlmDbsaNP/syoKVWdCeZZCRV8zDEN53vF6lttuESXWuJKlJaexy/SVsmDvyy4M/m2cASKJkmK3E=
X-Received: by 2002:a05:651c:4088:b0:338:bb4:6d6f with SMTP id
 38308e7fff4ca-36d177d8cf8mr8960551fa.44.1758676169573; Tue, 23 Sep 2025
 18:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
 <20250813-core-cstr-fanout-1-v3-9-a15eca059c51@gmail.com>
 <DC1ZLP61HJAL.3I2YF82Y4T7L9@kernel.org>
In-Reply-To: <DC1ZLP61HJAL.3I2YF82Y4T7L9@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 24 Sep 2025 10:08:53 +0900
X-Gm-Features: AS18NWB5wsxS2a7jxyLos1K4bMIsLFjDF8Ocsoy_wDtXVwMvZmga8KSuS7D7hNE
Message-ID: <CAJ-ks9=9V5Ex-VuSV7Er-jTLHyMCyVWYOiWF7wpYB9V_F=+QQg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] rust: device: use `kernel::{fmt,prelude::fmt!}`
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-fsdevel@vger.kernel.org
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

On Thu, Aug 14, 2025 at 4:54=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Wed Aug 13, 2025 at 5:39 PM CEST, Tamir Duberstein wrote:
> > Reduce coupling to implementation details of the formatting machinery b=
y
> > avoiding direct use for `core`'s formatting traits and macros.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
> > ---
> >  rust/kernel/device/property.rs | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
>
> > @@ -413,9 +414,9 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> =
core::fmt::Result {
> >                  // SAFETY: `fwnode_get_name_prefix` returns null or a
> >                  // valid C string.
> >                  let prefix =3D unsafe { CStr::from_char_ptr(prefix) };
> > -                write!(f, "{prefix}")?;
> > +                fmt::Display::fmt(prefix, f)?;
> >              }
> > -            write!(f, "{}", fwnode.display_name())?;
>
> So we're not able to use `write!` with our `Display` or did you also
> write a `FmtAdapter` wrapper for that? (don't think we need it now, just
> wanted to know if we have this issue possibly in the future)

Correct; we cannot use `write!` with our `Display`.

Apologies for the late reply - I had sent this back in August but was
still being throttled by gmail :(
