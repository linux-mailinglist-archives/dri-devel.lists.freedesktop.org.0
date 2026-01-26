Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGXyJwGad2n0iwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 17:44:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570DE8ADA1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 17:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C760D10E21F;
	Mon, 26 Jan 2026 16:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qTWDB7cr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261A210E21F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 16:44:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3BCA660121;
 Mon, 26 Jan 2026 16:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5014C116C6;
 Mon, 26 Jan 2026 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769445881;
 bh=ffKQtPDpbfGS11T9Nc3mJZXIZs0b+SMUS1xWAPHHyL4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=qTWDB7crEQ6Tg57qHfJ2hMOCqSpKIGDonGmy43Hgqhe6AwRLxaJppWvyB6uWyeuFx
 mJchttBldxrZvOH8sR03go9G16WN07PWyAYeU4WOspfZnnePbzRDI6ItmaKv82foOV
 qbO+87IZlyAE7NtfQzWaploMvJ4QyZ9M5HA83QHeY7ur351kyt3CeGzNAtiOtHqDnD
 M5h6K6DUMdACwkZUV0RQblXAyA1vxXIzDaBLARS7AkZU3EaVMlbYlJKc/BsfnY6T7W
 olHXJtkREM4FwWVXBiuFM4gjaMwKZKjyh0QSop22hLyUe5HCJMLhJ5Zf/iwXQGwDYU
 PmqtBiiRGWzQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 17:44:37 +0100
Message-Id: <DFYO7QI5YDJC.3EO91BDN01YBF@kernel.org>
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
 <20260126160036.2b2c66a7@fedora>
 <CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
 <20260126163537.0ca199cf@fedora>
In-Reply-To: <20260126163537.0ca199cf@fedora>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:boris.brezillon@collabora.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 570DE8ADA1
X-Rspamd-Action: no action

On Mon Jan 26, 2026 at 4:35 PM CET, Boris Brezillon wrote:
> On Mon, 26 Jan 2026 16:07:30 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
>> On Mon, Jan 26, 2026 at 4:00=E2=80=AFPM Boris Brezillon
>> <boris.brezillon@collabora.com> wrote:
>> >
>> > On Wed, 21 Jan 2026 11:31:19 +0000
>> > Alice Ryhl <aliceryhl@google.com> wrote:
>> > =20
>> > > +/// A [`GpuVmBo`] object in the GEM list.
>> > > +///
>> > > +/// # Invariants
>> > > +///
>> > > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` =
and is present in the gem list.
>> > > +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>); =
=20
>> >
>> > I find the name a bit confusing: BO residency is often used to refer t=
o
>> > memory backing the buffer object, and in this case, you can end up wit=
h
>> > a GpuVmBoResident being returned for a BO that has been evicted (one
>> > that's no longer resident). =20
>>=20
>> Good point. I meant it as "present in list" but I guess there are
>> other things a gpuvm may be present in.
>>=20
>> Any naming suggestions?
>
> Valid, Bound, Present, Active?

I still have to catch up on this series, but quick drive-by comment: I'd go=
 for
'Registered'.
