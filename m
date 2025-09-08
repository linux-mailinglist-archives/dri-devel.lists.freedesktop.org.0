Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE70B49876
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 20:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722710E5AA;
	Mon,  8 Sep 2025 18:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lKO13Unw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC2910E5AA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 18:39:34 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-24ca270d700so11893515ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757356773; x=1757961573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlDl0GYAKs0fuixMm4wXNiDo8gjd2eKeGozda9fduYU=;
 b=lKO13Unwhm2LxNSlywD+AOaPHJEhg40JAgpS5SXrmN1QG0YXmcYnx6S3Hd1jJuweoi
 sYyTyikN44YeG295uh2vquIAj4/kZbqyEJ8DoVdGQyWbKv1YIcRE3R55meOaQUn6LZ9N
 8pBhqYu5djUJF7Bma87HrPVeMj03j9MPFj/AnbSu1XYj7ToIv0q1Tatk8VAECccstRYl
 Wy5yDWoI+jyk5JNT5+DozD1HZhzJ5YfoiI01+kEqGA+7USWuKKawm7bGbqTfZcewmdhB
 WjssFtlE8zBedVWMQMVUhDTNRcleSuvvts8+tHKFdGdQ3+H9BqkcUveGCHAPYRdWsJ7x
 nxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757356773; x=1757961573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlDl0GYAKs0fuixMm4wXNiDo8gjd2eKeGozda9fduYU=;
 b=ECMrWHXE1ES1modQgFwZ7KuxDzJlY9vRF03b4z5ZbQgcscncTeQEBIwtsV3OwSlI9v
 6pj7WvBa+LIIN6dawt3xreNgcph+B+Anv8PiXdgsrq5otQz/SPDWOFVIDXrtwdGt1Y5E
 ULiDXtP5hktA1Za+6pJLmBPhrUJdnQNsflc3/MtYlIKdqOwI2dlaBnZUS9643pOgBVCz
 bhzAJ05ZgUCXmKOmgQmT0F9UrNw+m6WFmDc4rEaYytpAWbFJ6NC2GSLS3di/PVv9AIuU
 urVt2dUEh3sdq9TVWOJ6a7oNOnb1Me06F+LD8Gdrr+XgfUWlefG5EZ/CvAwHy4DTNTd7
 S1fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVu8LHLC6EB8LlHeWbhV3doM2Wn93gNvYi+D0ud7EVY79lBuyYjkdESe897G7hgj/dVQP6Fr2dslW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhrhVX3GYRZTFBwgqdy338Tn9UtlPSxZrj/qNWBp2LAmb2tgF0
 KeRRkeA+IqnZ/paH8dJ1jQ05C6I5pAaJl1C8WjRq8QIcrLNRWhF/jOLX2kNuQbe2gI6Bzo8SSxv
 fljTQ4Smxfa9OMUYWFKF0CkSjtHdEJ/Y=
X-Gm-Gg: ASbGncsaR5RkdI3GMwFVgE6hOLF+mMWOL34uxQcUWLmNqJ+/glgH/ZoJ2eSPppQuZU/
 gdHGmBrUH4dtDBDsRIut9rdfvDxzvS9Mea5InF0NCWmohuyRTqyqqTMh7wirg6pjELKyAmMW8Y9
 5EhcFMB1IX7J3hlE2EsUee6y+WQ3d5+cF/8arrSZg+SH6VtizGXFGi8UbFYC9QHD2XnD4j0O6Pe
 IAxA+u735HhE+KJRGQAgQ2mZAAczsupDKAcH5gIYODWui4meGjFPOzQ4eN2luUs3Upk7TBIhSlk
 sedx2OlGDIqSGQISs9XkGHqZ38VP2vJekC4y
X-Google-Smtp-Source: AGHT+IH29cFvlel6V8ScTGbGDxPZ7K0P7UvZ0rL/JFEyC2Ho11m+AZ7lO/QBBk0RySgAp1Ke1kTHpxcO0Uo0l31ICC0=
X-Received: by 2002:a17:902:cec3:b0:24c:7bc8:a51c with SMTP id
 d9443c01a7336-25172e31d9cmr69938435ad.9.1757356773568; Mon, 08 Sep 2025
 11:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
 <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
 <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
In-Reply-To: <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 20:39:19 +0200
X-Gm-Features: AS18NWA9wdmUAfNEz9N39DTUDKozBSdy8jPLQYkAjRGgYpyBnhyvWqsDm-DJFzA
Message-ID: <CANiq72=S-HnREWAK+8kcJkPabPHSzuKD4k7251+Zw-b9==0-zA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Sep 8, 2025 at 7:06=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> The issue I ran into is, without adding it to prelude, the users of regis=
ter!
> macro will have to import both bitfield! and register! macros explictly, =
even
> though they're only using register!. I tried to make it work without addi=
ng to
> prelude, but couldn't:
>
>   use kernel::{bitfield, register};
>
> Also not adding it to prelude, means register! macro has to invoke bitfie=
ld with
> $crate prefixed  ($crate::bitfield).

I am not sure I follow -- macros should use qualified paths in general
so that they assume as little as possible from the calling
environment.

It should work without the prelude -- what didn't work?

Thanks!

Cheers,
Miguel
