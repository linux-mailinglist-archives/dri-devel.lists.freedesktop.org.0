Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B56FA2DE2B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966A10E14C;
	Sun,  9 Feb 2025 13:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ljabl.com header.i=@ljabl.com header.b="eTVrHzQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Fri, 07 Feb 2025 18:23:23 UTC
Received: from mail.ljabl.com (mail.ljabl.com [88.99.6.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1361D10EB98
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 18:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljabl.com; s=20220906; 
 t=1738952201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=Ch+qIskaDNwt/2agsyI5bwhPfYQItcGSYcTTWq4SB1Y=;
 b=eTVrHzQxSaKJwYhkn1BLWetxXvL5Wqk0G01d3AhCiVdBf2H4KyhDr9h8msxpuQs0qBD82v
 lnKxyOBpmOA8xkmWfC1XJ8XWUTKC0Qbgtg6tHf1cQs4ipXz+dyxA4N0WRn5OFMZEEFbNA+
 iBrFRTG55/GJp8DhrOnJMnyB8zfhR3w=
Received: by ljabl.com (OpenSMTPD) with ESMTPSA id c6a835ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <dri-devel@lists.freedesktop.org>;
 Fri, 7 Feb 2025 18:16:41 +0000 (UTC)
Received: by fluorine (OpenSMTPD) with ESMTPA id eb940e24
 for <dri-devel@lists.freedesktop.org>;
 Fri, 7 Feb 2025 19:16:40 +0100 (CET)
Date: Fri, 7 Feb 2025 18:16:40 +0000
From: Lennart Jablonka <humm@ljabl.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] xf86drm: open real correct render node on non-linux
Message-ID: <Z6ZOCKYTgSboi0hk@fluorine>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailman-Approved-At: Sun, 09 Feb 2025 13:55:44 +0000
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

Tested only on OpenBSD.  Before:

	$ cat drm-name.c
	#include <fcntl.h>
	#include <stdio.h>
	#include <xf86drm.h>

	int
	main(void)
	{
	        int fd = open("/dev/dri/renderD128", O_RDONLY);
	        puts(drmGetRenderDeviceNameFromFd(fd));
	        puts(drmGetPrimaryDeviceNameFromFd(fd));
	        fd = open("/dev/dri/card0", O_RDONLY);
	        puts(drmGetPrimaryDeviceNameFromFd(fd));
	        puts(drmGetRenderDeviceNameFromFd(fd));
	}
	$ cc drm-name.c `pkg-config --cflags --libs libdrm`
	$ ./a.out
	/dev/dri/renderD256
	/dev/dri/card128
	/dev/dri/card0
	/dev/dri/renderD128

after:

	$ ./a.out
	/dev/dri/renderD128
	/dev/dri/card0
	/dev/dri/card0
	/dev/dri/renderD128

Fixes: 293b95e81531 ("xf86drm: open correct render node on non-linux")
---
 xf86drm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xf86drm.c b/xf86drm.c
index 22214417..294f8635 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -3498,6 +3498,8 @@ static char *drmGetMinorNameForFD(int fd, int type)
     const char *dev_name = drmGetDeviceName(type);
     unsigned int maj, min;
     int n;
+    int base = drmGetMinorBase(type);
+    int renderbase = drmGetMinorBase(DRM_NODE_RENDER);
 
     if (fstat(fd, &sbuf))
         return NULL;
@@ -3511,7 +3513,10 @@ static char *drmGetMinorNameForFD(int fd, int type)
     if (!dev_name)
         return NULL;
 
-    n = snprintf(buf, sizeof(buf), dev_name, DRM_DIR_NAME, min);
+    if (min >= renderbase)
+        min -= renderbase;
+
+    n = snprintf(buf, sizeof(buf), dev_name, DRM_DIR_NAME, base + min);
     if (n == -1 || n >= sizeof(buf))
         return NULL;
 
-- 
2.48.0

