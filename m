Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C9BCA7D7
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CF310EAD8;
	Thu,  9 Oct 2025 17:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CH1dIIRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3FD10EAF2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:16 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-42f91f09a6aso4651895ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032756; x=1760637556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5dZYlkWsj0ZEEitjTrF4YjoePePLbd6bheWS2OZneg=;
 b=CH1dIIRGCCKuG028Zenx/mo/CnTXiHZ/XHwIx+YXw8CbCdr3xTZif3pzDifiE+wAI0
 r6yCseuUZlMpRNm2eOYb1AuUe+4ggCmphFRuXff8z6mNBOTlD4x2bw3QbEcrUHzhyqTQ
 Do/qU3D6gddBcKDrPmztxksliCRYWfkhPuxNHq4KdW+/UTHdFqD7tHF1VapPc7Jgx6pR
 +XBkYVKG8PuG1JakqnMSRAYuKMHrITkCsr2mhNwtax2cOwQaTMTxDH1courE/zY4glMC
 ff5yHYnTS26YR7LgKdcaH/rtSxKrmkqBLEpML5kf0ZDo4Fi0K5MyNRvfTshrZNlyZtl5
 vHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032756; x=1760637556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5dZYlkWsj0ZEEitjTrF4YjoePePLbd6bheWS2OZneg=;
 b=LbFZG5ma0NhaLpBuBUzWZWvGferKTuDRkiKt0y6tJl4l7rIsXlHx5p6qTz7+WUR5Bf
 le/k6Gjrb/8RmAvtflH6A5ErBqC/oVOW8BoRbFIbSLcUKgZ69bCiij7pBPTroHpd7Mmn
 5vBcyhDPFGNCmcQf3m3xYUsCnYo1cqqMIbfwtQAKTryUxiJxP2nlD7XOH/OJbW/GVAws
 4VaM86azDvRteVfZZaTq68t3Yt/2fYeIJPQ6ndlX5UfMHrYVbkVWemTnJHp7I7pVMPaM
 l2j/RhXRPuWO3+MSMX0sKnLO/VaiBkRcNCS3mLKnnDDAWrUB76I6+hTsHqgLaUURHdYd
 lelg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNWtFEcSsijr4/J7fLhnc9kzJxu/MRSvsurY3iFAY9bAJyhpgNhLdSc/3v4TTxpgL4F784B763nVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNPQIa7HwTtzGpfOP+GWRiAW7yOgjVEJO+iaqGxNbBh+JeXHfj
 Pn/fZYWx0aTPsHE0t3Kku5wP91rX/8GZb44wSIte4RaARtc34aqZzHal
X-Gm-Gg: ASbGncsfM3FGCx/+5tdFrKJ7MiWHeppNHGRUV6nBwUboJ8qQJalpPjoUmadH69C7c+O
 sGI4QbcY/um8tX36rvtYozI2kgVeXO+hnNnnQn9Sirk14DlqBqZ/teS+Dz9UyOntIesH2tEWLbF
 R+y2PrWCy3f8KpSp7bboFoJbKlvRnZHbK8F/XIsH1EmwuE9NhJefACRW08jLvI1cLdghpZR9Ekv
 j8GoogN1y4tcPBeNyTgv8PM0ArliUrouGQhsV5BOqc330yGo6k3LBa1/B6nfdLEjMBzO6tErLgg
 YZ+EvD/jsDJmo3B5T15HgZO1PXmwjzLL3IbJ5qpUIgLm+kMilhAUdNzccJd+C3h82/iDNiNK6kp
 q9apJl6a3QOODmaR6Xer39yQbv3gHB45zO8Y7skaL1Ekt154t/KC5qTK/Eyqk3nrlnNl27puquE
 y4JvcRgPpcC640z18WezHW2bpmBL4PVV4CK0SgSQ==
X-Google-Smtp-Source: AGHT+IHEWGVhtAuxACrF15TMBTJdVDkb5oi4cU4Syu6r807ljXBmyTG7+iiL0/3UAgEv3Zk1RERmEQ==
X-Received: by 2002:a05:6e02:348a:b0:42f:880a:cff7 with SMTP id
 e9e14a558f8ab-42f880ad12bmr87822445ab.13.1760032755551; 
 Thu, 09 Oct 2025 10:59:15 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 26/30] dyndbg: split multi-query strings with %
Date: Thu,  9 Oct 2025 11:58:30 -0600
Message-ID: <20251009175834.1024308-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
index b05d186e78a1..5de74a1be4e5 100644
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
2.51.0

