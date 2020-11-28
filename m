Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15CC2C763B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EBB6ECEB;
	Sat, 28 Nov 2020 22:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6106ECEA
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y7so10570431lji.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQbdoMGfp7HI6Wmt4IR8iWJeCZkxPlinkDvEVc1r82A=;
 b=I6GqQD3fz1EqGD498t1GsLkIHDFsRv7/o3xRXWseWPdVQCKrCv2QN8njbKtX7/+cz+
 smvA7q0jnFm1q/Dd7pQ2F/L2yCX1fFZPKJj0Kw043RE5OWX9f2eAIn3tkU+6HpN70Cji
 AyBSZBvy9qs/unaX+yF8BwNQrOkMG/ffP2VFFu/g7pVCSjL9G+x7Q+Vup9KCo38ZNOIy
 VG2zGt8jy6PeULtQMpE8KtRVaMPR7wrdMa45Aho5tLl8Ai/h9m7nCT0zjkFDzxwxXw45
 bsU1QTW0NdlWDMGK4uCZL+WLbgDejqM9XOPK5RqZfGE7Vq/eMRQT9z11o0frnevy8AyM
 pZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qQbdoMGfp7HI6Wmt4IR8iWJeCZkxPlinkDvEVc1r82A=;
 b=sWdjXXQt74stSnjkGjLlLt8e4E7XDGWmmh5Lsl8zcwuMk99upapW72DkkvcZY+EQKt
 WA25WnHOHSwz9qVN9VMdaLn8fAWHMVo3QRHZMz9T1zQZNRNM58YSa/NqpdO++1sv/nL4
 KYdWTad0znWyBnwL3sHAiOZhSljokjVIFjBkRiwF1i1kb/IoihREJDaeovCpaIv0j5Yj
 cVmf941oWdQX8jA9Az+2gNZ/Os8Dk4gUDGLzxo2wjqOO6kNVRQvw0IXR0CSOjAlu2wXc
 bpcjZsYxK0V6hG4EN55orKxp8e+kR0gcVpUx1tEJN8rT5pVvIj6y+YFPM9cpFSnQaBQW
 NnnA==
X-Gm-Message-State: AOAM533FUEbhJqRY9PNTD4hy5Xjj0LrPKEb9PlC8HJDKLxDgQGTS4vN9
 6S8/Kkph+A7nGSqD2hvYh92wC1+JqvjPSg==
X-Google-Smtp-Source: ABdhPJzFyXGSucNfx9yncv1e42W9SVj8LPo5R/vJS1rgbRNBov9ReHwMEZgrMKy4kizi21GFlNwCQA==
X-Received: by 2002:a2e:535a:: with SMTP id t26mr6393928ljd.87.1606603303293; 
 Sat, 28 Nov 2020 14:41:43 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:42 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 11/28] video: fbdev: via: Fix set but not used warning for
 mode_crt_table
Date: Sat, 28 Nov 2020 23:40:57 +0100
Message-Id: <20201128224114.1033617-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix warning by deleting the variable. The function call
viafb_get_best_mode() were verified to have no side-effects,
and thus could be dropped too.

v2:
  - Update subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/via/lcd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/via/lcd.c b/drivers/video/fbdev/via/lcd.c
index 4a869402d120..088b962076b5 100644
--- a/drivers/video/fbdev/via/lcd.c
+++ b/drivers/video/fbdev/via/lcd.c
@@ -537,11 +537,9 @@ void viafb_lcd_set_mode(const struct fb_var_screeninfo *var, u16 cxres,
 	u32 clock;
 	struct via_display_timing timing;
 	struct fb_var_screeninfo panel_var;
-	const struct fb_videomode *mode_crt_table, *panel_crt_table;
+	const struct fb_videomode *panel_crt_table;
 
 	DEBUG_MSG(KERN_INFO "viafb_lcd_set_mode!!\n");
-	/* Get mode table */
-	mode_crt_table = viafb_get_best_mode(set_hres, set_vres, 60);
 	/* Get panel table Pointer */
 	panel_crt_table = viafb_get_best_mode(panel_hres, panel_vres, 60);
 	viafb_fill_var_timing_info(&panel_var, panel_crt_table);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
