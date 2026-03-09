Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHlNKMv2rmnZKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0B23CC81
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D11010E55B;
	Mon,  9 Mar 2026 16:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qJypnZvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC4510E558;
 Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7EEA43603;
 Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A517C2BCB1;
 Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773074118;
 bh=Lf/tjBPdlKcD7jrxP5eEotYbP1CD88GOp7ffo4qPdl4=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=qJypnZvqDuuvPI/9HNKX96yrIj5W8JOHoDnuKraZ5hTnn+VfEmTiPbv0ojNT4/B59
 JW23FjLhK83UL3OuvvkIvqIQLmlOW+fo7xere/D4Byy2R2FsNQithXuEo/8/3zBVpB
 Zm+/eABRZJw5giIvS8QhAf9BYlO9lwjoTjx4mu8SEAX68qPDqDImKJD+oD2jl12vzG
 ZPdf4pdCGvfVPm3fOkuBcWMgm9PNPjOdSe/QyvYtr1sdLrb4+pHyOHHvAeguu2VvLL
 kShyRrDjBVsoHe8sadvaBULOq3XPKaZWTtH8NJ/nHZc0+9evQ8+0DpdsIUr6bgQ3Gf
 Z0VtBq0C8/2jA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6E316F41811;
 Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Subject: [PATCH v4 0/4] Fixes the stack overflow
Date: Mon, 09 Mar 2026 12:34:17 -0400
Message-Id: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMsQ6DIBSF4VcxzKWBi0rp1PdoOqBcK4NogBIb4
 7sXnYxJx3OS719IQG8xkHuxEI/JBju6PMpLQdpeuzdSa/ImwKBmwIEaP1D/CZE6nCNtsFGgEZW
 RFclm8tjZee89X3n3NsTRf/d84tv7r5Q45bRkSqhbwwFr/pj8GEd3HZBspQRHLc4astaaqbKTN
 wlcn7U4annWImuFElXVVkqa9qjXdf0BSCj97iYBAAA=
X-Change-ID: 20260212-drm-rust-next-beb92aee9d75
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Boqun Feng <boqun@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev, 
 Tim Kovalenko <tim.kovalenko@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=1907;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=ur3mma4izM+B5GojZDmfk652EPp1d2EJADISR8mbwE0=;
 b=H3g4pztXItI93AFUT5bJEqqHh4yK27wA5nyBvGNWYTZ5xmzc0yEOXNpfRQ0CgA/5ymjpVGqFG
 fbcO1cz35oUA5sAonNIeYEaK47bnSFhPuWvMK5hzWiftvd8WbwGMrlU
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
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
Reply-To: tim.kovalenko@proton.me
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 06E0B23CC81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[tim.kovalenko.proton.me];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[tim.kovalenko@proton.me];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


---
Changes in v4:
- Rebase on top of projection changes
- Use index projection when writing PTEs
- Keep PteArray, as discussed in V2, and move entry calculation there
- Avoid stack allocation by writing PTEs directly to DMA memory

- Link to v3: https://lore.kernel.org/r/20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me

Changes in v3:
- Addressed the comments and re-instated the PteArray type.
- PteArray now uses `init` instead of `new` where it writes to `self`
  page by page.
- PteArray just needs a pte pointer obtained from the `gsp_mem.as_slice_mut`.

I hope I understood everything in the V2 email chain and implemented it correctly :)

- Link to v2: https://lore.kernel.org/r/20260213-drm-rust-next-v2-1-aa094f78721a@proton.me

Changes in v2:
- Missed a code formatting issue.
- Link to v1: https://lore.kernel.org/r/20260212-drm-rust-next-v1-1-409398b12e61@proton.me

---
Gary Guo (3):
      rust: ptr: add `KnownSize` trait to support DST size info extraction
      rust: ptr: add projection infrastructure
      rust: dma: use pointer projection infra for `dma_{read,write}` macro

Tim Kovalenko (1):
      gpu: nova-core: fix stack overflow in GSP memory allocation

 drivers/gpu/nova-core/gsp.rs      |  48 ++++---
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  23 ++-
 rust/kernel/dma.rs                | 114 +++++++--------
 rust/kernel/lib.rs                |   4 +
 rust/kernel/ptr.rs                |  30 +++-
 rust/kernel/ptr/projection.rs     | 294 ++++++++++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs          |  30 ++--
 scripts/Makefile.build            |   4 +-
 9 files changed, 443 insertions(+), 106 deletions(-)
---
base-commit: dd8a93dafe6ef50b49d2a7b44862264d74a7aafa
change-id: 20260212-drm-rust-next-beb92aee9d75

Best regards,
-- 
Tim Kovalenko <tim.kovalenko@proton.me>


