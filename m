Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC030950730
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1AF10E360;
	Tue, 13 Aug 2024 14:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qzK8Hv/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AFE10E360;
 Tue, 13 Aug 2024 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KitSnO25aWPFLJdOVqOqaXjJpFf3iv/SNwDWSXYBmm4=; b=qzK8Hv/XtmlXdEZsC4riHEraCC
 xt4MS5vFkvSAvC0qa3Pa+wCI7EG3atWt/4e0T+WER3lncJNMhZvDMeiFu/eqixaIp/6ZvXjoNK/+z
 Znf9jO1B7R8vkSosprNyUZGTY8wc6OUCZ+zYt+M8IZ6CH2JqN3uAEpNVRRV6OK48Su/4yr2SqOf64
 6Gls8owS4tux27R1cfW5vymBi2dFgqLTY5lUtKmFJoqkUsJRLys8FSa0KnSr5vhQS7y8+36Rd7QjP
 KrJ9MFCGbh/0ePxwzrcWunHOCOT1xiZhiz/YplL2fDr7Nn2yhO3I0BYRwin4LAVFxDmLw72y7ZQC/
 pZ1kbACA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sdsCT-00ByA7-5G; Tue, 13 Aug 2024 16:08:37 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH] drm/amdgpu: Remove hidden double memset from
 amdgpu_vm_pt_clear()
Date: Tue, 13 Aug 2024 15:08:35 +0100
Message-ID: <20240813140835.82748-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

When CONFIG_INIT_STACK_ALL_ZERO is set and so -ftrivial-auto-var-init=zero
compiler option active, compiler fails to notice that later in
amdgpu_vm_pt_clear() there  is a second memset to clear the same on stack
struct amdgpu_vm_update_params.

If we replace this memset with an explicit automatic variable initializer,
compiler can then see it and avoid clearing this struct twice.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
This is perhaps a bit questionable, regardless of how annoying it is to
know there is this double memset.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index e39d6e7643bf..ecdc8fffe941 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -361,7 +361,7 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 {
 	unsigned int level = adev->vm_manager.root_level;
 	struct ttm_operation_ctx ctx = { true, false };
-	struct amdgpu_vm_update_params params;
+	struct amdgpu_vm_update_params params = { };
 	struct amdgpu_bo *ancestor = &vmbo->bo;
 	unsigned int entries;
 	struct amdgpu_bo *bo = &vmbo->bo;
@@ -398,7 +398,6 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		goto exit;
 
-	memset(&params, 0, sizeof(params));
 	params.adev = adev;
 	params.vm = vm;
 	params.immediate = immediate;
-- 
2.44.0

