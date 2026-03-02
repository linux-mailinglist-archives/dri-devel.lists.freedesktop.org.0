Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOQ6MPGhpWmuCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:42:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C41DB126
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5659A10E536;
	Mon,  2 Mar 2026 14:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bKskj/3G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFFA10E51C;
 Mon,  2 Mar 2026 14:42:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7823643DA9;
 Mon,  2 Mar 2026 14:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711E4C19423;
 Mon,  2 Mar 2026 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772462573;
 bh=jdPZtaNXT3Ug5PAx8Lx74Slf+71lV1kNv1pKhVbsBH8=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=bKskj/3Gmz/aaGAjDErolvdnSoFrXZr/GHrBzAv0dVtTHvrC6GzINql1X0+/9sOLb
 Hx5Jg9colGJgyUAoym/D2ghGizsKSxKtmmXNrApbSLo8AFw1hMVFP39S0uYTXb/A94
 iktb6VQx1SW5yZpCYelxEgCsuW9rRgK9JRQ+4Ko2VPfezIOMhwvtGg3Xwe+Ot2s+iZ
 khx8gL/wWY5Qj9/0/mt5yqIeTQZKfGaRYCa/bL+5AulFtSYmD3s0RFnDjTU3RFNKKf
 eWQYYPq9eK7HQxzGBcU0ZgdCx+zpM+HHnBpdxHHkMqUH2Lg3WrXx8F0pbxGmUg1GPO
 4ODVUOhHiFA8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:42:47 +0100
Message-Id: <DGSDJIG8MASY.1LD0X1CDOWYCN@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] rust: dma: use pointer projection infra for
 `dma_{read, write}` macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-3-gary@kernel.org>
In-Reply-To: <20260302130223.134058-3-gary@kernel.org>
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
X-Rspamd-Queue-Id: 3C5C41DB126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,ffwll.ch,collabora.com,arm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Current `dma_read!`, `dma_write!` macros also use a custom
> `addr_of!()`-based implementation for projecting pointers, which has
> soundness issue as it relies on absence of `Deref` implementation on type=
s.
> It also has a soundness issue where it does not protect against unaligned
> fields (when `#[repr(packed)]` is used) so it can generate misaligned
> accesses.
>
> This commit migrates them to use the general pointer projection
> infrastructure, which handles these cases correctly.
>
> As part of migration, the macro is updated to have an improved surface
> syntax. The current macro have
>
>     dma_read!(a.b.c[d].e.f)
>
> to mean `a.b.c` is a DMA coherent allocation and it should project into i=
t
> with `[d].e.f` and do a read, which is confusing as it makes the indexing
> operator integral to the macro (so it will break if you have an array of
> `CoherentAllocation`, for example).
>
> This also is problematic as we would like to generalize
> `CoherentAllocation` from just slices to arbitrary types.
>
> Make the macro expects `dma_read!(path.to.dma, .path.inside.dma)` as the
> canonical syntax. The index operator is no longer special and is just one
> type of projection (in additional to field projection). Similarly, make
> `dma_write!(path.to.dma, .path.inside.dma, value)` become the canonical
> syntax for writing.
>
> Another issue of the current macro is that it is always fallible. This
> makes sense with existing design of `CoherentAllocation`, but once we
> support fixed size arrays with `CoherentAllocation`, it is desirable to
> have the ability to perform infallible indexing as well, e.g. doing a `[0=
]`
> index of `[Foo; 2]` is okay and can be checked at build-time, so forcing
> falliblity is non-ideal. To capture this, the macro is changed to use
> `[idx]` as infallible projection and `[idx]?` as fallible index projectio=
n
> (those syntax are part of the general projection infra). A benefit of thi=
s
> is that while individual indexing operation may fail, the overall
> read/write operation is not fallible.
>
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  drivers/gpu/nova-core/gsp.rs      |  14 ++--
>  drivers/gpu/nova-core/gsp/boot.rs |   2 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs |  10 ++-
>  rust/kernel/dma.rs                | 114 +++++++++++++-----------------
>  samples/rust/rust_dma.rs          |  30 ++++----
>  5 files changed, 81 insertions(+), 89 deletions(-)
