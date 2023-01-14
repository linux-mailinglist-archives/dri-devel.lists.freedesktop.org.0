Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FF66AE23
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 22:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE8210E281;
	Sat, 14 Jan 2023 21:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1355A10E281;
 Sat, 14 Jan 2023 21:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673731242; bh=4z9iFsp+DoxOPsRSJrEoIW+T8SbcfTIo02z3jd9D0wM=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=CmnvkdPl6rp+Kbmh0xBTbVHp2sV2BGpyAvubPOyhS5BQIaNp3pYHMKajTRf/bdFfV
 zlySr32Jo+FnBoPPlKg31edrfRnLWY/aiAa/xKE7EiaysV1fmDnOSDzBhjtLTiTmiI
 9YyW5KE1CthR2zbwTvrI2qfoCriqGd93Wfz1W4Xs=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 14 Jan 2023 22:20:42 +0100 (CET)
X-EA-Auth: cG/HSE5fIY7LcfmQRMBTYSk9qPaokkOPoCvufGol1mWz4fKAhqA0EQkemPxgt247sp/8c2u/07Yh6IU0+a9uvEVBusVi5/7j
Date: Sun, 15 Jan 2023 02:50:37 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/amd/display: dcn20: Use min()/max() helper macros
Message-ID: <fe281d361affb39b698211e3165af645089af92a.1673730293.git.drv@mailo.com>
References: <cover.1673730293.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673730293.git.drv@mailo.com>
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

Use the standard min() / max() helper macros instead of direct variable
comparison using if/else blocks or ternary operator. Change identified
using minmax.cocci Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c   | 5 +----
 .../gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index d3b5b6fedf04..850bb0f973d4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -626,10 +626,7 @@ static bool CalculatePrefetchSchedule(
 
 	dst_y_prefetch_oto = Tpre_oto / LineTime;
 
-	if (dst_y_prefetch_oto < dst_y_prefetch_equ)
-		*DestinationLinesForPrefetch = dst_y_prefetch_oto;
-	else
-		*DestinationLinesForPrefetch = dst_y_prefetch_equ;
+	*DestinationLinesForPrefetch = min(dst_y_prefetch_oto, dst_y_prefetch_equ);
 
 	*DestinationLinesForPrefetch = dml_floor(4.0 * (*DestinationLinesForPrefetch + 0.125), 1)
 			/ 4;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index edd098c7eb92..6f4903525acc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -686,10 +686,7 @@ static bool CalculatePrefetchSchedule(
 
 	dst_y_prefetch_oto = Tpre_oto / LineTime;
 
-	if (dst_y_prefetch_oto < dst_y_prefetch_equ)
-		*DestinationLinesForPrefetch = dst_y_prefetch_oto;
-	else
-		*DestinationLinesForPrefetch = dst_y_prefetch_equ;
+	*DestinationLinesForPrefetch = min(dst_y_prefetch_oto, dst_y_prefetch_equ);
 
 	*DestinationLinesForPrefetch = dml_floor(4.0 * (*DestinationLinesForPrefetch + 0.125), 1)
 			/ 4;
-- 
2.34.1



