Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF4CD4FA9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4382110E55E;
	Mon, 22 Dec 2025 08:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNXZVyYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3D310E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:22:16 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-7e2762ad850so3930434b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391736; x=1766996536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
 b=WNXZVyYMCJnMr495GarObyXtvFnj28rivxbWiqdDzAfnISPvm/yzdfxZVhQbaH/qk+
 u4Wtt5ub6vsascVn49sNzTXbrFewY1ZeoLAiE2VEVjD3EukEgQqyfZRV6oH686F9UFiE
 mVDUq6zFDpLfA6WnuVLkU11mI+lbUTEVByZhHyBuD9apD8KMTy6JdkwvuHxUzkvfJ5bM
 DwS8FO3g3zAnFDFUGbDsX1eSXFe/j4e7kMNXaMx8VIl1seSR/hH3rU8rMbi/A3wqfzNN
 Tcuv2NPyhK4lcdtPD6JcWZ5WyqQs9fYl02d5jmhvMzKo4ARUsZkKzwEzklaHCqDLO1Li
 ZBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391736; x=1766996536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
 b=mM+XB9SY2CkjnnzOJNINMXPwUvFneMnfd8eyQHdBDEDUMBxD9y0KtR3xYgsGthd6mw
 v8BuyOxYsTBPB4vvbf98oM2zU5jTTanqxo8zF11Ur/TBZo679zli+uG+VgXqYCMiBMl6
 vi3q9JdMwU+WKtzpUzFRw0gwMS2FvzZ86/ANQPt7o62Gr4KGaTlGwd8q8bP2kUnXsaBw
 /OR0OUi0lo8vWyaEMyjffqUoMKwdK8oUc1qzNwFj/v4LFmR5ZBO5Tyq9AU+fHEdv5PR0
 FFDyEkXWjpcZqJex6QJszY7FNAvSCTIuD1ZflMq97lxtF8rRGsK9OWpnkHTDo6nWU2D9
 l8gw==
X-Gm-Message-State: AOJu0YyOrAHoWeGv6jpwGOF8W4NBB1uV/SLh+rE2JcOZ72sZrIJxAkRw
 a2Hlf3jPZIMBkePN8103MUOWmSTCNdMAnJLPXccsZCKeSnw6R7ab3jk4
X-Gm-Gg: AY/fxX5oA/jZ1FLlKQEpdZk8Lt8rsswvEvuUfmSv8pRrGOFoUT2ZT5XcxWfsBy0+IiA
 Yff9nj4fZSWEPdV5vv+8AkNM5oywgqFy6qypp5t9jxCSGVLFbg72q1qPiHsc82j93nwaFpmqXsM
 Lx8y4Q4Azv9blrRVPNjSyXwNofCoM91DuKJl6ipR1WuZluz08PYX8pLSBMKC/iKeP1w+TV3+KMC
 cjkNr4hWsRS2aBujW0BFxSDGiQBmVk7uXQJ68EY5sGV++Xr1BFAF8ucrVWMm9i9/PubqNZJh6Ju
 iSA9/MwmFmAuctray7L7Psy7y0WfI5IS79ByLgX7GK1qmHDOM+Tz/iyyf4FxQmFPKlrcyrVI9RK
 HvrrX5n6svVQlsbc/TBmDnrD4KGQrdkd9ownmIvMEFCNi2OYvEFZ6lv8iG28iSDSH0eZPUKMYPD
 hdNFXLmQ9S
X-Google-Smtp-Source: AGHT+IFHqnkLVdqcXm7bGw59SVF2bpwuPS776EDpm2DBSj3/f5x17l2ZGosn+Y6e7lRKYamOLqvnUw==
X-Received: by 2002:a05:6a00:ac85:b0:7e8:4433:8fa3 with SMTP id
 d2e1a72fcca58-7ff6607e4demr9148599b3a.43.1766391735766; 
 Mon, 22 Dec 2025 00:22:15 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 05/31] test-dyndbg: fixup CLASSMAP usage error
Date: Mon, 22 Dec 2025 21:20:22 +1300
Message-ID: <20251222082049.1782440-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.52.0

