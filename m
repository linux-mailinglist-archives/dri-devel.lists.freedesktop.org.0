Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16A7C7487
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1349D10E564;
	Thu, 12 Oct 2023 17:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B090E10E55F;
 Thu, 12 Oct 2023 17:22:10 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-79fe6da0095so49138939f.0; 
 Thu, 12 Oct 2023 10:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131330; x=1697736130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ae2mlXqowKD5cqGlXb7uogfjENyHP+dyQJfUAIqJaiw=;
 b=ZaQN7pngtV/aufW2QZxtjbSk0HSAvnFnBMp4mqxeJV7Sew7cnvNgsHRSF6PxQLrFk1
 gBNqr4s5txSGYQ3fbfKjLeQ3bB/MdI/x04PXgYoohHIQtTcRQudSkePtsaMkKvVDIPGK
 t6o7f8KGtaWkE7Z5PSRp4zmANKaZQQaj3EH5hcjkqXVyuUILifsARg82H2PRZQEkhmqF
 ADB9RTOuT7v3+L8/0wLzfFsGtZ/rcqTe8srNEl7Vf5N8ld9XjleztdG1T7nAcgVLMS1F
 RV8BG4Z8QvPpIhM1zMp3Sc80v04Q+DNy2m8Bh0/XfnaYqm+eefohRF3mK69g8naCtm5r
 6Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131330; x=1697736130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ae2mlXqowKD5cqGlXb7uogfjENyHP+dyQJfUAIqJaiw=;
 b=DuSDcHczFMv9ETwSUQBcFC6I6SP/46yqYzLrti/pP5T2Gi16s5GoCMzrkTdzC1NlhH
 3T+F1mXZOn8229LOBceOjdWT5WmRC3St30cK7MilTK7eRSQYAGX4ULUC3dTHcqgX4aWD
 9MnrwIdQ44MRFZVsOreJ2betlySfMqCFz2mLo3bSFplpT+D8+sNmtFbSgPxyGCcvu0R0
 uIkk5UVRWILUSvZZ9BxIGwZQPkr9fpBxTNN8GS0lvT6pH2qF67jiwtZoVnAiYZHUtvtX
 ayTXmhIKhDSZwwJ2008fSgG1ia5w7lAuYRShqRHsd2JC4EdxBBLuM9hbghRXlndbVCRX
 tCNg==
X-Gm-Message-State: AOJu0YyuI94S385uUlbmPBBvx6/gLBSexu+fsU5T3UA86aJtAK8Vaob8
 INJbK1K0US2o8/ocB9C7z7U=
X-Google-Smtp-Source: AGHT+IEFuqgv0LKLuAzb7gwKQOS1mz1rZpZC9sUTpzcOz2n4Y5NvZOzIOkx+6OOoSZfI8IPqpfsYRQ==
X-Received: by 2002:a5e:8f4d:0:b0:791:2db5:c779 with SMTP id
 x13-20020a5e8f4d000000b007912db5c779mr30620229iop.10.1697131329992; 
 Thu, 12 Oct 2023 10:22:09 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:22:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 21/25] dyndbg: refactor *dynamic_emit_prefix
Date: Thu, 12 Oct 2023 11:21:32 -0600
Message-ID: <20231012172137.3286566-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor the split of duties between outer & inner fns.

The outer fn was previously just an inline unlikely forward to inner,
which did all the work.

Now, outer handles +t and +l flags itself, and calls inner only when
_DPRINTK_FLAGS_INCL_LOOKUP is needed.

No functional change.

But it does make the results of the inner-fn more cache-friendly
(fewer entries, reused more often):

1- no spurious [TID] or <intr> noise
2- no LINE-number to bloat the cache (avg 9 pr_debugs/fn)
3- only LOOKUP stuff

Currently LOOKUPs are descriptor-field refs but could be replaced by
accessor functions.  This would allow the __dyndbg_sites section to be
de-duplicated and reclaimed; currently module, filename fields are
~90% repeated.  As the accessors get more expensive, the value of
caching part of the prefix goes up.

Also change inner-fn to return count of extra chars written to the
buffer, and drop "inline" from outer, let the compiler decide.  Maybe
also change name accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 55 ++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 17eefb35ac96..974395bf8a83 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -777,19 +777,8 @@ static int remaining(int wrote)
 	return 0;
 }
 
-static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
+static int __dynamic_emit_prefix(const struct _ddebug *desc, char *buf, int pos)
 {
-	int pos_after_tid;
-	int pos = 0;
-
-	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
-		if (in_interrupt())
-			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
-		else
-			pos += snprintf(buf + pos, remaining(pos), "[%d] ",
-					task_pid_vnr(current));
-	}
-	pos_after_tid = pos;
 	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
 		pos += snprintf(buf + pos, remaining(pos), "%s:",
 				desc->modname);
@@ -799,22 +788,38 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	if (desc->flags & _DPRINTK_FLAGS_INCL_SOURCENAME)
 		pos += snprintf(buf + pos, remaining(pos), "%s:",
 				trim_prefix(desc->filename));
-	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
-		pos += snprintf(buf + pos, remaining(pos), "%d:",
-				desc->lineno);
-	if (pos - pos_after_tid)
-		pos += snprintf(buf + pos, remaining(pos), " ");
-	if (pos >= PREFIX_SIZE)
-		buf[PREFIX_SIZE - 1] = '\0';
-
-	return buf;
+	return pos;
 }
 
-static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
+static char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
-		return __dynamic_emit_prefix(desc, buf);
-	return buf;
+        int pos_after_tid;
+        int pos = 0;
+
+        if (likely(!(desc->flags & _DPRINTK_FLAGS_INCL_ANY)))
+                return buf;
+
+        if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
+                if (in_interrupt())
+                        pos += snprintf(buf + pos, remaining(pos), "<intr> ");
+                else
+                        pos += snprintf(buf + pos, remaining(pos), "[%d] ",
+                                        task_pid_vnr(current));
+        }
+        pos_after_tid = pos;
+
+        if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_LOOKUP))
+                pos += __dynamic_emit_prefix(desc, buf, pos);
+
+        if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
+                pos += snprintf(buf + pos, remaining(pos), "%d:",
+                                desc->lineno);
+        if (pos - pos_after_tid)
+                pos += snprintf(buf + pos, remaining(pos), " ");
+        if (pos >= PREFIX_SIZE)
+                buf[PREFIX_SIZE - 1] = '\0';
+
+        return buf;
 }
 
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
-- 
2.41.0

