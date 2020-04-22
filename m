Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DE1B55D6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E3B6E25F;
	Thu, 23 Apr 2020 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C946EA25
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 16:07:28 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y25so1317484pfn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5xEoHET9vfaEq5LIR2V1cy0U7HP7GDZ0ojpw/b8noo=;
 b=op9xXMUQE7+eoyEI/3bjdKIOPzkykzXpyT3jwTtohkIl/ROFGP/BywJFuagmDWuwpE
 Pm5ctXySjJG9ycaY6+T7WIubSLShz3za1aa2QQQP2EWNTUevUAcBRBQWqzsiYJ1BJKu7
 xy9YWh4AxbbdlChIZ8hlpmnFtegES9UKefSEfv0DtRS5RB3l1JV6s1Sfc0CgakQkl929
 JJjZKyNRND5IAl/p9dFWBZv7zrgLmldP7Bm1ACO7tqLlvaZvwOyrsXQtqf39Q9laMd4L
 2VgpBRjFkOlqvJcgJ/lym5BH+kMH9uN3kZdLbzSsn4XisvPqq0VHigRydEu2zxmhl9YN
 goXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5xEoHET9vfaEq5LIR2V1cy0U7HP7GDZ0ojpw/b8noo=;
 b=cRLC0LmQ8dQf3omv+3Y5DDIRsh7HGowpCM/fDm2bjLR1Ojm32kEcdBZYNZfmsQ4EGD
 4svtxhxC6FblwfRrqbIP4a23vLyl9nfoq4wmlk2Iw2WFJ84ywSLYQxcrlcmUUhm1xPTo
 pPPLD0sFWwWkGQu+LzHn4PwS/yXWe11HUTo1wz9I4aK/gxJsrF98BYUNr215jnnR2qyM
 m3P07n6JGBei8uMq9OaYXbFpiodG+xHIs8H2qAwu/SiGFcoZcB+l7KA8ZHdB4QB9TTXK
 J976TgfWvzXZ6NzaOHpR8VCYXkb/rTdTf86GmuxK0tEKQUWWj1XoRjPeIYIbjeiQM288
 YSHg==
X-Gm-Message-State: AGi0PubN69Ff1gycKniTFGrqEGdAIXEEvHinc/CWfv4S9sbu1j0ICS4T
 g6n95HwvJDdLVGfLQ6vnJs8=
X-Google-Smtp-Source: APiQypIKUZKH++J4SaK/mpXI+7xB04AVhcJdfDXy62fFLjyb3yakjYt0JDm/ostuKjQSOUQvZvH34g==
X-Received: by 2002:a63:df42:: with SMTP id h2mr27572335pgj.216.1587571647496; 
 Wed, 22 Apr 2020 09:07:27 -0700 (PDT)
Received: from localhost ([89.208.244.140])
 by smtp.gmail.com with ESMTPSA id p190sm4179323pfp.207.2020.04.22.09.07.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 09:07:26 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v1] video: fbdev: sm712fb: fix an issue about iounmap for a
 wrong address
Date: Thu, 23 Apr 2020 00:07:19 +0800
Message-Id: <20200422160719.27763-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

the sfb->fb->screen_base is not save the value get by iounmap() when
the chip id is 0x720. so iounmap() for address sfb->fb->screen_base
is not right.

Fixes: 1461d6672864854 ("staging: sm7xxfb: merge sm712fb with fbdev")
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/video/fbdev/sm712fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 6a1b4a853d9e..8cd655d6d628 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1429,6 +1429,8 @@ static int smtc_map_smem(struct smtcfb_info *sfb,
 static void smtc_unmap_smem(struct smtcfb_info *sfb)
 {
 	if (sfb && sfb->fb->screen_base) {
+		if (sfb->chip_id == 0x720)
+			sfb->fb->screen_base -= 0x00200000;
 		iounmap(sfb->fb->screen_base);
 		sfb->fb->screen_base = NULL;
 	}
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
