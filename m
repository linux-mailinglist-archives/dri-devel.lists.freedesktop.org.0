Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85CC6B9B4D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C11D10E00A;
	Tue, 14 Mar 2023 16:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DF910E00A;
 Tue, 14 Mar 2023 16:25:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F587B81A3E;
 Tue, 14 Mar 2023 16:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FAEC433D2;
 Tue, 14 Mar 2023 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678811130;
 bh=8ETbXH3HFRhnrmoJeOc1AT/DX/Eah23kheU2y3YZMo0=;
 h=From:To:Cc:Subject:Date:From;
 b=PECFkUwV2Ep2p0qVUg63V6DKWrMXMyZlGOZv4TaWkdfT4K32sstERsij1UHwLjkVH
 0VNeQJKLBEO6nD5AbKWHZAPz7uQ3dVIFdXDzbXixTovR6+6jXvqp3RNSuPiDqpqHCg
 nfvmOH0guBqmee0MqDPz6JPHy7vTlLqs19yvq7aQJDuZu/uLYwZMug8A01zoq2555L
 Ild06qHasXF534xPGGZSXSwaY+uTIpuYYRM4tDMtnHStlKCMap5Od4vUeBKBi1fXwD
 tWEKJN3pCGX/RGg/pYQ1lL3UOYg35CK1gOvOQnxvpvyk7gD0q0WbfatJ68KZasBFeL
 Rd9ioyHIfpyBQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Imre Deak <imre.deak@intel.com>
Subject: [PATCH] drm/i915/opregion: add missing intel_opregion_cleanup() dummy
Date: Tue, 14 Mar 2023 17:25:18 +0100
Message-Id: <20230314162523.631652-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When ACPI is disabled, i915 fails to build because of a missing
declaration:

drivers/gpu/drm/i915/i915_driver.c: In function 'i915_driver_hw_probe':
drivers/gpu/drm/i915/i915_driver.c:556:9: error: implicit declaration of function 'intel_opregion_cleanup'; did you mean 'intel_opregion_setup'? [-Werror=implicit-function-declaration]
  556 |         intel_opregion_cleanup(dev_priv);

Add another empty dummy helper next to intel_opregion_setup().

Fixes: 3e226e4a2180 ("drm/i915/opregion: Cleanup opregion after errors during driver loading")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/display/intel_opregion.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 181eb3e9abbf..fd2ea8ef0fa2 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.h
+++ b/drivers/gpu/drm/i915/display/intel_opregion.h
@@ -86,6 +86,10 @@ static inline int intel_opregion_setup(struct drm_i915_private *dev_priv)
 	return 0;
 }
 
+static inline void intel_opregion_cleanup(struct drm_i915_private *i915)
+{
+}
+
 static inline void intel_opregion_register(struct drm_i915_private *dev_priv)
 {
 }
-- 
2.39.2

