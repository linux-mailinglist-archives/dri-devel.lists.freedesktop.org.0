Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2A2A207C
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC696EB40;
	Sun,  1 Nov 2020 17:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532C26E9BE
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 00:20:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m8so4973360ljj.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 17:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=somia-fi.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gb/J6pBTC+U79s+Too2NVqGf5ftZkxTHSHF78mWqzDw=;
 b=TfVWvTb/uUJdxfYW5VobHdQCqYzSpD0QO5ICYOXPUCi2HuCQQfDPZCbq3lh28+m51J
 fd9Mn1hrHDigXVGxmvtZpPLYqn/bzyH0/wdgFErf/uioNrgL3SDAjVZzEZ54MPN3RKL1
 JXgi91z/mXWVCmqEbhjThxZ9Mba19sXp5F7kY2Wx1j7CFNFX+KA+6tpBvrMazHhilixP
 uuY3BZoRQhNijCHeHBb3eL/gwmgS8bI8l0cp1Zv1s2xXVfF/ZTV6o6twxI37ImVnmHpj
 d5MHfBobFZP5dIVgCLkyYwHcXqo/I6aNgH4uATWkqKBZjJhQBwHKzhLMRIvZJa347N58
 Icow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gb/J6pBTC+U79s+Too2NVqGf5ftZkxTHSHF78mWqzDw=;
 b=bHng5Qzpc6VJvLcRVMbuv4K4rzvuH1IRyBgEQGxep5dTElYp7KF5O7D9/UoDisIkZG
 5lPiPgruxBscyqB3b7e+cJoGSDDPXgakl5HB5DEGZwMqNBxSOzEVsWajbkP+E04YlMI9
 pfFeeMVoKpMWm7ZoZ5UywIRF6IKReD9KwSLeKNohS0KemxbPid55f4nHP6rr42UHTdbA
 oPQ9yf8I+nkyG9YXuOdvf0IuKMkNwgRz1A6RlCNCyn65yebgRdsGUd80JU8VfvBRnowd
 hLht3OTDGtRt+/8fvuFkuR0zpr6pNGos95qHp/b4gXMaUHALa2zoT/1Z5uQqlfoT4JOU
 sMmw==
X-Gm-Message-State: AOAM530TiuQ2cbo4DQLsfF+rq285Fi94R0CnBSyTo65x7F1EkCYTkBB1
 WRllB/yKkl10mFcrDsnx99/3zQ==
X-Google-Smtp-Source: ABdhPJwBwAVgFbijYR3dZ2iWYVxrgF40gZwx2I+/lofd5+mwhGbetATjbiVxg/P0XNgHr+ckI0Tgrw==
X-Received: by 2002:a05:651c:510:: with SMTP id
 o16mr3766337ljp.409.1604190040276; 
 Sat, 31 Oct 2020 17:20:40 -0700 (PDT)
Received: from localhost.localdomain (cable-hki-50dc37-152.dhcp.inet.fi.
 [80.220.55.152])
 by smtp.gmail.com with ESMTPSA id s18sm1165065lfc.284.2020.10.31.17.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 17:20:39 -0700 (PDT)
From: Hassan Shahbazi <hassan.shahbazi@somia.fi>
X-Google-Original-From: Hassan Shahbazi <hassan@ninchat.com>
To: linus.walleij@linaro.org
Subject: [PATCH] staging: fbtft: fb_watterott: fix usleep_range is preferred
 over udelay
Date: Sun,  1 Nov 2020 02:20:10 +0200
Message-Id: <20201101002010.278537-1-hassan@ninchat.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: devel@driverdev.osuosl.org, Hassan Shahbazi <hassan@ninchat.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the checkpath.pl issue on fb_watterott.c. write_vmem and
write_vmem_8bit functions are within non-atomic context and can
safely use usleep_range.
see Documentation/timers/timers-howto.txt

Signed-off-by: Hassan Shahbazi <hassan@ninchat.com>
---
 drivers/staging/fbtft/fb_watterott.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_watterott.c b/drivers/staging/fbtft/fb_watterott.c
index 76b25df376b8..afcc86a17995 100644
--- a/drivers/staging/fbtft/fb_watterott.c
+++ b/drivers/staging/fbtft/fb_watterott.c
@@ -84,7 +84,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 			par->txbuf.buf, 10 + par->info->fix.line_length);
 		if (ret < 0)
 			return ret;
-		udelay(300);
+		usleep_range(300, 310);
 	}
 
 	return 0;
@@ -124,7 +124,7 @@ static int write_vmem_8bit(struct fbtft_par *par, size_t offset, size_t len)
 			par->txbuf.buf, 10 + par->info->var.xres);
 		if (ret < 0)
 			return ret;
-		udelay(700);
+		usleep_range(700, 710);
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
