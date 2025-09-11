Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C8B53D1E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 22:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2410EB85;
	Thu, 11 Sep 2025 20:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PVjxgDun";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9147B10EB85
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 20:24:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2FF6A43491;
 Thu, 11 Sep 2025 20:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2ECC4CEF0;
 Thu, 11 Sep 2025 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757622299;
 bh=22VCHFy4KNRQGaf9uaDJFhGbMiUhnhRsXF9X0lLDmRI=;
 h=From:Date:Subject:To:Cc:From;
 b=PVjxgDun/nBFFjYBgdawOyp86YFHQXxV7QXbbULLBIZ4dVAZyDxSRoVim2nsg8CTT
 g0KfqpySU62vHHbKSJzDwcgSU4VxJj9tAV2pBHM48YIweNtWHs7COz7qGmFzsqowP2
 K6FhR8PZpR8Jiv/srq5SZ058rvCCEWjNGr5MKmq3xlXRbTHXHHgxKgHkjfi+dlPlz5
 1XV6sjI97eyPAHPoBLv84ORmTNif1Wfni6sQRYhqUh+gE1nYJCDnf2AeIUg/CLfceI
 aMFuBBxmWs53YI/9a+dB+0E+mRsoHMFK/vJMIK1TyNILII18Yfdjq0Azw6+MSlG2PB
 vWuF9N3uWEX5Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 11 Sep 2025 13:24:42 -0700
Subject: [PATCH] drm/omap: Mark dispc_save_context() with
 noinline_for_stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-omapdrm-reduce-clang-stack-usage-pt-2-v1-1-5ab6b5d34760@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAkww2gC/x2NQQrCQAwAv1JyNtBdUYhfEQ/pbtSgbZekFaH07
 waPA8PMBi6m4nDpNjD5qOs8BaRDB+XJ00NQazDkPp96SgnnkVu1EU3qWgTLOyT0hcsLV+fw24I
 ZiYmF8vk4UIJoNZO7fv+f623ffw0tGOF3AAAA
X-Change-ID: 20250911-omapdrm-reduce-clang-stack-usage-pt-2-9a9ae9263b91
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203; i=nathan@kernel.org;
 h=from:subject:message-id; bh=22VCHFy4KNRQGaf9uaDJFhGbMiUhnhRsXF9X0lLDmRI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmHDST8z4jMDLDKfqKZ6vBvynr32y9bzK3mme6InOd85
 +k5d32ejlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARdS9GhgVOCW4v/t60St8+
 NeW7U4G//nfmnwFOe8NXZ8ibBu61XcrwvySlpq1a2Ktwj5vr368PFx2S9t0+f9oSvihNOY0rwdL
 B/AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

A recent innocuous internal optimization change in LLVM [1] causes the
same issue that necessitated commit 660942f2441d ("drm: omapdrm: reduce
clang stack usage") to occur in dispc_runtime_suspend() from inlinling
dispc_save_context().

  drivers/gpu/drm/omapdrm/dss/dispc.c:4720:27: error: stack frame size (2272) exceeds limit (2048) in 'dispc_runtime_suspend' [-Werror,-Wframe-larger-than]
   4720 | static __maybe_unused int dispc_runtime_suspend(struct device *dev)
        |                           ^

There is an unfortunate interaction between the inner loops of
dispc_save_context() getting unrolled and the calculation of the index
into the ctx array being spilled to the stack when sanitizers are
enabled [2].

While this should obviously be addressed on the LLVM side, such a fix
may not be easy to craft and it is simple enough to work around the
issue in the same manner as before by marking dispc_save_context() with
noinline_for_stack, which makes it use the same amount of stack as
dispc_restore_context() does after the same change.

Cc: stable@vger.kernel.org
Link: https://github.com/llvm/llvm-project/commit/055bfc027141bbfafd51fb43f5ab81ba3b480649 [1]
Link: https://llvm.org/pr143908 [2]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index cf055815077cffad554a4ae58cfd7b81edcbb0d4..d079f557c8f24d1afd0bc182edd13165cb9c356c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -417,7 +417,7 @@ static bool dispc_has_feature(struct dispc_device *dispc,
 #define RR(dispc, reg) \
 	dispc_write_reg(dispc, DISPC_##reg, dispc->ctx[DISPC_##reg / sizeof(u32)])
 
-static void dispc_save_context(struct dispc_device *dispc)
+static noinline_for_stack void dispc_save_context(struct dispc_device *dispc)
 {
 	int i, j;
 

---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250911-omapdrm-reduce-clang-stack-usage-pt-2-9a9ae9263b91

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

