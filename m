Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41A6FDFE2
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0DA10E4C0;
	Wed, 10 May 2023 14:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD8010E4AB;
 Wed, 10 May 2023 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683728396; x=1715264396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mi4rtPSPC3U49tE8xbm/O1QWkUpjo/FfUXJXWSsekVE=;
 b=XEzvC9q117nD9W8e5eOP6N3fKfWaA0vVHkeHkKwqW7BoEoMU/BbpXG4y
 moGD7Y/eHEJTrHaqj/9j6oAaQf/t8aZ1DyfW9+wVpHkOiaHpQ5BjQsmzD
 llEp76G3i768QHxYX4mEHgz5HDzgYUvjscKX9KEkY3lKQ023rgdDWIICc
 Ta/TDej1v7eTDUuQmx+VnZFx52AM3eK6ktLOHFpTTAlu0RsXjhNxOyLjV
 MKwNMfj5KGOWjKhfuaXkizRojX99fWRNfsr8arGdcIU8AroB5y/MDVQeY
 FboqYxE1BKDSGcAkj3wygnoBQONggtHgvdcvnNwk3dCBK+0wZ0di+Jb5U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339469145"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="339469145"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="768931696"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="768931696"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.114])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:19:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Fix unlocked access of the vma::rebind_link
Date: Wed, 10 May 2023 16:19:31 +0200
Message-Id: <20230510141932.413348-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
References: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

the vma::rebind_link is protected by the vm's resv, but we was
modifying it without. Fix this by use the vma::userptr_link instead
for the tmp_evict list. The vma::userptr_link is protected by the
vm lock.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0a4becdf4675..5f93d78c2e58 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -764,8 +764,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 		if (err < 0)
 			goto out_err;
 
-		list_del_init(&vma->userptr_link);
-		list_move_tail(&vma->rebind_link, &tmp_evict);
+		list_move_tail(&vma->userptr_link, &tmp_evict);
 	}
 
 	/* Take lock and move to rebind_list for rebinding. */
@@ -773,16 +772,17 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	if (err)
 		goto out_err;
 
-	list_splice_tail(&tmp_evict, &vm->rebind_list);
+	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
+		list_del_init(&vma->userptr_link);
+		list_move_tail(&vma->rebind_link, &vm->rebind_list);
+	}
+
 	dma_resv_unlock(&vm->resv);
 
 	return 0;
 
 out_err:
-	list_for_each_entry_safe(vma, next, &tmp_evict, rebind_link) {
-		list_del_init(&vma->rebind_link);
-		list_add_tail(&vma->userptr_link, &vm->userptr.repin_list);
-	}
+	list_splice_tail(&tmp_evict, &vm->userptr.repin_list);
 
 	return err;
 }
-- 
2.39.2

