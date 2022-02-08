Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8882C4AE2DD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569BA10E4C1;
	Tue,  8 Feb 2022 21:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4186610E50F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id c192so142064wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/n/16RZ52OxmA0UdDabSATFo04ROfy75nWG7tM3V6I=;
 b=hRasZriqWBEeJzoUOLv/QgNtugplRHjEQRKqik65NeifTKzyRf0hhvBW1KWOkIoadP
 3babK90zxgB9jGgUf/UNp4JC9Y+PrFYPgiRob7sYtSxpvX3uoVU0VosLdxIxxSp78Mvv
 nGxEaJzOsmX/d0hVbISOd5f0gVyHiJlADJFE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+/n/16RZ52OxmA0UdDabSATFo04ROfy75nWG7tM3V6I=;
 b=rmIAAiwu1SWTVQTzDJcZ98GnNhGhi8w2bb9lKJmjaLpIfzihK5OIBUV0RLh0Wg+JCb
 UQ4FaoLc7JsE0jpIXpbIyWJOUww46wogr5UqP23R1e1DEuypaM3Qf0QTS3PqSCqHDYz1
 UbWsjtmW9bRXYWWCKFiCJB2kx5eqoVqAZg9bBg7/RXgi3n7x/MHWT+nl2xbhOoBn60Y/
 9Ueh2qnyl0Um0l3Ed0bt+6DWGzQKnrMoXA47VqDy7tMoyYMNW74Lv8AS50TZEZJw4Bqe
 p3JyiaQSP8b5XBbtRhVFMy3G+ioFGTK1PQu1hu+joXuXy4arEsb2RQ52R2wZvsLpItWs
 Kqag==
X-Gm-Message-State: AOAM530Qrzb2z2UIYVS86UHpnqJlKdNEfySbbC3hMrWebuH21goH5Ys6
 91nSV+GZFBlX+Amd2V8xWHkJR7nbTa7Qdg==
X-Google-Smtp-Source: ABdhPJxmKGvfzwrGcNB45zpKYvGa2R6htrHXkrCRtBsrNPeFRtFyXvFPfIN1bLeHK+Zv9iVuAwVA7Q==
X-Received: by 2002:a1c:f60b:: with SMTP id w11mr2637250wmc.138.1644354518818; 
 Tue, 08 Feb 2022 13:08:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:35 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 05/19] fbdev/sysfs: Fix locking
Date: Tue,  8 Feb 2022 22:08:10 +0100
Message-Id: <20220208210824.2238981-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Qing Wang <wangqing@vivo.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fb_set_var requires we hold the fb_info lock. Or at least this now
matches what the ioctl does ...

Note that ps3fb and sh_mobile_lcdcfb are busted in different ways here,
but I will not fix them up.

Also in practice this isn't a big deal, because really variable fbdev
state is actually protected by console_lock (because fbcon just
doesn't bother with lock_fb_info() at all), and lock_fb_info
protecting anything is really just a neat lie. But that's a much
bigger fish to fry.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Qing Wang <wangqing@vivo.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/fbsysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 26892940c213..8c1ee9ecec3d 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -91,9 +91,11 @@ static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
 
 	var->activate |= FB_ACTIVATE_FORCE;
 	console_lock();
+	lock_fb_info(fb_info);
 	err = fb_set_var(fb_info, var);
 	if (!err)
 		fbcon_update_vcs(fb_info, var->activate & FB_ACTIVATE_ALL);
+	unlock_fb_info(fb_info);
 	console_unlock();
 	if (err)
 		return err;
-- 
2.34.1

