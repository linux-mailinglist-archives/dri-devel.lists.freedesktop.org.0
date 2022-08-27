Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EF5A39D6
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477B710ED41;
	Sat, 27 Aug 2022 19:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A4310ED24;
 Sat, 27 Aug 2022 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629578; x=1693165578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5EUqJFObvCeL/2E+x7+C6Ldh1ze2uEL0dtSaQ7t0R4=;
 b=YwpomDcDabH0UVxhjZdlbtUAEsBSFY7fYTZ5kTTUelpi0odbHgx3+HOS
 I4cZ4yCyJoh8ndlua5AQxkcz6QnGImR7OtdVUYqcI+7nk41QOteLBYVAF
 OMBKhkOhVL95WY5X7JaH/e6u3o9ysDkw5GJhhtV4rirfBDwA6OkIP6uFj
 GPgtuWY930k7j/8/lssO8Bcq5gRjI9k3HlcoH5oZogoFa49Dv7/twP9th
 7axT1UebkA0AlZQlRvKCz3Fk8OK8NMROsTsq5Pu+B4eYpHpBpRLs0s5pY
 VxwOizg68AuUOaYchDSEVS89PMwAhZFWQZ3ZSL4aYuysXS2jF/Gz31adi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="292265721"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="292265721"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:46:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="587696793"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:46:14 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 09/17] drm/i915: Do not support vm_bind mode in execbuf2
Date: Sat, 27 Aug 2022 21:43:55 +0200
Message-Id: <20220827194403.6495-10-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220827194403.6495-1-andi.shyti@linux.intel.com>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Do not support the vm in vm_bind_mode in execbuf2 ioctl.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index cd75b0ca2555f..f85f10cf9c34b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -781,6 +781,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
 	if (unlikely(IS_ERR(ctx)))
 		return PTR_ERR(ctx);
 
+	if (ctx->vm->vm_bind_mode) {
+		i915_gem_context_put(ctx);
+		return -EOPNOTSUPP;
+	}
+
 	eb->gem_context = ctx;
 	if (i915_gem_context_has_full_ppgtt(ctx))
 		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
-- 
2.34.1

