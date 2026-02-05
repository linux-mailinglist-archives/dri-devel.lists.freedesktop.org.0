Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IuKDxhuhGmk2wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 11:16:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C6F13DB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 11:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0510E83B;
	Thu,  5 Feb 2026 10:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TaxY6A/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11A010E83B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770286610;
 bh=l8h/PbGWTGwdFjdIFUZfnYw5NfbKYVIQJATv3Vq4Lic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TaxY6A/3WVAas5XoIHTWRYuthe+YRj7Rt7+53LU1C1JL3BotDfrfSS80El9W9MqUm
 EHn35uVBnFbGN/KVHRgXSGw1y1rzi6NbZB2sgUa6xQa3zakDUMXiItZOX8EU4nSfTS
 OZhBI2DHZaQ5iqV/fTGyHhJKhJp+9e6TyrBE76NW/VG6mv5blpclTyt0vDAKqYCHpb
 vXG6EyPaLqaBZfKYWW4qhU7UO8Y50sw7rKw+uGAR8dK3NWSKsgNrdI5/p/OyeYUvHG
 dRN3obaSPhXfVDAMtR0JLzRp4QeXxLr6Cy/lTkgaIRw3C2f2UtX0s32ipvd2tRAefG
 6p57ts8Pqm0+A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AA59A17E00A3;
 Thu,  5 Feb 2026 11:16:49 +0100 (CET)
Date: Thu, 5 Feb 2026 11:16:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260205111635.5307e1fa@fedora>
In-Reply-To: <20260203081403.68733-4-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 871C6F13DB
X-Rspamd-Action: no action

On Tue,  3 Feb 2026 09:14:01 +0100
Philipp Stanner <phasta@kernel.org> wrote:

> +/// A synchronization primitive mainly for GPU drivers.
> +///
> +/// DmaFences are always reference counted. The typical use case is that one side registers
> +/// callbacks on the fence which will perform a certain action (such as queueing work) once the
> +/// other side signals the fence.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::{Arc, ArcBorrow, DmaFence, DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
> +/// use core::sync::atomic::{self, AtomicBool};
> +///
> +/// static mut CHECKER: AtomicBool = AtomicBool::new(false);
> +///
> +/// struct CallbackData {
> +///     i: u32,
> +/// }
> +///
> +/// impl CallbackData {
> +///     fn new() -> Self {
> +///         Self { i: 9 }
> +///     }
> +/// }
> +///
> +/// impl DmaFenceCbFunc for CallbackData {
> +///     fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
> +///         assert_eq!(cb.data.i, 9);
> +///         // SAFETY: Just to have an easy way for testing. This cannot race with the checker
> +///         // because the fence signalling callbacks are executed synchronously.
> +///         unsafe { CHECKER.store(true, atomic::Ordering::Relaxed); }
> +///     }
> +/// }
> +///
> +/// struct DriverData {
> +///     i: u32,
> +/// }
> +///
> +/// impl DriverData {
> +///     fn new() -> Self {
> +///         Self { i: 5 }
> +///     }
> +/// }
> +///
> +/// let data = DriverData::new();
> +/// let fctx = DmaFenceCtx::new()?;
> +///
> +/// let mut fence = fctx.as_arc_borrow().new_fence(data)?;
> +///
> +/// let cb_data = CallbackData::new();
> +/// fence.register_callback(cb_data);
> +/// // fence.begin_signalling();
> +/// fence.signal()?;
> +/// // Now check wehether the callback was actually executed.
> +/// // SAFETY: `fence.signal()` above works sequentially. We just check here whether the signalling
> +/// // actually did set the boolean correctly.
> +/// unsafe { assert_eq!(CHECKER.load(atomic::Ordering::Relaxed), true); }
> +///
> +/// Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct DmaFence<T> {
> +    /// The actual dma_fence passed to C.
> +    #[pin]
> +    inner: Opaque<bindings::dma_fence>,
> +    /// User data.
> +    #[pin]
> +    data: T,

A DmaFence is a cross-device synchronization mechanism that can (and
will) cross the driver boundary (one driver can wait on a fence emitted
by a different driver). As such, I don't think embedding a generic T in
the DmaFence and considering it's the object being passed around is
going to work, because, how can one driver know the T chosen by the
driver that created the fence? If you want to have some fence emitter
data attached to the DmaFence allocation, you'll need two kind of
objects:

- one that's type agnostic and on which you can do the callback
  registration/unregistration, signalling checks, and generally all
  type-agnostic operations. That's basically just a wrapper around a
  bindings::dma_fence implementing AlwaysRefCounted.
- one that has the extra data and fctx, with a way to transmute from a
  generic fence to a implementer specific one in case the driver wants
  to do something special when waiting on its own fences (check done
  with the fence ops in C, I don't know how that translates in rust)

> +    /// Marks whether the fence is currently in the signalling critical section.
> +    signalling: bool,
> +    /// A boolean needed for the C backend's lockdep guard.
> +    signalling_cookie: bool,
> +    /// A reference to the associated [`DmaFenceCtx`] so that it cannot be dropped while there are
> +    /// still fences around.
> +    fctx: Arc<DmaFenceCtx>,
> +}
