Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14CF933143
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A910E86A;
	Tue, 16 Jul 2024 19:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bkLfXdRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635D510E82A;
 Tue, 16 Jul 2024 18:59:00 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-816d9285ebdso1242639f.0; 
 Tue, 16 Jul 2024 11:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156339; x=1721761139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gt92vv+l+QrwNWjlUzQRBip24zXOkaNnGwWlphVTLFQ=;
 b=bkLfXdRu3V28zkRpJ3DBmdGkVw0RkJzhgfW1a+i1iFeWFg6iCDgVy9BDul05y5lAG8
 6ibn1Dj+CX1ZXBIsFLpT3myvZWcRIwdDMBJoILh/mYRxryBCy8NxiI+rFGOfJsmoDXJY
 XE6lEb+swJRhFNadzxKPRv1ZOWWc4kt3vIB7nvQTiKi3NwQ35WsZbUWFNDXWyU1FdmfD
 +ZYrspoGdzVnQevMM5KPz4OWQYlb4c/S9equtkfO4WscMUIHhPlos393JP20X8o7472I
 8cCgznkWwMFD2ZgYruLHbtJwevxOE5QooDgXuu0YiSH/y378sRvEWK0x8pU9xhBjJYYy
 JcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156339; x=1721761139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gt92vv+l+QrwNWjlUzQRBip24zXOkaNnGwWlphVTLFQ=;
 b=dPRkT8roZrAX0UYqXhTcjFVM1bP0Atg6Wdl30rWLSAwvNDbz7mU7DqN/H/xkFYxy1c
 /Znu9yzKwevuKTPRpIpMZFUecmaslFV/G8df4sScymq8ShXjquAERv/4G/TbM/Xqgg+p
 5F+Fsu2V4P264YM74vbtNJOWTR0phEiYn9OHfco7t9nZg6cBVR0i9R4NTbHwqcsD5ONV
 77KOQYJn58ZjbY8TrL9vfSEAidQGToYAlAOmFBUsbnjVY8c3VsgKjCRJILuf0JTsXNNW
 4GRCn4BB68lZZEH8EgKP2UxKQbADv0klEPOsX+ISBkwduKIQMnPlykwcWQigVWQQJdm5
 wb1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEPSayxDcLH5WAFWTVX4K8RNoFA0y1gtLE9CgKRBBft+xYzJ1AWVj2d4AozDYpsWhqollJOIC6Sgd5fve2TV2TVxTXKNfO7DduTJPy+rwxDYOJXMkmnRQQNOL6rBhVZmZ4k9SmM1TWu5j/igXyWVuNBskDPBQvAjPokdit2FTAPEEPQWLdNMf5EjKhLfXAMvvjIGjPZ4WT8yStzWSVcVFssOW+NvhzJiM7QwJkox5smkoHgQ8=
X-Gm-Message-State: AOJu0YwINaG5flbnCXaYmSl+hFoXj072BfQnz+OJgOyt2m0Y9tGJY+wn
 OB8BtqcImnB8gJhMMGcFk3u8F6nZd6UJ4RTl5ryYONQbt0S1bVi3
X-Google-Smtp-Source: AGHT+IESuQloCkkuiShxJ11MDx3bp9+KgwgbKFyqWB/fqDDPxPeZjdAkYWwkkPnxEDOpSZ924Swh/g==
X-Received: by 2002:a05:6602:26c1:b0:7fa:8178:d672 with SMTP id
 ca18e2360f4ac-816c2a1fd63mr53177739f.4.1721156339610; 
 Tue, 16 Jul 2024 11:58:59 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 27/54] selftests-dyndbg: check KCONFIG_CONFIG to
 avoid silly fails
Date: Tue, 16 Jul 2024 12:57:39 -0600
Message-ID: <20240716185806.1572048-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

Several tests are dependent upon config choices. Lets avoid failing
where that is noise.

The KCONFIG_CONFIG var exists to convey the config-file around.  If
the var names a file, read it and extract the relevant CONFIG items,
and use them to skip the dependent tests, thus avoiding the fails that
would follow, and the disruption to whatever CI is running these
selftests.

