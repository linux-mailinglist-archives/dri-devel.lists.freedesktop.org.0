Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026BD1C084
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 03:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D19E10E5C1;
	Wed, 14 Jan 2026 02:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y+ykY2kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC210E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:00:37 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-45c60ead7e1so1071978b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768356037; x=1768960837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
 b=Y+ykY2kfNUi7Xntbh64fvguUDaurJmAqWbGPWkLFDraty9eSGnWqhHH2r3qBlx2lRR
 ecw/KVXc86awSi1QZU4CaIh5gpOP+R+YcDbkZi0Mzg2/Ob2nX14cdpHD7vZPz+hifhFC
 CydmA2LZFbtNdx0h1pHcUTA7b5I0yt3DDgc8B1Xp78PCpZCRAoZ1/YyFi/HywT4Wjflh
 1aJ/rSWHKp3QXPeVl6xHo8GA2R5YjMDpdycignLiHXynjiv3yJ+zgfpV1T5CTV7grYlb
 6LORguCqCJKJlcl0jTrymcB4nOVSUk2Iezr6RIOInjUCrlSRY9wk2r3hBKUUZRBATRR6
 rSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768356037; x=1768960837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M3hNaVpAB+vi7bZ5p4r2BEr0xFTlYHYJVlfyEjZdNd0=;
 b=DNz+7pXLAZ1LQlbEt+/0Lh337Ma3MySJ1wSdM87e3k051YSDE9na+dUr8ku+DbC4NL
 Qcv3F+xS/XVRfKqUZfIlCYG+CTobgNThPEAj7TUGuLIeuASjtKWq8t3sMn+iHeD06oIO
 arYkZk4tJz9otQt6tSt37cpAXRt9ULjkh9XynNIb6pUxHzSt1jSHXcuchOBOUCv7Hj9+
 /DecvN8f4zTTS1kg7IsVXju92cjx6VfkZB6ICIeXsFX0mXrg/wgAApM18rHhnr2wfA9o
 Y1+Oq/e5nHrG+WHs0lMT7fWU0oe0Gvl+2TSYPlY28HZYqmv8Ov6vb/ZFnm6GA95MXwbK
 P9dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXVaJm+KJtJUNSZ4ANvJ6tssWjKnGLfEPFayN3vwqkov2WSoP/WnBqENEcIoSUo/Hka5mVNhcYU+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu5WW/RUIGjBvNNR+75X7BfPoDNfbeS4aJWzYwGYYWUifDswcy
 1ynhWU+cDxO0eN7ynmdTdtfrH1UMpt1EdtpvYql3j2VkAWWZghGgonzI
X-Gm-Gg: AY/fxX76jLVpPPKs82L98EGQmBUuwcQAhaNIdgTE1ca6qpFnK8Dpw7fhAjHp+Punh+/
 gbVu4UnTIj3H8iT3oGG2X2b/O2EFRPeqNw3eRYil8tD5IWRr5/+WgfBVDEeLLcMLSAmJZmZLH08
 YqJ3MKYJDNpKcE289d2Wv7bTOTIUTMXEWaJsi1XsbvHXmiQiF4aDsMGtgEtAkoC8sEgNhjiONIM
 lsMlG9pFui/N1IiJ5h++ZtAEgYoMtspchxt1oLMUf1tTqELm0dnCtHc1AghyfBmFPNlEeSfPqn/
 trbTepDANrEqCzdOecryuKUKU0svPouZ2pkZlAeXKGOGXJILVm3iDCzh4msOcU1a3kVzc9klTus
 Hc2z4c0PxQBN+Un5JWCULgtu5r1Ap1zYWXoMS1rTvuNNq0kyUsI3Z9ARFwriRX3tehmWyAFikao
 8LtjVaphY+zJgZWTxSXKHA8CgPSZSqO3KDmvKNOJLHJFNUfVw=
X-Received: by 2002:a05:6808:178c:b0:45a:55e6:12aa with SMTP id
 5614622812f47-45c7157ac7emr579179b6e.53.1768356036240; 
 Tue, 13 Jan 2026 18:00:36 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 5614622812f47-45a5e2894e0sm10347195b6e.13.2026.01.13.18.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 18:00:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 28/31] selftests-dyndbg: add test_mod_submod
Date: Tue, 13 Jan 2026 18:57:44 -0700
Message-ID: <20260114015815.1565725-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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
2.52.0

