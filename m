Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AD626465
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C222C10E8D9;
	Fri, 11 Nov 2022 22:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B3A10E1D8;
 Fri, 11 Nov 2022 22:17:29 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id x16so3170811ilm.5;
 Fri, 11 Nov 2022 14:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUjShxaIiHk85i1hB/Op8E8p5ddWSfs+Wma1PGPikFA=;
 b=ePqtQ+3P8xuuUT2qMIKVj3C58MIuBmAs/JSpDeoIZH5GlTWvZLlDgO5Zn8lN0zcT6z
 z1oLNPXvLCXeUkQg4MmGUdSiIhyVldO9sDmm+CvSz07Ay/JgI1NLlzr8cVJGqDXEhSkX
 HGs2sAOB78+EAFx8uY/q45a7BEcVdMq0sgzQRo+3tVUSv0Tz/zkAzz4OeGvB50pmZWx0
 w/oQ+GbO6izGOnFR8/OV5iSolfskdwZcsG5ULxDO4AFQSOGhIf3hhpsobEkpE5oBpV9o
 AmDn1ligKQCSTbyZ2YTuL+LMjHwtiqLTs5hKjXCaylKQ3c7VTdRlFEWRM4FKgzBaKAmj
 aQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUjShxaIiHk85i1hB/Op8E8p5ddWSfs+Wma1PGPikFA=;
 b=VDQzcl6WRYTTVqxAr7TW5exvor05JXC0U8M8gqG9Gze7r3+sktLya24lII3pYkE3YJ
 8CTod2eE0gdt4gF7R6mP95elbG7xr+C88BvNXEE8zPTMYWeVVQmJ7MaIcb809UOI3/LZ
 EKCIE0l0bgfHjj0EGSNP+enzZuOMVk2rtqakoNMneue+phRe4P5l+iEAwgxMhBV6K3Ho
 hvMq93bzru9GYsnLIL2RhZm+9uEFdk5knhaRtDXyKG9Crx10HdkYghWX5GFlATX1fT/9
 ahR8xOJKiaHInYIVXg4wZ7/s8laKvwnEbXyUH/yetcw9MlZ8RzMlRHzylR7FAAykXVhP
 gdrg==
X-Gm-Message-State: ANoB5pnUu0X0iERy7s4Z9J3m7hTtvNmGS6eNaQBfgo8WjEX5xdifNmJa
 mwSy0a6Ai9HpsxMx0YtSmtM=
X-Google-Smtp-Source: AA0mqf5V6I7rjValfJCm7SobEW6Jv5WqPA7gaXTsAHy/Mu5XugSgmpAIf00M1U5bpvrsVOEizJfqdg==
X-Received: by 2002:a92:d12:0:b0:300:c3d4:e9f5 with SMTP id
 18-20020a920d12000000b00300c3d4e9f5mr1868728iln.317.1668205049139; 
 Fri, 11 Nov 2022 14:17:29 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a928e05000000b002f611806ae9sm1113457ild.60.2022.11.11.14.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:17:28 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] test-dyndbg: show that DEBUG enables prdbgs at compiletime
Date: Fri, 11 Nov 2022 15:17:12 -0700
Message-Id: <20221111221715.563020-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111221715.563020-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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
those in mod_init-fn, and more notably, the "class"d ones (callsites
with non-default class_ids).

This differs from the >control interface, which in order to properly
protect a client's class'd prdbgs, requires a "class FOO" in queries
to change them.  Note that the DEBUG is in the module source file.

This yields an occaisional surprise; the following disables all the
compile-time enabled plain prdbgs, but leaves the class'd ones
enabled.

 :#> modprobe test_dynamic_debug dyndbg==_

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index a01f0193a419..9d48689dc0ab 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -8,6 +8,8 @@
 
 #define pr_fmt(fmt) "test_dd: " fmt
 
+#define DEBUG
+
 #include <linux/module.h>
 
 /* run tests by reading or writing sysfs node: do_prints */
-- 
2.38.1

