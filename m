Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25366A303
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C0910EABD;
	Fri, 13 Jan 2023 19:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FF910EABC;
 Fri, 13 Jan 2023 19:30:44 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id a3so5290001ilp.6;
 Fri, 13 Jan 2023 11:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7E8mOROiZFak1hyuDLHZO4dWBPRJx+AzyZtVyPnB1c=;
 b=NFGI8G4J3JHcHWVJJCje1tn4wX4/c1V8buxhNGuHGLE8ioehj37HI2hvsXan7Iauj1
 bWiQH6MGv9cOKH5nmWV6A+0M/JOqI0hhwUzgAIHVc5Kq0RqrRPFL5FJCLxbDqrdlIy+y
 UUz3LreilLsYdvT8RHh+wNBRnYKAmYuInZ33RrJREgW7fnV8RvLua8XDtq3KyvlUrm4h
 8nNE8/1pZpXH4qvP22FNR5anq3q07NAS+Qk4kXZcZ8Y+PIru3803BdzsGR/Fy6TJXhBo
 8GDAghcOV4YeYkquVwMQN64IO3O1+wd5nUVrgmYkTBsezoi8F8QrkhWN/Gv4GLGp7Xhi
 DtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7E8mOROiZFak1hyuDLHZO4dWBPRJx+AzyZtVyPnB1c=;
 b=WY1wgCnX9/fsn7brIKdx5VVPmdfgVmL3UJImsglFoESKy0MYSeBebkeOv0M6820598
 HJSqe/p1WpQ8xQHN8OBSIJXrpbkAK5B4H+cxFzcxrqchKUSGR4drCMOD6P8O0RlULiaA
 D0MfNaDuwCuSiPbiVN5SWLKctRmuLsSyiXtG6yGLdSsU9DUfMooqoMzpvaW0ebtfSFlF
 Voq+DNmFxl5hx009XfaG+jeVCrzzefgAJ4zBl2PY3LYYV4HNV3s6a5MAZT3DGLwOpblU
 P68ksK7CLlyGLGq8Y6DvF/ICgAPMfU1Q0wbZSYuiSdjSPPu6UF9JABrRjEj7Ge8ezq2K
 g02g==
X-Gm-Message-State: AFqh2kpA5Gz2h3a0NU+XacEvxd4K1Dtk9mvhZ5C4q98cDtvrO4A/itjE
 X18eUIKNDuifz1v3A4sTA18=
X-Google-Smtp-Source: AMrXdXvPH129dWnUpJa8DkRWJYweDtctq7cHertzhMd9iaMmt2QU3y+ioZ4YvEafYXsPdjHT7P3j0w==
X-Received: by 2002:a92:d10f:0:b0:305:dee9:bcc6 with SMTP id
 a15-20020a92d10f000000b00305dee9bcc6mr53274901ilb.17.1673638243665; 
 Fri, 13 Jan 2023 11:30:43 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:43 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/20] test-dyndbg: show that DEBUG enables prdbgs at
 compiletime
Date: Fri, 13 Jan 2023 12:29:58 -0700
Message-Id: <20230113193016.749791-3-jim.cromie@gmail.com>
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

Dyndbg is required to enable prdbgs at compile-time if DEBUG is
defined.  Show this works; add the defn to test_dynamic_debug.c,
and manually inspect/verify its effect at module load:

[   15.292810] dyndbg: module:test_dynamic_debug attached 4 classes
[   15.293189] dyndbg:  32 debug prints in module test_dynamic_debug
[   15.293715] test_dd: init start
[   15.293716] test_dd: doing categories
[   15.293716] test_dd: LOW msg
...
[   15.293733] test_dd: L6 msg
[   15.293733] test_dd: L7 msg
[   15.293733] test_dd: init done

NOTES:

As is observable above, define DEBUG enables all prdbgs, including
those in mod_init-fn, and more notably, the class'd ones (callsites
with non-default class_ids).

This differs from the >control interface, which in order to properly
protect a client's class'd prdbgs, requires a "class FOO" in queries
to change them.  If this sounds wrong, note that the DEBUG is in the
module source file, and is thus privileged.

This yields an occaisional surprise; the following disables all the
compile-time enabled plain prdbgs, but leaves the class'd ones
enabled.

 :#> modprobe test_dynamic_debug dyndbg==_

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index a01f0193a419..89dd7f285e31 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -8,6 +8,8 @@
 
 #define pr_fmt(fmt) "test_dd: " fmt
 
+#define DEBUG /* enable all prdbgs (plain & class'd) at compiletime */
+
 #include <linux/module.h>
 
 /* run tests by reading or writing sysfs node: do_prints */
-- 
2.39.0

