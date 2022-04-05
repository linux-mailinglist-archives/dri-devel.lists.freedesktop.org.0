Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D94F3F80
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B09410ED47;
	Tue,  5 Apr 2022 21:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB59E10E2F6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b19so293249wrh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=njFWdYQAaDqfYiD2Xn7UdOgkX8BhGZCyAilm6L8VvPw=;
 b=Z0d8OxH3ma5gI6/t6TzMdj48KE3+eiq0RZyPQCPmAJ1MplwnCCfyaophe2UKF9ZRzi
 B3ZkDS8Ha2/SXBUXiftFNODgiET8wur75TONlwUzrCnrwGFlREz9rgL5kIcBJYiA0wBm
 khIZvqpVsxX3jBHxq+lpQqJR3NGOZf/Xs9pU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=njFWdYQAaDqfYiD2Xn7UdOgkX8BhGZCyAilm6L8VvPw=;
 b=oE6yEqFvV+yJXiH3wUvUibz4NDCZm0YTUrLxpU9Z/UefWp4LbbcVNjGyOeedKSxNBp
 NprNXo1r2NIzNmN5g/6wp0b7NL7vxGEGtGobXancHXyPcjSHqUCFu20VS5UAvNBOQVI+
 ff95fvhC7bWA0NRTpRxfkhRA1pmG3uVnc/garY6gJerZyavPDjAD3XTTVjBlh7Chwl0s
 bCglyvZc+26BP48MeG+C7hugLQ5cC0plokaoeV8VROxiYpNGgWa2kbTNoRXnAmCRwqW9
 pqiW2t8plYMXePCkpvPe03IYXmrPHU/wxEE7/RGHMxllqCeaHfyxW15xZb169K32qalm
 W5dg==
X-Gm-Message-State: AOAM532emrRKulduyn2YZ7mZSRCksbJKGqgPl55+rkHcYP27DuR/gzTf
 d2K/EUXisHZpDVLA00fePNR2xxKPqFkctUUiSXw=
X-Google-Smtp-Source: ABdhPJxlOdCJ/qt4T+oOpatacnW0/s0GVKsccDWptFVX6UqCj8tkJTJcNhZasLpAvMDa4wko0z+3Xw==
X-Received: by 2002:a5d:47a9:0:b0:205:d662:c1e1 with SMTP id
 9-20020a5d47a9000000b00205d662c1e1mr4107166wrb.577.1649192626375; 
 Tue, 05 Apr 2022 14:03:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 05/17] fbdev/sysfs: Fix locking
Date: Tue,  5 Apr 2022 23:03:23 +0200
Message-Id: <20220405210335.3434130-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Qing Wang <wangqing@vivo.com>, Thomas Zimmermann <tzimmermann@suse.de>,
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

