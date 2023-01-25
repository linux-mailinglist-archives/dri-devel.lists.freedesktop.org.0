Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B771067BCC8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B9710E3A0;
	Wed, 25 Jan 2023 20:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F0910E13B;
 Wed, 25 Jan 2023 20:37:55 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 203so8987938iou.13;
 Wed, 25 Jan 2023 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gu6wCnYEan/k5ZGKZWmskafXPccsRtjhFvUPDR10PNY=;
 b=QblOiU3p6qGocJHDUkZNqG6XenIlCq8Mc1MVgbKKqX/NElqiyZKjtTFGvlFV6QpWUu
 qp96tYcZqvejp/3cBHVeodB5jm8HErPWFxBO8tPa9Hmx5UWZPGXWqzXrD7Zn01zJ8H3X
 +fDTQzru9nizXcs33usCBkihqDujBij7uOoHMuMGlJN92Z0C+r9tycE3OmMXYz9vOzSj
 nRx8e9F1PKwApC0Xr9wSCnLyPEExdZxyZkz3uwlMBphR769NRb13K8U+0jmkjKzmYXXJ
 pzmHnjbfDuo2ZT0GWBK8vxYVrO9KTEf9UiDm4d/lCs0+0qOKtyP6YWcVuvuh7o4bygu0
 dgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gu6wCnYEan/k5ZGKZWmskafXPccsRtjhFvUPDR10PNY=;
 b=6fQ4/AViyC5XbngEdSuBpaMNgwXLBU5hri/b/fXY1EPrjDXITnSltKc5lZmZ1kcE+k
 Rlyvqv8YdExyxtLJqpbycyuyRJL0ahY6VFv8wYA24kMqGhQqQFmzsnlgjvm56+6qv2xb
 3UwrXjG0h4HDj6TNgbp6tRG4FKXz3zXz02rnvYifhA7vdS78OQh1R2ADUqKiFnIs6T23
 K+dD73j0qwxoPUYfa0pjwqZai7xrTqsN8hwDo/vEaAbzlq6NfJQbqZCNnlKzru54yUMB
 wFmp0gt5eGabKxlS8ngatqR/WslOkVaLvFYP1V6cl/OY+ukXnGrCtd00rHsrie4bdlas
 49Nw==
X-Gm-Message-State: AFqh2krXxykJCFjLacuKVwtgyYNf8vtqWOLaxv7pS4nr1JDBQEjqe6J8
 zq9JN6ikTwqg/rtRTDnlUO0=
X-Google-Smtp-Source: AMrXdXuT3TLbSsxWuLK1gdZcJCjShH8KZiCuG095tCJVJInmc8aFczyqLL0SePoah1zeUmrzQw3QTQ==
X-Received: by 2002:a6b:b710:0:b0:6e2:d84f:ff27 with SMTP id
 h16-20020a6bb710000000b006e2d84fff27mr26097540iof.15.1674679075034; 
 Wed, 25 Jan 2023 12:37:55 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:37:54 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/19] test-dyndbg: show that DEBUG enables prdbgs at
 compiletime
Date: Wed, 25 Jan 2023 13:37:26 -0700
Message-Id: <20230125203743.564009-3-jim.cromie@gmail.com>
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
2.39.1

