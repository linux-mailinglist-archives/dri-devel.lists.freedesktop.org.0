Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOpxEA/yjGmqvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:18:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D7127AEE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117BF10E659;
	Wed, 11 Feb 2026 21:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pvFSgP7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C54E10E656;
 Wed, 11 Feb 2026 21:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C866419D9;
 Wed, 11 Feb 2026 21:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3614FC4CEF7;
 Wed, 11 Feb 2026 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770844680;
 bh=Xk2na6235/6MdtkvIhpTRHZmnBktjn8EJsmkNHoHgrE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=pvFSgP7elG8OioKaof0a5y8V+UeqIvIJPG+ORj4CYPFr0S2UTkWWWbG0TeASObmAG
 ld/2Ev08iZ7H17laDT6HY+vl5c1KPccISOEmTY5yNnb0KHbHe7X7dwBH35O5Kj5V80
 I1nSWjqVMOy7jX1jsYA4lloLS+T/lz8JVK5hco0RhZ2RE3BYPtFbgpKTVxHX9+kKBm
 bOkKsO5SwTP3Vmc05Ti8merg7u0PtlDwVpPXxdTxMW62HnkGuhSqcsU9je/EYTJFW/
 Jahai5V1xcB29kEuBDG9/KadzI/EDX63FjALRne+JKjabdUH/sLG44pAVNU/YFu6cV
 VPb0rG16+zFrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 22:17:50 +0100
Message-Id: <DGCG1MWY5SJC.1ZGMNKR8E2NPW@kernel.org>
Subject: Re: [PATCH -next v8 1/3] rust: clist: Add support to interface with
 C linked lists
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-2-joelagnelf@nvidia.com>
 <DGB75XMWML8M.DFZY5L52EBQF@kernel.org> <20260211210952.GA3632639@joelbox2>
In-Reply-To: <20260211210952.GA3632639@joelbox2>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CE6D7127AEE
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 10:09 PM CET, Joel Fernandes wrote:
> On Tue, Feb 10, 2026 at 11:07:37AM +0100, Danilo Krummrich wrote:
>> On Mon Feb 9, 2026 at 10:42 PM CET, Joel Fernandes wrote:
>> >  rust/kernel/clist.rs   | 320 ++++++++++++++++++++++++++++++++++++++++=
+
>>=20
>> I think we should move this under rust/kernel/ffi/ to make it obvious th=
at this
>> is FFI infrastructure.
>>=20
>> > diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
>> > new file mode 100644
>> > index 000000000000..8aa72b5d54be
>> > --- /dev/null
>> > +++ b/rust/kernel/clist.rs
>> > @@ -0,0 +1,320 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +//! A C doubly circular intrusive linked list interface for rust code=
.
>>=20
>> Here and in the struct documentation, I'd suggest to clearly point out t=
he
>> use-cases, i.e. that this infrastructure is for FFI use-cases only and s=
hould
>> not be used otherwise in drivers, etc
>
> I am curious why we would not want to have drivers be able to use CList. =
I
> thought that was the point of making it pub at the module/item level as w=
ell.
> I think it is possible a rust driver may have a reference to a CList in t=
he
> future.

It is a (partially) unsafe API built to support FFI interactions. The absol=
ute
majority of drivers should not have any FFI interactions themselves. nova-c=
ore
is the "odd one" as it will have an interface with a C driver (vGPU).

Besides a few "odd" drivers, there may be quite some subsystem abstractions=
 that
become users of the API. In the future build system, subsystems and drivers=
 will
become individual crates.

> But I will update the current usecase above, as you suggested, good point=
.
