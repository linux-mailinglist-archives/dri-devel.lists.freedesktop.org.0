Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951DB397326
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11E56E81A;
	Tue,  1 Jun 2021 12:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3306E81A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:25:31 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id c10so152283eja.11
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VoTWS/87xc9Zjaf7PHubhLBqerJydu+ogYjpwhfGsIs=;
 b=lmMslY4ubfVxIwz2LWrqXBVGTVVGVNWzle3W013SrPxrmS6q6dIFVnicidD/9Q82DM
 fn8C5cmTGKLXIbQQdP3PJdigvjsFWj55V7oDm1+FFVqQsXykbGBjSFV9FTObqcP4/y8W
 5sQKK4r+MXTDRS8fEG6/Ot2Xip5ifl8HH0F9CNJorwF0U1AwdO0MvLaXBVCKFiGclHVd
 ZYhdPCKceVwVfTmXktSTHGI/29wmR0m2WhB9ClSe1e7765nmENO6Rd/qoEwxdQtO7a1Y
 uSU3rCINRhHW9o0yrunQ5hl7W2XUcl/KED2gSAwIAG0RwcxTqnChV/vg6D2ugflzkGBR
 vzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VoTWS/87xc9Zjaf7PHubhLBqerJydu+ogYjpwhfGsIs=;
 b=O/l7SLJBmW3jUfJ2CKjTAO19KC4QesJmVkIXxZjXx1i3XgjVaT32pm8rYlP/Rt9nNy
 GBb8BEkd4fw3yWz9Feto1fPWeKKEB4iPTzTDwPkSUF4MRwl5S2M1Y0cnRETlTpMi8mEC
 MCikyE0iTtrlpCHQF+UxbOkSq/vD5AsBWbau3LmONtnL7TlO12q6ROJfxERzSrXEavaZ
 CknGcoIsobhiOv8MewWW7ToAYJYP4Tv+L4VzceULwm9PMM4C6fJGREVUa61aSdjOpjwB
 jGgsuQ3oJX0aLsqH+RYvm/TMk+/i3sTfjDEYn3GOCe+43cHsihdpsrDQglJ1QIa8iDuU
 WUFg==
X-Gm-Message-State: AOAM5300a2pIpw6KBsdjeTMjnUCisyTlu9kOf/06ZZ05e/xgiSx0pGVI
 OcKt1GCp4F9B4wQN7/ZfT88=
X-Google-Smtp-Source: ABdhPJwJau5PdCv9/th8dvdpo4MwDuIxlTwWMjtVu3vKElftXskoAtmcl0iAO9CX38j5MtQlv0OvvQ==
X-Received: by 2002:a17:906:e10d:: with SMTP id
 gj13mr11811418ejb.150.1622550329968; 
 Tue, 01 Jun 2021 05:25:29 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fba0:a784:4c4a:8bc0])
 by smtp.gmail.com with ESMTPSA id f7sm8534845edd.5.2021.06.01.05.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 05:25:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Lang.Yu@amd.com,
	thomas_os@shipmail.org
Subject: [PATCH 1/4] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
Date: Tue,  1 Jun 2021 14:25:25 +0200
Message-Id: <20210601122528.1643-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lang Yu <Lang.Yu@amd.com>

Sometimes drivers need to use bounce buffers to evict BOs. While those reside
in some domain they are not necessarily suitable for CS.

Add a flag so that drivers can note that a bounce buffers needs to be
reallocated during validation.

v2: add detailed comments
v3 (chk): merge commits and rework commit message

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
 include/drm/ttm/ttm_placement.h | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 51a94fd63bd7..6b393502198e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -929,6 +929,9 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
 {
 	unsigned i;
 
+	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
+		return false;
+
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index aa6ba4d0cf78..8995c9e4ec1b 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -47,8 +47,11 @@
  * top of the memory area, instead of the bottom.
  */
 
-#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
-#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
+#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
+#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
+
+/* For multihop handling */
+#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
 
 /**
  * struct ttm_place
-- 
2.25.1

