Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1E822DFD0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0763589EA3;
	Sun, 26 Jul 2020 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB046E0AB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 05:20:56 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id u8so5982846qvj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 22:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=10G3Z7zc2hpC9xFkXBhwCWtTHJ66WyVHYUrUeWXwqKc=;
 b=M6tMLNPmHDwRPfUV/IcFUmlGGdPnUDIJGtLFqruOJH7NnHWLTk1cw4HxXlnFBwh4K1
 g/yT+XHVjAcliIlb83NW843FatIudzqZ5kOFuTdbe6jF3auvR+aYkC6qPoliSDXoaxyk
 Y1DS0Mg1uPEVk5hJae6iSEWZyLH7GbB9YsO+zYldksunAUV8viyeTbjp3ZtqyCn0r2FY
 BZpHH5axCbqggTHuvzQQAYi1mC9PQ2SDVJOU4eVT8WSQbDoeqVnaVe7jC2kUBgkfLCj+
 /o5Z+OmSCmovhr/qByM3tPIiWDoMKEvhivDScza+wYRgayCxMscK5i4bAN/F5O+KjAT7
 zwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=10G3Z7zc2hpC9xFkXBhwCWtTHJ66WyVHYUrUeWXwqKc=;
 b=Ligpa6rkWsDnQrtrNXlP78IhNIbrI0wcPY3IOwgbVE1RoNQk9ztwFWxEiTObQoWSq+
 up7WM4HTPKTRMgM2b/CcPyWjikZE9kDE09WWk7c4yTnkN9X6sOjfJHUCNowJ9aGzM+Wo
 SNuzATe9eDbXMmob/n6QJuIJSYgeIWTBqddqtxbjGHkOAO72S1C4/3P+8c/lI65GvHaD
 MquEXYmQ5jJF/4TSVaJHdCJ4wOYDLNhbIeSgYDvvmyDHHiHvpMkHJsYq+ckExjDtpRoJ
 FbshRnI/4KxXt7og3byDsLAdXIQBUq/Vjczc5jBdkg+vdfU3jii8BEy56VL6mGTMJRgn
 x3uw==
X-Gm-Message-State: AOAM530dDGA32Ld3f+dWc+U6POliRYVD6uKHO8mEbbv4XZyfuFnTKHpv
 MgZ5CW+z6SwNIlrQocaULI8=
X-Google-Smtp-Source: ABdhPJwNOivgw43Vn9IA5nLTrZOB3NaVskEB1shd7sPm43WXFeLNIjFckNZ1t5DJKuOlDAzRNs9P1g==
X-Received: by 2002:a0c:ffc6:: with SMTP id h6mr12098268qvv.251.1595740856028; 
 Sat, 25 Jul 2020 22:20:56 -0700 (PDT)
Received: from linux.home ([2604:2000:1344:41d:159c:94c1:6e96:1b7e])
 by smtp.googlemail.com with ESMTPSA id
 t65sm13364129qkf.119.2020.07.25.22.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 22:20:55 -0700 (PDT)
From: Gaurav Singh <gaurav1086@gmail.com>
To: gaurav1086@gmail.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] [video/fbdev] mbxfb_remove: fix null pointer dereference
Date: Sun, 26 Jul 2020 01:20:45 -0400
Message-Id: <20200726052047.9856-1-gaurav1086@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function mbxfb_debugfs_remove() accesses fbi->par without NULL check,
hence do the NULL check in the caller mbxfb_remove().

Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
---
 drivers/video/fbdev/mbx/mbxfb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/mbx/mbxfb.c b/drivers/video/fbdev/mbx/mbxfb.c
index 6dc287c819cb..515c0cda1994 100644
--- a/drivers/video/fbdev/mbx/mbxfb.c
+++ b/drivers/video/fbdev/mbx/mbxfb.c
@@ -1012,11 +1012,10 @@ static int mbxfb_remove(struct platform_device *dev)
 
 	write_reg_dly(SYSRST_RST, SYSRST);
 
-	mbxfb_debugfs_remove(fbi);
-
 	if (fbi) {
 		struct mbxfb_info *mfbi = fbi->par;
 
+		mbxfb_debugfs_remove(fbi);
 		unregister_framebuffer(fbi);
 		if (mfbi) {
 			if (mfbi->platform_remove)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
