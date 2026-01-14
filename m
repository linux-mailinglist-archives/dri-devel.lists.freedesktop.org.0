Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A86D1C006
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A3F10E5A2;
	Wed, 14 Jan 2026 01:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RtmP47QL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557F10E033
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:58:48 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id
 46e09a7af769-7cfcbf34124so67811a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355928; x=1768960728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
 b=RtmP47QLtr8xJ8v3wcCc0rEWMWztOuYLAJ1E7rMDG8WwwRInWkqmRoLeqleWbyeyff
 jDOv6r2B8hfrwh82Q1vYZd1flgR7HtVfyINmg9KhabrrQbAWjscxuoKXNGzXWsBPwizG
 8nlRKU6Nq+zv9578UrnmlMG5geQBJPfpC4kYgM9T5nFhrgcDjsKe6V9SW9JphNiRsYIu
 M+AWJytpc8w4syDkjS06jGNPuYLHuKb32nN73VSAiq9inGERj+IK7BMBCDpyLgSKIXlD
 zY49GieBz3SQ+kpfNocMi67KSdOukzAAiqCp2xZPrkSkjnRLE2y6pFcRfdOhlb4MQflh
 kQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355928; x=1768960728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
 b=nCqM18Dsy2i7WkkC+VfM4nhBsBh93gGtaqqLJsezApg1kwuFtN6C4P9B6TvT2fMElF
 f8YQ4+dLMhG6rZXcMMYhKz/x5BgFr/pOWMVFzhj16pZzIJ+0sBFrOdOW4cmGE6fUsJC/
 utbd3t06zELKIOaC1EhNiRkUn7xaBpRy/pJF1KEBJ0aXA0y5ys1bamlS3Wm/UYHmanml
 5cnd+Y4rXuF5Xk7uWtWwoUfVlXTAMmUL5jyy2BFmdIbLpkKqOZ/Cn3PcdX8Ee2+elxoF
 ddRmfX5Zx5chXPXlI7a+abQYShi3V9Qd6CZiFLdnFp2HxVMlJfQ7G9wcGzpen8z3fUXX
 cPBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGKAm+/36ywXEnyCTwepB2Q39ijTlIpeqr+HrgAV/+AJzATdDVoX93dSJNlV/1zd5lRZWME+CHkVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBHxe90e6jdViYHzSVmFzGLS0VZcT5h3uKoAIeKBNrn8WtV8rw
 rTCVXOYJeqU26hKIzLGoUAkN4t7BZCbs7dYkJ1sNs5/WumreihLUk2+M
X-Gm-Gg: AY/fxX4V+HftSrjt5QDOKtyCskMXDu6VHdKeHkd6h/8xnmQ1EZVBR6F//CVykH8GHLN
 Rbn1vBzNpPvrmNybdfhadcjBp7o+el3oACTPXPVene6f7yBHiD4xzHsY1hQMKUVyY763To77bLS
 U8pYAYApZTP4f6rqyaleZI+jm6Et5JrY2poybvnjzQSeYiJItrn38YIPo3u28l8bg/DCutzGi2K
 hZAykG2nJ3TRcSF5OtAYUudAx+a1dmNC/n9Rppx8UNsV9AN3p0VVmiBTCcvTlgd3GZ3lqlopNQ6
 6CJPTQK49cT4yphj2UReoqYyDSMlF2oiVnOoFzyAH6Lav2pon5sgB8JZ5qhy+LlznW9cdUM3ppf
 YCVkIczJjwLkP/OWbqSyClZ5KB9BvF5Q6G8HfndTYhLGyfuCDV9Ru3LR4oL5qtGzymvlmO0jklg
 HkJS5AYHGfw6kWY1kp4e2JE3vyR8L9sBCXG/qz
X-Received: by 2002:a9d:708f:0:b0:7c7:8280:9206 with SMTP id
 46e09a7af769-7cfcb6b1274mr339324a34.38.1768355927952; 
 Tue, 13 Jan 2026 17:58:47 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce4781c447sm16782299a34.9.2026.01.13.17.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:58:47 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 01/31] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Date: Tue, 13 Jan 2026 18:57:17 -0700
