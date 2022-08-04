Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F358978B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 07:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B328B11B65A;
	Thu,  4 Aug 2022 05:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFD6113271
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 05:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659592246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cev55DyzC4odc+3YqhUlZqMO2fmB6uB34qSnSGdGLMo=;
 b=UioZpSpOGr/mKCKPzSKRfcHZWgbBGkf8NrjBuU09fxPT5ZFNJsh1ugA8VIAmH0V6rJwBAn
 AAYkjQwbVrUg0K4K438e+o6PNI+2gIvzpSjh6E/zBMNRRZ+Ed+qwXdckPU1z1SWClGubya
 afNQ5z0Y1UO9zLp8bT5aB3Hir0aYFsM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-yscdKHn_MJ6Me-W3PePBzw-1; Thu, 04 Aug 2022 01:50:41 -0400
X-MC-Unique: yscdKHn_MJ6Me-W3PePBzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AB1E1C05AA9;
 Thu,  4 Aug 2022 05:50:41 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 505A72166B26;
 Thu,  4 Aug 2022 05:50:39 +0000 (UTC)
From: Dave Airlie <airlied@redhat.com>
To: torvalds@linux-foundation.org
Subject: [PATCH] drm/amd/display: restore plane with no modifiers code.
Date: Thu,  4 Aug 2022 15:50:36 +1000
Message-Id: <20220804055036.691670-1-airlied@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: Dave Airlie <airlied@redhat.com>, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When this file was split in

5d945cbcd4b16a29d6470a80dfb19738f9a4319f
Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date:   Wed Jul 20 15:31:42 2022 -0400

drm/amd/display: Create a file dedicated to planes

This chunk seemed to get dropped. Linus noticed on this
rx580 and I've reproduced on FIJI which makes sense as these
are pre-modifier GPUs.

With this applied, I get gdm back.

Fixes: 5d945cbcd4b1 ("drm/amd/display: Create a file dedicated to planes")
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8cd25b2ea0dc..b841b8b0a9d8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1591,6 +1591,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	if (res)
 		return res;
 
+	if (modifiers == NULL)
+		adev_to_drm(dm->adev)->mode_config.fb_modifiers_not_supported = true;
+
 	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
 				       &dm_plane_funcs, formats, num_formats,
 				       modifiers, plane->type, NULL);
-- 
2.37.1

