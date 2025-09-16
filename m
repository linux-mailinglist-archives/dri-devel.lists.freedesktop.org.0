Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE7B5921C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034D510E760;
	Tue, 16 Sep 2025 09:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D5R2WNfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492EB10E760
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:25:52 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-267dbd4e189so557405ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758014752; x=1758619552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=prkrcgQgpwPbi8Cfds13n7nM9MiR8JPZLk8prSDLM2M=;
 b=D5R2WNfV1mqbSIjN3DZ5u+DYaKIO88U1LwpiIgX+eJ3ESdcoLfTCBvpPVTbI1YkKDn
 6vc7Q+43DjwwVLxmIdqnI9p4DorgCLpAalKv/Gk0zF139eNT3C5+zhZ1RUGA+KjJ4iqQ
 Z1JABGY2dpux4JsYOhK8dzJH8KN8C/F8qfh8/OsT2wl4Qy6K+qbmsVWGDZyJWYV75pL+
 6B65PYtpjNH/Li35SLFNhztlHN7S0z0wFO9+uPpdD1zbkGbLHg40rXRDL4a9IzT0hz+g
 125qbDydq0D3Ac2UEukR4gdD2a5Qh3bU6ysTxgtwXOshFFNRQzKFw8/d1hcf3CpMAQYw
 0eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758014752; x=1758619552;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=prkrcgQgpwPbi8Cfds13n7nM9MiR8JPZLk8prSDLM2M=;
 b=wBrEPBFgIY1+j5MXPEh5kwVbk1SdTP2Zzuw27bGAxxs48FQcttR4w7JA1aXVYn2SBP
 qLcXNI9Y/7R/CV/ajULxw3bQiw7ctAEQ3gZ/70pKk7REfZd5x00/gleJrOiQAM3L4LrZ
 gW2d6sUburxUko+r7d0JEBskGnf14qb6AjAAqIbm84MMd/iaZAyABMyzeoQhFuj2/owl
 IJVx12Z0pfnqBM9Yj2X6S4ND5VsJS5EcQQuE2Urp/KGzZlukLnmznrveuPLs9VkZVF+/
 bCaHcm+dS6frjFTehU7O0rjmzWA1q+svkf0fLXlUwA9h0D+l8i0KAYoL/6lM5j+6w4u0
 k6QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiiNGwT0r1jC9UluHJBAf35mTNqm2W6radzR5gtEs/CIWt+pMT1ZmelyQhdgeL8Tm2z+ZgCtmIYQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcJuDz+DagKCAPoLN1/H73Oz8g9uBALVA+hBY4NT+F+ADsNJNe
 02xwoHffUKHZlYLqQx7rG3/bVvEJeRhcQeHRppWzWd+B7TtyW5VdomTLfFZLztrk8D4jhBbBvp1
 TKUIkdRPz6KShk0BVxGSthI6jqJqY6Bw=
X-Gm-Gg: ASbGncv4CMI9qttvVDdEb+49zqJuJ93xELzVieh+GLF+KMw7N8kYtw50gJEc5ez3e5U
 S5R1Ae6jVmg/8AGN5XUQPiDzkPbePdeZrkdgW5UbstDxW+vVKrnNdoEgPKrQUWwZsIibUwiyNk9
 xaZYzzJiULaa8neqeOXY4gcYy/v8a4zDWm46rZaakjUFc8X89t3paAjDRh2S0zesCQSDgrqJMll
 +m0OmjseOUsVvFAMG2k48YJIS3A2gqnLQsXDBRlK999umZHLMgcZZ/dKEGmegXKFtC8rZOULNpO
 Hm9mPtQ0Frulr+v/E9PNlK9N+w==
X-Google-Smtp-Source: AGHT+IFwc6Y1OseNifdIO5J0qDFbM+aOcV8Z7xSmon/0tVZxaKw/+AP4a1wI7bqiW8muI5j5MuELqcXm9FvbGpAicyA=
X-Received: by 2002:a17:902:e5c8:b0:264:9287:3fc3 with SMTP id
 d9443c01a7336-2649287431dmr60170295ad.2.1758014751666; Tue, 16 Sep 2025
 02:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 11:25:39 +0200
X-Gm-Features: AS18NWCYvwyg0oQ7WKMGNn77retnSNUsfiN0nCmq9Ts2BvgM8ip_kHMckevDcv8
Message-ID: <CANiq72kq4RWNO1pJtJuG8jBpARq5ft6pcn8dHuUWJx=nosweyQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] rust: use `core::ffi::CStr` method names
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
 Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
 Len Brown <lenb@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
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

On Wed, Aug 13, 2025 at 5:42=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This is series 2b/5 of the migration to `core::ffi::CStr`[0].
> 20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com.
>
> This series depends on the prior series[0] and is intended to go through
> the rust tree to reduce the number of release cycles required to
> complete the work.
>
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the other series must go).
>
> [0] https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

If any maintainer has a problem with this, please shout.

Cheers,
Miguel
