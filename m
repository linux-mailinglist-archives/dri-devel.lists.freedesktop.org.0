Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61029BC24
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7BE6E1CF;
	Tue, 27 Oct 2020 16:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324096E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:34:03 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o9so1026887plx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=In/51AAXPn5EUWnx/UEYdjmTkRcrDAtPtyplaFeQ5lU=;
 b=qV2cOWA0GuqXDv+sBSouYZakOv5oFD4hgNf87hpEXF15Qq6sizcGpXNOD74WCXRcyv
 sO/6Tj/7iiwM9RpQdAbqqnNzT2YptHVUx8aGi2nb/wOnMB2L6hTcG+fENUtGC704OQeB
 OIvg9/sjXLRUzNEoS6cfGm0CB1cK6CwxiVYKkIeqQXO2O7pBxdEYIdTl09rtvVfPTYl6
 DTWd8dOPZ2RAKadUbZ7lyRyJiFl+OilJWGQkEXvWKnG+EEIGEwVIDviHyTbWkf0bBPF3
 C1qztcCFxeaUH9057nGg+r2mVwEQhOkgHxDdjZWQLSRvxcgn2sjn51v8dLGTej9Zl7rS
 X/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=In/51AAXPn5EUWnx/UEYdjmTkRcrDAtPtyplaFeQ5lU=;
 b=csb/EYDa++uCvfhwASvWb00K8N9tq5S/ORkFdZN/sGNVMUb/hCJXuY0gxPDb0ryJP8
 AteBuduHil1ydKbMF20jmrXEojjCVpuBvpx3ONSqiDirbMWB17U4xzQE2JUz8eCTyUWS
 EFK0UdxjmQBPpX8R90dykPq61c8+ieFAQXUU9+Wxfzrl/mR8Wncb+UynAus0ehQxq0wK
 hW9oO1ZYSd9DeV89njdBqpKWzX7zRtC7sUJw2MZBWedSkjyLNCEq5qo47+WQcXAe+ls6
 ud2uvyBGqQKDIem3bYCjrnK0FawR7wT4DSfBTnnM4Cpn1uFuoMMhPv1+QAIpnNjWRmAA
 ORDA==
X-Gm-Message-State: AOAM533xiSDrpvWz8K4NoqWH/vMCFUUwQOv9p1+E6VVG8W0TjEAHyyTh
 mLh9stHHndmA3SpAqZ/xtA==
X-Google-Smtp-Source: ABdhPJyfbezIzRHApDWXipuccB2NB1//aO/tcW0Oq+NmOzFSnqmlIn40ZQ4T6DNDnbAh/dzCFxWw0Q==
X-Received: by 2002:a17:90b:3501:: with SMTP id
 ls1mr880626pjb.26.1603816442913; 
 Tue, 27 Oct 2020 09:34:02 -0700 (PDT)
Received: from localhost.localdomain (n11212042025.netvigator.com.
 [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id n16sm2854465pfo.150.2020.10.27.09.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:34:02 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 2/5] Fonts: Make font size unsigned in font_desc
Date: Tue, 27 Oct 2020 12:33:05 -0400
Message-Id: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is improper to define `width` and `height` as signed in `struct
font_desc`. Make them unsigned. Also, change the corresponding printk()
format identifiers from `%d` to `%u`, in sti_select_fbfont().

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Build-tested.

 drivers/video/console/sticore.c | 2 +-
 include/linux/font.h            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
index 6a26a364f9bd..d1bb5915082b 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -502,7 +502,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 	if (!fbfont)
 		return NULL;
 
-	pr_info("STI selected %dx%d framebuffer font %s for sticon\n",
+	pr_info("STI selected %ux%u framebuffer font %s for sticon\n",
 			fbfont->width, fbfont->height, fbfont->name);
 			
 	bpc = ((fbfont->width+7)/8) * fbfont->height; 
diff --git a/include/linux/font.h b/include/linux/font.h
index b5b312c19e46..4f50d736ea72 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -16,7 +16,7 @@
 struct font_desc {
     int idx;
     const char *name;
-    int width, height;
+    unsigned int width, height;
     const void *data;
     int pref;
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
