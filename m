Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48147C90CB
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEDE10E677;
	Fri, 13 Oct 2023 22:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B996910E66B;
 Fri, 13 Oct 2023 22:48:44 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-35749078a59so9751985ab.3; 
 Fri, 13 Oct 2023 15:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237324; x=1697842124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=UFYqsohfDpscxqbUXsUmzcp0E/qcVtNj4SvPm0/LGsMRo/1J3PkQuDbcaITmoHGa1y
 Df6Bz9g3D3m1OnIu9OMnOYUQQEeCYTZbIKgQYaEicLKUcon4Ury3jl1IbQ4wqi86F8nI
 74k3PsZDVfE/pTvsl1J+KX3tKISA6/sRIpXhUJYebiThaOSnA1O8i3Rj3LMg68F4OaLR
 U1n5s262uOzorN+mEWTQ5XAKLwep9q2zBdm5n0xvWikjSaDOfZfshSnFn7P/BzQYRvbn
 5w+Ls8+DRoID1fq0UU5FnRZd6BreozaLCBBOMbAwaH0a332ATsAp+2lQ6YVhat3vNrOV
 w0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237324; x=1697842124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=t1tOJzpFfbJQx1ciFGqWtgDoMM9VOuBBedWh3Or3iUerauUNVxOz8DaGe5eSX2F60e
 CRX5pnqnvWJmsKiNwLbC3fbJzvT6K4psmO0WMBNdJ50Y1yBlp4egVg8rlcj4eW2YUqPr
 E5hJ727WtHqj4JF2FAynLmEY127o/8z643iPD2AI21s6rbA3vVUxoGJedEsyFDeybIS+
 rjOIcZRUQTyeoDisGZ2zuK6ebC8qcLKtn995yNZBIy6Kpghmbc0PzFsosFhkCYRA7jb3
 5XWMWEB8hSpOQ5eYzdYVhGoxDjqeG249xBjZDZjxV+mOq1Wv5sbz04DsK2tapfPfRpZX
 /v8g==
X-Gm-Message-State: AOJu0Yzk6YH66w2MSBa1Hv12KoJFPUKRzfGeHWLX1onic97kZ7LlU4vN
 RYvX/hoNskSaHE6hT4p6YVs=
X-Google-Smtp-Source: AGHT+IHQw2wXhC/2oHYIYAGyvyYiqI1YXiorq4KT58Qv5KODmOPOVfx0/unPtKoAepPcMV4mVMSdQQ==
X-Received: by 2002:a92:c56b:0:b0:34f:f5a4:3e68 with SMTP id
 b11-20020a92c56b000000b0034ff5a43e68mr37534070ilj.30.1697237323880; 
 Fri, 13 Oct 2023 15:48:43 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 12/25] dyndbg: reduce verbose=3 messages in
 ddebug_add_module
Date: Fri, 13 Oct 2023 16:48:04 -0600
Message-ID: <20231013224818.3456409-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fn currently says "add-module", then "skipping" if the module has
no prdbgs.  Just check 1st and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8beb98a831f5..45870a699507 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1242,11 +1242,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.41.0

