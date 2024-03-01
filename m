Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF9C86EC08
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 23:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A9F10ED7B;
	Fri,  1 Mar 2024 22:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFJCGGbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509FC10ED6D;
 Fri,  1 Mar 2024 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709333352; x=1740869352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bVnzSSL+ptFR9bScjPRTeSZMt2zxy6inczOzPb5j+ac=;
 b=gFJCGGbMB2c+JHcnjFxYxCiEPk4Y+BClNCv8IiEaBb6IMeOhBjso7Phg
 Y2rQeFfELo4aPqaA5TfPs6xVRKfcvZ9nlmQRG5LLRPWF+0Cm8e2G+0g2V
 2xRnZeGhY7oP5J2wpO+xAvkIsc2rAweNgEN2diybriOaF/QoEScPynaq8
 qQ5+OdkqyeikB/LTJDald2TKrCJnjoCFMo1VuChNJaU8A4hRLH+GHAYZD
 WpFdDMIoHsmFp7PsQG8NK70gtUA7VgjFJ08NKp3gqduGO1adIHOCbHbRf
 HA9EOino7U1h0YDy225zfU+u1iK1YUIebSjp44Fs7QGDXWsN2nfCwiVGZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3752203"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3752203"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; d="scan'208";a="45870697"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:49:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 2/4] drm/xe: Validate user fence during creation
Date: Fri,  1 Mar 2024 14:49:17 -0800
Message-Id: <20240301224919.271153-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301224919.271153-1-matthew.brost@intel.com>
References: <20240301224919.271153-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fail invalidate addresses during user fence creation.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index c836a5f3a1ea..c20e1f9ad267 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -53,14 +53,18 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
+	u64 __user *ptr = u64_to_user_ptr(addr);
+
+	if (!access_ok(ptr, sizeof(ptr)))
+		return ERR_PTR(-EFAULT);
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
 	if (!ufence)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ufence->xe = xe;
 	kref_init(&ufence->refcount);
-	ufence->addr = u64_to_user_ptr(addr);
+	ufence->addr = ptr;
 	ufence->value = value;
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
@@ -183,8 +187,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		} else {
 			sync->ufence = user_fence_create(xe, sync_in.addr,
 							 sync_in.timeline_value);
-			if (XE_IOCTL_DBG(xe, !sync->ufence))
-				return -ENOMEM;
+			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
+				return PTR_ERR(sync->ufence);
 		}
 
 		break;
-- 
2.34.1

