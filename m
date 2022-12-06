Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DEB643A17
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD91A10E2DE;
	Tue,  6 Dec 2022 00:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969BD10E2CD;
 Tue,  6 Dec 2022 00:34:59 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id o189so3099666iof.0;
 Mon, 05 Dec 2022 16:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUjShxaIiHk85i1hB/Op8E8p5ddWSfs+Wma1PGPikFA=;
 b=UDeZIHBGQBsCU0w4VXJG37tmrasGx1Dh9Qwq+O4uCjtxK+MPvhZuQyVCKPv4D9akJp
 /5O66uycj+Lyqo01MDBZiQ806EVORd1nWremz8Kwz5nj/nZcdoACkWLP0idrRrOU3aUX
 T8jl/q5h9yafdeD4F+eTZTBDPmnyNkLBmuqetZfYGvI7PHAF9Yqn6T+GoP+myimtxtct
 A6aWll/7A1f+D1gs54dd3ueUWWFHw9Mwok7gxTxXRWVtlogL1CA7UCyFil/fcP9DZhzI
 ZEPtC0AI9fytZMtU1IaV2yQN4W3Hzmd23R4MLnnosQN9J4gHdpMkwtwNrEsRmbaP0ENZ
 RPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUjShxaIiHk85i1hB/Op8E8p5ddWSfs+Wma1PGPikFA=;
 b=5ieopgGmj80n/SQBKBgSjQenf8dfOXMil/bGnqRK8koxb0Cy+StU9T/5VPBWtkPrbJ
 0EwyGmsUJK6nZBrs9k8e/E5fN+kumnV5s1xgtxggWMX5qRWp81s8XAAQiOuk5R08F4Vn
 i4ablt8tAZ4haX/amAfghJSQ159N2LnkRwKLRl8w2D+hJK63XyUY9qSJuP8GI2QsTzoM
 Eq9Asle+EMtFGMChBYT/TeCJ5qH0iBi2ppEvgfLBfSpP6e1xkwazHZL9PKTfYApHwBui
 IHLWfju9jT2d8JhcYp10KApmvvv1gYyw9MReKBhb0jmfakjM6OYO5BhkR4Pc/gvUaDZZ
 BE8w==
X-Gm-Message-State: ANoB5pnYOnbqKcypnQaklXtHXiqv1vHcDMlwK6p5ZuboMCqs4zSJ2gSF
 YCu/EoCSTNDEl0V4eOBu3+U=
X-Google-Smtp-Source: AA0mqf7swNN+G21iFyCypndlcCL4yUgCNnd+ZZlZ5MAssEa9Q0G/HyRDRQIEt4sj9LPee3m7RoWhwQ==
X-Received: by 2002:a5d:8452:0:b0:6bc:ebd:4df9 with SMTP id
 w18-20020a5d8452000000b006bc0ebd4df9mr28045510ior.84.1670286898535; 
 Mon, 05 Dec 2022 16:34:58 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:34:57 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 02/17] test-dyndbg: show that DEBUG enables prdbgs at
 compiletime
Date: Mon,  5 Dec 2022 17:34:09 -0700
Message-Id: <20221206003424.592078-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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

