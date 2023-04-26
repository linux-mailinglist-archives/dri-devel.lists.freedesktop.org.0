Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9666F6EFDAD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707A10EA7F;
	Wed, 26 Apr 2023 22:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C91710E2FB;
 Wed, 26 Apr 2023 22:55:09 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63d32d21f95so1653498b3a.1; 
 Wed, 26 Apr 2023 15:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682549708; x=1685141708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=URe5IK8BqyGlY33B01lIkRKYglbFP/keYXZpRkkqgQk=;
 b=J0Q49yLEutapdBdj8hf5PCpH516ZfIpIr5OozmqwhsEE+HfSh2BWbTNAp/fCkT2W8v
 wVe2wp15oh4yzAAsdiZy2veVZHJxOQ4yfC/rISW65XTMhPtl9YzQJW8t8rnaS5mNNEU1
 8EcrP+vrKmHQ2ex9zVoZe5BPPpxHGttp7V+v8VxBFTK57ShSGV3CZpOkO8RK6SSJxIqs
 sPq+LmqDJx5lGlYjMCOa/DrG7iLIdDX5nQYDN1nrcTnjQkcIXuHQo6Fy5DDZdyz80jju
 RkxlJQIH6KYK0GB9KA8OZ/U80D/TjHkZS4AOiLEMazrjdC/jMgGTMxuFzC4KNHRJm1u9
 +Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682549708; x=1685141708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=URe5IK8BqyGlY33B01lIkRKYglbFP/keYXZpRkkqgQk=;
 b=WUc3VQWMxFXEigmWbCy1/qaGjWhpdKIPCQNvhKXJrBVRbb187Pyba9tU2dSA9X3vjK
 DbSkgll0VARC0O1Mj9U7sOzbCZr5JlSyB8j/6Qt9sAbzeK7kGmEQ3mVCwcYJLlhBylw3
 68xVWdHSsQId0C824unj8EgXcOr5kugQZ9Zcr0U+6p3URUlFrGCUSVCB2+YNk5e8XuqL
 GfBDUmhlVff1qR7nVYz/x/rZveGQMOc8Sw963FDWgzlHScLK/rOhSZG1ucykOjy9ggnT
 l8/mXHmbFtZFT+Rj6ilKCPFgqx6K5mlRamOII2Xrkxxklxp0NcBuE2yRTomWVMT7+tPk
 2Ixw==
X-Gm-Message-State: AC+VfDx0T3hXuG9v2K4SikhbasxSQejCm4X5bAW1Qs8VshQCjSxxytfB
 YWSsiYLLvCKyWKMKucwIKxIPjM5ISLU=
X-Google-Smtp-Source: ACHHUZ7N+TgomRffe1hCJV7ix6lm3dalClXxZYcIk7/1RguQPQWpXFX+HZaXNm+srdNv0IDb03c3FA==
X-Received: by 2002:a05:6a00:1812:b0:63f:21e:cad8 with SMTP id
 y18-20020a056a00181200b0063f021ecad8mr290784pfa.3.1682549708511; 
 Wed, 26 Apr 2023 15:55:08 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa78804000000b0062e00158bf4sm11735343pfo.208.2023.04.26.15.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 15:55:08 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/amdgpu: add a missing lock for AMDGPU_SCHED
Date: Wed, 26 Apr 2023 15:54:55 -0700
Message-ID: <20230426225458.877481-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Andres Rodriguez <andresx7@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mgr->ctx_handles should be protected by mgr->lock.

v2: improve commit message
v3: add a Fixes tag

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Fixes: 52c6a62c64fac ("drm/amdgpu: add interface for editing a foreign process's priority v3")
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
index e9b45089a28a6..863b2a34b2d64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
@@ -38,6 +38,7 @@ static int amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
 {
 	struct fd f = fdget(fd);
 	struct amdgpu_fpriv *fpriv;
+	struct amdgpu_ctx_mgr *mgr;
 	struct amdgpu_ctx *ctx;
 	uint32_t id;
 	int r;
@@ -51,8 +52,11 @@ static int amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
 		return r;
 	}
 
-	idr_for_each_entry(&fpriv->ctx_mgr.ctx_handles, ctx, id)
+	mgr = &fpriv->ctx_mgr;
+	mutex_lock(&mgr->lock);
+	idr_for_each_entry(&mgr->ctx_handles, ctx, id)
 		amdgpu_ctx_priority_override(ctx, priority);
+	mutex_unlock(&mgr->lock);
 
 	fdput(f);
 	return 0;
-- 
2.40.1.495.gc816e09b53d-goog

