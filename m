Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C159156A2D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2020 13:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6E6E7DC;
	Sun,  9 Feb 2020 12:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805F6E7DC;
 Sun,  9 Feb 2020 12:56:08 +0000 (UTC)
Received: from localhost (unknown [38.98.37.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B429C20733;
 Sun,  9 Feb 2020 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581252968;
 bh=88b+jiwpgJ4eh4zq6QZyT65s5HTf1GVFihv3pXdeOjk=;
 h=Date:From:To:Cc:Subject:From;
 b=bUDlVsVRRlYJVbUk8UEvEePxMHCcUdhp+P19Dgy8MG0YY8FRvE5ZhZO3dllE22ACt
 x2Dr+AP+g/mAlLx3BpmlOin4meeFSER+3+TC7c6EsBsrcgQPkDzG6Ig58zw5Ak606G
 e+1oSlXv+uO0feGVdlismqPSasHLzkE+mgp7iS2c=
Date: Sun, 9 Feb 2020 11:55:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH] nouveau: no need to check return value of debugfs_create
 functions
Message-ID: <20200209105525.GA1620170@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 080e964d49aa..d1c82fc45a68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -224,14 +224,10 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 	struct dentry *dentry;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
-		dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
-					     S_IRUGO | S_IWUSR,
-					     minor->debugfs_root, minor->dev,
-					     nouveau_debugfs_files[i].fops);
-		if (!dentry)
-			return -ENOMEM;
-	}
+	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++)
+		debugfs_create_file(nouveau_debugfs_files[i].name,
+				    S_IRUGO | S_IWUSR, minor->debugfs_root,
+				    minor->dev, nouveau_debugfs_files[i].fops);
 
 	drm_debugfs_create_files(nouveau_debugfs_list,
 				 NOUVEAU_DEBUGFS_ENTRIES,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
