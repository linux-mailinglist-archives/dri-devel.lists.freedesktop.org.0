Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C240933103
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3459C10E854;
	Tue, 16 Jul 2024 18:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MR1etboQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061B610E832;
 Tue, 16 Jul 2024 18:58:54 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-816d9285ebdso1238839f.0; 
 Tue, 16 Jul 2024 11:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156333; x=1721761133; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFcSRVkNrMoAaN9TOyRvWGwNcmbCrlZN4vnmf8E27Go=;
 b=MR1etboQmGKLj35r8nzvjOuKmiXDf9qVV6zZMuCi5RWNkRb0Kabg13qPyclq3L65eU
 pFql6rEsGO1M3WDHsFWzs7Hyk5j2IOJo+kGlxAQrD0POTQYjKHjV5Gbih89pKn+1SdoG
 uksDCPxc+tCjxMeZkpn0poH5vvVpMKBEO06j2ZfmRrWMVBRCvwaXRke+i9xo3mAFxR9v
 9PDrb0NpQOg2+hZM97Y6vqf3piKJGjdIorX7TqyBVL3kRvfKfymsQmHSM2FlMKwjw14+
 BOg6qQVjyQ9XJZ+XfVMEppl5FaBk7O3IMWhoGQumPdqJ0S1Yb8Hv1MgXw/yQanUDHc9s
 mcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156333; x=1721761133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFcSRVkNrMoAaN9TOyRvWGwNcmbCrlZN4vnmf8E27Go=;
 b=H3pVO44gFaKLk937OsFNRZliNQlgc2xnwHZk8/44Hzj6X1jKQFmwvwFEwHOTa9wY+1
 Ts1G27xBpArLRHibXkONugx6lSd/E+x/1DQFAyM8BD2HzVZrlVJDmRWFRmEde7dBNn6L
 vAa3eq7cCChp78EkgTlTAdvoo3AiT/T8EBxEEO7nYBkG5oDKjSlnRLnGK+ap6xkNmaIA
 sFn/nraEU8OygdTr2GKsoLCOifZo9U3hc5QKCbSoqE1jHu4KyM9OxyCwyoxYqrQQtNz0
 ndJhIF2G0SBN9ycioXUjzP/KIC2tofrmqN9UhIrSEsI402lGkPWMzEW8yFRSPBVmKaQ5
 zdQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpqPrWmHBrYiYwItI6tu3Q9va5sA6QW0GwhTSKo3KbGLs5OnVLhAiP0NZ4rnarRFwvG/HFdTs+mDIvGXXAVmy9/3yytr4VxdTaKJoV0O2gvs0S4tAy4P46hlQLk3GAyDTfyYWXfu32fD8w9n7GvbzOCSQz41lFfHFtIMK2ZKzyYauz/PdO0+aX8jhPZsFP5JbBMiQUDUsPFdfhxte11qH07jxsLNJM4YhGL4XNEVbfQ6an6SU=
X-Gm-Message-State: AOJu0Yx1dSmHCN1o6SPkzWh5en/Gew/V3H7DolwAipkc3/3ieXfJfhtE
 v47wiKNrDf1MA1tLq1IslTezQ9Tx8/DRHqTn1cbwezDzFTwEFYLg
X-Google-Smtp-Source: AGHT+IFg9obh5N7uqV0H0s+HstduYRg6QMF6jZMCgR24AZccd/1wfKc7SoX9qV+9pLjIo/o6Xjceyg==
X-Received: by 2002:a05:6602:2cc2:b0:7fc:89ed:c15d with SMTP id
 ca18e2360f4ac-816c4a1693emr26868439f.13.1721156333211; 
 Tue, 16 Jul 2024 11:58:53 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:52 -0700 (PDT)
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
Subject: [PATCH v9-resend 22/54] selftests-dyndbg: test_percent_splitting
Date: Tue, 16 Jul 2024 12:57:34 -0600
Message-ID: <20240716185806.1572048-23-jim.cromie@gmail.com>
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

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index b4ba293ab227..996e6fdcfb52 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -226,9 +226,30 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+    
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
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
2.45.2

