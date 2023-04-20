Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203E6E9713
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D686910EC67;
	Thu, 20 Apr 2023 14:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EC910EC67
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682000970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6BdrM5PAXOTQN54lsRvoJTmZEachvXpdp/asoBdEKLk=;
 b=aT8EZ86DUPAHN92fEAy6StOJsD1rcXTLvQr91jFB+EAptiLU6l5S08U0ftPfADA2emX4q3
 ovi9BtjmlLtpwc9ldxM6IxzFWc1sadE7bVJX3CvyzhOWyXRqbFzEmNwGpowV/9Crpqj7+a
 FodbhqWR2JlhuzYJ+zAp2R/JYbvkLrw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-FEDNh06PON6VcvWuA_Wlcg-1; Thu, 20 Apr 2023 10:29:29 -0400
X-MC-Unique: FEDNh06PON6VcvWuA_Wlcg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef4bfeacc4so10681656d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682000969; x=1684592969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BdrM5PAXOTQN54lsRvoJTmZEachvXpdp/asoBdEKLk=;
 b=L8mFlRCA4R3fqP07H6vrYaYfYp22z/JWajSV5cxrr7LXp0sAoJC8KPNaqTOQ/3Akdt
 6zK2FWhju9WKWqmoK7zv5G8yHnE1K2YfPfpHpNJcf+FQ7qBBHjEchS4oZXiaEUXvsedU
 UouYs4dAqSzNgOno5e3naK+NFUYLD2zQI1aEZkgRylhpZteUJprBYGn1QNkul7Wez/he
 4wW0CPbyBPsFxHDsZXy/kwP60PKoH8KomElR+7tQiHAYsHHsulZxdqxAJN5GYxvgIW2f
 NRb2Q/efX5JQY104cejGiBqnO3bku8BauUu7peZ7gEEX/HAdciB0W4UOh+dbb31Fkk4o
 JVuQ==
X-Gm-Message-State: AAQBX9epVf/G0a0TdS9bDNrOvnxgZoRN7yWGXu0PrzG/oKdynP5ymAZ+
 Fyq3mwj5WFu38wPEOF5CL9krD+dnXuGV7vgNj52jhvQVw72pgo0TI8cmE+gZtoptlfy6GotOWH0
 wrzOxygp8JwHtzhwD+RBTou/SQWVr
X-Received: by 2002:a05:6214:301e:b0:56e:b557:2d4e with SMTP id
 ke30-20020a056214301e00b0056eb5572d4emr2242316qvb.6.1682000968832; 
 Thu, 20 Apr 2023 07:29:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350bh4jP9BRcxAXAQBGpztEZgR2c1DlH5MA0cabHVDBgEfStN28QcPkDWcM8pWXDcVwsX39FA5w==
X-Received: by 2002:a05:6214:301e:b0:56e:b557:2d4e with SMTP id
 ke30-20020a056214301e00b0056eb5572d4emr2242276qvb.6.1682000968521; 
 Thu, 20 Apr 2023 07:29:28 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a0cb3db000000b005e750d07153sm420904qvf.135.2023.04.20.07.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 07:29:28 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Hawking.Zhang@amd.com, le.ma@amd.com,
 Jack.Xiao@amd.com, YiPeng.Chai@amd.com, Lang.Yu@amd.com, Likun.Gao@amd.com,
 Arunpravin.PaneerSelvam@amd.com, andrealmeid@igalia.com
Subject: [PATCH] drm/amdgpu: remove unused variable j
Date: Thu, 20 Apr 2023 10:29:25 -0400
Message-Id: <20230420142925.3890505-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc with W=1 reports
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function
  ‘amdgpu_gfx_mqd_sw_fini’:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:451:16: error: variable
  ‘j’ set but not used [-Werror=unused-but-set-variable]
  451 |         int i, j;
      |                ^
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function
  ‘amdgpu_gfx_disable_kcq’:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:486:13: error: variable
  ‘j’ set but not used [-Werror=unused-but-set-variable]
  486 |         int j;
      |             ^
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function
  ‘amdgpu_gfx_enable_kcq’:
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:529:19: error: variable
  ‘j’ set but not used [-Werror=unused-but-set-variable]
  529 |         int r, i, j;
      |                   ^

These variables are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 7f5c60381103..ac6fd8620279 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -448,7 +448,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
 void amdgpu_gfx_mqd_sw_fini(struct amdgpu_device *adev, int xcc_id)
 {
 	struct amdgpu_ring *ring = NULL;
-	int i, j;
+	int i;
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
 
 	if (adev->asic_type >= CHIP_NAVI10 && amdgpu_async_gfx_ring) {
@@ -462,7 +462,6 @@ void amdgpu_gfx_mqd_sw_fini(struct amdgpu_device *adev, int xcc_id)
 	}
 
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
-		j = i + xcc_id * adev->gfx.num_compute_rings;
 		ring = &adev->gfx.compute_ring[i];
 		kfree(adev->gfx.mec.mqd_backup[i]);
 		amdgpu_bo_free_kernel(&ring->mqd_obj,
@@ -483,7 +482,6 @@ int amdgpu_gfx_disable_kcq(struct amdgpu_device *adev, int xcc_id)
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
 	struct amdgpu_ring *kiq_ring = &kiq->ring;
 	int i, r = 0;
-	int j;
 
 	if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
 		return -EINVAL;
@@ -495,11 +493,9 @@ int amdgpu_gfx_disable_kcq(struct amdgpu_device *adev, int xcc_id)
 		return -ENOMEM;
 	}
 
-	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
-		j = i + xcc_id * adev->gfx.num_compute_rings;
+	for (i = 0; i < adev->gfx.num_compute_rings; i++)
 		kiq->pmf->kiq_unmap_queues(kiq_ring, &adev->gfx.compute_ring[i],
 					   RESET_QUEUES, 0, 0);
-	}
 
 	if (adev->gfx.kiq[0].ring.sched.ready && !adev->job_hang)
 		r = amdgpu_ring_test_helper(kiq_ring);
@@ -526,7 +522,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
 	struct amdgpu_ring *kiq_ring = &kiq->ring;
 	uint64_t queue_mask = 0;
-	int r, i, j;
+	int r, i;
 
 	if (!kiq->pmf || !kiq->pmf->kiq_map_queues || !kiq->pmf->kiq_set_resources)
 		return -EINVAL;
@@ -562,10 +558,8 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
 		queue_mask = ~0ULL;
 
 	kiq->pmf->kiq_set_resources(kiq_ring, queue_mask);
-	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
-		j = i + xcc_id * adev->gfx.num_compute_rings;
+	for (i = 0; i < adev->gfx.num_compute_rings; i++)
 		kiq->pmf->kiq_map_queues(kiq_ring, &adev->gfx.compute_ring[i]);
-	}
 
 	r = amdgpu_ring_test_helper(kiq_ring);
 	spin_unlock(&kiq->ring_lock);
-- 
2.27.0

