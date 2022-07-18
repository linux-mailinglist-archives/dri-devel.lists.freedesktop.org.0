Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6654B577BD3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0A2A9E46;
	Mon, 18 Jul 2022 06:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5459EA9D54;
 Mon, 18 Jul 2022 06:39:27 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id d4so5550290ilc.8;
 Sun, 17 Jul 2022 23:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4h3uY9TThXC1PV4gG3mzVW2/VJmh8sYmlsiKmbk1ueg=;
 b=pragKMwsSkcMk3t0vUXFzvmCdBkZfTmsKdg6x1AsQUUj8DyJYts9OeNeWFGnwDYrhX
 blQS0nSUVlBDFUcV2TV4PM68hBNlWKYtWwowbHYIng6Vc8H7vPaLR5vhOB4ZpUbQ8jE0
 v4Pw/nsT0XWMU1Je6Kc6QtSrG5JwvPK7JTXKwCcmgDg0gjiPCuHtBZVEQ8xvu0pNOl8P
 vQahuu3q30bsO200BSvYmMw3I4xTsqFVz62wJKlFG8prZcmNzAZ7SPl9Way3cL5g5FXe
 1YmrIXPWwDgjsJ4v1ehXDNO+ABJVGB6b+aF83J8X5Ed0IW3CdDXTfGmyXPNmJp86H5oA
 dSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4h3uY9TThXC1PV4gG3mzVW2/VJmh8sYmlsiKmbk1ueg=;
 b=Vex1BtxzCUwv83z7PPtgyoHHQa79R5EI1F2xrbKx9sX/OuwF0cIpxRG+wk9g3aKjMv
 W6yhQiA4wa2ted3sShXvyFP+ip7n4tJmgZJ3ztpfH75btMSHLaUDtDicUzvlz4B+KHzr
 QmWTKE+TU/R03xNWf6RJ4xtxq272vzNe6LW8suMlBJ9Z/hIt+r7/aWm8UG2wlrX2ppig
 +ijia0GdlOPrxQdCnBjxCsKSahu/YzVCNeNQqtdGePikEv4eUpICF1A+ypJ9e4qfzzRt
 mSDcQtA7soCw0xXCgKj0HtY1IE+uiPOnNG4LcPI9nk8pUV1hzpt5lnDyTmAIkolKVsPI
 nu8g==
X-Gm-Message-State: AJIora/zvFUAxJ3mtF8vG+0nm0M+uEkoAnYBePDzSTLfyibejBhmDOic
 +LvnomdVQml1x+9kvyMckIA=
X-Google-Smtp-Source: AGRyM1uxkIZYdg2hpRqOBvqhpK/kcl3egJaIC6Zu3w+t42+3lEhhgc1jI9Fd8BolosGMwq/dbywnVQ==
X-Received: by 2002:a05:6e02:1b0c:b0:2dc:8b29:f1d5 with SMTP id
 i12-20020a056e021b0c00b002dc8b29f1d5mr12741424ilv.184.1658126366608; 
 Sun, 17 Jul 2022 23:39:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 38/41] nouveau-dyndbg: alter DEBUG, TRACE,
 SPAM levels to use dyndbg
Date: Mon, 18 Jul 2022 00:36:37 -0600
Message-Id: <20220718063641.9179-54-jim.cromie@gmail.com>
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

clone the nvkm_printk,_,__ macro ladder into nvkm_drmdbg,_,__.
And alter debug, trace, spam macros to use the renamed ladder.

This *sets-up* to remove the _subdev->debug >= (l) condition from the
__ macro, once the bitmap-param is wired up correctly (pointing at the
right state-bit-vector), and figured into dyndbg's jump-label
enablement.

Also, with DYNDBG=y, sites will be off, until enabled by >control, or
by #define DEBUG at compile time.

Starting with this as a model:

    static struct ddebug_classes_bitmap_param drm_trace_bitmap = {
	.bits = &__drm_trace,
	.flags = "T",
	.map = &drm_trace_classes,
    };
    module_param_cb(tracecats, &param_ops_dyndbg_classes, &drm_trace_bitmap,..

We basically need to clone that, but ref a different .bits:
	.bits = &_subdev->debug,
	while respecting the _subdev's lifecycle.
	hints welcomed.

no functional changes. (other than dyndbg's default-off)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
index 065d07ccea87..b9c2afab321f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
@@ -59,9 +59,17 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
 #define nvkm_error(s,f,a...) nvkm_printk((s), ERROR,    err, f, ##a)
 #define nvkm_warn(s,f,a...)  nvkm_printk((s),  WARN, notice, f, ##a)
 #define nvkm_info(s,f,a...)  nvkm_printk((s),  INFO,   info, f, ##a)
-#define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,    dbg, f, ##a)
-#define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,    dbg, f, ##a)
-#define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
+
+#define nvkm_drmdbg__(s,l,p,f,a...) do {				\
+	const struct nvkm_subdev *_subdev = (s);			\
+	if (CONFIG_NOUVEAU_DEBUG >= (l) && _subdev->debug >= (l))	\
+		dev_dbg(_subdev->device->dev, "%s: "f, _subdev->name, ##a); \
+} while(0)
+#define nvkm_drmdbg_(s,l,f,a...) nvkm_drmdbg__((s), NV_DBG_##l, dbg, f, ##a)
+#define nvkm_debug(s,f,a...) nvkm_drmdbg_((s), DEBUG, f, ##a)
+#define nvkm_trace(s,f,a...) nvkm_drmdbg_((s), TRACE, f, ##a)
+#define nvkm_spam(s,f,a...)  nvkm_drmdbg_((s),  SPAM, f, ##a)
 
 #define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
+
 #endif
-- 
2.36.1

