Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D34FE4CE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8411410E08F;
	Tue, 12 Apr 2022 15:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C254410E08F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 15:35:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c10so7162249wrb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8tCAcef8XwJl9KTqrtg+6fe8UCJe3U1QYYPaYj+qfQ=;
 b=HsVtVNZKO4dILqYqxSUWjS2SGL/4TmifveOGMHwmuTp68q68G1ZeQvPBGddKz698Pe
 IdfBA2pwXuk1WZlvIaG3uPp8OvV8fEelWZnIqsWxfPZffviKxisvegjb0RxBIWFfSOlT
 tmtArcp7kQSq9MNuROSDdRtyVeYmcEExKY2EPeEXIk25RBCvcnVcLBvEm48rfOtcnBlN
 UImguNaMDCY3xdv2jSSXDkybhjngHUeZMX1XkFeGz6N6ZuL/oU5h1GgwGGOg0mjcD+od
 KVoIOFb6jAWpxLQNeE19IW6iHnSALxkS5VB5WyAHrCjbtDVj3GtnAW5ILxbE2/JlRPso
 x3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8tCAcef8XwJl9KTqrtg+6fe8UCJe3U1QYYPaYj+qfQ=;
 b=MSxQW9+9vVjHBwecZGCxFihGSpBKap15hYBZi1F3PeWdsgf1NFUQR2EftzYO4NnQM3
 +SN+saCOyqnsQybfAF3hwn04Vm1jROddf5oDLJgOBNKTAApCiIyLfv1tSmO2CiZjTkla
 zH7x830EBkhuoOBMPBX5QLEccfpJ3InFTOfVrU+vgk1p33QSBwjgiM67oUQIAZOm+deC
 1dk9gf99XTJTRQHQXOS/DkA8MNZcOyX864Zff5+OQOeYL84MfxNqa6JPyJdiHIsn5Qqc
 zwrLQJu0sA+Ti72+603Or+Rl4jXINQ6X3CX0Hya7b4wlGOo2/kauluDBza2/OghLNyxO
 boTg==
X-Gm-Message-State: AOAM533bBp+++ATzUtdrkO7G3bhG7XI67YCsVx1P3fadiSl6CK5Pj1Zz
 g42hvZJ6x3Tol14cXvaJ/pPcIQ==
X-Google-Smtp-Source: ABdhPJzUkHNn+3YdLFEMdtBrSdi3OtBRyyIQ73jg0NzUODmGehiltfBY7h/QiG7HYp4qS8+jdX6Qsg==
X-Received: by 2002:a5d:48c8:0:b0:207:afc8:13fa with SMTP id
 p8-20020a5d48c8000000b00207afc813famr2526733wrs.487.1649777733295; 
 Tue, 12 Apr 2022 08:35:33 -0700 (PDT)
Received: from joneslee-l.cable.virginm.net
 (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adfaa03000000b00207a1db96cfsm8463621wrd.71.2022.04.12.08.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 08:35:32 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 4.19 1/2] drm/amdgpu: Check if fd really is an amdgpu fd.
Date: Tue, 12 Apr 2022 16:35:28 +0100
Message-Id: <20220412153529.1173412-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, stable@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

[ Upstream commit 021830d24ba55a578f602979274965344c8e6284 ]

Otherwise we interpret the file private data as drm & amdgpu data
while it might not be, possibly allowing one to get memory corruption.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   | 16 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 10 +++++++---
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 447c4c7a36d68..acbd33fcb73d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -955,6 +955,8 @@ struct amdgpu_gfx {
 	DECLARE_BITMAP			(pipe_reserve_bitmap, AMDGPU_MAX_COMPUTE_QUEUES);
 };
 
+int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv);
+
 int amdgpu_ib_get(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		  unsigned size, struct amdgpu_ib *ib);
 void amdgpu_ib_free(struct amdgpu_device *adev, struct amdgpu_ib *ib,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 63b1e325b45c5..b3b22a87b232b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1132,6 +1132,22 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 #endif
 };
 
+int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
+{
+        struct drm_file *file;
+
+	if (!filp)
+		return -EINVAL;
+
+	if (filp->f_op != &amdgpu_driver_kms_fops) {
+		return -EINVAL;
+	}
+
+	file = filp->private_data;
+	*fpriv = file->driver_priv;
+	return 0;
+}
+
 static bool
 amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
 				 bool in_vblank_irq, int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
index 1cafe8d83a4db..0b70410488b66 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
@@ -54,16 +54,20 @@ static int amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
 						  enum drm_sched_priority priority)
 {
 	struct file *filp = fget(fd);
-	struct drm_file *file;
 	struct amdgpu_fpriv *fpriv;
 	struct amdgpu_ctx *ctx;
 	uint32_t id;
+	int r;
 
 	if (!filp)
 		return -EINVAL;
 
-	file = filp->private_data;
-	fpriv = file->driver_priv;
+	r = amdgpu_file_to_fpriv(filp, &fpriv);
+	if (r) {
+		fput(filp);
+		return r;
+	}
+
 	idr_for_each_entry(&fpriv->ctx_mgr.ctx_handles, ctx, id)
 		amdgpu_ctx_priority_override(ctx, priority);
 
-- 
2.35.1.1178.g4f1659d476-goog

