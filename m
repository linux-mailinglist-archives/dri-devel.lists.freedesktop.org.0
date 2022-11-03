Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D3861801D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0143710E630;
	Thu,  3 Nov 2022 14:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36F10E60C;
 Thu,  3 Nov 2022 14:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F40BB828B8;
 Thu,  3 Nov 2022 14:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C1CC43141;
 Thu,  3 Nov 2022 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667487103;
 bh=uKx5CM4Wo7SGIbjuqLDYwkAKVGcbP3XPEVY3Uc4z03g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b5RTy+HjAvar0v3LCPg/cTbvaP4h/XLMEVtpU8WzJDpdiaLMGFjXTs8OfKoX4Up+P
 iZkvpGfG/E7KYN9NdcloKydjq5kl9zLTOZoH74+e4AFoGN50cTUffTsg2OGfhqzBqH
 k6rUTxAZVPgeConXquQyjjobB71LqZSZiLQY7TiP0fmjZbywAWcLO7UNgrbW4Ezd/c
 odWRxPW5EZedodPgE9m9jr3gWuFBCfl1qFKGL67PK+X1Lpio50bnTp4ZdTikY5B401
 V4hmAL8XGkcR96YNO7tzu87SOf5MCoMohosXFCIwwxWxdN4FlUNBgFzI7oSNHFpfW9
 wNkzH4bFG8Y9Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1oqbZE-0076av-08;
 Thu, 03 Nov 2022 14:51:40 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC v2 2/8] drm/i915: place selftest preparation on a separate
 function
Date: Thu,  3 Nov 2022 14:51:32 +0000
Message-Id: <71391c51dc48300e4dac3b762abed9201d508302.1667486144.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667486144.git.mchehab@kernel.org>
References: <cover.1667486144.git.mchehab@kernel.org>
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
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Daniel Latypov <dlatypov@google.com>,
 linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 skhan@linuxfoundation.org, Isabella Basso <isabbasso@riseup.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Carstens <hca@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The selftest preparation logic should also be used by KUnit. So,
place it on a separate function and export it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH RFC v2 0/8] at: https://lore.kernel.org/all/cover.1667486144.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_selftest.h          |  2 ++
 .../gpu/drm/i915/selftests/i915_selftest.c    | 22 ++++++++++++-------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index f54de0499be7..7fab96a42a62 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -44,6 +44,7 @@ struct i915_selftest {
 
 extern struct i915_selftest i915_selftest;
 
+void i915_prepare_selftests(const char *name);
 int i915_mock_selftests(void);
 int i915_live_selftests(struct pci_dev *pdev);
 int i915_perf_selftests(struct pci_dev *pdev);
@@ -111,6 +112,7 @@ int __i915_subtests(const char *caller,
 
 #else /* !IS_ENABLED(CONFIG_DRM_I915_SELFTEST) */
 
+static inline void i915_prepare_selftests(const char *) {};
 static inline int i915_mock_selftests(void) { return 0; }
 static inline int i915_live_selftests(struct pci_dev *pdev) { return 0; }
 static inline int i915_perf_selftests(struct pci_dev *pdev) { return 0; }
diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 571c9021bd2c..011f7b1f7ff5 100644
--- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
+++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
@@ -129,13 +129,8 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
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
 
@@ -144,10 +139,21 @@ static int __run_selftests(const char *name,
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

