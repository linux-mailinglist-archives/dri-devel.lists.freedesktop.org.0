Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD745BE64
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD3A6E25B;
	Wed, 24 Nov 2021 12:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39306E332
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o13so3934332wrs.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vgCEqvWmSbyxvKsdSg/5zLEtuNe6ua2M+CfTajhkYYk=;
 b=OU4TW9RrrzfgEEpapK9u5Gp2SD3m7YFEnghWtH31iP85N6r82qhCeaNU/+aRxNhVBy
 7sODIoGQJ0APrQ7XFg0yITnznOWG7Ou2HuKKrzNbOQnh7y3b04wBHluF1g2/1ifxTouN
 PTiM9cO+IOBs7My3H2dSXubm2awxETIZsN7v4qoDlU/lYOgjoLBCC/Wf6ZFvk60QDMzC
 qlPJR3F4guPn2mIyVMh5JI9XpQXmkz5lPEEVBdE2b9dLKqPsak63tt6TqkQyvtb+p4A7
 lV8ERFpEg448C8igDACepDSYAicXpvbykbZrPPy4b0MqA3pVt2WfpSm8joOgqBexrm/y
 cW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgCEqvWmSbyxvKsdSg/5zLEtuNe6ua2M+CfTajhkYYk=;
 b=y2uEEbL1J5mGfwMHeIe9IGO9P3eFu77YiXHexjO5S3nfzqlGRoiuzzLU7wFznQoPJp
 IgQbrPdxJLh+Qy6N4+BO0oLwVUCsJlwxD+iI8OWjHEIPPIh9z0yh6nhH7habrEHXL6PU
 ClWGp9Jwn99sy+nHgZRsIy1CqDXJSUhVHPVmdRF+b9mJ6YgORXk2oyLIwbeoufwKUpEN
 zEyz8kIF363RnTMoSH2U4evdsN/Q3mx8bAmY0VE4cOMx3aLoObtGisnzoRZTwsKYpZoy
 rGBkQbEVODDGq9ojhTXBB4kGv5HmbE15V9RVgk8Ql/wvUf0frqI3ZxNAmTC8bZfJv9I6
 Q1DQ==
X-Gm-Message-State: AOAM532FxqTnyrGKDIo0BIaT1wrVQbZNMlkf7U76glAyo4ixnTyDVvKm
 IknCOCeuMCe68jx83Qa04Wo=
X-Google-Smtp-Source: ABdhPJxk3GBDD4Zlx1wEO5QWsp3DoxIqFJ3+5rxgS4D9m8zALzWXL+pjL9bm9WZi/aU+9/kTchG0SQ==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr19000126wrq.109.1637757879157; 
 Wed, 24 Nov 2021 04:44:39 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 07/12] drm/radeon: use ttm_resource_manager_debug
Date: Wed, 24 Nov 2021 13:44:25 +0100
Message-Id: <20211124124430.20859-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124124430.20859-1-christian.koenig@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
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

Instead of calling the debug operation directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 11b21d605584..0d1283cdc8fb 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
@@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct seq_file *m, void *unused)
 							    TTM_PL_TT);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	man->func->debug(man, &p);
+	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
 
-- 
2.25.1

