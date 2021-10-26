Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD143B14B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0632C89CC4;
	Tue, 26 Oct 2021 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B41A89CC4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:32 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id v17so13154521qtp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=Goj4gTT4O5t+YUsAYs5tnCbkO/VEDkjlieeYIWOKIAEPRUn/SkOfJbSxy04aq1WzEK
 PF8mUm23zlMbaFjYu5D1j8qebNn+BaxC31yvDgRFwx6kVoCdvjpN561AzgAzYu/nRM+P
 GaS2F4dDeA4YyjSiXx2KNPtfoxenaP/Qk949evKwoiVBB1IWw++j1oA9MR/NEc8fux24
 USLGTNYtVy6MWPEd1dLprhmyGvt1+2iKE1g2PCkfN0wZS8cgsmwlODFibQmzHu2OKsum
 nERzYk7X8uGpyUoQz9+rmxA6GDyjTLx+IxQCYF/AFJbgh7+8+guT6ZfnikszvbCVQz4J
 KCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=bvU3dyZXF78ciIqMH+f1KKzFOIZmRp1ifBQ4TRvkIB4Szkc9u8Erd7t4WA5JdMcUQH
 V0PztouWZITKtY31+MK/jomFParzkLeiZgwZXOQHww4nVIZ7I0ZQ7sihNktacV+HYenY
 SvvTOIQA9QZIby07Bnh+ncWVA7b0ua/Nml5Aet8Num2obmHLz8oVA+N+8jxleNtE3s60
 RA2kLE4/nCl/bly3rmHZoWrW+sF0dao5QIEzFmpMZufzAtqzy6dMdtssqEsdJmyDUQsT
 EH+zIHhxLMWYTcp5l9YotkIgm+Me8PhmrURVxpVcvC2lZ7mLUMU07/Z50TjfdPh7Ncoj
 dBDQ==
X-Gm-Message-State: AOAM533WFMiQAbLI9aCH9V/oc3Q1sISoKHhyJKqkdHzRpSYvBbeCdRCY
 XE5BF6unrdLNeCrO5rwduyA=
X-Google-Smtp-Source: ABdhPJy58bgE5ig1WKtumIXsNvAjAio5QYt9toq4UiCMJEzyf6moIAN9g91DGOK5SQKnlR/OC0ovyg==
X-Received: by 2002:a05:622a:1a2a:: with SMTP id
 f42mr24307335qtb.381.1635248071550; 
 Tue, 26 Oct 2021 04:34:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:31 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/8] drm: vkms: Alloc the compose frame using vzalloc
Date: Tue, 26 Oct 2021 08:34:02 -0300
Message-Id: <20211026113409.7242-3-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026113409.7242-1-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
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

