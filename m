Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF6857BA57
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8118F462;
	Wed, 20 Jul 2022 15:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749598F458;
 Wed, 20 Jul 2022 15:33:30 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n7so14537987ioo.7;
 Wed, 20 Jul 2022 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8gGCI0m8r004HoJxLqXDC1X1/A0StWSdDwFBgrxhMVw=;
 b=pP2Ch0j9cYaoD7HNPrfmuREfrAWXaQ/J4R0E4D2FCLxzhANm3RSYZMrCA2VL0lwqZ1
 6YUt2PtWF++HKEmQiGU4jG8EXsPHNS/MZyoTrr96/Z60Tuw8iP6r+vakdLkWa2iOruFx
 eGhhveZWTc0Ij4Uih1yDjplRus4eHzl6CVxeLQopygGNbP7ItPiZMix4ipZ1oH+PGsZd
 ZQrMgFjhVOb5L12b+wX4vS1PFG8yiDKtPOWdVfxWmrrISDxdTUKwd4yxwhyviNzxtv/j
 1MYu+58fSB+/+rSHdYXCwpa9zav6gmoh+DEdfUfHJNRo1SZoB+ipyuToDUlY5g3nSbvh
 pnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8gGCI0m8r004HoJxLqXDC1X1/A0StWSdDwFBgrxhMVw=;
 b=u90hGnkCnaVaDhpHjjnKhGmvQBRE/ek+gVPVaydiRCtn+4IWk2FokVp1/hzT5wM/e4
 11pWLdzWzVN02zwO663n7QYwAXhrTQZ3wOIjtfLRgpkLLqxF143Oqo8yOxD9xdJJoDNf
 QsEnJBj1X7TfUJQmBE6VyZ1Xrx8sii55BHfb53uBeXOA5VIOhtOHCRIBaX1XBTHRCZhy
 JdgMNKzja3ySUKpK6LRMLV7edhmEsViVbT5g+fNYCbFBEyopAoiK0KL6voNxdWmNQoy2
 8ZhIY7XkG0eqzMRHHV96auXtGIvhkZZO3eZFEh3nRg42+XpyKF8oWHmuBQnkDye2AXc/
 0JEg==
X-Gm-Message-State: AJIora+Pt9NGJFCILfkpXDq7VEo11klK0Kb4XSUVBcvt19mtrFLKQAQA
 gJAMO8QHlfN3XEgVeo+vmAmQLJzoW3yeTg==
X-Google-Smtp-Source: AGRyM1sVONqIhEQFG3E677QRE/pGcJTLkuoZ3upVkJXGOH7vhJhdlmGLzNOMSl3UlnRvMRjl0NGIqw==
X-Received: by 2002:a05:6602:180c:b0:67c:296:2561 with SMTP id
 t12-20020a056602180c00b0067c02962561mr8284436ioh.173.1658331209529; 
 Wed, 20 Jul 2022 08:33:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 30/41] tracing/events: Add __vstring() and __assign_vstr()
 helper macros
Date: Wed, 20 Jul 2022 09:32:22 -0600
Message-Id: <20220720153233.144129-31-jim.cromie@gmail.com>
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
Cc: Marek Lindner <mareklindner@neomailbox.ch>,
 Antonio Quartulli <a@unstable.cc>, Eric Dumazet <edumazet@google.com>,
 Gregory Greenman <gregory.greenman@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Sven Eckelmann <sven@narfation.org>, Leon Romanovsky <leon@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Bin Liu <b-liu@ti.com>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 Simon Wunderlich <sw@simonwunderlich.de>, Peter Chen <peter.chen@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Steve's patch, carried til upstream.

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

