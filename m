Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0576BA40
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CD710E418;
	Tue,  1 Aug 2023 17:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981E510E418;
 Tue,  1 Aug 2023 17:03:12 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56ca9a337caso1563815eaf.1; 
 Tue, 01 Aug 2023 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909392; x=1691514192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=kgqoBsP4knHYKSpAXaiTkftVb9gz6Itu9Tl69F/ZMCtxF49bpioU+Idmb9ddL/fS1J
 9YDzmVLehoKtLZeP66yrojdSXHdmU9vo6oXNnfRyduWIPw2dzKzLRsMBOp2PS01oRTz1
 OJ7pWk5D9z0QvU2Q9/EMV6hHPkdj8OXjmSqjirQHxSHCmWrPWgj0LPeQ9kXehBfzkt/w
 lg2NMXVCZlcEF4dwUL+VOXs2SXtoh7T0PPaGM9O9j3mNm++Ypd2ODbpgAcg01Tw++pm1
 +yWohdgk7kon9zf5HY6EmC0/jssUoFiJP28ZdqwkrDcwK19wIYYb0ExggzF2SYXkVN15
 oM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909392; x=1691514192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=lAgmUqfGJK5S/jRBlhIa2fGwXZrPw7noONyFyPo0iURo2/1aT77O43o7SH9Tg6psmb
 U5FGcMCaphAgwE1Oc9cZbTNtoqAuZuWUKgJ9YVOEhtAk1CaNCQbY9i3KNLPcqQQ+uGh/
 JJU0/wYfr+2hS7fgKnkODi6T8ykL5wpkcSOyxX2bzwt2eDEiGgbXGBGA9pPko/ckW/qq
 PUIB7OgQnWDduZW3Bz2YmnsLpsiBZ135RHIZn3HWXYMG5eF1rHU7MJHz7I8o05Tu1OH5
 S5i6RwK2JD8tFs+f4uFLH8SWdztbLALNInCFGbY3G/1lCxqJaWY6kh0+W5eovn1Ns3Ga
 VbFA==
X-Gm-Message-State: ABy/qLaOVQ95o5rzJ+Gess0to7tQ9+WxPSLKS7oi2tV+XV23AV8gLhsl
 doqARhXlwtGW7WCx5F97u/4=
X-Google-Smtp-Source: APBJJlG6vK477TfZVBUfqX8g1apQz6NMUABz9WRG7vlOwFFvtNV9GVjB2eC0PU2vGq5znCYC27r/og==
X-Received: by 2002:a05:6871:216:b0:1bb:b9d6:a879 with SMTP id
 t22-20020a056871021600b001bbb9d6a879mr14317589oad.38.1690909391823; 
 Tue, 01 Aug 2023 10:03:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 02/22] test-dyndbg: fixup CLASSMAP usage error
Date: Tue,  1 Aug 2023 11:02:34 -0600
Message-ID: <20230801170255.163237-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

more careful reading of test output reveals:

lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

That last line is wrong, the HI class is declared.

But the enum's 1st val (explicitly initialized) was wrong; it must be
_base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP[1] param).  So the last
enumeration exceeded the range of mapped class-id's, which triggered
the "class unknown" report.  I intentionally coded in an error, but
forgot to verify its detection and remove it.

RFC:

This patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP(), showing
that it is too error-prone.  As noted in test-mod comments:

 * Using the CLASSMAP api:
 * - classmaps must have corresponding enum
 * - enum symbols must match/correlate with class-name strings in the map.
 * - base must equal enum's 1st value
 * - multiple maps must set their base to share the 0-62 class_id space !!
 *   (build-bug-on tips welcome)

Those shortcomings could largely be fixed with a __stringify_list
(which doesn't exist,) used in DECLARE_DYNDBG_CLASSMAP to stringify
__VA_ARGS__.  Then, API would accept DRM_UT_* values literally; all
the categories, in order, and not their stringifications, which
created all the usage complications above.

[1] name changes later to DYNDBG_CLASSMAP_DEFINE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 8dd250ad022b..a01f0193a419 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.41.0

