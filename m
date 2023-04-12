Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B66E0212
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 00:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE610E9E9;
	Wed, 12 Apr 2023 22:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091B10E9E7;
 Wed, 12 Apr 2023 22:43:38 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id kh6so11454777plb.0;
 Wed, 12 Apr 2023 15:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681339418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayU9yxyS63GOBM6CjiiY8bjBwmD9ZnU8dUfgj0+el7c=;
 b=VfrlzRoNCK4XsqcugPJpoWdrroAMxteTFc/L6PQaqDod7DJXTTC5ZBLFbKWLVQXpp5
 RUxb3F3mYzwJrzNQTLRXXh9tB47WMMY4NE2xKUQ5mgqatwH0Z5mbhRxNqtFbgZrsIa9W
 wjCNuOGM/OGpJzmpIFik9KVsHBC6FROlCrPgABRalPKRP9i0BmoROJbW4WoE7LX+t70/
 2V4p47c/XDHyaMH0Gyo1OLT++OXCgld3H/afKxh8Piqwd2CwmEl1Zdzxl0qm63c/DOd0
 TVKYKfRQZavdBmIUkh9XNUh3ARrZlrd9sc3yfsuhxkebSRWsTlZOWuqjy5r2PZ9e/ASb
 Eldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681339418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayU9yxyS63GOBM6CjiiY8bjBwmD9ZnU8dUfgj0+el7c=;
 b=SrfYQ7O6oN3UHer3pz1iBJXHxEpahRTi6HF6wh+i9MGJou9EMff/v/pVgnrTvGqXOc
 W1ZXMTsXFoQprNgIWC1HRj3VrFKuNcF3JDlBnFiWAP8fuCxA/275Mf9NDpl0lwd3fIp8
 SIDCai9T9x1SHLwZdzebWzgTyeXRfsG6BDKEsEAzT16jaRAsKEFL4Z9tb+iOxOKEW5m+
 Wv6U/brlD1dQ5Spedo0tNF2MTEXQZI01q7RaLgWyrS3kfQECaJdmXe2SJLZGStBVm8jP
 8jV2Kv0slau5OQnPiElN4LBCqTb/fLsbMx9Rr2XdKdh8rzfogPxw53lEuERpKpZqN5OG
 8Ydg==
X-Gm-Message-State: AAQBX9frRP64fMWRHLHyp9lzN0YYdppAE0B21LwBtxiQWHfkhwpGobnE
 FSvbQU+lfIK6FO6nQ5YPF5Iy7MG7CrY=
X-Google-Smtp-Source: AKy350ayS5D/zHRR78ThM4V0cSLwnHYLRtGPjJA3NJ3nigkuqTP4ZO/iq+VDPy3OWnt61WTBYVL0aw==
X-Received: by 2002:a17:90a:440d:b0:246:e9ab:aca5 with SMTP id
 s13-20020a17090a440d00b00246e9abaca5mr6823525pjg.18.1681339418302; 
 Wed, 12 Apr 2023 15:43:38 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a1709026bc700b001a183ade911sm103481plt.56.2023.04.12.15.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 15:43:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/msm: Add memory stats to fdinfo
Date: Wed, 12 Apr 2023 15:42:58 -0700
Message-Id: <20230412224311.23511-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412224311.23511-1-robdclark@gmail.com>
References: <20230412224311.23511-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Use the new helper to export stats about memory usage.

v2: Drop unintended hunk
v3: Rebase

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index db6c4e281d75..c32264234ea1 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1096,6 +1096,20 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	return ret;
 }
 
+static enum drm_gem_object_status msm_gem_status(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	enum drm_gem_object_status status = 0;
+
+	if (msm_obj->pages)
+		status |= DRM_GEM_OBJECT_RESIDENT;
+
+	if (msm_obj->madv == MSM_MADV_DONTNEED)
+		status |= DRM_GEM_OBJECT_PURGEABLE;
+
+	return status;
+}
+
 static const struct vm_operations_struct vm_ops = {
 	.fault = msm_gem_fault,
 	.open = drm_gem_vm_open,
@@ -1110,6 +1124,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.vmap = msm_gem_prime_vmap,
 	.vunmap = msm_gem_prime_vunmap,
 	.mmap = msm_gem_object_mmap,
+	.status = msm_gem_status,
 	.vm_ops = &vm_ops,
 };
 
-- 
2.39.2

