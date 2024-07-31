Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4D943A17
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464C210E702;
	Thu,  1 Aug 2024 00:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oOtNJbPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A241910E701;
 Thu,  1 Aug 2024 00:10:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 799B0CE11E4;
 Thu,  1 Aug 2024 00:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D43FC116B1;
 Thu,  1 Aug 2024 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471019;
 bh=9uq9hU9Kf4NkxDp1BJZg/eWYxzZPlBlb+KcL7Ctq3xY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oOtNJbPdNls+Z9ygIOlqdvWHm6XmXga9/JG35hrZ8JFFk1tyhEuqK+xhD1YW9Qis4
 wM6bj0hMqRO5l2WCcYdlofANilT28CmxR5u+5IDJtkNGIDwTRv4/wyfrMlbb2hoDeO
 tjQKnNyP4yYUFkYeTRyQx/N2cIpg7vLlLGbw22hLP9BBTS8Qya8ZlGwwqbsAozYvcu
 NEQBhCvC/Mk9fariOnHtVZnLI9KYipFeXPUhP4nYCyGdXlFT34EkIHzyq80g071zrz
 bDdquZ2WJJ97BuOSmZT40pwUJoso7wQwfQkcJrOmzAx1jIvsDuUTN8sJ+muVaJe0SX
 sd+WHcdd5Sxdw==
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
 mghaddar@amd.com, michael.strauss@amd.com, srinivasan.shanmugam@amd.com,
 Bhawanpreet.Lakha@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 019/121] drm/amd/display: Skip updating link
 encoder for unknown eng_id
Date: Wed, 31 Jul 2024 19:59:17 -0400
Message-ID: <20240801000834.3930818-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
index cf22b8f28ba6c..2c3f5d6622851 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -390,7 +390,7 @@ static void link_destruct(struct dc_link *link)
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

