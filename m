Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5558DA06493
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E1410E913;
	Wed,  8 Jan 2025 18:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ao8BXaw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA9510E913
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AdaTHhLCVsBPy9KGnKQBZQE+D4b6WwdQ0UzmorkoCdg=; b=ao8BXaw7OB8NNiryRgdmjGeu+a
 WN5JtW7bamUsGVVBWOxmW34v183FtZHEOkKr8cWVKSbt4ktd2+Sij6tf07QMPJa82lvfJxFeBN7nH
 C1n6isFVT65UqsL7E0QrVtGV9EqUjIMluyELhcIra+oqrX7Nuu4LJWTlFuH4cSi5hfeEn9yP2hUr3
 o7n7weNiCbQjDcLVoMI+s2nr77CLYixuUrK9kgxJFu5qPFJy6xMlWjacBDfmS4rzUKFIpB9OST5/E
 xO7eQXVUWOIrI/mhUZdbiNbSXyU2PM3hoPdfu+dwyfjp/st541iPzko5xAVnirLHAzFcXL3ISJa/b
 5ri6ePIg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVatx-00DFEe-Oj; Wed, 08 Jan 2025 19:35:33 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 01/18] drm/amdgpu: Use DRM scheduler API in
 amdgpu_xcp_release_sched
Date: Wed,  8 Jan 2025 18:35:11 +0000
Message-ID: <20250108183528.41007-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
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

Lets use the existing helper instead of peeking into the structure
directly.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index e209b5e101df..23b6f7a4aa4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -427,7 +427,7 @@ void amdgpu_xcp_release_sched(struct amdgpu_device *adev,
 		return;
 
 	sched = entity->entity.rq->sched;
-	if (sched->ready) {
+	if (drm_sched_wqueue_ready(sched)) {
 		ring = to_amdgpu_ring(entity->entity.rq->sched);
 		atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
 	}
-- 
2.47.1

