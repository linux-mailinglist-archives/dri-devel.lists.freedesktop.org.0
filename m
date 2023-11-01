Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B3F7DD9F0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A1C10E619;
	Wed,  1 Nov 2023 00:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53F610E60C;
 Wed,  1 Nov 2023 00:26:34 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-35809893291so23023405ab.1; 
 Tue, 31 Oct 2023 17:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798394; x=1699403194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=NerEQOVfXoGRp/A2XNOM2c8rONLSxZA10/xm2xHfvUUgJbrZpWnt4ysWntBt3grexY
 WS6l0MksXRGjVRv+cgb2mNWRe3GXB0kV9IdbrWKcvoOJmjYm7J4WJX1oxF7OnIeyYGus
 YIYkfsG5KTJzMN28VXOUG/yO4lHTHmR1Whcw7ZtuZeUtwSxoJFy9k24vvL7kLgUJMWFz
 NnYt/TX+K7YQKG31vvGC7cfiivn7mlkOBCHmP3hkFJ8cCNTFJPKkJCEtky031CB9cxzN
 rgsBFHZLTjDQo6oIqk56K5Ucj30TWBjhh1dNa6WKNq8WdE1hCcFIV1s6TW67zBLJ6nLC
 jrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798394; x=1699403194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
 b=Z5YPjZCNNIMzagTLx2crWVPsJ3SCxE0mkIK79nXQcoxSEMgOWMhhRJ1TMBTgt/IUcC
 AiwslY8qqmC7Pgqs3JuKvm8E85I3m7B2kHdhDZTeyAOS4lNbnfDwJr95Vbqmp4BEGavS
 ZwG4qiSfV6tXJaOYmL2O6rxRf7XpP5alglKD/XuuKmpyc8CoVCTg3rtOZiOFUHJS+q0L
 DSk6DA0dBabnhMZSH23QII4Jofefc1zqhAbUD4/BEprhHcsLSYYnZ50fYN6qadh/dcfh
 aXxEJ2eMk+o2VAHMtd4POwa2EIAsK8RNmplmPwENvk/rssA+apMtFE1clynPn0hT3L/1
 W/EA==
X-Gm-Message-State: AOJu0YytKzQqmCgn7UNDagUxK7wOganqOLsnIviuz1vcSG2IWutl8OZZ
 0gEj+wR8AkiZFYVl2dk5Q5M=
X-Google-Smtp-Source: AGHT+IH246yK5XoAuq8aFwuTy3IhmHQfJeZAmtaH8z4ascPRKOZJiUIEKC/NefNQ28TvH8PRxfb+Ug==
X-Received: by 2002:a05:6e02:b26:b0:351:5a77:f169 with SMTP id
 e6-20020a056e020b2600b003515a77f169mr18404169ilu.29.1698798394030; 
 Tue, 31 Oct 2023 17:26:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 12/23] dyndbg: reduce verbose=3 messages in
 ddebug_add_module
Date: Tue, 31 Oct 2023 18:25:58 -0600
Message-ID: <20231101002609.3533731-13-jim.cromie@gmail.com>
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

