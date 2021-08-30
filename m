Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9134F3FB187
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 09:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FC389AA2;
	Mon, 30 Aug 2021 07:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A4A89D77
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 03:30:56 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id e7so12132275pgk.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 20:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LVrIEBdknSQXfx0VWfJkptFor1oJQkXATIr1CLgYdbo=;
 b=Rx5ngJvkMPbn+t9gQ+9VQUcXzvxVRWcJ2tjxNgrBTxmU8Xt1uvHrSbgQE+UcCB7YHV
 rFPp2YHE4RBUQSKnYVU5J9VAdcySGI+iGbZeiFqgpuOztwBsAEWUeR2BYLDdtZgA2LgD
 YCya/h6gd/JnKYwrlGFqBi5SrZskqdrwVkpkQ/UkOEnv5t/CrSnLcwqZu2yjeSyC+PA8
 ky7W5gjOJbxG+26zITFMTB0JtssZKkznOXUJh1H1DIZaqXiZuDqqXvnPgWWStL5gJxN3
 5DMygP+sp5m/+Y9DznBKubMtCs5vd1a/snq8wF7hXV5sGJxQFy0/qxnPCSKR9htneYKt
 PZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LVrIEBdknSQXfx0VWfJkptFor1oJQkXATIr1CLgYdbo=;
 b=DgUz/b0IhetAttKwgEjFnRTxq5bZfuIY9Yh9wt3AetktRg4U32H7qFcmXZfHIBSODi
 rgCmOs7dBpcdwPadxEZP4UjGaLfGwoz61qM8JQ36f0nlgY23yLsQBYN/rRqjr0tzFvUT
 MH4PDN+yJvSvNOY3bwTOq3rmdJlTsuhevrpdgI9tK41vcFdeKA1RU5oPdUZeIXDDfUEY
 yZGeUyQsdaMzmqkrlI9RYNDlMqkk1LQT6rJNjXAWqK2vAbZMB1liF+ioXYd9DkApYcBZ
 P1eSDmL41HEbZw+3yY1kz74wy8kiW7FZUYHzVg1qEW9BhrN/tGqHB1wWCMKLAef9P8Rx
 lXIg==
X-Gm-Message-State: AOAM532wU9s/f34YLaL4cn42vrTtB35mtlr6aekeraz+rH80QmaGq3Q6
 VgL9LHIRmKFMyKAZcqRATjc=
X-Google-Smtp-Source: ABdhPJyDJ8StFoH8uIEVwWqjuwhqKzajigoszqpezpWUt4cO4yn0Yb7skWuCO5WlHbQOrgEdS9kyqQ==
X-Received: by 2002:a05:6a00:84d:b0:3ff:24a6:1d9b with SMTP id
 q13-20020a056a00084d00b003ff24a61d9bmr3938605pfk.14.1630294256191; 
 Sun, 29 Aug 2021 20:30:56 -0700 (PDT)
Received: from localhost.localdomain ([162.14.21.36])
 by smtp.gmail.com with ESMTPSA id 20sm13139989pfi.170.2021.08.29.20.30.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Aug 2021 20:30:55 -0700 (PDT)
From: tcs.kernel@gmail.com
X-Google-Original-From: tcs_kernel@tencent.com
To: daniel.vetter@ffwll.ch, willy@infradead.org, george.kennedy@oracle.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 penguin-kernel@I-love.SAKURA.ne.jp
Cc: Haimin Zhang <tcs_kernel@tencent.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: [PATCH V4] fbcon: fix fbcon out-of-bounds write in sys_imageblit
Date: Mon, 30 Aug 2021 11:30:23 +0800
Message-Id: <1630294223-7225-1-git-send-email-tcs_kernel@tencent.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 30 Aug 2021 07:01:47 +0000
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

From: Haimin Zhang <tcs_kernel@tencent.com>

yres and vyres can be controlled by user mode parameters, and cause
p->vrows to become a negative value. While this value be passed to real_y
function, the ypos will be out of screen range.This is an out-of-bounds
write bug.
some driver will check xres and yres in fb_check_var callback,but some not
so we add a common check after that callback.

Signed-off-by: Haimin Zhang <tcs_kernel@tencent.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
---
 drivers/video/fbdev/core/fbmem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 1c85514..5599372 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1013,6 +1013,10 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 	if (ret)
 		return ret;
 
+	/* virtual resolution cannot be smaller than visible resolution. */
+	if (var->yres_virtual < var->yres || var->xres_virtual < var->xres)
+		return -EINVAL;
+
 	if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
 		return 0;
 
-- 
1.8.3.1

