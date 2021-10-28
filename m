Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA9A43DFC6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 13:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421746E40C;
	Thu, 28 Oct 2021 11:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AD46E40C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 11:08:55 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id b1so2095454pfm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5nulpv/PsHbHxr0CG/x6sRTRQ9BjFwug8L0Dm2Jq6QY=;
 b=LzG1s0sKFcVmxgRJOab3TCFB4S6VETIqqf0jgmYH2Vbu3VkMUYvOahXCMMv3XosvzP
 Af8DjStRBlc0HSp2YNXDWu8gSaqgtkeHGDJnWXWK4EO01O4hhzVkQkO5hxKtFaRccNUx
 u5pneT4GuBIOUcMgSAUcR4roBSPkjvdJLHOFTw23vyYrs+DWyO5fXhoHCabcENdcgYv7
 YeavoViCEMNxiAcTfNoDfp+2zCg7qoMMg7RWfnh3vzxbe9jN8yhN4BBfvtWMWc0Dz+oD
 l2vXdCcQcA4PWBOa44Jn/D6p6RjUxZKSqLR8ZWIYcN+UGGHdZxMfmvqB+jhMSIi120Tf
 L74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5nulpv/PsHbHxr0CG/x6sRTRQ9BjFwug8L0Dm2Jq6QY=;
 b=TU+lragbLsNBREWoz5EWDZlSqnN3mgWp5VRUEFXnIgl9kuTlabY+ti91wW5PRCfULX
 ZnkubgF61069pD8LF+nxvEMinMo8bB3Mo+TqbWZ3ITwtF5zrh+x2gS1UJTg1PCm31SEG
 W4fte845ikUTVFhvJzIJ+HzYtEDkim8FP4Ps1j+IbjOjWyYb57VVhKRrOKGhBcT3v8Zl
 aJlRTFgd6TlItG0ck1DGBSpnAfryV3xv1kcoiIv5Ln34Kli/qOObX22cDnS+10zjRko4
 IUxNN0Y/KB8bWVQZ9EyLvPrxybyjc38VOC4lWNHLGt509dsm1rPlJczDN+0bAHWVUtPN
 lpSA==
X-Gm-Message-State: AOAM5334f5WuiLwddhrmcc23s7LCwjf3Vlv6IcnFsZHUwvys9S6n0hYG
 +57NSBpvDXt3VXYqmjrEzRs=
X-Google-Smtp-Source: ABdhPJwYOdpqFrFadto506ERZE8kgIfbKQyR411fTPJCuDdHSnUigcetqFdmEnX1BTJ01fkE/ZYW8g==
X-Received: by 2002:a05:6a00:22c1:b0:47c:28f5:7b9c with SMTP id
 f1-20020a056a0022c100b0047c28f57b9cmr3585030pfj.80.1635419335104; 
 Thu, 28 Oct 2021 04:08:55 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id s2sm8072443pjs.56.2021.10.28.04.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 04:08:54 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: daniel.vetter@ffwll.ch
Cc: sam@ravnborg.org, willy@infradead.org, deng.changcheng@zte.com.cn,
 thunder.leizhen@huawei.com, jgg@ziepe.ca,
 penguin-kernel@i-love.sakura.ne.jp, zheyuma97@gmail.com,
 xiyuyang19@fudan.edu.cn, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH l] fbdev: fbmem: use swap() to make code cleaner
Date: Thu, 28 Oct 2021 11:08:47 +0000
Message-Id: <20211028110847.15516-1-deng.changcheng@zte.com.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use swap() in order to make code cleaner. Issue found by coccinelle.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/video/fbdev/core/fbmem.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 826175ad88a2..2c8e6feef0c9 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -396,18 +396,14 @@ static void fb_rotate_logo(struct fb_info *info, u8 *dst,
 	} else if (rotate == FB_ROTATE_CW) {
 		fb_rotate_logo_cw(image->data, dst, image->width,
 				  image->height);
-		tmp = image->width;
-		image->width = image->height;
-		image->height = tmp;
+		swap(image->width, image->height);
 		tmp = image->dy;
 		image->dy = image->dx;
 		image->dx = info->var.xres - image->width - tmp;
 	} else if (rotate == FB_ROTATE_CCW) {
 		fb_rotate_logo_ccw(image->data, dst, image->width,
 				   image->height);
-		tmp = image->width;
-		image->width = image->height;
-		image->height = tmp;
+		swap(image->width, image->height);
 		tmp = image->dx;
 		image->dx = image->dy;
 		image->dy = info->var.yres - image->height - tmp;
-- 
2.25.1

