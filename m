Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E1B191EF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789F510E4B9;
	Sun,  3 Aug 2025 03:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gNtw/jsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5606410E4BB;
 Sun,  3 Aug 2025 03:59:11 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3e3ff43383fso24796445ab.0; 
 Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193550; x=1754798350; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zh5DtSmdlg1q4BLyqHiCWDwX2HlPvGGP8eXC9e2gYuw=;
 b=gNtw/jsxIL6IflCAyTQ1nuF8i0co4zGhgOLTrDmfoCp4l0wBM4MZugNhaD/kjssqh/
 k4hOxjNoNb7JMdXrklkD4TsVv3XObA6CkACrXeeAZeUi7b7u3ihys/UiNBJV9j+Cqskf
 LGh8XB9SsHowPYDNvxmJeDkPAea/PO7j9Fud0Ah3vLGiFs3SsMmUI4YAKRdgQOTMt7pw
 VPzdk6vj674H75tXiyv5z1Xjh8G/qTw7TxRhSsqP1SLJd4SZanm8ZfW4sfM0bw7QHlNT
 hPmYQs7Udx9RCExLi9XfjAoeKmjkyO07BhgBLG6DkR9Ji0sVK3K6mymWZTckirTDTpJg
 m0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193550; x=1754798350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zh5DtSmdlg1q4BLyqHiCWDwX2HlPvGGP8eXC9e2gYuw=;
 b=LJjmK06yqI+7E0iEys7P6qz09FyXeCH/ohZw2J2vZK229IpmKTToN6tRonsbkCpWI7
 zULeEjjgjIqUV2uf3kptYXIfCXzi9xI9xAEppYrqY6Og9eSLCil9orEQgST1voWksiKQ
 fVUprlO1zgaDYJXX4UgSbZun+EAZbUodyxBnuE3ZmpImb1MpeFU6LHoJcYWnWftY2lqw
 dT7Uj40jzhFW0HzSlC+0J44KikFU9E+lC+j3Ny1pzBXtwbFhKNksS7TEjdKWBUp63Psf
 tithn2UlQ/LO2QcOO541YIOKMGp9Mhj43PyeVjpu8VdZDoCWVVzUWjTmK7l27xVYdnEL
 iSHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn5e4CQx1DjeYGttLwXjvLa55N1bo3yaQvMOP6d04Ycw0/c1krvxk+K85Sa+rgSRZ0o/O5Jq0fgfZ8@lists.freedesktop.org,
 AJvYcCUt3Kl1TD38pt95HbNeJ+O8q1nZygbWVYBkxMutiZyCPHIbF1vvEbTKhn0UTZ/8Gh+HuFfiAA23@lists.freedesktop.org,
 AJvYcCVAgw4p8QsnUEyTxiKHXzuwbV/W4dKpRH+nwlTnTv+PU7eiD41mXA020Io9KeifhNNsbAUTZE94pNLj2WFLgA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNFZs1nme6FCGFRPJdSyvc7BJOQIutXQ13kQFgmNaPbPKGiAW0
 GvzxHuH1x2u4I4IULYmaHf59Wi4uooCzvscQ+4QxoJK4G7VQlIBXK5vm
X-Gm-Gg: ASbGncuHdDkcsn3V7ISJysufEXYu/7VCFNtB8Yon/QenLR30eNjpvOoIdExvDwhTTbd
 pXQq8Y5kqgJNqzgS2khjuoyUfk0h8FVTX+JN/U2vysB0VUp9fvAnZmVhvnnf3QMevZ4s41iB4No
 Rn037foOK4OpZqv18vrLySWNYie5XUIyOiTdrU0xkCevvvwLamNsrIT/2XjFhI3HyC+wwkrleBS
 /GGaYmSPFSwDYh7BGahOddtj2n+YGus+8/1UO/F0FA4c8e7hx+fXcymujwB5hUDnL0Jp37fqoYN
 4D6JZBDnqMKcQRZSpSFq6zplxP58hwTeFCtS/QgNJge+VBAYpql/10n7sP6Bf4+IooFFT9zaHPn
 fJYtS+TnlOGn+a3jeN5IRe3u6548zwHNctQT3lpPViigyP9qvTgaS6jTpaoIVg99ODn9B3Oeq/W
 ehiw==
X-Google-Smtp-Source: AGHT+IGzml5f7C+H5Kt0Jq64zG4cgAy45VHUQatQ7Tr04zry1DUjTuhWBZAgrxnx7adjKMLqc/eW8Q==
X-Received: by 2002:a05:6e02:1f06:b0:3e2:9e9d:a978 with SMTP id
 e9e14a558f8ab-3e4161cef34mr112108265ab.21.1754193549778; 
 Sat, 02 Aug 2025 20:59:09 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:09 -0700 (PDT)
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
Subject: [PATCH v4 24/58] dyndbg: treat comma as a token separator
Date: Sat,  2 Aug 2025 21:57:42 -0600
Message-ID: <20250803035816.603405-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
index 63a511f2337bc..e2dbb5d9b3144 100644
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
index f7c81a9140bd2..17651a8267567 100644
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
index 465fad3f392cc..c7bf521f36ee3 100755
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
2.50.1

