Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGxbGYq0qml9VgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:03:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96721F682
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ADA10ECDE;
	Fri,  6 Mar 2026 11:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RTDbKOpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622C010ECDE;
 Fri,  6 Mar 2026 11:03:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E820043EE2;
 Fri,  6 Mar 2026 11:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C08BC2BCB3;
 Fri,  6 Mar 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772795014;
 bh=9kYhONNOuHNdTnEFXcExgHi8n0fGbiUgRAaTDCbIcqI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=RTDbKOpxoF1J+0YGsIe4inkKZkkELNb0sZAhBcxnObYCNGFEcQIeMcIAwm7nGM99n
 GSijIOczN3ZbGAJxa6xwXdRUPU8cNCMuweonYby9//8PlSIedpowNvgceKpjNcD4DU
 bk6s5STkAeZM7mV2YnotGvhjQX9F7gOTNI7a5HQzKHL2T4634gdn5IFGGFm81v4LwW
 VsdnjLAFAZHGvlRBFhbWoEGoqjRpXdOQvuaLZ9e8Eg10daSLpEuVOBg3gCTj4wvuuM
 3Looy0HT6EdabLHJQ1Ywd23hygCGXPL7+fACrTlouGML20s1c8hs7kdbuzD/5r/AKf
 Ph1n6uuXgCRrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 12:03:28 +0100
Message-Id: <DGVNDRM96OTJ.1RD1IGZ4QV5VF@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
 <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
 <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
In-Reply-To: <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
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
X-Rspamd-Queue-Id: 3A96721F682
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 1:48 AM CET, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 8:16 PM JST, Danilo Krummrich wrote:
>> @Alex: It also seems that this is based on broken code, i.e. I noticed h=
ow the
>> DMA read is done in this case in e.g. gsp_read_ptr().
>>
>> 	fn cpu_read_ptr(&self) -> u32 {
>> 	    let gsp_mem =3D self.0.start_ptr();
>> =09
>> 	    // SAFETY:
>> 	    //  - The ['CoherentAllocation'] contains at least one object.
>> 	    //  - By the invariants of CoherentAllocation the pointer is valid.
>> 	    (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
>> 	}
>>
>> Why isn't this using dma_read!()? I think creating this reference is UB.
>
> We can't - technically we would have to have the `dma_read` in `cmdq.rs`
> so it can access the `CoherentAllocation` (and do an unwrap in the
> process):
>
>     dma_read!(self.0, 0, .gspq.rx.0.readPtr).unwrap()
>
> ... but that cannot be done as `MsgqRxHeader` is part of the bindings
> (i.e. in `fw.rs`) and thus its internal fields are not visible to
> `cmdq.rs`, as per our policy of making the bindigns opaque.

We can have a helpers for doing such dma_read!() calls in gsp/fw.rs instead=
, and
just forward from the actual methods.

	fn cpu_read_ptr(&self) -> u32 {
	    fw:gsp_mem::cpu_rx_ptr(self) % MSGQ_NUM_PAGES
	}

> This can probably be done better with I/O projections, but for now we hav=
e to
> do the read_volatile by ourselves.

Not necessarily, see above.

> What makes this reference UB btw?

Gary explained this in another reply already; I think fixing this with Opaq=
ue or
passing raw pointers instead involves even more unsafe. Whereas the simple
indirection from above is fully safe and can easily replaced with I/O
projections once we have them.
