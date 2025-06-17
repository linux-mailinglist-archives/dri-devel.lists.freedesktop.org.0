Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A840AADCBE8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A511710E630;
	Tue, 17 Jun 2025 12:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lcwt4GNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245A10E3C5;
 Tue, 17 Jun 2025 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yrfDzOT2kIl7hEsjyNVf8qR8CQoShiARpH5JLckqStg=; b=lcwt4GNHHejK7Yucp1nwlPtmO3
 /SnV2hmq66V2+D3YE6T7zCdhrmH0mUfx/0SE4//A82ZdqXmiKrouvypINmRZV9ZTcfsJMLzfJWvSg
 227qsOh1Z/JqUS7K1i+mMIx0VqUGqY72/8FIpWGhZTrPI1LgCtiAeXik8RytUYmgSNrJufgMf2NWw
 /CLxsJaxuhNRhpnMS/NK10TimdUqISWeHxR42QEa1bUepFs3xX0QZKWlUDl4BXN8oPONtrZtqECPZ
 0L/GX4sSUSspbcxb5ilAHJQABXi964+Sfvcig3bL/zPNw6LB2l+eTAX7ccjStNzjGUGRP5GBM1W8z
 KSEIqD8g==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRVlM-004ans-Mu; Tue, 17 Jun 2025 14:50:05 +0200
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
Subject: [PATCH v9 1/6] drm: amdgpu: Allow NULL pointers at
 amdgpu_vm_put_task_info()
Date: Tue, 17 Jun 2025 09:49:44 -0300
Message-ID: <20250617124949.2151549-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617124949.2151549-1-andrealmeid@igalia.com>
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
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
v9: use if (task) instead of if (ZERO_OR_NULL_PTR(task))
v8: New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..de914a39e3f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2447,7 +2447,8 @@ amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
  */
 void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info)
 {
-	kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
+	if (task_info)
+		kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
 }
 
 /**
-- 
2.49.0

