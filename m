Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FCB160FD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE96610E683;
	Wed, 30 Jul 2025 13:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DR8jBGJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2810E683
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:07:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C8F7B4186B;
 Wed, 30 Jul 2025 13:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2909BC4CEF6;
 Wed, 30 Jul 2025 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753880852;
 bh=pxUeJv29yRg6Dx7iPk1Ji2QVfn9F9xAJgdgxpSSJiqw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DR8jBGJ/KsozFTtd9LNrKeQK8dpxYwyg23wiKvPFMDGFGh9C+74tsr8/hoz6iPAc1
 IYwmcYgd7iqjpW31MV/H9gXtTZhYlVTNcBEwi2IwBCUo5Je61Eq2lmojumgMx8naZo
 mbWQXxTK8AdmZSpTZ83ddmdURTVIsBGmEFEw5Jb8lRGtdqipQmV2dsq19tydBFyUCp
 N2MnJueXLfT8wKpdwyJpM/AoSgkFrnu960kO1YNF+evu6MwJNVI17l2vbvfDPg2Zdj
 URVvZ3aUYG/E8LeumNfLjBnV3HZpUhzzVAJtf917AiTzfJiYaEM3Oe8ahkClNZMhna
 O5RyRRymlOHuw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: [PATCH 1/3] rust: block: fix `srctree/` links
Date: Wed, 30 Jul 2025 15:07:14 +0200
Message-ID: <20250730130716.3278285-2-ojeda@kernel.org>
In-Reply-To: <20250730130716.3278285-1-ojeda@kernel.org>
References: <20250730130716.3278285-1-ojeda@kernel.org>
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

This `srctree/` link pointed to a file with an underscore, but the header
used a dash instead.

Thus fix it.

This cleans a future warning that will check our `srctree/` links.

Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/block/mq/gen_disk.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index cd54cd64ea88..e1af0fa302a3 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -3,7 +3,7 @@
 //! Generic disk abstraction.
 //!
 //! C header: [`include/linux/blkdev.h`](srctree/include/linux/blkdev.h)
-//! C header: [`include/linux/blk_mq.h`](srctree/include/linux/blk_mq.h)
+//! C header: [`include/linux/blk-mq.h`](srctree/include/linux/blk-mq.h)
 
 use crate::block::mq::{raw_writer::RawWriter, Operations, TagSet};
 use crate::{bindings, error::from_err_ptr, error::Result, sync::Arc};
-- 
2.50.1

