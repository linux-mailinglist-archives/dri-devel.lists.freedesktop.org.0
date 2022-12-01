Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3263F097
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 13:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6463A10E5D7;
	Thu,  1 Dec 2022 12:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E9E10E5CE;
 Thu,  1 Dec 2022 12:32:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D92ECB81F10;
 Thu,  1 Dec 2022 12:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22E1C433D6;
 Thu,  1 Dec 2022 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669897931;
 bh=+hmnjpr/Mlwxdk1qNwkNqCTb5PWqCusX1qRO0Wh9xU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JX5WqrcfGPbgBTYLbS/MtXQN4eaFNXChoo8YmYNuinsqcpOSWATS190roek0LUoPT
 glYcZGXCwcVWkkQ3mC27kP0fnxeSTwRFlW0cnvAxAWtGCiemHhshajqQc2lRjIr8Am
 WiPafsfrS0ByGqttXp2KzSkCbJVh+KCfX8yYc7EqWAakrCzHV0bjROzklsVzKPZYmI
 zzogpYkPtWaa2QysomMawvGNs2gzQ2TDCfss15rfsZ8SfWz2ACgSaRhpRqHDRH7TuZ
 IPuQHAoNaY6HU9dzwr69vUAzPInMUAJUrCAHzlf56/qtYXvnzh2AKQsIfb2wF7kDOZ
 V5BPo0no7I7hw==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1p0ijY-00FYFJ-37;
 Thu, 01 Dec 2022 12:32:08 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 1/3] drm/i915: place selftest preparation on a separate
 function
Date: Thu,  1 Dec 2022 12:32:05 +0000
Message-Id: <c0ebcad250fc68e4822a921d7ea7a63ae16d381f.1669897668.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1669897668.git.mchehab@kernel.org>
References: <cover.1669897668.git.mchehab@kernel.org>
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
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yury Norov <yury.norov@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The selftest preparation logic should also be used by KUnit. So,
place it on a separate function and export it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1669897668.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_selftest.h          |  2 ++
 .../gpu/drm/i915/selftests/i915_selftest.c    | 22 ++++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index bdf3e22c0a34..cd0065033ed9 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -44,6 +44,7 @@ struct i915_selftest {
 
 extern struct i915_selftest i915_selftest;
 
+void i915_prepare_selftests(const char *name);
 int i915_mock_selftests(void);
 int i915_live_selftests(struct pci_dev *pdev);
 int i915_perf_selftests(struct pci_dev *pdev);
@@ -113,6 +114,7 @@ int __i915_subtests(const char *caller,
 
 #else /* !IS_ENABLED(CONFIG_DRM_I915_SELFTEST) */
 
+static inline void i915_prepare_selftests(const char *) {};
 static inline int i915_mock_selftests(void) { return 0; }
 static inline int i915_live_selftests(struct pci_dev *pdev) { return 0; }
 static inline int i915_perf_selftests(struct pci_dev *pdev) { return 0; }
diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 39da0fb0d6d2..bc85dac4eb15 100644
--- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
+++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
@@ -127,13 +127,8 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
 		st[i].enabled = true;
 }
 
-static int __run_selftests(const char *name,
-			   struct selftest *st,
-			   unsigned int count,
-			   void *data)
+void i915_prepare_selftests(const char *name)
 {
-	int err = 0;
-
 	while (!i915_selftest.random_seed)
 		i915_selftest.random_seed = get_random_u32();
 
@@ -142,10 +137,21 @@ static int __run_selftests(const char *name,
 		msecs_to_jiffies_timeout(i915_selftest.timeout_ms) :
 		MAX_SCHEDULE_TIMEOUT;
 
-	set_default_test_all(st, count);
-
 	pr_info(DRIVER_NAME ": Performing %s selftests with st_random_seed=0x%x st_timeout=%u\n",
 		name, i915_selftest.random_seed, i915_selftest.timeout_ms);
+}
+EXPORT_SYMBOL_NS_GPL(i915_prepare_selftests, I915_SELFTEST);
+
+static int __run_selftests(const char *name,
+			   struct selftest *st,
+			   unsigned int count,
+			   void *data)
+{
+	int err = 0;
+
+	i915_prepare_selftests(name);
+
+	set_default_test_all(st, count);
 
 	/* Tests are listed in order in i915_*_selftests.h */
 	for (; count--; st++) {
-- 
2.38.1

