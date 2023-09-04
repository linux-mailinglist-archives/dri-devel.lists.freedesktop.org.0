Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486AB791DF8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 21:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E5C10E3F9;
	Mon,  4 Sep 2023 19:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-230.mta1.migadu.com (out-230.mta1.migadu.com
 [95.215.58.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043C210E3F1;
 Mon,  4 Sep 2023 19:57:50 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693857468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=di2qHcFYE+Hq+NlRE1bj3bLblQwmCRGCImtdcZKCjUc=;
 b=rJNfpwab0aIQm5RePnYvbfQa2evsIovN8h4+vqXvX+exhBi1P8XMkvYUlqZh4bqcSCK8ec
 a6ItmnAfUtFXDK9qfWMe9SPjx/lb97SKdjyvvILTDduL6DPrrjMNVBrp5AOCHjnpFWhe/1
 eW68Ko1bmHXCj0RZTYHobpMp/Uqx1oA=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [RFC,
 drm-misc-next v4 6/9] drm/loongson: Implement .be_primary() callback
Date: Tue,  5 Sep 2023 03:57:21 +0800
Message-Id: <20230904195724.633404-7-sui.jingfeng@linux.dev>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

On a machine with multiple GPUs, a Linux user has no control over which one
is primary at boot time. This patch tries to solve the mentioned problem by
implementing the .be_primary() callback. Pass loongson.modeset=10 on the
kernel cmd line if you really want the device bound by loongson drm driver
to be the primary video adapter, no matter what VGAARB say.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/loongson_module.c |  2 +-
 drivers/gpu/drm/loongson/loongson_module.h |  1 +
 drivers/gpu/drm/loongson/lsdc_drv.c        | 10 +++++++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/loongson/loongson_module.c b/drivers/gpu/drm/loongson/loongson_module.c
index d2a51bd395f6..12f2a453adff 100644
--- a/drivers/gpu/drm/loongson/loongson_module.c
+++ b/drivers/gpu/drm/loongson/loongson_module.c
@@ -9,7 +9,7 @@
 
 #include "loongson_module.h"
 
-static int loongson_modeset = -1;
+int loongson_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, loongson_modeset, int, 0400);
 
diff --git a/drivers/gpu/drm/loongson/loongson_module.h b/drivers/gpu/drm/loongson/loongson_module.h
index 931c17521bf0..afff51e7f34f 100644
--- a/drivers/gpu/drm/loongson/loongson_module.h
+++ b/drivers/gpu/drm/loongson/loongson_module.h
@@ -6,6 +6,7 @@
 #ifndef __LOONGSON_MODULE_H__
 #define __LOONGSON_MODULE_H__
 
+extern int loongson_modeset;
 extern int loongson_vblank;
 extern struct pci_driver lsdc_pci_driver;
 
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index d10a28c2c494..7183b0666167 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -257,6 +257,14 @@ static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
 	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
 }
 
+static bool lsdc_want_to_be_primary(struct pci_dev *pdev)
+{
+	if (loongson_modeset == 10)
+		return true;
+
+	return false;
+}
+
 static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct lsdc_desc *descp;
@@ -289,7 +297,7 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pdev, ddev);
 
-	vga_client_register(pdev, lsdc_vga_set_decode, NULL);
+	vga_client_register(pdev, lsdc_vga_set_decode, lsdc_want_to_be_primary);
 
 	drm_kms_helper_poll_init(ddev);
 
-- 
2.34.1

