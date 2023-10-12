Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E737C7496
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11510E572;
	Thu, 12 Oct 2023 17:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B047010E55F;
 Thu, 12 Oct 2023 17:22:11 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7a26fbfcf8eso46465639f.2; 
 Thu, 12 Oct 2023 10:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131331; x=1697736131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwbGLv7+qIU1qCKTfLfixrysNO4bjXZnfSqF5055b/A=;
 b=UbcbsXVzGUIle2T/UOVK10PA02iLosKm3iYjiPPR7OufOkyB/VWpdMDD9RITB3WBn9
 V+ouhNDwXIGBPTVI4hCNm8BHKBZQuXGwVHOWjDjultCQW5OgiHEIXvgxCt0P5vcdsmCB
 nsq+lVHlbrpmxig5P14jn+ax3VXA5U/4Pa1sHSmqwE35G9PCAzos5eKyn2BejDbu7Xy3
 Ivw2ZEH6ROaCBb3hptimxqpJOQlC2HXsnaqOXnhi/YoG8n8eRO1Ehpu/9Oz0x9h/QsVU
 oPqxusKteSNVLB8I0F8hm77n6LYwHQvTdCOXz5su2H5StjNlPHHMekSjx1dMYO/p2Ika
 L+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131331; x=1697736131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwbGLv7+qIU1qCKTfLfixrysNO4bjXZnfSqF5055b/A=;
 b=R8nNLSHKwpIDi1C37Xw2ahF9ObOBpS4F+jR4YpRxXJNdWHKsr0p7JdaDCGXKsLreKu
 Kba3BiEigSx6pURDKGDH6tHJPtWygQR1c0RoydgwND8P6jgZa94Havn0ZIzsEHRGhCLu
 lLYcBWse6f05nFcqjBzRmQJOLA2/qJKYWqJVE2HHETRI/GJ1wKKg8YVwLkT1FC3Wiehf
 YdvIuanLVdnDGJBi/nIClyYPil8PiWUDQkVKSxOLmOZTRQrpBYxuybALYR3YT2YQWiN5
 KoX+m38/t/k2SPO5eXUAzcZoztNXgGY+Lwcw74aJZWDItHR/hQlYOTMi2A2Jawhxwdgz
 uYkg==
X-Gm-Message-State: AOJu0YxFQktabdndLCtxodfrNP+sBX+C4XPhJ/ye+WuxqWKaqDAm8Y01
 v6YP8G8RnZ9B5zOaAFlsSEo=
X-Google-Smtp-Source: AGHT+IECtPOLBs2br6sMKT09k7PFb8qWkcW7q5x1QEYhPaTgMqhZEUB2IkNqklsbRaZ6DquL0rs/LQ==
X-Received: by 2002:a5d:9743:0:b0:79f:96db:f33d with SMTP id
 c3-20020a5d9743000000b0079f96dbf33dmr27485863ioo.9.1697131330992; 
 Thu, 12 Oct 2023 10:22:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:22:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 22/25] dyndbg: improve err report in
 attach_user_module_classes
Date: Thu, 12 Oct 2023 11:21:33 -0600
Message-ID: <20231012172137.3286566-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

convert a WARN on 3 conditions, into BUG_ON 2 of them (which don't
happen), and an early return on (!cli->user_mod_name), which *was*
happening, so should be seen going forward.  Maybe this should be a
WARN.

NB: The underlying problem was a missing __align(8) in the
DYNDBG_CLASSMAP_USE, which manifested as a corrupt record with a map
pointer which segv'd.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 974395bf8a83..3dc512fb1d66 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1284,9 +1284,11 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 */
 	for_each_boxed_vector(di, class_users, num_class_users, i, cli) {
 
-		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
-			continue;
-
+		BUG_ON(!cli || !cli->map);
+		if (!cli->user_mod_name) {
+			pr_warn("class_ref[%d] !user-mod-name looking for %s\n", i, dt->mod_name);
+			return;
+		}
 		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
 
 			vpr_cm_info(cli->map, "class_ref[%d] %s -> %s", i,
-- 
2.41.0

