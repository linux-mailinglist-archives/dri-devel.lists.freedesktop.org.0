Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA21577BB2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65C5A9DDD;
	Mon, 18 Jul 2022 06:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EC4A9D65;
 Mon, 18 Jul 2022 06:39:13 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id v185so8526788ioe.11;
 Sun, 17 Jul 2022 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYeRKHCadEBtSKbwYD7EHdFzJWdc3juHJwHU+OhGc68=;
 b=jd2SSLXQTb4GidOhjmN+Bc97PLnF1pjWdReen7IekiYT5fbKtiVdzijhzxn40kvjwM
 EZZZhYhWgzUUHHaE4hDzYCJ9Lv4ywpIw5Vx/XCmP5e8ce/U4guj9q2Zrw2AFA8Fn5zT0
 VUA9XgWuEEvV3r3B1bMkbLnGIMw3g7luFAmYbMccWJBUb2dlCuIAY8B81IdS4NWy+K+p
 B0PO1VDZOaU3wa71crVU2RlSOtGObVhfdvOEl5PSnNRFQGdm5uYeiFSALTtUTP/lUvtx
 228ojpxHt4W18/a+l5fmkt36kXigmtnThB8LRSUO5rEEzEZ1GsHbViXnw3LKowHhE7hW
 aZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EYeRKHCadEBtSKbwYD7EHdFzJWdc3juHJwHU+OhGc68=;
 b=IRA6YO0N/9K7+xLbQmkmTPmf4TDTrZiEc3t/CVHlSKwSfDCTej2bO2Puhd0vercaOr
 w0Pb74nWaBjvZ8w75A1QjqPB16H8/N7YxJQXvF//xkiYZqYEqFN2LZxBpsXcoJV0HlFm
 XUM94cBbU33oQnApNPpmkLKjSGi8HlfpJUXKROiA5UHer2SV1icUor+S6heNvfu8sbos
 cBS8luOQsaN4rKbziS0+K7/EQA8YE65Ocd1G7quAn6cLeAqz/2aHZ70qcQoYNmFGMxVR
 q6oEzd/mKk/sfLbF8NoYKBTjkniyQ5EbL1PR1Zi4bg/oGvsFEb/fuXY738HEqFFOufgD
 lyBQ==
X-Gm-Message-State: AJIora8/lUMmamvDrMld6EgHMVyj6+SJ/2HNCacsjVBMbSTOnvR5Mbrz
 +8xwqyUImpazSgqRcXZmgls=
X-Google-Smtp-Source: AGRyM1tbDbLg61RGiNlLc8kAzP7jUeEdBlS0zixWC+z+vSEbuCEXbcqlunyIjSLJXhAtsq09/HEqkg==
X-Received: by 2002:a05:6602:2ccf:b0:67b:e772:a7a2 with SMTP id
 j15-20020a0566022ccf00b0067be772a7a2mr6291821iow.109.1658126353071; 
 Sun, 17 Jul 2022 23:39:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 33/39] dyndbg/drm: POC add tracebits sysfs-knob
Date: Mon, 18 Jul 2022 00:36:27 -0600
Message-Id: <20220718063641.9179-44-jim.cromie@gmail.com>
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

