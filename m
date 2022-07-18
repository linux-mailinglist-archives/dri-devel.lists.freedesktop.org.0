Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2F577BB1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C5CA9DA4;
	Mon, 18 Jul 2022 06:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED35DA9D1D;
 Mon, 18 Jul 2022 06:39:14 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q14so8517747iod.3;
 Sun, 17 Jul 2022 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zHXuCHSDAst3rnpwf/s/tuXP/BC2Qx6HTatuli9S1A=;
 b=HpUCWwhIZ+SPM2kb66ap0jVQGyYiP/y7KsE+xJW8/Jme2FFvYNs22pPBLdn2Y7GTNm
 sMR37ROiNLaDmEKYSwrQ3FHiPJiH1jFCeTnLV6RioPX7rkiVey8jRDaz6/TduCagW4C+
 +7FmxWNuOVNpS/YyEvuzngBafSqYRcwqQqVYC9PTa0IhLCwo1hxrqsGBpjGfVKFrRaHO
 v6rX9Qoxhk1hpm953ltm7GbunkSkrLYAxvgDkRXBymZped1KRvBeANLc2Do97lmwui0N
 ACP7NDCTGx+DmY3eVVmUcakGuVUxV6/Ww/rCLahi0Xm8nE1oD2mChoFtBq8C9RxnB4Az
 8kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zHXuCHSDAst3rnpwf/s/tuXP/BC2Qx6HTatuli9S1A=;
 b=kVOPCwtSjvWdocxPyuBgo/3auZfCgTerOuju+0jhftTelxY/Tw/FXHTxiV92BaAZZZ
 3OWQLKUtEhzAYltNbgLrfxxrZaa1wr0UnzAu3gAOjR8Bzo6zjtR1wEJlRdUp85Fj0Ctn
 pmlqCxCrigs7ZklEGcyRW7virsT+YJ0ZJJmiVHzMVVTIGi7OI/XDQmeF1kOjHk5NpJzM
 aoJtcv39Xi/mdKSam8xLf9W0OaWvt6gvGJewn4s0tULIRbjx5azdwXSWQtqcrn1MpxM+
 0SgRUKINcvppUY5Sc5f24dzcib2rKLTKhRJhVcS5NFFeInUIK5enytIATzjlUbyeX9+1
 ehjQ==
X-Gm-Message-State: AJIora/NfNXkaCnbE7j/HJqPRsOZW4jpMyPIx6FMOtYaf6J7avlTQYo7
 ldi8Ba/ijAfL3nU9oLkhxU0=
X-Google-Smtp-Source: AGRyM1sJBj4nLaEskUkGmuCRBLJIAyPe7+LsOChkXpcppNCu1bb7UiTa85pMp8rNV9/mHZ/+ccRe2A==
X-Received: by 2002:a05:6638:2595:b0:341:4683:782a with SMTP id
 s21-20020a056638259500b003414683782amr9266471jat.49.1658126354570; 
 Sun, 17 Jul 2022 23:39:14 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 34/39] drm-print: add drm_dbg_driver,
 improve namespace symmetry
Date: Mon, 18 Jul 2022 00:36:28 -0600
Message-Id: <20220718063641.9179-45-jim.cromie@gmail.com>
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

but not drm_dbg_driver itself, which was the original drm_dbg.

To improve namespace symmetry, change the drm_dbg defn to
drm_dbg_driver, and redef grandfathered name to symmetric one.

This may help with nouveau, which uses its own stack of macros to
construct calls to dev_info, dev_dbg, etc, for which adaptation might
mean drm_dbg_##driver constructs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 2879a2f84381..46f14cfb401e 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -497,7 +497,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 
 #define drm_dbg_core(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg(drm, fmt, ...)						\
+#define drm_dbg_driver(drm, fmt, ...)						\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
@@ -516,6 +516,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 #define drm_dbg_drmres(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
+#define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
 
 /*
  * printk based logging
-- 
2.36.1

