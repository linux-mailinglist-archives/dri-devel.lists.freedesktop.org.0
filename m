Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CA3A5DB4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 09:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C55189B05;
	Mon, 14 Jun 2021 07:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525D189CE1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 23:31:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id d184so11065581wmd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jun 2021 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwXW92AMV2Zj//j5lOIkr635SG8SKf3W/g8yx73Deyw=;
 b=DUroW1l97aA1bQpXB1gL/Mva4UMt3HN8cVre8KVO/G992+d6by8qKBsM83pW6Q107Y
 hs8iSCaoamecyCYycUEnWrL/eyxV4bNO+BE1ySyXaKbgLjqjS4jiVLbJ56Xcsv9GSNHP
 VOTygISZ/LJ4CnrgejEQx2gjuFyVzMBr7Zl0QhsQErcjbFmyLaLrv3DWnIqakCI5yNob
 IYB4F5XlvobD/KVRSwPxJjwd9JFeV3SzQODCwbysgNtWvC8qS3BO1lL9i8SrpY/Qnq8g
 XnLn+6bq1aNwZcfcY+uVBU9DcvepLFJZ729Tl/HB5LRLV5R1XBGgxJp5UXph2dwV6Wge
 L3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QwXW92AMV2Zj//j5lOIkr635SG8SKf3W/g8yx73Deyw=;
 b=l/5TYjHJM4ztnjZJqV/m1bKmBXtxNBhJgyV+1CLzStCmp9mM5E7o/3l4H8d9N9V3Rc
 FXWcqqYP6kXOlOi0PEUQAmcSBJqW2haykeRjkVmiRbEsZiz/NU2UOixL1R8Nm7pobc4R
 Mt7Vb4u4MNxhhPkREMUC5rlTm/vjlqMJHmruKhpBBUEsFwpwf23t/75xjB2VilN4ve2h
 nq6und+6oNAwl0MUUT2f0o5z/egW9o5DFXisejxuxdKz2L3S750Qu5m9JhB+jd/SJKYB
 rtAQLVhkycmhLS+pXmi/BwpOwaKqc7MTvDTJpM4MIe4uq2zYvgAHjgGqHX7+lXGYs3Ss
 I9Ug==
X-Gm-Message-State: AOAM5303VVgIUwaG432S91A23Cv+D6IxXg2h4zkwR6i0bgVjWJB5EqQe
 8EG+RFPyrjLKJ/6IB3Br72E=
X-Google-Smtp-Source: ABdhPJzLxMVGfF57HHlMph/YXajIfLnISEATl7O2cTyaAnm2qogppDHsEpF3EIVNuiYET/ha1sCf9Q==
X-Received: by 2002:a05:600c:3786:: with SMTP id
 o6mr13460279wmr.170.1623627083066; 
 Sun, 13 Jun 2021 16:31:23 -0700 (PDT)
Received: from localhost.localdomain ([195.245.23.224])
 by smtp.gmail.com with ESMTPSA id i9sm17882511wrn.54.2021.06.13.16.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 16:31:22 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nikita Shubin <nikita.shubin@maquefel.me>, linux-fbdev@vger.kernel.org
Subject: [PATCH 4/7] video: ep93xx: Prepare clock before using it
Date: Mon, 14 Jun 2021 01:30:38 +0200
Message-Id: <20210613233041.128961-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Jun 2021 07:29:40 +0000
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
to Common Clock Framework.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/video/fbdev/ep93xx-fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index ba33b4dce0df..2398b3d48fed 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -548,7 +548,7 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 	}
 
 	ep93xxfb_set_par(info);
-	clk_enable(fbi->clk);
+	clk_prepare_enable(fbi->clk);
 
 	err = register_framebuffer(info);
 	if (err)
@@ -577,7 +577,7 @@ static int ep93xxfb_remove(struct platform_device *pdev)
 	struct ep93xx_fbi *fbi = info->par;
 
 	unregister_framebuffer(info);
-	clk_disable(fbi->clk);
+	clk_disable_unprepare(fbi->clk);
 	ep93xxfb_dealloc_videomem(info);
 	fb_dealloc_cmap(&info->cmap);
 
-- 
2.32.0

