Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34403577BD4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AEAA9E6C;
	Mon, 18 Jul 2022 06:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5616FA9D4A;
 Mon, 18 Jul 2022 06:39:05 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q14so8517584iod.3;
 Sun, 17 Jul 2022 23:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nl54cX1u1Pw+xbM+qyQgaqDsIGtd0gTdygEK0JFz91w=;
 b=Ky9uWL2giKCVrxKO1OUf9p53q7o25R1cfcDHN/XyXFBnE3hFPHYG+Yj1vv33+aBEgK
 TgQudprAFPlgAHTX2lfXoW9iHPQ/oMV0NkT9OJ3UFuA70/x680iBKO26uCDaDvPRD+ER
 N8MZ7bZCksHFYywDpJL5R3HzwPzc7XbY304wfxfF8vOEAhjnZrSsqAHmQi0PAvFJHXNA
 VszcqGq6Swueads2b8AITUo99acVthkdhzWOUJxDIFuLD7xwpB/UAglKT/nneducW+oP
 umoAI/WEmRNk/VgmYt4KFN8rr+NqmHtbPxNk9cvjy7WtmzaxeLDuW68OwVIlJShz9PXE
 3VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nl54cX1u1Pw+xbM+qyQgaqDsIGtd0gTdygEK0JFz91w=;
 b=sypJ7uwSt6jzsVRonM92uTYH12Qs7a616gLI7UlLDItx5Qme+SS6KOexd9xlvNyIxj
 JbPU+AhwoKoL0hVgX2nrJLneGWdsU5x5SsVKRqyYrsoqD6kQ6+RMgW0rImNpKiQIUvLY
 7TF/g2n1tAtuqDng9M21QMG3kk8d9LJvVv+mg0a4gkzWkhrsSRnbIeHoqi1oNS0LJrc9
 YTOLAcB1jDiF0eiQU6CFbBZwkZCtIPdi8VFrGhutmTdRqxsUw4oiwNRD/hCJTGrUnYp9
 DBACQNpEAs0SdY9mscutE+hGcxpjJtz0P6+6tN2Wuid4yTwA1UbTBsU9DfsJHYt7VEEG
 qN7w==
X-Gm-Message-State: AJIora/Yp4OIApRjWtH9X6jNP7L9NjnkSIRoLhZznMoo4cq6XdgoLk3m
 GCxQbzfFauCLJ5IIbOi26LE=
X-Google-Smtp-Source: AGRyM1tAwpgsOl0zB0ydlAY3TMnLwLZ9uXEXXWBjQBAFlLmhchkr8yX0VqdeBMLL8iDT7GxyR0nitQ==
X-Received: by 2002:a6b:7c47:0:b0:67b:8727:38aa with SMTP id
 b7-20020a6b7c47000000b0067b872738aamr12356158ioq.49.1658126344571; 
 Sun, 17 Jul 2022 23:39:04 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 30/41] tracing/events: Add __vstring() and __assign_vstr()
 helper macros
Date: Mon, 18 Jul 2022 00:36:21 -0600
Message-Id: <20220718063641.9179-38-jim.cromie@gmail.com>
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
Cc: Marek Lindner <mareklindner@neomailbox.ch>, nouveau@lists.freedesktop.org,
 Antonio Quartulli <a@unstable.cc>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>,
 Gregory Greenman <gregory.greenman@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Sven Eckelmann <sven@narfation.org>, Leon Romanovsky <leon@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, intel-gfx@lists.freedesktop.org,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Bin Liu <b-liu@ti.com>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 Simon Wunderlich <sw@simonwunderlich.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

There's several places that open code the following logic:

  TP_STRUCT__entry(__dynamic_array(char, msg, MSG_MAX)),
  TP_fast_assign(vsnprintf(__get_str(msg), MSG_MAX, vaf->fmt, *vaf->va);)

To load a string created by variable array va_list.

The main issue with this approach is that "MSG_MAX" usage in the
__dynamic_array() portion. That actually just reserves the MSG_MAX in the
event, and even wastes space because there's dynamic meta data also saved
in the event to denote the offset and size of the dynamic array. It would
have been better to just use a static __array() field.

Instead, create __vstring() and __assign_vstr() that work like __string
and __assign_str() but instead of taking a destination string to copy,
take a format string and a va_list pointer and fill in the values.

It uses the helper:

 #define __trace_event_vstr_len(fmt, va)	\
 ({						\
	va_list __ap;				\
	int __ret;				\
						\
	va_copy(__ap, *(va));			\
	__ret = vsnprintf(NULL, 0, fmt, __ap);	\
	va_end(__ap);				\
						\
	min(__ret, TRACE_EVENT_STR_MAX);	\
 })

To figure out the length to store the string. It may be slightly slower as
it needs to run the vsnprintf() twice, but it now saves space on the ring
buffer.

