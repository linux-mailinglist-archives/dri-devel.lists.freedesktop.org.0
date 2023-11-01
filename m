Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF2D7DD9EE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3378210E618;
	Wed,  1 Nov 2023 00:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C08A10E5FB;
 Wed,  1 Nov 2023 00:26:30 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-359398abeb5so3515925ab.1; 
 Tue, 31 Oct 2023 17:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798389; x=1699403189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hQ8DAFT4FsmbzhSx1IDeWkXEPOHVXkBPwwDIEI4NyY=;
 b=HE9BCQ0qzu3+HhJ3h5RcPVowm25T73/LPGToqj4qaq3BZSpE0AhO9lAuOeYWmklBxt
 hg8umor/zJmm6Fj7FW7bKWDtR91yWCLKRkAM+teIibaU37q8zqmeSLAgjIruzAJxlBKF
 bFexr53clspQiNZErf2Ed7xDmJm34YRNWo+gImv5D7gZckw9syGy67ncBaDpPm+o8bFh
 VMAAz4ER5RW5FlyPomrFFEmgclxvKquD0JgHrGI3xYV3xMFwwLTG8ojj9aR0qay6fnel
 KuVJc6lU50vwDcnPn54WrKA6PvBE2GqBONFwp31fp6lmb0S62bLY+qQnq9wf7s52gIk6
 nnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798389; x=1699403189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hQ8DAFT4FsmbzhSx1IDeWkXEPOHVXkBPwwDIEI4NyY=;
 b=Ab0Sd2PcCf6L/72VUoNEGzA9XgrwlttL+23jflTp2Fq7PqTdv39CDNNi2kdGxfAS99
 i7tZukvZ+DeUAVBAxGCWu3q/heyY4L76ZRFFkyAQ3liCgx7bQ02qoquJoUcQwcpgYrv/
 7Izd1JjGKNW9B+Ap6i+af54JJmRRosqFG3emDzrYDkFrCBr45nqroDBjXT2XZ2M08+BR
 TTxtCX4NU5e6NbhcOSadJuNPmO6mUFZ6VswgBiKOMetK/2ihTobAYmxM5UifXZ1kJdpn
 W4VaXUOrNL/2AcAN01XLTtL+YvGblRWxA/r04v3X01N6LuVsit3KAE+jKhChxEqDn9C0
 0oZw==
X-Gm-Message-State: AOJu0YzKzoRSWcCVGZJcFvZ8YSkjtCHmFpFm03TGoYOxQkQEqkARCO0m
 5dSHEoHVVaKURwug8JK2DN4=
X-Google-Smtp-Source: AGHT+IGoZwyTejPyF/x61C7aax02IFGm+vpxScGEI8nVTy/6kxoXvVD473P14nJ/WTMgthR5yZu5hA==
X-Received: by 2002:a05:6e02:12c6:b0:351:22a2:bbe7 with SMTP id
 i6-20020a056e0212c600b0035122a2bbe7mr18224917ilm.0.1698798389568; 
 Tue, 31 Oct 2023 17:26:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 09/23] dyndbg: silence debugs with no-change updates
Date: Tue, 31 Oct 2023 18:25:55 -0600
Message-ID: <20231101002609.3533731-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

check for actual changes before announcing them, declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b0e11f6bfaa2..b07aab422604 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -591,7 +591,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 				     unsigned long *new_bits, unsigned long *old_bits,
 				     const char *query_modname)
@@ -602,8 +602,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -618,8 +619,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
-- 
2.41.0

