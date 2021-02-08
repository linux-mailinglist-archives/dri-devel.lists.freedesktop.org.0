Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7548313BD7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA8C6E98F;
	Mon,  8 Feb 2021 17:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FF06E98E;
 Mon,  8 Feb 2021 17:58:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FB4464EBF;
 Mon,  8 Feb 2021 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612807121;
 bh=JWGIl2wJdPtQsta544evU1X5AIPRaSGLq/L7vizkwzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FTRyvndFHaDwqFEcIH7iJiQD9SmTWm6vjC9vrq0CqHkvcjOQRQRxFlCYqIpVY75er
 D2Nu8+pD42+EH2JI+YYPAMKLOYFmC0lIFY7MbmiM7kCoTItCYjJ7oPi6VNOaaWxGRU
 Qk0z7NT+QTur6NVvX342Yn6cMGrPfM0+R8cPdwOmARezq/Cg+A+5xZoOO5EjEyeiFS
 cz+dHw6fTiD1rzfLMVCr0Y1KIs9ilfRbcZ6h0yfsSM+/pTKenHdc4mViv2Ky74nI4A
 DE+l1rIxlzQbHFVgrpd1lv4EEi5LuV4UDX9j4FFZylmmDkFJRSCHjl+SuHEnM74jog
 NIPWsDhkjLaUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 25/36] drm/amd/display: Decrement refcount of
 dc_sink before reassignment
Date: Mon,  8 Feb 2021 12:57:55 -0500
Message-Id: <20210208175806.2091668-25-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175806.2091668-1-sashal@kernel.org>
References: <20210208175806.2091668-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <Anson.Jacob@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Victor Lu <victorchengchi.lu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[ Upstream commit 8e92bb0fa75bca9a57e4aba2e36f67d8016a3053 ]

[why]
An old dc_sink state is causing a memory leak because it is missing a
dc_sink_release before a new dc_sink is assigned back to
aconnector->dc_sink.

[how]
Decrement the dc_sink refcount before reassigning it to a new dc_sink.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 695a5b83c00f9..022821334153b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2261,8 +2261,10 @@ void amdgpu_dm_update_connector_after_detect(
 		 * TODO: check if we still need the S3 mode update workaround.
 		 * If yes, put it here.
 		 */
-		if (aconnector->dc_sink)
+		if (aconnector->dc_sink) {
 			amdgpu_dm_update_freesync_caps(connector, NULL);
+			dc_sink_release(aconnector->dc_sink);
+		}
 
 		aconnector->dc_sink = sink;
 		dc_sink_retain(aconnector->dc_sink);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
