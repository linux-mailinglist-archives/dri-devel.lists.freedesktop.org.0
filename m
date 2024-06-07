Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FE90077F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 16:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5E10EC86;
	Fri,  7 Jun 2024 14:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsdO5mLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8212D10EC83;
 Fri,  7 Jun 2024 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717771917; x=1749307917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LnqmAnBREyT56tOJi/0jUwOXdjmVFBqVT92a2XsfTdY=;
 b=ZsdO5mLVyKB8uacpEQt/AmRqDK7rWd9QleLWatgAHtC4He2/f8jKzCT6
 oEi7C7W3UIYI/aA7Uga20lOZxWqUkBjyp6iUykP+aXslqeK2Y73wIl9Ws
 DiHrLlaGx4zYlYtixZHwya0jrPDBtG8vVO3CxO14oC99qpakQhDCE8VOD
 hF/qvmf6bkwyrqUzMFn671dEQ9oY+S9sVpEsH2O/jQhfbo7jOI9gvtD4g
 0tvTGnWW24bQNGp1daEMi20QR0iBae4l8Db8+oBKemyPC0ouGJ6Qr3LIS
 8Djh3esOU3mMwuWWrhtlKqjkEMTycPApIKrHDq3OhIh9IzZQ9mb0UoUXI Q==;
X-CSE-ConnectionGUID: RfAQRi64TIKonGC5vGErgQ==
X-CSE-MsgGUID: 6jIlQGLhQXW9hUus+QpyOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32041754"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="32041754"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:51:57 -0700
X-CSE-ConnectionGUID: Rcbhd4NYTZaxQEEYh9IDhg==
X-CSE-MsgGUID: aVqdfA2zSBydt1esNX5eRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="39019798"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.85])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:51:55 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] drm/i915/gt: debugfs: Evaluate forcewake usage within locks
Date: Fri,  7 Jun 2024 16:51:31 +0200
Message-ID: <20240607145131.217251-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

The forcewake count and domains listing is multi process critical
and the uncore provides a spinlock for such cases.

Lock the forcewake evaluation section in the fw_domains_show()
debugfs interface.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 4fcba42cfe34..0437fd8217e0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -71,6 +71,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
 	struct intel_uncore_forcewake_domain *fw_domain;
 	unsigned int tmp;
 
+	spin_lock_irq(&uncore->lock);
+
 	seq_printf(m, "user.bypass_count = %u\n",
 		   uncore->user_forcewake_count);
 
@@ -79,6 +81,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
 			   intel_uncore_forcewake_domain_to_str(fw_domain->id),
 			   READ_ONCE(fw_domain->wake_count));
 
+	spin_unlock_irq(&uncore->lock);
+
 	return 0;
 }
 DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
-- 
2.45.1

