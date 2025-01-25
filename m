Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D19A1C174
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7A10EA6B;
	Sat, 25 Jan 2025 06:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LjSiLj65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC2B10EA71;
 Sat, 25 Jan 2025 06:47:13 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-84a012f7232so114027139f.0; 
 Fri, 24 Jan 2025 22:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787633; x=1738392433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Fcd0CbpeqTSAr2MUddHNYquZXYxsn4RsHtjuNfIUxs=;
 b=LjSiLj65Dg7/U6MYyJAJ0+ooVa2fL6R75m+v8DprKj/9mVaDf2kpJ/wPvKyL+2MaVi
 uJyI47UsNUXFYa8pitIqniVyawBpgGai634+o4hsxAJuEkNlnAi3aJsqpryhgh7ICmgg
 loxmvlaBhyMrQavCoYhZWlnpqk+dFilwLvkd9IkCOxsKVXvLLn17Wwo2QGs7eZQ5L7m9
 hjc3kcK71jC8BwAK8F1Cpvh3CEok9pJPwEkdsLh3SrlCneb0MPE3iwo4FaGQ8s0geTCL
 57aZirZ0thWcLKN/9PQPUGAD1oRq9bDRI478oYftHy6tPOtyN7g/ZxNFQ6zeKtB0iZqs
 JgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787633; x=1738392433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Fcd0CbpeqTSAr2MUddHNYquZXYxsn4RsHtjuNfIUxs=;
 b=rSrkPIuGw2PGN0GY8Nv3AGygova5SvMDWLiVrTfhai9iSJaqGfsXAVHhiA4O0pUGwn
 I4/+CwSql+ZlKV8hBV0m2Q7pFUCT7McOyDFYD3gGxW6FyfrVbUBBGJzMyTYDWNz+CHeZ
 kkIlRwYNtGLezC0/hoStWLEbHRyRsx3P2zpu53C4EFENHNtIJ3Feoudd8+I4+EIgb+5A
 g3pQ9S+VOahVEgYYVkhTgcZLO2d9BhIPyo4QstBeqTHx6vGjdDTfMziNF4DS4YYTMZ1y
 OlrlaV+yCWF83KoTN5CW5C8zpJnnTE8AbhtiqLtDsG15HyTBdMbXD33F8Ql5aQlmBD2G
 ntNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNpI/5EDIrn0RbA+TApdheJSjJF3nyTPzeYakhOWkE96DQkf1pxlpyv2T//SS+Bw2N2x+bNOAxWApp@lists.freedesktop.org,
 AJvYcCXuEjP1zYoMHfKBFNbuiqYi1Bq48fVKvWbMA6KzeVv4GQ60P5JT9dXUlCnXs744uqiXwno4qGjMix3K@lists.freedesktop.org,
 AJvYcCXwS725zbC/6B4P0XOx+Q5XEivat/pFWbl0YDk+IzucwnANqe0k8iBQsG4wVeyyCF+NTtcbYK6v3XfhA0/M8g==@lists.freedesktop.org,
 AJvYcCXycvmmk1/ZzbFLvw8bs6NCuXKOvJwi5k2nCTrLBm8nSg6u/y2Fbk1jqfkkdCERjzxaOJ/OoibL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx90x+r7N9z0EZ8+E7DoQD/j7XPNV7loIO2Y365jOMnmJFYly/W
 0U7B2x0tfswAjLO+xYZY9nx8TiWLdWXz3QZ42aoyOe5ZewNMO//G
X-Gm-Gg: ASbGncvu1dL+5Mz+0FFeWDgt+TxF7Rs+9tZQY0X0u/SCJb+sJ1iL4FlvXB2+TQut9wx
 iCs/ZKt2ZydcRj2j6fE3hZp12oHxXPc+2OPb/CJ+nPuKKEkVoAXw1OeSs6FJhaWyXW1b1u8z+ps
 QK/RHBfOYZyWFdUyTYOvzjIEfIZ1Qe/AI6g2OzDB3NAgx3TGKJrfY5ELxa2MhexePITrOSoUci/
 /cF22+amxVkYH+6eYGBlRLrqeJ7w3GuoZtVHxK0lEtkfZAR90+TQkRNTwjLyu6t+4t1LQ0eonZi
 YRetGuE5j9JSdP2NEdMUwkTybXy1BAiWm86pNQ==
X-Google-Smtp-Source: AGHT+IFCwNCwKk2LjU+VISPtmf45oXrUgrMIIcfvyXFuFTikBwGEdBXb11cx99j0mRG19lRHebe9QQ==
X-Received: by 2002:a05:6602:751c:b0:84a:5201:570a with SMTP id
 ca18e2360f4ac-8520bd814a2mr784672939f.4.1737787632909; 
 Fri, 24 Jan 2025 22:47:12 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:12 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 33/63] selftests-dyndbg: test_percent_splitting
Date: Fri, 24 Jan 2025 23:45:47 -0700
Message-ID: <20250125064619.8305-34-jim.cromie@gmail.com>
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

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../dynamic_debug/dyndbg_selftest.sh          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 368d10a691a0..c97c9391d0f4 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,29 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
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
2.48.1

