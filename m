Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLhbHHQZn2n3YwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:47:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E9199E89
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E25010E797;
	Wed, 25 Feb 2026 15:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bvNkwDZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3C210E797
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:46:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 24DAD60126;
 Wed, 25 Feb 2026 15:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC6EC116D0;
 Wed, 25 Feb 2026 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772034415;
 bh=AlRNYr0g7ckHbt4Eg1IUwmE97fw50dZyzx1GZdf8jT8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=bvNkwDZlNgPGRlnV+Fdo27F0RxpIL+CihI4VZGz9Kma9FraNHV5bGvf8bHqJtRnGR
 kL57CPox+9/83r4DeMABa8LbkQcy5B7gty+zRLg+pZrGAzkwZb+KHz6WVeZvwWMNVW
 8oDPZRmlplQ9y5xN2eDC3nytguqZhcn+DuYGCK8HvaQj7mNwPpgWlV4O8W32DFkCp4
 gbl9tgUC29Vv4OTmY90qdZOgHhBjB64RwRgAVmVRT0jAHnNaECLaVjyy6SRDoGOGyR
 p7IqvR+OPecFVUuVfSXa24mZRAGxqDqoKPVrHjRDbeppKZZSvc5uxR6YPzQzXaZfYj
 rtTIi67ZiMHyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 16:46:51 +0100
Message-Id: <DGO5RUMC880T.2BBB93GLBFSIJ@kernel.org>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org> <aZgYY_fetgz_GDR8@google.com>
 <DGJX3FI97W1G.371MAMC60FX24@kernel.org> <aZlw3SGmLetHwaTM@google.com>
 <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org> <aZwalt_6KlOIDzkN@google.com>
 <DGMA3158PGED.1BQ63TEC2FC60@kernel.org> <aZw4hCxvx_2oFIha@google.com>
In-Reply-To: <aZw4hCxvx_2oFIha@google.com>
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
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.987];
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
X-Rspamd-Queue-Id: F07E9199E89
X-Rspamd-Action: no action

On Mon Feb 23, 2026 at 12:22 PM CET, Alice Ryhl wrote:
> On Mon, Feb 23, 2026 at 11:44:12AM +0100, Danilo Krummrich wrote:
>> On Mon Feb 23, 2026 at 10:15 AM CET, Alice Ryhl wrote:
>> > On Sat, Feb 21, 2026 at 04:09:41PM +0100, Danilo Krummrich wrote:
>> >> On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
>> >> > So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T=
>>?
>> >>=20
>> >> I wanted to avoid exposing the reference count, as I suspect drivers =
might not
>> >> need it in Rust, but I don't know for sure.
>> >>=20
>> >> We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
>> >> GpuVmBoInner<T> is private, but I also don't want you to go back and =
forth with
>> >> this in case it turns out we do need drivers to be able to take a ref=
erence
>> >> count and I also don't think it hurts too much exposing the reference=
 count,
>> >> even if not needed.
>> >>=20
>> >> So, either is fine with me, ARef<GpuVmBo<T>> or
>> >> GpuVmBo<T>(ARef<GpuVmBoInner<T>>).
>> >
>> > I don't think GpuVmBo<T>(ARef<GpuVmBoInner<T>>) works because we need =
to
>> > be able to talk about both ARef<GpuVmBoInner<T>> and &GpuVmBoInner<T>.
>> > The reference type is returned by several different APIs, so the Inner
>> > type can't be private.
>>=20
>> I meant NonNull<GpuVmBoInner<T>>, analogous to the current GpuVmBoRegist=
ered.
>
> Not sure what you mean.

What I meant was doing what you currently have, with the following changes:

- Rename GpuVmBoRegistered<T> to GpuVmBo<T>.
- Rename GpuVmBo<T> to GpuVmBoInner<T> and make it private.

The downside is that both GpuVmBo<T> and GpuVmBoAlloc<T> can't dereference =
to
GpuVmBoInner<T>, so we'd need some forwarding methods.

The advantage is that we can hide the reference count and keep it simple wi=
th
only two driver types, GpuVmBo<T> and GpuVmBoAlloc<T>.

But I'm also fine with just ARef<GpuVmBo<T>> and GpuVmBoAlloc<T>.
