Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F0B66A34F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5FE10EB08;
	Fri, 13 Jan 2023 19:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3610EAE8;
 Fri, 13 Jan 2023 19:31:02 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id e129so10917515iof.3;
 Fri, 13 Jan 2023 11:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laxP0cqPnvjzU/NVL1/q3C0zcn02Ez3sXy575b6QzqM=;
 b=XXSx22eBM6VnY8ejlGtEMdfoZjJ3OiTi64CMb06ipUrdEJmLwhadms05YP+ol2KXV2
 Ddy+diEX5ev4IyecNZvWF7QOGNcUrCK02QBT1Ep2bNonkDZwFIqI3dA/M9I5YNGmpQDK
 V4NnhFoRPOoNBVgkyJ1VDKj2kIuyInF8x09o+O4Omb/O0iO9W92Bh0y+iAI4ieBokskM
 GlZbrqKCuYCQ/RqHLiR90yg2nNAi/XByAO93xN84Jl+PiMrZkmCV5LG0B+HVE7FSSaXA
 HCJ4DjRGMYLRvb/Kzc8M+FrPZaxNf7VGB9950Swjb/4dHy5Mfa6AhiaU92lfRN8yryaf
 nRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laxP0cqPnvjzU/NVL1/q3C0zcn02Ez3sXy575b6QzqM=;
 b=couZ4i3a9xhK542UHfT0xya0VY5J2NThgvd+IWB8eJ1qtvZVEwmVNCjWo2TT9OZwKV
 TJkGlruJCXbnr+fyWeHGaeAhbQMI60A9pIsUn7xaZu3H5EVSsxr292HvPdJlSjhGMadi
 in9+iAJFa363/JlknTUtbf6FKvWTsidD9/gezgWZI8GyaKaSv/m2xeyIk+hXSLlIUqGR
 FE+925NdeV+1IaAv0oeUbAmy4L2JM3wyLmM65z2XE1Zv4PbM4jaIw3a0HjFqQc7lidWl
 pZLkxgEY/1vlTC9853iU41FeYMFnv5TrwXveIlibWaSDl36Nh+i5GqAgH+BEAIKlter6
 iUZw==
X-Gm-Message-State: AFqh2koQ6VgzwgzdvcW+UAoNvkMHcB0Oi2YTemimYSnzSwB+S0NjTl9f
 dEDL+z+ZB+Iiue06SIHPPwQ=
X-Google-Smtp-Source: AMrXdXvySgqyyHiwPQgzdqFJMy9XZkUn/CSiJF+4a7KIIBwdYMgf6mxSxnMSXWGNu6PaWP7AR3g3CQ==
X-Received: by 2002:a05:6602:87:b0:704:57c7:e440 with SMTP id
 h7-20020a056602008700b0070457c7e440mr6700670iob.5.1673638262108; 
 Fri, 13 Jan 2023 11:31:02 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:31:01 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 18/20] test-dyndbg: tune sub-module behavior
Date: Fri, 13 Jan 2023 12:30:14 -0700
Message-Id: <20230113193016.749791-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lib/test_dynamic_debug.c is used to build 2 modules:
test_dynamic_debug.ko and test_dynamic_debug_submod.ko

Define DEBUG only in the main module, not in the submod.  Its purpose
is to insure that prdbgs are enabled by default, so that a modprobe
without params actually logs something, showing that compile-time
enablement works.  This doesn't need to be repeated in the submodule.

Rather, the submodule's purpose is to prove that classmaps defined and
exported from a parent module are propagated to submodules, setting
their class'd debugs accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 9e66c5a7e138..94fe3b3438d0 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -6,13 +6,13 @@
  *      Jim Cromie	<jim.cromie@gmail.com>
  */
 
-#if defined(TEST_DYNAMIC_DEBUG_SUBMOD)
-  #define pr_fmt(fmt) "test_dd_submod: " fmt
-#else
+#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
   #define pr_fmt(fmt) "test_dd: " fmt
+  #define DEBUG	/* enable all prdbgs (plain & class'd) at compiletime */
+#else
+  #define pr_fmt(fmt) "test_dd_submod: " fmt
 #endif
 
-#define DEBUG /* enable all prdbgs (plain & class'd) at compiletime */
 
 #include <linux/module.h>
 
-- 
2.39.0

