Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6558D644003
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 10:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8538F89CF6;
	Tue,  6 Dec 2022 09:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7C289CF6;
 Tue,  6 Dec 2022 09:43:07 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1670319783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2JW7gMUzxibRP+GHgK8qpM96Hq/qafYCWCOIJkhoC7M=;
 b=KcIUWuiXVk3IwtwMxtT4aKYFQWrP40qyqqpg2MzjWGXlOH5h4Ki6IJFYZwiw3CdyRUAfCh
 Hj7szKU7U4WTUVGpe7sjngFjwdCUceZeH1goOOJxa4X6qS+v2qn2BDqhEOHBWkwKswyRI3
 /R1GIXHBdNITD2NXoZafkI1oXpCXSFQ=
To: Harry Wentland <harry.wentland@amd.com>
Subject: 
Date: Tue,  6 Dec 2022 12:43:03 +0300
Message-Id: <20221206094303.29282-1-arefev@swemel.ru>
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
Cc: trufanov@swemel.ru, lvc-project@linuxtesting.org,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, vfh@swemel.ru,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Thu, 10 Nov 2022 16:47:26 +0300
Subject: [PATCH] drm/amdgpu/display: Add pointer check

Return value of a function 'dc_create_state' is
dereferenced at amdgpu_dm.c:2027 without checking for null

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0f7749e9424d..529483997154 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1960,7 +1960,9 @@ static int dm_resume(void *handle)
 	dc_release_state(dm_state->context);
 	dm_state->context = dc_create_state(dm->dc);
 	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
-	dc_resource_state_construct(dm->dc, dm_state->context);
+	if (dm_state->context) {
+		dc_resource_state_construct(dm->dc, dm_state->context);
+	}
 
 	/* Before powering on DC we need to re-initialize DMUB. */
 	r = dm_dmub_hw_init(adev);
-- 
2.25.1

