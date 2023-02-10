Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850FC691C1A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 11:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AAD10E14A;
	Fri, 10 Feb 2023 10:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C434010E14A;
 Fri, 10 Feb 2023 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1676023251; bh=OSyoTpdJIQ68wdvoa27f76+Ft7Eat4Qqrj2ni75ZjlY=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=dLN2v0lJNO/R9XxljsTYyDGzEDcp46LY7SNLllVfNCzD59qU1Xfh2AAjjb77EzHlD
 0iCewyeMeYqIgOf9b9gL22kOyJnhRoj1jaIRP20lGA/uckiiTteo1Y2WYCAzHKM14E
 86VlK2KInkvDzlH/OUhk76ITv+OKG7NbznBa4rmI=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 10 Feb 2023 11:00:51 +0100 (CET)
X-EA-Auth: Nf6tPsEPxv5OhlOXiVf8OdDvgK+wSKjuCHgTMdsYfS0p/LNkCjDFiz1fDavnjR+SPdxr0xlQkEZmnQxvn4NhObJwXjiOC9io
Date: Fri, 10 Feb 2023 15:30:43 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Remove duplicate/repeating expressions
Message-ID: <Y+YVy7RaxnXokJ3l@ubun2204.myguest.virtualbox.org>
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
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove duplicate or repeating expressions in the if condition
evaluation. Issue identified using doubletest.cocci Coccinelle semantic
patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index 4b8f5fa0f0ad..ae89760d887d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -2335,8 +2335,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.ForcedOutputLinkBPP[k] != 0)
 				mode_lib->vba.DSCOnlyIfNecessaryWithBPP = true;
-			if ((mode_lib->vba.DSCEnable[k] || mode_lib->vba.DSCEnable[k])
-					&& mode_lib->vba.OutputFormat[k] == dm_n422
+			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.OutputFormat[k] == dm_n422
 					&& !mode_lib->vba.DSC422NativeSupport)
 				mode_lib->vba.DSC422NativeNotSupported = true;
 
@@ -3639,7 +3638,6 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
-					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_8
 					&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe) {
 				if (mode_lib->vba.ViewportWidthChroma[k] > mode_lib->vba.SurfaceWidthC[k]
-- 
2.34.1



