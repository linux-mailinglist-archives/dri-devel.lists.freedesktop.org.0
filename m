Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGUYCuTCpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:03:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AFA1DD75C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492610E575;
	Mon,  2 Mar 2026 17:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="UB1WmjJ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA03610E575
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 17:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772471006; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nIxKPqimEkEj3+VtKwCQbDx59+lpFCaUJb9STfD37jWy55f4WFBgSQy5MXBwxqDPMBueYuSsYeofCP2vDkEJMXvWq8LZnwDpjhzMau7j/XvSN9g3x/ekSC7+4kiQKBI6tITLlrz8VRc4WgMnKo5gBAsH+uJ66EObjDtxAN77OHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772471006;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=G1nGZ9pjYdRxj6fO5beVqDO4Q6KE8nU16ODj3Ijuy10=; 
 b=BPfjAmHdlzhwEeW6rKSPnmQa1Fk0Hd8mPQm3FBAXZ5UJjhFt6XB0q/voPp/0JWj+0MapORQsROl26T4kUCtb7Cd37QXJTejHsu0TCP5UYCl9IxJRjzQxm1R/OUsJcxsH7ED8KAfnK9RCUWSh4g6IhseolhzHZOoiEKq+T5Yj44s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772471006; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=G1nGZ9pjYdRxj6fO5beVqDO4Q6KE8nU16ODj3Ijuy10=;
 b=UB1WmjJ1ufcshvvX87pa61YDincaf/ugV96I5jJxRFwgQXRtHhgzp85jqLfHZKo+
 XT5jjkyokSGCjEt/tjdTbnfI/8Dy2gVlvnobQEql8Zidh3XxqXHQ0dhqzwRAv51FTof
 WSwOgop748oVJBK7+dVYkDpRC5o8Z0LAJFHs488g=
Received: by mx.zohomail.com with SMTPS id 1772471003268422.2853518645959;
 Mon, 2 Mar 2026 09:03:23 -0800 (PST)
Date: Mon, 2 Mar 2026 09:03:22 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <aaXC2td--4_afzT4@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
 <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
 <aaI0H8u7nAbMySek@um790> <20260302111757.7bae333d@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302111757.7bae333d@fedora>
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
X-Rspamd-Queue-Id: 71AFA1DD75C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:17:57AM +0100, Boris Brezillon wrote:
> On Fri, 27 Feb 2026 16:17:35 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > On Fri, Feb 20, 2026 at 11:25:47AM -0300, Daniel Almeida wrote:
> > > 
> > >   
> > > > On 11 Feb 2026, at 22:37, Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > > > 
> > > > Add support for GEM buffer objects backed by shared memory.
> > > > 
> > > > This introduces the BoCreateArgs structure for passing creation parameters
> > > > including flags, and adds a flags field to BoData. A new_dummy_object()
> > > > helper is provided to create a dummy GEM object for use as a GPUVM root.
> > > > 
> > > > The Bo type alias is added to simplify working with Tyr's shmem-backed
> > > > GEM objects throughout the driver.
> > > > 
> > > > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > > > ---
> > > > drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> > > > 1 file changed, 44 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > > > index c1208d332dea..6a58f2da88d3 100644
> > > > --- a/drivers/gpu/drm/tyr/gem.rs
> > > > +++ b/drivers/gpu/drm/tyr/gem.rs
> > > > @@ -1,28 +1,64 @@
> > > > // SPDX-License-Identifier: GPL-2.0 or MIT
> > > > +//! GEM buffer object management for the Tyr driver.
> > > > +//!
> > > > +//! This module provides buffer object (BO) management functionality using
> > > > +//! DRM's GEM subsystem with shmem backing.
> > > > 
> > > > use kernel::{
> > > >     drm::{
> > > >         gem,
> > > > +        gem::shmem,
> > > >         DeviceContext, //
> > > >     },
> > > > -    prelude::*, //
> > > > +    prelude::*,
> > > > +    sync::aref::ARef, //
> > > > };
> > > > 
> > > > -use crate::driver::TyrDrmDriver;
> > > > +use crate::driver::{
> > > > +    TyrDrmDevice,
> > > > +    TyrDrmDriver, //
> > > > +};
> > > > 
> > > > -/// GEM Object inner driver data
> > > > +/// Tyr's DriverObject type for GEM objects.
> > > > #[pin_data]
> > > > -pub(crate) struct BoData {}
> > > > +pub(crate) struct BoData {
> > > > +    flags: u32,
> > > > +}
> > > > +
> > > > +/// Provides a way to pass arguments when creating BoData
> > > > +/// as required by the gem::DriverObject trait.
> > > > +pub(crate) struct BoCreateArgs {
> > > > +    flags: u32,
> > > > +}
> > > > 
> > > > impl gem::DriverObject for BoData {
> > > >     type Driver = TyrDrmDriver;
> > > > -    type Args = ();
> > > > +    type Args = BoCreateArgs;
> > > > 
> > > >     fn new<Ctx: DeviceContext>(
> > > > -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> > > > +        _dev: &TyrDrmDevice<Ctx>,  
> > > 
> > > Unrelated change?  
> > 
> > I switched to use the convenience type alias `TyrDrmDevice<Ctx>`
> > here instead of using its full path. I can flag that in the commit
> > mesage if that is what you mean?
> 
> I'd probably do that in a separate commit, like Daniel suggested, even
> if that means introducing a one-line commit just for that cosmetic
> change.

Sure, i'll check to make sure i haven't done this anywhere else, and
gather them all into a separate commit.

