Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11705AC6D6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7D910E1C2;
	Sun,  4 Sep 2022 21:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E38A10E136;
 Sun,  4 Sep 2022 21:42:14 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r141so5678247iod.4;
 Sun, 04 Sep 2022 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lfSfy0OiU9ae6zZc6r/YuzMWOjdJ0UjQGjJ43pXzmPk=;
 b=KcesxilWXRdWpOhaJNS8hSdNzO2vJhvPIX8XFE/aZuuFFV/+3fkufo6o6ElznrbWN1
 hoQZPHbfdOcz8L6sXkvFrKKZliazt6a4HKb0p79Fa2Zhrdr6HDCcI0KK/H9P9yVDZ0Y1
 XOoaExBg1xHhuXs3yHeI8R5l5GWskuW3Z+FVRjyUb653F8P0zqYTLWJiVIDzJ2NhKKTd
 sAM2TckvvjW2cAHdzhkzl7UYgmcQlxp7qgTNOjT2XZzRsRWDv8h0wvTVgRljyvneh0q1
 9N5+8G6XjIRe/5YLV+HiKEXVas9ltjJefKy4f23RAvj1+gQWPwzMCaVO52+Z4MXYdv5k
 T+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lfSfy0OiU9ae6zZc6r/YuzMWOjdJ0UjQGjJ43pXzmPk=;
 b=7p/9yq9xpezZ3uBSRHr2tWpmnh9NOiLc6yrAiiAAbyR/oo6vPLdz69JYEBG/bHBdii
 u/znIG/aJ5up40GNa/gUtcG6b99UNi3qQMHtO1TSMXV03gLZp6sfabvoJowi+HbdPzJj
 L+cVonl3uDdxH3PjK7DB/Zzk1mxx1CZJQlQkH7i8BVJ2DFv2/3dep+1zQhJR3pyJrB90
 6FtLO/0hyBqOe2RbYhCQbCWTkZECajBx92GFLLkJFdYJ/RHnhzdI/Wih1Sc/BZHeXtJp
 sYi9zepxydxMCYU+k48f3ha5LybXbGzWAO76JRDDhPKcSzZl/T5kNtZBHz5/oy5yJpBR
 fs7w==
X-Gm-Message-State: ACgBeo08d1AcooztRepr/Txseo3XRciiksOSMFQ3EZ+du+na7BPIbXFV
 e81Hwusj5YcsB8T/OmiIw9s=
X-Google-Smtp-Source: AA6agR52gEm4o8C36a4sLU4vrMjIM3u6oGZjtYr9bqiC4iAeliEnkHdid9H5R34pPZS4s09WvEyVEg==
X-Received: by 2002:a5e:a70f:0:b0:684:d596:b7e7 with SMTP id
 b15-20020a5ea70f000000b00684d596b7e7mr20134222iod.84.1662327733775; 
 Sun, 04 Sep 2022 14:42:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:13 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/57] dyndbg: reverse module walk in cat control
Date: Sun,  4 Sep 2022 15:40:41 -0600
Message-Id: <20220904214134.408619-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/proc/dynamic_debug/control walks the prdbg catalog in "reverse",
fix this by adding new ddebug_tables to tail of list.

This puts init/main.c entries 1st, which looks more than coincidental.

no functional changes.

Acked-by: Jason Baron <jbaron@akamai.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8faf584f2f4b..7fb99492c16f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -970,7 +970,7 @@ int ddebug_add_module(struct _ddebug *tab, unsigned int n,
 	dt->ddebugs = tab;
 
 	mutex_lock(&ddebug_lock);
-	list_add(&dt->link, &ddebug_tables);
+	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
 	vpr_info("%3u debug prints in module %s\n", n, dt->mod_name);
-- 
2.37.2

