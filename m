Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF06DE7B5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA91010E6C2;
	Tue, 11 Apr 2023 22:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA3B10E6B9;
 Tue, 11 Apr 2023 22:58:02 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id o2so9389934plg.4;
 Tue, 11 Apr 2023 15:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681253881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayU9yxyS63GOBM6CjiiY8bjBwmD9ZnU8dUfgj0+el7c=;
 b=VHMVks6NvFNA2/mOKdow01yeN+D6kqEpVibmOQv1tGWfHDT2poOsnsKr7eTZ7pHDvD
 DJY9EFVJaynf/OAjF0rD5h8BRBfY/Nw/R0RnOGYwnDSaz/5zPj5ZEl+RUp8zC7F/fEhs
 x0H7SQF0GF6TFrorb4/00O1gYYJ8B4QdsyIE86JVC6N4ywG1DB2S9J1uP22usScfEJWf
 1dNBvgS2a9bRLfmrPzRWj1BWlbBEs13UEMUl1WBPeS69+JumPmo5V6CEg2Qnaj4jlk+n
 Y0Phzi7RUHipcV/fBRkNwMFXd7mbOCJBMgHT1G4kHzuXt4KaVnrvFYoi7YV7MCNfwHc8
 hZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681253881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayU9yxyS63GOBM6CjiiY8bjBwmD9ZnU8dUfgj0+el7c=;
 b=UEBFX7782sL0ubQQC8yLKJrB8wQuj0oku5j6C0tiJ24WEFgN2EKql63stgCYpDP4l5
 RBv/PbmuXlFSJmgiRMZLI4BCrwV4IbvxbTZITlkd6Vo1CC/lacA1e/ZQSKOWsSejdiiq
 iIgVfs/Y9XMZGeEutr+6s8FQu19OD1KaEjYulgi1jzNp6e0WgajlIZFls48ocdLKdiJB
 E7tZlbLbcZ1cbhpIkMtd0ohsRoPbcb6rdCmxdbgkaYoNHbF9t9VbZIvmfzhEhByn41vN
 rSfsROVANgmnXRxiDPh4sMV4YDK1QXmuSKFvovs6MR73eldzFEHpDALELxxZZEPqxxkp
 mfiQ==
X-Gm-Message-State: AAQBX9cciblyUokxXXcYq6JagzZtQt5O1MPVQ8XbvsXrkC4+pp3pN96N
 ek+lXF31OvF3FjeDOKIxUan/n3YGntw=
X-Google-Smtp-Source: AKy350afowYNd7r6IlQY5UFSM5Gy2/2tZFNE2WZ/1NW240MZr8PnH0GSNz7NIR7TH3mphaC5yTZvWQ==
X-Received: by 2002:a17:903:11c9:b0:1a5:a1e:6f9e with SMTP id
 q9-20020a17090311c900b001a50a1e6f9emr142303plh.15.1681253881277; 
 Tue, 11 Apr 2023 15:58:01 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170902900b00b00196807b5189sm10087161plp.292.2023.04.11.15.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 15:58:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/msm: Add memory stats to fdinfo
Date: Tue, 11 Apr 2023 15:56:12 -0700
Message-Id: <20230411225725.2032862-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411225725.2032862-1-robdclark@gmail.com>
References: <20230411225725.2032862-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
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

