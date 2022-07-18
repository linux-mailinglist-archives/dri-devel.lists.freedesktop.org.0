Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878AC577B6E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DD1A9D35;
	Mon, 18 Jul 2022 06:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A77A9CCA;
 Mon, 18 Jul 2022 06:38:47 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id h16so5562324ila.2;
 Sun, 17 Jul 2022 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smzB/k68xh/FUqryWbOBUBLDbn4KcKzhEOP/Gwd4FZo=;
 b=ah2TZz5keynCDPjyhkGgnYVjD/qc6MmYD6vhncSoTTncxjPnxFCvzY7KxwxmtivoLW
 pCnnvOsNmSyY8Ol9371D6otdo2TgPokbFHQ2WATaOb6NEsR+SiFbk6y2Pk6vrJwQj4id
 Bt1g3bIyiCI39owjXvN7O1AcruFaTtWkW0IY5/5FeNyM1UEb4Se0d7OKjOsMeP7gEz/7
 NOs0KhETf9lINi69BUTouUt5STjab4J6mxcqANq6c1FSpu0gO3vD6IuySuVhEbF/n68H
 hAhkizEZocCkq3FCVtYAia7dUZLjg7b2WmKlrqlYHGfxH6b/njsJEoqWcQVv4rRX0KEI
 CV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smzB/k68xh/FUqryWbOBUBLDbn4KcKzhEOP/Gwd4FZo=;
 b=KE7J4nbD4Rl2NFjHu+Q/YSO2h6ShGUp15CYKwG29gewcO/YT1GIfC6niVnNsNjnfsD
 lY/qghHx24lmxyIX+KSn9BH3qOOuix41Jw6+7mADiqk+KQ+bfHbUp16awBRe835TvJ2D
 oFFhbj2IWMPjsZEfDUSzvBLdAAFBmabtI/wGrothLWTKQqm2TFeY4kTNpisQhRQYi5LH
 hpq5etEIXGrta3lbMDrTEpZ3YiRiykVVPfaIH5VD9QQRGGBJdfN2RmIRqQiQXowDoQ8C
 jQ37Qd4ia292kTPLerFuokFIYGhWDqNR4p6oa0E4XLvJO5f+MjEj+6Fu/PaRdUJ7aqDZ
 Grcw==
X-Gm-Message-State: AJIora9fuaXlDUDC38Y+bLItdg0V2iDBp+hVs+qQ4DUuZUsYjuglBPrs
 H5jTMo8VpzE9MzmXbdeTWLg=
X-Google-Smtp-Source: AGRyM1sqMK5bl/L6uxE9zzl1H/ELATJwPDh1PJA+wiVwCUtsbWTUDfw6n+PWmZQ5IGlrzydsR+cCpw==
X-Received: by 2002:a05:6e02:1c07:b0:2dc:e707:e49d with SMTP id
 l7-20020a056e021c0700b002dce707e49dmr2168383ilh.190.1658126327071; 
 Sun, 17 Jul 2022 23:38:47 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 24/41] drm-print: add drm_dbg_driver to improve namespace
 symmetry
Date: Mon, 18 Jul 2022 00:36:08 -0600
Message-Id: <20220718063641.9179-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
index 2d2cef76b5c1..3aa5e9ea26f4 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -467,7 +467,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 #define drm_dbg_core(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg(drm, fmt, ...)						\
+#define drm_dbg_driver(drm, fmt, ...)						\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
@@ -486,6 +486,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define drm_dbg_drmres(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
+#define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
 
 /*
  * printk based logging
-- 
2.36.1

