Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E00CD50D8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F54510E5D6;
	Mon, 22 Dec 2025 08:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtYmD1gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EA610E5D6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:29:29 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-7f0da2dfeaeso3830443b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766392169; x=1766996969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
 b=WtYmD1ggtgFrs0WficCbcGKzrFVMvz5IRpHD0liYFd8eLpEOTi3bfjAd9uKGW3fIkk
 bwYe/6/NdtmvvCrNjt3laILhDYWlmljx0gU9L0BkigRZ9Lb+JCecU75/VKCW7NteP3KF
 0IomGj9nd1pzT2BHwWryXZCuYNYC3DFgy+JXcRI3Q7LJ/wIml9ssEh0wBRy/M47pDUwI
 O0dT0toX18vDq+6OGJy2V1IenOrAi7eCwhl/OwUTJ58lw1dg8UzrkcGjJg8ZW9RpVzO4
 26+mOB26t0D5qdbvcI3tsBAAYC4XIZOPTHNAXurf7eBdyAtvt0dxrAbEvLyOt8zU/aYj
 ak0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766392169; x=1766996969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6JUGCGjJm2Xj6X5n/nhoMCGHMBetXjpQki6LB/h6PNI=;
 b=eXyD3i/ulsSkNK1Nv5hWmXe2g5+DGQu+jeaDe7NvYgPGZirpur4krSeu9yokWd5c70
 kxb2R7D7WoRIFB9sv8JKoa2ww8p6wBxffLkLZYvaQfdcTFXJ3GuYwlovLuIdB1lT/HaF
 JkpzU/B6qHZ1R+i7TuwURfv4CrlGyrePoFR6Fx/X6v+WVUEkch9dG7U7TArOVkFX98BG
 Hlin1lJB3ZUKl9Ou7AmQbFDGm+B9uMiCo+ZQyKuBX8Gn4Rll9ar1nAOsH1Gg0ypy4mMb
 fmRIwTPS60glA3r+v7ZeJrWt6mbnZT9C6J7DKZj49nM+czmylvnRAk59+joU2uUXX/L0
 WmTQ==
X-Gm-Message-State: AOJu0Yzt9xgSdKMm1DcNJwGSHdKcEbDOh0rnXhrLH6gJ84r6nBFyugYA
 P3QaugIudihnII0QBkHPNELXgqjzQFqKzUPmb8cBiW4/jDoiTcpd8ffX
X-Gm-Gg: AY/fxX6GfKnqrdN0wwr3TwG0gAq6GEATq9bJn7U6FmXKqO2gHU6gsbjCqlohroqTjcn
 hhap4Baui3sSuvXh5VnuB8PKi9TQWY+pzDvTVNLShPoHeVfv1D9rKaTkBXNae7DJOeaJZMdK4Kf
 VbmnBsElFh4Z5cdsIV8c9BUcNIbjL4ODYJksMVuM+jZxzktdrfyU8hf+8vlhmoeFlAWBdmrRRQK
 x8y2PNB0gDevqzz21djRU8748m0E8osOh6e76vH9WTetgoVoB8exzaR8DCpCSSeAx7xwF24PY5Y
 fp74edhgtXLgeBS9WqO36G8zYFhb7rVKLcRAmP7aA6R9ZwwuOhMYnDD3Z4o4sIX6169DV8KTN1q
 O2m/+kNfbwaCFFsL//iBF7qAm9ra9WUAcUTfry/T+Lfm2jKUn22AAaTMqElWW1iBvA5tn4uDcy/
 fAr+ACmi4H
X-Google-Smtp-Source: AGHT+IEimmJ/Dttom6F34YWsdHH3XKVu5FJm4MVosU3HZTEdHiOovrYFxoO5oyh48i40FCdqR5InOQ==
X-Received: by 2002:a05:6a00:aa82:b0:7a9:c21a:55b4 with SMTP id
 d2e1a72fcca58-7ff657a6a53mr9194464b3a.28.1766392169447; 
 Mon, 22 Dec 2025 00:29:29 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7af29dcfsm9640064b3a.17.2025.12.22.00.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:29:29 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 01/31] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Date: Mon, 22 Dec 2025 21:28:13 +1300
Message-ID: <20251222082843.1816701-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082843.1816701-1-jim.cromie@gmail.com>
References: <20251222082843.1816701-1-jim.cromie@gmail.com>
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

