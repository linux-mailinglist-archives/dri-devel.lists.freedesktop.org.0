Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268DF924A68
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6889B10E6E1;
	Tue,  2 Jul 2024 21:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aj09Ig5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE60B10E6D5;
 Tue,  2 Jul 2024 21:58:43 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7f3d884e70bso237614539f.3; 
 Tue, 02 Jul 2024 14:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957523; x=1720562323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXTp2HWUUrTrRl4eZ7svqhTsXgDwW8WuleRWg/xTtcY=;
 b=aj09Ig5zw5Tpifgg5tA+DPEqE7BQP/JmH4pbOXSpKQxwU6bw6nGSD0t2RkczCDJrgE
 qW5dBPR4qQHp/5Ugtqcb9yyfIji2xi9HDzPqAWtPDaT3ODQNfipDAyzFPIqpKg9/36tW
 e+oaeOjA4jMGfsE9nE2g4opLSX1+56AQbjUwOXbICFNFIRxLaeagU13pi2M62VrgeMVG
 2U2DsDv4PAWPEDW6APosCfglRuEizjUI8Q/E0ksMlx7XyArXJ0JELeRN8TMdTdG7Q/k9
 c4BVDUSL+0J5mzVU+EDDaJkmGxzqmhQh4ncEOBdsZfctZh1kE/p8TKgWzKKmqbj5qwFk
 1J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957523; x=1720562323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXTp2HWUUrTrRl4eZ7svqhTsXgDwW8WuleRWg/xTtcY=;
 b=li39809FfHFqDDkNU/F5F9iua/eVe4/BXtjSNpX4zS0l9uNPLvT//r9Fc1WnZ2zI6e
 7GlumHLDmkcTLMZBHegmZz445sXlcFN3kf6JU4qCoi7k9RfyZ0HCrgdRyiXU5HZdqjVn
 g55VqfEW/RXvaxhbEdb7L4RU8fQdUSHnWJp8c4rGJ90aonJCLYTLJ23RdN/bSAyN+Vx6
 KhSgdZOvbdwWLfEeGLnCVL3JpMEpLJGOpAiB1f7MlSKMg9KAzJUxXjIdRNBp7/nyQkGS
 wWO0iI8yn9NsYNfAVaGcnvs7Kv3UHVyRjqvl2y6ogbdym+JlYWo0/NFs/0JEH6GCN4/Y
 LbpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEibKjMUssellP4Vkl3kXIt0KoLN3//K0JJa9cZ079znakVi6Mf+5RNFdtekGZh+19my9qVCBwx/MmZgq7umy3ahp20UQZND9HJyiJNJXAePcP7KIxBVjudq66ElNRNiQysD5N+cTWEhfuQkJX3FjbvihehtOnTWNg3bsdou5r0taH6EyCVCrN9Cqx3S0wSE8oH7f4pJMK7RD6qUVkqBxnJ8krg0EhEfEA+noy6+hhHepjwCA=
X-Gm-Message-State: AOJu0Yxp5Lzauj5ukCVR4+p47OoNDutt41Hyk6ifh1/r/+EYsUgUR2hc
 MEiF5SJYXUCgP/tR+Y0RQE9ryf4vlKs1la3M5eEXhGgtYrYma0Yf
X-Google-Smtp-Source: AGHT+IFrIiyJSkf6W2TunW5BCKgPQouB2T+lSzdbM4fMP+xI9st2vbvsZqO7st8XPig5Y++ArDLzWQ==
X-Received: by 2002:a05:6602:355:b0:7f6:1dff:e364 with SMTP id
 ca18e2360f4ac-7f62ee02647mr1168457139f.1.1719957523053; 
 Tue, 02 Jul 2024 14:58:43 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 23/52] docs/dyndbg: explain new delimiters: comma, percent
Date: Tue,  2 Jul 2024 15:57:13 -0600
Message-ID: <20240702215804.2201271-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

Add mention of comma and percent delimiters into the respective
paragraphs describing their equivalents: space and newline.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst        | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 742eb4230c6e..7b570f29ae98 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -73,16 +73,18 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
@@ -104,7 +106,6 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
 A match specification is a keyword, which selects the attribute of
 the callsite to be compared, and a value to compare against.  Possible
 keywords are:::
@@ -128,7 +129,6 @@ keywords are:::
   ``line-range`` cannot contain space, e.g.
   "1-30" is valid range but "1 - 30" is not.
 
-
 The meanings of each keyword are:
 
 func
@@ -153,9 +153,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
+
+    Examples::
 
-	module sunrpc
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
-- 
2.45.2

