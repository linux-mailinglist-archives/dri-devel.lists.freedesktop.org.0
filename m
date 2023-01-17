Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169066E3BC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F75510E1A2;
	Tue, 17 Jan 2023 16:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC63110E1A2;
 Tue, 17 Jan 2023 16:37:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99D18B815E9;
 Tue, 17 Jan 2023 16:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6253C433D2;
 Tue, 17 Jan 2023 16:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673973469;
 bh=eW6//3cViUuJfCKFm7UUOh5i0BW9IwBnC51sdT2hYj4=;
 h=From:To:Cc:Subject:Date:From;
 b=uOEqgQbh+YGTEHnq3WnnzljRLzzHKWAdHf9R8kD9AgfcQvtZcVr8dSl7NgEzcffJR
 ppjbOgDJARB8Gd6orJYPTBgDVI+30vEM0QLtW/Eh1niGNoMF+JLUc0adNFLC9KeIC/
 NXbncMuURU5FhjdtfBkcn9t55Qmfw+mUu0ZFFBsRX9Tqjt7D4Du5MWG5bDnJ3M2DaQ
 PcNP2uFNO/YNsC87NoG1lMG4Au3JeBw0nL3oEpwklhOaE1rdiEhhLAl+QjBH84CHSb
 sIMC4Cw5gfC3D59JC+OGZ2zUwQyDLjbh0UyZxgX0+6MGG3hKADBz7EKd4H78lBEzwH
 foY8mSuQ/oToQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm/i915/selftest: fix intel_selftest_modify_policy argument
 types
Date: Tue, 17 Jan 2023 17:37:29 +0100
Message-Id: <20230117163743.1003219-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Matthew Brost <matthew.brost@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The definition of intel_selftest_modify_policy() does not match the
declaration, as gcc-13 points out:

drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c:29:5: error: conflicting types for 'intel_selftest_modify_policy' due to enum/integer mismatch; have 'int(struct intel_engine_cs *, struct intel_selftest_saved_policy *, u32)' {aka 'int(struct intel_engine_cs *, struct intel_selftest_saved_policy *, unsigned int)'} [-Werror=enum-int-mismatch]
   29 | int intel_selftest_modify_policy(struct intel_engine_cs *engine,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c:11:
drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h:28:5: note: previous declaration of 'intel_selftest_modify_policy' with type 'int(struct intel_engine_cs *, struct intel_selftest_saved_policy *, enum selftest_scheduler_modify)'
   28 | int intel_selftest_modify_policy(struct intel_engine_cs *engine,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change the type in the definition to match.

Fixes: 617e87c05c72 ("drm/i915/selftest: Fix hangcheck self test for GuC submission")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
index 310fb83c527e..2990dd4d4a0d 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -28,8 +28,7 @@ struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
 
 int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 				 struct intel_selftest_saved_policy *saved,
-				 u32 modify_type)
-
+				 enum selftest_scheduler_modify modify_type)
 {
 	int err;
 
-- 
2.39.0