If the envar doesn't name a config-file, ".config" is assumed.

CONFIG_DYNAMIC_DEBUG=y:

basic-tests() and comma-terminator-tests() test for the presence of
the builtin pr_debugs in module/main.c, which I deemed stable and
therefore safe to count.  That said, the test fails if only
CONFIG_DYNAMIC_DEBUG_CORE=y is set.  It could be rewritten to test
against test-dynamic-debug.ko, but that just trades one config
dependence for another.

CONFIG_TEST_DYNAMIC_DEBUG=m

As written, test_percent_splitting() modprobes test_dynamic_debug,
enables several classes, and count them.  It could be re-written to
work for the builtin module also, but builtin test modules are not a
common or desirable build/config.

CONFIG_TEST_DYNAMIC_DEBUG=m && CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m

test_mod_submod() recaps the bug found in DRM-CI where drivers werent
enabled by drm.debug=<bits>.  It modprobes both test_dynamic_debug &
test_dynamic_debug_submod, so it depends on a loadable modules config.

It could be rewritten to work in a builtin parent config; DRM=y is
common enough to be pertinent, but testing that config also wouldn't
really test anything more fully than all-loadable modules, since they
default together.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

fixup-kconfig
---
 .../dynamic_debug/dyndbg_selftest.sh          | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index fccd2012b548..d09ef26b2308 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -11,6 +11,30 @@ CYAN="\033[0;36m"
 NC="\033[0;0m"
 error_msg=""
 
+[ -e /proc/dynamic_debug/control ] || {
+    echo -e "${RED}: this test requires CONFIG_DYNAMIC_DEBUG=y ${NC}"
+    exit 0 # nothing to test here, no good reason to fail.
+}
+
+# need info to avoid failures due to untestable configs
+
+[ -f "$KCONFIG_CONFIG" ] || KCONFIG_CONFIG=".config"
+if [ -f "$KCONFIG_CONFIG" ]; then
+    echo "# consulting KCONFIG_CONFIG: $KCONFIG_CONFIG"
+    grep -q "CONFIG_DYNAMIC_DEBUG=y" $KCONFIG_CONFIG ; LACK_DD_BUILTIN=$?
+    grep -q "CONFIG_TEST_DYNAMIC_DEBUG=m" $KCONFIG_CONFIG ; LACK_TMOD=$?
+    grep -q "CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD=m" $KCONFIG_CONFIG ; LACK_TMOD_SUBMOD=$?
+    if [ $V -eq 1 ]; then
+	echo LACK_DD_BUILTIN: $LACK_DD_BUILTIN
+	echo LACK_TMOD: $LACK_TMOD
+	echo LACK_TMOD_SUBMOD: $LACK_TMOD_SUBMOD
+    fi
+else
+    LACK_DD_BUILTIN=0
+    LACK_TMOD=0
+    LACK_TMOD_SUBMOD=0
+fi
+
 function vx () {
     echo $1 > /sys/module/dynamic_debug/parameters/verbose
 }
@@ -192,6 +216,10 @@ function check_err_msg() {
 
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     ddcmd =_ # zero everything (except class'd sites)
     check_match_ct =p 0
     # there are several main's :-/
@@ -214,6 +242,10 @@ EOF
 
 function comma_terminator_tests {
     echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     # try combos of spaces & commas
     check_match_ct '\[params\]' 4 -r
     ddcmd module,params,=_		# commas as spaces
@@ -226,9 +258,12 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
-    
 function test_percent_splitting {
     echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     ifrmmod test_dynamic_debug_submod
     ifrmmod test_dynamic_debug
     ddcmd =_
@@ -248,6 +283,14 @@ function test_percent_splitting {
 
 function test_mod_submod {
     echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
+    if [ $LACK_TMOD_SUBMOD -eq 1 ]; then
+	echo "SKIP"
+	return
+    fi
     ifrmmod test_dynamic_debug_submod
     ifrmmod test_dynamic_debug
     ddcmd =_
-- 
2.45.2

