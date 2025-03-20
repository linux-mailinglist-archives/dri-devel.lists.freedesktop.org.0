Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09755A6ADA6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155110E6B6;
	Thu, 20 Mar 2025 18:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gV46RaXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632F210E687;
 Thu, 20 Mar 2025 18:53:38 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-85b3f92c866so15956439f.3; 
 Thu, 20 Mar 2025 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496817; x=1743101617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HpbhRZZt9AFd87SNc1x+tRriKokTIY/B2ItoxXJziSE=;
 b=gV46RaXSNIo9kz7kQeC25upgSrBydJmn/hxmgAKyLbrcLokXEygNxWTjkUo/EB7ihX
 nreDNVkiIVBPy8S0/w+Xa7avZ8/S7xen4G3I5dYxIwcYWNLAbdq/k26DlIG2NxmNWq+y
 J9yCeWz5a6xb4RgdFzJoiW8NAcnbhauvKOxJ50/rdUXLStXV1KStO55VRDxYSYnG+jZo
 cLwauand2+MO1/p+3A157mJ3HTCTynGfqguY0LdQDX6HYjh2b2xn3LnWNK1AKGwQqyu1
 KdqBx955e38gu7+7rJKBHmMEeyR6dpr3fUmOky/Dm0TOVEI72cVByf90ZMHvT3cuTkIt
 9yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496817; x=1743101617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HpbhRZZt9AFd87SNc1x+tRriKokTIY/B2ItoxXJziSE=;
 b=azkvelthhxfj5dMtpZ6qkDECxVGVQfVcJuMaGC98zsbnKP1EZNhed/nSnspaxaEPVF
 A13w1+KPpuNHYTjlmtZLPi1ubiL7fJWDaFS3ibhPSwlmYEJne8gM8s5UB5jUZXl95m4X
 iQVHuFdNZT/JeL+IW6+Df6ldLoVqfCYblOAB1O8Re8QEFff36Z/N8QhuBJFyqXsdKVyH
 v6URhpald+KD1J/5STkvPoJP/ji2DIBeGSDDtKQijc05fM084OC9foxMlBfxbZW92Hzw
 WWstc6Gf9mjlaWVDkuNvXvmDxCumtnlKZDrVIiT1tESe5fyBkhxv3RqT+QKXQGhNYh1o
 30ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCviAI6eS4/lo7dxIkTwnikascxbMRpIgQJ27YqC/M8IgPVLdAr8Xv55io3H3ofEdasqAfDwfj@lists.freedesktop.org,
 AJvYcCUc2KHUnZmVW22XBaLVv47tTGKk45S/mHNiwsD9kpdw3z0XcpGcq7O32vJp/zbq21Oetp3BR+fygpU0@lists.freedesktop.org,
 AJvYcCViu9JklVl4qp2J3WLk1meOkoWmDdAF0iCoWQzum4DAEXHlBoiQ9gdlViKuL47NY0d+OP85UJ/lJd3KfyHSl83B9A==@lists.freedesktop.org,
 AJvYcCVoDcxLqJTWbuK1kqVWyX/B4l4py618zsN2cz3u9M6u2tOPuXILzy8108aCTSBxg7xV/dsF52Vt3znS@lists.freedesktop.org,
 AJvYcCWibK9qR0X/+XEFSz5cSC/rdAWna4xJfZ8QiaMY6zk7SAP6+JUEIY9W8eGNYB8bnkmI/259U9jmWE6oN0boLQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrRDg7U/laEl3NUG66FHssQjaxfWFjRgEEOjPRqreEEybxdsua
 KwhFI0ndzAcduS1yMMdjF7TYwqYx52tLBWttplvul4j+q0M4RWeD
X-Gm-Gg: ASbGncv6/df9NZzCD479FiOyz5ITabfZ7e5TOwfpYTaodjKkrSiWrhag7HBJ++k21Tx
 qcuDBuvdR/wjOXjT/OjFlgTn9ly/FWtr2Ly6y9LlDAMlumCMnHjCuIQkr2OdZnPGvOz10mJnPOy
 FebjS7bM6RvlHZU0Yvhqfwxlh0+0oLr6XBCNzxVr9RRJdIJonV59OiuaHx3vTlc3Ded33Zfbwp6
 EQoAEn/oftFnxuW609JuA1TLAv+KNLB7fb59immspEWFZh8JQ9IObd2ESrnH2BMp2pFHsJs8G7E
 jFBsuJ/AoANgQMi1co34tVBlrsZMa3ffz/ojIGprkGNdqjsEmJ/zeB+4KGYDCyavbV0TByIOfBo
 z4Q==
X-Google-Smtp-Source: AGHT+IFuMQEbeQUc6coivxGrnHYjElXfmW7jKz6VfBVmZjpWHuswcV+q2LjK12WbmEyPhHwatFPU1g==
X-Received: by 2002:a05:6602:c8b:b0:85b:4ad2:16ef with SMTP id
 ca18e2360f4ac-85e2cb0e8d8mr39024439f.9.1742496817484; 
 Thu, 20 Mar 2025 11:53:37 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 30/59] dyndbg: drop "protection" of class'd pr_debugs from
 legacy queries
Date: Thu, 20 Mar 2025 12:52:08 -0600
Message-ID: <20250320185238.447458-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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
trivially and unintentionally altered underneath them.

But this made the class keyword special in some sense; the other
keywords skip only on explicit mismatch, otherwize the code falls thru
to adjust the pr-debug site.

So Jason Baron didn't like this special case when I 1st proposed it;
I argued 2 points:
- "protection gives stable-debug, improving utility"
- __drm_debug is authoritative w/o dyndbg under it.

I thought I'd convinced him back then, (and the patchset got merged),
but he noted it again when he reviewed this series.  So this commit
names the "special case": ddebug_client_module_protects_classes(), and
reverts it to Jason's preference.

If a class mismatch is seen, code distinguishes whether the class was
explicitly given (and always skips/continue), or the DFLT was assumed
because no class was given.  Here we test
ddebug_client_module_protects_classes(), skip if so.

Later, if any user/module wants to protect its classes, we could add a
flag to ddebug_table, a means to set it from CLASSMAP_DEFINE, and
check it when applying a classless query/cmd.

CC: jbaron@akamai.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c44502787c2b..13de0dd3a4ad 100644
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
2.49.0

