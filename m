Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3453B989845
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 00:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A6910E175;
	Sun, 29 Sep 2024 22:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Sun, 29 Sep 2024 22:18:26 UTC
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4714D10E175
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 22:18:26 +0000 (UTC)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id EB548153F903; Mon, 30 Sep 2024 00:10:35 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: 
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Jan Kara <jack@suse.cz>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Set FMODE_UNSIGNED_OFFSET in fop_flags
Date: Mon, 30 Sep 2024 00:10:31 +0200
Message-ID: <20240929221034.1889572-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.2
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

This fixes a regression introduced in commit
641bb4394f405cba498b100b44541ffc0aed5be1.  No panthor device, card or
render node, could be open() since this commit, returning EINVAL
instead.  This prevented Mesa from working on SoCs such as the rk3588
which contains a Mali-G610 GPU.

The commit mentions which drivers must be changed to set that flag, but
panthor seemingly got forgotten, triggering the WARN_ON_ONCE() added
in drm_open_helper().
---
 drivers/gpu/drm/panthor/panthor_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 34182f67136c..c520f156e2d7 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1383,6 +1383,7 @@ static const struct file_operations panthor_drm_driver_fops = {
 	.read = drm_read,
 	.llseek = noop_llseek,
 	.mmap = panthor_mmap,
+	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.46.2

