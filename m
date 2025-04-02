Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A9A793F7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D1610E87C;
	Wed,  2 Apr 2025 17:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JcXdTw5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E1510E87A;
 Wed,  2 Apr 2025 17:42:17 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-85db3475637so36356239f.1; 
 Wed, 02 Apr 2025 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615737; x=1744220537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1TeeGBRsVeJpwNeUJAZV2+uEOIfDic0oDGxOSg3WSs=;
 b=JcXdTw5nnNdtqpqY2CFKNKz5aVZShVQSrYsnzqm85CKPCmtH29i18EBVSzI4GdTLTq
 6MD+XUydXguUuxK16MknRGU5tf3fNCi8vOZ+kKFo2tFg4nimr3BCUG0wcKHmeaQKoDrm
 ZE3lGqASJ/Jpr8HuC4yMLdH3QZuuKjOekPM9AdGz9FydvDEg/Xz1bPB7z6gIC3gjYpmC
 ejKaYMHSQClptmnB+xixMZeL/Yn47mjJXPPyMQ5iUA1AdjhExXdY59wx8eCaZ6myVPYL
 oS7kphqAzkrufZY3wnYs+4IgcKc2+kvbxw2WTDqirmGUttLXqbVj9aeNP746es6vHMIm
 MqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615737; x=1744220537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1TeeGBRsVeJpwNeUJAZV2+uEOIfDic0oDGxOSg3WSs=;
 b=AoYZRixIdYAlp3zsRXT/8Rhan1RZKzihkKAOwRuQPhTYq4+Fb/Pto3DcHIDeXiN7qJ
 1PO9n/7fzrIQMeq4m4P2mUGsdg4u5xBwkz6thT1SQjzfNbwx/D22KZw0Ak/YKVaOPCDr
 3gHLRRqDDEFw1kzbltpYh3RoQ7v0nkoGLJMTzVQucxFyP03u6sjq3hOKiYLTri+stsRj
 wS7jPOBRRhDJjiTWGPgtcFMqXHk7o/5tIeReEmP6i96qkQHntdNlsUK70PsaAyJKU2IC
 /kF6BthSFlmsXWaqdveeNmTEUsAfNFk2WoOkaHVzvbez6MW/sJA0XESbYv6e0KAPzmRd
 j24Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPHqR4Kan+4qI1CrYC/ikK8Hwfd2lwdJGUskjw/Heq69BNeeB9D89VHOXFh5YpET5WgPK/QIexIVHk@lists.freedesktop.org,
 AJvYcCXCunYbZLfUC/0sveylFWz8ReuuoAqvmYQiTHF7JBhzerrdt8HG++bIf71I/KR2mDkK+drJevl+@lists.freedesktop.org,
 AJvYcCXVefMrc6Vi+t1GLwtMRAkYYoZOru/3uw4Fd6eSBkQgV2o4S7mEOnYcTCBcpEPpErFx06zU4QbVDuuaZGu/3w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9IE1KHTqZPxsGLCtCvpBsQ8MITXVBcUyTXyum0ygHoXAaJtma
 xJ9vNOCKJGxrRiyR3x4f1RgYZYgRjodfhZSCRW0IunSXgA7wgaDS
X-Gm-Gg: ASbGncv0IbkC5J9Wcyat9s2hcUsFZLEdFwB5Q+Eh3HKnrkwfYRYXfNTaI0wTHV0t9aZ
 b3eEGwaNJmk7Mhge9uTL/kj8Yyyfb9nvMEIl0kFguhzxRSzI+I2rYXwr3dxdThIkEqTKL7Qs/V5
 9Y51R99fr0fY+T3NIDqnVxUk+2zsi2gd4/yUGP8bYDCoHfd/8PrA/A9yxnHA966ILenwxDkt8gw
 6Z0SoHQ6HDXUdGS6vRr/FLBJsZUuq5wDtDJtN6Vcm2raFmlVOYYi4nE08D2XVW9TYauznG+1PU9
 MM2gwbaI1OKX/NVTGEXzI0At3oEhkxkA4QUyijI0aM4Bu7oWjPhsy2/hjSXN5F6+5SqiimHCQcn
 7Pg==
X-Google-Smtp-Source: AGHT+IHivBONAricuMwjJKELjLZ3cw6bOgdRVYxu5GWLbo1Ajc6qDwx3gLg2XMoo3ny+fW96GOp9Jg==
X-Received: by 2002:a05:6e02:1d9d:b0:3d4:2acc:81fa with SMTP id
 e9e14a558f8ab-3d6dcb49685mr7330155ab.2.1743615736716; 
 Wed, 02 Apr 2025 10:42:16 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 04/54] test-dyndbg: fixup CLASSMAP usage error
Date: Wed,  2 Apr 2025 11:41:06 -0600
Message-ID: <20250402174156.1246171-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
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
2.49.0

