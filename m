Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E236ABA9BE
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B1B10E15F;
	Sat, 17 May 2025 11:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QlM0QxaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A474410E15F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 11:37:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 68C3B435BD;
 Sat, 17 May 2025 11:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445BBC4CEE3;
 Sat, 17 May 2025 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747481839;
 bh=Ei657i5dwkNqoKljVGDuxMWyt63ZJ2kvORGx2NS1+r8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QlM0QxaDEU4EEuXF2Mw17ji0aXaqFOvbJ29zORX8CLSP8450GgW97pODC4n/w6ddl
 NtQ2vXeNFwltLBu7Ki6hZM2E3fY47i44++TQ9dtKanTKeVGIuWbfu9HKZ1El+QoXa1
 DTbifq0aoYfhzKjjAzcj+1o7wYiIvbKA1jrJIqwXleOekuD/xHTYhZBeZjD45nfBEb
 AZC3WS2DecyCJNhDPJPE8vZk1a/Awh1Hyqj42LSf54vSCLczPU9SSgeGXso4P7dLpN
 VE9Y2YlIosKh5JXsg/vRqvCI+N6YlpLmkRQJu/I6lYq2LFUuLfoJw63vToFRjZl8bM
 DPnlVx9/2xJVQ==
Date: Sat, 17 May 2025 13:37:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH v2 3/4] rust: drm: gem: Add ObjectFile type alias
Message-ID: <aCh06ESdHK-vDYXy@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
 <20250516171030.776924-4-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516171030.776924-4-lyude@redhat.com>
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

On Fri, May 16, 2025 at 01:09:18PM -0400, Lyude Paul wrote:
> Just to reduce the clutter with the File<…> types in gem.rs.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index c17b36948bae3..2b81298d29765 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -17,6 +17,13 @@
>  /// A type alias for the Object type in use by a [`drm::Driver`].
>  pub type DriverObject<T> = <<T as BaseDriverObject>::Driver as drm::Driver>::Object;
>  
> +/// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
> +/// [`DriverObject`] implementation.
> +///
> +/// [`Driver`]: drm::Driver
> +/// [`DriverFile`]: drm::file::DriverFile
> +pub type ObjectFile<T> = drm::File<<<T as BaseDriverObject>::Driver as drm::Driver>::File>;

Shouldn't we call this just DriverFile? The fact that you derive the Driver type
from the Object type isn't relevant for the File type, i.e. it's not specific to
the Object, but to the Driver.

Also, why does this need to be pub? Shouldn't it be crate private instead? Or
does it make sense to use this in drivers? If so, please use it in nova-drm for
reference.
