Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C66EEE2C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 08:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC13110E8BE;
	Wed, 26 Apr 2023 06:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FD510E8BD;
 Wed, 26 Apr 2023 06:17:29 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-517ca8972c5so636028a12.0; 
 Tue, 25 Apr 2023 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682489848; x=1685081848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=54QT2qvIeWHdzjZ4EieSD34moWDamE7VGmQ7alnRC98=;
 b=sF+P8bb8uMhYrTOmSX99gvg7Hru+61Rlk2NYSAmxAbzFaHJ9SIj7+SjR0pxefdjN5r
 hFt9x6840LiGIIMysJkU+WbnAdwbMxBdQRsv/pQrZFRnzdw7LUC+D7MPgj8wTiFc/CuG
 KkXY6/Ys64F/aPaHUC3zG+MRUxVRpg53YaqUDLsd15CspB+8+5RQaMlfn4SbQfjNu0kS
 dbIa5Kkbv2TcP2OsDQiaFCYdjxrqsfpR7tTz+JtD37h9tS3/rUfWxdRwIjanZySnRYYf
 uONLqV8nBibPXcOKjU5MrwR8k7x5nIpa3dAiDegXDvl8HbdhPmjxIEtceUBAHzPpomst
 xVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682489848; x=1685081848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54QT2qvIeWHdzjZ4EieSD34moWDamE7VGmQ7alnRC98=;
 b=fLN2N6l4DhTUS1P9h9idsPc8gAfCjKSDqN53f7h657/Yf63DMmL9/cYVBUzQvaDhJo
 8BrvIyxz8U0SsF0vBmSajyR769cg7nn4sTim/PRrTMB3rinbpWavLZDL4I8tJ/aQHdIh
 3Esl8L5FgRbDVZlKRHT9SLhFJCwfnAK1mNrh3lQNwMomjNcyhl4z7DkeWM3NJWLyFbdn
 Kr+9OUHL7K3Pfje7vlP3e+717j008LUoAgzM6ZepFOEr50Z/9ijvgx4L/8lk5p28PRaM
 EFmxF4zkZIBzJ+sDQ4PHwwPWIAYwV9Gn3+0Z2w35Dm7YfiKZoQviL02oXPvpFAU3Z0dA
 rSmg==
X-Gm-Message-State: AAQBX9eMk5MKZ+i9BD3fAhmyyXzvAvdb9+HC3tEBqorSMIdm2OuHCZl2
 iwyRwoKseQzbHRN6an72sifjy/nuW1U=
X-Google-Smtp-Source: AKy350aycLnLbKLXtxd6n+hL6qzyM3+dfBPm8y7nLsLJ95s7tYOugYfR14+YBfg9XJq9kFbAi7tIog==
X-Received: by 2002:a05:6a20:1608:b0:c0:2875:9e8c with SMTP id
 l8-20020a056a20160800b000c028759e8cmr25435942pzj.1.1682489848305; 
 Tue, 25 Apr 2023 23:17:28 -0700 (PDT)
Received: from olv-ct-22.c.googlers.com.com
 (217.108.125.34.bc.googleusercontent.com. [34.125.108.217])
 by smtp.gmail.com with ESMTPSA id
 i23-20020aa796f7000000b0063f0068cf6csm7034692pfq.198.2023.04.25.23.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 23:17:27 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/amdgpu: add a missing lock for AMDGPU_SCHED
Date: Tue, 25 Apr 2023 23:17:14 -0700
Message-ID: <20230426061718.755586-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
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

mgr->ctx_handles should be protected by mgr->lock.

v2: improve commit message

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
2.40.1.495.gc816e09b53d-goog

