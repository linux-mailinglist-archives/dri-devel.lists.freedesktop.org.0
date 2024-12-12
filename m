Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7E9EE672
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA5510E2F6;
	Thu, 12 Dec 2024 12:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kt/nNy29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9110E2F6;
 Thu, 12 Dec 2024 12:17:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A30B3A414B3;
 Thu, 12 Dec 2024 12:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FD5C4CECE;
 Thu, 12 Dec 2024 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734005844;
 bh=UIM6zMna/s3NSzkCEg6xzfrVqD4UMcFm3qN3oRpS6Yg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Kt/nNy291C7cMxRdPH44FBbb1XCVIYsEoC5TgY+SRMLXcl1+ugit5Lwubvt/y5sP9
 BnF3eN0HNuOZwqOvja8ok/er5PKoKHj2q6HOpxJ9f7m06zryKuEEfPlCRe/fnPvGhH
 RaKwmuocWbOIuNK8x55jMpueDjEX/WqZGmgiY9BU=
Subject: Patch "[PATCH 6.1.y] drm/amd/display: Don't refer to dc_sink in
 is_dsc_need_re_compute" has been added to the 5.4-stable tree
To: Jerry.Zuo@amd.com, Rodrigo.Siqueira@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, daniel.wheeler@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 harry.wentland@amd.com, jerry.zuo@amd.com, jianqi.ren.cn@windriver.com,
 patches@lists.linux.dev, sunpeng.li@amd.com, wayne.lin@amd.com,
 zaeem.mohamed@amd.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 Dec 2024 13:17:19 +0100
In-Reply-To: <20241211101544.2121147-1-jianqi.ren.cn@windriver.com>
Message-ID: <2024121217-rephrase-doctrine-7415@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    [PATCH 6.1.y] drm/amd/display: Don't refer to dc_sink in is_dsc_need_re_compute

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-don-t-refer-to-dc_sink-in-is_dsc_need_re_compute.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From jianqi.ren.cn@windriver.com  Thu Dec 12 13:11:21 2024
From: <jianqi.ren.cn@windriver.com>
Date: Wed, 11 Dec 2024 18:15:44 +0800
Subject: [PATCH 6.1.y] drm/amd/display: Don't refer to dc_sink in is_dsc_need_re_compute
To: <wayne.lin@amd.com>, <gregkh@linuxfoundation.org>
Cc: <patches@lists.linux.dev>, <jerry.zuo@amd.com>, <zaeem.mohamed@amd.com>, <daniel.wheeler@amd.com>, <alexander.deucher@amd.com>, <stable@vger.kernel.org>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>, <Jerry.Zuo@amd.com>, <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Message-ID: <20241211101544.2121147-1-jianqi.ren.cn@windriver.com>


From: Wayne Lin <wayne.lin@amd.com>

[ Upstream commit fcf6a49d79923a234844b8efe830a61f3f0584e4 ]

[Why]
When unplug one of monitors connected after mst hub, encounter null pointer dereference.

It's due to dc_sink get released immediately in early_unregister() or detect_ctx(). When
commit new state which directly referring to info stored in dc_sink will cause null pointer
dereference.

[how]
Remove redundant checking condition. Relevant condition should already be covered by checking
if dsc_aux is null or not. Also reset dsc_aux to NULL when the connector is disconnected.

Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 1acef5f3838f..a1619f4569cf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -183,6 +183,8 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 		dc_sink_release(dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->edid = NULL;
+		aconnector->dsc_aux = NULL;
+		port->passthrough_aux = NULL;
 	}
 
 	aconnector->mst_status = MST_STATUS_DEFAULT;
@@ -487,6 +489,8 @@ dm_dp_mst_detect(struct drm_connector *connector,
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
 		aconnector->edid = NULL;
+		aconnector->dsc_aux = NULL;
+		port->passthrough_aux = NULL;
 
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
 			MST_REMOTE_EDID | MST_ALLOCATE_NEW_PAYLOAD | MST_CLEAR_ALLOCATED_PAYLOAD,
-- 
2.25.1



Patches currently in stable-queue which might be from jianqi.ren.cn@windriver.com are

queue-5.4/drm-amd-display-don-t-refer-to-dc_sink-in-is_dsc_need_re_compute.patch
