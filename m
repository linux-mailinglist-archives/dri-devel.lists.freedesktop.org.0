Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AB64B7025
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 17:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BD310E6A4;
	Tue, 15 Feb 2022 16:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F8A10E6A2;
 Tue, 15 Feb 2022 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644942727; x=1676478727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kOl4ZoUw8hbyoH6yx63ZM9ci77NdjsTJQdRP7iPomh8=;
 b=fexuJcWpDj8wusncUNuVNSVVM8lK7cYiIHRWlDHv7paZqFokXr9JPS9N
 7TM6OG72On9M0Ah3O+vi7mCwOAOf+jiewy9kZtaiQJVN5nihmEOlVwTxq
 qGzek/DNZMUXXfQSVBDPloClKB5VMH348HX4giUfbOZ8YB33TXiSLzZX2
 Fe+Ry25kHhMAKu8vEAncvxv1gRMHfDCXwAA0LcYKyq2/tFqjO7xoeoqcg
 PZXAh0fLteBY4qShhUBMTjd4twfbV9uJGURr29+NlXWIXDmrsnHSv60Qk
 YMVbO9DHuD4HRQccEfQvPpPU9HwS8Z4EJKOE4YRWTDE/R9flvdJIklwWR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250334413"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="250334413"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 08:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="539411451"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 15 Feb 2022 08:31:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3DA3D107; Tue, 15 Feb 2022 18:32:14 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] drm/i915/selftests: Replace too verbose for-loop with
 simpler while
Date: Tue, 15 Feb 2022 18:32:13 +0200
Message-Id: <20220215163213.54917-1-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's hard to parse for-loop which has some magic calculations inside.
Much cleaner to use while-loop directly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_syncmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_syncmap.c b/drivers/gpu/drm/i915/selftests/i915_syncmap.c
index 47f4ae18a1ef..26981d1c3025 100644
--- a/drivers/gpu/drm/i915/selftests/i915_syncmap.c
+++ b/drivers/gpu/drm/i915/selftests/i915_syncmap.c
@@ -36,10 +36,10 @@ __sync_print(struct i915_syncmap *p,
 	unsigned int i, X;
 
 	if (depth) {
-		unsigned int d;
+		unsigned int d = depth;
 
-		for (d = 0; d < depth - 1; d++) {
-			if (last & BIT(depth - d - 1))
+		while (d--) {
+			if (last & BIT(d))
 				len = scnprintf(buf, *sz, "|   ");
 			else
 				len = scnprintf(buf, *sz, "    ");
-- 
2.34.1

