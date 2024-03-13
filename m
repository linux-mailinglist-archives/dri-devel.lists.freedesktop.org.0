Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992BB87A436
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 09:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2E410F0CD;
	Wed, 13 Mar 2024 08:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W1Jk2b1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A9E10E87F;
 Wed, 13 Mar 2024 08:47:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3CFDBCE1A80;
 Wed, 13 Mar 2024 08:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF25C433F1;
 Wed, 13 Mar 2024 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710319662;
 bh=DOtrx5taZpCaGGzBrVh7vSdllhCDtiQSs7F4mlLOxMk=;
 h=From:To:Cc:Subject:Date:From;
 b=W1Jk2b1GyJrAyokLXa1F9I9wi/qsE+mo1ksbL6UFjdrfHuvfEP4CIgxksyVWQrCkQ
 Qh8Ul/pEFsLrggxR1JNsVsHqjSP3ULjZeQikNqwib4IJGZR9Q723bitsvIVKcp04wp
 U57zdK9hhIpvQdoc4nTCIgdYzBmcDECQOfZC5Tb1WjWR5hErjTGl7eD6F8BI34b1AH
 UnMr+q+J7MVCWt/p4kv9wQrwUFhSekLOv3vt90tli/2NUcDWKjnTyEfqpYbMJ5DwDs
 ERspbYZZgM61PI5Yo+MCUaSzO2ZAhw7TgVvWQ8E3xp9sN3w6oKkBG1cZHx5H+lcBgZ
 d1HyZK9qZK69g==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Imre Deak <imre.deak@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: add intel_opregion_vbt_present() stub function
Date: Wed, 13 Mar 2024 09:47:26 +0100
Message-Id: <20240313084735.3305424-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The newly added function is not available without CONFIG_ACPI, causing
a build failure:

drivers/gpu/drm/i915/display/intel_bios.c:3424:24: error: implicit declaration of function 'intel_opregion_vbt_present'; did you mean 'intel_opregion_asle_present'? [-Werror=implicit-function-declaration]

Add an empty stub in the same place as the other stubs.

Fixes: 9d9bb71f3e11 ("drm/i915: Extract opregion vbt presence check")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/display/intel_opregion.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 63573c38d735..4b2b8e752632 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.h
+++ b/drivers/gpu/drm/i915/display/intel_opregion.h
@@ -120,6 +120,11 @@ intel_opregion_get_edid(struct intel_connector *connector)
 	return NULL;
 }
 
+static inline bool intel_opregion_vbt_present(struct drm_i915_private *i915)
+{
+	return false;
+}
+
 static inline const void *
 intel_opregion_get_vbt(struct drm_i915_private *i915, size_t *size)
 {
-- 
2.39.2

