Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6F4A50E4
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8DA10E4A3;
	Mon, 31 Jan 2022 21:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488A10E494
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s18so27876305wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gNEcCsAHbmO8BObbR0rzHcF3KU0XqbiUyO0AgqiLr9Q=;
 b=XB0If8d+oNzt5EGFOz/pJSfVqwossHreq5Z3/8sGNGT1tWVb8HeX+PuSX4HzuKCtxL
 85Ce3vd3TA/uayqURoZ6LVnYYD+zcPj1L3cM6aaDGzt5LCXHqB2YeYKof0DAcvGHjWoE
 WAj/NXLBP9zyNJqrR3yjJ4zw+CAjDKmq/tKN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gNEcCsAHbmO8BObbR0rzHcF3KU0XqbiUyO0AgqiLr9Q=;
 b=iyG/iBqZwCtsLLbVpDsXGNCnxGc3F+DEDoIde2VcrgLk7a/a14uDevPLSVnrOo7zp/
 Fppp0FDkitMQ5+JqZxs04UfjE1TIvG9rFx7/O1qR0e04mWp7y2PeiE4ghW9HaVt02wsL
 WSnb/y3Oq43RmHad62kh19fTZTJzTEkrLVrLJqw2tby2A4pI+yU9SmiAUJ0cKHUINMsb
 lleF13zmyzOPl8OqcipCQvViBsTs/LBlrAhF6r+KHiqL6vtwgs66RFgYrPuzjDw2R7EX
 VhFPGEFw1N0Mj54ztbTqYZJrKWJqJiKgz6M+ipDZ1xJskcGD9QvVtnNIjIeAJtfzqh53
 3BBg==
X-Gm-Message-State: AOAM532H492QR4QuN28yA9fTYY1YoGfT9wOU64vH64MAtT3PsyWHcUWJ
 mUBaEjuGM5vLX74aWFrHsYlkXtZXqX5kRA==
X-Google-Smtp-Source: ABdhPJyCY4pMX5KDnbLHXSX+AzjieeB1bfyqYC6ZVcKQr80N8d2mwo0uPWz2LhfKAg4dG48zDem7wQ==
X-Received: by 2002:a05:6000:1d90:: with SMTP id
 bk16mr9737566wrb.217.1643663201557; 
 Mon, 31 Jan 2022 13:06:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:41 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/21] fbdev/sysfs: Fix locking
Date: Mon, 31 Jan 2022 22:05:38 +0100
Message-Id: <20220131210552.482606-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
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
2.33.0

