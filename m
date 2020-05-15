Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921A1D4A19
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3D6EC55;
	Fri, 15 May 2020 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14126EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m12so1685824wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2z1DGx1GMlBzAmB3eSUZWfOTFeI6iBgho5FbisW/Pw=;
 b=pV9+9H655kpvsuLfsiErghRSOSMM4nrcS1E1qcDDPx+AUeV/TQlmfPhLHR8Ruln3EJ
 UhIAZfsbDNCYKCGUlDRzAd++m2Cmc9p5XcLRuGTNo1LNPzNO4bX/DXM2GiYuO0z9I/La
 SzzfRHCUrMLyeJj0iFCykw4xiKYa2KqxAiahTCzaC1ceIMyqiMn4O2L6ydO4DMpzCvOV
 CXNX8PMO0WBt3mixQw9zBFjgl3+nBRA2Sym0lz+iwRHON3Tuqa9854cKBugGi4haEWDn
 MoK3NkhYOyRvEn+NYnPyWmiM3TX3cpLaIB6s03DUNU+Aq83z+hr/nKdCNHYACB/MDZA1
 i8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s2z1DGx1GMlBzAmB3eSUZWfOTFeI6iBgho5FbisW/Pw=;
 b=i7R3RMtXo+LwF+Vt6ZhoQ6y8cdNiaS6RQhUshS8PqZZZoRz8DdjmjsSYD6k/LenSg1
 E/zgF0jYWc3PciFzc6ovNYB5RE0KYDldECYrfNq7jNnHBQjGBcbIjway/OkVtBCAqr3u
 iaE7e8B/dRArdu2TtDw/Wm00lGy5LczpFxYLo3Gkpw19P1aEX1JlXlXGhu0RD2goSGo5
 VjePTTIW2wFxO2ARldK0skSBj6tzZSobmzGGSB7TN7rUipnlPZNr4B0qLnt3cD8wzYmH
 DPcOAOzGWPGI/KSO6FnGbhm90cL9o7u0mozfHXd3126l50Y6nNZZZDFUfqAzN4RRyroH
 tN/w==
X-Gm-Message-State: AOAM530LlTK//vB4DjPpdzPHtfYghrf5T+1M2on2eRvfmbYYBQhZQVSe
 OmgGP5dJYy7gnAc90/cwD/2OQwa7
X-Google-Smtp-Source: ABdhPJwOaX7AIaImM5J2f6DeNpLzuygVGRzkmnzOaUCbySkzwdtAuHVNw4u4ynjvfTlMM3+xCXPwzw==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr3155974wmi.170.1589536462169; 
 Fri, 15 May 2020 02:54:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:21 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/38] drm/exynos: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:50:58 +0100
Message-Id: <20200515095118.2743122-19-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, emil.l.velikov@gmail.com,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_gem.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index d734d9d51762..642a276e869b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -139,7 +139,7 @@ static int exynos_drm_gem_handle_create(struct drm_gem_object *obj,
 	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "gem handle = 0x%x\n", *handle);
 
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return 0;
 }
@@ -333,7 +333,7 @@ int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 	args->flags = exynos_gem->flags;
 	args->size = exynos_gem->size;
 
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 42ec67bc262d..0e8d2306c08a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -86,7 +86,7 @@ struct exynos_drm_gem *exynos_drm_gem_get(struct drm_file *filp,
  */
 static inline void exynos_drm_gem_put(struct exynos_drm_gem *exynos_gem)
 {
-	drm_gem_object_put_unlocked(&exynos_gem->base);
+	drm_gem_object_put(&exynos_gem->base);
 }
 
 /* get buffer information to memory region allocated by gem. */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
