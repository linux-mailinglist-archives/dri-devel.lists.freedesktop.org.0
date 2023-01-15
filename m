Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3379566B024
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jan 2023 10:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E077E10E0E7;
	Sun, 15 Jan 2023 09:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C9010E0E7;
 Sun, 15 Jan 2023 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673775142; bh=h3BV35ExW4Qp8mSJAt5y1TYkCZQhRUQwk+nplpac6xs=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=XRtOftUNorQbmCMcA54sJ3NrwQZVSNveuKgJbOSftQ3YhAniPLLuZd6n26IXyzBvP
 IdBHzt9gQ8rZfCuwx8McAyz0q2H+nOcVA26wP9Ap4z+eD/nstnLbVAdBeEhuEjwYMk
 Yn3IEohbNoTvKG/x3Sfn3FqUK71GNlLbyu9dxWok=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 15 Jan 2023 10:32:22 +0100 (CET)
X-EA-Auth: DwObgLNILM2GtGPAI+00q8N5h+32tnvd/PwBaxq/eKJBAyAYbimivsEbXvC9hVqYG8F0mkVbytx8mh28znre75c7q2Kq5iw9
Date: Sun, 15 Jan 2023 15:02:17 +0530
From: Deepak R Varma <drv@mailo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: avoid variable reinitialization
Message-ID: <Y8PIId1k1TmIAo18@ubun2204.myguest.virtualbox.org>
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

The member variable set_odm_combine is already initialized and hence the
reinitialization instruction can be removed. Issue identified using the
dubleinit.cocci Coccinelle semantic patch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
index 41edbd64ea21..777d8efee977 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
@@ -254,7 +254,6 @@ static struct timing_generator_funcs dcn314_tg_funcs = {
 		.get_hw_timing = optc1_get_hw_timing,
 		.init_odm = optc3_init_odm,
 		.set_odm_bypass = optc314_set_odm_bypass,
-		.set_odm_combine = optc314_set_odm_combine,
 		.set_h_timing_div_manual_mode = optc314_set_h_timing_div_manual_mode,
 };
 
-- 
2.34.1



