Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424593D202F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143646E90F;
	Thu, 22 Jul 2021 08:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C116E158
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 08:55:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w13so2866757wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zXeqjWWhjV9zgsMrbL2snGNrlbpjRH3WelZc+NTYJBg=;
 b=DGYTgYzIn+F5O47QCsrH2xUCYEgoLoU6u28HC1jeN7HamifQprc6K/NRLEownjF8qA
 gmzj2G06hYHw2KbLcxuG+KJeC7df0nRauAvUYMPCr+vr61WsboRUTC7QZZJAtKSLO1SE
 bhd3xTyw+LoypTbuyaemoZMglX5xHrv6Lrc+Nf6ON68zj94EpBcI/987o0K2tQAvO7Lb
 6dI3fL6NW+O7g6jm61VQaqngPQRwNt/6ZLfABNuWejXGutPXkH8efjqr8rDCQPRtee2r
 FPGdjnfj6EOv3sF7C3ba94yzPRaGkDvIajtP0RGQJDSKx9JgxQ8K3p0jzpi0AhAEFDkX
 SM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXeqjWWhjV9zgsMrbL2snGNrlbpjRH3WelZc+NTYJBg=;
 b=My9JLFBNUgRSxmf1d2oBEa2VEjkUma1gGkASfAu7H7wN4qFjDMink55w7Dg0O5yEk8
 X2nRuBLw9Ow2czj9v3EPes9iKZrZdlZZwMBZOqrOgwTxSgJuMgfBgBqUuq6fnD3Pbpsg
 ITmV3bv1m0sLSTYuvazLFSCpbmYtaTjfCSis+FkzJIM0mKIqZp+lAB1vXyNQZdb6rCXN
 c6FOUqRBFnq87fT+qMVdp6MhfwOI4K2yse6MKtQRl4S/r8ewat1/J2t/6AyTbnGTwJYK
 7W+0vraJhAWLcEq8lKEWO3k+8fcS8SZzNYADoxSQjnStvKsv+OKqdjYO5CSyAzhQ6p7y
 8RcQ==
X-Gm-Message-State: AOAM531q8rvX1oaGEQcL6X/fN0mmckaFc1Pc9zAGkMufmv09e8xn0KN6
 lm1VDwx5w4Qvn1YnkGhdr1jMaS9aHz4=
X-Google-Smtp-Source: ABdhPJyg18REllvI01tClmTG39xNIwyWkrxfQ5FoQQwZSEAJelSV8ZfFZpTUZ7y134ARxMt/R7AuEA==
X-Received: by 2002:a1c:7407:: with SMTP id p7mr40057810wmc.111.1626944156415; 
 Thu, 22 Jul 2021 01:55:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ee9:2117:be77:929c])
 by smtp.gmail.com with ESMTPSA id w3sm29130889wrt.55.2021.07.22.01.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 01:55:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com
Subject: [PATCH 2/5] drm/amdgpu: unbind in amdgpu_ttm_tt_unpopulate
Date: Thu, 22 Jul 2021 10:55:51 +0200
Message-Id: <20210722085554.1537-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722085554.1537-1-christian.koenig@amd.com>
References: <20210722085554.1537-1-christian.koenig@amd.com>
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

Turned out that doing this in amdgpu_ttm_backend_destroy() is to late.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b46726e47bce..42b5162814b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1070,7 +1070,6 @@ static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
-	amdgpu_ttm_backend_unbind(bdev, ttm);
 	ttm_tt_destroy_common(bdev, ttm);
 	if (gtt->usertask)
 		put_task_struct(gtt->usertask);
@@ -1154,6 +1153,8 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
 
+	amdgpu_ttm_backend_unbind(bdev, ttm);
+
 	if (gtt && gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
 		kfree(ttm->sg);
-- 
2.25.1

