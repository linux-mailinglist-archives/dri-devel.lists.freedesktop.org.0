Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB/fMCb1fWmBUgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 13:27:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5289C1C87
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 13:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE09110E042;
	Sat, 31 Jan 2026 12:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EHJeQ0It";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37DD10E042;
 Sat, 31 Jan 2026 12:27:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E7D796001A;
 Sat, 31 Jan 2026 12:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5EFC19421;
 Sat, 31 Jan 2026 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769862432;
 bh=2fTkhAUP5p8/EG0o4I2HX5HD4RSHs9zkMP98Fcb/6XM=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=EHJeQ0ItVPSJjv4Jmi+vbS4l02KXRVHbuPygJkkFwtXr/bXADaVsDAgBcvTjog/zi
 MnL0byblG1dhDo4GmZ4xiinVA3SW+Qq7nXDPipRavAjiim9Kg9JShwQRWcgnYhSK1x
 HoHqWiXSdA2DLJJDPqmxxueUORw6vAKKrXnOQz/XeMHrrVQgcKFgtttGg5CZUyTMa6
 +sDqrpjbbST5XynxHPuh+5/Tcf2bu6Rr6Crxoawt/tCrm5bSGeN0tB79mM7p75qS4J
 VbuKNHuo7vffsGmjuY8XNP8uIGsNk/odg6PPIRoutntFMOUb/5pTU2mpy8raWq2/iK
 +/caWR1/xwcpw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:27:06 +0100
Message-Id: <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,kernel.org,garyguo.net,protonmail.com,umich.edu,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E5289C1C87
X-Rspamd-Action: no action

(Cc: Lyude)

On Fri Jan 30, 2026 at 9:34 AM CET, Eliot Courtney wrote:
> This series extends the DMA coherent allocation API to support compile-ti=
me
> known sizes. This lets bounds checking to be moved from runtime to build
> time, which is useful to avoid runtime panics from index typos. It also
> removes the need for a Result return type in some places.
>
> The compile time size is specified via a marker type: StaticSize<N>.
> Statically sized allocations can decay to runtime sized ones via deref
> coercion for code that doesn't need to know the size at compile time, or =
to
> avoid having to carry around extra type parameters. The implementation
> follows a similar pattern to Device/DeviceContext.
>
> The series defines three type aliases: CoherentSlice<T> (for runtime size=
),
> CoherentArray<T, N> (for compile-time size N), and CoherentObject<T> (for
> single object allocations). It also adds infallible dma_read!/dma_write!
> macros and methods to CoherentArray, while prefixing the existing fallibl=
e
> methods and macros with `try_`.
>
> The macros keep the same syntax (i.e.
> coherent_allocation[index].optional_fields =3D expression) even for
> CoherentObject, because the [] syntax is needed to know where to split th=
e
> actual CoherentAllocation object from the fields. This means that
> CoherentObject is indexed with [0] in dma_write!/dma_read! macros. The
> alternative is defining a separate macro for single object access, but it
> still would need a way to delineate between the allocation and the fields=
,
> perhaps by using commas (dma_read_obj!(object, fields),
> dma_write_obj!(object, fields, value)). This would be inconsistent with t=
he
> array/slice syntax.

We've just generalized I/O to support arbitrary I/O backends (busses, backi=
ng
storage, etc.).

With this we can wire up the I/O traits to DMA and generalize the dma_read(=
) and
dma_write() macros accordingly. I.e. we can extend the I/O traits with
field_write() and field_read().

(Lyude is going to work on this as a more integrated alternative to iosys_m=
ap.
It would be good to align with her regarding this work.)

This has the advantage that we don't have to duplicate all this infrastruct=
ure
for I/O memory, DMA, etc.

I also think that CoherentSlice is too specific of a type. I'd rather have =
a
generic type, maybe UnsafeSlice or IoSlice, that just uses the I/O backend =
for
accesses.
