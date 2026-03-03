Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAD8N/0Kp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6361F3AC8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7510E852;
	Tue,  3 Mar 2026 16:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D20tbfkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FD810E852;
 Tue,  3 Mar 2026 16:23:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3A784094A;
 Tue,  3 Mar 2026 16:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFDCC116C6;
 Tue,  3 Mar 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772555001;
 bh=LZhImWuMkU3twctJXiYSMBdRdlQpQCpIy5sEVsTJsPs=;
 h=From:To:Cc:Subject:Date:From;
 b=D20tbfkk1xkCPRKVfaRXdyuOyGZz1o7Ue+wpoIv/a6AGFcACdSsZvjdOlt1lRKfvQ
 Fe3wXKViyuY0H0RA4uCFyoshov8odkRYxqGBg6EyzRcLNkQkE62kddf6fOzsSazMem
 brjQS63XriSXH5R6skF56yLgRCVC3chPWIzCc4uSzDmAgW/FvZyq5qIWrcVANTNJpF
 /se/9Zm9lyHKpYaz1ydAdzgPugtxASifjrH6Dik2pVK49p7RiUaPnPw8oSN7K9fUsA
 omOYTIt2mxuY90G9aG8rA2AXkPg/ApM3+L+tq2V0xb0gIslnkFmktJEWz/zRjtDljD
 opvtQUPsw7HYw==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
Date: Tue,  3 Mar 2026 17:22:51 +0100
Message-ID: <20260303162314.94363-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 7C6361F3AC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[google.com,nvidia.com,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,collabora.com,arm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This patch series introduces the dma::Coherent API Gary worked out in the
context of his I/O projection work.

Additionally, introduce dma::CoherentInit, a type that encapsulates a
dma::Coherent object before its DMA address is exposed to the device.
dma::CoherentInit can guarantee exclusive access to the inner dma::Coherent
object and implement Deref and DerefMut.

Also add Coherent::init() and Coherent::init_with_attrs() so we can directly
initialize a new dma::Coherent object through an impl Init<T, E>.

Danilo Krummrich (5):
  rust: dma: use "kernel vertical" style for imports
  rust: dma: introduce dma::CoherentInit for memory initialization
  rust: dma: add Coherent:init() and Coherent::init_with_attrs()
  gpu: nova-core: use Coherent::init to initialize GspFwWprMeta
  gpu: nova-core: convert Gsp::new() to use CoherentInit

Gary Guo (3):
  rust: dma: add generalized container for types other than slices
  rust: dma: add zeroed constructor to `Coherent`
  gpu: nova-core: convert to new dma::Coherent API

 drivers/gpu/nova-core/dma.rs      |  19 +-
 drivers/gpu/nova-core/falcon.rs   |   7 +-
 drivers/gpu/nova-core/firmware.rs |  10 +-
 drivers/gpu/nova-core/gsp.rs      |  65 ++--
 drivers/gpu/nova-core/gsp/boot.rs |   7 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  55 +--
 drivers/gpu/nova-core/gsp/fw.rs   |  82 ++--
 rust/kernel/device.rs             |   4 +-
 rust/kernel/dma.rs                | 626 +++++++++++++++++++++++-------
 samples/rust/rust_dma.rs          |   8 +-
 10 files changed, 619 insertions(+), 264 deletions(-)


base-commit: 1195fcbda62f12108dc9be56fa4173897905b90c
-- 
2.53.0

