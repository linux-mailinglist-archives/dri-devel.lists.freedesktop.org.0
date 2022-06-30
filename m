Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D523561AD4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 14:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D0511AB1F;
	Thu, 30 Jun 2022 12:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447AF11AB1F;
 Thu, 30 Jun 2022 12:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656593849; x=1688129849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vYSZhASn8tgU9zD73wAmd/QG7LxjpopV+5RbTxlmf1o=;
 b=aXzEkBAhOZ0LAnMhiG5KeCJBkllNeUNJ52g2WGRGyWYkSzaN/8GMQcL/
 UYF+hR6XQSzYW4M1xW0OwfSalkIxoN3FtzZBTQOa6bcmsVrF3fggWIM/+
 uNSg7iYhYrPt4KR553Jdy7MlUVKY154EU72OmV8zEgc8ldyaZAO1SUzec
 4Kx3q9RVKCNfUrGbIgcG7qipsTy7OK3qds7YDxoorL5v+I/bnk4aq6mAf
 yYrGolmLkiQkvSSOLDjPR6VYnxGTeWQupsaAcQ7WC3MUlO+jWsb4h8dKB
 xwDjqUN0aS0kMU2RohuddSdV1hqMsnNZ4K7gCH1lJadDlb/ogew4hUu1J Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="281104231"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="281104231"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 05:57:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="918035298"
Received: from hanj1-mobl1.ccr.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.230])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 05:57:26 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Remove flush_scheduled_work() from
 live_execlists
Date: Thu, 30 Jun 2022 13:57:16 +0100
Message-Id: <20220630125716.50835-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

There are ongoing efforts to remove usages of flush_scheduled_work() from
drivers in order to avoid several cases of potentential problems when
flushing is done from certain contexts.

Remove the call from the live_execlists selftest. Its purpose was to be
thorough and sync with the execlists capture state handling, but that is
not strictly required for the test to function and can be removed.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 09f8cd2d0e2c..e62d089257ae 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -85,8 +85,6 @@ static int wait_for_reset(struct intel_engine_cs *engine,
 			break;
 	} while (time_before(jiffies, timeout));
 
-	flush_scheduled_work();
-
 	if (rq->fence.error != -EIO) {
 		pr_err("%s: hanging request %llx:%lld not reset\n",
 		       engine->name,
-- 
2.34.1

