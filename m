Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C47C9092
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6B310E646;
	Fri, 13 Oct 2023 22:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7AE10E071;
 Fri, 13 Oct 2023 22:48:32 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35769ea3194so3324195ab.1; 
 Fri, 13 Oct 2023 15:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237311; x=1697842111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=g7sUi2JU3ixP2zKDfu+0XupaTVBZTh9Vy8FvdgoCBiYMs14uHQlq5pGW8tvG8FUcSJ
 2Dt/IB52HwC7BEY3Kq9TS8bun4lfRTRK/vdcLsHrKDIRTWW4TKUYMj4/Uf45f6Y+Ot3R
 54VmQXK7/BdCplQh2Op0KDCyOF3Zq9ut/C/1DHT2m3yDMCGDu2CN1VHQw/4AiPzsnCYe
 vh6asqeF6UiZr6S3XdEBMkzweyG8UY0UJoFJ07E8jxmUTLfhkaehibt5iVV8QmbxPUAh
 UVhhYsEQHcXmHj1RLRwxQbApv5oCOu4equ1h22xMpQ0/G0Tec5kW34pE4uHrudp2FqOE
 7PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237311; x=1697842111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=IYEG8XTQ+IuLfdIdFBZj3yS/snutvW/SeUYVPLo/YgnTJqQa+NnUd4H1R5zVmQqAy0
 vNwuLe8dLCyB2xtdBeHo376hmCcRytnw5SF4VC/XRad5/7TR4rSG7tHsT4Gj9rmtPoPn
 TWlGWUChIDPIMbm9mV2Dk0gwyuG9qYJsm+bEZFnato6yTmFAkf2PAFZhJRjImjFMJUUy
 pZfOC9J7pYCBYHGfPy65riDyewpT11rp/CaQWGCxQy7EFqd9H8dq3rG43e8DkkJ6xxhC
 c7QuxDJDEI6cmw7rA2mGShVpMhnRLbnSrMSqPqJHdwO6rPCeatPCO6x40ei9DN89i0eN
 Zghw==
X-Gm-Message-State: AOJu0YzE39w0TpZTjDmjrmcSjn7IenOo0sC35I+nP+V8y/txndwl7E9m
 +PdKh1C9YNGYV8Juj64Oluc=
X-Google-Smtp-Source: AGHT+IFA5f7XOQ/uqAKJYGMLvZKg+0KHzwGrvWYPW/qdlHycTjD98B73OaNojeXhn7vC/vD7isrjvQ==
X-Received: by 2002:a92:d14f:0:b0:357:6de0:4f46 with SMTP id
 t15-20020a92d14f000000b003576de04f46mr1371393ilg.6.1697237311232; 
 Fri, 13 Oct 2023 15:48:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 01/25] test-dyndbg: fixup CLASSMAP usage error
Date: Fri, 13 Oct 2023 16:47:53 -0600
Message-ID: <20231013224818.3456409-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
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

