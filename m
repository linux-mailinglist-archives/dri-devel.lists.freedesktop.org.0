Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F7836076
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C12F10ED77;
	Mon, 22 Jan 2024 11:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25C610ED63
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B658612EE;
 Mon, 22 Jan 2024 11:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A287C433A6;
 Mon, 22 Jan 2024 11:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921511;
 bh=5YnvEHuFcc8AIaC+xvMeZuB5PSZXwT77cd4oUnrMXeE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fKX8MNHGPf56c71WFeA/o5leTvTrtyVdP4LG00e9KXo1lh8y4ZtslMG6h/0fw5+Iw
 YbdObyOgKu1A/p3mhkyrp49gh1OSzpF2QNOs6R211rTvaNIkH0Z71F9487VX6kqx8z
 /OJm5jtNYXJsz1SxBnmi0tK2lamGaAU79fsJyFst7ZfIOqWPJvzpMOXQUwfh5kgkGh
 lve3PaSSzEgCueFGTQm3EVBraRUMN/JvSw/fkGZMYn8Ige/Pl18ie/ofimUpM+tSFN
 WfOBiXn9z+W/Gfjjmrd/H68558gC5TkEQr0Yk3h7QbXk5wwJo84YIT9PhoRc8Uanhf
 9RZQ0geB7M1MA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 32/47] tty: vt: define a common enum for VESA blanking
 constants
Date: Mon, 22 Jan 2024 12:03:46 +0100
Message-ID: <20240122110401.7289-33-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122110401.7289-1-jirislaby@kernel.org>
References: <20240122110401.7289-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-serial@vger.kernel.org,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are currently two places with VESA blanking constants definitions:
fb.h and console.h. Extract/unify the two to a separate header (vesa.h).

Given the fb's is in an uapi header, create the common header in uapi
too.

Note that instead of macros, an enum (vesa_blank_mode) is created. But
the macros are kept too (they now expand to the enum constants), just in
case someone in userspace performs some #ifdeffery.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---

Notes:
    [v2] new in v2

 include/linux/console.h   |  7 +------
 include/uapi/linux/fb.h   |  8 +-------
 include/uapi/linux/vesa.h | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 13 deletions(-)
 create mode 100644 include/uapi/linux/vesa.h

diff --git a/include/linux/console.h b/include/linux/console.h
index f7c6b5fc3a36..860f82756c9c 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/rculist.h>
 #include <linux/types.h>
+#include <linux/vesa.h>
 
 struct vc_data;
 struct console_font_op;
@@ -520,12 +521,6 @@ void vcs_remove_sysfs(int index);
  */
 extern atomic_t ignore_console_lock_warning;
 
-/* VESA Blanking Levels */
-#define VESA_NO_BLANKING        0
-#define VESA_VSYNC_SUSPEND      1
-#define VESA_HSYNC_SUSPEND      2
-#define VESA_POWERDOWN          3
-
 extern void console_init(void);
 
 /* For deferred console takeover */
diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
index 3a49913d006c..cde8f173f566 100644
--- a/include/uapi/linux/fb.h
+++ b/include/uapi/linux/fb.h
@@ -4,6 +4,7 @@
 
 #include <linux/types.h>
 #include <linux/i2c.h>
+#include <linux/vesa.h>
 
 /* Definitions of frame buffers						*/
 
@@ -293,13 +294,6 @@ struct fb_con2fbmap {
 	__u32 framebuffer;
 };
 
-/* VESA Blanking Levels */
-#define VESA_NO_BLANKING        0
-#define VESA_VSYNC_SUSPEND      1
-#define VESA_HSYNC_SUSPEND      2
-#define VESA_POWERDOWN          3
-
-
 enum {
 	/* screen: unblanked, hsync: on,  vsync: on */
 	FB_BLANK_UNBLANK       = VESA_NO_BLANKING,
diff --git a/include/uapi/linux/vesa.h b/include/uapi/linux/vesa.h
new file mode 100644
index 000000000000..81947f5088cd
--- /dev/null
+++ b/include/uapi/linux/vesa.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_VESA_H
+#define _UAPI_LINUX_VESA_H
+
+/* VESA Blanking Levels */
+enum vesa_blank_mode {
+	VESA_NO_BLANKING	= 0,
+#define VESA_NO_BLANKING	VESA_NO_BLANKING
+	VESA_VSYNC_SUSPEND	= 1,
+#define VESA_VSYNC_SUSPEND	VESA_VSYNC_SUSPEND
+	VESA_HSYNC_SUSPEND	= 2,
+#define VESA_HSYNC_SUSPEND	VESA_HSYNC_SUSPEND
+	VESA_POWERDOWN		= VESA_VSYNC_SUSPEND | VESA_HSYNC_SUSPEND,
+#define VESA_POWERDOWN		VESA_POWERDOWN
+	VESA_BLANK_MAX		= VESA_POWERDOWN,
+};
+
+#endif
-- 
2.43.0

