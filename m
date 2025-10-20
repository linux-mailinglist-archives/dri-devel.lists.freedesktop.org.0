Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A87BF3C14
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEBE10E528;
	Mon, 20 Oct 2025 21:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g8u/TRCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8581610E529
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 21:30:56 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-292dc9158e5so84155ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760995856; x=1761600656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ba6kY56LKajg5gR+mfYZ1l0Mti/V4+1lpEveR2gotOM=;
 b=g8u/TRCtMuerj/6WPtSZxs0mdLnnUc+WndlPVux+w7IMdEMscCkwRieq3xlcl/wuF0
 8C/DEelgFCGRlOMevcDivICPijiQ6aT2ueo5q/tJwdibGrIE9BlhuV/uDvWaoihHpcE1
 v8BI2cCO730/RXWcFPZsa4VJApGb30vpc+S6r9JzECALrU3bWybywjg2fieZGIybfMmf
 eKxrCRA91CdelLQCvcgXW8d3taQvE+/JS18bClhTXRJxA3Y0ZgBKB6aFZ17k7DsMxuip
 jY9TgVSDEpmB3py78rJoMJTs0Qup9+s5YFmuhTqBfjChoh9QEtOVw7deNOI5ySVsTvb1
 HsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760995856; x=1761600656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ba6kY56LKajg5gR+mfYZ1l0Mti/V4+1lpEveR2gotOM=;
 b=ahP8d55GqR+ybTyZz6mdCvHm/DrNMPtahGi78L18dmLDA6yvjIk3+E4sWAJcB7ZrUn
 3iOOSJeV/ErgIv47OhwAxIcpB4ZszSjEbavxSy5iBls8nsk8gf3MDMKaee/EE5JL8ECv
 7XNgv2rbpUJx85ivUk827be/Q5wF9aqwivdgbOBY4misfEWmLSUwFSmCfBxECu6fzW0O
 9MRwr8k/noYEb49K9ls0ceUjp905zuF5QBnn1ecoE6mJawMCmZHzWOjN/MzfppeI7CJR
 GImmaE7gKYgOrVNjIYi8uSTDfim6RUgdfGI2eEZKiijWlpg8BAKZXS910UXLaFMqPVfL
 d35Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFrsk67MeOEMH4v3fr8YmIfoJqI4N2Id2IaGwMOHvDbH5VXIgdFhW9uQ5PWAhJH9hGVv/tPnm3zgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqLq3KMzphzwqUGPxJOrOiKjq+M7wcqAiahYHxjZeYmbdQ2mGM
 HwZsWX3IWMdqZErymzHqB0x0hhpycKQeK7FVviCp+jDeBAUbm/+8uslb+JCKsGzc5joNQI5+n/w
 zBIso8KsvBO8WavNj8rkIhAvwHZvWoKM=
X-Gm-Gg: ASbGncslvrKyRmLyTxkEcxWuwshr3b1yxbcmZmR95TbM1Rqra4zEXJ4C9n9SKjWt4Na
 5XFMBP1yT3MTkcpD2hwCkZ/THCC4iXkkt0Bm/lhjFw+PuVvx92GJmNoASEdVGnveHBHX7tAUSBM
 F0q3e4l3yIYRUjrHzub8AR5lD0cC5nxNBtc9G2Z1H9+DZ/27mpRThcSdrNIHeDYExHCjCg5Sf2a
 gT7HsY1C2rXKTLQPF3tLhJXbmH5wcxcKYrXjkrzOLNvQuMWIFkCRe8H8gDjAF0XACf6PqavH33B
 obTxl/yvaiaTPTcbBrSRB0GTHu7ewr5QwaenyWp5iM1BnvwWou8KdsAjhFogIADqjN/faLdB3mP
 PS8AEtttfIVS3AA==
X-Google-Smtp-Source: AGHT+IGuIlogvO3qiXAz17lC+JAXlrcckH7vWCchmd8okkyTNJDWWsiiPF/LNLwVhABlkDWXY45TBR8ANM/9BveSOCo=
X-Received: by 2002:a17:903:8c3:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-290c9d2debcmr99091045ad.4.1760995856042; Mon, 20 Oct 2025
 14:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-8-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 23:30:43 +0200
