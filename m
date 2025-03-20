Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11920A6AD90
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA3010E693;
	Thu, 20 Mar 2025 18:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lf1Ly5Tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1506510E6A3;
 Thu, 20 Mar 2025 18:53:36 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85ae131983eso125329339f.0; 
 Thu, 20 Mar 2025 11:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496815; x=1743101615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XhXUt3GtFFD1CFOdu20/mAVQW9nyW0QG+7LpAH9FRGE=;
 b=Lf1Ly5TzoATwuwh68uv/2WKLJUS5StZgzQh94yDNgtJvPZMGwkxqsXWvH3OlDuLLD0
 qg7avNYTOdiyENRkUbRT24pi0HDuhc1+kP0TeAaV0EpZwFWHlkW/ehLn+sfBbrhcnh7p
 I2Z16hCZQhpNSs7HnY9kqZlYq6kE5Lu1I9VqZEdSCOTUubyZTOeUALCjsdd6ENIeA2XH
 bozvxvc4me7XsFn62FliutbADAj8QavZbAqEr6FpxdS5U2PfDO6yZKovdyMH5MiEOyTv
 VWnjMgzoQQAGzgzO3gaj41DKTcmOImdqNQxR6R4b1s+OtNbQRjwouT9Ef4/3GYYvgXoJ
 +eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496815; x=1743101615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XhXUt3GtFFD1CFOdu20/mAVQW9nyW0QG+7LpAH9FRGE=;
 b=PTtEQ0W7Ck7GHZ5IeUyHa9i0Auuc2yE5dTuys+Ib2sP9+xeMRL5v+gkne3xhcEEUcZ
 ULSMetG20smTVevbxPg5kjsGKFz0MjxlvNDpNW6jDIpcLC8nsdzRY5Uauzp7/NV009uh
 KIf4zv1XMNM/C1qDHVrmy2ZRkmeES4h2B0rMJEj1rr50zwhhO1HFCsLjp/n1dFQKtRTz
 vwdkAPQbZpLtZfsXFxaci69xJAc0BE1F6QDigqxsSDUx5dAU427hlHix3SrgYOyjNSh1
 Vebvm7WEMVkF6BKMHXevTiIznGHfWtEh0Dl3oXZwIqvn1+DpzdiX0xwkHaRkKOeXbuSf
 4KsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUojmNMqkOZUXeahzZMQG4HthN7auEEI8PqE/cxM8UcwKKSM3Vco6yjBXfKyGlefAw8ydtdUkFYKnDr@lists.freedesktop.org,
 AJvYcCVGWoUeyt/jYy3uYnrdzIdNdUqIpn0PufK6n4sukQTbzAPti2WkF13yjJG1gHxDfvw8Qr3NIFImGqvm@lists.freedesktop.org,
 AJvYcCWNcivhNd92zlAmcJ8339gvQ9aGT/PAkW8Z3HADkpr9AQ4gQ7VRhxDkpLvH4adgVZTwIAtTIE2t2jDD3sV1Qw==@lists.freedesktop.org,
 AJvYcCXSDcr4hhCap3dmVadyGEvEEp6WicULAdMOKJ6R7FKNJXXt4S1Q792AJe8JohNoXF+xoba0UvE+DQeegFFsV3Zwgw==@lists.freedesktop.org,
 AJvYcCXurgEPwovjkxyiDpzMHT9gZ6klqMibe/aXfII2pqsy/f+SHuQervOf9IiyijSw2xXkYHcBaexw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGbYLLyDsVS5jZTBiLX6aUT7kZMvWvIK5GprO4ofj+EQ65fACc
 oEaIdYfQcT7s7MvRk7PUMPGHlEMKZcuepMWDR8T2pjc3JlBTmWcn
X-Gm-Gg: ASbGncsQodA68b/ImNLU7BalaTmH5Y0bYT4C5WoGIPC7WoPb6DNlWx+8puJr0iymX0P
 dwvxdc/OQVviApJnY8aGvYPHXM2QWY1sgdj57XetiCKmmaSj+6krcePM6D1LHYSsL0kifpZQM7r
 UnDPpVT1niYCkr/pYJJYCkkwGpKA2CB1NdGFP2mTmv9utH/AgFpwKtEy8ODUFicwbSd5Zakj7ox
 ZthMSuxylaxTRJAXBcA/WbYFdjWtg/6NGbCSJNgv23+JBm8IMm/JAwiMUSWbhmlsnCgZIrSjCLv
 a3+ehQm8vChq58KNe+Isv8VgoLjyaLcvksmPRYsbXUkj0CFHwrOzqx0iT2MECUXP1sfY4lel35h
 H5g==
X-Google-Smtp-Source: AGHT+IGUwJQCCV968viXZ2uAEZ46zasZ2WEK6BntArAqyb8MVxwaNX2kU6atjh/Jnd/hczHfTieubw==
X-Received: by 2002:a05:6602:4742:b0:85d:9a7a:8169 with SMTP id
 ca18e2360f4ac-85e2c904c6dmr48741739f.0.1742496815306; 
 Thu, 20 Mar 2025 11:53:35 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 28/59] selftests-dyndbg: add test_mod_submod
Date: Thu, 20 Mar 2025 12:52:06 -0600
Message-ID: <20250320185238.447458-29-jim.cromie@gmail.com>
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
- drop -v used in test_mod_submod(). V=1 does it for whole test
- ifrmmod at test end (Lukasz)
---
 .../dynamic_debug/dyndbg_selftest.sh          | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c97c9391d0f4..cfed79b34996 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -275,10 +275,79 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.49.0

