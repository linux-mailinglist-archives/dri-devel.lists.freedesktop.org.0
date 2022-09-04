Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2365AC776
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A24910E269;
	Sun,  4 Sep 2022 21:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6110E249;
 Sun,  4 Sep 2022 21:42:47 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b142so5642444iof.10;
 Sun, 04 Sep 2022 14:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=F+IqvxQINaymRL+MafidUTbGzpHBkq2RsFapBWAQydg=;
 b=N0zhsOBdmXSpqdVIM7Dax53vYiJTKsqF6x9qw6PLO/aFCYoOS0opwP1W/5aTypbefh
 thcPTdmgHjCwAVeFNHFjBjHzjInzGS+YiXXOrz8p9PMclYRxe1LfcB0y1XUcNo/5BytA
 YEnLhw/gfAr8rG8KozwOaV+lYe7NXyUjy4JmDGJ94WvqWQr15EnP0FR45EtCb9sixA2H
 5PVujoc2/62tw2Rf6QVixL1umMf0g4g0KWpbNPggi2SaHbsUt9ALitBx9exeU1qkh3CT
 vHElW8wRlXwjNWiUeoUytlqPPgsAovjsIKN3Z9gCGdsWoXgjj0apzjKHP7jxrbSbW8d4
 SIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=F+IqvxQINaymRL+MafidUTbGzpHBkq2RsFapBWAQydg=;
 b=KBhhIppzZLDDBhZp4G1PdJD6bUrHPaes7J1V9U+k8qA2nWTsJvKjGCgwZz3YjqZbid
 WWpqTvnUAI3tXZLqo1pruFWgMviB/B8g0752Z8wygT0D3D6ZjP23hYAgaj9zjFEAKfev
 BnkKMO2olp2zI6xNSHyqCQ/ZjmeX8J/v0y3E28W3w4pQA65VcvciNK2Ku2W5LXEVFnei
 Pjr5nBmlV073T0XrvQ8buzS2ltTTQezZMNgj2fozKLszcyIPY4WzKyGeYIDxFK9dSkVN
 a/WsRJDwYU709Raz13Nr4ic91jzqziV2pMpy3YyOqRYLNGJJ1j711Qw1/n2015RwdIFQ
 /ORw==
X-Gm-Message-State: ACgBeo2X5TQojNJ/pBaldW9GHEnZoxr9GLjmguvnZLWvFTTLYJFuZyMj
 gZ69EV8CaUlAcunip8CpXy0=
X-Google-Smtp-Source: AA6agR6wneRG7yCu0WnhzdrmY46L82HWUk9b8e+ZYvtbU/eRsNK3PLQqrk215dPJggzpSd7jRHChZQ==
X-Received: by 2002:a5e:c319:0:b0:68b:2683:8e26 with SMTP id
 a25-20020a5ec319000000b0068b26838e26mr17614839iok.129.1662327767546; 
 Sun, 04 Sep 2022 14:42:47 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 39/57] dyndbg/drm: POC add tracebits sysfs-knob
Date: Sun,  4 Sep 2022 15:41:16 -0600
Message-Id: <20220904214134.408619-40-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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

clone DRM.debug interface to DRM.tracebits: ie map bits to
drm-debug-categories, except this interface enables messages to
tracefs, not to syslog.

1- we reuse the class-map added previously.
   this reflects the single source of both syslog/trace events

2- add a 2nd struct ddebug_classes_bitmap_param
   refs 1, reusing it.
   flags = "T", to enable trace-events on this callsite.

3- module_param_cb([2]) - does the sysfs part

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index c50edbf443d3..75d0cecd7e86 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -45,6 +45,9 @@
 unsigned long __drm_debug;
 EXPORT_SYMBOL(__drm_debug);
 
+unsigned long __drm_trace;
+EXPORT_SYMBOL(__drm_trace);
+
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
 "\t\tBit 0 (0x01)  will enable CORE messages (drm core code)\n"
 "\t\tBit 1 (0x02)  will enable DRIVER messages (drm controller code)\n"
@@ -77,6 +80,13 @@ static struct ddebug_class_param drm_debug_bitmap = {
 	.map = &drm_debug_classes,
 };
 module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+
+static struct ddebug_class_param drm_trace_bitmap = {
+	.bits = &__drm_trace,
+	.flags = "T",
+	.map = &drm_debug_classes,
+};
+module_param_cb(tracecats, &param_ops_dyndbg_classes, &drm_trace_bitmap, 0600);
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
-- 
2.37.2

