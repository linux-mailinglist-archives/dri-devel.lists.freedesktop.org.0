Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F1C84269
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 10:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EEA10E390;
	Tue, 25 Nov 2025 09:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UeA2lhDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1310210E38B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 09:08:51 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-8823dfa84c5so59387966d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 01:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764061730; x=1764666530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCdO90en+FjhKk4ix5gedxAx+9JnP8FYLniKGNGpn2c=;
 b=UeA2lhDrvdiWVxKTAVOJxc+OC5kTBc4YDbg2MMgnZRTrMM9gOP4PEA/Zcu6xSDcN0O
 UQL4ah1CObf7Q9kEOhSCLMaE4Tqvij7tgTWEudttAbomJJOw1v21uCkGuV38LtPbI8ST
 hkBzo/XRftkWyw2nXGvAcImv+BGSEytirKK2h8W1LFtiSZcmZocjo/1doszKUiDtzoE9
 nKP5Msgc/Pm5Po8JY8FZuIFhvEw24YDSCaUx+jL+bvPGaFAMIFtw5NKJl5LofnLW25lZ
 FThWdc7bZHsqA4/DyvBIso1Z3MuUEu88macghUACMWWPOjbEY8banKYtJsKh2j6W8kSf
 X4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764061730; x=1764666530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jCdO90en+FjhKk4ix5gedxAx+9JnP8FYLniKGNGpn2c=;
 b=Yg5kJCAJXaxQFojNFKx6fTyvUKEUDT7ddYC1/ft96qbVGBZbnzPxH4xT5u6BwkRt2/
 DcodkTT2aWsOR4u15lORKTUPtRye969Tp2f0mFxys2yOPl6UQTEM74XJ1VVSoGzKv2PF
 Aw36PevDS1kXHH3v060ZVSHtmJq8D9JQ0XWogOTpysEoEKWwtURlhKjxrAEfxin08+H6
 CLFLsuUR3A5HNk+VE1hj8BUteRBtPrTYtym1T4GEAw9LBCbIH4TOqUaw0HMvaD53KU4h
 l5sPf6I5cItu8hZBsB1dKUKjlwpgAL3Q9lzA3/ovifp/ANWF/qtnhtq7WGRBX8BPP7ev
 uxRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDACbvAXxHuolW7/pHvCCPZsE0vC2njTemkyhjKNpkHm+42OD3gbRmrwgWNoLc09G+vbkw9XRI69s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAI94TQyPKnnT3oBcbdNaAxg83rQStJ3sn0X+6t9ZUDDlCL6yb
 XVZRC0Sh/IH2N5jKmTBOToHY453BDdLsFxu5WIqPerxek1hQIKu8//7YGn3tBqNdQMY3bgAm/HL
 kjPYtvrQBMUCQI0So3sWws8v7+74OUuU=
X-Gm-Gg: ASbGncv6KBUkOVFHTWovMnb6Aqq8Xx+bvJ2xhDQGyk5vrga+Ef/lumRQ7i7ulQyJg7z
 dJtNGk39X2DyP/CoyWXcbbGoMrzXtZpHLkvxes4XhIlL6otHQSIrjPl0sE3TwyNpQNZGEYcdzQM
 4Jn06YpDAFA8xw0U1nCy60eQ/A3RiHpMmR/VuKbkISZINYcUVbSbBnPGq6iX5L0zQEit65lGF3Y
 mzQDCNJZmnYROz3WSPBQZJG9ZR4ekCkBB2rZa1mDC540xyqLAkL6ksMx/0ntdg6kK1nzw==
X-Google-Smtp-Source: AGHT+IGTFbY486YnNQWkoWlEaQzvsvasZFyHoZ9KTpGkdm47RfNT3iuxVdTNRpkeEmLfhER+Qz0gUPpksmHAUXp+rAI=
X-Received: by 2002:a05:620a:4092:b0:8b2:4b6:22e0 with SMTP id
 af79cd13be357-8b33d468064mr1952580085a.60.1764061729682; Tue, 25 Nov 2025
 01:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
 <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
 <dfc50417-66ce-44ce-b607-917d678c5631@nvidia.com>
 <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
In-Reply-To: <9f433dee-7ad9-4d0f-8ac1-e67deb409b70@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 25 Nov 2025 19:08:37 +1000
X-Gm-Features: AWmQ_bm6tlLng_0bNMM-_zVqLKGasd2tHLj_Nv0hY-yBLivUiNyEs9A42o3KV94
Message-ID: <CAPM=9tyN_A3oEyQZCOWaLO1orO6oKX0ZukJHR7cFy12Go+7d=A@mail.gmail.com>
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
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

On Tue, 25 Nov 2025 at 18:11, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 11/25/25 08:59, John Hubbard wrote:
> > On 11/24/25 11:54 PM, Christian K=C3=B6nig wrote:
> >> On 11/25/25 08:49, Dave Airlie wrote:
> >>> On Tue, 25 Nov 2025 at 17:45, Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:
> > ...
> >> My question is why exactly is nova separated into nova-core and nova-d=
rm? That doesn't seem to be necessary in the first place.
> >>
> > The idea is that nova-core allows building up a separate software stack=
 for
> > VFIO, without pulling in any DRM-specific code that a hypervisor (for e=
xample)
> > wouldn't need. That makes for a smaller, more security-auditable set of=
 code
> > for that case.
>
> Well that is the same argument used by some AMD team to maintain a separa=
te out of tree hypervisor for nearly a decade.
>
> Additional to that the same argument has also been used to justify the KF=
D node as alternative API to DRM for compute.
>
> Both cases have proven to be extremely bad ideas.
>
> Background is that except for all the legacy stuff the DRM API is actuall=
y very well thought through and it is actually quite hard to come up with s=
omething similarly well.
>

Well you just answered your own question, why is AMD maintaining GIM
instead of solving this upstream with a split model? the nova-core/drm
split would be perfect for GIM.

kfd was a terrible idea, and we don't intend to offer userspace
multiple APIs with nova, nova-drm will be the primary userspace API
provider. nova-core will not provide userspace API, it will provide an
API to nova-drm and an API to the vgpu driver which will provide it's
own userspace API without graphics or compute, just enough to setup
VFs.

Dave.