Link: https://lkml.kernel.org/r/20220705224749.053570613@goodmis.org

Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Arend van Spriel <aspriel@gmail.com>
Cc: Franky Lin <franky.lin@broadcom.com>
Cc: Hante Meuleman <hante.meuleman@broadcom.com>
Cc: Gregory Greenman <gregory.greenman@intel.com>
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Bin Liu <b-liu@ti.com>
Cc: Marek Lindner <mareklindner@neomailbox.ch>
Cc: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Antonio Quartulli <a@unstable.cc>
Cc: Sven Eckelmann <sven@narfation.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jim Cromie <jim.cromie@gmail.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/linux/trace_events.h                 | 18 ++++++++++++++++++
 include/trace/stages/stage1_struct_define.h  |  3 +++
 include/trace/stages/stage2_data_offsets.h   |  3 +++
 include/trace/stages/stage4_event_fields.h   |  3 +++
 include/trace/stages/stage5_get_offsets.h    |  4 ++++
 include/trace/stages/stage6_event_callback.h |  7 +++++++
 6 files changed, 38 insertions(+)

diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index e6e95a9f07a5..b18759a673c6 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -916,6 +916,24 @@ perf_trace_buf_submit(void *raw_data, int size, int rctx, u16 type,
 
 #endif
 
+#define TRACE_EVENT_STR_MAX	512
+
+/*
+ * gcc warns that you can not use a va_list in an inlined
+ * function. But lets me make it into a macro :-/
+ */
+#define __trace_event_vstr_len(fmt, va)			\
+({							\
+	va_list __ap;					\
+	int __ret;					\
+							\
+	va_copy(__ap, *(va));				\
+	__ret = vsnprintf(NULL, 0, fmt, __ap) + 1;	\
+	va_end(__ap);					\
+							\
+	min(__ret, TRACE_EVENT_STR_MAX);		\
+})
+
 #endif /* _LINUX_TRACE_EVENT_H */
 
 /*
diff --git a/include/trace/stages/stage1_struct_define.h b/include/trace/stages/stage1_struct_define.h
index a16783419687..1b7bab60434c 100644
--- a/include/trace/stages/stage1_struct_define.h
+++ b/include/trace/stages/stage1_struct_define.h
@@ -26,6 +26,9 @@
 #undef __string_len
 #define __string_len(item, src, len) __dynamic_array(char, item, -1)
 
+#undef __vstring
+#define __vstring(item, fmt, ap) __dynamic_array(char, item, -1)
+
 #undef __bitmask
 #define __bitmask(item, nr_bits) __dynamic_array(char, item, -1)
 
diff --git a/include/trace/stages/stage2_data_offsets.h b/include/trace/stages/stage2_data_offsets.h
index 42fd1e8813ec..1b7a8f764fdd 100644
--- a/include/trace/stages/stage2_data_offsets.h
+++ b/include/trace/stages/stage2_data_offsets.h
@@ -32,6 +32,9 @@
 #undef __string_len
 #define __string_len(item, src, len) __dynamic_array(char, item, -1)
 
+#undef __vstring
+#define __vstring(item, fmt, ap) __dynamic_array(char, item, -1)
+
 #undef __bitmask
 #define __bitmask(item, nr_bits) __dynamic_array(unsigned long, item, -1)
 
diff --git a/include/trace/stages/stage4_event_fields.h b/include/trace/stages/stage4_event_fields.h
index e80cdc397a43..c3790ec7a453 100644
--- a/include/trace/stages/stage4_event_fields.h
+++ b/include/trace/stages/stage4_event_fields.h
@@ -38,6 +38,9 @@
 #undef __string_len
 #define __string_len(item, src, len) __dynamic_array(char, item, -1)
 
+#undef __vstring
+#define __vstring(item, fmt, ap) __dynamic_array(char, item, -1)
+
 #undef __bitmask
 #define __bitmask(item, nr_bits) __dynamic_array(unsigned long, item, -1)
 
diff --git a/include/trace/stages/stage5_get_offsets.h b/include/trace/stages/stage5_get_offsets.h
index 7ee5931300e6..fba4c24ed9e6 100644
--- a/include/trace/stages/stage5_get_offsets.h
+++ b/include/trace/stages/stage5_get_offsets.h
@@ -39,6 +39,10 @@
 #undef __string_len
 #define __string_len(item, src, len) __dynamic_array(char, item, (len) + 1)
 
+#undef __vstring
+#define __vstring(item, fmt, ap) __dynamic_array(char, item,		\
+		      __trace_event_vstr_len(fmt, ap))
+
 #undef __rel_dynamic_array
 #define __rel_dynamic_array(type, item, len)				\
 	__item_length = (len) * sizeof(type);				\
diff --git a/include/trace/stages/stage6_event_callback.h b/include/trace/stages/stage6_event_callback.h
index e1724f73594b..0f51f6b3ab70 100644
--- a/include/trace/stages/stage6_event_callback.h
+++ b/include/trace/stages/stage6_event_callback.h
@@ -24,6 +24,9 @@
 #undef __string_len
 #define __string_len(item, src, len) __dynamic_array(char, item, -1)
 
+#undef __vstring
+#define __vstring(item, fmt, ap) __dynamic_array(char, item, -1)
+
 #undef __assign_str
 #define __assign_str(dst, src)						\
 	strcpy(__get_str(dst), (src) ? (const char *)(src) : "(null)");
@@ -35,6 +38,10 @@
 		__get_str(dst)[len] = '\0';				\
 	} while(0)
 
+#undef __assign_vstr
+#define __assign_vstr(dst, fmt, va)					\
+	vsnprintf(__get_str(dst), TRACE_EVENT_STR_MAX, fmt, *(va))
+
 #undef __bitmask
 #define __bitmask(item, nr_bits) __dynamic_array(unsigned long, item, -1)
 
-- 
2.36.1

