Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417EDC6B915
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCCF10E52A;
	Tue, 18 Nov 2025 20:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dSLxzLkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2426210E526
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:33 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-94861514a5cso392889639f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497172; x=1764101972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6twf2/xpLjcZPEmlJlQUkGBg342LRmA2abBTvniHwsI=;
 b=dSLxzLkSVkY8mBGvWdvjL90yNgEdq+I7k5J31N60f8oRK8Kib4OiecWkdp8ODQGd7g
 Q6x0D5EffSut2LjZ/WW2OMJhBxOYjFrL6P2l+KPe6Ysw3By/ZSkXebhBbRVa/pk0c/3t
 kjDaXdDamEh2hwQpeNDYog1ZfvcQr0KxL4U6+DIr6Gt+h4U9Thcixofin3ki7Bvo+V3K
 kKpIIxasYCLnna20GjOxuKyOrrNYyAoEBc1v0lY4ETaMm/PBCBisp2s6whMQxw2p1YvB
 ZBJuCLGo7qK1OD2x2MFhiPA7CdvR0FdNM1uGo02gUiFwCGJHTEbWe+YlJrgReE2AKw1Y
 gkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497172; x=1764101972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6twf2/xpLjcZPEmlJlQUkGBg342LRmA2abBTvniHwsI=;
 b=b//R1t1AMadMv/9RUFK0qDcNkEClV4jpLDOjcWgcyAPmuxJkIdlE2jVFMVdWA/n5r9
 MDLzwI6uAZplhE1AIeFC7EAJ9HhzZQW1xbeL/036skHoS2KCW6ibOTCol1fojQ8rvQjJ
 gi8VCkHAUj3AHaLjgc2mWsQjQqRUwNB49R4j9KuKsZ8KZdld9RScwUHOMaw4UQ7vnVU/
 /nfqBaeJWbkCkG96Y49YnC76qZlymtIyUzWDMgE5DF1l0d4WrR042LEIMsqArDH0jOcm
 QstA+CBZ4gw5lIUnx+4vajUqgAgo5acCnABi6X7Jh6rwpbKt3aUT5VZnfOohPSZJ8AYy
 AUug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs+Em5oyjTb24Ubfbbo0OvtA7FgTWu9ya+581p1WLqnZJsc+bkcCvzAJT2t+TUc31WOqVgQktJyZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOBQ9ncOLp/jEM1k2n018+/JmGR+yLnbNL++m7FMeVu7wQk1B1
 puN6683WOI1uALtWsKk685QpOQnYxAIAz2sQnORyxF/AFq+4HcerGb19
X-Gm-Gg: ASbGncucEWNn8OOF00sa8gJDD4SMAM8mubq8kpWG80oCEj4IJjEiMWXn1qUhBtw7UQV
 Wn/RA9W330BWvutGlgVDhlnhULFB2xylq+XdZABLly3ESs4uLjKuugj2eYcOHw/cSMIa7VXiR7U
 jE7Pqx5M4ut+LTjfk/J6FuCIYDgwl5D9u3Pt8sHk0iQ1ohxsGrD3DjWWUEOZ2D7xQMW4F6PlcPo
 hjV0DqLeEZ/EgWlwkjeV6JVicDrgLpSJLvt8f1Dy69axeFVBBEYcdPWUvpLbkCeflLr4i/f/O2c
 r/+agIP0KXm8VaihAD7bGA49FvUKdfQjT3kqkXqhZAMwRhCQtIQLzEDia6aL0hTelWrpK3OIHth
 De3f7eLB6DsO8d+CTP/3vS5cA8jgKjHYT3SJBHfNxXXE+K2M/8BWrjPYaqZse1tTgkSXeJ+DUrO
 qrd9eL2RghkOPUks79DMvll8JJqjHV5yB4Xe/gRnwm8lghqqW31Myvul/yrDWYcgqKxZk=
X-Google-Smtp-Source: AGHT+IFkYXoGTAt3RUYgUsveyerauYsUeZyuGCuESFN5PjmKiqmJ3J3pTqwdApcoCmHPHik0qX6Eqw==
X-Received: by 2002:a05:6e02:e:b0:425:7534:ab09 with SMTP id
 e9e14a558f8ab-4348c88fff8mr219681895ab.7.1763497172358; 
 Tue, 18 Nov 2025 12:19:32 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:31 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 28/31] selftests-dyndbg: add test_mod_submod
Date: Tue, 18 Nov 2025 13:18:38 -0700
Message-ID: <20251118201842.1447666-29-jim.cromie@gmail.com>
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
2.51.1

