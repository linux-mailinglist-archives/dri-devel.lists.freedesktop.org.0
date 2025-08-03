Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018DB191F3
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7799510E4BD;
	Sun,  3 Aug 2025 03:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Me58fhsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66BE10E4BB;
 Sun,  3 Aug 2025 03:59:13 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3e3e4a5715dso8643215ab.3; 
 Sat, 02 Aug 2025 20:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193553; x=1754798353; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=107A+iGieriBtcIEvITMI+JSyLEcyFCk4tsRW7oIEjk=;
 b=Me58fhsjLYVrZxYuELHPRAtlbhqyYr6wzF6vQjwJz9n54RRrp03r7rwL1jao8GbDn/
 htC16/AM0iIF6AtkE88MA1W4FKhqeQ4d9cvIMQWgMZk6DHJFcFdhDGntQLQ1oRVofy1k
 YjfQ9oe+RXge3KTpGv+Oqayi0Mov3erVkRvFR9BgdgRJ+bXe7FMj6f6Zdp+py/mHZMOf
 EyT9X8BRpk/gdkzx/j3rE1L+rJfGnOjV3FOCrZdAxgzyxEgefTd1Gs6HXA421wTeGtwY
 H7piWyKLGLMifE/9w6Bk7lCHC07UZunqXjKp6GRkDMGW6WLv2ODat0mYPnunvaXsZ6cQ
 rAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193553; x=1754798353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=107A+iGieriBtcIEvITMI+JSyLEcyFCk4tsRW7oIEjk=;
 b=ahaa3j/qK1DGC0WFIST9dIslWXH3Mdp6uZTsHtm0t7T7Rdd/RYR36eRf+gDGiwXGC6
 PCMlJM8M2z+CgT8F3OmtULeYy9+TZ9pedd+kK+nEL+ub6LGaGUNKy7QsTW144SvWre/B
 WwWlt5b6mPQm8n48irkwYUGecMITSZbBUQU+fZSYGzODwbMQgl0Bcfubl0WjrQbtbXB9
 aqXmoj5Hpw4jwvMGh5vLAt0svs/I53ou2RRtZ6BnN0o8j57KurpYvfDUL32yoc5w7QFm
 FjqO4OGNgujLmIEjc1b5/W4pqrhKHNaJXuOubCl9NG/95phC3xPtLDPKDr8KNcUkc661
 AW5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwadNGen/7V7fhmqPJ1vBNn9miCJVQ0PetdWG2pjMSm7yUYs9Wf2OEArzNQJbaOQwLtXhF3bXEbSQWrfQXMg==@lists.freedesktop.org,
 AJvYcCWi4AkkBQM0wFrNNaKrwnUjiws466xlFPuWddVP+0RnZoB43nX9lRwBpeGv27IoS0ogxA+fWdvN@lists.freedesktop.org,
 AJvYcCX4jU8y34Wtb6n2UvRnhugBljyBmqRWnYdRaiRo8lh1nEniRYvcqxvAFT9TK+0MX6b4U6033pbvRyOR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEEYZo7mzMPGbooNEV9vdoSb5tDYgkYgqQhsg9316M5mTEf6YJ
 iSheV2jsO5FYTf4MZsphmfwosCluSyP4qrnmgmUyWAsZVZGDJUXbehwV
X-Gm-Gg: ASbGncuwdJiu+0um7gF0LFUZ+c1erOw+0Ijj1TMupQCyQ5fnxd51eWIGva+g0yaxH3A
 /k279bZrS4d3Yk9LNblLyV2qrAGz7nPyFOG7GSObyYQfGOS0EYLq1zVl67NdO1z6qElxFFcFwGQ
 fRXFVRlZkqVxhkLFSOi1XLImsnBQAZ8Gm+yxfLEKgNONd9M9QbbL1W+bC9NuO16WpHzAqIk4aa2
 cvWV1MuqpN+eAZ9M4DWlKeofkh22zWw+4xRJIl75I8r0IhBKwlBcyJ70EaD3fTZ4N/POJPoQ9/S
 n68RHtpH2gmcXsU70P9tXVLRB5wpjwSsWwmKhhP80ytdqQS5D2Vk1HRI8b+JzjMGngEaiwHXwyt
 3LDjefFjCTwGTVKIJIvKmZ9rA+F710/anBXVzwdgePNhTwSwvXjlUNMHc0Z06kZYWoGoweBY5No
 y9yA==
X-Google-Smtp-Source: AGHT+IFEpYnc1XKOtvTxu6uAAxg044+wAtgG0lAGsg41AxxCrDtrtzNsUPBwA6fhtq1RSc/6sEyECQ==
X-Received: by 2002:a05:6e02:2388:b0:3e3:e42f:279e with SMTP id
 e9e14a558f8ab-3e4161b6f2cmr101215625ab.15.1754193552837; 
 Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:12 -0700 (PDT)
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
Subject: [PATCH v4 26/58] selftests-dyndbg: add test_mod_submod
Date: Sat,  2 Aug 2025 21:57:44 -0600
Message-ID: <20250803035816.603405-27-jim.cromie@gmail.com>
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
index 513f6cb1db1d8..09937dca3056d 100755
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
2.50.1

