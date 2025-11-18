Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C64C6B912
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8750810E527;
	Tue, 18 Nov 2025 20:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sl16xfdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BD410E528
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:32 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-9491604d00fso77643739f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497171; x=1764101971; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSs3Y1qOAJs6RAkTlU1X0YsQPOXWFdsurW/bzJWGvXI=;
 b=Sl16xfdl41L5nm0caTfekcICRmgTcNJnlolhyf5SFZq84lq5kV2SNJ8SWkmyLx+TEq
 S2zbo0OEoitisJnEwkd5Y72T15kao9f7ACen2uF9HCh47JQUdFXRv2dXwZLPMqmwmdEK
 Qz2JHuaei5s40O+OnmmS6VeNDEQsxpYYxMtd66PsMCQuQEtdVegD7m/pX8bAX9yGt5oC
 s0EKzeEL/odbZfWxUa3ikfu/4Ve+voUuFhrZeAYhsvKPlPKoF63KdGMKdNqZDKGmReq1
 l/V1zeInJQcBYtYn8W/0tuFJhZepsuo3IjsERoRFxPCcSA3eJLGCGWI2FcxInBs59+qE
 VmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497171; x=1764101971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pSs3Y1qOAJs6RAkTlU1X0YsQPOXWFdsurW/bzJWGvXI=;
 b=Slemlv9oedHs3tKXDPxef0Gg7aC/o8rYiJVJ1jyRYuvhVGkG+4LJcBky42WazGS9hu
 DrN7oyJbU6I8inzPqiFUy0zEprgU8L7jJONB2Cq/WzqWS7KSSWL9ALm8Q++7Z2maUxM2
 nSWfFgan5xxMWv9rGUPhWxnNzpAARM96fbj13UIB5dvVoQdotSmO2wAoG5c4kHoE8nMe
 ZWlLr24dPf1xbBeDadUijPIQBydd8Vc8DR+1WYB5W9wbO3VFRNh75X5W1EzBjcX2jQPg
 YnKq59X8tsAGOYDdbTCfvAnZtFi7eCXw7jrCn9rU7T1PRmHsK6HldziyDBLbXMiAnJpw
 ru3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5MZObGL179R25RjoVKEws3+KTzXi5IzcIMXoSgOCkG3t8cSBG+7ahtfmv0ufcGKfVDb0c8wWocIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4XflptSlc0VfSEXvC10Ldy7zT2wQ4EIH1+1HpPfCDSQ3ZuNa3
 4jx+cE6J1NJnWh9FIFatmZnQq25gtoYZ21Rg9OVsCFpv5I4zs1GQUPCj
X-Gm-Gg: ASbGncuIg9sLweYc+pMIn77f+GM42GmnOrjAcAIZQfkbbAvPY9/ZOHoj1SOppwzNtqB
 8WLbxHajv6RZtZhdfcNwtJDp6tqvuELDY2fPx0KhNP+oucwLVyZiO6uuemUyjsUVrjMOJ8icqL3
 G78CStgEa+m9V0kfHEHSArpT/PWJSmRdBGxT6Qy55BrmSXCETDduSBIZwGICCA2gcWjh2sUSgTY
 v4wv63YEbKF1zjtiAazT0R2ZsiZsQmEYr8qnfXcjb2YMwDpPo7VCzCWcQABt3J65Ic4M+ml5rh+
 hamA5E02OoLvg/0S+dMWZMopI370ba3XqoKszNveDo0Wr/aNrcKOwJ4slccLF2Tu160gt+w1WUW
 tsOwl9VgCHLeGVYxYZJDdQAdvZnfp+6A+hNfqOS6NCBU87cO61DX0I02K2PoRSr2K0SfKfChYtS
 31gTOyYnSFAsaEq/jSINgbeThU2tV6hvgvXjA+h6vtVkGGpI6z8zxVBeZdkDB0rvAalEv6nR/yW
 rgrYxgqzJDHyVna
X-Google-Smtp-Source: AGHT+IF/109dS81O6NLrPpISZ9YNF9oRBx0yDRnxWROCoBNih0q1Ou0KcWqNxbpWmEkDq5q5rScEtQ==
X-Received: by 2002:a05:6638:c114:b0:5b7:bf63:9c2b with SMTP id
 8926c6da1cb9f-5b7c9d5acefmr15014841173.12.1763497171298; 
 Tue, 18 Nov 2025 12:19:31 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:30 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 27/31] dyndbg: split multi-query strings with %
Date: Tue, 18 Nov 2025 13:18:37 -0700
Message-ID: <20251118201842.1447666-28-jim.cromie@gmail.com>
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
index c34de431305d..636a6b5741f7 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -626,7 +626,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
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
2.51.1

