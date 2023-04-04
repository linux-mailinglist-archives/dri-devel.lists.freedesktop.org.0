Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D206D6D9D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB2E10E7A3;
	Tue,  4 Apr 2023 20:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4AE10E7A3;
 Tue,  4 Apr 2023 20:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680638862; x=1712174862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GbTzUhMfzi25AYS27DoltRyE946Bi/6TFoDTOoGgsH8=;
 b=Wt6m+hVnDL9PvEUWfMAND/IncqTCyMahQYdM18+ChoB6lzCdqXDmy/sU
 idLMYj+Yb129GoDhkj/LlfToWJ15A+O2sRY+Ztto7JEbIIA+37wIU3B8x
 V9gJwqkh+gUZOuDgXFDKwm1X5dxSyp/1mWMGaSnNDUVk46JLDYhxCdi9Y
 h8tTd5jzYZ+zv8nI3juRNJjHswuLw24/KMrTgr1OaZecQY7McYNCW51Wx
 Q2Pj+L1TwE/6pi3zfbE95wMViw2VSwnqUc/FlFSQ/v+x3fdvNowXYknNG
 Ip3HQda8v892tPcyuP5+aKQ9gv3cFmwiIQHdQtOiq+AhGZsNLMPiWAKkA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="326324779"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="326324779"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689022058"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="689022058"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.33.67])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:07:39 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v3 3/3] drm/ttm: Make the call to ttm_tt_populate()
 interruptible when faulting
Date: Tue,  4 Apr 2023 22:06:50 +0200
Message-Id: <20230404200650.11043-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When swapping in, or under memory pressure ttm_tt_populate() may sleep
for a substantiable amount of time. Allow interrupts during the sleep.
This will also allow us to inject -EINTR errors during swapin in upcoming
patches.

Also avoid returning VM_FAULT_OOM, since that will confuse the core
mm, making it print out a confused message and retrying the fault.
Return VM_FAULT_SIGBUS also under OOM conditions.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index ca7744b852f5..4bca6b54520a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -218,14 +218,21 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	prot = ttm_io_prot(bo, bo->resource, prot);
 	if (!bo->resource->bus.is_iomem) {
 		struct ttm_operation_ctx ctx = {
-			.interruptible = false,
+			.interruptible = true,
 			.no_wait_gpu = false,
 			.force_alloc = true
 		};
 
 		ttm = bo->ttm;
-		if (ttm_tt_populate(bdev, bo->ttm, &ctx))
-			return VM_FAULT_OOM;
+		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
+		if (err) {
+			if (err == -EINTR || err == -ERESTARTSYS ||
+			    err == -EAGAIN)
+				return VM_FAULT_NOPAGE;
+
+			pr_debug("TTM fault hit %pe.\n", ERR_PTR(err));
+			return VM_FAULT_SIGBUS;
+		}
 	} else {
 		/* Iomem should not be marked encrypted */
 		prot = pgprot_decrypted(prot);
-- 
2.39.2

