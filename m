Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG6yKyc0ommn0wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:17:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303F1BF5E1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8990710E1C2;
	Sat, 28 Feb 2026 00:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="YRP89O2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C4110E1C2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:17:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772237858; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=b0gYgNeiBHZlQwsupS6nM/lxig0cCLKjbXzBX37M4t2QULe21Z+jh2R/W3inZdTpSMNq6t2P9qOc+atp7Ccpd4+0vP6UQnSwhQ4v3Ark4KUQIckkr3Uy/NUNIN/NxGAK0f0j5PBoQckOaT3MvpNNPwyuKC5WlXPF1NmIZOZrWlA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772237858;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xBboO8K+xkEUBzbYX5xV5gkcLBnmymkque8l0b3Hc3s=; 
 b=I+pBLGEPpuk4rNu3YwOg2nGjwssYtOKvrXokIFSfVFOTUD3OMq4UXuXW4moFXYAU8a52/7huzChvsa4Y5+51SvtYPaJP1oiOohWvLABau23bxK3A0+gOzPHfyDZqB8CD6AzR1ODXUtTr0qFgi3g/wsSLRweE0MbhWRO5l9ejeGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237858; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=xBboO8K+xkEUBzbYX5xV5gkcLBnmymkque8l0b3Hc3s=;
 b=YRP89O2eUZq9P3F9xOAh5AzQmeor///c96vI9IsYctgrR/P3bVKSkexKqnexrZG1
 A/QmlRxNeJjXx1xGMyxFkwRJAWoLWmKl/ml69Pz8LZkSZibgKiUlGb77mN2acHx5HWQ
 t1+m19zqc3Jq0V4LvKtMQfDbCWbAtf9LQxZ5VVx8=
Received: by mx.zohomail.com with SMTPS id 1772237857173103.26535471031525;
 Fri, 27 Feb 2026 16:17:37 -0800 (PST)
Date: Fri, 27 Feb 2026 16:17:35 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <aaI0H8u7nAbMySek@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
 <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 1303F1BF5E1
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 11:25:47AM -0300, Daniel Almeida wrote:
> 
> 
> > On 11 Feb 2026, at 22:37, Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > 
> > Add support for GEM buffer objects backed by shared memory.
> > 
> > This introduces the BoCreateArgs structure for passing creation parameters
> > including flags, and adds a flags field to BoData. A new_dummy_object()
> > helper is provided to create a dummy GEM object for use as a GPUVM root.
> > 
> > The Bo type alias is added to simplify working with Tyr's shmem-backed
> > GEM objects throughout the driver.
> > 
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> > drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> > 1 file changed, 44 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > index c1208d332dea..6a58f2da88d3 100644
> > --- a/drivers/gpu/drm/tyr/gem.rs
> > +++ b/drivers/gpu/drm/tyr/gem.rs
> > @@ -1,28 +1,64 @@
> > // SPDX-License-Identifier: GPL-2.0 or MIT
> > +//! GEM buffer object management for the Tyr driver.
> > +//!
> > +//! This module provides buffer object (BO) management functionality using
> > +//! DRM's GEM subsystem with shmem backing.
> > 
> > use kernel::{
> >     drm::{
> >         gem,
> > +        gem::shmem,
> >         DeviceContext, //
> >     },
> > -    prelude::*, //
> > +    prelude::*,
> > +    sync::aref::ARef, //
> > };
> > 
> > -use crate::driver::TyrDrmDriver;
> > +use crate::driver::{
> > +    TyrDrmDevice,
> > +    TyrDrmDriver, //
> > +};
> > 
> > -/// GEM Object inner driver data
> > +/// Tyr's DriverObject type for GEM objects.
> > #[pin_data]
> > -pub(crate) struct BoData {}
> > +pub(crate) struct BoData {
> > +    flags: u32,
> > +}
> > +
> > +/// Provides a way to pass arguments when creating BoData
> > +/// as required by the gem::DriverObject trait.
> > +pub(crate) struct BoCreateArgs {
> > +    flags: u32,
> > +}
> > 
> > impl gem::DriverObject for BoData {
> >     type Driver = TyrDrmDriver;
> > -    type Args = ();
> > +    type Args = BoCreateArgs;
> > 
> >     fn new<Ctx: DeviceContext>(
> > -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> > +        _dev: &TyrDrmDevice<Ctx>,
> 
> Unrelated change?

I switched to use the convenience type alias `TyrDrmDevice<Ctx>`
here instead of using its full path. I can flag that in the commit
mesage if that is what you mean?

> 
> >         _size: usize,
> > -        _args: (),
> > +        args: BoCreateArgs,
> >     ) -> impl PinInit<Self, Error> {
> > -        try_pin_init!(BoData {})
> > +        try_pin_init!(Self { flags: args.flags })
> >     }
> > }
> > +
> > +/// Type alias for Tyr GEM buffer objects.
> > +pub(crate) type Bo = gem::shmem::Object<BoData>;
> > +
> > +/// Creates a dummy GEM object to serve as the root of a GPUVM.
> > +#[expect(dead_code)]
> > +pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
> > +    let bo = gem::shmem::Object::<BoData>::new(
> > +        ddev,
> > +        4096,
> > +        shmem::ObjectConfig {
> > +            map_wc: true,
> > +            parent_resv_obj: None,
> > +        },
> > +        BoCreateArgs { flags: 0 },
> > +    )?;
> > +
> > +    Ok(bo)
> > +}
> > -- 
> > 2.52.0
> > 
> > 
> 
