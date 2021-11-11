Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBB744DDAF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DE96E9C2;
	Thu, 11 Nov 2021 22:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809956E486;
 Thu, 11 Nov 2021 22:02:42 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r8so8785632iog.7;
 Thu, 11 Nov 2021 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4AHIH3+iKmiLKBkiSxRSPFDuszb5yqNv9CqYiGv6ak=;
 b=hxvFftfnE5haOpz0aJ+pW2wAk75YEg9pG+UCUIpeJhJf7kcdNqz8DsYbsAHFNHlnq6
 kX2kKmrSZPgpx6ALddAbK1VZm6ui7Mg9uwGRfx35DQNhFV/JEeuFkxQ1dTUl8pvFc6c9
 r0A8Rz4I9uX9zYnPJb6Iy6w/qy7qGrTpRbgQWm3uHl8tDaTqk19KV4k6HuEaSDppowOd
 DKLFO6SqRMA5jTQyjPZkTv+sufN1uEBSXQp4aU7uEgLWEssxj7wBy+oPrJBYsp0K4E8/
 nXYpuEMShnhnrp3rE7vuFI9fqH8UG3v9EQDa6HoqlQFKkFmpp9RSxSnpeAOG9oZVwFd2
 BOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4AHIH3+iKmiLKBkiSxRSPFDuszb5yqNv9CqYiGv6ak=;
 b=48buGRV1TAILqc94bF5TTGT3PVZuNmA5/A0A2MDoKc2RSR98i2AlAhuJxRuQY/gF5/
 suoPMbuLXjz4iOz/CBtoafVNeWo9KouUjeGxMSrVzB7hwfa3alC57457acjdHC/OcqO1
 oyMLyN49zEQ2fhXqexLyUW/XRkKc8JLEery0i1Tb5a5+FytEwamvaR0wufsshjNBrHt3
 pE3XUcpwAQkCw5tkO54N6YItFf1uGgZtQi3jg5phwX1F753fJUM8ABLBvg05oTVY8hb4
 zSCHIISEe74ZWOb/iTjpTqoE5TwYPX8hn7QUEzFGpI15B7EK30slTHN5BJLpyY4gkNQi
 y7GA==
X-Gm-Message-State: AOAM533uXD5qsSubFM+uEKGItxXUD/Qu2JdT07VK7iEncPA8lU5pkHM8
 9p4cBA7CLRSKYiTIrk8+Kug=
X-Google-Smtp-Source: ABdhPJzDXR+jNw7q5lKwg2vwWAZZ83YOfh0MsBUCIl6DvtOZuKVy9Xy3vmTeVo2FOmHrJbk16g2FCg==
X-Received: by 2002:a05:6638:150d:: with SMTP id
 b13mr7878251jat.101.1636668161626; 
 Thu, 11 Nov 2021 14:02:41 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:02:41 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
 sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 09/10] dyndbg: create DEFINE_DYNAMIC_DEBUG_LOG|TRACE_GROUPS
Date: Thu, 11 Nov 2021 15:02:05 -0700
Message-Id: <20211111220206.121610-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
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

With the recent addition of pr_debug to tracefs via +T flag, we now
want to add drm.trace; like its model: drm.debug, it maps bits to
pr_debug categories, but this one enables/disables writing to tracefs
(iff CONFIG_TRACING).

Do this by:

1. add flags to dyndbg_bitmap_param, holds "p" or "T" to work for either.

   add DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS to init .flags
   DEFINE_DYNAMIC_DEBUG_BITGRPS gets "p" for compat.
   use it from...

2. DEFINE_DYNAMIC_DEBUG_LOG_GROUPS as (1) with "p" flags - print to syslog
   DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS as (1) with "T" flags - trace to tracefs
   add kdoc to these

NOTES

The flags args (1) is a string, not just a 'p' or 'T'.  This allows
use of decorator flags ("mflt") too, in case the module author wants
to insure those decorations are in the trace & log.

The LOG|TRACE (2) macros don't use any decorator flags, (and therefore
don't toggle them), allowing users to control those themselves.

