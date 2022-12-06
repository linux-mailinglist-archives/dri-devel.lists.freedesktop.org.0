Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E838A643A0D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D53410E2D6;
	Tue,  6 Dec 2022 00:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D10810E2CD;
 Tue,  6 Dec 2022 00:34:58 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id i83so2365642ioa.11;
 Mon, 05 Dec 2022 16:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnDAYVoy4dFPmqfPd9DbquIT23rvABloUcd8Ca4aFl8=;
 b=TQk6CUnqoOsZ+GSXEMerTI/bMoADInIl0tC3BAqQv0v8cpiAMfn/KneFyYmJQJsomd
 FEJh13WFitq7Atd2g8EmkI0kwyuN0UL4EsuQUa5JjLrVvNtjx8fvQTWlpNhATsFBIKtq
 O6VQ67aFSyRqwaqUorQwnRA9ZjVZpPOHPVbQsgmevwuOB+ROIbP0Cv1OuekMddawZwxh
 RtMkMdg9NaezYUJ7l+sya5VwonL1BV/ExijyXbgMmtofqFfSFb0oa3mUDXJ2wurZQVkM
 3doYLrTxOeFhiPLNiwcLy8kHHSV7Qfkwje6MEa58whtCJIA0lko2OauHuFFZfxRnwZp0
 tDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnDAYVoy4dFPmqfPd9DbquIT23rvABloUcd8Ca4aFl8=;
 b=RycOvZcl9Tnmr0p75qmWSuTCTL5xdgs2NrCtWNIrU0+ekwwcDAhqCRDnI/ZSisfnny
 4I72ETt2i4+64VDgkVdb6aKQpR3rzo0OZ7+nLmR6Id9VDrmR8FpiNOq4cq22AJMGOSZy
 CWCoDDaLGir+d4K47i60UNGGL6nSM1zhr0RB3PiBI5A2l5MBXgV+VIsy/nDh7Fba9/wW
 ZNpRu/8eXCFMQv3aimnxChksJPkVdmly0G2NXAmbJkkJNsC9sSQyB4I2dS0gieZGKSgs
 FmCDj4O3tn2Yaa5Sksjipm1kBL5EpZFx37cNp8TwH4lOEL1hgN8DD/SUaF0WT05Bf0lj
 /Q3Q==
X-Gm-Message-State: ANoB5pn7rx4BDvgKLFq+Wp4piooWFcy4UmTF85UNJuW0yohgW3h2xZHB
 488DCkV7u3aR9Yi1i6IdwYI=
X-Google-Smtp-Source: AA0mqf6Bm0S1ExgIZipFgzEZdlH4q3+aKyRo+Nm8PQcm/Cg2Eo2308mplHUGsDA9FiD4SWuE07cGRg==
X-Received: by 2002:a05:6638:36e5:b0:38a:53d5:1488 with SMTP id
 t37-20020a05663836e500b0038a53d51488mr1859208jau.146.1670286897295; 
 Mon, 05 Dec 2022 16:34:57 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:34:56 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 01/17] test-dyndbg: fixup CLASSMAP usage error
Date: Mon,  5 Dec 2022 17:34:08 -0700
Message-Id: <20221206003424.592078-2-jim.cromie@gmail.com>
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

