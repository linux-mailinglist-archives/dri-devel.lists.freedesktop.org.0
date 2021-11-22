Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D944595BC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1042389CF2;
	Mon, 22 Nov 2021 19:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EF989CF2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:44:22 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id i6so38877752uae.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=VnFcNLJBbH6XHNo3VtHbw/iSK1M9t1Ookz8ytRRwNF5m2v17alycBnWIrZHpzR9IrN
 HRWLtBkNdicGJVcJ3nuWAF4SuTe8vKqK94Ts4uMMGjSh2tWpPILNrtSZLWA93OV4y606
 BeSiMlAp5SE9dEvhl/PhZ6WfCdZLIxpXU73D+R8ieweSHqvCJr7KYkKyRDOGUjyfmXq6
 DY2oG3TETXEvVlFh4q6s7nSPtBLh4pXGL9fuaylsHFByGNdFv8a5ibwPn86Jk7k38y+b
 0iGQZusUwU1AH51ZJwiCgxCil3v+uUMD03uLshmr4hqhBrEH/JVi14P18kdSedXCW1IK
 Bugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqMc7i1j40Y6DJkM28XSTOEIlGNuQurfBNScJR7ESu8=;
 b=Dsv3dJPc/kh0U4fhiLpxuZVfluyePsScXgOf5HYmy1RLFljNhcGa2KT8DuqUz+vGmq
 l9Mql57GpbDe4z0bSohrOSQGWylpxglDkIKe1FUqDDEEtiuCvsCjZXiMpixjL7txMdlY
 1b3kLbk7Qg+LGRRzprTf58Rp+1ZQX2kDe5lePwtPs0s4jqNudYMRdD9/MABjXxMAnMwA
 yCGBkZ9IuyetYNWhQ768Z9WupfHgwIQCq7YFuAmkeMRTPxGswQ+ECrbdhzcK2k3T+lC3
 KsE4xHoZO0kw1ZV9Atnn6OQBP1l71YzkI4jYXZeRVkS6Wk9bRmkc6UhlsOI2dD0vciVl
 sb5w==
X-Gm-Message-State: AOAM533eJ9RUO6lX8oNownwnHxVEzAsRdlC1sY4KDqL5GvS4cv0W+T+i
 QFtGKvxWJvgdcn3xhuM3ISGKY/VyiDw=
X-Google-Smtp-Source: ABdhPJxok6kFcgwI0wg+Q4OaZpbeGfmEDCqdA7PCV/3t9+OEiW4Pz2fGxOAOrQm0Z3rH4IWPyXyD/A==
X-Received: by 2002:ab0:6e92:: with SMTP id b18mr90394449uav.101.1637610261246; 
 Mon, 22 Nov 2021 11:44:21 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:3a5b:14e9:b724:f63b:b22b])
 by smtp.googlemail.com with ESMTPSA id i27sm5269373uab.8.2021.11.22.11.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:44:19 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v3 2/9] drm: vkms: Alloc the compose frame using vzalloc
Date: Mon, 22 Nov 2021 16:43:53 -0300
Message-Id: <20211122194400.30836-3-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211122194400.30836-1-igormtorrente@gmail.com>
References: <20211122194400.30836-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
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

