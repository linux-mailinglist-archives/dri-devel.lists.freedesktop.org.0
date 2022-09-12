Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975595B5382
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E361410E1B4;
	Mon, 12 Sep 2022 05:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041F210E0CE;
 Mon, 12 Sep 2022 05:29:11 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id g8so3472665iob.0;
 Sun, 11 Sep 2022 22:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=i5t2bbZH1qhLqkOMOWZd9/3/gcmt6p6QRrw1EPy3Aj4=;
 b=qOh/R9lECFRWqs7dMZp6LrjZUUMurRbhAZWpZcjLAW+XOtO1yvv7fBHHkJlyTkEucK
 bNKga9KrZesxfbiOu7HM8ANgJZHDoqwdfsPZFrTfCG9+8ck3qVQfNh50M6VT9fPXdTT3
 yCIwfUy2bmo3w9zPxVHJ5CyInYMBcFLrr5XF9nQLAuyFYD2kfNrIikXSEvV1Y6pVVYkw
 Diz05DSsd348fuMY0DVxkeWIalSgUwLsHBeFt4iaaeXKtlv1GwIJSDEFcGI5kG/Zi8Ah
 gY2azQthIsvm3qIMoheAO62ri04by6YxAvUELnbEbTUTrYpOPK37gYr3K6qm534XdYWw
 zPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i5t2bbZH1qhLqkOMOWZd9/3/gcmt6p6QRrw1EPy3Aj4=;
 b=eR2JO2rufGvP5ZqrkOriP6ZTLm38ZWAcuxDvLO6PZfEl/kRaCJXkvR39wKzIdJgKRw
 EF0DibWhqC/ITNmYS4hMSMgF6Gy1pvTbCJ3DbtQljVPw/ZGqZazXITYy6uVf1i6nJImR
 ptOWTUZd8pconn2dQSiGHtCwRoIfwGFT/m2scPNl5xVF9J2a8NWd0UH8cAkXfmmCwdFA
 6FzcqxJMoGGtH3WSFqXOdSt/lUt9SK0WZZcb/JyBdNQjmiYogVunHvcOYwPJSJFRQAix
 vONlA7LC0nOrqUnLHfat64LmLGAGqJrijhZxTHlpCbGVpCjbzbDu1/GeWsyg5M+Zwj5K
 ThKQ==
X-Gm-Message-State: ACgBeo0G9y6Wjnji2fZkRbAGNV2j62+gXG44zxO/ojRr6CzpPYoeQpAS
 14QQfgECmlUC0rJKHF9U7Qs=
X-Google-Smtp-Source: AA6agR6nheDh2F55KS2HuAKuH7mmoLFpxaM+Y9nxKrP34wlXBlmFd+JSKxJMWlB4fe03p4UZt179JQ==
X-Received: by 2002:a05:6638:2729:b0:35a:4666:5dad with SMTP id
 m41-20020a056638272900b0035a46665dadmr379273jav.250.1662960551093; 
 Sun, 11 Sep 2022 22:29:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/9] drm-print: add drm_dbg_driver to improve namespace
 symmetry
Date: Sun, 11 Sep 2022 23:28:49 -0600
Message-Id: <20220912052852.1123868-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print defines all of these:
    drm_dbg_{core,kms,prime,atomic,vbl,lease,_dp,_drmres}

but not drm_dbg_driver itself, since it was the original drm_dbg.

To improve namespace symmetry, change the drm_dbg defn to
drm_dbg_driver, and redef grandfathered name to symmetric one.

This will help with nouveau, which uses its own stack of macros to
construct calls to dev_info, dev_dbg, etc, for which adaptation means
drm_dbg_##driver constructs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f8bb3e7158c6..dfdd81c3287c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -468,7 +468,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 #define drm_dbg_core(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg(drm, fmt, ...)						\
+#define drm_dbg_driver(drm, fmt, ...)						\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
@@ -487,6 +487,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define drm_dbg_drmres(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
+#define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
 
 /*
  * printk based logging
-- 
2.37.3

