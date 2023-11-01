Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04867DD9E9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F16510E608;
	Wed,  1 Nov 2023 00:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE9010E609;
 Wed,  1 Nov 2023 00:26:31 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3592fadbd7eso5999555ab.0; 
 Tue, 31 Oct 2023 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798391; x=1699403191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=YdgZYtgzWjG2uyM44q6faIfqTSdIkcZCPkG1gjma96SELrw2tURLA5yvT5R22fVXKT
 4t/LEm1utLG0FelQrSeTl13uhxmo21Kd2rVDcdK81JASfj4mRt/7uxCELvLNt2GosA1L
 CvohBB+0g7ng7gDH/FWv+XC86Zwoo65ihMtLB4RXkmKl5/4YFvHB/mvZCxd3F22dXopZ
 vnhMah2nIk1Oit1dnxpx3D/APAcR5VvtmqSfzZQZWfGkb4yOslOgfaFSWNjmT22htFIW
 Py3qWv189/PNAcLqsBUHBNEv0Obi3IBrKvdV+vWkfXCgNN5R6ReaTrOAktEgnZQmAxic
 dwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798391; x=1699403191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=eAjCynNuHkJJLLYYDt7J9SgHs98vq9JbYGeOHhZXzpN3G8m02mMbYX3fyQ9BRV0ZwZ
 HwUFBAE1pTMk7QdhE0vj1TnQl788gYdyDNbwf92cJzNZyNarul3joyXFuj4ZH79C2v+F
 oD7mD+OEWs5MvmYgrcVqmoVG5+gSe8VsKVK0NdDm/VRtSly2IgfnVJa7jPd+7FIYC0SH
 nYjn/M97LCw4y6U1FD7bl5gWwXZVNkl0tyWgQiLdPtgEzW75DsfG7I0PMujP7kYWhOcj
 sJSVgDH5HhBGbisxQSoLN859nqJ+X2J9w0YTq2ZJXkGwQtbyo5pAUoCf9p9XV8Lu1XM0
 WH5g==
X-Gm-Message-State: AOJu0Yx+6+9U4zjr59i9yGKPA4TSaN4RRw2j98I0uzkTGs6a3HAJNFfg
 XxMyEScmpaBx4PMt41FePWk=
X-Google-Smtp-Source: AGHT+IHLrA+Al7TWI7oCthu/wTueYwlD3e3gy4zvovlLPu9I2SiuW1SsLgmgD7dqBCKdf5Mkn/fFyg==
X-Received: by 2002:a05:6e02:1d8b:b0:352:a73a:16f9 with SMTP id
 h11-20020a056e021d8b00b00352a73a16f9mr17731093ila.18.1698798391088; 
 Tue, 31 Oct 2023 17:26:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 10/23] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Tue, 31 Oct 2023 18:25:56 -0600
Message-ID: <20231101002609.3533731-11-jim.cromie@gmail.com>
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

