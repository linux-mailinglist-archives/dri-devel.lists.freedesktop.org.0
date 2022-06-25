Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4255AD19
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8358010EBFF;
	Sat, 25 Jun 2022 22:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5572210E7A4;
 Sat, 25 Jun 2022 22:55:20 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so8929254pjm.4; 
 Sat, 25 Jun 2022 15:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=OtlXdIyCatO6hpkm68NAcRAAkLob4BqDXO2VG+gqvKveiJRLF2weU9Qlo345JB2koH
 wZ754wNLdLlnBld88Ud+MZ09X6ILvBBDS6Tsvit2AhF0ymXs8h71ayrHvaAsBlDpuyxd
 1uALrZclRfRKV0ECe/WesAG+7HK+zetifiDB02KTm7DRrAqsTf6f9suPqaLg4ctCuGLR
 vgm4s+RHGq/H6kKrvZzt5XOvilqUBmqRrVY/NqbsNtLoJEYtlr6YQ5LRpvxQ/QiFgSar
 7VTfiVhE4g9dxb7GagTDT1HynHPx6oOEbJq6qyw6zn6EhtmcdZZBPenkwew3YwffhVCW
 9GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=pY9Z8r3QgtTApMnzkgvR9b2BwGIRqfzOKMyPB9uye0juncUGZnL3b9ZFClniGAoEbM
 WeZAHxYMr4goAp+ScSSFKuN5sjXBIW6sju1TLXtLSljhR0C2+KGlLRmfjTDT5lTxohfK
 MytTiXmx3/m0BJ3cx64ju6Nhgi+e5CgDD+ZeZaaoRLhZe5c18wOPqgiYXztdjIL1C8Av
 LHZMuL/gzm6AfdDNsNWYWQhY6iNW6DS0zCJOmslxqyOa6ddSQZ9YR4Lz4eE3hYhSlEx2
 Jc7zGw6zmqPMgIou2FPjps6OBMCu30OXYrU+xgHpKWMsuXDoAlVcODqfqXXuaqPXWWY3
 d7cA==
X-Gm-Message-State: AJIora8oOfkgwF4r+pMWxO9hBM8/xioWntp05xgsn3wgyusxU7NTvvej
 jVTMSAPsPdcmLkQaqh7WHjg6Ihnob6U=
X-Google-Smtp-Source: AGRyM1uf6rORMtCQCRHJkiXjJZLzVLkeznHqyt6UGg+Lo81Wba1/QNXRY5pAiUWaRrQRJzFSghWYFQ==
X-Received: by 2002:a17:902:7582:b0:16a:307a:5965 with SMTP id
 j2-20020a170902758200b0016a307a5965mr6356726pll.159.1656197719209; 
 Sat, 25 Jun 2022 15:55:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 bh2-20020a056a02020200b0040d2aea1643sm3962619pgb.29.2022.06.25.15.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:18 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/15] drm/msm/gem: Rename to pin/unpin_pages
Date: Sat, 25 Jun 2022 15:54:43 -0700
Message-Id: <20220625225454.81039-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
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

