Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782E42317C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9BC6E456;
	Tue,  5 Oct 2021 20:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0C76E456
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:17:25 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id a16so479944qvm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiKFws1LTfnXE8+X4ABwTgmNjXHoNfEwbCSS8ItVQas=;
 b=co4EnEkfrgrh7fi6J4fu/8uhxJYKeXyHmth9reo9jbIBZbS+fSN/s8x2BbsDKciN7U
 PKafyY2LqLULq3yg6bbKD/RzLNdPdqAxvt5+IwTSD7kmQWpCXtrjerrzI/RmwSuHpi5n
 thMYBJMtNrz/hx0XzHIZY8wj4wXK/EzXVBc+2hj8fjgy1fCv+WnbdoOGp0rO8oXUGD7d
 uQlaGj69Gk1I34xp3N+T7dDrgwi0J9fHHNiJns3abwigQAA+2dSc0+zBqPFSDwWa8z7f
 ll8aciJHLnIoJoWh8IL7AaN/oQdYnzjv3rbstXUaummgWw0AK3AjQ8wv66d/+Rn6zTMX
 GQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiKFws1LTfnXE8+X4ABwTgmNjXHoNfEwbCSS8ItVQas=;
 b=Mw2QmBypvdEBTZLP3f9Z6pj62UJ2fYghG9gpGHyjQE832XgMdAO3sbUAq1G2vcGp9G
 i0ApNwsuNRFYZy8s0ycqjzoghld6zKcBN3rid9QKYB6+y8dRGcRClOlhTHCm2DpVfCAt
 j9rqPjpLAxGJd8VMWPCzYgA3hAPm2wAbXK2dO4WQSPM46Bx4zoQ9uCeaAV1sWnie+z84
 FezwDgg+qp2Jh15kuYmV/+X/rBrIWiQ7MCjp/drYU97fgbvzjTLfHPNpdAattfXAdIVl
 bKtdVSs6yCDx8e082yEq2M6LurzoCpru99Dkk64brZG7QBwJl8Q5Lp7/pjnIl7mtlkRz
 toSg==
X-Gm-Message-State: AOAM530zMEaVc/ItF458nPqWYzTMxIN5HMruXT6kiDmFyeOs6naHkQ+g
 f1rWtRvj/gxrTh0fQQIFtJ4=
X-Google-Smtp-Source: ABdhPJykS5ENlYXTGS/IxtP8RHgN1eD8BM3QPEdDjOciJhZSrdbmvO+fYM+ubtj3euqoGI4Ag4zl6A==
X-Received: by 2002:ad4:4d07:: with SMTP id l7mr2128853qvl.32.1633465044206;
 Tue, 05 Oct 2021 13:17:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:9b98::1007])
 by smtp.googlemail.com with ESMTPSA id j2sm13056905qta.84.2021.10.05.13.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:17:24 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: [PATCH 2/6] drm: vkms: Alloc the compose frame using vzalloc
Date: Tue,  5 Oct 2021 17:16:33 -0300
Message-Id: <20211005201637.58563-3-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005201637.58563-1-igormtorrente@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
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

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
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

