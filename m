Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oICDKeJjpWn0/QUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 11:18:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0562D1D648F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 11:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC1710E472;
	Mon,  2 Mar 2026 10:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BaNGQNqH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8730510E472
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 10:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772446683;
 bh=pCqJ4cE7T2aqTIS/ZplrUeqTINb/S1pfopDiR7DbeoA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BaNGQNqHvKkIG+rTvhkBCpzs0xzU+vdU+MZC7jAJ4uGxV8uemGUBBo6Tj8uSFkOIo
 idkFuU9EMptEwLOf6r6o1M22ka9ypYauZlXRqoQa1LT/XRpyGwsWh6On5KVOzbnR2y
 n7Nie0Lw6PM8BUAU0QX+gk2lhjV1yYuNDREh/6kt+GZcfwKHO0TX3ZSj0kxFwkauzA
 ia5DLKuUiLBYlHVdm0J4bTc5MWRKi3l3usy0jKZDSaDzDc6tr095oD4jDhg87cBRkp
 JAuJk5/dt6apRVv9qnWb1Ei2IIv0jTPMjL+ZGonf5/bA2hBOa6pSxWYQrLr0ZgoJIh
 6T0/YJYpQNKnw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DF2DD17E0251;
 Mon,  2 Mar 2026 11:18:02 +0100 (CET)
Date: Mon, 2 Mar 2026 11:17:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>,
 rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <20260302111757.7bae333d@fedora>
In-Reply-To: <aaI0H8u7nAbMySek@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
 <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
 <aaI0H8u7nAbMySek@um790>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 0562D1D648F
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 16:17:35 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> On Fri, Feb 20, 2026 at 11:25:47AM -0300, Daniel Almeida wrote:
> > 
> >   
> > > On 11 Feb 2026, at 22:37, Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > > 
> > > Add support for GEM buffer objects backed by shared memory.
> > > 
> > > This introduces the BoCreateArgs structure for passing creation parameters
> > > including flags, and adds a flags field to BoData. A new_dummy_object()
> > > helper is provided to create a dummy GEM object for use as a GPUVM root.
> > > 
> > > The Bo type alias is added to simplify working with Tyr's shmem-backed
> > > GEM objects throughout the driver.
> > > 
> > > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > > ---
> > > drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> > > 1 file changed, 44 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > > index c1208d332dea..6a58f2da88d3 100644
> > > --- a/drivers/gpu/drm/tyr/gem.rs
> > > +++ b/drivers/gpu/drm/tyr/gem.rs
> > > @@ -1,28 +1,64 @@
> > > // SPDX-License-Identifier: GPL-2.0 or MIT
> > > +//! GEM buffer object management for the Tyr driver.
> > > +//!
> > > +//! This module provides buffer object (BO) management functionality using
> > > +//! DRM's GEM subsystem with shmem backing.
> > > 
> > > use kernel::{
> > >     drm::{
> > >         gem,
> > > +        gem::shmem,
> > >         DeviceContext, //
> > >     },
> > > -    prelude::*, //
> > > +    prelude::*,
> > > +    sync::aref::ARef, //
> > > };
> > > 
> > > -use crate::driver::TyrDrmDriver;
> > > +use crate::driver::{
> > > +    TyrDrmDevice,
> > > +    TyrDrmDriver, //
> > > +};
> > > 
> > > -/// GEM Object inner driver data
> > > +/// Tyr's DriverObject type for GEM objects.
> > > #[pin_data]
> > > -pub(crate) struct BoData {}
> > > +pub(crate) struct BoData {
> > > +    flags: u32,
> > > +}
> > > +
> > > +/// Provides a way to pass arguments when creating BoData
> > > +/// as required by the gem::DriverObject trait.
> > > +pub(crate) struct BoCreateArgs {
> > > +    flags: u32,
> > > +}
> > > 
> > > impl gem::DriverObject for BoData {
> > >     type Driver = TyrDrmDriver;
> > > -    type Args = ();
> > > +    type Args = BoCreateArgs;
> > > 
> > >     fn new<Ctx: DeviceContext>(
> > > -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> > > +        _dev: &TyrDrmDevice<Ctx>,  
> > 
> > Unrelated change?  
> 
> I switched to use the convenience type alias `TyrDrmDevice<Ctx>`
> here instead of using its full path. I can flag that in the commit
> mesage if that is what you mean?

I'd probably do that in a separate commit, like Daniel suggested, even
if that means introducing a one-line commit just for that cosmetic
change.
