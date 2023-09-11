Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6479AC27
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD1210E1E3;
	Mon, 11 Sep 2023 23:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB3210E1C8;
 Mon, 11 Sep 2023 23:08:45 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-79834a7a5d8so11665739f.3; 
 Mon, 11 Sep 2023 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473725; x=1695078525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=NdzGKkYm/QaR9+uH75lcXxeS+hEdGgpu0DLdKz3Zsynwxsr3oIOgP05vEntN/nSaOy
 1wVGIrxHxk2Q2DqN36NJj+POuwyJJGWpRb1fZn8SK+FyC2bpzUtXSSML5DizZ01S9NUu
 ib3Dsgwv3lC+9HxSrcjCXe/ycgaLuvYBjmvfMU1OVuRjg6srMqsjjn8SBrQQ8K0nSAnz
 dbDhaMNvIwW8zLCI3AAiLzqQ/UZgi5C5v/VS+aWhaXh5rzKEBSq2hiVqBzsxdTZrNv7j
 Vuquda7xUI1bz9IOEkamorfqQBrqFjfoboK0rxOLS/unhGoEj5HIPVPoAUFg1RCpu7ut
 2bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473725; x=1695078525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6NIZdlLmgRQPJbwwmBZ102ypc9HsrQnlZpRMUUA7Yk=;
 b=qMnf8gRgxLNr+OPsLBEHCRfVkbJcGt4JSFks4qdQYl3ATYTLwv9/kDoXai2ZTiWFaS
 RC+uYCai+Nd09R1EgWl5IjgG4SXtcXMWbBta80o8rDPJcqEtjPBgy3BYOudKbmkYX3d/
 TS4SWOY0PsYCgjTwIamDlvLjsXbB9IprJI4Zmvca7THfyGMY34ZTFGjMGPjlaiAweP8I
 IIX/lw8KgsDLC/iD4o0ZKevRzgOS8pJqpCYlkSYF19TtqTAV4zGZN2L71ddmu9BHYF7c
 LVQQ4FiC/fK/c30zF6bWDFge9kfd3Hb6TifH1Wf9y6NP2snGhhsxqt6vCEKZFD/q9Uq1
 34dg==
X-Gm-Message-State: AOJu0Yz4sLdBHrTVhX78XIZkiqMmo+YQ4TBAVy7jkyXbZ5/5VSaisi5K
 B/Xn9uB0xNWfZxxKtM1iBtQ=
X-Google-Smtp-Source: AGHT+IFDCPReJlF/HoZtIiXFIPqYEeXcnDWZ2HXPByAzvqeS7BuEUfkb9nxR1SNOcZEto4daJII3TQ==
X-Received: by 2002:a6b:fd0c:0:b0:783:6272:afbb with SMTP id
 c12-20020a6bfd0c000000b007836272afbbmr12043668ioi.9.1694473724899; 
 Mon, 11 Sep 2023 16:08:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:08:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 01/22] test-dyndbg: fixup CLASSMAP usage error
Date: Mon, 11 Sep 2023 17:08:17 -0600
Message-ID: <20230911230838.14461-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
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

