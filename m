Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3EB4F1139
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1C210EB3C;
	Mon,  4 Apr 2022 08:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4FA10EB46
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:47:50 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n8so585610plh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lQXVT/uUsnfVE8WcNYNQC83df5wSK/7H6QlhzyGSpQ=;
 b=KHLiQpb41/Jw+rhklJELDpaMOhckeHIcsw9AtQfrQZVhXUpiSvQOoEqLOWnWZt5N1z
 fvw5nL32fYw19ijPqYbuxD1CKpEfwJ5AWt/SVteFr4bVvwv6VdXylzhAcHNAJ2DDNUoD
 uJYWZuWDo3vo/IlAuNirkKPlaCiPaYIxYxkT6R1KdmrLjESBZ8q1NViVRwLfWSDjIaJ1
 zHy5Alslrx8QGBPFt4DtgHTz7U+DYAGT0DlpOpDG4CIRSZnMFJxfQ1HxmLAHtuNWexeX
 KsPVNi1JlUl1f0C3+1/nq7L4cfl9ib7E3+w4a5wLnn86lSz0M+PNAdC0Jm3TUXKx2Yc3
 IyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lQXVT/uUsnfVE8WcNYNQC83df5wSK/7H6QlhzyGSpQ=;
 b=uoeP5cdmjbnjU37YDCjSjqYGOwstLJCUcOJ6N2TKIExLZisS5PBvRrYvR7c6CqFhHd
 HYvBj4+HoZulc8vZIc6NsapDgZL1ooUbObIFbynwIAnSYMehUQhR8NmnBmtDzhCJxUq5
 wrXyxVi5iW6F9tfuwWZGU+YHMQu2yRGbGFV26jklPG72ksCAokoJ4hPiVJSfTswkWeYX
 iDfRjRhPDe+R4QTKPRarF1dJl64hvqljcmM0BDIDDFRAD3CS4xIoxYQf1e11ywn5JuG6
 UTO9fN6ED0S1pxvsQZjl1yXuS4vom7tVd5eFhsuZa+UIVxceqyO8BjuF+Lo9KlGvwGlU
 emXg==
X-Gm-Message-State: AOAM530QNENk4pFJHPPovQ0bcG6bDMVjVzEhlySPtZgMvzQNs44bBnYj
 MPLlqIGX04Fs9rUq3JUmlamXBeEiIB9fzrWTAA==
X-Google-Smtp-Source: ABdhPJz4d1wgPvWQSKcf0Ti+XkoQbDjoaZEPj5OUoHAmUr4JUgtLaBghkz4cZl6tbHh/c+SMdrjEVQ==
X-Received: by 2002:a17:902:7887:b0:156:788a:56d1 with SMTP id
 q7-20020a170902788700b00156788a56d1mr10208376pll.110.1649062070526; 
 Mon, 04 Apr 2022 01:47:50 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:47:50 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 2/7] video: fbdev: neofb: Fix the check of 'var->pixclock'
Date: Mon,  4 Apr 2022 16:47:18 +0800
Message-Id: <20220404084723.79089-3-zheyuma97@gmail.com>
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

The previous check against 'var->pixclock' doesn't return -EINVAL when
it equals zero, but the driver uses it again, causing the divide error.

Fix this by returning when 'var->pixclock' is zero.

The following log reveals it:

[   49.704574] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   49.704593] RIP: 0010:neofb_set_par+0x190f/0x49a0
[   49.704635] Call Trace:
[   49.704636]  <TASK>
[   49.704650]  fb_set_var+0x604/0xeb0
[   49.704702]  do_fb_ioctl+0x234/0x670
[   49.704745]  fb_ioctl+0xdd/0x130
[   49.704753]  do_syscall_64+0x3b/0x90

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/neofb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 966df2a07360..28d32cbf496b 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -585,7 +585,7 @@ neofb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 
 	DBG("neofb_check_var");
 
-	if (var->pixclock && PICOS2KHZ(var->pixclock) > par->maxClock)
+	if (!var->pixclock || PICOS2KHZ(var->pixclock) > par->maxClock)
 		return -EINVAL;
 
 	/* Is the mode larger than the LCD panel? */
-- 
2.25.1

