Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827257A4E5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9190FCC;
	Tue, 19 Jul 2022 17:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D6F90FE1;
 Tue, 19 Jul 2022 17:18:55 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 72so14107599pge.0;
 Tue, 19 Jul 2022 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=RKXxxJNOMmrIvD2K9FHnDoHJDSySY9Pr9GW0j7hZHwCdyC1cQ2KC/Ri8GmirMDd6LO
 1NNS432ZjfDA7GIbgLQc7kPDawJca/cA1jEe3+P2pLSL2T90P+1SlkehOHBH59nXuHak
 inaq8td1A5cswfD3meNz5QApSVnf2AQJqpvAuOextTZvRi3KqnsURwVO/+eNFgmL9/Um
 PufKk6i0NobNuVgehwUxehb9aVVuLKsvBpbbx/FYLTxCWVzE/qlt/7nkAXNt7yzU8j9J
 Z/O6kSHlE+nlC8f2xi0quvlLE7dNiU3+pU0L9DTLZQhh8Lo6BTujTd0IECTKqeXqFtzZ
 YYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=Dbi+Q2W125HLR7rpdjsZXQz7d5iRx+Df39Hioo88U8q5wRWyYdAk6ZEI5mlUmmRQxz
 AhB+oP4zmEfK2XNt1eS7WhlmgnFSxZ3YeyOsIjovYPHxGOK6qzIn+chqcBLSpDNz/bO8
 oEA+7Mhl4eIDlKS2p5uMYE1qzCS0SyLOXvCnwfzdpWSKJU6TDBt/sP2bAoWULJiK/ONz
 95u4TQVzfSE0nU8jLjARnnxm8LnDqh8SNkSaqriXL3YuZFfqJ46PoWiTwfLRqTPq4HzA
 9qj7olVWYPqEqVGW/x2WMU6i6hzJPtshlkiMVkpExANKYjYdWYhX9xHokAF/XonDDmcC
 KqCA==
X-Gm-Message-State: AJIora8WDeDzTgIl8dHzYAwGqYyKej7qqRsTd02xOlpQYdsAB3qh/yy5
 AY3ymkJLkcwaDjTpEKYwo0QYGSnzXMA=
X-Google-Smtp-Source: AGRyM1vSPo6luOBnOdh3fOvkjQdqW8BN2hrChpa04kg6m+Cj6xRnjknz/OdvxhwoLLfeQb2pN9c7dA==
X-Received: by 2002:a63:6c42:0:b0:3fe:465:7a71 with SMTP id
 h63-20020a636c42000000b003fe04657a71mr29526258pgc.101.1658251134845; 
 Tue, 19 Jul 2022 10:18:54 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 a201-20020a621ad2000000b0050dc76281e0sm11667317pfa.186.2022.07.19.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:18:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/13] drm/msm/gem: Rename to pin/unpin_pages
Date: Tue, 19 Jul 2022 10:18:50 -0700
Message-Id: <20220719171900.289265-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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

