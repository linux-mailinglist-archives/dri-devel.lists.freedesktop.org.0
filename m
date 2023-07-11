Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1D974EC70
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3806110E37B;
	Tue, 11 Jul 2023 11:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389E010E379
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB66861485;
 Tue, 11 Jul 2023 11:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D34C433CA;
 Tue, 11 Jul 2023 11:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073967;
 bh=hQA5QLicVgrPAVk0QXpv8p873QJnrbqy0dif3WEwaXo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oGnz2BtfpUyRpjNvs3eY/eLgfp1VMXQqiS2CwxVfJcOjqYVF53jdP9u3luZv5nszp
 QmyFxUV1Zhqx36OFfeGyjdzO2+9tzM94X0efrP53tfeGwtRqfLSUUatdeRHNfTLdb7
 qGddOfWS2EP05BbGpkdtj6l3uxGkAxJpy1AvasTQKjvzfLxp0Q6RjRDv81V655tGyl
 0drcnT/OojQaT3TFhAxmBEReVm34H2/S93eDutPeFl95xHK5zm6UGOh9LFxiSSyCbh
 K+zstMtM4hf383FMSl58UGSZlMfgUWo0GgMsTEu7tUbX4TmXN376QBtP1WR5zfH6vn
 +ZNJxdJs0SJkw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/12] accel/habanalabs: release user interfaces earlier in
 device fini
Date: Tue, 11 Jul 2023 14:12:26 +0300
Message-Id: <20230711111226.163670-12-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711111226.163670-1-ogabbay@kernel.org>
References: <20230711111226.163670-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

Currently the sysfs/debugfs interfaces and device un-registration are
done as the last thing in hl_device_fini(), after several finalizations
and releases are done.
While a disabled flag is set at the beginning of hl_device_fini(), and
it is being checked when handling user accesses to these interfaces,
this check is not hermetic and it is better to just reverse the order
of the code in hl_device_fini().

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index c0c9e9504672..5293ac3c7988 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2408,6 +2408,12 @@ void hl_device_fini(struct hl_device *hdev)
 
 	hdev->fw_loader.fw_comp_loaded = FW_TYPE_NONE;
 
+	/* Hide devices and sysfs/debugfs files from user */
+	cdev_sysfs_debugfs_remove(hdev);
+	drm_dev_unregister(&hdev->drm);
+
+	hl_debugfs_device_fini(hdev);
+
 	/* Release kernel context */
 	if ((hdev->kernel_ctx) && (hl_ctx_put(hdev->kernel_ctx) != 1))
 		dev_err(hdev->dev, "kernel ctx is still alive\n");
@@ -2436,12 +2442,6 @@ void hl_device_fini(struct hl_device *hdev)
 
 	device_early_fini(hdev);
 
-	/* Hide devices and sysfs/debugfs files from user */
-	cdev_sysfs_debugfs_remove(hdev);
-	drm_dev_unregister(&hdev->drm);
-
-	hl_debugfs_device_fini(hdev);
-
 	pr_info("removed device successfully\n");
 }
 
-- 
2.34.1

