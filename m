Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E7C6B8CA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F6710E511;
	Tue, 18 Nov 2025 20:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BbqzJ3F+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E87510E513
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:02 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-948fbdbc79fso78737539f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497142; x=1764101942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yf7HPZBJKJHruC1KEyryViKNbg7OZO+TlBUJ1MAjLuY=;
 b=BbqzJ3F+RT70KUKrEk21aGMfbxbOFlgR9QTTQ8nVGCiuoUh9wxHS/A+enoDNblfSX6
 TKImfdMZeqVFVfRMwbAFuCVx6NIAEKP2y2/MHR+dJwYBRTxdo9wXhxHI4up6NBBQLtlD
 cFcQ+glOzgz4sgBX9J6Boa3wr+6QMRTQ0CU3EMDWaV4lS/I8ypo+49gPkWUwrzJEJ5Dr
 wnNYjKmQkmj3+wp2KTaIi31NgIPTiRB2X9xsUKUJHLmT31cNtAqc2U8Mflw3w87mLHcS
 IEwKBeQ1VDltJ4iemDljWrVxLLvwvMiw4FaKmVhC+dadIX1qgQ4wa+fw5fSy1OCJzYel
 AMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497142; x=1764101942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Yf7HPZBJKJHruC1KEyryViKNbg7OZO+TlBUJ1MAjLuY=;
 b=CeUcE0jYLIDiPMnYv1x6st0S/mwfbvC8jEBHdH0vleIdllOLDKYlAAza8LhNPnl50S
 qK4C/a4BMfFuHfaIHCCgRlmuep3eIZV0phIN5ZNDWFT2ePtkdhLQkRRdM9k341CdanP0
 /9b1TtNQly8+oPWzlGudgLv0j/nHxQhyhE4cluISoh4fmegkF/j+SMbVpqhl9xsrBVHF
 bpMh/dCV8wP0XEi93BnNyl1sND6+u7YcpiZmnkDAL0eJDVQOZByB0fbwxl9baB4FK3CR
 iG5c+unzbqz5/b05okL0+EHzbn/1SzhspvWI4m/fxZGdqWsBlbhQn2u1f+j2yRZeFnFU
 ph0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcH3eqdAdbGiZT5CV5yc53SAQ24Lg4yxZ91ONpcIykqmvIycUjjNWHoR48Nu/NMBLhOfbGw4bmpwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+2Q3qCrO0n1G1F2het1Z4pEk9ndC4/jMQqDOE0VHi9/H7FM3K
 TKbH32gNrYBewUrRp2PWNDOnsbzG9zKSin9HNYI662pP1Xn4jCN+bPwn
X-Gm-Gg: ASbGncubXog9xvNQGHWTUeHrKNWbF4BZ4xvCqCFC39C1xrFxoCF19g/De2OtodvjIn/
 dR0mSkMRnwooAcnij3scrxXz5cMIEnVUwidgIjR8oLlMQTHtTiPDcTsuBmrG0w0H5xLvma+GHA3
 68jSabOA/RCtAruzydIaU9+rkrY0hHSCOfDLjJ3/t7EfLIwliqcDFCdw+kf5YsA4y6uA82Ws4+X
 BN2c+Ifrn17MV5k/QUJHs1ytzgcmKe58D3KFHkqWQT/p4qPudYJis2ZIeNSuFo8foZHrsPcqPXq
 Wk+Kz4GgHe/xP/8Kmstk3Pqmd25v+6mIBC/E0IR6JhFic8wTSiU0xMn2QtBuXAeetli09ZzMPIY
 FD4F0b2ESNNZnSbJdaePTgV+lVDWGNZwwQyAC3dT1VU3j0Ii+XB2iZCCmXtzA/cGsn8tw59Jmzx
 8lw6kWDNlak758jegz3WObhO88aMFh7wdr8eplpeSueE2aQy0aFxHjPceZ8mCtsdQanw8=
X-Google-Smtp-Source: AGHT+IFyy6Jrx9tl9L5mqbYqFHfaDNvQOzCPxl+EKL0q8oHuHQE3Af4yD/v7Nfkkp9FTpOmIpMo3lg==
X-Received: by 2002:a05:6602:1344:b0:945:a27d:d4a6 with SMTP id
 ca18e2360f4ac-948e0d640d6mr1903420639f.12.1763497141733; 
 Tue, 18 Nov 2025 12:19:01 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:01 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 01/31] dyndbg: factor ddebug_match_desc out from
 ddebug_change
Date: Tue, 18 Nov 2025 13:18:11 -0700
Message-ID: <20251118201842.1447666-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
2.51.1

