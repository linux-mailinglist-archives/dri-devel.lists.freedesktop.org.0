Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8FB6A1D8E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 15:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CE610EAE4;
	Fri, 24 Feb 2023 14:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0485510EAE4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 14:38:13 +0000 (UTC)
Received: from newone.lan (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 53FD4161ED2;
 Fri, 24 Feb 2023 15:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1677249491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9fwVD4ucwH2c8weBti7L3KPNpxO0LVGqX+ym0nzws2k=;
 b=oraeAmBGBywq8pjgh103DdoByF2y1jGZZ0q5+lzAfmMUA2PdlAEr8XutxxAPAc9SF5Iz5K
 ZHfUv7cfu87cSYYVSQcBqSI3LyB9r9dZBXBsgucjHwYx1k1NMKE82eUiMKHx3TS8U4u3Mm
 fwCHZW0NdNT38rdXJilrk8/jsWm22Bo=
From: David Heidelberg <david@ixit.cz>
To: 
Subject: [RESEND v2 PATCH] init/do_mounts.c: add virtiofs root fs support
Date: Fri, 24 Feb 2023 15:37:51 +0100
Message-Id: <20230224143751.36863-1-david@ixit.cz>
X-Mailer: git-send-email 2.39.1
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
Cc: David Heidelberg <david@ixit.cz>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, wsa+renesas@sang-engineering.com,
 helen.koike@collabora.com, Al Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Make it possible to boot directly from a virtiofs file system with tag
'myfs' using the following kernel parameters:

  rootfstype=virtiofs root=myfs rw

Booting directly from virtiofs makes it possible to use a directory on
the host as the root file system.  This is convenient for testing and
situations where manipulating disk image files is cumbersome.

Reviewed-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
v2: added Reviewed-by and CCed everyone interested.

We have used this option in Mesa3D CI for testing crosvm for
more than one years and it's proven to work reliably.

We are working on effort to removing custom patches to be able to do 
automated apply and test of patches from any tree.                              

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/.gitlab-ci/crosvm-runner.sh#L85
 init/do_mounts.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 811e94daf0a8..11c11abe23d7 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -578,6 +578,16 @@ void __init mount_root(void)
 			printk(KERN_ERR "VFS: Unable to mount root fs via SMB.\n");
 		return;
 	}
+#endif
+#ifdef CONFIG_VIRTIO_FS
+	if (root_fs_names && !strcmp(root_fs_names, "virtiofs")) {
+		if (!do_mount_root(root_device_name, "virtiofs",
+				   root_mountflags, root_mount_data))
+			return;
+
+		panic("VFS: Unable to mount root fs \"%s\" from virtiofs",
+		      root_device_name);
+	}
 #endif
 	if (ROOT_DEV == 0 && root_device_name && root_fs_names) {
 		if (mount_nodev_root() == 0)
-- 
2.39.1

