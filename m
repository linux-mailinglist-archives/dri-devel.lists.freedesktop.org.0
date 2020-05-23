Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0981DF813
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 17:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA276E15B;
	Sat, 23 May 2020 15:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF686E15B
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 15:44:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c3so8951743wru.12
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 08:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OuUg6OL2mXh7ZYbX6JSjLVhBprfkiqu9JhNgwtwiSro=;
 b=I8y+/q3vGravuW6jj0r/CrEX5QQxDDvw0rNixH28jxp5ilrs62Fs3rRAFafiGknteg
 UU7HWInsVtzQQMctzoyRtZ9AaMRcYV8IhvW6ABSfFrNVBV3/5ZHf0zQy8KE8uFI2k5H4
 Zqe4jpuQzL/LrZlbcVEngJBE73e1xSZ01Nyq39wIcNHf1PvF2BuuFpEOolFpj8WJfcPD
 Zf8MVKCaC3CswxWfoRpsxkT0+l1034EUUHdW5joN5XRzMadKzpSm8b/q0RSp4tZztiBW
 LHtQgkZaE9gLEIZnbyZvy3aHwlqaBTypn2Toozq2In7igMdZx9hBYbUruNB1AvTPFV1C
 I0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OuUg6OL2mXh7ZYbX6JSjLVhBprfkiqu9JhNgwtwiSro=;
 b=iyqws4XSW3LTiSM62J/F/yqfeAvSAtP7dFBQ/zocOg6YYTKSwpPKR/6vD6XSX6n7AL
 GXQKKofWmCgpJuaUiKWUMVU5h2svtVb+5U4Ts9EVyQPq9t3xLm5t8XWw0QGYw87/TI3/
 YzWhqwwV5x92+lnzn7p2Ma4aGnSriPdrSs3sBeNEy3mi9RMRCj3dDQRJNBhOYaNwl55Z
 mq6kRaQjq38y30eQb06FFvUriJHcCVs7IfQwAg2WzuQ8v/D4FLNdBwvJBzOPolTznJ7l
 NICa/PWiiiS3F0cLVpaU4eKgE2w1GkRYwqEfLbI5CdwsTwlPeYL2YcnVkywaFFnjm7nE
 NW3Q==
X-Gm-Message-State: AOAM531if5nxSv4yaCXdJxkVZmR86x3tPc1h0Ai+YvEEhq8/PbvEu/gP
 fzfNPfdMv6i1WehjveSBZJFwbrAhP88=
X-Google-Smtp-Source: ABdhPJzpHczpeWi7c6oPOR7nzFTi7CN7qdydu+vpg/v0Mi3UgCqTzZyyxnrENexgFzVy81On6WR1OQ==
X-Received: by 2002:adf:e588:: with SMTP id l8mr5339669wrm.255.1590248673948; 
 Sat, 23 May 2020 08:44:33 -0700 (PDT)
Received: from utente-Giga.homenet.telecomitalia.it
 (host216-61-dynamic.16-87-r.retail.telecomitalia.it. [87.16.61.216])
 by smtp.googlemail.com with ESMTPSA id t7sm6493903wrq.41.2020.05.23.08.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 08:44:33 -0700 (PDT)
From: Mauro Rossi <issor.oruam@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] xf86drm: add drmOpenByFB
Date: Sat, 23 May 2020 17:44:26 +0200
Message-Id: <20200523154426.1088988-1-issor.oruam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: robert.foss@collabora.com, Mauro Rossi <issor.oruam@gmail.com>,
 emil.l.velikov@gmail.com, cwhuang@linux.org.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

OpenByFB is introduced to overcome GPU driver loading order issue
on a device with multiple GPUs, e.g. Intel iGPU and Nvidia dGPU
where the first drmfb kernel module loaded will become device file
/dev/dri/card0 and the second will become /dev/dri/card1

The use case is to prefer Intel iGPU over dGPU, or viceversa,
in a deterministic and reliable manner.

OpenByFB function opens the DRM device with specified fb and node type,
thus enabling gralloc to open the correct device node of the primary fb,
regardless of the GPU driver loading order.

Signed-off-by: Chih-Wei Huang <cwhuang@linux.org.tw>
---
 core-symbols.txt |  1 +
 xf86drm.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
 xf86drm.h        |  1 +
 3 files changed, 44 insertions(+)

diff --git a/core-symbols.txt b/core-symbols.txt
index 1ff4ecaa..6bf8c70d 100644
--- a/core-symbols.txt
+++ b/core-symbols.txt
@@ -146,6 +146,7 @@ drmModeSetCursor2
 drmModeSetPlane
 drmMsg
 drmOpen
+drmOpenByFB
 drmOpenControl
 drmOpenOnce
 drmOpenOnceWithType
diff --git a/xf86drm.c b/xf86drm.c
index b49d42f7..229a54bf 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -793,6 +793,48 @@ drm_public int drmOpenRender(int minor)
     return drmOpenMinor(minor, 0, DRM_NODE_RENDER);
 }
 
+/**
+ * Open the DRM device with specified type of specified framebuffer.
+ *
+ * Looks up the associated DRM device with specified type of the
+ * specified framebuffer and opens it.
+ *
+ * \param fb the index of framebuffer.
+ * \param type the device node type to open, PRIMARY, CONTROL or RENDER
+ *
+ * \return a file descriptor on success, or a negative value on error.
+ *
+ */
+drm_public int drmOpenByFB(int fb, int type)
+{
+#ifdef __linux__
+    DIR *sysdir;
+    struct dirent *ent;
+    char buf[64];
+    const char *name = drmGetMinorName(type);
+    int fd = -1, len = strlen(name);
+
+    snprintf(buf, sizeof(buf), "/sys/class/graphics/fb%d/device/drm", fb);
+    sysdir = opendir(buf);
+    if (!sysdir)
+        return -errno;
+
+    while ((ent = readdir(sysdir))) {
+        if (!strncmp(ent->d_name, name, len)) {
+            snprintf(buf, sizeof(buf), "%s/%s", DRM_DIR_NAME, ent->d_name);
+            fd = open(buf, O_RDWR | O_CLOEXEC, 0);
+            break;
+        }
+    }
+
+    closedir(sysdir);
+    return fd;
+#else
+#warning "Missing implementation of drmOpenByFB"
+    return -EINVAL;
+#endif
+}
+
 /**
  * Free the version information returned by drmGetVersion().
  *
diff --git a/xf86drm.h b/xf86drm.h
index 7b85079a..d45d696f 100644
--- a/xf86drm.h
+++ b/xf86drm.h
@@ -605,6 +605,7 @@ extern int           drmOpenWithType(const char *name, const char *busid,
 
 extern int           drmOpenControl(int minor);
 extern int           drmOpenRender(int minor);
+extern int           drmOpenByFB(int fb, int type);
 extern int           drmClose(int fd);
 extern drmVersionPtr drmGetVersion(int fd);
 extern drmVersionPtr drmGetLibVersion(int fd);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
