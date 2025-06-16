Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB14ADB89A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 20:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C841710E416;
	Mon, 16 Jun 2025 18:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OpaF8pqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE09D10E425;
 Mon, 16 Jun 2025 18:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=psYij8s9Ia2uYH+3eeL2z0De96IT8g97QGXw+98uT8g=; b=OpaF8pqhsEEyn/YUt8Ls0rCWPP
 Fex+nlV8DsU7HvGjjEPobjGnW2KFYWfiw0vUnYH9hxr+JYmdsL7YWI/70HX39eTl1+ZfUY2ZOLmYV
 T0+Hvx6FkVrmAZd114MFj78urHM5fGMqSF/2tB1g+/jWhLvwHezAfsrtUIU+UCv1mPGjbyTOsdi9x
 S+cpiHUKFnFxwKsVbpWqVrn6uRqVzK3kAOkNCKesMWc5tJMXEzLGEWRLyXsFOW9FN3bR/N9UuSphF
 IynfJs/xVwMTF8oy6zrenXhytgRCSolV/Rhxhw+LOVeG+75Hm6bUALPZUzOI4QK6fTmcFqb+13o9f
 vLq32qpg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uREMa-004Eh6-4E; Mon, 16 Jun 2025 20:15:20 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 "Raag Jadav" <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v8 1/6] drm: amdgpu: Allow NULL pointers at
 amdgpu_vm_put_task_info()
Date: Mon, 16 Jun 2025 15:14:33 -0300
Message-ID: <20250616181438.2124656-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616181438.2124656-1-andrealmeid@igalia.com>
References: <20250616181438.2124656-1-andrealmeid@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow NULL pointers at amdgpu_vm_put_task_info() as it common practice
for "put" or "free" functions. This avoid an extra check for NULL for
callers.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v8: New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..dadf5633476c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2447,6 +2447,9 @@ amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
  */
 void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info)
 {
+	if (unlikely(ZERO_OR_NULL_PTR(task_info)))
+		return;
+
 	kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
 }
 
-- 
2.49.0

