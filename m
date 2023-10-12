Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DE17C745D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63CF10E54C;
	Thu, 12 Oct 2023 17:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB5D10E535;
 Thu, 12 Oct 2023 17:21:57 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35749556444so6043995ab.1; 
 Thu, 12 Oct 2023 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131317; x=1697736117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=GEyP3zvNklamQM5NgivbFkeV+73Q0S7w+iOB/GtcDpay0uGmDww2wSGvRnYzJhnv77
 401DdPfWdkjXYdRH2pWysh69Y/IQtsIG1mIxbN57uUj0SDvDdOtL65kHuON+60+0ePJ2
 BWd5cNO4ExnjGmWPyR/vwjiVt5Dk3lDgRVxoZKuRrbC2uuOzmKPu0jduzpg5SVFynuo9
 eebiTf2RepvoS/mgGarKaWkPxe/a2fyoBbnmGsMc5J23IkOVYdpuKl88pe4VInBP4SoG
 Rkd7zT4IiQgc1AkvbmLzctWa/l7SGBF8LbkF52IHF4WxaO5CeRItpXEyCVgwcVu1sBhD
 O9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131317; x=1697736117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=J8CuiPcwQN+VVZ4uP3DRy/YpbJV9krPFC4QeeAEQbpdEqqlrwMRxKWSAxcRCykWzC+
 I/j5drfAPwjaxSdpVD2z3dMGoHG5Bbesz00H+SY5ngvQQwE0uvZhUySblS4gyeOzRy1X
 XBJ9ZR8CNnZVr7Z4IXv5jpGGJmOi6RQQSZ0Jndg98CUnaRYH39LdSmr/no2HxugfLqJA
 rX2TRBtX0l3nuke+6UDvvbaq6l4vq6YOCxbnS6+qHNKZNZdcQw8z4EYzeV0L6GNZnYJY
 RMakre/RrLYVEb4QCyZGbRD77jzfrPU6hma+UEjIca4z1n2WyOV6VythzJjtiTBQU0lf
 ha+w==
X-Gm-Message-State: AOJu0YwPnyYISCtQntWEcMqMcVkPC4+xjLKSdAWhJGhqwrdxUPOU8FlS
 oIwzEJWkfOJdzMXFo8qHNxyPEixv1gk/Cg==
X-Google-Smtp-Source: AGHT+IFsoCgezLff2unJTvYEIKfSqNXTbNy4RrMEtsjU/boWD6E9+G6s4yHlhMjBwIKnpBjZpcfBbQ==
X-Received: by 2002:a05:6e02:156f:b0:351:59f1:5277 with SMTP id
 k15-20020a056e02156f00b0035159f15277mr19761543ilu.4.1697131317084; 
 Thu, 12 Oct 2023 10:21:57 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:21:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 10/25] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Thu, 12 Oct 2023 11:21:21 -0600
Message-ID: <20231012172137.3286566-11-jim.cromie@gmail.com>
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

Change function's 1st arg-type, and deref in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b07aab422604..8158943b350d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1117,12 +1117,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
+static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map = iter->table->classes;
-	int i, nc = iter->table->num_classes;
+	struct ddebug_class_map *map = dt->classes;
+	int i;
 
-	for (i = 0; i < nc; i++, map++)
+	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1156,7 +1156,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.41.0

