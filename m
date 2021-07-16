Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A0C3CB871
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77E16E993;
	Fri, 16 Jul 2021 14:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD1F6E991
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6DE722B5E;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpoaGH8C4QxEgRWBcRy3HUmdwlMa+i/Mc5NN7sfsWfQ=;
 b=OjTwWEG08wPNZ4tnEnh5ffY3FEali2H9/tlnwBU6eo/ft4A2HCf92w4KgvfBIRs/DhFTor
 jHfG392tmJmQZRYiKuMqt2nZj5cXTUvrmcmQGKsM22PmIP+7FYEvYlRKFd2h3uRrz31pje
 SWgSVFvo04tRKvCvw37Kfgq+swFIX4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpoaGH8C4QxEgRWBcRy3HUmdwlMa+i/Mc5NN7sfsWfQ=;
 b=O161dT1WNnCVggIGy9lzT74boH80K6x1RfPuMfxSCa2oGktzPrcBvb6+PyvlSoOdZtE8+r
 dHHofIntyonrBaBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A6E513C70;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gG3cHMaS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 4/7] drm/gud: Use framebuffer dma-buf helpers
Date: Fri, 16 Jul 2021 16:07:58 +0200
Message-Id: <20210716140801.1215-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716140801.1215-1-tzimmermann@suse.de>
References: <20210716140801.1215-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace dma_buf_begin_cpu_access() with drm_gem_fb_begin_cpu_access();
same for _end_cpu_access(). Remove some boiler-plate code. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gud/gud_pipe.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8f56bf618ac2..4d7a26b68a2e 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -3,7 +3,6 @@
  * Copyright 2020 Noralf Trønnes
  */
 
-#include <linux/dma-buf.h>
 #include <linux/lz4.h>
 #include <linux/usb.h>
 #include <linux/workqueue.h>
@@ -15,6 +14,7 @@
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
@@ -168,11 +168,9 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 
 	vaddr = map.vaddr + fb->offsets[0];
 
-	if (import_attach) {
-		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
-		if (ret)
-			goto vunmap;
-	}
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		goto vunmap;
 retry:
 	if (compression)
 		buf = gdrm->compress_buf;
@@ -225,8 +223,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	}
 
 end_cpu_access:
-	if (import_attach)
-		dma_buf_end_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 vunmap:
 	drm_gem_shmem_vunmap(fb->obj[0], &map);
 
-- 
2.32.0

