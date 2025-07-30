Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C9B16100
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5E610E6A7;
	Wed, 30 Jul 2025 13:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nE40kn1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2855810E69F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:07:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 904DA6113A;
 Wed, 30 Jul 2025 13:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F4EC4CEE7;
 Wed, 30 Jul 2025 13:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753880862;
 bh=MCKKk6h+3JEL6n0iy6Y6XeM4Z1b+uuvj/oVkrOFjj0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nE40kn1E8vb+JirYTULptewIKmCOOzLFKQ5jEk+yfgBr6ztVyn/NoeuR1ILlTa4Cr
 fE5XI/0rzTwnq9mwzDiKbJAH6mjXRGSO517gT0Dg5+AfnE+ejH0gPzwpz7lD/RlM60
 fuDYO46LUk/zUcdpgT2Ez8GYxOdB5mCuckXrVCVmJVQFRYAHNRMv+Et0CrLcc9orXl
 L/q9YLIRSxKneEYQ34nJNOofcr6VTvDYcQ6XTbE56qXa/Yn63ShYu9FjTx2L0dAJFz
 cBG34Jst6PN7joglvLDSr8oCB/ToSyE3THMRd2h8WB6SADGPSVwTPWnL9Ra5tyC9w1
 NlqVL4zWIt+rQ==
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
 patches@lists.linux.dev, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH 3/3] rust: warn if `srctree/` links do not exist
Date: Wed, 30 Jul 2025 15:07:16 +0200
Message-ID: <20250730130716.3278285-4-ojeda@kernel.org>
In-Reply-To: <20250730130716.3278285-1-ojeda@kernel.org>
References: <20250730130716.3278285-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

`srctree/` links may point to nonexistent files, e.g. due to renames
that missed to update the files or simply because of typos.

Since they can be easily checked for validity, do so and print a warning
in the file does not exist.

This found the following cases already in-tree:

    warning: srctree/ link to include/linux/blk_mq.h does not exist
    warning: srctree/ link to include/linux/drm/drm_gem.h does not exist
    warning: srctree/ link to include/linux/drm/drm_drv.h does not exist
    warning: srctree/ link to include/linux/drm/drm_ioctl.h does not exist
    warning: srctree/ link to include/linux/drm/drm_file.h does not exist
    warning: srctree/ link to include/linux/drm/drm_device.h does not exist

Inspired-by: "Onur Özkan" <work@onurozkan.dev>
Link: https://lore.kernel.org/rust-for-linux/CANiq72=xCYA7z7_rxpzzKkkhJs6m7L_xEaLMuArVn3ZAcyeHdA@mail.gmail.com/
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 4e675d210dd8..a27503028216 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -93,6 +93,12 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 # and then retouch the generated files.
 rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
     rustdoc-kernel rustdoc-pin_init
+	$(Q)grep -Ehro '<a href="srctree/([^"]+)"' $(rustdoc_output) | \
+		cut -d'"' -f2 | cut -d/ -f2- | while read f; do \
+			if [ ! -e "$(srctree)/$$f" ]; then \
+				echo "warning: srctree/ link to $$f does not exist"; \
+			fi \
+		done
 	$(Q)cp $(srctree)/Documentation/images/logo.svg $(rustdoc_output)/static.files/
 	$(Q)cp $(srctree)/Documentation/images/COPYING-logo $(rustdoc_output)/static.files/
 	$(Q)find $(rustdoc_output) -name '*.html' -type f -print0 | xargs -0 sed -Ei \
-- 
2.50.1

