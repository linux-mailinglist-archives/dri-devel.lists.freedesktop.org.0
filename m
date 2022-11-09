Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FCB622783
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A7F10E51B;
	Wed,  9 Nov 2022 09:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B42810E13A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:50:19 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id f27so45220189eje.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 01:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJBFTRcNwwbuIBVh7uk8D1dXIHh8Bq+X8ggGiiL72aQ=;
 b=MeCdhokzMXMvFhVqJDSGh4c9x7xSboG9rtPcva94GfBrWYDdKNP/EWAsD4WAH0fsc4
 lpjm7lx75MmeHsQLplXu1UOEfTu6rM8oz51h8v5pNqlkaxBL6wX6lONcNKFKa+vkxD3W
 EJeKSK8eDz86pBOqLiDLnVvU5tcYHeHpWJ5Zz2OuRAqiD5QGjk6KzM4PPlLiibYVLDGq
 VPJ5j6TZcU0eA9+XWFEny2j42AhzirDYeU/KI9WjAPGec+QW+jVFDnO73XjyioT/iT6t
 O4fhNcwrDPXs4Z+8j/U0a+rmAKmo89OrtpeKns0Gmq2IKuuebS4JE3yEk+3cBHEWNS2a
 +tWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJBFTRcNwwbuIBVh7uk8D1dXIHh8Bq+X8ggGiiL72aQ=;
 b=awMk4THLepQCwWWtyxYWRp7H9oV/cNY61HcnsqOtaMr0NxEryGyTEE1tWpAGdpVdTy
 PSdGXSuMv79tH9/AYNKcHTMkK68LXJtqSg5gOY/F7xfL4QwliRUy2cImlC05RBhicBGB
 pzs7fSSnb/w6hafVGeFOB4JbB0Ri2LKLXrTs2a3n3QpvSIRJVpM8vkEdrqH/mcAbhZqU
 rLGZ1Tq0F7u8vfY9uYovdGY3Uf+uPbqdNCRNFWiqMvX1UDdEaN0ww6Z0aEzM5MUbOVIm
 J21k3aIDw5vf8hRB/ybyt3CyGtbo+napfs+T1/BIuW3oxCMAAS+s87kx9n99PAkFH6Za
 UbmQ==
X-Gm-Message-State: ACrzQf2x0/pq+ol8RDUYy9Ool/P4tvUe9bfSfaHrRB4PvaSNQfJI0CWA
 CUVnzv9UEAVSUouKkupdUx4=
X-Google-Smtp-Source: AMsMyM6bn+JDxdsvdz/Pguutl1+cyXvFPG0VoIq4nTtQ5F0GF7+rZKKfcQuCsNccmMmVzgis47TkEA==
X-Received: by 2002:a17:907:77d5:b0:73f:40a9:62ff with SMTP id
 kz21-20020a17090777d500b0073f40a962ffmr1110246ejc.678.1667987417433; 
 Wed, 09 Nov 2022 01:50:17 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a1709062ecc00b00780f24b797dsm5604543eji.108.2022.11.09.01.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:50:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Shaoyun.Liu@amd.com
Subject: [PATCH 5/5] drm/scheduler: deprecate drm_sched_resubmit_jobs
Date: Wed,  9 Nov 2022 10:50:10 +0100
Message-Id: <20221109095010.141189-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109095010.141189-1-christian.koenig@amd.com>
References: <20221109095010.141189-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This interface is not working as it should.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e77e1fd16732..9eacce8aae3f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -489,10 +489,21 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 EXPORT_SYMBOL(drm_sched_start);
 
 /**
- * drm_sched_resubmit_jobs - helper to relaunch jobs from the pending list
+ * drm_sched_resubmit_jobs - Deprecated, don't use in new code!
  *
  * @sched: scheduler instance
  *
+ * Re-submitting jobs was a concept AMD came up as cheap way to implement
+ * recovery after a job timeout.
+ *
+ * This turned out to be not working very well. First of all there are many
+ * problem with the dma_fence implementation and requirements. Either the
+ * implementation is risking deadlocks with core memory management or violating
+ * documented implementation details of the dma_fence object.
+ *
+ * Drivers can still save and restore their state for recovery operations, but
+ * we shouldn't make this a general scheduler feature around the dma_fence
+ * interface.
  */
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
 {
-- 
2.34.1

