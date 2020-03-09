Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E717DF74
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 13:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389A6E25C;
	Mon,  9 Mar 2020 12:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33D46E25C;
 Mon,  9 Mar 2020 12:02:15 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20494481-1500050 
 for multiple; Mon, 09 Mar 2020 12:01:52 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Mark up racy check of drm_gem_object.handle_count
Date: Mon,  9 Mar 2020 12:01:51 +0000
Message-Id: <20200309120151.7675-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Cc: mika.kuoppala@linux.intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ 1715.899800] BUG: KCSAN: data-race in drm_gem_handle_create_tail / drm_gem_object_handle_put_unlocked
[ 1715.899838]
[ 1715.899861] write to 0xffff8881830f3604 of 4 bytes by task 7834 on cpu 1:
[ 1715.899896]  drm_gem_handle_create_tail+0x62/0x250
[ 1715.899927]  drm_gem_open_ioctl+0xc1/0x160
[ 1715.899956]  drm_ioctl_kernel+0xe4/0x120
[ 1715.899981]  drm_ioctl+0x297/0x4c7
[ 1715.900003]  ksys_ioctl+0x89/0xb0
[ 1715.900027]  __x64_sys_ioctl+0x42/0x60
[ 1715.900052]  do_syscall_64+0x6e/0x2c0
[ 1715.900079]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1715.900100]
[ 1715.900119] read to 0xffff8881830f3604 of 4 bytes by task 8137 on cpu 0:
[ 1715.900149]  drm_gem_object_handle_put_unlocked+0x31/0x130
[ 1715.900180]  drm_gem_object_release_handle+0x93/0xe0
[ 1715.900208]  drm_gem_handle_delete+0x7b/0xe0
[ 1715.900235]  drm_gem_close_ioctl+0x61/0x80
[ 1715.900264]  drm_ioctl_kernel+0xe4/0x120
[ 1715.900291]  drm_ioctl+0x297/0x4c7
[ 1715.900316]  ksys_ioctl+0x89/0xb0
[ 1715.900340]  __x64_sys_ioctl+0x42/0x60
[ 1715.900363]  do_syscall_64+0x6e/0x2c0
[ 1715.900388]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a9e4a610445a..37627d06fb06 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -218,7 +218,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	bool final = false;
 
-	if (WARN_ON(obj->handle_count == 0))
+	if (WARN_ON(READ_ONCE(obj->handle_count) == 0))
 		return;
 
 	/*
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
