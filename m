Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABACD63C838
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E0210E345;
	Tue, 29 Nov 2022 19:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FF510E336;
 Tue, 29 Nov 2022 19:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749653; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJ8DQbIPu45uJFi2+s89p8C8So0glLs+3UhV12NFAG4=;
 b=1bld4QEX0BAnu3Z14gTXZpmFtmvXP8F67tDurl3HqD8RxcF4B8CIQ8VC5WPwwqd6Ktn/EK
 1KedmnMleBUB/U3DHVlgwJJIMabuy87w9VHSnZQvPy0xvKXHrNXFEHxq4WnlMT2wPzUTiZ
 a4WsVlCqWMxNe2ZKCZHvbzdWNBpO9Uc=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 26/26] drm/i915/gt: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:42 +0000
Message-Id: <20221129191942.138244-13-paul@crapouillou.net>
In-Reply-To: <20221129191942.138244-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of defining two versions of intel_sysfs_rc6_init(), one for each
value of CONFIG_PM, add a check on !IS_ENABLED(CONFIG_PM) early in the
function. This will allow the compiler to automatically drop the dead
code when CONFIG_PM is disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index cf71305ad586..09b9365ededd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -164,7 +164,6 @@ sysfs_gt_attribute_r_func(struct kobject *kobj, struct attribute *attr,
 								 NULL);			\
 	INTEL_GT_ATTR_RO(_name)
 
-#ifdef CONFIG_PM
 static u32 get_residency(struct intel_gt *gt, enum intel_rc6_res_type id)
 {
 	intel_wakeref_t wakeref;
@@ -300,7 +299,7 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
 {
 	int ret;
 
-	if (!HAS_RC6(gt->i915))
+	if (!IS_ENABLED(CONFIG_PM) || !HAS_RC6(gt->i915))
 		return;
 
 	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
@@ -329,11 +328,6 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
 				 gt->info.id, ERR_PTR(ret));
 	}
 }
-#else
-static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
-{
-}
-#endif /* CONFIG_PM */
 
 static u32 __act_freq_mhz_show(struct intel_gt *gt)
 {
-- 
2.35.1

