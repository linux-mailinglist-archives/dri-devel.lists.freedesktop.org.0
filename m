Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55DA1C17B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2742710E29E;
	Sat, 25 Jan 2025 06:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d+P0iE86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6C610E2F1;
 Sat, 25 Jan 2025 06:47:18 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so206428539f.0; 
 Fri, 24 Jan 2025 22:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787638; x=1738392438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4odqpWJj3urSpAKp7yVqXYnx87D5Dkk2hzn6/0RI0nQ=;
 b=d+P0iE86jX/MXKgaTmVGH7jltOOUbX15JQdWljpDI4EyIBwU+HbsaUpLhlTHJl5N2D
 guYW45RnLscoseqitcSroq2IYRxViKhZX+y98qliJCPQAGQzTpV46Zrmm6a0MUeGwuv0
 Jp8KCGHHZIJcRkGE3BjiMRoGO4falZ5RPxUMxXwJlnZ8hSN/nurMZilgvJEFXWK4pWC9
 eA2fVFwCO9obg5eK2FnNOTU2EJnTopn36CiR+t7pWnz/lgsJDEqKRyouwZWanXaNxS2Q
 5E+nvz5OCzMMTj//pxYQmvJahQ7ZyovlVDNYvF7MOhyLtEBfRBnXKL4BKgYhIWwYf55U
 PrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787638; x=1738392438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4odqpWJj3urSpAKp7yVqXYnx87D5Dkk2hzn6/0RI0nQ=;
 b=h0ub0cOPRuq8IC3feS/elNLFQoB08/G7Q31O+KwxlTuGNhq1dy8MSBpmY+Xmsmt751
 lxOFq2fJkD/6r3iJ53H6twnhM0tRGniYiQdI3C3SGtyclwBw1FrHL4Q5KE5JeME7SZhO
 H++Gux5VrIT0DjhRBO3wdF7m7ljadXxEHnWOg4RaJOU0+IOdQboubzJCArXBpsiUyzDx
 utwELN+hDlOuHfXJzaUNCCAZZdPC7JyNY3zcPZ71JwJOyp3yir4ulx+hHJI1LF8TxWS3
 ohE9jdMg6QAbM1A66wXNN4AgtIqEERLcPAhTkeMDwM/dxUZszmL2pvKLVsrMsdgFc+cu
 XifQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUozYHnjJocZxh8gqWDAo5QVOiky2D+9j+GY92JSPZevwKBTQanYxpIyUEpLZ4THasuuo5cF/+GP6Tjt+OfmA==@lists.freedesktop.org,
 AJvYcCVE/NyXt7xXHDJYT0X/jfwVPSduJf/0hhEWEkBuheM7fgA69qc7G/C6LSXeE5J0aGeYgxwTHKrT@lists.freedesktop.org,
 AJvYcCVEdiJDCUnyjcaw8/hOwcJ54/fg6k5RklH4pObRWVFNSvBD7xk06fbS2W/RP05hIO1GWyaZb/gNR5q1@lists.freedesktop.org,
 AJvYcCWC3wGc9OtCOMBfaEy2D9RMUiLqc7/2aNtE5tbKwD+5qTYlvVttw+QmV1CwjxAuXLkOox+yPCNh50E3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnZEzpCw1CYbx5w1dfL3vndbH1tdbX85qhowiWPR1uAJetAOy8
 az9oBsT7krVTP82F2dOGrULnfmFRxWgGbx8IXoW+kaV17Xaeit80
X-Gm-Gg: ASbGncudOmVFmghDJum4MXlmsejm3BJAUWCpeNsvTydrkxz/VLQ8j5+JpktMaPqCtob
 ZAxUwu3yJF777iPc9EQg1fvd7hk6MBVQMn0tfg5shOc/i8LRvWux45ZsJV41cQmgUAt4oBCuZfq
 F4MBHsaj8wJ+wHH07a3VeyKR1hWgnnCG1FyXxI4WGABE1OyD10UARBI/qUYNzMHk+i2KhD5KhgI
 vEi2ZoMv9hwBaUT0t6n05ZG+AvnPU9WxmKCN27/DYJNZ5jehpS4cTDrN/qT9NG2ZrIfaW9/Ia4q
 cUyD4FbeiOPqNDhDiMzB3MuetQfVFAfW6M8kog==
