Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8016B032C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4E710E625;
	Wed,  8 Mar 2023 09:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B157610E625;
 Wed,  8 Mar 2023 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678268502; x=1709804502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGzmLhdp64nUyBhMNT/W4I80zrlNOpI/Un78hvV180M=;
 b=ZqS2gYTpoNUQ61LfTJ+8k0AjdbGfql6G6YKCA0w9AvwLFqsFPfVSFEpg
 vDUPEm3bg3uTBpkh1TnFpFxv/PL+uZ4BTkaTiaK9XerObsY7aRmt3jnVj
 GN3fbJGxeVga/GDg3I2j8V+F6A4Z7QrnJmoHRflG19lO7RI2kUK1pl4if
 /+isG+B7UP9n7tY8ItfKCf+ZRy0cxrXMKbTX8ohCMv3+NB/4MvpS9ibnW
 VTsQGWVd9LKVBsgUDcP1mpBkN8wPPyIqpwzpS8srOTYFKTady8DvRCZlk
 DSPYfJseNaNqOi3xm7mZfLvc5bsckRT3RLDql8om5K75IXNr7A8UIdGi1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338437619"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="338437619"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="741056280"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="741056280"
Received: from gbain-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 01:41:39 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v4 2/5] drm/i915/gt: Add intel_context_timeline_is_locked
 helper
Date: Wed,  8 Mar 2023 10:41:03 +0100
Message-Id: <20230308094106.203686-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308094106.203686-1-andi.shyti@linux.intel.com>
References: <20230308094106.203686-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
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
---
 drivers/gpu/drm/i915/gt/intel_context.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index f919a66cebf5b..87d5e2d60b6db 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -265,6 +265,12 @@ static inline void intel_context_timeline_unlock(struct intel_timeline *tl)
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

