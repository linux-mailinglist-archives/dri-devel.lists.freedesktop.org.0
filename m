Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5ADA6C76D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 04:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E41110E075;
	Sat, 22 Mar 2025 03:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mUYVwEye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33F10E075
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 03:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CCF2AA496AE;
 Sat, 22 Mar 2025 03:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ED9C4CEDD;
 Sat, 22 Mar 2025 03:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1742614391;
 bh=ceGLH2OtSdendbouHLsqHGgZ+QIApJ9DTY98Efe95Y8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUYVwEyeG7U805rVloJImuzfUgeuOHtqFrcsMTFLpCD8BjC7PYHtEM59/P+Yjka3Y
 qdWJBqw8VX0MnVfwNBM2xKhUpnw3pDwefzhyFDoW9i7WHC5T2fn5ELv/6Cgi8RM8WX
 PW4iAnvbgWnIzYy3JxZFxQKnFgq5LdgN8zdCrK2k=
Date: Fri, 21 Mar 2025 20:31:49 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, Alice Ryhl <aliceryhl@google.com>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v3 10/33] rust: drm/kms: Add
 ConnectorGuard::add_modes_noedid()
Message-ID: <2025032142-handsaw-gumming-40db@gregkh>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-11-lyude@redhat.com>
 <20250314-observant-cyber-chowchow-bfe5f9@houat>
 <dea3218eb31f3e91d2a10f93a7bc6cfa674546e6.camel@redhat.com>
 <2d39187892737438c35791aa59681b1af7e62de7.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d39187892737438c35791aa59681b1af7e62de7.camel@redhat.com>
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

On Fri, Mar 21, 2025 at 07:52:23PM -0400, Lyude Paul wrote:
> On Fri, 2025-03-21 at 19:50 -0400, Lyude Paul wrote:
> > On Fri, 2025-03-14 at 13:02 +0100, Maxime Ripard wrote:
> > > On Wed, Mar 05, 2025 at 05:59:26PM -0500, Lyude Paul wrote:
> > > > A simple binding for drm_add_modes_noedid() using the ConnectorGuard type
> > > > we just added.
> > > > 
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > ---
> > > >  rust/bindings/bindings_helper.h  |  1 +
> > > >  rust/kernel/drm/kms/connector.rs | 11 +++++++++++
> > > >  2 files changed, 12 insertions(+)
> > > > 
> > > > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > > > index 27828dd36d4f2..846eb6eb8fc4c 100644
> > > > --- a/rust/bindings/bindings_helper.h
> > > > +++ b/rust/bindings/bindings_helper.h
> > > > @@ -13,6 +13,7 @@
> > > >  #include <drm/drm_crtc.h>
> > > >  #include <drm/drm_device.h>
> > > >  #include <drm/drm_drv.h>
> > > > +#include <drm/drm_edid.h>
> > > >  #include <drm/drm_encoder.h>
> > > >  #include <drm/drm_file.h>
> > > >  #include <drm/drm_fbdev_dma.h>
> > > > diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
> > > > index 14de3b0529f89..855a47b189a91 100644
> > > > --- a/rust/kernel/drm/kms/connector.rs
> > > > +++ b/rust/kernel/drm/kms/connector.rs
> > > > @@ -446,6 +446,17 @@ fn deref(&self) -> &Self::Target {
> > > >      }
> > > >  }
> > > >  
> > > > +impl<'a, T: DriverConnector> ConnectorGuard<'a, T> {
> > > > +    /// Add modes for a [`ConnectorGuard`] without an EDID.
> > > > +    ///
> > > > +    /// Add the specified modes to the connector's mode list up to the given maximum resultion.
> > > > +    /// Returns how many modes were added.
> > > > +    pub fn add_modes_noedid(&self, (max_h, max_v): (i32, i32)) -> i32 {
> > > 
> > > Why do we need a tuple of i32 there instead of two u32/usize parameter?
> > > 
> > > And the return type should be unsigned as well.
> > 
> > I think I was just copying C (or whatever the bindings here translate the C
> > type to), but I don't see any issue with changing this to u32.
> 
> ...wait. Now I remember why I did this: it's not that we expect it to be
> unsigned, it's that the largest possible u32 value cannot be expressed in a
> i32, and I think the C side of things uses i32. Days like this I really wish
> we had a u31...
> 
> think it would be OK for us to convert this to unsigned on the C side of
> things?

Yes please.
