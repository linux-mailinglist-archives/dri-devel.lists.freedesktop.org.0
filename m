Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA578446927
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0246ECB8;
	Fri,  5 Nov 2021 19:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD756EA93;
 Fri,  5 Nov 2021 19:27:18 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id k1so10497441ilo.7;
 Fri, 05 Nov 2021 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y1F8YnApdCMN4x/uS6JtL9yGPFccvC24U5Ww5vjLcGU=;
 b=DkG7uJ6OaX2DsHm86idVlHA+6uBaScXAJmTT91sAaBG3WyyH0uhEBS33rwVzsUUjDk
 TcTZ3AylVveNtNPXtGF5Kp+SXsAtVwTN4KATZNh1Kue/injyw+aoMQxzBac2yqdVZeoR
 py+zZVDWaY4lMTNYZefx+hy6U3G+9Ia/bsKC9+74FbOVzaGzmcPF0GCkF9hVJoCvROWA
 fpMra9tJib0lVIEGLOraRVM8kGfJ44XjzCNS5ELw6ADSfvgTO9pIAhTVr1cc63hGJks2
 pYN7/PdIFsKRPyrgmh7+KxWAOM+3/o04nRENZwVpfMcQTcY8U/Sd2G/ui9ykdx83tfoM
 FxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y1F8YnApdCMN4x/uS6JtL9yGPFccvC24U5Ww5vjLcGU=;
 b=gQ7b/c/DRvAIKy3ao9XkYIKybIAOK8LSLTe6N85Td+7Ovygk6l4dEvjM89L4tFYt9Q
 o9Fv8442cg3jNE08VLcNcfca7nDUDznO/husGv3B706LzwG6OBrGV0iALY82ecZceEPA
 QqicvryxD3KlBSIfIGSizuzHIWIm3JcFSTEvDZzcbSfUX6U62ZGe/mpCEQxozAgx+Fsl
 OkhNWXOsDYPZq7sR3WgPqYzNY2J1yCX45QukZ0Sy57KAjwzvfxTVceJdy3b+4ZvMHaWm
 XvUIHHrrp6jJs4r1Cz5NWoln7Apfsa3iV5ljJh2CXI9VZTnM3rabhaqcxUkgdWcBloKn
 7dWA==
X-Gm-Message-State: AOAM530orWS8H/1O9W0kFVLuawyNGXNTrT4JLKTTAvcM04E4wkbKmOPz
 Ewt5tJRBfGABDenFB1gErzw=
X-Google-Smtp-Source: ABdhPJwc1YYIiJUwXhkmE4+/dKMPB/Ld0YLvVJTZYjIQ3O/vjBPn1F3y3i+altRP74cPhbiUEkTNTw==
X-Received: by 2002:a05:6e02:148c:: with SMTP id
 n12mr16457301ilk.131.1636140436435; 
 Fri, 05 Nov 2021 12:27:16 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 09/10] dyndbg: create DEFINE_DYNAMIC_DEBUG_LOG|TRACE_GROUPS
Date: Fri,  5 Nov 2021 13:26:36 -0600
Message-Id: <20211105192637.2370737-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105192637.2370737-1-jim.cromie@gmail.com>
References: <20211105192637.2370737-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>
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
index d6e9c833f5d4..f55861dd76b2 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -629,8 +629,8 @@ int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
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

