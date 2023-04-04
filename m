Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C755E6D60D9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 14:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCAB10E25A;
	Tue,  4 Apr 2023 12:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1722910E25A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 12:36:30 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b20so129989248edd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680611788; x=1683203788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ytb1Vj4ccJ8fQhhuaM6FADRjPSh2hGFkD2p+/X8w2sQ=;
 b=F/3ENKHkSYxaFUpT33R//n7OuGJ+0CXCwZgjCXPQx5kryiqI28kGX6v3VImyd6HHkL
 EHqo0zkYpfaIoFlxPzlPB4N/gno7PN39P4foM/iXnnRDyRssj8u57TkAjfbw/Rw64GZH
 +KryYEJVU9DGuyIK+53HfknTT1sDDSjgtT5Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680611788; x=1683203788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ytb1Vj4ccJ8fQhhuaM6FADRjPSh2hGFkD2p+/X8w2sQ=;
 b=RQqeGDu80cOGS/Op3ed3AgYP8s/3nyUom6ZjwRIGEWFWIuawMnrlqnkZ39by7Q95kH
 OFiVJKPcP0xFTPXhNRLKv9JJVFhs15Nzi/2fNaE+zjH6mq9n5jkUHHVT8D0I3eSz756R
 WGbIsYAan7vUKPlQ9eQXlTPK5BFYhCqRyLkdUZeM5z7snFOwDPPwGLbgamOw8Brcdqj/
 PkuQTAmxdC4iuMMu2M31y+Xt43ls8ql4KSk5J87EgEovAr3D4y8npSf1wu6w4d/KXCrk
 Zgq0GHwodt+Ka77M0OdnWP4xxuQ8s1n3W6rGVEciPfcrA5rVzw/aB5dmJvgjT5vzy22i
 d2kA==
X-Gm-Message-State: AAQBX9e//lAY1HYcBPvvp25yu/5IMaOHNHwDCRJ8EY8ZnqO0NBZC//NX
 H885KhsQsjYR3Mluacd4P/MRjXbdry405eduEQY=
X-Google-Smtp-Source: AKy350YazvVsTB8X9wr7pFrnVUPrxE/2xq65YwKSqqMdrVcrAQL3zV3EzyW7APLGff+i6K+q2N2/IA==
X-Received: by 2002:a17:906:51cd:b0:949:148d:82c1 with SMTP id
 v13-20020a17090651cd00b00949148d82c1mr1762449ejk.0.1680611787958; 
 Tue, 04 Apr 2023 05:36:27 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 j3-20020a170906050300b00947a40ded80sm5761642eja.104.2023.04.04.05.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 05:36:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
Date: Tue,  4 Apr 2023 14:36:24 +0200
Message-Id: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a few reasons the kernel should not spam dmesg on bad
userspace ioctl input:
- at warning level it results in CI false positives
- it allows userspace to drown dmesg output, potentially hiding real
  issues.

None of the other generic EINVAL checks report in the
FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.

I guess the intent of the patch which introduced this warning was that
the drivers ->fb_check_var routine should fail in that case. Reality
is that there's too many fbdev drivers and not enough people
maintaining them by far, and so over the past few years we've simply
handled all these validation gaps by tighning the checks in the core,
because that's realistically really all that will ever happen.

Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=c5faf983bfa4a607de530cd3bb008888bf06cefc
Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_var()")
Cc: Helge Deller <deller@gmx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: stable@vger.kernel.org # v5.4+
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/video/fbdev/core/fbmem.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 875541ff185b..9757f4bcdf57 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1021,10 +1021,6 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	/* verify that virtual resolution >= physical resolution */
 	if (var->xres_virtual < var->xres ||
 	    var->yres_virtual < var->yres) {
-		pr_warn("WARNING: fbcon: Driver '%s' missed to adjust virtual screen size (%ux%u vs. %ux%u)\n",
-			info->fix.id,
-			var->xres_virtual, var->yres_virtual,
-			var->xres, var->yres);
 		return -EINVAL;
 	}
 
-- 
2.40.0

