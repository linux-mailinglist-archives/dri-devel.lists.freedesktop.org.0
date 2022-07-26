Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA758191C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6CD96451;
	Tue, 26 Jul 2022 17:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEF789CA2;
 Tue, 26 Jul 2022 17:50:33 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id f65so13742577pgc.12;
 Tue, 26 Jul 2022 10:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=L6BQD4cXM5g5dYWRDLi8nY5qoHZfLmMHeICkpsIp8/zpGHD7MHsTBwJ0WdnIqyzjRj
 OTnF41mIR4JwzXo7ivQfNKCQlAybcsKzx3mUFAvqolbc4R9nHXtrNcMEWycDpX/j6/nb
 Jr8JHjSh5N1SukZwESLj7sS0l8rwC4FzXIBl9pF/rOuMR9kBuC6TVRXjWfc1oTirfjcy
 1i4iavoi04XDICP8qbX2K6l1eV/ojMB41WZmonDubdpTUm5pUWy5RCB84LLoRjJunYcJ
 AhGXNsMLlYogW/4BqRyjTug/Sm3UTlny21SFIvzA1qAsmseb7n2j3ls7ZL4hpumfazHo
 AZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=gLR0Kurn9cwDPHE8Bz1gREWOSJ8JxRvGjoww9+GGbVK7lykZuNGlU9WgXRVG/dJdh9
 tinUkTq+PgeBg8Dmy6NNc6MohI7LSlt0U2/wzHp8j8ARsu2BYePdm6dMrli2Rp6/ewRA
 j8MkLFt/Qa4mi594F9AB0/oTTf2w0i5fdvtEm19CpCycQM49VhZaZiMTqg8KSMveVPkj
 IrsIXbH9bkO9eXUL18zsPVoSQ7l2Z3o1XCjZ8zlmkj8Qcxw95tfVUZEo0E4cD/VuixqI
 ww1QMFI1ogq7L/j5xlIb4W/RHO9n9iRqLvRIjiCP9vorPK2ValOa/Qxa4V2wqGTGIYe0
 q0+Q==
X-Gm-Message-State: AJIora91M01kmU9C+N6vHipJZQNHsU4fSxZTaR2p8G0AgK3Kuc0StUoc
 sUhh8ehZvHOyvB8khHfmj2Gium0nZhI=
X-Google-Smtp-Source: AGRyM1vCBSG+2MrD8YxRCZnLd4kzxFePAWMM6fI3FYTppOWPEniQ5DooTQ8G8XP9tEpMhR/8KhVvrg==
X-Received: by 2002:a63:8742:0:b0:41b:85d:1f9b with SMTP id
 i63-20020a638742000000b0041b085d1f9bmr6780871pge.352.1658857832417; 
 Tue, 26 Jul 2022 10:50:32 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c574aa0fdsm11745788plb.76.2022.07.26.10.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/15] drm/msm/gem: Rename to pin/unpin_pages
Date: Tue, 26 Jul 2022 10:50:30 -0700
Message-Id: <20220726175043.1027731-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Since that is what these fxns actually do.. they are getting *pinned*
pages (as opposed to cases where we need pages, but don't need them
pinned, like CPU mappings).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c       | 18 +++++++++++++-----
 drivers/gpu/drm/msm/msm_gem.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c |  4 ++--
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 97467364dc0a..3da64c7f65a2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -177,30 +177,38 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-struct page **msm_gem_get_pages(struct drm_gem_object *obj)
+static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **p;
 
-	msm_gem_lock(obj);
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
-		msm_gem_unlock(obj);
 		return ERR_PTR(-EBUSY);
 	}
 
 	p = get_pages(obj);
-
 	if (!IS_ERR(p)) {
 		msm_obj->pin_count++;
 		update_lru(obj);
 	}
 
+	return p;
+}
+
+struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
+{
+	struct page **p;
+
+	msm_gem_lock(obj);
+	p = msm_gem_pin_pages_locked(obj);
 	msm_gem_unlock(obj);
+
 	return p;
 }
 
-void msm_gem_put_pages(struct drm_gem_object *obj)
+void msm_gem_unpin_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0ab0dc4f8c25..6fe521ccda45 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -159,8 +159,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
-struct page **msm_gem_get_pages(struct drm_gem_object *obj);
-void msm_gem_put_pages(struct drm_gem_object *obj);
+struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
+void msm_gem_unpin_pages(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
 int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index dcc8a573bc76..c1d91863df05 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -63,12 +63,12 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	if (!obj->import_attach)
-		msm_gem_get_pages(obj);
+		msm_gem_pin_pages(obj);
 	return 0;
 }
 
 void msm_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	if (!obj->import_attach)
-		msm_gem_put_pages(obj);
+		msm_gem_unpin_pages(obj);
 }
-- 
2.36.1

