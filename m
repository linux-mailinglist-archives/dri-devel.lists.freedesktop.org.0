Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EBB6DF3C2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D411310E79C;
	Wed, 12 Apr 2023 11:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB2610E798;
 Wed, 12 Apr 2023 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681299243; x=1712835243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QV8fCkV7Ki8q1dYVTX3JPG1FpteI9tEg2KLpZ1mBAjo=;
 b=iLa8ZELn66IpCRD7T65axbqAuwa295EfpjhJzjxF9GzhU4CwfPTWIqp1
 UMMswkjytvqX6MznGVMxc+Fy5Rk44cAJ49MD401Bxln91hctdPeAJJtjT
 JZKzkiz2M9JmoeizgJryyfuAqPMoWi4KharoKJ7nsISTi55SyHe90YjpF
 /DMF/EoESXMcushPk7BHWUwTwoxXqBGDtjE3LFdzhAZ2Ic6QT0+FQGU0N
 cB5TxMEFrYLtN//zd5DEAFl36kNjm+TSf9QRLti6c5+xOJ3EGLqxoz7zc
 NKoAGIc6JK09FnSwcWCSKzcSG0LAym2ICaO3E5lgJ9w0gYsokuM0Mzuvc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327978228"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="327978228"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="778268744"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="778268744"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 04:33:59 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v5 1/5] drm/i915/gt: Add intel_context_timeline_is_locked
 helper
Date: Wed, 12 Apr 2023 13:33:04 +0200
Message-Id: <20230412113308.812468-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412113308.812468-1-andi.shyti@linux.intel.com>
References: <20230412113308.812468-1-andi.shyti@linux.intel.com>
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have:

 - intel_context_timeline_lock()
 - intel_context_timeline_unlock()

In the next patches we will also need:

 - intel_context_timeline_is_locked()

Add it.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: stable@vger.kernel.org
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 48f888c3da083..f2f79ff0dfd1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -270,6 +270,12 @@ static inline void intel_context_timeline_unlock(struct intel_timeline *tl)
 	mutex_unlock(&tl->mutex);
 }
 
+static inline void intel_context_assert_timeline_is_locked(struct intel_timeline *tl)
+	__must_hold(&tl->mutex)
+{
+	lockdep_assert_held(&tl->mutex);
+}
+
 int intel_context_prepare_remote_request(struct intel_context *ce,
 					 struct i915_request *rq);
 
-- 
2.39.2

