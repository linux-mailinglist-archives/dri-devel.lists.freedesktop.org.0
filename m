Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454123FC5D9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 13:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314978857E;
	Tue, 31 Aug 2021 11:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC19C89A4B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:21:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g18so19574615wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 04:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tiFOqnz2z9TFVO081gYMvI20BrMbbHMcIhSg1/O4wb0=;
 b=uOXt+r8EOMI/yccnOkd7uL3MSo/II7r9+vBoMAaePbQujdBxitpB1ZSRFC2gMPgbPU
 cmKSSvze/9xl9d87LH8w0I0RepsVMjyDQMs/axAVC9Y4TCmlGvh0eZKUiKEEwbAsdL0N
 eH5WLoZRUb9YXvBAwnAYNb+2h0jR9zTjn8ADrRLmbxUglEpO5MeQm939rd7IwP6ZrQnY
 I3n/R4+a1hTu1FXX+XXI/n2sX89wOIwDbA6mzNVhXVNYi4HRnp6epUSxFh+6eOGMNLkw
 ue0MLKKvzO1zoVnVDKezVaqYl6ytVccqn3H1ws5TZ8guMOUEGUoN2I+yf+vrNMs7zv81
 b+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tiFOqnz2z9TFVO081gYMvI20BrMbbHMcIhSg1/O4wb0=;
 b=DxqSRPISHUsEW8UGjIyhPB3mv+YTolS+BXgT+UkLs0HOtv6auajGPJYO6c4fjQk+jR
 W16bW+UMhUsciPC2ESgBxl0g3ClCjsxlNRd4MDVT480SaKeut9OU+DevtHy1u0Mq8Yw+
 GuFfxnlsGYa2ZX6RneY2NGv7JzCbr3iB8S6FD8vlOTUyfPgfdX6OV29r/4NGl45+seQk
 3gQ7FEvzdQ+291HOF8BAGDtMmHKyt4yXmll2C6mRSvg11hO8k8S4kj3AvF3Keu2TyhEp
 qNa2kpp8Nm0v20AX/6IkOli2op1jCK3omf+zONU9Ja4NvC6Hdwa9TUzxbE8m0oVf0dR5
 L2gw==
X-Gm-Message-State: AOAM533eq+LkfU0+saGpQxICQiFkS6DTicdjUVmeDcBLDAIENVOOIoVB
 VtFNFpVmjP/k1bSehhgoWo6NSZP0vFxYZVOL
X-Google-Smtp-Source: ABdhPJwSCcygeaivKCmOUcM0AjHxTlZK7CaOhDugctA/4BGjT8NixHRoS7AgzBL5w1pGJ7wH+rgVVQ==
X-Received: by 2002:adf:b7c5:: with SMTP id t5mr19120139wre.322.1630408879385; 
 Tue, 31 Aug 2021 04:21:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g5sm18054957wrq.80.2021.08.31.04.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 04:21:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 ray.huang@amd.com
Subject: [PATCH 2/5] drm/ttm: add busy and idle placement flags
Date: Tue, 31 Aug 2021 13:21:07 +0200
Message-Id: <20210831112110.113196-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831112110.113196-1-christian.koenig@amd.com>
References: <20210831112110.113196-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

More flexible than the busy placements.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 8 +++++++-
 include/drm/ttm/ttm_placement.h | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0a3127436f61..c7034040c67f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -834,6 +834,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
+		if (place->flags & TTM_PL_FLAG_BUSY)
+			continue;
+
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
@@ -860,6 +863,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->busy_placement[i];
 		struct ttm_resource_manager *man;
 
+		if (place->flags & TTM_PL_FLAG_IDLE)
+			continue;
+
 		man = ttm_manager_type(bdev, place->mem_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
@@ -869,7 +875,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		if (likely(!ret))
 			return 0;
 
-		if (ret && ret != -EBUSY)
+		if (ret != -EBUSY)
 			goto error;
 	}
 
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 8995c9e4ec1b..63f7217354c0 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -53,6 +53,12 @@
 /* For multihop handling */
 #define TTM_PL_FLAG_TEMPORARY   (1 << 2)
 
+/* Placement is only used when we are evicting */
+#define TTM_PL_FLAG_BUSY	(1 << 3)
+
+/* Placement is only used when we are not evicting */
+#define TTM_PL_FLAG_IDLE	(1 << 4)
+
 /**
  * struct ttm_place
  *
-- 
2.25.1

