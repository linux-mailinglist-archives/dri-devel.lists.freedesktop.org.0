Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641D3487298
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343111327C;
	Fri,  7 Jan 2022 05:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD906113250;
 Fri,  7 Jan 2022 05:30:11 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id x15so3808841ilc.5;
 Thu, 06 Jan 2022 21:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MXP101OBKmlnLofCkQPbu2Mn+KOJTGfJ6b+NIiHZLS4=;
 b=D0dcLl/Cn+05vmbxEjZI4ubBfvPU4FZ8FgYhK/JyJWNyoH+7qZpiKJfVRL5ulKNTRy
 jFDcUxZ91EN16Ibemv9vUXdY1ReZQaflP4hcZQHEHRJOjkVNQ5W9khjmIANSER/NtbMP
 I4e1dlHmX0Z6WSZAvdoJ45Sber5oXYOi2xew3LlQ/9tbieVU8eWL59q2mMsc1wpwOtd1
 khuF/ia6OakQnXTmlFRLOh0StIV+ANTNdh7eDyd44bVKYA02wrjMsxD16+I9JEcpjPHa
 2Kwykx0kyqSEmt2NAzQrL+9zCN6drsk+OR194QbU7V6JD8Hd2GYg0XtH/YYP+ALyhuej
 BSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MXP101OBKmlnLofCkQPbu2Mn+KOJTGfJ6b+NIiHZLS4=;
 b=zJqOQxljlVinyCAxyEzzM8lBbSl2AEyz1CgJTVk7c8KSRQxCEgX6xikQ1MpjNZaGdX
 VPT6Sq6GYakkAPZb8uW8K019ChBVSY8BwQNVLAuXcLVwkl9Tfg7a9yFZUioMeEeTOSkS
 WrjnAyyOh2t2W0KIMChDBP8hIjLNyI0FXfd+mJE28DCyRIt+4tm26UvsUe9AsCvvbj5K
 mWvUPzCmMsAuUxghd9he4Ys7giQXkqQ8gjoYe9lsJ/Zj0N56fN2O/0fRvsXfRW2gBiZb
 bzlirMKnf03eeVc/+jT8rNcyBjWgwfR5gBLosm4UHW/4tjJIPgawTnWCyMUQqmGfjYKJ
 swLA==
X-Gm-Message-State: AOAM5334Xefsn1dMHQhdOfoqxXUSiXceH/JC1imcreHUu41wI6gXW1iW
 zNuefn2dA1/tRd/Bn9lnpkg=
X-Google-Smtp-Source: ABdhPJyJV+ie8tIgRKUsxFge8djV88zEG6NNzur6iycvq7O0pB1HrKdK6LcPy9o+zi6LoQYAKFNbXA==
X-Received: by 2002:a92:c685:: with SMTP id o5mr29675045ilg.152.1641533410743; 
 Thu, 06 Jan 2022 21:30:10 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:30:10 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 17/19] drm_print: add struct _ddebug *desc to
 trace-drm-*() params
Date: Thu,  6 Jan 2022 22:29:40 -0700
Message-Id: <20220107052942.1349447-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace trace-drm-*()s category param with struct _ddebug *desc; it
has .classid field, which is the category.

This brings the events closer in line with those added for dyndbg; at
least the 1st param, and possibly the struct device (tb-checked).
There are still differences in the tail of the prototypes; vaf vs
text + len, which probably breaks CLASS sharing.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c |  6 +++---
 include/trace/events/drm.h  | 36 ++++++++++++++++++------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 8c33302212fc..0a15a4ec5ead 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -278,14 +278,14 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
 				   __builtin_return_address(0), &vaf);
 
 		if (desc->flags & _DPRINTK_FLAGS_TRACE)
-			trace_drm_devdbg(dev, category, &vaf);
+			trace_drm_devdbg(dev, desc, &vaf);
 	} else {
 		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
 			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 			       __builtin_return_address(0), &vaf);
 
 		if (desc->flags & _DPRINTK_FLAGS_TRACE)
-			trace_drm_debug(category, &vaf);
+			trace_drm_debug(desc, &vaf);
 	}
 	va_end(args);
 }
@@ -306,7 +306,7 @@ void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const ch
 	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
 	       __builtin_return_address(0), &vaf);
 
-	trace_drm_debug(category, &vaf);
+	trace_drm_debug(desc, &vaf);
 
 	va_end(args);
 }
diff --git a/include/trace/events/drm.h b/include/trace/events/drm.h
index 944aedaf6aa6..bfe1fff923d8 100644
--- a/include/trace/events/drm.h
+++ b/include/trace/events/drm.h
@@ -9,25 +9,25 @@
 
 /* drm_debug() was called, pass its args */
 TRACE_EVENT(drm_debug,
-	TP_PROTO(int drm_debug_category, struct va_format *vaf),
+	TP_PROTO(struct _ddebug *desc, struct va_format *vaf),
 
-	TP_ARGS(drm_debug_category, vaf),
+	TP_ARGS(desc, vaf),
 
 	TP_STRUCT__entry(
-		__field(int, drm_debug_category)
+		__field(struct _ddebug *, desc)
 		__dynamic_array(char, msg, 256)
 	),
 
 	TP_fast_assign(
 		int len;
+		char *p = __get_str(msg);
 
-		__entry->drm_debug_category = drm_debug_category;
-		vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
+		__entry->desc = desc;
+		len = vsnprintf(p, 256, vaf->fmt, *vaf->va);
 
-		len = strlen(__get_str(msg));
-		if ((len > 0) && (__get_str(msg)[len-1] == '\n'))
+		if ((len > 0) && (len < 256) && p[len-1] == '\n')
 			len -= 1;
-		__get_str(msg)[len] = 0;
+		p[len] = 0;
 	),
 
 	TP_printk("%s", __get_str(msg))
@@ -35,30 +35,30 @@ TRACE_EVENT(drm_debug,
 
 /* drm_devdbg() was called, pass its args, preserving order */
 TRACE_EVENT(drm_devdbg,
-	TP_PROTO(const struct device *dev, int drm_debug_category, struct va_format *vaf),
+	TP_PROTO(const struct device *dev, struct _ddebug *desc, struct va_format *vaf),
 
-	TP_ARGS(dev, drm_debug_category, vaf),
+	TP_ARGS(dev, desc, vaf),
 
 	TP_STRUCT__entry(
-		__field(const struct device*, dev)
-		__field(int, drm_debug_category)
+		__field(const struct device *, dev)
+		__field(struct _ddebug *, desc)
 		__dynamic_array(char, msg, 256)
 	),
 
 	TP_fast_assign(
 		int len;
+		char *p = __get_str(msg);
 
-		__entry->drm_debug_category = drm_debug_category;
+		__entry->desc = desc;
 		__entry->dev = dev;
-		vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
+		len = vsnprintf(p, 256, vaf->fmt, *vaf->va);
 
-		len = strlen(__get_str(msg));
-		if ((len > 0) && (__get_str(msg)[len-1] == '\n'))
+		if ((len > 0) && (len < 256) && p[len-1] == '\n')
 			len -= 1;
-		__get_str(msg)[len] = 0;
+		p[len] = 0;
 	),
 
-	TP_printk("cat:%d, %s %s", __entry->drm_debug_category,
+	TP_printk("cat:%d, %s %s", __entry->desc->class_id,
 		  dev_name(__entry->dev), __get_str(msg))
 );
 
-- 
2.33.1

