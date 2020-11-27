Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906C2C6C46
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BF66F3D5;
	Fri, 27 Nov 2020 19:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDDD6F3CB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:59:04 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q13so7865517lfr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2z/dAT9naUmXE5qac+rK/70T5U7GBI/v+WhPmjvxr84=;
 b=nIf6uBH2ZKJjbyqV2d6fX1XuIPpHe14PCos51II/MmmX9UsTUjGWVLOj+XDbj6IH1j
 j8/sL1YQxZwFnx2Y3tpYvSe+iP7Q+1wGxsJ+yD4vkWHzQmSKxGjWR4+X0/5cnSJ9+E+U
 WU8L7VOqbnPDUiBgbuP1o8nKteYr8nUlMfIakz/XVdAJ6l6kAnJH338CdZnjgiCZ5DUD
 XOUI/EVS71x2AdQ/J+ls/NiRVVOmAiRLBTmVDFdOl0GQV6p5dRPdWOhIZ08Guhys9T6U
 JyMe7MXSkIUSlmCj3gncIzFiqAnQGd5mTmpCJ4wtyjkSqo3ODvAKCw2IRPkz4yJEK8PJ
 fFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2z/dAT9naUmXE5qac+rK/70T5U7GBI/v+WhPmjvxr84=;
 b=LDp/IV5/usjiK0gtBKGGeUviNTDdzv4c7J3XJRr4w9ff3gh+2IHgcFSTdZceBxJfZm
 aZ8gCSFyg3JQuLPH4MgPU/iUoySxW3cQpPiuMuL+PPQyRGhBnECAoFzj6bn7t6+65V+d
 2yD7hKh6OS/0M+9iJDx+7iLGXKfPPaCnRQhYAxaL7BE6CIP2IcH/r9YaKMTdl7OKs/Tt
 loHC42tYe7AAoPay5aqIo5xYFiGHQXwfRhPZaA7Ym+DhzZT7qs+I7Oacu7ZZ77K7+aWo
 1jWMp4oxwjeK7QH7TJGnmYtPxXEVi17jaWXaXfPnJgIWaUC6bo1LutlYCwYdF6eTPguF
 9pzg==
X-Gm-Message-State: AOAM530npUSbCGOtWDzDl+cQBuf6N7mzUPvMBLUIhJgZ3j+qM/Awjrrd
 +udNHPdoOyUbi6dX/ocQpvo=
X-Google-Smtp-Source: ABdhPJxMUz94BHFF6rybfliMhdsF+17CnCkrgs8rTH0atREiGZy+JMiTw0e9sauLh8NOkSqqUM0QRg==
X-Received: by 2002:a05:6512:6c6:: with SMTP id
 u6mr4036455lff.174.1606507142897; 
 Fri, 27 Nov 2020 11:59:02 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:59:02 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 11/28] video: fbdev: via: Fix W=1 warnings
Date: Fri, 27 Nov 2020 20:58:08 +0100
Message-Id: <20201127195825.858960-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127195825.858960-1-sam@ravnborg.org>
References: <20201127195825.858960-1-sam@ravnborg.org>
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
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix W=1 warnings about unused assignment.
Fixed by dropping the assignment and deleting the local variable.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: linux-fbdev@vger.kernel.org
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
