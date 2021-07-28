Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72C3D8507
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDD86EC08;
	Wed, 28 Jul 2021 01:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2DF6EC04;
 Wed, 28 Jul 2021 01:02:46 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c16so655677plh.7;
 Tue, 27 Jul 2021 18:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=b9NxSnxk1VxZqiDCi1AAks8K5iBqV1c1t7XZVCJ9vakTpEjvZaK8BBRIcUg/BRnqJk
 aCT9lROfSKWsz7nPb/wSb64Q8AnsR0uxxILmf1mCsR4FcSBfPy+Pu+TlDTLGtgribXLc
 u7E8al/VyNXx5XPBjZh/EO852CfSDoxB6KxMVgFqdBL6u+hYOtVX6hPDYOOl3t8G8say
 9iEeywnaDwDPHaqpssKef1fYt9uDWBGU9jM6OJJawWCeBlNJRSGpUFEXxV9vTavGONrk
 FpmeT9bS2WPE0yBx6sEPD6fFPipfs8n+Pnk4fpRXZ2LBeXpU0rIOAH0Rqam3iCn1cok5
 f6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=I0mBTMNkpjMIRex4oTxjt2+qT6qHxeoF+EenohVh0LgSXbGgXuXPMVAOnugNgWe7AN
 U4oAyfcamsB1VNAO88bj4iV+M6bG89e/wnbSIx1FcZ1aNzIF2UDDv8jW8HT+Nk10BqN1
 7H5Gwvnb5HC9jLTHxGtEjUMMftgd/nQKV3eXpa0QTtge+51Gm0l0HYBvdo8jqqjvS0Pk
 s6GbuFU9L8aGB+tXxKmYUv6FwNZddha5L66Hz7uPISy/rtNgXUytTCcueNaTBrXW++y2
 9vWNPrbeiXt8Q4drWnLlwsYXZovBf1shl8SoAJxGluQBzE4/S3yK+07lcjy4BrA1dq5B
 ab2g==
X-Gm-Message-State: AOAM5315krMtwgbkLT7TO/PYOi6GFZD7i2pGfoQWc35V9JLiyRw4EUxi
 gsJVxpVPz117CB5HzjYK3yZNF4Eaj896+w==
X-Google-Smtp-Source: ABdhPJxf4kY3lxTv4tUsiUdlIXHzAi46C6zsptRacAUprOM2gYJZ21r1BHXZK3QxacjqN/ze/FqE3g==
X-Received: by 2002:a62:4e0e:0:b029:39a:56d1:6d47 with SMTP id
 c14-20020a624e0e0000b029039a56d16d47mr11775335pfb.1.1627434165297; 
 Tue, 27 Jul 2021 18:02:45 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b3sm5081459pfi.179.2021.07.27.18.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/13] drm/msm/submit: Simplify out-fence-fd handling
Date: Tue, 27 Jul 2021 18:06:10 -0700
Message-Id: <20210728010632.2633470-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

No need for this to be split in two parts.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index e789f68d5be1..8abd743adfb0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -645,7 +645,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_file_private *ctx = file->driver_priv;
 	struct msm_gem_submit *submit;
 	struct msm_gpu *gpu = priv->gpu;
-	struct sync_file *sync_file = NULL;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
@@ -824,22 +823,19 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		sync_file = sync_file_create(submit->fence);
+		struct sync_file *sync_file = sync_file_create(submit->fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 			goto out;
 		}
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
 	}
 
 	msm_gpu_submit(gpu, submit);
 
 	args->fence = submit->fence->seqno;
 
-	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		fd_install(out_fence_fd, sync_file->file);
-		args->fence_fd = out_fence_fd;
-	}
-
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
 	                      submit->fence);
-- 
2.31.1