Message-ID: <20260114015815.1565725-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

ddebug_change() is a big (~100 lines) function with a nested for loop.

The outer loop walks the per-module ddebug_tables list, and does
module stuff: it filters on a query's "module FOO*" and "class BAR",
failures here skip the entire inner loop.

The inner loop (60 lines) scans a module's descriptors.  It starts
with a long block of filters on function, line, format, and the
validated "BAR" class (or the legacy/_DPRINTK_CLASS_DFLT).

These filters "continue" past pr_debugs that don't match the query
criteria, before it falls through the code below that counts matches,
then adjusts the flags and static-keys.  This is unnecessarily hard to
think about.

So move the per-descriptor filter-block into a boolean function:
ddebug_match_desc(desc), and change each "continue" to "return false".
This puts a clear interface in place, so any future changes are either
inside, outside, or across this interface.

also fix checkpatch complaints about spaces and braces.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 83 +++++++++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f2..eb5146bcfaca 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -171,6 +171,52 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
  * callsites, normally the same as number of changes.  If verbose,
  * logs the changes.  Takes ddebug_lock.
  */
+static bool ddebug_match_desc(const struct ddebug_query *query,
+			      struct _ddebug *dp,
+			      int valid_class)
+{
+	/* match site against query-class */
+	if (dp->class_id != valid_class)
+		return false;
+
+	/* match against the source filename */
+	if (query->filename &&
+	    !match_wildcard(query->filename, dp->filename) &&
+	    !match_wildcard(query->filename,
+			    kbasename(dp->filename)) &&
+	    !match_wildcard(query->filename,
+			    trim_prefix(dp->filename)))
+		return false;
+
+	/* match against the function */
+	if (query->function &&
+	    !match_wildcard(query->function, dp->function))
+		return false;
+
+	/* match against the format */
+	if (query->format) {
+		if (*query->format == '^') {
+			char *p;
+			/* anchored search. match must be at beginning */
+			p = strstr(dp->format, query->format + 1);
+			if (p != dp->format)
+				return false;
+		} else if (!strstr(dp->format, query->format)) {
+			return false;
+		}
+	}
+
+	/* match against the line number range */
+	if (query->first_lineno &&
+	    dp->lineno < query->first_lineno)
+		return false;
+	if (query->last_lineno &&
+	    dp->lineno > query->last_lineno)
+		return false;
+
+	return true;
+}
+
 static int ddebug_change(const struct ddebug_query *query,
 			 struct flag_settings *modifiers)
 {
@@ -203,42 +249,7 @@ static int ddebug_change(const struct ddebug_query *query,
 		for (i = 0; i < dt->num_ddebugs; i++) {
 			struct _ddebug *dp = &dt->ddebugs[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
-			/* match against the source filename */
-			if (query->filename &&
-			    !match_wildcard(query->filename, dp->filename) &&
-			    !match_wildcard(query->filename,
-					   kbasename(dp->filename)) &&
-			    !match_wildcard(query->filename,
-					   trim_prefix(dp->filename)))
-				continue;
-
-			/* match against the function */
-			if (query->function &&
-			    !match_wildcard(query->function, dp->function))
-				continue;
-
-			/* match against the format */
-			if (query->format) {
-				if (*query->format == '^') {
-					char *p;
-					/* anchored search. match must be at beginning */
-					p = strstr(dp->format, query->format+1);
-					if (p != dp->format)
-						continue;
-				} else if (!strstr(dp->format, query->format))
-					continue;
-			}
-
-			/* match against the line number range */
-			if (query->first_lineno &&
-			    dp->lineno < query->first_lineno)
-				continue;
-			if (query->last_lineno &&
-			    dp->lineno > query->last_lineno)
+			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
 
 			nfound++;
-- 
2.52.0

