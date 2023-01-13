Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3793E66A301
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57110EABC;
	Fri, 13 Jan 2023 19:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98F510EABC;
 Fri, 13 Jan 2023 19:30:41 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h26so11224808ila.11;
 Fri, 13 Jan 2023 11:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1o5vBUqYZImz4NHOXgCRklT6MZZtgIKbNelpVgr1rc=;
 b=O/G/GtrLDkS5318MosjlluvMht6s+j6sda3zFLrbXEaHuhdy3Ep0v0dq4H3SemVWco
 mbHU/PLBxTIyQr+HKWkeWhY4F15ONxe3ZlSHXvkjdXkVdgIfMREA53VU9Jj14bpejFKb
 bG97tXcxSdnDGjeac8amfJc7ZA1EBBtZq/ZTtgGdh9eDV7Op2JPsuqt6Nm6/s8aZg4O2
 FCfHXEr5/orMZzKROvde4QwLWIJ9SONF9wRfIiL8omXe6zRYbhK7wZv6Z8LYhmBjLIvD
 QLMyIcPqJT6/6oY2ckvy7JVGWZfAFeSeLsASj6eYHjBcqYVZjVmtTWWnSN+jJDwI/oIh
 1txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1o5vBUqYZImz4NHOXgCRklT6MZZtgIKbNelpVgr1rc=;
 b=Nok0g7Nyv9po1Da9AZBZ/fvDR7kjqEROB9rt5MUVghoiA86+jgLYaDTNlX7Vq/i2RR
 k13zdhLclX4UWbhwTmgsDLxtcno3dzoNDTPYlnLRhtqx4lHphBvGSn6RmcPGZbx1BdHo
 9C6+FfPgavQ0fwORolxq3jYdwmG7khuLF7SaS6CumSRi5jN2lOma0ew8twpVXdx1PjsD
 hHK8qizeMwqOQq6xGv5YHsdF/dr+hVvHfu5eftb6YELE8XAh+fj3TC8f4mGBDHkWsdsa
 iq9VD9yAQtO4jMm9/zBAqklWAK7THg6OpRIOxF096MhzR0624e43h5eee7/1rxdavSb/
 Yi8w==
X-Gm-Message-State: AFqh2krOlWGmk6TWicxZEwx0haQxkJCKJb1/lA7jHEXvRgk/05XoWFOR
 P/VoMpSjUupvVHCgk4QEIVc=
X-Google-Smtp-Source: AMrXdXvjHFCUqwgnJISIfjiy5EhLkeG2cldtPBa2NhmQBpy3xoVlCgCyWUpN297fbq27qZozSPjmgQ==
X-Received: by 2002:a92:1306:0:b0:30d:bd88:8a2e with SMTP id
 6-20020a921306000000b0030dbd888a2emr9127064ilt.20.1673638241114; 
 Fri, 13 Jan 2023 11:30:41 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:40 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 01/20] test-dyndbg: fixup CLASSMAP usage error
Date: Fri, 13 Jan 2023 12:29:57 -0700
Message-Id: <20230113193016.749791-2-jim.cromie@gmail.com>
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

This patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP([1]), showing that
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

[1] name changed later to DYNDBG_CLASSMAP_DEFINE

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
2.39.0

