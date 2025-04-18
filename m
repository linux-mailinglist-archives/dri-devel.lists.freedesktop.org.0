Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA826A934A8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 10:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8D510E41D;
	Fri, 18 Apr 2025 08:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.b="Zlm/WRwQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCC410E41D;
 Fri, 18 Apr 2025 08:31:36 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1744965090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Fkkq5isjGMmYO0XquNBWOmOM8h/DO8YafFqbHxC1G8=;
 b=Zlm/WRwQZgiQoeAvLcqEuRclvt0sHh5uh1ff0FcCW1gt3wshdcWkDH373Y/SOJM65upjvy
 aUho3Bb8UsT3uPJjALO/f5wHORbP48iGKaYd+p13s+jA4BX4iYGXAn69S7cakwkC5qohHy
 xok9Lp/LgYjLM/Q53dce59tKgagRVzs=
To: Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Chunming Zhou <david1.zhou@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
Date: Fri, 18 Apr 2025 11:31:27 +0300
Message-ID: <20250418083129.9739-1-arefev@swemel.ru>
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

The user can set any value to the variable ‘bo_number’, via the ioctl
command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
expression ‘in->bo_number * in->bo_info_size’, which is prone to
overflow. Add a valid value check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioctl v3")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
V1 -> V2:
Set a reasonable limit 'USHRT_MAX' for 'bo_number' it as Christian König <christian.koenig@amd.com> suggested

 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 702f6610d024..85f7ee1e085d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 	struct drm_amdgpu_bo_list_entry *info;
 	int r;
 
+	if (!in->bo_number || in->bo_number > USHRT_MAX)
+		return -EINVAL;
+
 	info = kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.43.0

