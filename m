Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFTZL1w0ommn0wQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:18:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCB81BF5EF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9EE10E1C9;
	Sat, 28 Feb 2026 00:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="dDiNbL4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB0B10E1C9
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772237910; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NqKY9nwwIRO9Das6zw6/VLDkpSVzsS+qkXLEtGrxWNUPsrzEX7SxqQOF8HwDtLSAYq2gtmscNCe0YOw00eMMHUBpeaU2C/ontuXJS8p7iZqORbFmhzPVdU7VnOfMPmUlfLpBDyzY4KxHBGn0FC7igE56QeSNdJpDXoa0s4KpFqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772237910;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Klm6q63orIAA7W8i0kJmSBPifIFUgHAEkJyTVjy1+kg=; 
 b=D6wRGBTGJdf4otEGXCWQ2Cm++SX3Lzy9C+CPIXpDqPYuWosTDqZSW9ctJMrdnrwEFjJipYB1tLQvGB+Cb2qDldPXMoAYovT9rH9+WA6TsrbzdKgNVHR2iTpzuig6eDrC+Swx/D/IvQK1FkYsGQF5zfIyKq4dgTgd/ckrG+zB1VE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237910; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Klm6q63orIAA7W8i0kJmSBPifIFUgHAEkJyTVjy1+kg=;
 b=dDiNbL4joLNuvPOBmZhVT6iKrb273U/P2rhPhgAyqZ9X2HTnDsQpfp4j5RD7XwxB
 bsyCh9vT2GJka8Zc+ZVzO+2eI5zVg3tX5MzyzBJW/Ajh5731leFgdFpHOyiFFto/tzB
 m2R+RwlPuLlAKt3V0PiOBiZqkwj6UvdetPs2JvZI=
Received: by mx.zohomail.com with SMTPS id 177223790747952.936575191812835;
 Fri, 27 Feb 2026 16:18:27 -0800 (PST)
Date: Fri, 27 Feb 2026 16:18:27 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 02/12] drm/tyr: move clock cleanup into Clocks Drop impl
Message-ID: <aaI0U13AhtG0qdFK@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-3-deborah.brouwer@collabora.com>
 <20260212091255.74b65cb0@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212091255.74b65cb0@fedora>
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
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
X-Rspamd-Queue-Id: 3FCB81BF5EF
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 09:12:55AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:03 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
> > causes them to be shut down before any other fields in TyrDrmDeviceData
> > are dropped. This prevents us from using the clocks when dropping the
> > other fields in TyrDrmDeviceData.
> > 
> > In order to better control when the clocks are dropped, move this cleanup
> > logic into a Drop implementation on the Clocks struct itself.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> Maybe you should mention that Clocks is no longer considered pinned,
> because it's not needed in practice.

Ack will do.

> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> > ---
> >  drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
> >  1 file changed, 9 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index ae4daa12b3e5..9bc6ed56c45e 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -54,7 +54,7 @@ pub(crate) struct TyrPlatformDeviceData {
> >      _device: ARef<TyrDrmDevice>,
> >  }
> >  
> > -#[pin_data(PinnedDrop)]
> > +#[pin_data]
> >  pub(crate) struct TyrDrmDeviceData {
> >      pub(crate) pdev: ARef<platform::Device>,
> >  
> > @@ -168,17 +168,6 @@ impl PinnedDrop for TyrPlatformDeviceData {
> >      fn drop(self: Pin<&mut Self>) {}
> >  }
> >  
> > -#[pinned_drop]
> > -impl PinnedDrop for TyrDrmDeviceData {
> > -    fn drop(self: Pin<&mut Self>) {
> > -        // TODO: the type-state pattern for Clks will fix this.
> > -        let clks = self.clks.lock();
> > -        clks.core.disable_unprepare();
> > -        clks.stacks.disable_unprepare();
> > -        clks.coregroup.disable_unprepare();
> > -    }
> > -}
> > -
> >  // We need to retain the name "panthor" to achieve drop-in compatibility with
> >  // the C driver in the userspace stack.
> >  const INFO: drm::DriverInfo = drm::DriverInfo {
> > @@ -202,14 +191,20 @@ impl drm::Driver for TyrDrmDriver {
> >      }
> >  }
> >  
> > -#[pin_data]
> >  struct Clocks {
> >      core: Clk,
> >      stacks: OptionalClk,
> >      coregroup: OptionalClk,
> >  }
> >  
> > -#[pin_data]
> > +impl Drop for Clocks {
> > +    fn drop(&mut self) {
> > +        self.core.disable_unprepare();
> > +        self.stacks.disable_unprepare();
> > +        self.coregroup.disable_unprepare();
> > +    }
> > +}
> > +
> >  struct Regulators {
> >      _mali: Regulator<regulator::Enabled>,
> >      _sram: Regulator<regulator::Enabled>,
> 
