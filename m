Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868B7CE36E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A736810E407;
	Wed, 18 Oct 2023 17:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A965910E3FC;
 Wed, 18 Oct 2023 17:06:11 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a6774da682so28097939f.3; 
 Wed, 18 Oct 2023 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648771; x=1698253571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=kypebqYe90W99nJFdhwn7AqBVG9gMmmh+Uccc80eLRKeMko1mdDx8K6F7JKi2Haj8a
 I+i+2YHcqtx4O9qQsnxd5iVyU1QeMNBkIFUMfeT+wEkQFi99yiIrZ9YJCNi+rYjwyVhQ
 Te/F3gKALH50zg3I7pcIuSa+7SG4bZ8DEjJX/pfiRr3mRcbu2FkJQ+DEilL2X2/7zlsV
 SdRTuwT5yCoW7yWHdg6/n/LXv+Jx50OqxT3XXJOWt03x4BqudSNIcxvF19AV1fKZfrFu
 YJXZOqDGOOkblnV4Qa8M90PB+d3jbm+ezecqeJGr0imB9/qvXF7SclU5sXNcINIokQ8X
 TgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648771; x=1698253571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=NwCFR5uKnsvr/ArtaH9c3VjoikMZY6CoExXOr9xnBSJ27PseIwZUfhTc/ZzSVPOAWV
 rBPD0jsVFNloiinwyRBjZacUsJH4ksjCn+LMZ9J0vQlmR570j/jcomG1lNS8yzNdFLzG
 2IjJ6Ln8+W+8IILSdyW/cXdEvsGbkV4ICGfxlX4cw3Po0TQ8ELWWSvearCWJHGYB3Z89
 qtyNw8i+UGz5xrNe5inKCfTs5Qfo2VEOWmAsjbOHLKFJN0D6iQbqxgniwQXITyJpbioG
 3A4oVj32IuSBkF0MoBjLqTodh8qQLdG3/I2CLN5dRViUQ+ScivKCaoV/ZB3pvpPWzpya
 KK3w==
X-Gm-Message-State: AOJu0YxXtOry2pcGqdAUe4Uzk2SUw7dkOCczIePWD+mMZei+beh/Z/ao
 Rp5qzAS2eADEU/URiWrCQ34=
X-Google-Smtp-Source: AGHT+IHum1ge/GWwDaST0JuAEYZc87D2/tvKkvoNp/zjqblabzEj0CgssZzAbnfUTN58qsmnlybaJw==
X-Received: by 2002:a5d:9d8d:0:b0:795:fa0:c13 with SMTP id
 ay13-20020a5d9d8d000000b007950fa00c13mr8500029iob.12.1697648770918; 
 Wed, 18 Oct 2023 10:06:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 01/24] test-dyndbg: fixup CLASSMAP usage error
Date: Wed, 18 Oct 2023 11:05:41 -0600
Message-ID: <20231018170604.569042-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
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

