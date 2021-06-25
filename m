Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A543B5974
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F506E0E1;
	Mon, 28 Jun 2021 07:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261CF6E07F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 22:33:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j2so18765587lfg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9NMDPaGNwo9dp++pt7dEDvz6yBvTGcBoymI++g12NOc=;
 b=XxeooSIoZSkGhXTTLzsaf8YXlV0sKShLzgUbVXnUr+3uwjIxtVEAvtn/nLYxqjjS+E
 645gOFtwDu27Q2bAAHc1zQcxXFbXxzSxfIZhsikD9NAkQtowjvqVchR1yrMRrcr3yaGc
 oG89m+lOmnnzs6JW0urF1QbP5OqI5hZg/9Jnz9Zs7O8csPTsI0+1T/sF8vRN4F34ulaO
 jN0E5IiFX+v3fHdTikeXUT+tPYBiENiOPFZ5MEntFVJJ1mx9Fin/wN/atCa6UNVG1s34
 HbD7SNrvdHKSxq1DP43W6eGaSw8NRSBhDXqdrJpu6uhntRQPxAqupsG5Ep8oRmof/4P4
 qiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9NMDPaGNwo9dp++pt7dEDvz6yBvTGcBoymI++g12NOc=;
 b=Pft5kqg9fFAQ3z5gTK0QC2zHBCxxL5K0K9i2kQWG0/lxv/EnlpIpkSch/QqFrFrbdF
 iqWcKU0jrxz+uiAKnmFU4VdWuiQJbx7ssslSIp8WDiuDupEq+pbs3xM2MlTfqF/7Ouvl
 mXfhxnOqfkVFvebCNj+TA8RJaoXcy8ZGFfbD4NX1EpTi8e2WMQlAAljLb+dgfIonYe2C
 pB0YvfyMvtyIbO3hdwdsAIYEQoyzO5nQ0O5DOoCZrvskivhXh745XVuYpHi8isAlo+jz
 zJEqzNNd0uGPIqNORC0P6XHKgYaxCAFUK9LurC7ivGwOBnJBhX3Uc2Iw+BCQBPWVnUx9
 7JVw==
X-Gm-Message-State: AOAM530bqd5iFnwYs69bkEvatS1rk9TBmqx4FeXjQOyMdgI0TssQObqo
 jDRxmq2U1KDjDE1NaxlJ6gI=
X-Google-Smtp-Source: ABdhPJxw0w49mOJH8eZ2E+fmYpRltbdOf6mNxIn28I5KywQCjMRXPg6FGSFpgOtx0JdQRn+GFIukdA==
X-Received: by 2002:ac2:4281:: with SMTP id m1mr9344466lfh.164.1624660420338; 
 Fri, 25 Jun 2021 15:33:40 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id p26sm707610ljn.94.2021.06.25.15.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 15:33:39 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gustavoars@kernel.org,
	sam@ravnborg.org,
	tomi.valkeinen@ti.com
Subject: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Date: Sat, 26 Jun 2021 01:33:23 +0300
Message-Id: <20210625223323.13930-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:06:06 +0000
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
Cc: linux-fbdev@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of allocation failures, all code paths was jumping
to this code:

err:
	kfree(fbi);
	kfree(var);
	kfree(fbops);

	return r;

Since all 3 pointers placed on stack and don't initialized, they
will be filled with some random values, which leads to
deferencing random pointers in kfree(). Fix it by rewriting
error handling path.

Fixes: 897044e99e43 ("OMAP: DSS2: OMAPFB: Reduce stack usage")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 .../video/fbdev/omap2/omapfb/omapfb-main.c    | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index a3decc7fadde..6a302138ebeb 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -2025,21 +2025,19 @@ static int omapfb_mode_to_timings(const char *mode_str,
 	fbops = NULL;
 
 	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
-	if (fbi == NULL) {
-		r = -ENOMEM;
-		goto err;
-	}
+	if (fbi == NULL)
+		return -ENOMEM;
 
 	var = kzalloc(sizeof(*var), GFP_KERNEL);
 	if (var == NULL) {
 		r = -ENOMEM;
-		goto err;
+		goto err_var;
 	}
 
 	fbops = kzalloc(sizeof(*fbops), GFP_KERNEL);
 	if (fbops == NULL) {
 		r = -ENOMEM;
-		goto err;
+		goto err_fbops;
 	}
 
 	fbi->fbops = fbops;
@@ -2047,7 +2045,7 @@ static int omapfb_mode_to_timings(const char *mode_str,
 	r = fb_find_mode(var, fbi, mode_str, NULL, 0, NULL, 24);
 	if (r == 0) {
 		r = -EINVAL;
-		goto err;
+		goto err_find;
 	}
 
 	if (display->driver->get_timings) {
@@ -2088,11 +2086,12 @@ static int omapfb_mode_to_timings(const char *mode_str,
 
 	r = 0;
 
-err:
-	kfree(fbi);
-	kfree(var);
+err_find:
 	kfree(fbops);
-
+err_fbops:
+	kfree(var);
+err_var:
+	kfree(fbi);
 	return r;
 }
 
-- 
2.32.0

