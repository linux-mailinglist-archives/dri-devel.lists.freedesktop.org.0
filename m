Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00741943AF7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701C510E790;
	Thu,  1 Aug 2024 00:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="atyeGyIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1B10E78D;
 Thu,  1 Aug 2024 00:22:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C66B6173D;
 Thu,  1 Aug 2024 00:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5D7C32786;
 Thu,  1 Aug 2024 00:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471734;
 bh=82yBQ9HMB3EWbKBAE5gC3b8YGIBzlQWgv+Awk7sMSTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=atyeGyIv0lSWSCnNckQIuvsPCx6MpUgzWdZmQG9VX3/pDJEO8VR1o1PpLjixI3DGr
 oSu7YkXu4TkP2gp5TBuqMTQuHHh6ig6OI9TQXhnncjUgGzIHJbq5zK6mMF8957Ju7N
 65cMHOkA1Io6ySs7orz5DnXO7qJ27Xm1ZIORL4Fjz2bl9X8fzhxhqOcIf2c+lgSGRe
 GXNb/LMZYImt5zgNCOicDjTqlageTc/ywunbjcixJKYUkkNOvKB9h+sdE+9tHPqXmk
 2cG7YjiS6GliOW+Wxjx8lFxOpg3dzrFHuH50/9+HUoqrpHJ80juUOIwa1zjpSmchiy
 rtL/UAie8Tc2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, hamza.mahfooz@amd.com, lewis.huang@amd.com,
 mghaddar@amd.com, ian.chen@amd.com, srinivasan.shanmugam@amd.com,
 Bhawanpreet.Lakha@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 13/83] drm/amd/display: Skip updating link encoder
 for unknown eng_id
Date: Wed, 31 Jul 2024 20:17:28 -0400
Message-ID: <20240801002107.3934037-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit efabdce3db9f3d306084c8946983f3d895810a6b ]

This prevents accessing to negative index of link_encoders array.

This fixes an OVERRUN issue reported by Coverity.

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/link/link_factory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index 2c366866f5700..6fc0cb918b9e5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -408,7 +408,7 @@ static void link_destruct(struct dc_link *link)
 		 * the dynamic assignment of link encoders to streams. Virtual links
 		 * are not assigned encoder resources on creation.
 		 */
-		if (link->link_id.id != CONNECTOR_ID_VIRTUAL) {
+		if (link->link_id.id != CONNECTOR_ID_VIRTUAL && link->eng_id != ENGINE_ID_UNKNOWN) {
 			link->dc->res_pool->link_encoders[link->eng_id - ENGINE_ID_DIGA] = NULL;
 			link->dc->res_pool->dig_link_enc_count--;
 		}
-- 
2.43.0

