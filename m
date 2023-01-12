Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD333667394
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54ED10E8EC;
	Thu, 12 Jan 2023 13:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F0110E8EC;
 Thu, 12 Jan 2023 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673531496; bh=ZAn7ZSvuny3A40ep6L1C3DqFhwPZfavNHTKFbfUsRxU=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=hsLsYzmBjETINLz1Ja9/z1RFZVcBYUbHn7a9lGQeWWxVIR2aOvEaCHM3hW/0vW3Wg
 4uQveX+YjNjCQ7FeCzMA0owVm4zZaIibEUhv69J8B1+mduCsJuL/r6IvseMXRAIcLL
 UKBbH2XziNiSDioZE0ffoofCAATDAKel1aRhBse4=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Thu, 12 Jan 2023 14:51:36 +0100 (CET)
X-EA-Auth: Jql7kLVBTRErAY5Y8kPmRih3iDlhh+Av3Q2tRc5pWKa4/h+rUuSd4pAfiyzp58G/Z7umku8+u+IV1WMtssm9vCSzWYHyaSk2
Date: Thu, 12 Jan 2023 19:21:30 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Conversion to bool not necessary
Message-ID: <Y8AQYhVkJjV86VXV@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A logical evaluation already results in bool. There is no need for using
a ternary operator based evaluation and bool conversion of the outcome.
Issue identified using boolconv.cocci Coccinelle semantic patch.
This was also reported by the Kernel Test Robot. Hence

Fixes: 473683a03495 ("drm/amd/display: Create a file dedicated for CRTC")

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 22125daf9dcf..1e39d0939700 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -105,8 +105,7 @@ static void vblank_control_worker(struct work_struct *work)
 	else if (dm->active_vblank_irq_count)
 		dm->active_vblank_irq_count--;
 
-	dc_allow_idle_optimizations(
-		dm->dc, dm->active_vblank_irq_count == 0 ? true : false);
+	dc_allow_idle_optimizations(dm->dc, dm->active_vblank_irq_count == 0);
 
 	DRM_DEBUG_KMS("Allow idle optimizations (MALL): %d\n", dm->active_vblank_irq_count == 0);
 
-- 
2.34.1



