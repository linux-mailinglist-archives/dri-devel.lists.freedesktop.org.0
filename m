Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B3AB36E5
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7121189119;
	Mon, 12 May 2025 12:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S+mu91gr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52C389119
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:24:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E0135C6460;
 Mon, 12 May 2025 12:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351C0C4CEE7;
 Mon, 12 May 2025 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747052663;
 bh=6WsQRLYFUEAQx57ht+6c2SC4u1kd7mi/WIA+noBSSVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+mu91grFR4gFOjZsP5HCG6ZakfXuojUZjc0TGTUhDjaBVDHNpK1z7bbJvrZVMK//
 STgMUyC2a58oUT8PT1n+oOeSWaqVF6r4EaZuQ3g2s2EghIh1xTmdPaFoN72a4pa/9i
 ETYjKURQuSk9o+eF0F+vdWDwowCLbw1WFg9MWvM57iqN+RG9EGDfnKK79Nx4zupMGv
 +bXiSo/6GeKq3nb+gcEY2ezMx9kKvI2pS+XhyYvA0nu8P/81uJP2zFpOo0JU0y5Um8
 mu9jOxYbQT+p2RlfKAt/9WXLJq1QdzrezOd90XcZwIC8FS6i9b947121eJ1JLbzDpg
 psaq4LzjCfohA==
Date: Mon, 12 May 2025 14:24:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/4] rust: drm: gem: Implement AlwaysRefCounted for all
 gem objects automatically
Message-ID: <aCHocJFyqSXU6Aam@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-5-lyude@redhat.com>
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

On Thu, May 01, 2025 at 02:33:19PM -0400, Lyude Paul wrote:
> Currently we are requiring AlwaysRefCounted in most trait bounds for gem
> objects, and implementing it by hand for our only current type of gem
> object. However, all gem objects use the same functions for reference
> counting - and all gem objects support reference counting.
> 
> We're planning on adding support for shmem gem objects, let's move this
> around a bit by instead making IntoGEMObject require AlwaysRefCounted as a
> trait bound, and then provide a blanket AlwaysRefCounted implementation for
> any object that implements IntoGEMObject so all gem object types can use
> the same AlwaysRefCounted implementation. This also makes things less
> verbose by making the AlwaysRefCounted trait bound implicit for any
> IntoGEMObject bound.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Great idea!

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
