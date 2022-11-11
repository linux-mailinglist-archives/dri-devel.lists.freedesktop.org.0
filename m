Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7851362646A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18FA10E8DF;
	Fri, 11 Nov 2022 22:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB3510E88F;
 Fri, 11 Nov 2022 22:17:28 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id o13so3172677ilq.6;
 Fri, 11 Nov 2022 14:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnDAYVoy4dFPmqfPd9DbquIT23rvABloUcd8Ca4aFl8=;
 b=JjcHiyHmfmxyRqn6o5bx8ZYLnlQ26KiAXfoYiLFgLfgau6/EinKC8wm5yCn1acE1tb
 j3iRVshBq+xpfyai69g01wCtl0bEPC8mBV+ax5QAaRKkttYGNneT8qxbcF6f40qGVovs
 kdgyV7naU6JcjGWSmoJQHwq9PjSus6P9yp2xIYx2D8xjvvctH+Pu7VEPPoM3GQ74+NRz
 RPhcmBfCZzpProberL0zi7rqVU0OY5yYg2Jdn6yPnuogVhITmOlK32dV4GM9ffYLGCuP
 FtfANyJG2xxXAW3cotsp4m1VfFQGdWpeqyei0Asl/cGW4JhDHRDNRbSYLctRyxEEurq8
 8gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnDAYVoy4dFPmqfPd9DbquIT23rvABloUcd8Ca4aFl8=;
 b=rySuVRNgHdyFC3qa9yZEvy5kwmn5IIu+XFq+mw1Z4ReftKBAA4Dm0fxcWOvaWefURN
 x0t2bCGCJKQaMDIIaIX/bDcxK9M+R9n8AkvxVx9u2vtnXuB0SB1to4l4b4h9A8mt0qfV
 VqDKSsZ1B6aibWcmXpRvUG7g0IC910D/FdapnNDjRkizEFv+jhM3LAu7djvRFjxlS5sG
 YI5c6VNIqOonbAx9yDCFwfkGQWnvU5eq3ijAEpOv5ti6CzpPmE25Iy/Xkh+qRtl+Pm2L
 BvblRORjJhNgnAf7QFAAnbVJaqPMchXdsjPRgOYRdQnmy65JDKBYm6eHnDIEUapn/7p6
 64pA==
X-Gm-Message-State: ANoB5plqykmGiDoqlL1M+9oFiE8vPEm2e/OJgFgFHa96aTQukzRufBeh
 Go+CIspgYBOGmaK6IjwqlyOmt820716knWfv
X-Google-Smtp-Source: AA0mqf4NToRmxfOzT1fndFvl3p4YzV4oeApsABqumC3ZK1ZZdtnwEMW/nD3d20Rhfz71IUFbIPymDg==
X-Received: by 2002:a92:c044:0:b0:2f9:1b41:d2bb with SMTP id
 o4-20020a92c044000000b002f91b41d2bbmr1933218ilf.152.1668205048051; 
 Fri, 11 Nov 2022 14:17:28 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a928e05000000b002f611806ae9sm1113457ild.60.2022.11.11.14.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:17:27 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] test-dyndbg: fixup CLASSMAP usage error
Date: Fri, 11 Nov 2022 15:17:11 -0700
Message-Id: <20221111221715.563020-4-jim.cromie@gmail.com>
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

more careful reading of test output reveals:

lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

That last line is wrong, the HI class is declared.

But the enum's 1st val (explicitly initialized) was wrong; it must be
_base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP param).  So the last
enumeration exceeded the range of mapped class-id's, which triggered
the "class unknown" report.  Basically, I coded in an error, and
forgot to verify it and remove it.

RFC:

This patch fixes a bad usage of DEFINE_DYNDBG_CLASSMAP(), showing that
it is too error-prone.  As noted in test-dynamic-debug.c comments:

 * Using the CLASSMAP api:
 * - classmaps must have corresponding enum
 * - enum symbols must match/correlate with class-name strings in the map.
 * - base must equal enum's 1st value
 * - multiple maps must set their base to share the 0-62 class_id space !!
 *   (build-bug-on tips welcome)

Those shortcomings could largely be fixed with a __stringify_list
(which doesn't exist) used in DEFINE_DYNAMIC_DEBUG_CLASSMAP(), on
__VA_ARGS__ a 2nd time.  Then, DRM would pass DRM_UT_* ; all the
categories, in order, and not their stringifications, which created
all the usage complications above.

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
2.38.1

