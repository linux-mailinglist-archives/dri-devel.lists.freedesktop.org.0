Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6C7D9E4F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB0410EA17;
	Fri, 27 Oct 2023 16:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9DE10EA16;
 Fri, 27 Oct 2023 16:59:19 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c9de3f66e5so18333355ad.3; 
 Fri, 27 Oct 2023 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425958; x=1699030758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCHqUpshEkU4uWbTOdbsyvXx4BZI7LlABnlafBr9UIc=;
 b=WKfQluKJfs+ceID1oIPOs4IdmbMROYObRiMyPpiXDiTRIh5Na30xRU71xxMPWrJGlK
 Apq8fwjN5VtBin/mB/45kqGDK5fvAxf7UD5nnY2SomqzqXBI6EwRbrM25NyNHEJR083S
 mR4Z3yqdt45qslthznpOUKp+cJGxO5D8kk908Mkhb+ykNPn/HmIxj+gmFjVgYB9dh41t
 T4OAPMTzH5pTHopx2FqVXzuFqR50W8LN5A0G49i0zIYzzx9xAJ0R+2pKkNHCLWgORP30
 g3mUDDjSW8Cc56LbVTUN3qSXXnpMoMjtI+gPpK8wHIsN/NtwOcHyDxL4mz2d9Zm5lPx2
 4kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425958; x=1699030758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iCHqUpshEkU4uWbTOdbsyvXx4BZI7LlABnlafBr9UIc=;
 b=L4LUUUNi+EcNe7KvSVUpDejUEcAZHzTLJMGceaM9sf3nmK26kHKczQFLf4+pT9zfID
 ZB6EsSAf89TweVm1KBPl01Y0x9yd3GVviyyTmegqzrNGY8u9vz4zs+c1hTmzSob/6d/O
 M4Jh7KTMww2lt5jJixVuOjqICA7GwGjNvFv2SxJ+fyj+PgcgkMfIs+/krgCdOwnT7cRB
 Q6xS9dIp8eHLXsQhf5C4n02+jgj6etDmPBrM6ViDukkFM2tu6UzbPBIj/SwmmKorATDe
 5caC7eZx4tgpNDmR3jhimOKIRafhuY/VWtEm+0Hcir0IUR7Hcv0dSuwpaqWt+TLyh5Zo
 39YA==
X-Gm-Message-State: AOJu0Yz406FPDRkQmhzHOqvY50fklUgbaJ8wJVFtl5qKa7yGq8J0Lax+
 ftv5Xh831R3B7bW/+EkHoWoGm1cfwfc=
X-Google-Smtp-Source: AGHT+IE1CRcZ68zfn23VeMoSQ6OlsNc9UY4jVYsIdmVtGSYUiW5fTt9cYVK7YDD7M/nHh0YLWuRTjA==
X-Received: by 2002:a17:902:f34d:b0:1ca:e4b:148d with SMTP id
 q13-20020a170902f34d00b001ca0e4b148dmr2584344ple.65.1698425958278; 
 Fri, 27 Oct 2023 09:59:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a170902e88900b001b7fd27144dsm1797802plg.40.2023.10.27.09.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/msm/gem: Remove submit_unlock_unpin_bo()
Date: Fri, 27 Oct 2023 09:58:36 -0700
Message-ID: <20231027165859.395638-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027165859.395638-1-robdclark@gmail.com>
References: <20231027165859.395638-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The only point it is called is before pinning objects, so the "unpin"
part of the name is fiction.  Just remove call submit_cleanup_bo()
directly.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 996274ef32a6..2d5527dc3e1a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,12 +272,6 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 		dma_resv_unlock(obj->resv);
 }
 
-static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
-{
-	unsigned cleanup_flags = BO_PINNED | BO_LOCKED;
-	submit_cleanup_bo(submit, i, cleanup_flags);
-}
-
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
@@ -313,10 +307,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	}
 
 	for (; i >= 0; i--)
-		submit_unlock_unpin_bo(submit, i);
+		submit_cleanup_bo(submit, i, BO_LOCKED);
 
 	if (slow_locked > 0)
-		submit_unlock_unpin_bo(submit, slow_locked);
+		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
 
 	if (ret == -EDEADLK) {
 		struct drm_gem_object *obj = submit->bos[contended].obj;
-- 
2.41.0

