Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495AB191F5
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1F010E4B3;
	Sun,  3 Aug 2025 03:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LgmAi9ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE3B10E4B0;
 Sun,  3 Aug 2025 03:59:15 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-87999c368e9so203763139f.0; 
 Sat, 02 Aug 2025 20:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193554; x=1754798354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5JChZIjAU7+USVRGiGiVr4WOFlmx1AN0tqDn5UCQfXA=;
 b=LgmAi9ml+HjpwfMmpQ94DXMPWt59fv0dher4F/keXFBKtseEhyDpjtoKiHLzfcTSW9
 gi6f0Qz0VOriBftTlrwy5IvBnZUj659moEXrwcC93BFSSv86tCZJnJHR6u9aYTrRe2t3
 Ts/ovLO6gNfhEgBqu3uGVQzWpqpQ+WiALXyZhPGDBNKmSbI+w8PcxDr/87Q7DDlvPDIc
 ytGkPA5YDMtu2jrbtzqK7T+jVtKYjGuGR8jlNuZ5KZboSRjn9YBwG+9Q3E6+iRUZR24t
 e06ZtnCyXHQVY9TWyNDsHaEgnMIENTdgbMG0gt5reLD76MTNKeYjQL9JNU6P4NYqesst
 PnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193554; x=1754798354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5JChZIjAU7+USVRGiGiVr4WOFlmx1AN0tqDn5UCQfXA=;
 b=UCbqCffG4hYzlU7Z4d5baIzIkTuAUc3w/sw4BI5+1nh1OGLHcQ278nzuZXAijRqPWA
 nIghgw94gLiaM1e9PpQrLBlEs2p2ZdWMG5x++NzvRmtaj1nnsaxVh6D8v0WM3yRXHksA
 4oRhI+pY8ZRPiTuqMORUqDEyn6mc1WzhShYCSwXUELcGWJsMBanGAOIJOwuT1WC2bezz
 oeWJQV7c6hI/FOC7tUABR2iOQs1ffJWi7HnevslS/LT2QByHR28tk/LjUCVtX2rLRoSE
 g4HuOh/ej2atXaMyC9eGgDoiQLf17Xw1R5AC9Z38EnyP/9fQ2Gnyy6YlJPI+Or2h21dK
 9eVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs/pZ2s4D/QFDNPu6StrzdqAFvJ+kItrny5kg5WO9SE3PSuEGEJDILPTCo8Bo9ecu5ZJ6RPLe+8PLj@lists.freedesktop.org,
 AJvYcCW7o7ab+pXImF5h9J0ApZfenppGS5BITnwpgI+opR9vlLtenROVsEENkbuJLmPXJQfABQVz8GCgDTYoNEuGqQ==@lists.freedesktop.org,
 AJvYcCXOFhLjPPZr10ieA6OsBy463gYRc5Zx41T4zT3AI9RmM6cZbyg8zfaor0mc7uXwRBmE//XcGyCH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgXEidM2yvkenumjwnuj+Ei21DEKIlf66TqtGDumgCeQLizfKg
 ximOL/hnPhbaiYVRajlkqRcp9OvtSzM+s/OguJ9IXYpqV95HjMoonfUU
X-Gm-Gg: ASbGncsw8BrgLhWrz3hJt7TMyIWgCXeMkmbibg6P6PyRo7c0udklsTsC0xlZ5Aw2TtU
 6hTeN6RN1j3Y0i2FKoks+/4QEbBex1GEQk+/hxV3tLNyDMnnQLUEpm4SgRBXl52MupbdqFeJfwk
 1DCyHwKzWTYbopwhGqFaXNoNIBoXn0Q3UuvTzEGqwvVExdVA67CX32AqL4081AwWVh+NLfLsM4+
 MdyONH9bu7kvV+l50sFjo2n8+O28SgqkBQM4JpNNx5CZ5edcLbsr2Jqyvl1T2lnd5+4Ac95kDwE
 zjzWyvfU1aN4KLloG/JtCj9hGw+Cvmbcz7vtG2SzKXnl33yUknED9Moy7vzp0NBTRFUzR1V+BTy
 hYJA9nTWJjvbuyM8d4bx1MMyAnrNR6scKXElSLcSd5n7DOetp9ACF3CJBph9wiMNh2VdA5Uixd3
 7ldw==
X-Google-Smtp-Source: AGHT+IEXs1RKwGF33rL3y1Nq7WtmCCzyqjf3/JqP1fnRxFHeHfpiw5ELqGV5x4Tl+RUFiy+AkiHSIg==
X-Received: by 2002:a05:6602:6206:b0:881:7474:1b78 with SMTP id
 ca18e2360f4ac-88174741e8dmr448868439f.8.1754193554242; 
 Sat, 02 Aug 2025 20:59:14 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:13 -0700 (PDT)
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
Subject: [PATCH v4 27/58] dyndbg: drop "protection" of class'd pr_debugs from
 legacy queries
Date: Sat,  2 Aug 2025 21:57:45 -0600
Message-ID: <20250803035816.603405-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

  # or do it the (old school) subsystem way
  echo 1 > /sys/module/drm/parameters/debug

This "name the class to change it" behavior gave a modicum of
protection to classmap users (ie DRM) so their debug settings aren't
trivially and unintentionally altered underneath them.

And by "symmetry", if they're not picked by "class FOO", then they're
excluded from adjustment.  This allowed all previously conceived
queries to work the way they always had; ie select the same set of
pr_debugs, despite the inclusion of whole new classes of pr_debugs.

That had 2 downsides:

1. "name the class to change it" means that every class must be
individually modified, quickly becoming long-winded and tedious to
adjust all the classes in a map via >control.

2. It made the class keyword special in some sense; the other keywords
skip only on explicit mismatch, otherwise the code falls thru to
adjust the pr-debug site.

So this patch reverts to the traditional view, it drops protection of
classes from default/legacy queries.

But it also refactors the skip/continue choice to allow the module
defining the classmap to protect its classes from unintended
alterations by legacy/class-less queries.

Next:

Author choice: use of DYNAMIC_DEBUG_CLASSMAP_PARAM() means they want
the drm.debug style control point.  We should presume they want it to
reflect whats set underneath, with only "class FOO" qualified queries
changing the callsites beneath.

CC: jbaron@akamai.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
--
v3- s/slctd_/selected_/
    pitch the PARAM control of protection.
---
 lib/dynamic_debug.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 73076709d169e..548a82a178d49 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -197,6 +197,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
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
@@ -211,7 +222,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct _ddebug_class_map *map = NULL;
-	int valid_class;
+	int selected_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -224,21 +235,25 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 
 		if (query->class_string) {
 			map = ddebug_find_valid_class(&dt->info, query->class_string,
-						      &valid_class);
+						      &selected_class);
 			if (!map)
 				continue;
 		} else {
-			/* constrain query, do not touch class'd callsites */
-			valid_class = _DPRINTK_CLASS_DFLT;
+			selected_class = _DPRINTK_CLASS_DFLT;
 		}
 
 		for (i = 0; i < dt->info.descs.len; i++) {
 			struct _ddebug *dp = &dt->info.descs.start[i];
 
-			/* match site against query-class */
-			if (dp->class_id != valid_class)
-				continue;
-
+			if (dp->class_id != selected_class) {
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
2.50.1

