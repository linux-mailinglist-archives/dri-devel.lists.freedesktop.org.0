Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D85A79428
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359AD10E89E;
	Wed,  2 Apr 2025 17:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AApOTstJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25210E89A;
 Wed,  2 Apr 2025 17:42:39 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3d589ed2b47so469735ab.2; 
 Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615759; x=1744220559; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImilXtuxs5UykdZVkLyjXnRTikwvIK4nE+zQcHkVhFU=;
 b=AApOTstJYiQ4ikZwvKVFDAFN4sXepwVFN9WDXycBRjLgTHsFO69avOJl1zEiW9ZA4h
 gMAT08tOuP+Hk5gIUI9FF18TKLWlGGMdUYwZzQY4uSzUw8/YaMw6lgSf4SOleGobuSGs
 8quoy+S/3gXD8DGRZih2AJoviHTWibh+bVA+Dq0Av2MoM5zhLz510Duqy4kUm1SIzCIg
 Hlh42m8p7Cx2VaM4BhVC09fmiD65ux/qFk6LrJTqqmN4M7bGcdQ44e9OtbpJylf3Drik
 As9OyLBntc205HkXtYGtx2ldvd02WMc3CbU/NDzmWCEq8uG5jbhUji+3r8Hmx+f2jlyV
 YyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615759; x=1744220559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImilXtuxs5UykdZVkLyjXnRTikwvIK4nE+zQcHkVhFU=;
 b=X9XkXRt4uCwz/oEXNxLJOKInnbwJ9KS3/b1W6fYY3KUqfbaJiTuQ14NElecmUvGcmg
 Zou5mxZIjMFP1cLrufwk+jk+mVyUOxS/zKq6ZJ2LxChYfl54Xdv8qmVLbmyuAztHAL/i
 tK8w1bM7zH09451lkCRhXbdcb5BWtVrG/c/FvxztotM8soF89e5hxkO1K7kchKC84Ddm
 CTK4ARgCLyDnr/QyCbimrkS2lmbZCVkOjgcedGLw4sTOXvuMKjBaXvQ0zuIHgS1N3X1K
 dKxgnzPtX7qHE1WNJiqJCs9qDqWWW5UEI0oMthmbGoBEnAskvA+KdGnq+wSYH7SkGtRT
 V3GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEleRphmezL5hUWIjUsNMVh1uy0v8p9ZamUK2h7qMy51I/nLRIuLO7767mNsIJuCBktnYHpzcW@lists.freedesktop.org,
 AJvYcCXC5F0Au4n6PfLbKczsa0fpqu8mjOpMang0KOw78bPE/dl1PleW79YZtr/Afzpd4d9zGE/q/4BHTa5r@lists.freedesktop.org,
 AJvYcCXCx9PHCgu3ho9wwMw8wUtSJPox14jIlPDze+pmcG7eTVJkK3phn1KPHUVAqf6TVHADMU1qRDvAC9FuB7dnPw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywqri2S4iBO9iqrYvKhfZeu5IR3KPRLw6T6OIDq67P8dWYye3iq
 oJrmvOYdzngD65CcHiYbX9dhCMwsub+RtgO+0Ri0ojRf18+nR3Aj
X-Gm-Gg: ASbGncsjYRbEQgakjkwX+ITOxC2sXF7Xlk+ibK+b8hi71tr1d/UiQCsuDIiJML1rEU2
 +jb1UYru4jlPo4G6hqIdMfyhC8mEEkemi2KfB42Uc4/NeD7LnbPHXBXQxQoLqM2X77C0GbW1Jcn
 jVhJp4UDRvKFct3B86PkjXPxJgujBs93xB4LoH+vRCU0xjzjQigKjXOLPTfb2EMg80bUNhWCoWa
 0jKIAhHE9SKseRktGtIEedD4kw2tqWaIhErtqye+6WQPVIQpSmNC672EIjzKxyFjISvPjVeIBHr
 AcvCgj7j7wX5MCL6pgxn7PqPtPoZBYwnffEnDz4gZ3Di2pUHFtKB+l5jqcTKrc2V4PPcnWCv2Af
 1pw==
X-Google-Smtp-Source: AGHT+IE0+XTb679NRDlwHvBKShIbNYwOqIHu3Kb2Ud4uaIbrPaynJg2DfA762m7J7fFxbGsQC+M3Yw==
X-Received: by 2002:a05:6e02:4401:20b0:3d6:d838:8ba9 with SMTP id
 e9e14a558f8ab-3d6d8389342mr21563885ab.1.1743615759159; 
 Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 25/54] selftests-dyndbg: add test_mod_submod
Date: Wed,  2 Apr 2025 11:41:27 -0600
Message-ID: <20250402174156.1246171-26-jim.cromie@gmail.com>
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
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
r3 - skip test if LACK_TMOD

older
  drop -v used in test_mod_submod(). V=1 does it for whole test
  ifrmmod at test end (Lukasz)

test-mod-tmod
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
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

