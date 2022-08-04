Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFBC5898E9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 09:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD288F1CF;
	Thu,  4 Aug 2022 07:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924210EB95
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 07:58:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6909E35189;
 Thu,  4 Aug 2022 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659599914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aJIcRX12CfNWmDhGD9PCw8ypEASoL7YINCO6ZNUt78=;
 b=p5iTtXqGIXcnnzh7pNf+eKpN+ntxtaYAjIYdG8H42boKTlZkf7rkPIJn/ZV1SkUQk+NxFr
 iAp5Werfj2BV9qjAH6+t2VXqaaok/qtAA3VL1zeyk7BtC/LlDralDCgtYwKuGccTg0RVPV
 zWYlQQr2UpzfkfGW6aa8TWmAtOJ4W8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659599914;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aJIcRX12CfNWmDhGD9PCw8ypEASoL7YINCO6ZNUt78=;
 b=XUUT7iEl1HzRcVnz3dgJ+6J91Cdl26LkFiG+8nM6vEb8kmZOG5RorZq4BL+7g2BPHzhUIM
 6eeTexZSd5LTW2Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F8C713AE1;
 Thu,  4 Aug 2022 07:58:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YDevDip862IlJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 04 Aug 2022 07:58:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/udl: Replace BUG_ON() with WARN_ON()
Date: Thu,  4 Aug 2022 09:58:26 +0200
Message-Id: <20220804075826.27036-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220804075826.27036-1-tiwai@suse.de>
References: <20220804075826.27036-1-tiwai@suse.de>
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BUG_ON() is a tasteless choice as a sanity check for a driver like UDL
that isn't really a core code.  Replace with WARN_ON() and proper
error handling instead.

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c     | 3 ++-
 drivers/gpu/drm/udl/udl_transfer.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 47204b7eb10e..fdafbf8f3c3c 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -260,7 +260,8 @@ int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
 	struct udl_device *udl = to_udl(dev);
 	int ret;
 
-	BUG_ON(len > udl->urbs.size);
+	if (WARN_ON(len > udl->urbs.size))
+		return -EINVAL;
 
 	urb->transfer_buffer_length = len; /* set to actual payload len */
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index 971927669d6b..176ef2a6a731 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -220,7 +220,8 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 	u8 *cmd = *urb_buf_ptr;
 	u8 *cmd_end = (u8 *) urb->transfer_buffer + urb->transfer_buffer_length;
 
-	BUG_ON(!(log_bpp == 1 || log_bpp == 2));
+	if (WARN_ON(!(log_bpp == 1 || log_bpp == 2)))
+		return -EINVAL;
 
 	line_start = (u8 *) (front + byte_offset);
 	next_pixel = line_start;
-- 
2.35.3