X-Google-Smtp-Source: AGHT+IFIY03EaHMd/D6gQtTi8TOeZoophYBCZcpKsV2aOF16dKNLKKSpMulBpaJn1LdTAQ/2EmMthA==
X-Received: by 2002:a05:6602:6c06:b0:849:a2bb:ffde with SMTP id
 ca18e2360f4ac-851b61f90fdmr3893348239f.4.1737787638040; 
 Fri, 24 Jan 2025 22:47:18 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:17 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 38/63] dyndbg: drop "protection" of class'd pr_debugs from
 legacy queries
Date: Fri, 24 Jan 2025 23:45:52 -0700
Message-ID: <20250125064619.8305-39-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Current classmap code protects class'd pr_debugs from unintended
changes by "legacy" unclassed queries:

  # this doesn't disable all of DRM_UT_* categories
  echo "-p" > /proc/dynamic_debug/control

  # name the class to change it - protective but tedious
  echo "class DRM_UT_CORE +p" > /proc/dynamic_debug/control

  # or do it the subsystem way
  echo 1 > /sys/module/drm/parameters/debug

This "name the class to change it" behavior gave a modicum of
protection to classmap users (ie DRM) so their debug settings aren't
trivially and unintentionally altered underneath them.  Afterall,
__drm_debug is authoritative w/o dyndbg under it.

But this made the class keyword special in some sense; the other
keywords follow the rule: no "keyword value" given means no skipping
on that criterion.

Jason Baron didn't like this special case when I 1st proposed it;
I argued 2 points:
- "protection gives stable-debug, improving utility"
- "class _DFLT" assumed in query is not that special

I thought I'd convinced him back then, (and the patchset got merged),
but he noted it again when he reviewed this series.  So this commit
undoes the special case, indirectly.

The difference in behavior comes down to a choice on how to handle
class-mismatches; ddebug_client_module_protects_classes() names this
choice (and defines it false).  On class-mismatches of this kind, it
is "called" before skipping the legacy cmd on a class'd site.

So this makes it a policy-choice, and reverts to original policy.

Later, if any user/module wants to protect its classes, we could add a
flag to ddebug_table, a means to set it from CLASSMAP_DEFINE, and
check it when applying a classless query/cmd.  Further, runtime mods
to the protection are possible via an exported fn, or a grammar
addition to >control.

NOTES

In ddebug_change(), the 2-part class code is mostly unchanged:

1. query->class_str is validated once per module, and maps good ones
to valid_class, now renamed to slctd_class to convey non-boolean-ness.

2. in the inner per-site loop, site mismatches are now 2 sub-cases:

a. a class_str given explicitly, and site doesn't match it.
   skip/continue.
b. no class_str given, _CLASS_DFLT is inferred
   skip if ddebug_client_module_protects_classes()
   else fall thru to site-change

CC: jbaron@akamai.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 68b5a77c2d79..9a278c7ca365 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -193,6 +193,17 @@ static int ddebug_find_valid_class(struct ddebug_table const *dt, const char *cl
 	return -ENOENT;
 }
 
+/*
+ * classmaps-v1 protected classes from changes by legacy commands
+ * (those selecting _DPRINTK_CLASS_DFLT by omission), v2 undoes that
+ * special treatment.  State so explicitly.  Later we could give
+ * modules the choice to protect their classes or to keep v2 behavior.
+ */
+static inline bool ddebug_client_module_protects_classes(const struct ddebug_table *dt)
+{
+	return false;
+}
+
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -206,7 +217,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	unsigned int newflags;
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
-	int valid_class;
+	int slctd_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -218,21 +229,26 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 			continue;
 
 		if (query->class_string) {
-			valid_class = ddebug_find_valid_class(dt, query->class_string);
-			if (valid_class < 0)
+			slctd_class = ddebug_find_valid_class(dt, query->class_string);
+			if (slctd_class < 0)
+				/* skip/reject classes unknown by module */
 				continue;
 		} else {
-			/* constrain query, do not touch class'd callsites */
-			valid_class = _DPRINTK_CLASS_DFLT;
+			slctd_class = _DPRINTK_CLASS_DFLT;
 		}
 
 		for (i = 0; i < dt->info.descs.len; i++) {
 			struct _ddebug *dp = &dt->info.descs.start[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
+			if (dp->class_id != slctd_class) {
+				if (query->class_string)
+					/* site.class != given class */
+					continue;
+				/* legacy query, class'd site */
+				else if (ddebug_client_module_protects_classes(dt))
+					continue;
+				/* allow change on class'd pr_debug */
+			}
 			/* match against the source filename */
 			if (query->filename &&
 			    !match_wildcard(query->filename, dp->filename) &&
-- 
2.48.1

