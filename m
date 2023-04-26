Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC06EEBAD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 02:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC03710E84F;
	Wed, 26 Apr 2023 00:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7464C10E132;
 Wed, 26 Apr 2023 00:48:47 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a69e101070so12699945ad.1; 
 Tue, 25 Apr 2023 17:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682470126; x=1685062126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o0BnfPBPiojl+QP/k4t2sPrlYYfp861ciAthUpTF5X4=;
 b=HqoNoVrVJ0tYNI9Bcc8izp2vO9TiFwXSsmlLp9xOUhj53NzjTbyewO2fTWssq5dCXq
 R9f6ivJblpFgQFJ2P42l/8IJggxjPLS3wQB4PQjvwx04sSPvotNgV37FOWKpLpe/OUAU
 hFwPp2YcVADhEUji0dbloenohkutOfWIJGU3rNntY2scMAMlL5WRZ/PFPr2e8QINCYRK
 oYlzSG7Biw4RkhICfWQ1xYGg3BIEGrxQdEIIL+uwcGjvD/4gJAQ4xiEm9n/04Xp1tvdm
 lylzhgDYcyCcTfFKXyNQYt+aNsEvBuRcmC1MY4RpvF0ZhWpHKbiqM9WCLKa/2yV+zjVi
 NeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682470126; x=1685062126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0BnfPBPiojl+QP/k4t2sPrlYYfp861ciAthUpTF5X4=;
 b=ZRr9Gsnwpt74HW8wOPVtiUWy1nVyCY4FYftyZojsyu3nGptunzwMpWGH4Joka6Ms/V
 zbjcycBXzOenaz0EfRW+4Z7PPLkX+H2Q/fvDEgAa/cbOm5eV8NSPPLIBkcaaqQ/Z2gWP
 ibcvNTnrBk0fVk0fmcDteDj7j/JTWeOWfNNQHugrsKKTPwGQyTSvfCIJ4NyiXu/vlF3U
 uDaLSqD/pLlBHxZtUQAg+U7Gs3V8Wxv/edQWUJ7XlwRAWQoMxgZHxhdcrFeb+1kvzwt1
 rAZMffmPuTn8jYR3vZWoWhGQJyhTBQWSUxYPoIr2660yJUwTZAVSS0iDqfMGpW1hmJDB
 WZ5A==
X-Gm-Message-State: AAQBX9cL7x9I+lbnoUgjpqapy7y7mnXfoQBjFgKVu8zZqWJ1hb0gQ4mn
 eK5UsElaSRadwFWoMJCXvyfTnkgzP7Y=
X-Google-Smtp-Source: AKy350ajvykvbDO2EsAOkoWDcIipTLmTGBCKWlhBF3bRZPXOHTwGHyYwev95vinACirrl3ksLTtIuA==
X-Received: by 2002:a17:903:1d1:b0:1a6:93cc:924b with SMTP id
 e17-20020a17090301d100b001a693cc924bmr24020006plh.3.1682470126042; 
 Tue, 25 Apr 2023 17:48:46 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a170902788100b001a688de1f0esm8798611pll.234.2023.04.25.17.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 17:48:45 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: add a missing lock for AMDGPU_SCHED
Date: Tue, 25 Apr 2023 17:48:27 -0700
Message-ID: <20230426004831.650908-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Cc: stable@vger.kernel.org
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
2.40.0.634.g4ca3ef3211-goog

