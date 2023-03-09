Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E246B2512
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 14:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0B710E17B;
	Thu,  9 Mar 2023 13:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F153510E80C;
 Thu,  9 Mar 2023 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678367848; x=1709903848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GbTzUhMfzi25AYS27DoltRyE946Bi/6TFoDTOoGgsH8=;
 b=fj8fGTJb3IxiJx5ZeOXei6/225vMYd1dfzytv6LtIsedO1BcirEKuJV7
 t8Il9TIyBqkWifugRQyDFc176UVV1ZWX4aO72NIdsNtTaabU89l9bpIFq
 ZTKVi5LeFoRRAvgnqe5ZuI0VphEsE2iXiLkPdNc/Zi+B0ze+UIF+zx/ah
 tjBq1JxHqYQiaI6WwjEVwk7Sx4fW9LJtPL51jl7GyWa/6Vlyy7SzTM37F
 m9K23w6MNrZ0YIX98OTL5lm5aqClfYIDgO1C/G+AoqDmthnzcY3ccIw5q
 wV0GUzYzdJ6Mzstly/45i0XLVLZ+5taTQBU0EkEB3EpYMP3T3kyobmjjp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320270457"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="320270457"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 05:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="787551640"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="787551640"
Received: from harith2x-mobl1.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 05:17:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/ttm: Make the call to ttm_tt_populate()
 interruptible when faulting
Date: Thu,  9 Mar 2023 14:17:01 +0100
Message-Id: <20230309131701.65312-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309131701.65312-1-thomas.hellstrom@linux.intel.com>
References: <20230309131701.65312-1-thomas.hellstrom@linux.intel.com>
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
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
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

