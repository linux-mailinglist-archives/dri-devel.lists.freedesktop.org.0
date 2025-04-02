Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC28A7942F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040DD10E8A0;
	Wed,  2 Apr 2025 17:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LYdf/z2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CED810E899;
 Wed,  2 Apr 2025 17:42:42 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8dfso533639f.2; 
 Wed, 02 Apr 2025 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615761; x=1744220561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ce6nXKcnJlQ1Sg4GeG36JJhoy7m7R7t/PayJp4ReXBg=;
 b=LYdf/z2prAwntsNrDjU7v/5e1jaxKm4G0Y3G3SxP7+dnIGpY08IZ18zcXncBTF1zwA
 A81gfoAYbGJCPcGm05SEytGHHBebYruM9PD4xD0oO83vkzOhhZX1DiPTwKvTuCMviU/I
 FHfxypOmLBGqHoy/KR1iIHynq0E/44WeSLRoZegPxEGKLd6k6wWwYu72xMEAvEPP5L7+
 TjZa+IeuDScwpiFjccDX0Y0KsOOP2PZLwDipZ7dfdg0so6WsDihHn/iJ+8L+OHsl7iLW
 ytx4C4DKNSKumeYuD/4PEdpipJKtufSJ4Rk4Vqul+og0WEoFSP37ECbnEE7JSXY2dTEz
 8bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615761; x=1744220561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ce6nXKcnJlQ1Sg4GeG36JJhoy7m7R7t/PayJp4ReXBg=;
 b=S8j/99R2804Ijw4TFh/PPVTSTauXuMYPnjjxUjbxDlQa8b+pmK9L7r6jDw/jgXE58y
 ZAr4gszgYEOxx6SP+VKashvScHBmiGSxsqlSep5bkn2DNQyCBTikhN95J5YA/UAyaqMS
 yMinOr3MrZDvSyy5wZE2AuIJon8vPuZfcUF2C4VJp3wPVqcSSHygfHuwrDuMIxuBmj4/
 0lhAjJSppGyGu/ev/SMc2Pla02hiHbSdBmL5HeNgfI0DkL4i0oMe+SG1BeFB6JVAVbtI
 ve9OavHOfjmWCA5J6qjQJIIOdqrEueN4m7APMb8ON9P/NHK0iIh+htoC4aftTaN9lX3R
 tPzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2rfXvdsgOhG/YKcGjrjAY3kJ6P4mfYFwwKmHESJLPusSNEokgESFqsXbX7+GfXZKOV7krKn08@lists.freedesktop.org,
 AJvYcCXgOSOe50D/4hKPMCjsVk3V1brxmaApv7XJX0Ri3R/aCghHLjvsUKDXgepBS/0v9nU0JSnd405YSlxeEgXeeg==@lists.freedesktop.org,
 AJvYcCXr8myHrKGcgBXbxnAdYK/MUaJHz4m4BUctVR5Pprrq2ddfvIq1QqrtBLA7ZLdFoiFdTm1dcYDcVvln@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqR5opq6JtIB/BZr7DCATJ84rDYZpZ6NFdtksfCB+lQSXxBIXf
 6CRQu63SdgVB/CeFsQaj/yEz7mozEUCABmxsRG+2VC69zRUPTyP/
X-Gm-Gg: ASbGnctsRwkV5KJQKhSlDk5fpW+eRjuhpH3Z4PcfV4l/9lc0HA3PkLTiXzKzNey4fav
 70uxGT5UfrN5/n1bMJxH7UZTQOVLZFkWPoEFDQYG16DPBILXMAJeFIQdnlCm0YSG5+/tNtWrcxD
 F8tGDcNv4uInBFbHjbNeOQzuCbSIM4Cd/jrrPOdcGlXdIRmOriyMZ0BWZMDTOEkU1YSyeYr87JR
 g8xxUj3zd+QypRXf8FEgxP95+aWr8bGLGQwKA7jx2qo8aEjenerYKPCshMkQj4r1q1XuPSUsyGn
 k+y06sWdNHFFoCYzPn0cQUEhL/YSFpviiXcQSf+hSYOU0UaIh4YYrbuF+91JuQ5wWBmZPWQbrdd
 TWA==
X-Google-Smtp-Source: AGHT+IEd82/KaIrP4v3l/hIUqHB1vbL8Yns4imdfxbgbfiFn8gRA4XnyUTSvoiXRh5lRVoS9fxcz6Q==
X-Received: by 2002:a05:6e02:1f0c:b0:3d3:f520:b7e0 with SMTP id
 e9e14a558f8ab-3d5e09094f8mr180509725ab.6.1743615761151; 
 Wed, 02 Apr 2025 10:42:41 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 27/54] dyndbg: drop "protection" of class'd pr_debugs from
 legacy queries
Date: Wed,  2 Apr 2025 11:41:29 -0600
Message-ID: <20250402174156.1246171-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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
index 7a60088a1b5c..54f462cf41b0 100644
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
2.49.0

