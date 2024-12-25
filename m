Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718719FC634
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 18:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBD110E051;
	Wed, 25 Dec 2024 17:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="rbBQq3hs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ABF10E051;
 Wed, 25 Dec 2024 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=dfvfLNjykdYWKlzXMF+mOHOTts53mx0nlkDrwH+6+HA=; b=rbBQq3hs2FBsKA+n
 Kq92jd4hcIyvSxzIuQER0jgz4/GyR+7yvDeFpruR+gVLNK52ybbgCznpZTAHYuO49UNCcVK8sAnXI
 c3+XR0dn1c3yv7oUUEf+AfVDoNSgWxtOj29idEt18TlhQBskPtTegq1zfqfZXiBJ1D4//L/bs43BV
 3/jQd+OgJuj0sf6PjFr+4+0tKJpLXDwaNHqsurvKhAuUsi0y8GxoNWamF43At9zGkwOYh8//zXfM4
 65V7lNITRGy/gxxy9HHTk9sstVvygsd7y1VCgypDQW/u05S5QZemwiDyvnrxY5Nbz4wjbQi/TRRL6
 qxyLr5Fw/EwyrXWQLA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tQVWN-0078Iy-1u;
 Wed, 25 Dec 2024 17:50:11 +0000
From: linux@treblig.org
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net
Cc: x86@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] x86/platform/iosf_mbi: Remove unused
 iosf_mbi_unregister_pmic_bus_access_notifier
Date: Wed, 25 Dec 2024 17:50:10 +0000
Message-ID: <20241225175010.91783-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
removed in 2017 by
commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
intel_uncore_forcewake_reset()")

Remove it.

Note the '_unlocked' version is still used.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/x86/include/asm/iosf_mbi.h      |  7 -------
 arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
 drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
 3 files changed, 26 deletions(-)

diff --git a/arch/x86/include/asm/iosf_mbi.h b/arch/x86/include/asm/iosf_mbi.h
index af7541c11821..8ace6559d399 100644
--- a/arch/x86/include/asm/iosf_mbi.h
+++ b/arch/x86/include/asm/iosf_mbi.h
@@ -167,13 +167,6 @@ void iosf_mbi_unblock_punit_i2c_access(void);
  */
 int iosf_mbi_register_pmic_bus_access_notifier(struct notifier_block *nb);
 
-/**
- * iosf_mbi_register_pmic_bus_access_notifier - Unregister PMIC bus notifier
- *
- * @nb: notifier_block to unregister
- */
-int iosf_mbi_unregister_pmic_bus_access_notifier(struct notifier_block *nb);
-
 /**
  * iosf_mbi_unregister_pmic_bus_access_notifier_unlocked - Unregister PMIC bus
  *                                                         notifier, unlocked
diff --git a/arch/x86/platform/intel/iosf_mbi.c b/arch/x86/platform/intel/iosf_mbi.c
index c81cea208c2c..40ae94db20d8 100644
--- a/arch/x86/platform/intel/iosf_mbi.c
+++ b/arch/x86/platform/intel/iosf_mbi.c
@@ -422,19 +422,6 @@ int iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(
 }
 EXPORT_SYMBOL(iosf_mbi_unregister_pmic_bus_access_notifier_unlocked);
 
-int iosf_mbi_unregister_pmic_bus_access_notifier(struct notifier_block *nb)
-{
-	int ret;
-
-	/* Wait for the bus to go inactive before unregistering */
-	iosf_mbi_punit_acquire();
-	ret = iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(nb);
-	iosf_mbi_punit_release();
-
-	return ret;
-}
-EXPORT_SYMBOL(iosf_mbi_unregister_pmic_bus_access_notifier);
-
 void iosf_mbi_assert_punit_acquired(void)
 {
 	WARN_ON(iosf_mbi_pmic_punit_access_count == 0);
diff --git a/drivers/gpu/drm/i915/i915_iosf_mbi.h b/drivers/gpu/drm/i915/i915_iosf_mbi.h
index 8f81b7603d37..317075d0da4e 100644
--- a/drivers/gpu/drm/i915/i915_iosf_mbi.h
+++ b/drivers/gpu/drm/i915/i915_iosf_mbi.h
@@ -31,12 +31,6 @@ iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(struct notifier_block *nb)
 {
 	return 0;
 }
-
-static inline
-int iosf_mbi_unregister_pmic_bus_access_notifier(struct notifier_block *nb)
-{
-	return 0;
-}
 #endif
 
 #endif /* __I915_IOSF_MBI_H__ */
-- 
2.47.1

