Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D84577BA9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E77A9DAC;
	Mon, 18 Jul 2022 06:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2922BA9D68;
 Mon, 18 Jul 2022 06:39:21 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id c16so4317650ils.7;
 Sun, 17 Jul 2022 23:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KKkb9oOdw91XqyLkF4FwBMUXpB/qcPhIT6fnMrSUSuE=;
 b=PbQrc+id7LhSU1v+A8gvSmMtePFyY6tUCfqWN0lMtrIk2gbMzhrXLDW8G8tPKLccsZ
 PEhgzLQ2gjVbdvcT/2HtqEl4WLck63d0umxHVhKP2TzwyGU1kipFMSG4OYazgtbdoGyv
 NER5EbeWFPsjAa9Zs5XNOiuL4Ld9FTIMjp4mOVASQvlds7pv2UZeyh53ZOcKwqGhJLZ0
 FEINVQPABCEHjKMA46+d8G9F0X+i2qNj5+3lUiKIxXa+E7HyssjlA0gDm5Y6IOIhweDg
 7kYm4/IFWW8dAqZ8x7lbyzqkMrxRlYd3XGIses+uQv1M4sHodB5X+bezsVgjsSkUR+C/
 A7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KKkb9oOdw91XqyLkF4FwBMUXpB/qcPhIT6fnMrSUSuE=;
 b=tA9uSlypFzN/UnOGCbQX3VOK+GwNwV4JYWjpn1jjN0ZluIDLheEWmGW5UfaGmt7pQE
 P1RPf+mLRfp09QcM1wp8kjqByOy23I4uKvCXkbI18WGSxqC19QV/e4M+a4VJkFYZZkAO
 CUwBqPZd2nG4Rea7+ppCihiUmNvSy21/o+wOI2slFmlBumseUd08G4pUVh9yFtumYT1J
 JdJ1WtfkBnu9A2m5jBcwRHevXaPvjad5PBVFHYQaoqkttWiNxgPNSOlseRY5oEf0H6pH
 q/ITRPDdXIlQy09gXDIdDYvGTrpzeC2p+B4mb8RGHhgkztMkmGM9kWwgg7CZ4s+a4EGo
 HpzQ==
X-Gm-Message-State: AJIora9iBX1fc45QeZGjDIpY+R7ZsxXgKAQHovf1vAe1Yr4Kw0NU9AvV
 EysNuQ43EyEfA5ti8kCYfmMHJJgoF4A=
X-Google-Smtp-Source: AGRyM1vWADfdH5kRs/2RdufSwHJDp2A0hCBdeaEWXGBmF2kYnkVax/tF3WuTEuKwPHyyNiOAKYOOHw==
X-Received: by 2002:a05:6e02:1845:b0:2dc:777d:1ef8 with SMTP id
 b5-20020a056e02184500b002dc777d1ef8mr13003358ilv.246.1658126360343; 
 Sun, 17 Jul 2022 23:39:20 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 36/41] dyndbg/drm: POC add tracebits sysfs-knob
Date: Mon, 18 Jul 2022 00:36:32 -0600
Message-Id: <20220718063641.9179-49-jim.cromie@gmail.com>
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

clone DRM.debug interface to DRM.tracebits: ie declare __drm_trace,
map its bits to drm-debug-categories, except this interface enables
messages to tracefs, not to syslog.

1- we reuse the drm_debug_classes class-map added previously.
   this reflects the single source of both syslog/trace events
   and is why structs classmap and bitmap-param are separate.

2- add a 2nd struct ddebug_classes_bitmap_param
   refs 1, reusing it.
   flags = "T", to enable trace-events on this callsite.

3- module_param_cb([2]) - does the sysfs part

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 9fb0b8e40dca..47a41d96beea 100644
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
@@ -77,6 +80,13 @@ static struct ddebug_classes_bitmap_param drm_debug_bitmap = {
 	.map = &drm_debug_classes,
 };
 module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+
+static struct ddebug_classes_bitmap_param drm_trace_bitmap = {
+	.bits = &__drm_trace,
+	.flags = "T",
+	.map = &drm_debug_classes,
+};
+module_param_cb(tracecats, &param_ops_dyndbg_classes, &drm_trace_bitmap, 0600);
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
-- 
2.36.1

