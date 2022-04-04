Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B074F19B1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 20:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98A810E337;
	Mon,  4 Apr 2022 18:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A245F10E337
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 18:21:22 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 94A2C288EAF;
 Mon,  4 Apr 2022 19:21:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649096480; bh=GyWfp+HeHTYwK4aSUKJ8DnAoQeXr+JgATnb4jaibuiI=;
 h=From:To:Cc:Subject:Date:From;
 b=QaL/Y+DdQViwxgB4HTxopgMpAWyk+cA4uLi2baVKTZJ2fCqtsfPFH7KGA7Pskz1mj
 BMLRIdEb/C3GuKsMt7+L4q+mJU20e4GNsyJ06uCJ0ED31Blo7NwwCBm8WmFdeih0FZ
 jknzzqPLrMGac83SWAP9/GZbbX5ot4kWY2xdhVXn9ATbxOpvHdfOhmUHhRTgjdVEgx
 jgTHZ9w+QLC1StDN5JyNaaNaDNm4EAasFulJtvtUorZ5vVD9K+SMbDpcyWph2UDodY
 khJGSZ1pnG5vd0Ck1lyl9sIl0tyKolgDxXBuiyrxrC9xRoBgPTdxSJMTrCCv+GsHFB
 /Zl+UjiEcBEFA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/atomic: Convert a warning to dbg atomic printk
Date: Mon,  4 Apr 2022 14:21:15 -0400
Message-Id: <20220404182115.18849-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 krastevm@vmware.com, mdaenzer@redhat.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

By default each flip times out after 0.1 sec and a warning about the
time out is added to the kernel log. The warning is harmless because
there's another flip coming right after but it can quickly fill up
the log, e.g. missing 2 flips every second over a 24 hour span will
add about 172 thousand lines to the log.
Skip printing it by default and instead add it to the atomic drm debug
category. It can be trivially enabled via drm.debug=0x10 and it avoids
filling up logs by default.

This is particularly important on vm's where presentation might be CPU
bound and running multiple vm's or under a CPU heavy load can easily
lead to missing mutliple flips and any actual errors are often blamed
on this due to it being so prevalent in the logs.
Fixes a bunch of bugs reported to RedHat (1792515, 1884401, 1896139
and 1884401) and SUSE (210123) where people complain about having
their logs spammed by this message and blame various errors on it.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9603193d2fa1..e88b4d83fd5c 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1566,8 +1566,8 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
 
 		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
 		if (ret == 0)
-			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
-				crtc->base.id, crtc->name);
+			drm_dbg_atomic(dev, "[CRTC:%d:%s] flip_done timed out\n",
+				       crtc->base.id, crtc->name);
 	}
 
 	if (old_state->fake_commit)
-- 
2.32.0

