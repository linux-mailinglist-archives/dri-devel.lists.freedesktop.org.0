Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAB6F0B8B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E21010EBA0;
	Thu, 27 Apr 2023 17:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D6E10E360;
 Thu, 27 Apr 2023 17:54:07 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-524b02cc166so5089051a12.0; 
 Thu, 27 Apr 2023 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618047; x=1685210047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tk36LHgT7Zd3DnVnkUrHTABb/+wFJaIJC2KssqoMtiA=;
 b=eLrWdp6G4Kchqv4Qdaauo7bSYHMHL3SgbOabiyKhti17zyGH3h7Fn5HV8Rjz/7qIUT
 u7lM4YrdTNZ9IYLVHRBiOuF2MFueaj6VxzcGfAm1y2HXpLywUb0Yr5/HwDnmmnahA8yY
 gkPqgz/HtXC50zqptgdfI/DyIlOj/WpKZssQISqmRNJ3dL8peof2/aLv2sMbKyyrTpiu
 JO3IMj1mhKLtQshAka98lVJX7Od8yfJiwNScAxYZ26Fbs4k8k6mOWaBHNe+P5BqTxET6
 gE40PvRGCjMy/SpZLKboyq710VewPdBfOVhTqamRYrUMYAC6Ni6wHczYFR24EHIFxaXE
 pmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618047; x=1685210047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tk36LHgT7Zd3DnVnkUrHTABb/+wFJaIJC2KssqoMtiA=;
 b=hYQV9XHYL7mZEFi0yKnJ4yjCqBVxzN0ws102ypBdIOEVvD75tMdKzQ8RDV1XrLJaVx
 9CGpfCsfoOxOkW1defMEMNNvF3zkPY/111igkuUSCvmVpaPBV0KegGfojWBnxjvJG/xX
 pmE5EAMRyGozmdRrcKM4BsV9EBNY25ZI0xyVrLMtVu8CYFZkbXCu/RDz0Rl2xPu5alRb
 dqQsT2CpiUE2eU8+fhIfSz4mmN9fmqMdFb79Tu0tJ6rFylac4JzplDmyLIbpyHnniGcI
 goyVimYpUCt5GeKjbpTPxqKc/2rf2AIykSfa8bHwjDqw8aBfWDZGNFz3saIABAiqEBsz
 0O0A==
X-Gm-Message-State: AC+VfDxSmT5VJKkgtt/tvguM/IlK8LBTprT1cmH3+t9uhYvhaJheXVPi
 d1nU60khN7RoApbcxRDo1weOuF2TpUY=
X-Google-Smtp-Source: ACHHUZ60SORnik/eSAifUwaYbsYC/Ea5qlWfZS6XAVfSHEgeUf/F/4TBA83gnvjAxC1qtMElfaHudw==
X-Received: by 2002:a17:90b:4f4b:b0:23d:31c3:c98d with SMTP id
 pj11-20020a17090b4f4b00b0023d31c3c98dmr2686481pjb.15.1682618046972; 
 Thu, 27 Apr 2023 10:54:06 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 r78-20020a632b51000000b00520f316ebe3sm11614239pgr.62.2023.04.27.10.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:54:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/msm: Add memory stats to fdinfo
Date: Thu, 27 Apr 2023 10:53:30 -0700
Message-Id: <20230427175340.1280952-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427175340.1280952-1-robdclark@gmail.com>
References: <20230427175340.1280952-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
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
 drivers/gpu/drm/msm/msm_drv.c |  2 ++
 drivers/gpu/drm/msm/msm_gem.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1e941aa77609..81a1371c0307 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1052,6 +1052,8 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 		return;
 
 	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
+
+	drm_show_memory_stats(p, file);
 }
 
 static const struct file_operations fops = {
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index cd39b9d8abdb..20cfd86d2b32 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1090,6 +1090,20 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
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
@@ -1104,6 +1118,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.vmap = msm_gem_prime_vmap,
 	.vunmap = msm_gem_prime_vunmap,
 	.mmap = msm_gem_object_mmap,
+	.status = msm_gem_status,
 	.vm_ops = &vm_ops,
 };
 
-- 
2.39.2

