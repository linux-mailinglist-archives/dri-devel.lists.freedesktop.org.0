Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A126F61F3C1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4741210E301;
	Mon,  7 Nov 2022 12:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415CF10E301
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:53:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1FA722544;
 Mon,  7 Nov 2022 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667825613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zfnyo7y3sPdwBcUbyOPvRXhIVbZb533SsTz/Mc7tVkM=;
 b=L8oaNPFnGCTxPbTAjpydbZqwiVwYCeSiKU7eRmciRD9W0yKpRxpCc2QBNUgNaBey9A9ltM
 0oJhl8vFWQBVtdKLjzTgukHwBRTZwDyNmBKvnbSP+8mVxKNHs1Y+5SCH/ux4UGjNq9qLOE
 K49+BxBtjzOLH4u7Hq1e30ZCDtOKzSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667825613;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zfnyo7y3sPdwBcUbyOPvRXhIVbZb533SsTz/Mc7tVkM=;
 b=3WkAQ0JxoQ25hgj+pEZGvep4uXW4yRqs3f6xz50YyUuGlDf6BStuZ9FA1VEDKjr8jbDd/X
 H8pLHWukyTNbDtDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99E3513AC7;
 Mon,  7 Nov 2022 12:53:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UFGeJM3/aGMDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 12:53:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com
Subject: [PATCH 0/3] drm/fb-helper: Build fixes for cleanup
Date: Mon,  7 Nov 2022 13:53:26 +0100
Message-Id: <20221107125329.12842-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleaning up the fbdev code produced a number of simple build
errors. Fix them.

Thomas Zimmermann (3):
  drm/fbdev: Include <linux/vmalloc.h>
  drm/hisilicon/hibmc: Include <linux/io.h> for readl() and writel()
  drm/fb-helper: Document struct drm_fb_helper.hint_leak_smem_start

 drivers/gpu/drm/drm_fbdev_generic.c              | 1 +
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 2 ++
 include/drm/drm_fb_helper.h                      | 7 +++++++
 3 files changed, 10 insertions(+)

-- 
2.38.0

