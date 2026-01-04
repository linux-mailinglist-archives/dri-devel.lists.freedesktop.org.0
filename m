Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C09CF144E
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 21:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034910E144;
	Sun,  4 Jan 2026 20:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="x14QqdR9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Az0cM8+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304BF10E144;
 Sun,  4 Jan 2026 20:07:53 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dkpPz5Mm4z9sRx;
 Sun,  4 Jan 2026 21:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767557271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DNwow4zGS5q5nEsWZgBUSojMm2OQeFgBtCWL1XzC0vw=;
 b=x14QqdR9pfKE2hTG30e+TnnJ9uau1B1BjmSXUpGsgqj9wGo5EvXh3MXoHZbhgViqIv5ORk
 Gl7n4OBE5a+D5FxlVKa2BMwr/CAFe5sdGr1utts596XPapmhvUwsED3s3OTcDJRi7g05NK
 1A3pWGKrkVLlPuCzSvo3EXzCfv51mKoSAc8SXT7bdw+ZP3UG4wt4gmvh9wWfqHIjk/nay+
 vN3keYlxWxKEgP2X94zw/K/WOPnLs17463NCl3aZyK7sGnhOwTlwpp93EoTkbM5mnaBwRv
 1FbRRnM8seDhn9a5VAHXCj1MBr/xWtQ5STwKusmiw94GJYjBnnmVkBG+Y4j9Cg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Az0cM8+H;
 spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767557269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DNwow4zGS5q5nEsWZgBUSojMm2OQeFgBtCWL1XzC0vw=;
 b=Az0cM8+H5pkJByTJQ2wCN9Y1s5Y5YB8cUoHZhfkWg4fvdwHf713i5OQWsUxwfkBnK96v16
 K7vruRWr3JIeigd+YKD5BZwuwENfbEcGw/E6lK+uRfqs+Xsjpv3w2Z0usjBvNzKFu/1hEw
 B9TRXeN+kS2S/IXGNvLsgNuuoArgyeurdV0bJtIfH399A9HIWaTzldvlTffuC0fIpGLfi1
 efKDae/7X8FLov28M213cI4UxfH6F0kevZNHmk9AFaHDny6Vzl1jPlVVFmgOVpp6yJ6Y+X
 0VsJkTj0aGAQ5Z8VXgpImkzwvpw2vSQaGdM9bqGhUFPW3bZjjx6bUgbrPHf3lQ==
To: dakr@kernel.org
Cc: aliceryhl@google.com, acourbot@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, mhi@mailbox.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] rust: macros: Add derive Display for enums
Date: Sun,  4 Jan 2026 21:07:30 +0100
Message-ID: <20260104200733.190494-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xgh8nq3xjtogenp3g76r4aephjsgq4t5
X-MBO-RS-ID: 4904cf6874f2f5a9645
X-Rspamd-Queue-Id: 4dkpPz5Mm4z9sRx
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

This patch series adds a derive macro for implementing kernel::fmt::Display
on enums using the syn crate, and then applies it to the Chipset enum in
the nova-core driver.

Maurice Hieronymus (2):
  rust: macros: Add derive Display for enums
  gpu: nova-core: Use derive Display for Chipset enum

 drivers/gpu/nova-core/gpu.rs | 17 ++----------
 rust/macros/display.rs       | 52 ++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs           | 42 +++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 15 deletions(-)
 create mode 100644 rust/macros/display.rs

---
v1: https://lore.kernel.org/all/20260101184137.80445-1-mhi@mailbox.org/

Changes since v1:
- Instead of using the name() method with lowercase strings, implement
  a proper derive macro using syn as suggested by the reviewer
- The derive macro outputs the exact variant name as written
  (case-preserved)
- Supports all enum variant types: unit, tuple, and struct variants

base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
-- 
2.51.2

