Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBA401247
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 02:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DF889A60;
	Mon,  6 Sep 2021 00:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FFD89711
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 00:56:38 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id k17so2952547pls.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Sep 2021 17:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hoODny8qbNq0fbRWQr5Q9btY7qNZvjPvU7PoOZpo0Zs=;
 b=OlrEyhwEFqz967G7SxYW9KsmJdUdR7F3jvulUNZg81MbcdB8ku/jM8Gj8x2LGUsvrw
 wvoQOk5WS0IJaEhD88dukaz6g17g5ZoOBr4RNKNWACgEYtkljNHxRCXU9I2jT+UhWtAT
 OXca8lQDpv5KBbWJlap1IXJyEkk9N4KhsHtoe89DULLWlUfxg5t9EFkbP6MA2D/XK+60
 2udywR5whU5zJZmSREDC23g89PoA0O5nVr/DTRY22pEC+HEL2FIhHzhxRDoHBqVrdcWA
 i4Hk1Fdppk9zpD6C00jq4XHYcsynVlwhA6d0r+wtslul6ZImBFGb0UAICO+Ox1jYKC1r
 gFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hoODny8qbNq0fbRWQr5Q9btY7qNZvjPvU7PoOZpo0Zs=;
 b=Zj64JuJZDR5mzdGJEV5xiUUPyHiy2aF2OMvBQg4b3fE8+huk7/YGxyChM+fXq/9LZX
 iIDpUiFLi0EmHRpI2xCfi7Y8lWeb0/0zAxLZr/IRbfFs6ly8ZLEa3bNicIAgMhmLSGfs
 Hh+fpqlDyhdA7BfQFqLimJtmLIrjZpWFT7TwCOYSOWfqKGznN0kBQhU96xXHBWIvk7Gm
 vTRMK77RiVJ77tJRyaD8H70Pk5guMAOQ7b3vwOEq6ybJ40aAwSxRT9O+G4bu6DG7XiFw
 2F2zVK5cNiut49niLszIz5S+Jm8jE61Sic14awCejths4Jq+dXp9sFonAm/52f0STEcr
 mopQ==
X-Gm-Message-State: AOAM531TjtuXlLk5v0/rm+nf4poEiJ4mO6MC+FNA+QCEbvOcLlOcOdGe
 FBaxdv97dUSY/tD1nIl540f9KYdP3pj9VA==
X-Google-Smtp-Source: ABdhPJxRPqzeSWwWXx8YXqrxjWPLke2fH1h7j1XR4T8VsM4Q/hY/RMnlwCU9XObDLauzwKj4zCnmWg==
X-Received: by 2002:a17:90a:8042:: with SMTP id
 e2mr11340397pjw.47.1630889797528; 
 Sun, 05 Sep 2021 17:56:37 -0700 (PDT)
Received: from localhost.localdomain (52.55.96.58.static.exetel.com.au.
 [58.96.55.52])
 by smtp.gmail.com with ESMTPSA id c15sm5444810pfl.181.2021.09.05.17.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 17:56:37 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/nouveau/kms/tu102-: delay enabling cursor until after
 assign_windows
Date: Mon,  6 Sep 2021 10:56:28 +1000
Message-Id: <20210906005628.11499-2-skeggsb@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906005628.11499-1-skeggsb@gmail.com>
References: <20210906005628.11499-1-skeggsb@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

Prevent NVD core channel error code 67 occuring and hanging display,
managed to reproduce on GA102 while testing suspend/resume scenarios.

Required extension of earlier commit to fix interactions with EFI.

Fixes: e78b1b545c6c ("drm/nouveau/kms/nv50: workaround EFI GOP window channel format differences").
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: <stable@vger.kernel.org> # v5.12+
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index f8438a886b64..c3c57be54e1c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -52,6 +52,7 @@ nv50_head_flush_clr(struct nv50_head *head,
 void
 nv50_head_flush_set_wndw(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
+	if (asyh->set.curs   ) head->func->curs_set(head, asyh);
 	if (asyh->set.olut   ) {
 		asyh->olut.offset = nv50_lut_load(&head->olut,
 						  asyh->olut.buffer,
@@ -67,7 +68,6 @@ nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 	if (asyh->set.view   ) head->func->view    (head, asyh);
 	if (asyh->set.mode   ) head->func->mode    (head, asyh);
 	if (asyh->set.core   ) head->func->core_set(head, asyh);
-	if (asyh->set.curs   ) head->func->curs_set(head, asyh);
 	if (asyh->set.base   ) head->func->base    (head, asyh);
 	if (asyh->set.ovly   ) head->func->ovly    (head, asyh);
 	if (asyh->set.dither ) head->func->dither  (head, asyh);
-- 
2.31.1

