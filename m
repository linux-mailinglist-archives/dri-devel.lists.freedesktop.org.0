Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE884F1143
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D5E10EB59;
	Mon,  4 Apr 2022 08:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818C910EB58
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:48:03 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id z16so8354353pfh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4A8goeGhaPhZ1beeVbOmqSl7OQXT8O1NS+m0bvoRpjo=;
 b=Z5fOUGpEhMxgb4z/mtIOFAioIea+f/nCbEWUv8Yc6LLoDU5lLJDNnCsq5hFzojhak0
 Cpd/FUmkGKRxZm8OAqAhKgAQvxZc7WWQUMQqWe16bro7kvVcDjmeE8HdAc3xNj2Uc9Z3
 3MKyhPIweU/fiD2Iu5nHmMxT1satV8rgRS0NvN/KSMPMTw9Xtn8fydugpQ3kxsTigncU
 +6KFV45Hw5cXz1Tt6bMiBFJErOKt8U5tsxq9xs/X8aNgAZXjcSL4WDEJIMfU7HrruZJN
 xGklKNJLiDWylzwjOKJpGorgKod+gO4IL8JbhP/zGQ/gzFGsJEd4j516K772rau002Dh
 LB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4A8goeGhaPhZ1beeVbOmqSl7OQXT8O1NS+m0bvoRpjo=;
 b=s27ZmRw0xTk/DCsZ8t+u9L66rCn9YBCkav7g4pvkARbripT6ZEpq5rFAoHWf5Bk6HJ
 OS+Lfc3EmPkVFkfqlyuZHAlu0RAIkaicqJcr3s+xZj1scm7O2WFXuuJX3aEfzfOwFiXV
 P52xiKlQzWOTCt0SpGwHvmCdgjLBoA5XFrSgj++Pe+gJV6UcAx245pWcy/mQcYSU01B+
 lNR/WbIY0cJH3HJkI7RyFabK5o2g1A2q9vFb0vjqn9pQQHiUAwKcxysreJbsPbztVWLX
 5tmr//iQomMneozlLXGmtb3We3eBMQezNmy4u588VOBMPYSv7EZHiRmFZL9yvtxTPbGW
 Nb+g==
X-Gm-Message-State: AOAM533RRLkAlrXSnpNwv5xJZ9LL/M3zvyinGv9W5Gj5Dq/3tNZTXCQp
 9E7VjPsj266JjhP9QXR9BQ==
X-Google-Smtp-Source: ABdhPJy6JgPINls43h0o9/63+vpTSZFuQEI/lBMSWnAyDFK5g+Sq5Oe+7B9z4yzg4UkAlq/ZDjIVVg==
X-Received: by 2002:a05:6a00:228b:b0:4fa:e12b:2c7b with SMTP id
 f11-20020a056a00228b00b004fae12b2c7bmr55776235pfe.79.1649062083039; 
 Mon, 04 Apr 2022 01:48:03 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:48:02 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 7/7] video: fbdev: s3fb: Error out if 'pixclock' equals zero
Date: Mon,  4 Apr 2022 16:47:23 +0800
Message-Id: <20220404084723.79089-8-zheyuma97@gmail.com>
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

Fix this by checking whether 'pixclock' is zero in s3fb_check_var().

The following log reveals it:

[  511.141561] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[  511.141607] RIP: 0010:s3fb_check_var+0x3f3/0x530
[  511.141693] Call Trace:
[  511.141695]  <TASK>
[  511.141716]  fb_set_var+0x367/0xeb0
[  511.141815]  do_fb_ioctl+0x234/0x670
[  511.141876]  fb_ioctl+0xdd/0x130
[  511.141888]  do_syscall_64+0x3b/0x90

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/s3fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 5c74253e7b2c..b93c8eb02336 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -549,6 +549,9 @@ static int s3fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 	int rv, mem, step;
 	u16 m, n, r;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	/* Find appropriate format */
 	rv = svga_match_format (s3fb_formats, var, NULL);
 
-- 
2.25.1

