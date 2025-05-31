Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25379AC9B63
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 16:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B31410E293;
	Sat, 31 May 2025 14:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DSeMVG/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D17010E00D;
 Sat, 31 May 2025 14:37:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 56A345C49D5;
 Sat, 31 May 2025 14:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4CFC4CEE3;
 Sat, 31 May 2025 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748702240;
 bh=fivt1Mk4Yw5WXYfrIwOJfSKG3z+m2LyIrjnukMMgFOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DSeMVG/Fbe4qRBejiZw0EyatWeyiWsE20b6NZA1wBfJWpepek0YCiHbxmDi/Mb0gA
 YvT1GDR0JgkrXPMEXnskuvgMpIxBIia/wv9AEZFvb8mJ9bKRGsuKfUfbHjQDaVTLqO
 tteVaN0kse0EAUXGjtVD3idwokMzsGoi9l23MVq/J8ZnRSxOgCM8pzbX9ZiroqYtAx
 tu+YSV3yG0bys0FsnbU5PPjpg1kkC4VGSF+612EPLKmNtGdAc49h5+AkeFtJUarRSk
 Vtm4GfcJfJkvP9fKwRXo1G2dwMCcQAmwalOWUIRRBZlHfqXr0aDbl+gmHjbCeJT7qF
 bimcc3X3iNdww==
Date: Sat, 31 May 2025 16:37:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
Message-ID: <aDsUGGrjbJ_8KyrP@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com>
 <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
 <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com>
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

On Sat, May 31, 2025 at 04:09:29PM +0200, Miguel Ojeda wrote:
> On Fri, May 30, 2025 at 11:51 PM Lyude Paul <lyude@redhat.com> wrote:
> > TBH - we should really add some safe bindings for sleeps instead of calling
> > this unsafely, I'd be happy to review them if you do
> 
> In case it helps, there is:
> 
>     https://lore.kernel.org/rust-for-linux/20250423192857.199712-6-fujita.tomonori@gmail.com/
> 
> I think that is the last one -- we have been going back and forth a
> bit on it (e.g. we had `coarse_sleep()` in the old `rust` pre-merge
> branch), but, yeah, let's try to get the abstraction(s) in.

We've already discussed this on previous versions of this patch series, where I
also pointed to the patch series linked above.

I agreed to take this code without waiting for those abstractions, but with a
TODO to fix things up once they land.

- Danilo
