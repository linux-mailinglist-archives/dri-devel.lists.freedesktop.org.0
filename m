Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C2A1C178
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9D10E2BC;
	Sat, 25 Jan 2025 06:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ACOIVEbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE12C10EA6C;
 Sat, 25 Jan 2025 06:47:15 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3ce7a77e5a1so8061355ab.0; 
 Fri, 24 Jan 2025 22:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787635; x=1738392435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I04a0kW+UR6r9NTRsDJJoUdmO3RA+TyzEWylVuR4B8w=;
 b=ACOIVEbwrXd0XH5YZG2XQ/mr/ioxc8jK8zZHpphBtQjXrKQaIMIPZ6DxpbN57kwLk5
 NzDOyt6JfOGtdY5HCMjvuybXp53tZInGqOvuJpNvZ2Yn7zN1ql15FSAHnXLpXSCK6vFb
 TJ/Othst+zEO9hqkyO2P2AIM4seKAe+BjQdRzoKTEbf/iaGGxvHimZTe5ZvJNuLO+iCW
 yUax9peZ10Q+ALFKSr0l+xrjkzeb01n171VbHrzzMbPw/Pq60BoMpG2iPdb9pYtfk+iF
 7VmdUl4ksjyoTdg+mXwL3g/sr0YG+Tytc5LOmv5Yw3TRdUZFH03vTXoRVvWAeUxv7G6U
 Lpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787635; x=1738392435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I04a0kW+UR6r9NTRsDJJoUdmO3RA+TyzEWylVuR4B8w=;
 b=d4jLCj+u92iAdIPIXUhFitIYmGL6hy9/6O2qxc1XJ9m+f7UWcfaY00c7kSFblGwG96
 xhAhAIgx9D/2ZTVvPemuiXBJDbKrhZsNPk+7hM3ABs4moNF2bHVqMAKJhZCLna7YfbHU
 1HCzioN+W7Ngf5WV15+gZaawviQDqwLo4J0ELIGgBtMerWBcjT1l6NvaMrLF51fDCG/v
 D/xBsrBcT6PAKwp5DzABX77mZTrsV5ZusKaDmtfWdwp13UFvGsdEdNsB874qSrg6/P06
 wJfOP1mxOlZWqXjTtSsxtw4sl67T0bsN2B6L5uvCRrM7Q9f2NgvJNrQS8/3OTqpyDDpW
 Xi7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk5ibLx4IPHd+zo0Qu7TDECl/iwGUVtxS3gMyj/yLCcnaOXMbrJ/Zcp2vmWGH83+0WgS+gmZLY@lists.freedesktop.org,
 AJvYcCVLv4ZiBImMyDpunPYrTuWVpv7T0GxahbllBRCa+WfexnIpDxPSgJfiCzVXAh01o8U/yhkQ+iUy8c9uh2nB6Q==@lists.freedesktop.org,
 AJvYcCVNUUWfaQZuBDQ+Cqmxg3esh7VY8hJ/8wlqLdF/ytjK30tcHTqYrdGa0DwT3J5pYLEuzeYJLy4NEJ7N@lists.freedesktop.org,
 AJvYcCXyPPMWeqEJL2MjAxZMvC4VUaXLzpbWWWkyefTlDmagBO52K8v+okD7TFH9JLrCSrLRkmrbXCfMONQ+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLXNGA0IcP7aRxw5z10JOEZQMUWWb/heBaOIx5rNskX9CQgsYG
 45qbt675ZGXLsddu1AdNnyHy2NK0+mpYuxi+k/nx08HuirIAx9jq
X-Gm-Gg: ASbGncvn+jHFhKawyq3X3cAw7/sV/gs4Kwv3DWS3DfRs2YaDE++tkCUMe73V7lTbunl
 XV9npQ0JLq95143wrNVXrw44bj76D3C0yGP+sfYDtFzNF6JydnP9B6AKcENuHziOEvLxf4DNEPJ
 niEFCYlH8y2tZXhF/ZYjVrzTt1HPwKzJ6vCx1oopAgz87OxbkkCRqR8kfi3jHXUzwkyMnNKnMsz
 LKN5w/qHr1LWVBaZkQOuRHWKCUolHkY4CMaJ1BypHG0Q9TF9CXCZHk/U4jRKQ1oNrF7y9yj1N2C
 ZtOWgONcm471DJ/9uRscn7g2ZbjubkpKr4lxvw==
X-Google-Smtp-Source: AGHT+IGIM5csLRgdDio0MZ1C+W8ZtXGP9ro0KKbKTmSNfS3XJ37G4loIhg3hRvpEN8PltJakl5OJ5g==
X-Received: by 2002:a05:6602:6c11:b0:842:ef83:d3b2 with SMTP id
 ca18e2360f4ac-851b6522640mr2688351539f.12.1737787634956; 
 Fri, 24 Jan 2025 22:47:14 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 35/63] selftests-dyndbg: add test_mod_submod
Date: Fri, 24 Jan 2025 23:45:49 -0700
Message-ID: <20250125064619.8305-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
2.48.1

