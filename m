Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC56B809C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 19:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE58E10E5FA;
	Mon, 13 Mar 2023 18:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A510E143;
 Mon, 13 Mar 2023 18:30:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5E166147C;
 Mon, 13 Mar 2023 18:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1439C433D2;
 Mon, 13 Mar 2023 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678732254;
 bh=xXfHOtpB42Nc5WnZyQQpmBHFWLUExBdm6jawq0Jm084=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0FMXy6Knts0+zZgypoJ0GS2NVaLO5tLbDYgKvXx7LMo+bv1jhAWytcutb/BiI1vmD
 yBEXUeCTIezUvb7qFu7X1zL/BBLS5n8X+R2ydR39/TuRmUuIlR6blTMiIf1xBYy5xQ
 19+sdyeK0HrYZKr/HzYzLfOdhn58D730PvNR5Cdo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 30/36] drm/i915/huc: use const struct bus_type pointers
Date: Mon, 13 Mar 2023 19:29:12 +0100
Message-Id: <20230313182918.1312597-30-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
References: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=xXfHOtpB42Nc5WnZyQQpmBHFWLUExBdm6jawq0Jm084=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDCn82dUOV8LkZs1rW1FbEZ2+du0D7wfbfUpebF2pHn7h+
 5lpjir1HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARsTcM82y+VjUWN7TzOscl
 xYtl2WzK7ZLcwbDg8GWOaEHppcYb97/63/6QcaXxlcd/AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Tony Ye <tony.ye@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct bus_type pointers in the functions
intel_huc_register_gsc_notifier() and
intel_huc_unregister_gsc_notifier() should be a const pointer, as the
structure is not modified anywhere in the functions, and the pointer
they are passed will be a const * in the near future.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Note, this is a patch that is a prepatory cleanup as part of a larger
series of patches that is working on resolving some old driver core
design mistakes.  It will build and apply cleanly on top of 6.3-rc2 on
its own, but I'd prefer if I could take it through my driver-core tree
so that the driver core changes can be taken through there for 6.4-rc1.

 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 410905da8e97..8b453bd7c953 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -183,7 +183,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
 	return 0;
 }
 
-void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus)
+void intel_huc_register_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus)
 {
 	int ret;
 
@@ -200,7 +200,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
 	}
 }
 
-void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus)
+void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus)
 {
 	if (!huc->delayed_load.nb.notifier_call)
 		return;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
index 52db03620c60..05d4832f8461 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
@@ -51,8 +51,8 @@ int intel_huc_check_status(struct intel_huc *huc);
 void intel_huc_update_auth_status(struct intel_huc *huc);
 bool intel_huc_is_authenticated(struct intel_huc *huc);
 
-void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
-void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
+void intel_huc_register_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
+void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, const struct bus_type *bus);
 
 static inline int intel_huc_sanitize(struct intel_huc *huc)
 {
-- 
2.39.2

