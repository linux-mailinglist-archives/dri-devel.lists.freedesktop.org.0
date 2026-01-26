Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFrQGdKJd2m9hgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:35:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2B68A339
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 16:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88A10E211;
	Mon, 26 Jan 2026 15:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WEyJc2xN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69D310E211
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769441740;
 bh=Zsj5GV2Wx59l0SS2ck0KTf647N++hXpV2gQqB1R2r34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WEyJc2xNIDS1rc69lK2hGe+0nUtvu9VR4xim8dthi8gOgnyRID1GyJQ6ss/4UHlux
 PxTrZWSuCYNp/ao1NHKvjDXNJzr6uBOKQrEXUTYcnYseQGg6Eq9l7ndlLEfXQHz2Yl
 ImCB093+G7/Vqy4TAhD5r/43a+j66ATpnMtWtKkoLCGzylOa29QzElgvXr87y61J8t
 1aw0YZFFYe408K/lhflrM1hu4TyqxU+jT6FouPUpETA9x0n13rqRWzyrrO7n+pAQbF
 jXiFoMufibJDkjTFY06obHbAy9Xbjwk62duG0Vi/IZquv9WPkbvNOGhSP/FWlNeYXk
 5qFBFr1/9VTwg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AD26817E0E6C;
 Mon, 26 Jan 2026 16:35:39 +0100 (CET)
Date: Mon, 26 Jan 2026 16:35:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Janne Grunau <j@jannau.net>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Asahi
 Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
Message-ID: <20260126163537.0ca199cf@fedora>
In-Reply-To: <CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
 <20260126160036.2b2c66a7@fedora>
 <CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
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
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DB2B68A339
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 16:07:30 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Jan 26, 2026 at 4:00=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Wed, 21 Jan 2026 11:31:19 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> > =20
> > > +/// A [`GpuVmBo`] object in the GEM list.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` a=
nd is present in the gem list.
> > > +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>); =20
> >
> > I find the name a bit confusing: BO residency is often used to refer to
> > memory backing the buffer object, and in this case, you can end up with
> > a GpuVmBoResident being returned for a BO that has been evicted (one
> > that's no longer resident). =20
>=20
> Good point. I meant it as "present in list" but I guess there are
> other things a gpuvm may be present in.
>=20
> Any naming suggestions?

Valid, Bound, Present, Active?
