Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777FB60261F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D585B10EECD;
	Tue, 18 Oct 2022 07:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB6810EEBE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:47:52 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id l6so12616786pgu.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oYQUCwExhw/Gpp42oncI15bChvHsTTJdPx7zzXszYxc=;
 b=diWqSdGPpWLcYc5wVUgUAWU9mbRgKb1oWTLPkZ7UJQjwU8hrNt3+4HIfmxzQvaY1hD
 tCucGt9idZ0ENMca2PeEJpvNpcPG3yiUk+tcW8/k8o+EKPLpscOaPt6jFyNYSItLmXbp
 IQwfieBmhuZqtRiS6zQdVWDpVv6EdxGz+zVXFrxKMj4Pg5kZ1ZbW4Jr7sGBZN1eYJyzl
 R5ZdF2kdzCfS7kjUzBxzwJVlPKr/bk982Yq9n4Hcp1J34DNssOzx3os3JLR2lMCTN/rt
 OdWvk4Z1zBuMu0vupb9iXXAHmyHtZQH6bbLtolfvOq4sUQTPw42Anzq1Rs/dbN2LYS3G
 khZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oYQUCwExhw/Gpp42oncI15bChvHsTTJdPx7zzXszYxc=;
 b=DH+5SWshxW8IUhjSK5bZey6qOiTv+iHu0RANqZzHnhZr+TRijuyDrAtENNcBoBx3y0
 79rm2AcdslLy2yT5O8M1YdyDga+jtGPkcJLgWydo8PfiR/e56Dyz4Ww3ZgqcUqaUCDEp
 I4Gcu3LbKM3WS3OXkUKNiHRr1tqpK9ciHY+JUxIX9CZWz2nI+llanuGMSVU2sYSiUhdg
 jcZdfrzJnXykewSLjXsMcpMOuSefgAM/085vWZHhXCbLavFehGbI9Q5hLetNyRWPq+yH
 fQPIxww7tleJEY7AlTTkY2OT3V0RiA10WcnVbclfiMzfZvb3yVE6OTgDrfAoNtxWdeDD
 P1Fw==
X-Gm-Message-State: ACrzQf3JMsklhCtvgP6Aj7B7HFFGZhcYdYlHVQ0wRFKfAfo+E5jKSdse
 61yVDisAy70KbhXim6d5QqA=
X-Google-Smtp-Source: AMsMyM5BDR4fAvT0NYnaUxjcEr6J7D9WQ72shCxLOvZ0V9r0T7BuJ/uOXSqT08/mEcXRpW3kPvh6nA==
X-Received: by 2002:a63:8648:0:b0:461:722b:ffc8 with SMTP id
 x69-20020a638648000000b00461722bffc8mr1663147pgd.118.1666079271984; 
 Tue, 18 Oct 2022 00:47:51 -0700 (PDT)
Received: from carlis-virtual-machine.localdomain ([156.236.96.164])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a62f804000000b005628a30a500sm8492393pfh.41.2022.10.18.00.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 00:47:51 -0700 (PDT)
From: Xuezhi Zhang <zhangxuezhi3@gmail.com>
To: deller@gmx.de, zhangxuezhi1@coolpad.com, wsa+renesas@sang-engineering.com
Subject: [PATCH v2] video: fbdev: sm501fb: convert sysfs snprintf to sysfs_emit
Date: Tue, 18 Oct 2022 15:47:45 +0800
Message-Id: <20221018074745.922062-1-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@coolpad.com>

Follow the advice of the Documentation/filesystems/sysfs.rst
and show() should only use sysfs_emit() or sysfs_emit_at()
when formatting the value to be returned to user space.

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
---
v2:change onvert to convert in subject.
---
 drivers/video/fbdev/sm501fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index fce6cfbadfd6..f743bfbde2a6 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1166,7 +1166,7 @@ static ssize_t sm501fb_crtsrc_show(struct device *dev,
 	ctrl = smc501_readl(info->regs + SM501_DC_CRT_CONTROL);
 	ctrl &= SM501_DC_CRT_CONTROL_SEL;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", ctrl ? "crt" : "panel");
+	return sysfs_emit(buf, "%s\n", ctrl ? "crt" : "panel");
 }
 
 /* sm501fb_crtsrc_show
-- 
2.25.1