X-Gm-Features: AS18NWBOQUVimKkWa1HJu_1dg-N_FwTUSitxLBjCaOz3GTuCAcSPB_k9_xk69eM
Message-ID: <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
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
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
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

Hi Joel,

A few nits below (I do sometimes this kind of docs review to try to
keep a consistent style across all Rust code).

On Mon, Oct 20, 2025 at 8:56=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> +//!     .set_table_frame_number(new_table.frame_number());
> +//! // Call a function to write PDE to VRAM address

Newline between these. Period ad the end.

> +//! ## Given a PTE, Get or allocate a PFN (page frame number).

In headers, no period at the end. Also, is "Get" intended to be capitalized=
?

> +//!     // Call a function to read 64-bit PTE value from VRAM address

Period at the end too (more of these elsewhere).

> +//!     if pte.valid() {
> +//!         // Return physical frame number from existing mapping
> +//!         Ok(Pfn::new(pte.frame_number()))

Early returns where possible, like in C, i.e. to avoid indentation on
big `else` branches.

> +/// Memory size constants
> +pub(crate) const KB: usize =3D 1024;
> +pub(crate) const MB: usize =3D KB * 1024;

The docs will only apply to the first item, so this probably was meant
to be a `//` instead of a `///`.

Or you could use a module to contain these (and then possibly `use`
them outside), and then you can have docs in the module itself, but
that is heavier.

> +/// Page size: 4 KiB
> +pub(crate) const PAGE_SIZE: usize =3D 4 * KB;

`rustdoc` would eventually render the value and the non-evaluated
expression, and in the source code it already says `4 * KB`, so I
think repeating the value isn't needed, unless you mean to show it is
really a multiple of 2.

> +pub(crate) enum PageTableLevel {
> +    Pdb, // Level 0 - Page Directory Base
> +    L1,  // Level 1
> +    L2,  // Level 2
> +    L3,  // Level 3 - Dual PDE (128-bit entries)
> +    L4,  // Level 4 - PTEs

In this case, I think you meant the other way around, i.e. actual
docs: `///` instead of `//`.

(Also, unless there is a particular reason (e.g. it is a big table),
please generally put comments on top of things, not at the side, which
matches closer to what is needed for docs.)

> +    /// Convert an Address to a frame number.

These should eventually be intra-doc links, but at least please use
for the moment backticks when referring to Rust items like types etc.

> +    /// # Example

We always use the plural for these section headers, even if there is a
single item (e.g. single example).

> +    /// ```no_run
> +    /// let va =3D VirtualAddress::default();
> +    /// let pte_idx =3D va.level_index(PageTableLevel::L4);
> +    /// ```

This will need some `use` lines -- not needed now, but just as a
reminder that these will get actually built eventually.

> +    /// Get raw u64 value.

Intra-doc link or at least backticks.

> +    /// The valid bit is inverted so add an accessor to flip it.
> +    pub(crate) fn set_valid(&self, value: bool) -> Pde {

This docs string sounds like a commit message.

> +/// Dual PDE at Level 3 - 128-bit entry containing both LPT and SPT poin=
ters.
> +/// Lower 64 bits =3D big/large page, upper 64 bits =3D small page.

It sounds like a few of these details should be on its own paragraph
to avoid having them in the short description (title).

> +/// // Call a function to read dual PDE from VRAM address
> +/// let mut dual_pde: DualPde =3D read_dual_pde(dpde_addr)?;
> +/// // Call a function to allocate a page table and return its VRAM addr=
ess
> +/// let spt_addr =3D allocate_page_table()?;
> +/// dual_pde.set_spt(Pfn::from(spt_addr), AperturePde::VideoMemory);
> +/// // Call a function to write dual PDE to VRAM address
> +/// write_dual_pde(dpde_addr, dual_pde)?;

Newlines before the comments, i.e. between "conceptual blocks".

> +    pub lpt: Pde, // Large/Big Page Table pointer (2MB pages) - bits 63:=
0 (lower)
> +    pub spt: Pde, // Small Page Table pointer (4KB pages) - bits 127:64 =
(upper)

Docs instead of comments.

> +    /// Check if has valid Small Page Table.

Missing word?

Thanks!

Cheers,
Miguel