Decorator flags are shared for both LOG and TRACE consumers,
coordination between users is expected.  ATM, theres no declarative
way to preset decorator flags, but DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS
can be used to explicitly toggle them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 44 ++++++++++++++++++++++++++---------
 lib/dynamic_debug.c           |  4 ++--
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 792bcff0297e..918ac1a92358 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -255,30 +255,52 @@ struct dyndbg_bitdesc {
 
 struct dyndbg_bitmap_param {
 	unsigned long *bits;		/* ref to shared state */
+	const char *flags;
 	unsigned int maplen;
 	struct dyndbg_bitdesc *map;	/* indexed by bitpos */
 };
 
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
+
+#define DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, _flags, desc, data) \
+	MODULE_PARM_DESC(fsname, desc);					\
+	static struct dyndbg_bitmap_param ddcats_##_var =		\
+	{ .bits = &(_var), .flags = (_flags),				\
+	  .map = data, .maplen = ARRAY_SIZE(data) };			\
+	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+
+#define DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, _var, desc, data) \
+	DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, "p", desc, data)
+
 /**
- * DEFINE_DYNAMIC_DEBUG_BITGRPS() - bitmap control of pr_debugs, by format match
+ * DEFINE_DYNAMIC_DEBUG_LOG_GROUPS() - bitmap control of grouped pr_debugs --> syslog
+ *
  * @fsname: parameter basename under /sys
  * @_var:   C-identifier holding bitmap
  * @desc:   string summarizing the controls provided
  * @bitmap: C array of struct dyndbg_bitdescs
  *
- * Intended for modules with a systematic use of pr_debug prefixes in
- * the format strings, this allows modules calling pr_debugs to
- * control them in groups by matching against their formats, and map
- * them to bits 0-N of a sysfs control point.
+ * Intended for modules having pr_debugs with prefixed/categorized
+ * formats; this lets you group them by substring match, map groups to
+ * bits, and enable per group to write to syslog, via @fsname.
  */
-#define DEFINE_DYNAMIC_DEBUG_BITGRPS(fsname, _var, desc, data)	\
-	MODULE_PARM_DESC(fsname, desc);					\
-	static struct dyndbg_bitmap_param ddcats_##_var =		\
-	{ .bits = &(_var), .map = data,					\
-	  .maplen = ARRAY_SIZE(data) };				\
-	module_param_cb(fsname, &param_ops_dyndbg, &ddcats_##_var, 0644)
+#define DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(fsname, _var, desc, data)	\
+	DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, "p", desc, data)
+
+/**
+ * DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS() - bitmap control of pr_debugs --> tracefs
+ * @fsname: parameter basename under /sys
+ * @_var:   C-identifier holding bitmap
+ * @desc:   string summarizing the controls provided
+ * @bitmap: C array of struct dyndbg_bitdescs
+ *
+ * Intended for modules having pr_debugs with prefixed/categorized
+ * formats; this lets you group them by substring match, map groups to
+ * bits, and enable per group to write to tracebuf, via @fsname.
+ */
+#define DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS(fsname, _var, desc, data)	\
+	DEFINE_DYNAMIC_DEBUG_BITGRPS_FLAGS(fsname, _var, "T", desc, data)
 
 extern const struct kernel_param_ops param_ops_dyndbg;
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d493ed6658b9..f5ba07668020 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -634,8 +634,8 @@ int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
 	for (i = 0; i < p->maplen && i < BITS_PER_LONG; map++, i++) {
 		if (test_bit(i, &inbits) == test_bit(i, p->bits))
 			continue;
-		snprintf(query, FMT_QUERY_SIZE, "format '%s' %cp", map->match,
-			 test_bit(i, &inbits) ? '+' : '-');
+		snprintf(query, FMT_QUERY_SIZE, "format '%s' %c%s", map->match,
+			 test_bit(i, &inbits) ? '+' : '-', p->flags);
 
 		matches = ddebug_exec_queries(query, KP_MOD_NAME);
 
-- 
2.31.1

