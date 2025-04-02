Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D7A79426
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD2510E885;
	Wed,  2 Apr 2025 17:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gqmz/LOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D726310E897;
 Wed,  2 Apr 2025 17:42:38 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3d46ef71b6cso823455ab.3; 
 Wed, 02 Apr 2025 10:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615758; x=1744220558; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucC/m8VvNwawJ172sGBJnoV5QJtRGG6wMlODfeStmbw=;
 b=gqmz/LOpzHxy1oUVIYW1IxA8xQA7oob/4O7lgcFsnz6bTseHRpVyoIHimY1H4V+i0u
 Yodlntj7Ly+4HBOl06Z+afAzsPBEORKjXDHpyqGvSLvz76Sj5Z/XJoIYD61L0pOWwhjI
 nqscb3uL65yiMn0zptuF9obs0FCcU8ttPoTzMduVjbbbOUxxHVoBbNGs/HQhi4pLCFTR
 pnO0WuX9I7zKFiCCk2Cy7kqIEJUbUg0ty0E8qVCEpm9vPrcRDqFnEohhr/bBt6OiXQDD
 dTVPRXdEQoWa0UrMm/YAVJU1X50oD5ZZsO1hjgr/e+0l/3lZGSIm2tIAtroGG8k/p5IQ
 shZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615758; x=1744220558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucC/m8VvNwawJ172sGBJnoV5QJtRGG6wMlODfeStmbw=;
 b=h4UY101u//9FZhuEtVWiZTZSNTuTsx7ptHRR2MFYxjvhUL57qvqMXICam11GSvLt5q
 dRb36OGpfKLSsNqDy++9C/KJyRUu3GX4qek5RK8iIBchkKW9MzdhdkEyceiJwi40bhT7
 Y9J7hgYbFy41wpZMhmirl/Rf4QjxFBWhMKLaK6Q8D26dnsaQaDIZ5hUqSn+BSTaRrNRU
 /4SUFJbvmPEQry49Zq13NvwMtH8fC2z4mAs2U8ijM4CgNbtb4UYRhp4aZB/IoL/fFkUO
 DTdPbJ239+alu+aPCDJp6zWbC+FKPuTwkb2NSMav/JCEpTxBj6n5T769P8zO2Pip3W0F
 Oj1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU37lO5kv4ZSGoy0IldQs/qKz391707lhTFtZtWkklQkLa1suXjoL9010aS8rrVJgnsof/yBaS4@lists.freedesktop.org,
 AJvYcCVp6Qb401umOJ3G0z+9FK4YJaP/cS6mbEF8Y1wlB/4xrc6RRKjq9nIo5h7WgBnvesGWFvCAuzfdXkftoXRU2Q==@lists.freedesktop.org,
 AJvYcCW+iEOLMcKqNL7fm/bpKs7D0dDqQ9WpqhR6vGV8sjQGaY041HREdWzgUaHNbZToRcY9AibHIqrtX7LF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU/rP/r9gz/q0YokP9wy9ubnriQkOk40l4OZvOuSoX5yVja91F
 ZVTf+GNo/eQvSHHUR1E+eY5bkLJU3oX8pFDOfhF9y223yePHSCms
X-Gm-Gg: ASbGncsNSZqASOaeJN35UtWadoJe16pd73ClodibJSFGB2YJGNZlEBINeH3uqDtc/Ej
 axu/xqEEMLIx4bs4L3YIlCkgaL9786FOpjyyyXNaS6la8BueyI+3dVyRJyoxEDmcungXoo1itGL
 O7JUHb8cH2T74hTa/41fqHyfwFukbiNLYC7OsAZu6kcT0Ylqbf0Rr/XahnDLdDCLgiY1jjomr8v
 Kx/cROT8izy+NvTIBUCHAcyBNf5rHDPY2JMJkbGr4l2aPGgEzN1dLahm6IvwWG6wfOM1LeERFz3
 JBrhcLTc/A7O9fdD0ovQysmvfZqocTCswNZIprsTYJb3Tfa4HgvXlmK/3eNybwFf5A9KCMR764F
 iUw==
X-Google-Smtp-Source: AGHT+IF/XWq8cu039JozjszDLRHZIQvsUr2yI7oC7chl8Xer0eG1cUzokFxTUnVEktkBv7Bfp+A18w==
X-Received: by 2002:a05:6e02:1849:b0:3d0:19c6:c9e1 with SMTP id
 e9e14a558f8ab-3d6ca5f84eemr79178055ab.13.1743615758138; 
 Wed, 02 Apr 2025 10:42:38 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 24/54] dyndbg: split multi-query strings with %
Date: Wed,  2 Apr 2025 11:41:26 -0600
Message-ID: <20250402174156.1246171-25-jim.cromie@gmail.com>
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

selftests-dyndbg: test_percent_splitting

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
-v3 squash feature, test, doc together
    gate new test, which needs test-dynamic-debug.ko

test-percent-escape
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index e2dbb5d9b314..1ceadf4f28f9 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -85,10 +85,12 @@ by spaces, tabs, or commas.  So these are all equivalent::
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
   :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5737f1b4eba8..7a60088a1b5c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -605,7 +605,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee..513f6cb1db1d 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,33 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.49.0

