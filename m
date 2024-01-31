Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A88432A2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 02:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDE01137E1;
	Wed, 31 Jan 2024 01:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9E811379A;
 Wed, 31 Jan 2024 01:16:41 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d7431e702dso32913725ad.1; 
 Tue, 30 Jan 2024 17:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706663740; x=1707268540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TMI3cnWrauJ0sVrAPWjosebBGINiaEuvqhQTmdIHpwU=;
 b=MxYomRiEjku+gAZg7s72nS6gsWIy1qjBYgf/evjguI66KAdle1AnGcnN6DV8N3vzPg
 kHcm/WG3wj8tJKpzGykAwjI/UFT/Dstj3ovCQNYQoZ1Ii20WzoOgDR05mUWOxNE+42QK
 SgAftYiQjRIjeyr9QJtX87T5xql+4nL5PpJFoE2f+AvZ8Jk21VWVhkmdnWBNJrKyl17H
 I6G8JeV8Nm2SCyNcxxT96pm96aMDK7jxM056Py//+7Gnjs5hLxvKJaYem92VFU6ZiIJt
 4kp1HTDBMyicl6rxb4nQ7rEF/t+CvAuwbevdeLe365koUbPiHodoXq9KzH5vG4jSlJEb
 Pb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706663740; x=1707268540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMI3cnWrauJ0sVrAPWjosebBGINiaEuvqhQTmdIHpwU=;
 b=GL7ilNpLFvqI518Cj73/yMdBBAr103a/grsaS8KxoT/Gc2QrqLWR1EpfgekRMIlISe
 Zu38uPAB5A4vfpN3eJOHPSrasP6fVv9RxoDRTyf5Tj98HW25nKsEP7jg9lVugTOnN9Pq
 sYLwV4i28Ew/dgWUDjHCxExHOOiHPQQ86540h/TNNbRpyboxjKXp5rYZxAo5QEMntyHp
 4zU04t8wzADWTYLbH+Liu+xcH+tmvq520gMjrOwabr8fyDB95hKLKXWLJs5MLopb5Ihb
 4CnKFC/QIx7ghgsRB54JJr/FucgTuCj+LlrWk9KMxQnrMEfq6q2BWJoJTZ/L9hACHfP+
 5Eaw==
X-Gm-Message-State: AOJu0YwxP3EBMxffQ6ZjwByoEy5+8GwN+thuPvgechWvU9nvoA1QKzkP
 AqRhZqr6zRDikIxQgfsqprFcinUParoAVhWnDVS5Y/25t5Qh91MYyf/I/BO0
X-Google-Smtp-Source: AGHT+IG8UGKG/Zt1rkUy45qpAPEJlPjYqNZszRCvj1fmkMfo62fVTpD1GY8zqyGU1X8ERHaQ08XHGA==
X-Received: by 2002:a17:902:e805:b0:1d8:d01b:571e with SMTP id
 u5-20020a170902e80500b001d8d01b571emr246288plg.33.1706663740422; 
 Tue, 30 Jan 2024 17:15:40 -0800 (PST)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a170902d29200b001d8d6ec2d7fsm4866303plc.61.2024.01.30.17.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 17:15:39 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/gem: Fix double resv lock aquire
Date: Tue, 30 Jan 2024 17:15:37 -0800
Message-ID: <20240131011537.31049-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Since commit 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping
functions"), the resv lock is already held in the prime vmap path, so
don't try to grab it again.

v2: This applies to vunmap path as well

Fixes: 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping functions")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 5f68e31a3e4e..0915f3b68752 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -26,7 +26,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	void *vaddr;
 
-	vaddr = msm_gem_get_vaddr(obj);
+	vaddr = msm_gem_get_vaddr_locked(obj);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 	iosys_map_set_vaddr(map, vaddr);
@@ -36,7 +36,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
-	msm_gem_put_vaddr(obj);
+	msm_gem_put_vaddr_locked(obj);
 }
 
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
-- 
2.43.0

