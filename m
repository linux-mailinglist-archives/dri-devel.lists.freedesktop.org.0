Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COz2LaaMjWnq3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:17:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093212B2ED
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B37310E285;
	Thu, 12 Feb 2026 08:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dXLLspR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5947810E285
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770884258;
 bh=93IOVW/PcOxdSVuCu2WWHizraqwu9N9D1ImwbinLG2U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dXLLspR1PE9mT2qc723tWMcF3aqVtdsOcHAJJz6HI361KDOwpKQigVDsCkmq+K8oz
 KKgMHdRdlSpinhDcfgGPYahHgQfke7wJNadwtpZdc67QKsKCYAlEmfHUoMv7lTanBG
 p38I3aYSvWyIlWqd58S5W9A02HnsB4r7UUrLIvhVqL9JSD8Hq1TNMz2pF8FhrUJFXB
 uk2km7YT7GqVBi7Eb996dOf1OZdepp11D8kzSrxGhuc66yfeUDs8vB2N03c3JhHbzk
 A2clk/QVCZeB3FMGu3pJZkUsogPxbiHqHt42R3UnoiunbGjN3dT+OqRVf19Mk6uZVV
 sFh8avB6mH7+A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B787217E00AC;
 Thu, 12 Feb 2026 09:17:37 +0100 (CET)
Date: Thu, 12 Feb 2026 09:17:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <20260212091734.0497dc87@fedora>
In-Reply-To: <20260212013713.304343-7-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 3093212B2ED
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 17:37:07 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Add support for GEM buffer objects backed by shared memory.
> 
> This introduces the BoCreateArgs structure for passing creation parameters
> including flags, and adds a flags field to BoData. A new_dummy_object()
> helper is provided to create a dummy GEM object for use as a GPUVM root.
> 
> The Bo type alias is added to simplify working with Tyr's shmem-backed
> GEM objects throughout the driver.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
>  1 file changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index c1208d332dea..6a58f2da88d3 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -1,28 +1,64 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
> +//! GEM buffer object management for the Tyr driver.
> +//!
> +//! This module provides buffer object (BO) management functionality using
> +//! DRM's GEM subsystem with shmem backing.
>  
>  use kernel::{
>      drm::{
>          gem,
> +        gem::shmem,
>          DeviceContext, //
>      },
> -    prelude::*, //
> +    prelude::*,
> +    sync::aref::ARef, //
>  };
>  
> -use crate::driver::TyrDrmDriver;
> +use crate::driver::{
> +    TyrDrmDevice,
> +    TyrDrmDriver, //
> +};
>  
> -/// GEM Object inner driver data
> +/// Tyr's DriverObject type for GEM objects.
>  #[pin_data]
> -pub(crate) struct BoData {}
> +pub(crate) struct BoData {
> +    flags: u32,
> +}
> +
> +/// Provides a way to pass arguments when creating BoData
> +/// as required by the gem::DriverObject trait.
> +pub(crate) struct BoCreateArgs {
> +    flags: u32,
> +}
>  
>  impl gem::DriverObject for BoData {
>      type Driver = TyrDrmDriver;
> -    type Args = ();
> +    type Args = BoCreateArgs;
>  
>      fn new<Ctx: DeviceContext>(
> -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> +        _dev: &TyrDrmDevice<Ctx>,
>          _size: usize,
> -        _args: (),
> +        args: BoCreateArgs,
>      ) -> impl PinInit<Self, Error> {
> -        try_pin_init!(BoData {})
> +        try_pin_init!(Self { flags: args.flags })
>      }
>  }
> +
> +/// Type alias for Tyr GEM buffer objects.
> +pub(crate) type Bo = gem::shmem::Object<BoData>;
> +
> +/// Creates a dummy GEM object to serve as the root of a GPUVM.
> +#[expect(dead_code)]
> +pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
> +    let bo = gem::shmem::Object::<BoData>::new(
> +        ddev,
> +        4096,
> +        shmem::ObjectConfig {
> +            map_wc: true,
> +            parent_resv_obj: None,
> +        },
> +        BoCreateArgs { flags: 0 },
> +    )?;
> +
> +    Ok(bo)
> +}

Nit: I'd probably move this new_dummy_object() addition to the commit
introducing Vm support.

