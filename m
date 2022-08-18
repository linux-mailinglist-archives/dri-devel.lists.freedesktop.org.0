Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83AA5985B8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909799A2A2;
	Thu, 18 Aug 2022 14:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D82D8BAF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660832719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fC9YoAlYaRoz9rMPLE4asKIxjUKxEIVxQJ6T79z28gE=;
 b=XM21bH/1g4wFAKNBeZrYwb+ZSGEJZJuqtmwYpiGb19NYnjPutGSq0LKtF9VLYgJzV/eEC8
 W2aNa+QW8ZwEq29KlQDlS8hY/gBRIeREFAgnWP7urrYLNyKTTg+Us78AWBTlSDS0AjlNrZ
 KuCHC22N4/Gdj3kFvwNt+HZYE35oxVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-OWqI_6zNN1yrtVMK_mhfMQ-1; Thu, 18 Aug 2022 10:25:13 -0400
X-MC-Unique: OWqI_6zNN1yrtVMK_mhfMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47E79811E80;
 Thu, 18 Aug 2022 14:25:13 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52F1DC15BBA;
 Thu, 18 Aug 2022 14:25:11 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v1 1/4] Drivers: hv: Move legacy Hyper-V PCI video device's
 ids to linux/hyperv.h
Date: Thu, 18 Aug 2022 16:25:05 +0200
Message-Id: <20220818142508.402273-2-vkuznets@redhat.com>
In-Reply-To: <20220818142508.402273-1-vkuznets@redhat.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Deepak Rawat <drawat.floss@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are already two places in kernel with PCI_VENDOR_ID_MICROSOFT/
PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these from core
Vmbus code. Move the defines to a common header.

No functional change.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 3 ---
 drivers/video/fbdev/hyperv_fb.c         | 4 ----
 include/linux/hyperv.h                  | 4 ++++
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 4a8941fa0815..46f6c454b820 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -23,9 +23,6 @@
 #define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
-#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
-
 DEFINE_DRM_GEM_FOPS(hv_fops);
 
 static struct drm_driver hyperv_driver = {
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 886c564787f1..b58b445bb529 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -74,10 +74,6 @@
 #define SYNTHVID_DEPTH_WIN8 32
 #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
 
-#define PCI_VENDOR_ID_MICROSOFT 0x1414
-#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
-
-
 enum pipe_msg_type {
 	PIPE_MSG_INVALID,
 	PIPE_MSG_DATA,
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 3b42264333ef..4bb39a8f1af7 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1516,6 +1516,10 @@ void vmbus_free_mmio(resource_size_t start, resource_size_t size);
 	.guid = GUID_INIT(0xc376c1c3, 0xd276, 0x48d2, 0x90, 0xa9, \
 			  0xc0, 0x47, 0x48, 0x07, 0x2c, 0x60)
 
+/* Legacy Hyper-V PCI video device */
+#define PCI_VENDOR_ID_MICROSOFT 0x1414
+#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
+
 /*
  * Common header for Hyper-V ICs
  */
-- 
2.37.1

