Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A169F4B1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 13:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828C410E046;
	Wed, 22 Feb 2023 12:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8789410E046;
 Wed, 22 Feb 2023 12:37:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4769D33C4B;
 Wed, 22 Feb 2023 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677069436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SqdJQF9PvSFcHv+I542kYNSFxmtqtO/Dx9JuOTfyIyA=;
 b=Jg41V/kJXgZXGJbTkn6pudKJkxW7vABqFp+UFWA26n/veR+2nyZ9MMnbVlIHDI26FuMPOr
 Ymuo1NH9k1sV5Lb2PcDrGa5VdS/cs/aCrmqngyu57L0lOgEEthjRD3kOM3BMz9pix4rHCr
 sePVmImmhmUrfmBSBpm0QvPd30mqzGA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677069436;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SqdJQF9PvSFcHv+I542kYNSFxmtqtO/Dx9JuOTfyIyA=;
 b=3+FyF+Pq27THe+g2YFZ9TAgDQW4e9jbfK28bkWUVAXs03LuHU/lnt7avOS8yNVrV2wKbPK
 o9VeUNXjaEcF69CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 199FF133E0;
 Wed, 22 Feb 2023 12:37:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hEBTBXwM9mP9SQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Feb 2023 12:37:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH] drm/msm: Fix possible uninitialized access in fbdev
Date: Wed, 22 Feb 2023 13:37:12 +0100
Message-Id: <20230222123712.5049-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not run drm_fb_helper_unprepare() if fbdev allocation fails. Avoids
access to an uninitialized pointer. Original bug report is at [1].

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 3fb1f62f80a1 ("drm/fb-helper: Remove drm_fb_helper_unprepare() from drm_fb_helper_fini()")
Link: https://lore.kernel.org/oe-kbuild-all/202302220810.9dymwCQ8-lkp@intel.com/ # 1
---
 drivers/gpu/drm/msm/msm_fbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index c804e5ba682a..d26aa52217ce 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -136,13 +136,13 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_fbdev *fbdev = NULL;
+	struct msm_fbdev *fbdev;
 	struct drm_fb_helper *helper;
 	int ret;
 
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
 	if (!fbdev)
-		goto fail;
+		return NULL;
 
 	helper = &fbdev->base;
 
-- 
2.39.2

