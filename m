Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1BC3024E8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 13:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374BE8997A;
	Mon, 25 Jan 2021 12:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC94D8997A;
 Mon, 25 Jan 2021 12:26:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40D462310A;
 Mon, 25 Jan 2021 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611577615;
 bh=A+0Js7aEmvCEqlxCd8cHbZodFFgw/k9Df4K9Dm9wPII=;
 h=From:To:Cc:Subject:Date:From;
 b=Ib3D0YrzD1CUR5but9zvYwxIeND0+tWbU7jxbm/1mcLUF54N6XWKhH/QWeLYd14eR
 6mm8rR+Ya5w0KhD8rluz6fxb5crom4FcSVUwf5GzyiZy1OCsUzMLR0VUJKlhtPpVCW
 oTY15YVVMfDLujC/oOVsfC2a16GF+byZOa7nAHdgrs5XGoz2tFMtVi2c5wd1PpH5n3
 wmUweYibZ3wHr/+RgSOhQ3dAIRIsLzdC6y60U7SvMyoK94yyaG6nReuGCrobXrmDh8
 7M0+XvAPbLrJ1uEOkB4DPubqCwreOPyNmsnpn7euYkWRMRlj2zFmuIdbsX6aUqB5pP
 0yd5+fM8vlDzA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] i915: Fix DRM_I915_WERROR dependencies
Date: Mon, 25 Jan 2021 13:26:44 +0100
Message-Id: <20210125122650.4178417-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

CONFIG_DRM_I915_DEBUG now selects CONFIG_DRM_I915_WERROR, but fails
to honor its dependencies:

WARNING: unmet direct dependencies detected for DRM_I915_WERROR
  Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=y]
  Selected by [m]:
  - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && EXPERT [=y] && DRM_I915 [=m]

Change the 'select' to a conditional one that doesn't trigger -Werror
warnings for allmodconfig builds and other compile tests.

Fixes: 4f86975f539d ("drm/i915: Add DEBUG_GEM to the recommended CI config")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/Kconfig.debug | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index be76054c01d8..97793b28d007 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -31,9 +31,9 @@ config DRM_I915_DEBUG
 	select DRM_DEBUG_SELFTEST
 	select DMABUF_SELFTESTS
 	select SW_SYNC # signaling validation framework (igt/syncobj*)
-	select DRM_I915_WERROR
-	select DRM_I915_DEBUG_GEM
-	select DRM_I915_DEBUG_GEM_ONCE
+	select DRM_I915_WERROR if !COMPILE_TEST
+	select DRM_I915_DEBUG_GEM if !COMPILE_TEST
+	select DRM_I915_DEBUG_GEM_ONCE if !COMPILE_TEST
 	select DRM_I915_DEBUG_MMIO
 	select DRM_I915_DEBUG_RUNTIME_PM
 	select DRM_I915_SW_FENCE_DEBUG_OBJECTS
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
