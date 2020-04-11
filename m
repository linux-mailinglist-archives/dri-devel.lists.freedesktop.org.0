Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2051A54DF
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3D56E358;
	Sat, 11 Apr 2020 23:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579306E358
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 23:08:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 876F92173E;
 Sat, 11 Apr 2020 23:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646499;
 bh=T6vLV0I9Z44mhyDrMafziRQiy2e9aQq8OQOLsX3aPN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Uyl9USwkiHAVKc/mfeHSakT5dfci9dGkzQuAuVg5PBlEKjJOhyw58Xj5JtDQO08iw
 kXjq+8dSbuZFmwsM/OinpZnjbHv8P/2hCCUq3sYWpOG6HJ3n7aVeEnUmark0i3KCFj
 FKoM70qevpy27XWIIQDGzBxfP6wK7zAn7k0y2TkA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 060/121] fbdev: potential information leak in
 do_fb_ioctl()
Date: Sat, 11 Apr 2020 19:06:05 -0400
Message-Id: <20200411230706.23855-60-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 Andrea Righi <righi.andrea@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit d3d19d6fc5736a798b118971935ce274f7deaa82 ]

The "fix" struct has a 2 byte hole after ->ywrapstep and the
"fix = info->fix;" assignment doesn't necessarily clear it.  It depends
on the compiler.  The solution is just to replace the assignment with an
memcpy().

Fixes: 1f5e31d7e55a ("fbmem: don't call copy_from/to_user() with mutex held")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Andrea Righi <righi.andrea@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Peter Rosin <peda@axentia.se>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200113100132.ixpaymordi24n3av@kili.mountain
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 6f6fc785b5453..28158e21672ad 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1110,7 +1110,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 		break;
 	case FBIOGET_FSCREENINFO:
 		lock_fb_info(info);
-		fix = info->fix;
+		memcpy(&fix, &info->fix, sizeof(fix));
 		if (info->flags & FBINFO_HIDE_SMEM_START)
 			fix.smem_start = 0;
 		unlock_fb_info(info);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
