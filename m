Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0748552F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5278F10FAF3;
	Wed,  5 Jan 2022 15:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326D410FAF2;
 Wed,  5 Jan 2022 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641394812; x=1672930812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d9CCjHmx0U5wlstEKtVyc7kks/Y3219jrCGxjBw/lg4=;
 b=gz2W3zyvTP1bQIz6NfZcOxneL1JsKITthgTH4NSxDHP/s/TgHS+5rH5d
 otQX2R399cC6yiEwWUZUI15rbbIWjUqwBU0w4dOindKXxjq58IAa68Par
 KD/O6FzbhfNTgCggOuPQoljpWhm2NAd4FVrXosTajWfD8Oe1wROqta100
 WUcl2cLNopAkOepq8J33IHSu7sUn8NImSvaHooY3imZmBPF0WcPuTcP0t
 kooolhG+DhnSHSOX5yyikqaftSr3KYuokWiWQ2H2s4cho8f6b8LuDgpux
 aGX+0I1y+WLs01NAxT4hPrF63ijiTq/VSgPii2NifwwIdQnSflMHWD1dg A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="239999790"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="239999790"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:00:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="512979163"
Received: from unknown (HELO mwauld-desk1.intel.com) ([10.252.26.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:00:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/ttm: only fault WILLNEED objects
Date: Wed,  5 Jan 2022 14:58:33 +0000
Message-Id: <20220105145835.142950-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105145835.142950-1-matthew.auld@intel.com>
References: <20220105145835.142950-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't attempt to fault and re-populate purged objects. By some fluke
this passes the dontneed-after-mmap IGT, but for the wrong reasons.

Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 923cc7ad8d70..8d61d4538a64 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -883,6 +883,11 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 	if (ret)
 		return ret;
 
+	if (obj->mm.madv != I915_MADV_WILLNEED) {
+		dma_resv_unlock(bo->base.resv);
+		return VM_FAULT_SIGBUS;
+	}
+
 	if (drm_dev_enter(dev, &idx)) {
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
-- 
2.31.1

