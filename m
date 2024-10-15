Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E199F0EF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 17:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0198D10E5A1;
	Tue, 15 Oct 2024 15:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ah+u9Blw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4942010E598;
 Tue, 15 Oct 2024 15:22:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4BEB4A431E8;
 Tue, 15 Oct 2024 15:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B9FC4CEC6;
 Tue, 15 Oct 2024 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729005722;
 bh=yVHQVnLXAPgaiT2VfMOI4wCdmR3MlSS3dJqOw76r070=;
 h=From:To:Cc:Subject:Date:From;
 b=Ah+u9BlwEeMsK35/m9vXnwHg5M6rbCCwJT0FOQAOBL1y2lckeGspKXg9+tYfRmY0T
 OGwd0vylfg3ZPeMYfCvtBY6TvbXQMm2r3B8UtLJ/AmqXgL3IntrvKqTYp0f1HrMUEl
 HKT5RhMvWTrJmkAh3ssPnPo7YI/XVHQl+/wFT0qWR3E7HNwX+uq7Sr6ncmdR0XLjGK
 MwUemd1PrPQOUVpyImomxNMLtrDeNBZ3G7cfSDcIPlVaJ+sa29ntuuSbjGeP0c8zsC
 pVmnYjUqLS8wiq9UwfIEL50k7q7lOeacvJmNKxXovuY14/WkK7emdK5hu5Bh6mHbZ+
 5ldYgiA63Z30g==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i915: fix DRM_I915_GVT_KVMGT dependencies
Date: Tue, 15 Oct 2024 15:21:48 +0000
Message-Id: <20241015152157.2955229-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

Depending on x86 and KVM is not enough, as the kvm helper functions
that get called here are controlled by CONFIG_KVM_X86, which is
disabled if both KVM_INTEL and KVM_AMD are turned off.

ERROR: modpost: "kvm_write_track_remove_gfn" [drivers/gpu/drm/i915/kvmgt.ko] undefined!
ERROR: modpost: "kvm_page_track_register_notifier" [drivers/gpu/drm/i915/kvmgt.ko] undefined!
ERROR: modpost: "kvm_page_track_unregister_notifier" [drivers/gpu/drm/i915/kvmgt.ko] undefined!
ERROR: modpost: "kvm_write_track_add_gfn" [drivers/gpu/drm/i915/kvmgt.ko] undefined!

Change the dependency to CONFIG_KVM_X86 instead.

Fixes: ea4290d77bda ("KVM: x86: leave kvm.ko out of the build if no vendor module is requested")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 46301c06d18a..985cb78d8256 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -118,9 +118,8 @@ config DRM_I915_USERPTR
 config DRM_I915_GVT_KVMGT
 	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
 	depends on DRM_I915
-	depends on X86
+	depends on KVM_X86
 	depends on 64BIT
-	depends on KVM
 	depends on VFIO
 	select DRM_I915_GVT
 	select KVM_EXTERNAL_WRITE_TRACKING
-- 
2.39.5

