Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0C4F113E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1080710EB3A;
	Mon,  4 Apr 2022 08:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE4B10EB4B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:47:55 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so2266925pjy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99A9a3hHeLpuMdZogws2agT3Pd/9V9gAGhJHXsYptTw=;
 b=FEWaJFqHiORNV4n3ITN4hvIxL/s/r/ujDrwxJkvlaNB8kwZiS7A/KFs0C6nSH9Fjj6
 hNV2GTIYaKbOjwploqMSVC3IkiQ05w14dN/RGAB8X+ZUWmFvKEk5sV3bc6Bx758tPqHO
 U2reaV4WrwQFVFhhL69S6ey2NDHe74btKudCdicMuTYguS0WMfO/xMb5nQ9CIifNSOkA
 TMPenuoIkkxwusMIeBOg0m7n7IG3XCVpVwQtNJBYiCUz+ujG6hh/6zX8ne+OduhAujW1
 MmPUHKNB2dDspHO3g9QYl+owLNVEgfl8hubi9rQ1xusjDFxsx1kIdlwZfP//ZNtzqbKA
 M9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=99A9a3hHeLpuMdZogws2agT3Pd/9V9gAGhJHXsYptTw=;
 b=xqm80HEtOyieG2Z5p39URP3zvWAfF4zW8JmApG2G+FnpHJTbWbIALzAX7Oc/QYTB6F
 S5zeGoLnVBOj1zCtsyOUL05dufZ4QQsu/b98Log/Wa238fS+0ooJvi07pwPeJRCZQuUs
 ZknQuXd66nnPx+XKSH5bBE0Pk7fdP2AMUKpqaeXJjxAODkjC3gt4mc30pm25gsxW8+vc
 Ij/I8Ht8TJnh+xS2e3vRaHzDFiQPVxYcNRZdaqGZCRy42a799ByCvB8wxDPKBAQ2Tvgj
 maSfmouRj/NVqiMu933BwlV7eCHruFdf5gUS035eNkV5iDUtwJlxk+oY+TmkQFB7/Euw
 d4Jw==
X-Gm-Message-State: AOAM5303u4lDvak6/Krv0fbf9OgFoY5jh4ODgEWWqG6MWSGshEK6qyEk
 YaGFAkfp+Zxf17kMErsccG7ZRJpgdxjQWyK3Rw==
X-Google-Smtp-Source: ABdhPJzHEpK7iQlUi2JXa05S2CyzF7s2BEpWcpFng5mVwfJfydFQGtfX42aZdvVbPwni/HDOC/K2tw==
X-Received: by 2002:a17:90a:7288:b0:1ca:6e77:84a0 with SMTP id
 e8-20020a17090a728800b001ca6e7784a0mr9647359pjg.60.1649062075558; 
 Mon, 04 Apr 2022 01:47:55 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:47:55 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 4/7] video: fbdev: vt8623fb: Error out if 'pixclock' equals
 zero
Date: Mon,  4 Apr 2022 16:47:20 +0800
Message-Id: <20220404084723.79089-5-zheyuma97@gmail.com>
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

Fix this by checking whether 'pixclock' is zero in the function
vt8623fb_check_var().

The following log reveals it:

[   47.778727] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   47.778803] RIP: 0010:vt8623fb_set_par+0xecd/0x2210
[   47.778870] Call Trace:
[   47.778872]  <TASK>
[   47.778909]  fb_set_var+0x604/0xeb0
[   47.778995]  do_fb_ioctl+0x234/0x670
[   47.779041]  fb_ioctl+0xdd/0x130
[   47.779048]  do_syscall_64+0x3b/0x90

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/vt8623fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 7a959e5ba90b..a92a8c670cf0 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -321,6 +321,9 @@ static int vt8623fb_check_var(struct fb_var_screeninfo *var, struct fb_info *inf
 {
 	int rv, mem, step;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	/* Find appropriate format */
 	rv = svga_match_format (vt8623fb_formats, var, NULL);
 	if (rv < 0)
-- 
2.25.1

