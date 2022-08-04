Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E6F589BD4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 14:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD484979D0;
	Thu,  4 Aug 2022 12:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F17297979
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 12:41:48 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id w14so6154975plp.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 05:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CCsyUyjtcxiqdAio61EdLoryAiVvM5FMmKPvH5Lk+7M=;
 b=p5VexO3soXHRkRquHKXZkC8JYq5rp2/+hH5cdP/9ybw6xveovaMm7vq9DULzixLiIm
 2zQcITt0lDLza3JpyfTFtjiOf0ZjmkAYHl4dKyTmQHDnE5c264USvOJ3qUjPd8re+1o7
 zMBGJm0vtdWGJhS35PJZI4FYub9oNCtlU5UqZpszGvlk3jzNvYf6EHshWdYWHXhjPxW/
 hLb7yHDT1MRtKEEJgwiC1xcwkMDg6y7w4BivcoGWlgniNUlUueoeqLrT4pMYt0A0z4+G
 UnV3o+nvdprd6/CrmPtNzyvie7pw4bPdGQYISWpnMsWAxhHFAoD+J5qGzNQVecUS11rp
 fYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CCsyUyjtcxiqdAio61EdLoryAiVvM5FMmKPvH5Lk+7M=;
 b=hbU+ECVcs5d13ntqfmQneFjDdB3wkjkMSmTmIl1bXsJQv0nBXGFViPWJEmGMNtPD+W
 A4+thRrC03uzbDSlhv1rd65iuTraa7niW1p88TeoFQk11R5cdQmXVXGe+c90XVSbmJkx
 ij5RNsSXwt0fksodog5oGUXPEL0u5SPrRLAsxH9OPD+Vp4NfAqfL/rYT6PoGJBMXA0kc
 9585RacuhsjC+O/CZxvR0rGR40cvegNyUWca84qpx2r+/UOi/QXiWfDymNZj3YIfw5sc
 b5xTiEf8dlCxfNVXTOhCRfWjJToz+nf9+90EbqzL+B+pgNXkxHiQUKa+wV5BchwgSyag
 bDlQ==
X-Gm-Message-State: ACgBeo1DhYNr07elSN0r0n9aWCJlqVE2MF9jSZVLQAVfuiqYEbRt4dZA
 6SPL5Mit535vtwLdseGjTQ==
X-Google-Smtp-Source: AA6agR4X8s+bYDtMYD6EK98FWif6GTdlWCPPlzexQu4yKAsAh28bchh+1VCurElhJCelSbWYzUEB1g==
X-Received: by 2002:a17:90a:fc91:b0:1f3:1f3a:54d5 with SMTP id
 ci17-20020a17090afc9100b001f31f3a54d5mr2006808pjb.74.1659616907801; 
 Thu, 04 Aug 2022 05:41:47 -0700 (PDT)
Received: from localhost.localdomain ([166.111.133.51])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a63bf48000000b0041b672e93c2sm1070769pgo.17.2022.08.04.05.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 05:41:47 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de, adaplas@gmail.com, santiago@crfreenet.org,
 akpm@linux-foundation.org
Subject: [PATCH 2/3] video: fbdev: arkfb: Check the size of screen before
 memset_io()
Date: Thu,  4 Aug 2022 20:41:24 +0800
Message-Id: <20220804124125.3506755-3-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804124125.3506755-1-zheyuma97@gmail.com>
References: <20220804124125.3506755-1-zheyuma97@gmail.com>
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

In the function arkfb_set_par(), the value of 'screen_size' is
calculated by the user input. If the user provides the improper value,
the value of 'screen_size' may larger than 'info->screen_size', which
may cause the following bug:

[  659.399066] BUG: unable to handle page fault for address: ffffc90003000000
[  659.399077] #PF: supervisor write access in kernel mode
[  659.399079] #PF: error_code(0x0002) - not-present page
[  659.399094] RIP: 0010:memset_orig+0x33/0xb0
[  659.399116] Call Trace:
[  659.399122]  arkfb_set_par+0x143f/0x24c0
[  659.399130]  fb_set_var+0x604/0xeb0
[  659.399161]  do_fb_ioctl+0x234/0x670
[  659.399189]  fb_ioctl+0xdd/0x130

Fix the this by checking the value of 'screen_size' before memset_io().

Fixes: 681e14730c73 ("arkfb: new framebuffer driver for ARK Logic cards")
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/arkfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index eb3e47c58c5f..de4002914f9e 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -792,6 +792,8 @@ static int arkfb_set_par(struct fb_info *info)
 	value = ((value * hmul / hdiv) / 8) - 5;
 	vga_wcrt(par->state.vgabase, 0x42, (value + 1) / 2);
 
+	if (screen_size > info->screen_size)
+		screen_size = info->screen_size;
 	memset_io(info->screen_base, 0x00, screen_size);
 	/* Device and screen back on */
 	svga_wcrt_mask(par->state.vgabase, 0x17, 0x80, 0x80);
-- 
2.25.1

