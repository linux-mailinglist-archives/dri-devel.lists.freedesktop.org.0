Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34343A153
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6733189CF9;
	Mon, 25 Oct 2021 19:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F8F89CF9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:37:01 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id e10so24505534uab.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=PlANtSRA1rym/yuHpq5hDpfqE0nbRxtUgqstn07en9N2u+IBo2RDOCdJNfDOh6TOKM
 8bOF82QUuGTOzoxBzxGAn0U/tK4gJ576Zte559slH9xmBOwN/RlfpHBUkVdpbMYyEQ8R
 Iz3q2QRjXkxOXyDsMGFrML+SlDZndKYOO3nyzZaAEHLTZtmEbAa07FqNuEtmM38I/GZg
 G8QaWqs9L8baxICcHqUka/nybMWW20FkRY+2qk8RnCsHt/jh7pjY7IAXQ5vcelHigBDH
 mc9smzirpaMsHlUMkBwWj/J3IujWYS2GC/PvB94odduKYXCGD3V6NnvTN3fp9VI7/c+W
 H/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=0jkARcOTBgLFWy86ZHg+r+1pXtEMY2OUQToT9bl2DFUSkhdWKXqxjMtC8vrq/4K1ng
 WwWBIRspMypFfT7any1DPS14OD0t1NzQRPytyGWRpethOX0Nkz28UV9A+RGVJS9P9O/V
 xDsY9N6QIVQkQz+19azN/s890KD1eUu9+rbz/J5o7LX9cikk2KQPibsRAn/PzhK4/avz
 vfDovjyAadmXvfpHSMR8qBI8y2lTx+WbqvVA7+Ywi5VVFkL2Tgd6NVFFu9Eu2vKPfpI+
 GdYD0XBPzzbF9bV8ewkHsDrO/96A8nFNZBHMQ3FzaPKCwkqvxpYo+Z7DnQA1HfYbYqHN
 QwAQ==
X-Gm-Message-State: AOAM530nSBnh353FbwSJAIM8K0bpaMMejZBQ6nbDplD4X2dtBXLOMLfy
 cFP58B1H/fbnVgOeaeK2PiE=
X-Google-Smtp-Source: ABdhPJwUeUo+LUjdIx9jpeOaVyyPLhf0p9KTe4AmSuYDGNxs2POuCwgzLAE435Umc8FfwqhfGYQb8w==
X-Received: by 2002:a67:d810:: with SMTP id e16mr17018450vsj.42.1635190620656; 
 Mon, 25 Oct 2021 12:37:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id k1sm10722013uaq.0.2021.10.25.12.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:37:00 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm: vkms: Alloc the compose frame using vzalloc
Date: Mon, 25 Oct 2021 16:34:38 -0300
Message-Id: <20211025193444.131207-3-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025193444.131207-1-igormtorrente@gmail.com>
References: <20211025193444.131207-1-igormtorrente@gmail.com>
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

Currently, the memory to the composition frame is being allocated using
the kzmalloc. This comes with the limitation of maximum size of one
page size(which in the x86_64 is 4Kb and 4MB for default and hugepage
respectively).

Somes test of igt (e.g. kms_plane@pixel-format) uses more than 4MB when
testing some pixel formats like ARGB16161616.

This problem is addessed by allocating the memory using kvzalloc that
circunvents this limitation.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9e8204be9a14..82f79e508f81 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -180,7 +180,7 @@ static int compose_active_planes(void **vaddr_out,
 	int i;
 
 	if (!*vaddr_out) {
-		*vaddr_out = kzalloc(gem_obj->size, GFP_KERNEL);
+		*vaddr_out = kvzalloc(gem_obj->size, GFP_KERNEL);
 		if (!*vaddr_out) {
 			DRM_ERROR("Cannot allocate memory for output frame.");
 			return -ENOMEM;
@@ -263,7 +263,7 @@ void vkms_composer_worker(struct work_struct *work)
 				    crtc_state);
 	if (ret) {
 		if (ret == -EINVAL && !wb_pending)
-			kfree(vaddr_out);
+			kvfree(vaddr_out);
 		return;
 	}
 
@@ -275,7 +275,7 @@ void vkms_composer_worker(struct work_struct *work)
 		crtc_state->wb_pending = false;
 		spin_unlock_irq(&out->composer_lock);
 	} else {
-		kfree(vaddr_out);
+		kvfree(vaddr_out);
 	}
 
 	/*
-- 
2.30.2

