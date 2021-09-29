Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EFA41CBEA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D34A6EAD4;
	Wed, 29 Sep 2021 18:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77576EACC;
 Wed, 29 Sep 2021 18:34:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="286027688"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="286027688"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:34:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="520927754"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 11:34:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/i915/utils: do not depend on config being defined
Date: Wed, 29 Sep 2021 11:33:56 -0700
Message-Id: <20210929183357.1490204-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929183357.1490204-1-lucas.demarchi@intel.com>
References: <20210929183357.1490204-1-lucas.demarchi@intel.com>
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

Like the IS_ENABLED() counterpart, we can make IS_CONFIG_NONZERO() to
return the right thing when the config is not defined rather than a
build error, with the limitation that it can't be used on preprocessor
context.

The trick here is that macro names can't start with a number or dash, so
we stringify the argument and check that the first char is a number != 0
(or starting with a dash to cover negative numbers). Except for -O0
builds the strings are all eliminated.

Taking CONFIG_DRM_I915_REQUEST_TIMEOUT in
drivers/gpu/drm/i915/gem/i915_gem_context.c as example, we have the
following output of the preprocessor:

old:
 if (((20000) != 0) &&
new:
 if (( ("20000"[0] > '0' && "20000"[0] < '9') || "20000"[0] == '-' ) &&

New one looks worse, but is also eliminated from the object:

$ size drivers/gpu/drm/i915/gem/i915_gem_context.o.*
   text    data     bss     dec     hex filename
  52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.new
  52021    1070     232   53323    d04b drivers/gpu/drm/i915/gem/i915_gem_context.o.old

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 02bbfa4d68d3..436ce612c46a 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -28,6 +28,7 @@
 #include <linux/list.h>
 #include <linux/overflow.h>
 #include <linux/sched.h>
+#include <linux/stringify.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -469,6 +470,9 @@ static inline bool timer_expired(const struct timer_list *t)
  *
  * Returns 0 if @config is 0, 1 if set to any value.
  */
-#define IS_CONFIG_NONZERO(config) ((config) != 0)
+#define IS_CONFIG_NONZERO(config) (						\
+	(__stringify_1(config)[0] > '0' && __stringify_1(config)[0] < '9') ||	\
+	__stringify_1(config)[0] == '-'						\
+)
 
 #endif /* !__I915_UTILS_H */
-- 
2.33.0

