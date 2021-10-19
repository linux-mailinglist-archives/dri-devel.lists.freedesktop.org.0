Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E14330D0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 10:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDD66EB49;
	Tue, 19 Oct 2021 08:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE2F6EB49
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 08:09:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF7CC219CA;
 Tue, 19 Oct 2021 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634630984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e4h2OQm3/OMSb2mVANuGTrXjzo5Z/FFMckpl8CQSDK8=;
 b=QccBFyPybEvyLGZYKuBZGWbE+wcUcl3QS9AhQpPfYV0urkvmh/gBkhO/l4YmH1P60mDzDn
 1Ysb2CxPlK06+w5EhuzGUj+DqDzs9vVZ6jn2wz190FGmf+4AlXHG74x5iSMbofMyKy/Abp
 lo+0dOKLIhrUiOeAyS40qZHIJtxFXwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634630984;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e4h2OQm3/OMSb2mVANuGTrXjzo5Z/FFMckpl8CQSDK8=;
 b=jmekwaewfLbGk/gGw34uKuXi+GqI4ZlnAeP3kzEXUUW8fcP3Wt8OzRLRfSDFfI6EH9zMgw
 FQRMKe7DT+umfHAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 904E7140EC;
 Tue, 19 Oct 2021 08:09:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PalUIkh9bmFSBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Oct 2021 08:09:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gma500: Remove generic DRM drivers in probe function
Date: Tue, 19 Oct 2021 10:09:42 +0200
Message-Id: <20211019080942.24356-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
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

Gma500 currently removes generic fbdev drivers, but ignores
generic DRM drivers. Use aperture helpers to remove all generic
graphics drivers before loading gma500. Makes gma500 compatible
with simpledrm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/psb_drv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 7a10bb39ef0b..7ea82d7ddfcc 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -19,6 +19,7 @@
 #include <acpi/video.h>

 #include <drm/drm.h>
+#include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
@@ -448,6 +449,17 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *dev;
 	int ret;

+	/*
+	 * We cannot yet easily find the framebuffer's location in memory. So
+	 * remove all framebuffers here.
+	 *
+	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
+	 *       might be able to read the framebuffer range from the device.
+	 */
+	ret = drm_aperture_remove_framebuffers(true, &driver);
+	if (ret)
+		return ret;
+
 	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;

base-commit: 762b53b56af425f89f892e99583dfd84c73d731c
--
2.33.0

