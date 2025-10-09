Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F5BCA72D
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A649E10EAD5;
	Thu,  9 Oct 2025 17:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MxdBUltC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B3E10EAD4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:58:50 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-91524f5e6a8so118537539f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032730; x=1760637530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTjH4sGVjFOYrHuOXXQp8+DmE+GbVi2pPpgMotQBb8c=;
 b=MxdBUltCGjYtzDyl5bwKvwl0amAdd8y6+7zVYo3CyUCyUu2Kb38wRgYidUt3vQM0DI
 ZjQuQ858S+iAZ683+p5GL8hIUUbX2CPceLV6g7QGiwRVkGW17EqWYm7xwOJxyGDOflMl
 Zp7AI2N6J4SMvMF8AvVd271F0B5bLATpqKVF/swIi0GNdTgZYHtKKilIRKDnjooZwn8r
 xWGUF9cz1hUmveMIcYRQ2OxaG/bAmHDMbFEJNvIPKXRCrGfO9wna505NtL6ARagcIcXW
 Ttc7lrS3qwjuptzZcq9HAYiFvl3j1KyE8TObJKSe1qRh5UZTtOgcha/JnQ4JS8V3/tuf
 9g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032730; x=1760637530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTjH4sGVjFOYrHuOXXQp8+DmE+GbVi2pPpgMotQBb8c=;
 b=ZRz88O+oa/PmgcZKzKLW5NKneDKPcHiHzMFjH/GvNnjrZxFxFBbKqsxicFDJLtUPh2
 KN6yjY5Qx8wjmxNRSZUg23oaFh94KGETiH5T+1FFqLj25MVQywX4lK5LPOa/L3Dlo4+V
 06zYb/dqvTimB3iVG4qfPV4434WrvzGtpu/3tU+euwVYhrLN8/BsWxi28KSiSVv9Wv+e
 YA4hl/GCOtUHWfwQAEZdDEttGvqKOWhDzkokeR3aVP601qDYO7NY8zShzB6LwckM3YQY
 qjJnKuds59e7jOqdslMzBJwzmO1ndZk0CZPVG2Nk8JbvKNrxqmqa29Y2J4zSB81NrgMh
 r5nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM3URHrZreE/gP32XjGvf27sOkArBUeAtI6fqFqb6V2aW45Ifaw13gU5QspVZIAmoKOsqjkLjG/Lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6chHbulje9Z9tSnSQ4f+SoR5VYcPrFZzn1CnqzHIr9LvUm+K8
 IVntkEcVgYEsq3uFmsGfNGvfKaJSONOabyEi5CrUAa5ksEq6VCJLdJaQ
X-Gm-Gg: ASbGncus33mfsT+J8/GqBl2g5JoEv73/flpM+Ibvu5QwzpJsn6L5SidM9PHY6+rTalc
 7mJlc4twEmI5vprmqepwuP6LTksuA9a2ZKNT3Qw00rKCAm8bPq476rckA241rfSpaBISPY0PL2n
 hJDOM1fGHSeyEkevvAUvGimao53/E0ek2h/XJ+vMUFXZ2Hx5jXuJXnL6E2s3R8BVygi5SlK0iXc
 oV7NWczamV+z1z2cenxu9Nbfb/mChf2nu2Bqj1jfYaseDsw8uN1CBCObr7Nl0lWu/nfBbVGivuK
 IyhmxGe98AcW0pAdNlY4uJMO1oRPVrrlyvFPSopR94KRTcfwm4jUUbMchFGexJHY2t360ZGqmU/
 hc1CoJ444Wmqzi53vpoHYcWr88CehAOVJcOs+9KFxaGu+7//xF6kdPkaEha6Fbwm9tUUWEACBWs
 mxhEwlAGfIj2C5/dovZOjefxLLdFQoSdAUUGL1zw==
X-Google-Smtp-Source: AGHT+IGqp7iPYqC+hSmWS9kXElNlvxppUNSCrpXp6d0YnM0eWjcHcBKQts/HVhk5zAlEdOdTjEStJw==
X-Received: by 2002:a05:6e02:1a44:b0:42f:8b94:c128 with SMTP id
 e9e14a558f8ab-42f8b94e60dmr60429525ab.28.1760032729943; 
 Thu, 09 Oct 2025 10:58:49 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 03/30] test-dyndbg: fixup CLASSMAP usage error
Date: Thu,  9 Oct 2025 11:58:07 -0600
Message-ID: <20251009175834.1024308-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
2.51.0

