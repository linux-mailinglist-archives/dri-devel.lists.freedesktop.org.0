Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2209C153B06
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 23:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4926F965;
	Wed,  5 Feb 2020 22:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Wed, 05 Feb 2020 22:36:25 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B666F965
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 22:36:25 +0000 (UTC)
Received: from zyt.lan (unknown [IPv6:2a02:169:3df5::564])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 2D3E25C4363;
 Wed,  5 Feb 2020 23:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1580941853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=8j/wLPVNelocFC7g7KIME69AY5HWX79CB2Mc0G7rnng=;
 b=AWS1XuQcm4wvY/QLxoLWaINZ0MDRA75jAX35f8zRoS6r4tFVmWTqPmL0I7WYIrC4kvVvhd
 hcjShldOactnbRSkfznuWKTcF1ZH9Acnx2rkPeOkl+VbQ5KqHI/v5P5cGUk2egYt/K6q7J
 nfieAP0L3J1FAE6CVr18oXS2vU964mA=
From: Stefan Agner <stefan@agner.ch>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel.vetter@ffwll.ch
Subject: [PATCH] drm: Add missing newline after comment
Date: Wed,  5 Feb 2020 23:26:00 +0100
Message-Id: <586aab08af596120f48858005bb6784c83035d59.1580941448.git.stefan@agner.ch>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
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
Cc: airlied@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang prints a warning:
drivers/gpu/drm/drm_lock.c:363:6: warning: misleading indentation;
statement is not part of the previous 'if' [-Wmisleading-indentation]
         */     mutex_lock(&dev->struct_mutex);
                ^
drivers/gpu/drm/drm_lock.c:357:2: note: previous statement is here
        if (!drm_core_check_feature(dev, DRIVER_LEGACY))
        ^

Fix this by adding a newline after the multi-line comment.

Fixes: 058ca50ce3f1 ("drm/legacy: move lock cleanup for master into lock file (v2)")
Link: https://github.com/ClangBuiltLinux/linux/issues/855
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/drm_lock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 2e8ce99d0baa..2c79e8199e3c 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -360,7 +360,8 @@ void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *m
 	/*
 	 * Since the master is disappearing, so is the
 	 * possibility to lock.
-	 */	mutex_lock(&dev->struct_mutex);
+	 */
+	mutex_lock(&dev->struct_mutex);
 	if (master->lock.hw_lock) {
 		if (dev->sigdata.lock == master->lock.hw_lock)
 			dev->sigdata.lock = NULL;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
