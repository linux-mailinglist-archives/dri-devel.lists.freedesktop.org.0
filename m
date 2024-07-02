Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DEE924A72
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E8610E6D6;
	Tue,  2 Jul 2024 21:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SB8obxTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143E310E6E7;
 Tue,  2 Jul 2024 21:58:49 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7f3cd2c0a79so167774439f.1; 
 Tue, 02 Jul 2024 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957528; x=1720562328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUz2fuyNm0/W+cer/IlT8tdUcSLjwR0swYFnYz1+7bA=;
 b=SB8obxTMY8VShzYnCjwVB0T13vpBZf3limFd/lYaLVCaIpwP5MeAkSKwoFYqRQ5vve
 M60Fs0Nlj2nlyJ1aCpkLhtfPnAERfxzUjCNgL6YWe6Cm80h6wJY49mnjNTZTt24+i0xp
 4O8m/bIf1l3eRz9u7SdtTxT7AE6pt6VptJsdAH/zq2aluNgUNOm9iOApkVBwo1XdhSCo
 KVhf6g500qL2oAbIdzhvy+bEPp/LsHAUuIMN2tGSqQWIf3+v8QhViTtIhuGyouMPco2z
 DlcsZ+85MVohKLpMzdmoe+8Ohx0OowXPwKBIPOEt3MQNvlxSSX4wRjTbNArPRkaYzBOz
 qBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957528; x=1720562328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUz2fuyNm0/W+cer/IlT8tdUcSLjwR0swYFnYz1+7bA=;
 b=qDgp3L3Fj5FFsNPoqSxKs22JfNY8jzZRsidDVGgcYGt2K0LjoSCONlD+OnWnc4I+08
 QjHLf9mzJCHEPqQ6+i1tR4Zv36GwOzJMUk35nohfNUnE+hxV25O/venBAzlaYoeRz8/D
 6dh+i2btCunoP63qrmSqY17cLK5LVzpWzjx5HQL9GxxYK55FABFFbpE+QdZQ59Wy9nK3
 L+VbuPboZRGkyRfTTN/tCZ1Ijsj6TSuXVxLRAryR56yBho/FBBX6cb4W58JyrluqaHp6
 PFD2rXw/K+1OF6EjD1TIFXvdR/FxKrLU5aUH7JukeBiu5BYDlFPjwnBFxSvSxZKdQYpR
 +YNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5+WSUFxDAVyyQuhMAz06A8vw+eZu7df0rBN5Yczr+3e2WLPinKEFR90sLV4Ry7JiByk6ZDFIYNDDPsJLyPy9D6JPc2jo6jyuYMBus9Fx+xz+fy5ey43b4DDlRpfu0N1FFRAZ08vmet3Oku6h4ek1SD5316udGZ76e9x6xI/tBBc+u6mqtzfeMRmdyzkcWU9xegcQYfYqWJRBc07QqeCDNhPHV7unx9ba4c9JXWoFqXLPJ/Ls=
X-Gm-Message-State: AOJu0Yyi9+9Ut72Fa7Npl6q8E1rrl/c2Ft2aoMT42A5GQttYav+7Gu4E
 BQUuf4RNw0i0/ZVf9dXXegNA2F/2EfsONsbmGvvAZX0Iy86yWGSx
X-Google-Smtp-Source: AGHT+IHBWcQbF7AzwbpraWmmrtlRBjOUVEzWk/QMFIDiv3bq2LCfSxlC7rVZKZrSP+Cf2khVoPBz0Q==
X-Received: by 2002:a5d:8453:0:b0:7f3:d649:9fff with SMTP id
 ca18e2360f4ac-7f62ed4c918mr1080653939f.0.1719957528255; 
 Tue, 02 Jul 2024 14:58:48 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 28/52] dyndbg-selftest: reduce default verbosity
Date: Tue,  2 Jul 2024 15:57:18 -0600
Message-ID: <20240702215804.2201271-29-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

Remove the '-v' arg from the tests in test_mod_submod().
Setting V=1 in the environment turns it back on, for all tests.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 23 +++++++++----------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index d09ef26b2308..b3d7155cb45c 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -168,7 +168,6 @@ function error_log_ref {
 }
 
 function ifrmmod {
-    lsmod | grep $1 2>&1>/dev/null || echo $1 not there
     lsmod | grep $1 2>&1>/dev/null && rmmod $1
 }
 
@@ -316,13 +315,13 @@ function test_mod_submod {
 
     # change classes again, this time submod too
     ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
-    check_match_ct =pmf 1 -v
-    check_match_ct =plt 1 -v
-    check_match_ct =pml 1 -v
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
     #  submod changed too
-    check_match_ct =mf 1 -v
-    check_match_ct =lt 1 -v
-    check_match_ct =ml 1 -v
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
 
     # now work the classmap-params
     # fresh start, to clear all above flags (test-fn limits)
@@ -333,25 +332,25 @@ function test_mod_submod {
     echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
     echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
     # 2 mods * ( V1-3 + D2_CORE )
-    check_match_ct =p 8 -v
+    check_match_ct =p 8
     echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
     echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
     # 2 mods * ( D2_CORE, D2_DRIVER )
-    check_match_ct =p 4 -v
+    check_match_ct =p 4
     echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
     echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
     # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
-    check_match_ct =p 6 -v
+    check_match_ct =p 6
 
     # recap DRM_USE_DYNAMIC_DEBUG regression
     ifrmmod test_dynamic_debug_submod
     ifrmmod test_dynamic_debug
     # set super-mod params
     modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
-    check_match_ct =p 7 -v
+    check_match_ct =p 7
     modprobe test_dynamic_debug_submod
     # see them picked up by submod
-    check_match_ct =p 14 -v
+    check_match_ct =p 14
 }
 
 tests_list=(
-- 
2.45.2

