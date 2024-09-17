Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B9A97B557
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 23:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8F910E231;
	Tue, 17 Sep 2024 21:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rz/MvnPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5410E009;
 Tue, 17 Sep 2024 16:31:53 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2057835395aso67356375ad.3; 
 Tue, 17 Sep 2024 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726590713; x=1727195513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d27QiDpZTEWMptlUUQTdMGUQ8QM0KhEAFxduxL82zGo=;
 b=Rz/MvnPhnoTUMCTxAEWMGwBVxrJ7oWEsIYJdtehvWPsQtqlsqDJvadwnnpO8ikK66P
 qauZBFsgZ90Dl+ZEkzb9HVxhQkzk4IWicjRuj4lf5fnVQbDplElJHVh1xIMRCTf8oTps
 wsME5NysW4Gi6A3XDTPrc7opqQfxw7Xx9nIzVJtjcPwg7NdECO8DA5jB8inyqWSfNeh7
 2gNgUDTN/vdUpvCRML5rsR0BY5hh7dew7Xy+RlW5JbMtwDvrUqISkY+VSDB0W8Le4L+k
 3dI2iGA5E9yxQZhJTfW+sEFX/me9fqx0UaApqJl7IDjrPyMqEfLXP1P3VKi4ZsRvZA4X
 bSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726590713; x=1727195513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d27QiDpZTEWMptlUUQTdMGUQ8QM0KhEAFxduxL82zGo=;
 b=YEFBqgyh1iic6LHDEDG1YubfQLVrv9ZiJrjOWzKQCA+n9JVscF4Psary1DGbhhc6TV
 89uxBorVV87PuukCydr8y3iG8fdWb/kTVV6aQ1s43abLVdVxt4larrpCPROmtGKwNw9S
 ds4raQyPWOeZY3oSe4uuoueCyc8CaQDfw8vbklZEWPl3h+/TFICAQM9VXFZkKUm4Rye5
 /r/7LMRv66avfYZvWeAgWTHmwvyJdcBPjNd0KEYsimEUWkUuiu4AR3aEQDc2omYxeWx3
 +R/XdhLClvCcTVmnL/pEg/wq3uTTMz7nvOmonjo9KA5C79pbskb75xXG1KqWmR00fAsP
 9zWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ2P060JepSDVJ/aysP1mrPn+t7cFnJmW0LLrKcksDy3038nKcj25gCh6TOa9Y8NjqdOOxRs0PJstq@lists.freedesktop.org,
 AJvYcCWwLVRdoobSaRVySJhEWg/02ATvgCKacCvhcNv7iSEVITMkYwjfs+Hhn4gD9jaVaVpI4RUiGL4n@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaDaBtdcZArfdrJT1PD05xeY1RyqCxHUxdi+s7lMTPlmsb6HgU
 FNXuOjscBXdSOco0jr5XQ7KOH1rQ354HlaWhqcXeiKjh7AQIyR/s
X-Google-Smtp-Source: AGHT+IFFlrNfeYfMhMuiPypYqGCnUQvsDDZj3HK01mH9YI++IePCMwELFaevFE/102AniKVZ+sAUMw==
X-Received: by 2002:a17:902:d509:b0:202:28b1:9f34 with SMTP id
 d9443c01a7336-2076e41cbcamr299882855ad.56.1726590713151; 
 Tue, 17 Sep 2024 09:31:53 -0700 (PDT)
Received: from dev.. ([129.41.59.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207946dec8bsm51854065ad.163.2024.09.17.09.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:31:52 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] drm/amd/display: Fix unnecessary cast warnings from checkpatch
Date: Tue, 17 Sep 2024 22:01:19 +0530
Message-Id: <20240917163119.890276-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Sep 2024 21:49:04 +0000
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

This patch addresses warnings produced by the checkpatch script
related to unnecessary casts that could potentially hide bugs.

The specific warnings are as follows:
- Warning at drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:16
- Warning at drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:20
- Warning at drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:30

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index 41ecf00ed196..3ab401729f9b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -13,11 +13,11 @@
 
 static bool dml21_allocate_memory(struct dml2_context **dml_ctx)
 {
-	*dml_ctx = (struct dml2_context *)kzalloc(sizeof(struct dml2_context), GFP_KERNEL);
+	*dml_ctx = kzalloc(sizeof(struct dml2_context), GFP_KERNEL);
 	if (!(*dml_ctx))
 		return false;
 
-	(*dml_ctx)->v21.dml_init.dml2_instance = (struct dml2_instance *)kzalloc(sizeof(struct dml2_instance), GFP_KERNEL);
+	(*dml_ctx)->v21.dml_init.dml2_instance = kzalloc(sizeof(struct dml2_instance), GFP_KERNEL);
 	if (!((*dml_ctx)->v21.dml_init.dml2_instance))
 		return false;
 
@@ -27,7 +27,7 @@ static bool dml21_allocate_memory(struct dml2_context **dml_ctx)
 	(*dml_ctx)->v21.mode_support.display_config = &(*dml_ctx)->v21.display_config;
 	(*dml_ctx)->v21.mode_programming.display_config = (*dml_ctx)->v21.mode_support.display_config;
 
-	(*dml_ctx)->v21.mode_programming.programming = (struct dml2_display_cfg_programming *)kzalloc(sizeof(struct dml2_display_cfg_programming), GFP_KERNEL);
+	(*dml_ctx)->v21.mode_programming.programming = kzalloc(sizeof(struct dml2_display_cfg_programming), GFP_KERNEL);
 	if (!((*dml_ctx)->v21.mode_programming.programming))
 		return false;
 
-- 
2.34.1

