Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF063494B0D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 10:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9150210E216;
	Thu, 20 Jan 2022 09:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1525A10E216;
 Thu, 20 Jan 2022 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642672146; x=1674208146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0lsO0Veb4aJ3yYIApNUEO0AwR5SEUaWL3Q5A9UTuA/w=;
 b=FXc6QtNc4NB3zl79Fe/e67f+q2dx8ZBoGgpgfeD05fQG5mLOk2XyAPFQ
 1Y26rPJLIp4GpCvgKuWdrsNS5NBbJOSltnYMNH/aZMWHH7uT9ClD+DVZZ
 gxVtaGQ94x7eHJc+WmCb6qhqGyh61Jq/yjBZDx16gRO9lzUQJkWwzBdbz
 DmFhXfluw5PIBvACrF6Y44LeGVCgOmkC5hpTKpYRZzz2Fc0ADTcojbvL5
 cDB3tqSVbPqA+QMoMZnKzSX1biabBiDocHMeoobtYz5I5Jvw5B7lkrti1
 1RxG22keB1BTHSmX5hKdiG0stjPqkUSVtPO31nUKtCIH2mmDQ/mc38oSB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="331665646"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="331665646"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 01:49:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="532701272"
Received: from davidfsc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 01:49:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/locking: fix drm_modeset_acquire_ctx kernel-doc
Date: Thu, 20 Jan 2022 11:48:56 +0200
Message-Id: <20220120094856.3004147-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The stack_depot member was added without kernel-doc, leading to below
warning. Fix it.

./include/drm/drm_modeset_lock.h:74: warning: Function parameter or
member 'stack_depot' not described in 'drm_modeset_acquire_ctx'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_modeset_lock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index b84693fbd2b5..ec4f543c3d95 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -34,6 +34,7 @@ struct drm_modeset_lock;
  * struct drm_modeset_acquire_ctx - locking context (see ww_acquire_ctx)
  * @ww_ctx: base acquire ctx
  * @contended: used internally for -EDEADLK handling
+ * @stack_depot: used internally for contention debugging
  * @locked: list of held locks
  * @trylock_only: trylock mode used in atomic contexts/panic notifiers
  * @interruptible: whether interruptible locking should be used.
-- 
2.30.2

