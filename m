Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA798585358
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA4110E230;
	Fri, 29 Jul 2022 16:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FDE10E0C3;
 Fri, 29 Jul 2022 16:16:22 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 75C4D6601B83;
 Fri, 29 Jul 2022 17:16:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659111381;
 bh=f+d7THDJrdn1CISodtLhjzIHNGshaLdcJ4RQdQedI/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hj5rYWA/UeHfWgonZXB3vKBC2x8DVRptC3hGAgIJGmKZ6X2+zXdQz8gi/0XfNuYTm
 +JKJc5ra/0RCHaKY5a3UD83XDczCzsPZY3xVcFI3GNFMD+To7y0p1FCpUZ7byjPiHF
 ai0JwQaEs5P6PTf/9UM9zdEcMquruQ2WLuXgwH2RxPC5XNjFMA4AkImCfqfbwneeNz
 6X2qFVlBYIZwP+ELCqAjpuEwBpFRVJTOOafcvWT3Y+dmEqhzYB4SkH5FJLsYhliSeu
 c32MCuqrAEVLtx70mNuKYmaU1ZWZzTS08P1FLdw2k/xFNbfoxUo1Jj1qRh/rWAhtzG
 mR8YU/hLZTZag==
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Change semantics of context isolation reporting
 to UM
Date: Fri, 29 Jul 2022 17:16:11 +0100
Message-Id: <20220729161612.2212512-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220729161612.2212512-1-adrian.larumbe@collabora.com>
References: <20220729161612.2212512-1-adrian.larumbe@collabora.com>
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
Cc: bob.beckett@collabora.com, adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I915_PARAM_HAS_CONTEXT_ISOLATION was already being used as a boolean by
both Iris and Vulkan , and stood for the guarantee that, when creating a
new context, it would not contain register state from preexisting ones.

However, the actual param ioctl was returning a bitmask for the
engines in which isolation is supported, and IGT gem_ctx_isolation was
exploiting this wrong semantics when making decisions about which
engines support it.

This is a uAPI documentation change that precedes the actual change in
the getparam ioctl.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
---
 include/uapi/drm/i915_drm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 094f6e377793..09adb7ea01d1 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -692,10 +692,6 @@ typedef struct drm_i915_irq_wait {
  * supports) that all state set by this context will not leak to any other
  * context.
  *
- * As not every engine across every gen support contexts, the returned
- * value reports the support of context isolation for individual engines by
- * returning a bitmask of each engine class set to true if that class supports
- * isolation.
  */
 #define I915_PARAM_HAS_CONTEXT_ISOLATION 50
 
-- 
2.37.0

