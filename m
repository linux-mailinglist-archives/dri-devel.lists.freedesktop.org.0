Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F94885B85
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 16:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C49E10E359;
	Thu, 21 Mar 2024 15:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFwmgme6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5309510E359;
 Thu, 21 Mar 2024 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711034318; x=1742570318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vTq6eMlEVlwDOrRT3eh/Y4LPJlYJFenbxEIwPcIxpYQ=;
 b=UFwmgme66tdUMNeXjr6SqEpzI3nz+G3xdb25BSnbnQdI2hQgg1hviAp5
 opn/BwpZ34WfgIiiMTI6ijw7ZH8e3jwp8NQjV1R9tcMG1CHra3WMPJHQz
 3tcSurHnTVXLzIFBP96hQ3Uj6+0/4DW5501jiDnMJMSwKoUVipIkzthMH
 YsTw5P44OlxAZQcv0StDS3TS5xNLkclIXH7c+qWGGVDBZERZ99zdeguQ/
 jo8hCfP71RHbNsjah/nrNgkoOEZdtu259zM5GSWbBEbiujEgw50v6Rn1+
 9YOeuzujOkQqkOguEkdH6o48wEJ2CnX5efYzOVbsPAs0hCkmyi65aPYeu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9813520"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9813520"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="51976905"
Received: from unknown (HELO intel.com) ([10.247.118.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:18:30 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/i915/gt: Report full vm address range
Date: Thu, 21 Mar 2024 16:17:26 +0100
Message-ID: <20240321151726.207866-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
vm") has reserved an object for kernel space usage.

Userspace, though, needs to know the full address range.

In the former patch the reserved space was substructed from the
total amount of the VM space. Add it back when the user requests
the GTT size through ioctl (I915_CONTEXT_PARAM_GTT_SIZE).

Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
Hi,

Just proposing a different implementation that doesn't affect
i915 internally but provides the same result. Instead of not
substracting the space during the reservation, I add it back 
during the ioctl call.

All the "vm->rsvd.vma->node.size" looks a bit ugly, but that's
how it is. Maybe a comment can help to understand better why
there is this addition.

I kept the Ack from Michal and Lionel, because the outcome from
userspace perspactive doesn't really change.

Andi

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 81f65cab1330..60d9e7fe33b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2454,7 +2454,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 	case I915_CONTEXT_PARAM_GTT_SIZE:
 		args->size = 0;
 		vm = i915_gem_context_get_eb_vm(ctx);
-		args->value = vm->total;
+		args->value = vm->total + vm->rsvd.vma->node.size;
 		i915_vm_put(vm);
 
 		break;
-- 
2.43.0

