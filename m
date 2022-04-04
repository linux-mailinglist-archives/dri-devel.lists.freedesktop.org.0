Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6892F4F1141
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1734610EB4B;
	Mon,  4 Apr 2022 08:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416410EB4B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:48:00 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id o20so1834985pla.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsQsOGOBswiqIkfE+MmZmSYrrU64sgPI4cLq7rNPZkk=;
 b=b4c7KmBW0dluWZGhagtxX35zeboI86n00qjpygwNWb4mr9DaRZ6+hVK0lwlf8CRknM
 knRly/iSX7myVM4yjqVn9+5Uhrp+Vd9NDBC9jeUSfKfGic+DoUDOwQVqCgZKUxY4t30s
 S6co9ns78h8EOSuPT5AW8xTNGw0kx1dbO/fN703kgdlfd9EpmDl6na6IHiv77Z6ogI8H
 BfBso/WnyYdmflfwlALETgTAH7sMrjnWUAcl9+bTz9wrqXAWCSYTIFxvt91ZxjwL7m0q
 04g+YjOhsvC6gzJ7L91krIz8eBRXNArQZXmByvOfA/8CUOj9Ct224O1V/oXSr5Xj6gJ6
 EcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsQsOGOBswiqIkfE+MmZmSYrrU64sgPI4cLq7rNPZkk=;
 b=WoIUqBLCNdOuCW5XjdDciw6HhJOnMAwO/QFmkhlBsvPBMVWhQzN5kFAX/xdvwpkWvh
 P+X4wuMJrt0Dtp+mCUzZld5pQRYitmN2diZoP55AZ3jdg8o8ucGBAmkoVYcBUgqx+xBI
 5Pu/gttnsYLnPwTbzkfwUJXIE8tGQYHeAipIphnVIs0OGpJN42KLzkEossWcTH5UeiRS
 DeHL1hlGGMC5ANswEtgc21ceHIkkvan325OzW7jOUBcwjarBNIVeCiZBbkvNYgGaO8su
 bBoyYdQPXtGZ1lMdwvP+LlR0JwwHqjCYRHrMMoeZurKFYk8l7q/ApiU68DFT6Vvc8g5y
 agew==
X-Gm-Message-State: AOAM531XLrbBlcMQ62URUIGDoxRbKZhWYTZ7YzTVoCQMvhWmSfB83Mn0
 1R4+O2M7+XjduGfzGFr2oA==
X-Google-Smtp-Source: ABdhPJyaumC2pAoaVZdgGxH0C6+k3h97CLv5+0nGYCnk+CTU9mYZSDQ8odzFEQgW1zPAVxACmLujOw==
X-Received: by 2002:a17:902:8f94:b0:14f:d9b3:52c2 with SMTP id
 z20-20020a1709028f9400b0014fd9b352c2mr21780055plo.103.1649062080299; 
 Mon, 04 Apr 2022 01:48:00 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:48:00 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 6/7] video: fbdev: arkfb: Error out if 'pixclock' equals zero
Date: Mon,  4 Apr 2022 16:47:22 +0800
Message-Id: <20220404084723.79089-7-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404084723.79089-1-zheyuma97@gmail.com>
References: <20220404084723.79089-1-zheyuma97@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of 'pixclock',
it may cause divide error.

Fix this by checking whether 'pixclock' is zero.

The following log reveals it:

[   76.603696] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   76.603712] RIP: 0010:arkfb_set_par+0x10fc/0x24f0
[   76.603762] Call Trace:
[   76.603764]  <TASK>
[   76.603773]  fb_set_var+0x604/0xeb0
[   76.603827]  do_fb_ioctl+0x234/0x670
[   76.603873]  fb_ioctl+0xdd/0x130
[   76.603881]  do_syscall_64+0x3b/0x90

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/arkfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index edf169d0816e..eb3e47c58c5f 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -566,6 +566,9 @@ static int arkfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	int rv, mem, step;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	/* Find appropriate format */
 	rv = svga_match_format (arkfb_formats, var, NULL);
 	if (rv < 0)
-- 
2.25.1

