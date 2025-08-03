Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E098B191F1
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7B010E4B6;
	Sun,  3 Aug 2025 03:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MXL1bfal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E98110E4B3;
 Sun,  3 Aug 2025 03:59:12 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e3ee9c7815so14652475ab.3; 
 Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193551; x=1754798351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hIsLV3TB8k5ucu5pn8ENFVJkOV1b1Zc619vHbx6KE3Y=;
 b=MXL1bfalxnPec2zy3Dbq101chH3jbqpvDhXnKTLz888VWbSwIfrOmSmnD3XZrvoGVH
 cTHEinLIbNACoOoG51xcAA94/VcXm/bDJGXH0JGuh7RMpqGlQ/9lREUAcndmgHY1f1YO
 +e3edlYVQ9uWKiV1mvEN83bHpnx09PbJbIRW1N7AF24+Javcn88NBQJe2T94t7uKJSex
 UBuTPx9s99Szq9Tp2tLGSBjf78pMU3wCCxItaaGvS54/aASBbMX7nMe6avBJXwfpfhHj
 RpyvLkfgKjTF8Wu/Y0eUiNS4R+NMJ6n1HTH9P7N7MWke3wezNnyt3f8xYWM9zxLL3mr/
 Rt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193551; x=1754798351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hIsLV3TB8k5ucu5pn8ENFVJkOV1b1Zc619vHbx6KE3Y=;
 b=SrYZkqnUlQJgx/rLJRzzlSJpwulBGx99V0GJZF6QAOHzjUywsFO/3UCEup5osN59TI
 tmnzeqeWon3VK7hAJucmtcr2PFP6o2DWgZlB00idyI7/c9pdbXTqdrIc/DTS43iuoo98
 cQ51nCAcKmtwJfUnUW+K8veIbnm2ZZpXP/sxaRGOWpbH99ILweisRXmnuIMeCIYfH9xP
 0Zgarexz2ElFYQ/0Vf5IGqUSvUm9nU7m3s2a+rOqYoN+uIlh8rpNBgLRr+n1pTSQ0L1v
 sIgzBOPhkL64EIYYWJRl8xtJsZvHT9J9zHtL8RdfNndeZo+jRjPJFlzh8IrQUWw8u9Cu
 T18g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk9+KyEWPk3p9Csr7r7i2Q7BJtqAW6TkNXxeV3SX8X3fc43WVrt1Gs95ODukJb72eItpQ3jOEQ@lists.freedesktop.org,
 AJvYcCXNDbF45lq6oAEdCv8RIk9vFo9LqWFsWkaXtRn6+grSz2TMVrHIi38PpxpKENN6ITzRKuRv113zqFb7@lists.freedesktop.org,
 AJvYcCXyUmyoE+FvY3M7jGHPKoEW2mqM28cgtw5jFAmmX2f3X2XAjQAgZPW9+f8mKS6NAyJX3g6azjfBccPQFC1yAw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpR+3XG14ARzkWYpnWEAsm09O8i6Y37CKBcUSHeqm1zUbKrkto
 nDgjqO7T/UoIvQ+5fKNHjF1eqD5vg9vKXkPUEkg9G9Crb2Ii4ym84zOp
X-Gm-Gg: ASbGncvtFvQhJBo8XolBaZrSS0f9dmpVRij9gZJUe1xXF8ttqBQd9MzxP5ZVOE9ZGjw
 bh67MTJyPgJAEMd61tMpH/cBKuUTBEdRP8PfVsPtB0Ld8Rs/90X+NocGr8KhBKgG4F2TEPYFL4R
 v/Yk9ud/nAZHCOFyuXK7/8BGU4nJsiYkwZmnvQmFo8UPFCcKO6rJijjPB1v1QgxK8/MDe3KZg+C
 1w9/ef+vGCG8EmIOA+D0fou3DuBaAyVvh+fhVGohUIuOHU/AWWWAsqr4UmN309ddFixr9Dn0Hsk
 b7RFNO5exsj76xLEl1SfR/4rg/VpTV+PjUykZkRISAnC/B6vbPwIO6w0okAqgw++iIjWkLL7gWi
 AhFgjkoVl323ca5S8KaUk/p+1bznfejxQGImJX7WPXVzMdwfsSzT3wSAyHtt+PKHBKG818poFsn
 as6D14+EKRfa5e
X-Google-Smtp-Source: AGHT+IHMTb14erlWcx3uPanj+74lbfKJy77PmyqgbUaexrywFum5PC+8tMgu/EFNKc+XsZAX1tA4QQ==
X-Received: by 2002:a6b:5a06:0:b0:876:a7cc:6eb7 with SMTP id
 ca18e2360f4ac-881683b27eemr751673739f.9.1754193551518; 
 Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:11 -0700 (PDT)
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
Subject: [PATCH v4 25/58] dyndbg: split multi-query strings with %
Date: Sat,  2 Aug 2025 21:57:43 -0600
Message-ID: <20250803035816.603405-26-jim.cromie@gmail.com>
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
index e2dbb5d9b3144..1ceadf4f28f9f 100644
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
index 17651a8267567..73076709d169e 100644
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
index c7bf521f36ee3..513f6cb1db1d8 100755
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
2.50.1

