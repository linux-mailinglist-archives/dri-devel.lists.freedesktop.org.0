Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A075A05C7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDA0D07CC;
	Thu, 25 Aug 2022 01:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061C14B696;
 Thu, 25 Aug 2022 01:35:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C9ED2B826DA;
 Thu, 25 Aug 2022 01:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96C5C4347C;
 Thu, 25 Aug 2022 01:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391297;
 bh=lUxI790MNcbkGJSK6krcvy3O2bLEsNoGnXLWxpg4Pt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sqOpjxKosiiKCt1iHlLLkf9dciu3jeQhbusOhwp5TdxWo+liaePC+gysJl05ouvek
 pKxSpgJyDGzPTyMd4UkSmFoTJeAxcbp8ecJetwFVDog4bwoMjGxXzD0BnhlnNkiAkw
 hJMkeUjsY2cs2T22nb5woQXNJvO47yUfVKupKjGRUytnnKG3F7O2eG0q+hq76nUyL4
 UVcOIwIKd07aq4nVRGHOazT9kMYMx2P9NNdILsZToRkbL7olPe9DZgrsO415nZSrLS
 1gXd+RWIb5g3CvH1aGDBHnwxwVpB25d7tcNJpojxVzM8d02emSGTBJFUF0scXoW6La
 WczCxdQopHLUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 09/38] drm/amd/display: For stereo keep
 "FLIP_ANY_FRAME"
Date: Wed, 24 Aug 2022 21:33:32 -0400
Message-Id: <20220825013401.22096-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Tom Chung <chiahsuan.chung@amd.com>,
 sunpeng.li@amd.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Martin Leung <Martin.Leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, joshua@froggi.es, Pavle.Kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Lee <alvin.lee2@amd.com>

[ Upstream commit 84ef99c728079dfd21d6bc70b4c3e4af20602b3c ]

[Description]
Observed in stereomode that programming FLIP_LEFT_EYE
can cause hangs. Keep FLIP_ANY_FRAME in stereo mode so
the surface flip can take place before left or right eye

Reviewed-by: Martin Leung <Martin.Leung@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alvin Lee <alvin.lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
index 6a4dcafb9bba..dc3e8df706b3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
@@ -86,7 +86,7 @@ bool hubp3_program_surface_flip_and_addr(
 			VMID, address->vmid);
 
 	if (address->type == PLN_ADDR_TYPE_GRPH_STEREO) {
-		REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_FLIP_MODE_FOR_STEREOSYNC, 0x1);
+		REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_FLIP_MODE_FOR_STEREOSYNC, 0);
 		REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_FLIP_IN_STEREOSYNC, 0x1);
 
 	} else {
-- 
2.35.1

