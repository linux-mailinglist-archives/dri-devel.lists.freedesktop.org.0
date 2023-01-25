Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4D67BD0D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FF510E885;
	Wed, 25 Jan 2023 20:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E0410E885;
 Wed, 25 Jan 2023 20:38:16 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id b15so7117753ils.11;
 Wed, 25 Jan 2023 12:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYPktuDkhsdEuRTk1MSfg8ZGrHbLgcCVScoM+jk3tZY=;
 b=eppfcnpqmJh6rDvGyb5bXWEyiJssB/4JtHxIYQzimFJC+9A5AXJynKMCbSZKltuDWt
 qh2w3LNWKNxLDqQwWucoDBqIupHe2tKgxFxRj0bRhaxxTDgMlKvj7oQ8a+eYO4RRxv0L
 6C+PPL3EsY7pOGp5BGarclSkuWzlej9nuSXDeP9b5H+Ni8bQmJrLGbUbC/Vbt8XuoXdj
 ilhsFUgPt3M4I6VGyNR/NTjxMHkIdzx7zHimkTgPw6Ngjn+ZgdpQVpjvoIq7UhwMu+Wn
 kmYKBaoUmNQgYvIE2uwIFVSGGLwe04puyw8dU3w3E9ndpDXFoe0SuJmB3hZtBNuAmeoI
 QXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYPktuDkhsdEuRTk1MSfg8ZGrHbLgcCVScoM+jk3tZY=;
 b=jxkyMK1JTnXJYIEOhUeLsu9Qho/BFBKDUmte+0C1rdmgByAoxm+sy4Co4I6g+VuQ/C
 9aDgRT38v4Vr+1pL77U8t2p7TTHKVrKq/kPWX5ExXYiPxcyZvpN7KMT2ivfL/ldNvIlq
 y3w2PKE/SYdrm4o/K5RHgwPiE1v7BqQRC7SMuRsRPPFnq2mB0+gRhuZ7Gzl09ipI5UFS
 FWqNvHlqrzu/S0Z0NIaqCJRLfMWpOmZx5A8kwNOMtiCmcUhYzKPPaN4CiBZ7jGtIsA/y
 8gtPXZPtV2VHutSPUWOG9YITOodny0P8S5f7sZeZl62uYaw5nb7Q+UDC4Kcszk2rHHnY
 tomQ==
X-Gm-Message-State: AFqh2kq5nhA2VeWvni0EkUSAPw7gyZHpC5BEQizPUld5WY3s20ia4Ous
 E97/kmZH6rYYPi4P9wTLHbQ=
X-Google-Smtp-Source: AMrXdXsgxnTIXy6LMbJfQCXTR0XOCGlfz+t4W1ai6suugpJVCn73+qZoPKJfGaBxxUsfEQnWcPc5ww==
X-Received: by 2002:a05:6e02:12e8:b0:30e:f006:365 with SMTP id
 l8-20020a056e0212e800b0030ef0060365mr27732935iln.24.1674679096394; 
 Wed, 25 Jan 2023 12:38:16 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 18/19] test-dyndbg: tune sub-module behavior
Date: Wed, 25 Jan 2023 13:37:42 -0700
Message-Id: <20230125203743.564009-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
 lib/test_dynamic_debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6b7bd35c3e15..70a1e8955ad0 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -10,10 +10,9 @@
   #define pr_fmt(fmt) "test_dd_submod: " fmt
 #else
   #define pr_fmt(fmt) "test_dd: " fmt
+  #define DEBUG	/* enable all prdbgs (plain & class'd), to log by default */
 #endif
 
-#define DEBUG /* enable all prdbgs (plain & class'd) at compiletime */
-
 #include <linux/module.h>
 
 /* run tests by reading or writing sysfs node: do_prints */
-- 
2.39.1

