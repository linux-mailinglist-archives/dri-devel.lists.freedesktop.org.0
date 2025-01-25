Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAEA1C13F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEC510E299;
	Sat, 25 Jan 2025 06:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EJMpl8mK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560F110E27A;
 Sat, 25 Jan 2025 06:46:39 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3cfc8a2415fso5390025ab.2; 
 Fri, 24 Jan 2025 22:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787598; x=1738392398; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ft3kaHf3s63Qx64Oiqt5pWkoJOlyyMIiN2I4om5s3ck=;
 b=EJMpl8mK1q/x7xI91ilSQyMbwcg/zp8KnXALvJPeXdVUWuvNjJB2a9e9lvYtbw/hNv
 vcA4NYI7s+kr+sAD5EphyiK5ZjLnfls2krBQiyA08wDZvzHp+Zj4V9mO9+yRvyHJO/hl
 WF1s+LekPBrb/Raum9RZeD13PKX4H9K5KBWrSwIETENKVi5jceIZxXcVmeZY8fF6S4iu
 imzg8Hx50O9ARbBTBbODCBPPoGW3KERebXHtI2XN80tVbHpRrAgqWCu0wgcFWAnxQ1LV
 2pQQ+jA2oX+mJTlag/5+o86HpaGDnD4tg2VYu3YT6SZwuCwlKw+thH76WADgRX3mNfNL
 dPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787598; x=1738392398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ft3kaHf3s63Qx64Oiqt5pWkoJOlyyMIiN2I4om5s3ck=;
 b=nj4p6pyQ1cZABJinobhxczZ0xssbBz4v0UadOoZr3GmOZWvrKsc9k6KgnylcghoQ4m
 XJlJu5TluPBbC7cAQMTe/in2jXUjwVv+juFCwBa5/ZUETOn2QlrKBs8wdn1xlaNdB5SS
 ljMQpfypaIzFNY3zd/4cS55DY18HTJfhiz0kZKzcd0LzxyhqTdjTr69ud89KdhtHknnN
 w4KLkBC8y17WL7/o9SyDa/PO35a9/g53KM/z7rAqEYnRJLEftvNfEUzdFwepBvNJRcqs
 AUbn8AVbYMUybfp0jx1KvTq5Nz171W1Wqq203gsmfEGFdlZkiB+a1fLdn+e96r/csQgj
 HJZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVsZbNuPzvsP5vw8MWojB8lmHIwDGT5DWXf5xwbjdIwEJz4iLYrLuIEbzd0PiXWdyqf660Gs4+@lists.freedesktop.org,
 AJvYcCUu7Q13WrYINITVlWBA8DyVious53C4/sslxy1GGtnrKWBUKQ2vMt38MFWrH77pHrdceLZlalSk8srx@lists.freedesktop.org,
 AJvYcCVwGkA+Dlp0NyK0CD/yr8pSxjEC+qPJ+iIV00/3LmqLJ+QxeEX3AGiJBP2ECMRctARcieanPIkIMmbdgsdOsg==@lists.freedesktop.org,
 AJvYcCWLj2y28uEqulhRZqcdOw92/JF2dR6Pa5fMECxgaluDBgpp0F8l6gGAL7UQPwbnxtA6s1Jh+R9pFRDP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+y9HzQzIUL98V3BwBT60Z7smy0DqrAEt7e1HalYmwIcZxh4ub
 MMT02e4apjrsgYv+Hy2VYoDIvATWqGvPpTlce4OkDW4igsp9SASA
X-Gm-Gg: ASbGncte/k926EytsbiQZMutH4newhIS7SZCYL0EWp52+NVkiSM6CMC00T6DbkULXny
 4uQ+DIiojGlvUpjwFBIIxzXf1W07exog32bhqpvSHR2040ZkXlSWMhge4W1wZWxLUyCtrVyl3gQ
 Grqgm00CvGGPgfRin+ttNe/fQ+3kU717mfEmKeUgAp/qIExq+JUcYtwvH0ko+okAdz8xJQGAtvU
 behsxD/SGGMLrbZjK1o7B0aS4r1TMkc294y0LKLDMbeBvcAjObAlW7JcAGRg4X3w/qRkfk++GWE
 D8ogNjKvPNPnM87wEbhR5HeSYS1uf1X0SBaRDw==
X-Google-Smtp-Source: AGHT+IHVQ3SPCoXjVUywLVkrU9R+6hMn47R/0EYJi/tmo6RYCSpS/s01/z4ThGKSbkXCoFQMv2RC9Q==
X-Received: by 2002:a5d:9f04:0:b0:851:f176:9827 with SMTP id
 ca18e2360f4ac-851f1769e4cmr1422016139f.5.1737787598471; 
 Fri, 24 Jan 2025 22:46:38 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:38 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 02/63] test-dyndbg: fixup CLASSMAP usage error
Date: Fri, 24 Jan 2025 23:45:16 -0700
Message-ID: <20250125064619.8305-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A more careful reading of logging output from test_dynamic_debug.ko
reveals:

lib/test_dynamic_debug.c:103 [test_dynamic_debug]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, 105,106 have LOW/MID and MID/HI skew.

The enum's 1st val (explicitly initialized) was wrong; it must be
_base, not _base+1 (a DECLARE_DYNDBG_CLASSMAP param).  So the last
enumeration exceeded the range of mapped class-id's, which triggered
the "class unknown" report.  I coded in an error, intending to verify
err detection, then forgot, and missed that it was there.

So this patch fixes a bad usage of DECLARE_DYNDBG_CLASSMAP(), showing
that it is too error-prone.  As noted in test-mod comments:

 * Using the CLASSMAP api:
 * - classmaps must have corresponding enum
 * - enum symbols must match/correlate with class-name strings in the map.
 * - base must equal enum's 1st value
 * - multiple maps must set their base to share the 0-62 class_id space !!

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
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
2.48.1

