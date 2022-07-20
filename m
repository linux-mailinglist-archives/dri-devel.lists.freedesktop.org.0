Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6D857BA83
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E377E8F58E;
	Wed, 20 Jul 2022 15:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1F68F4D2;
 Wed, 20 Jul 2022 15:33:36 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e69so7024862iof.5;
 Wed, 20 Jul 2022 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KKkb9oOdw91XqyLkF4FwBMUXpB/qcPhIT6fnMrSUSuE=;
 b=jNzQH+cIih6YKYxi0SJF9FYNIcumb+PAuinYFT5w9F7nBtrqeWdklMdzdme4aW2UQ9
 RzM+wc+U5cCsaCap+DCY0ZhItwuVJt/1W3eRewMMP/TwgLxsIIq2OT8FSZhlZPqX7UcI
 1rKuEin88F190fVpfFEIFN6YCTCZZnIBUK5Z/YirRvq6bldI1DWDG+b6t+JDw6796KjC
 qlKISzSCOo6knC4+LhLEc2fvpUjleJo+EK6v6T4WXYJH7/LL2u7jOf4zI5CL+5oxz7oc
 Gvg0UxbXV0sMiXgdO4gX16dqoU+GCGqX0qUuhlv56W3QLpST6tryU+AfkmCfghfXtev8
 heaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KKkb9oOdw91XqyLkF4FwBMUXpB/qcPhIT6fnMrSUSuE=;
 b=dqAaYHofXJ9B9Ml8c/ZGfaTmxgaUSuKTUohSZGUocEMCzJ/twu35l3C4cuI1SzZIT9
 dxhO8kMnzxA0c15gH8guX0XIV9Cqae4/qq488ozOn/IummTPZc2GVslRvwp1Yx+e/Emr
 kpfaVBQjhMJUhJk/NCUfrnDiuegOxpthepG6qHbVLbI79AHpCukHXyyuTOvitWfX1MED
 mNBWgv7bQPTupw68ysEUo/E9xW4hERbvneMtUaWPyBKwhD8v2u6yuFNzYxWxUSstAt2Q
 WVWljLvN64NxPsWh1sYrPs2l5zJiZhhyeuI7yPub2HRgusNRIJCmq/0ZROPtsq/p5fv0
 p+7Q==
X-Gm-Message-State: AJIora8OVZMbyGVCDS/8Z+f7PBVblD4A41qA7b4LRXS8SG5PpAu2G8J5
 C4OsAUt4GnOaqamFQSvD8XXDBQ/pk1A9mQ==
X-Google-Smtp-Source: AGRyM1uIfLb5rLzPPH/Aaeu1zQmKz33M0vdDNckg4O1vdNljI0Qliw0QCy3F3L1UHNY8aSe68o5DeA==
X-Received: by 2002:a02:c8c9:0:b0:33f:3647:e751 with SMTP id
 q9-20020a02c8c9000000b0033f3647e751mr19303269jao.225.1658331215765; 
 Wed, 20 Jul 2022 08:33:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 36/41] dyndbg/drm: POC add tracebits sysfs-knob
Date: Wed, 20 Jul 2022 09:32:28 -0600
Message-Id: <20220720153233.144129-37-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

