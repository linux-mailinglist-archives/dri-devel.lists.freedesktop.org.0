Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6411475E4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 02:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D7E6E196;
	Fri, 24 Jan 2020 01:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5826E193
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 01:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579828088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MACu9eh0JEDCpTCpJs0kAJqbqqu5eAOpE4LnFleGthU=;
 b=KcAzv2LM0YWRHRs6KTp9OAoKzxCNagq/7ut5IRJGzRpW878VJiSimDE26G6edgyDnln093
 64bkAweaVdRe6FmooiJIjYNDnnYxDD6jfcmKxDleGEBr0A81373cT5w/RPH/hRemSriOFw
 Bnf/C9+nn9zivDmoG51lKZdrpGddMZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-c3DPU0T_NZi4TwsFF38BNg-1; Thu, 23 Jan 2020 20:08:06 -0500
X-MC-Unique: c3DPU0T_NZi4TwsFF38BNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF1E800D48;
 Fri, 24 Jan 2020 01:08:04 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-124-168.rdu2.redhat.com
 [10.10.124.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E28065D9E2;
 Fri, 24 Jan 2020 01:07:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Stop using the DRIVER debugging flag for vblank
 debugging messages
Date: Thu, 23 Jan 2020 20:07:42 -0500
Message-Id: <20200124010744.102849-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are some very loud debug statements that get printed on every
vblank when driver level debug printing is enabled in DRM, and doesn't
really tell us anything that isn't related to vblanks. So let's move
this over to the proper debug flag to be a little less spammy with our
debug output.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9402374d2466..3675e1c32707 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -407,8 +407,9 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 	if (acrtc) {
 		acrtc_state = to_dm_crtc_state(acrtc->base.state);
 
-		DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
-				 amdgpu_dm_vrr_active(acrtc_state));
+		DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n",
+			      acrtc->crtc_id,
+			      amdgpu_dm_vrr_active(acrtc_state));
 
 		/* Core vblank handling is done here after end of front-porch in
 		 * vrr mode, as vblank timestamping will give valid results
@@ -458,8 +459,9 @@ static void dm_crtc_high_irq(void *interrupt_params)
 	if (acrtc) {
 		acrtc_state = to_dm_crtc_state(acrtc->base.state);
 
-		DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
-				 amdgpu_dm_vrr_active(acrtc_state));
+		DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n",
+			      acrtc->crtc_id,
+			      amdgpu_dm_vrr_active(acrtc_state));
 
 		/* Core vblank handling at start of front-porch is only possible
 		 * in non-vrr mode, as only there vblank timestamping will give
@@ -522,8 +524,8 @@ static void dm_dcn_crtc_high_irq(void *interrupt_params)
 
 	acrtc_state = to_dm_crtc_state(acrtc->base.state);
 
-	DRM_DEBUG_DRIVER("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
-				amdgpu_dm_vrr_active(acrtc_state));
+	DRM_DEBUG_VBL("crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
+		      amdgpu_dm_vrr_active(acrtc_state));
 
 	amdgpu_dm_crtc_handle_crc_irq(&acrtc->base);
 	drm_crtc_handle_vblank(&acrtc->base);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
