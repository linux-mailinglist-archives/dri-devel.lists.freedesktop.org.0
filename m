Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E213EC6B90F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3566C10E526;
	Tue, 18 Nov 2025 20:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VWgAU3xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9A310E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:30 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-9491571438cso95885439f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497170; x=1764101970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDmLAh6L3qfE5I3PPkJH8Cxtstet5049GvOKQ6v63l0=;
 b=VWgAU3xg14VpJgwUhT+eqUa6RVtqxOzLhNzNOKMYBsGTIDB0f69uVPGa+RvWyecd52
 CjKMVZRC6JWT/ICbZmdtW9L8ozSsOfbAijxsyf/B1kcaHx5Jt8+7zF7Sr4WfgPrB5hQ6
 2QcY7dCgMN/Hs775OoquabCvtySUfNEefxIywU5q6Dr9bA1Uj9a7T1uhDjUai1Zqu8/t
 8OH8uRD3Rx2cS/Y8ZVWrrS3wbQ+PZRaXg6GeXG7VchACoegxrttYFl0sZe8jAww/9M1f
 UNQlj4spiRqVB6GDuJm4ZEzInZEJt/BBCjthOXYR89/9w7AjE97fZMWl+K1j0+6OPfqa
 89fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497170; x=1764101970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iDmLAh6L3qfE5I3PPkJH8Cxtstet5049GvOKQ6v63l0=;
 b=aUlIe8zqOpFTLxAz9sZaiZD8DtO2YwQEdctqNURrkRnwkcWcv9E6m751e4wFazMwtA
 F+gY8KxiQA+ME+iZJPzQyKcuWZ5yZ2k0vrFpMu3L5XaHQUmW2355zT0N2Ne4hYDsnQPM
 JTosmH7hvlEcV3mtL3ljDIQQdA0keJLsrpYp7Bd/0lFwUD+DlR/1Y0ImQnjdb94UTie0
 7tMfiLsYbSRDB3NK1yGYb8GNblJgQMyB+Q1kki3dwBNdTTBRL2UX4LYEJs2/clwU8ux5
 wQI+8RDn7R8S3AkKVYjM3tg4dCh1DE7AY356kNvrOFXGgQYmlhhMDmU7kf5HLu1HJ07Y
 4m5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoqW7wWwvY9MLd8HQnfaasNoMuDdw/BoQIozYITpBs6o29YRhaF112BwqvCDTSYgfaHnGjHm7ie2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj/Y1+TVprDpzb1Y43xpCBcnlyS4GA7GO5x1o+V/YBXE5Q5YiE
 EK0uhuRUbDHu6sa3KzLCY2H9gCc+RwjeOSwiQKdAmeaFZzX02a2Rbfs0
X-Gm-Gg: ASbGnct6jbmk9rRqych9Cvnf6Y6I0hFzX/KHBIayYcDAaDKOQCkbTut6zP0MlIFp4j5
 +w3eNt/Ty6X1UlL3MibMmj+TbDMkg0+z0DBZOMkiaVZFEEs9HFcP631wyGiYAJY9WLLBK8Jr2H4
 4TZu8oPYp0RRGh0v0JbOpGJbp0JzyPq4QDJ//KUjLdPs73KiTgArEQEc71QQHodyKsIYDV7nAY7
 K7pqwj+PCTxvA9neU0duKsQlyLGuM+t0HGlR6rJMeUAdeD8LKGGkMOCmgK8wC62attb30S8tGih
 uoiTNrJoO3cZujjFnZQnuK4LKafagiOH4O9tGG5hpzLGUJH3n7PEylI3yZ/Ir2jAKwgySNZoF+8
 uijKqEanJFB5gt+jwTNHARPPnve/3k9nu7ZVdBrJR6dNihCtW7vWBmEkvPkw18kyYynfe+hoUXW
 kfHOErdyoLfjkVO3F21356Ex92pIniQlDJA1JigtyUkbJR1Z1gzG18DD7OJBdsxbCCxQ2DkAV96
 lK9ki9aVUXqsSc/
X-Google-Smtp-Source: AGHT+IGHKbB65vavYEMOS/NJ+GV6ZutSZ5VWZuxeJuxtFXQ0Q7SAMBMx+6kusKwl8ZMfFS2eoq8GoA==
X-Received: by 2002:a02:c004:0:b0:5b7:c784:53a5 with SMTP id
 8926c6da1cb9f-5b7c9a3e6f2mr10102281173.0.1763497170093; 
 Tue, 18 Nov 2025 12:19:30 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:29 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 26/31] dyndbg: treat comma as a token separator
Date: Tue, 18 Nov 2025 13:18:36 -0700
Message-ID: <20251118201842.1447666-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
index 69a87eb13262..c34de431305d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -320,6 +320,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
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
@@ -333,8 +341,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -350,7 +358,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -622,7 +630,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
2.51.1

