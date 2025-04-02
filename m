Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A014A79421
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573CA10E895;
	Wed,  2 Apr 2025 17:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aB0kE5rM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BD010E88B;
 Wed,  2 Apr 2025 17:42:37 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3ce87d31480so492435ab.2; 
 Wed, 02 Apr 2025 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615757; x=1744220557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eURkwPwKw4vTaVpJGMjl6Mz91xCr+xlab1qXSWsbeFY=;
 b=aB0kE5rM7oMRtRdCP0OCHuR3l4OmBwZKB8JXaY5ct3e1Flg15E3yHqrc+oI+tYm9ox
 I3ebkgBD/xuZRfUZ74wipdMOwiCvE48ZinjtKoYhJkExQ7aZQkqWen+7x8DedLu3rzru
 lrqNtnjn4jXXO5fYVpxtOLQpYUOi1DnqTIUcdL1EU88YfJXrvFO6GIIQJiJgvdV091Eu
 7OTmsFFRJ8haW1+oOAnqgf3povuUizAX/kRYr2vJl/rOBPfz/nTkiRsjIsAMDLIqIajx
 8TmAtzmnxiadibLoat1F0pK9PULDZvCqK0tuwplTBV0y1jJPnK5n+cmRthbAz5M0D03g
 Ffww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615757; x=1744220557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eURkwPwKw4vTaVpJGMjl6Mz91xCr+xlab1qXSWsbeFY=;
 b=fyKlKXUJeX06cI8luiWJ0+WEFmTuGocQwXnXFcSCXMkqp5l/AAe8Z18ZUcVM1tqfOS
 y1HStuzVmTrLVyyNQQkbJ/JLjpT5TBJC/0Tj8FjZAZYcIpMOgoxwqQFmZFBnD4pn2moi
 cxtYQz2WxZO98PcEBvDoRgzudl3L9wDLY/00dkya0O/bWXXhhUpHBTOUfMglpilQ2Cyu
 nXbnvcOGLPEoDg5nHiQxVKCq+fVP9mpyv8KvJjXUORXxEPK5XxbbuDbyOCn06/VUl3ap
 DYuaMWw72bSUTBCDzX1Pl1syyYYUbvSS9dnSXlUBV7rsisVneWI+uO8o3ZNitEKp8hdf
 4C1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP9+3bPHUuSjCRly265IlTo032eCgSc/abJKwnKwShp5oLKsJURLqbweiu/R5Oa7xfmJE0ZJ7It9TXoK7ZHA==@lists.freedesktop.org,
 AJvYcCVcfwi1nb3pimDs1HVRLrBglWT0R9E2k40ukXxhMmpjVQxBHH9mFwcoMgO77hM3GxN78SsWZYqrfvSV@lists.freedesktop.org,
 AJvYcCXLXf+7FCWr0OPT7lYJtRdbGmnN0mfxyCnZHVaPSfMol0wg2hfBiRA1fQORYV0pUMHqe5jdxtsa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXlqfC4v19pdUgH1cQYxF8yEaqs9AqBx8RFiU6+AOiexQECC72
 RZvzTBD7hk8sShf7cAkc+KDfN9/LfNW40pGyZxjonmJucUsg3daN
X-Gm-Gg: ASbGncsfe8n4Gdp2+FA9nhnRKRqm3lkjAu5sCiBxyWeBz44TQwHtygRkfgsIPXGyck8
 PKNAuFhX0DjZ4StZi5cxC5fMZ2cMRjYCShDlW/iKLhDynRXFJfJEJDuzOBTMZP+3b2IoTQ416iC
 qtHjwvmCMk2krIW1ry6WIjkbdPa9raXfO+0VlR7VrWzDxatZRRho5rku7XXdSAYVAe+MqWj2iF5
 IZ4y9oeC1FSRh6VPyNkFSz6C5O5Ej3TEAhDfOUxspErnke3jypJ9blRA+0cd2A0hXWS+Xg8CSzr
 W+hEI7WpvZAewKUw3eoA/8aZpEC+LcBaVHA1a21FwxK0qCsglfmHqJ8JpfTwTrLtKtGRLiJPE96
 aDQ==
X-Google-Smtp-Source: AGHT+IFOwJqxt3+Bc5BjTaI4wehPC3f7tDSqG024LF0DEkHz1iw3TJJMpnglnawcz+3wXnO3Ge6iQQ==
X-Received: by 2002:a05:6e02:c:b0:3d1:a34b:4d01 with SMTP id
 e9e14a558f8ab-3d5e09090famr201375295ab.8.1743615757146; 
 Wed, 02 Apr 2025 10:42:37 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 23/54] dyndbg: treat comma as a token separator
Date: Wed,  2 Apr 2025 11:41:25 -0600
Message-ID: <20250402174156.1246171-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

ALSO

selftests-dyndbg: add comma_terminator_tests

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
- skip comma tests if no builtins
-v3 squash in tests and doc
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 63a511f2337b..e2dbb5d9b314 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,11 +78,12 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
@@ -167,9 +168,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
 
-	module sunrpc
+    Examples::
+
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0d603caadef8..5737f1b4eba8 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -299,6 +299,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -312,8 +320,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -329,7 +337,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -601,7 +609,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392c..c7bf521f36ee 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.49.0

