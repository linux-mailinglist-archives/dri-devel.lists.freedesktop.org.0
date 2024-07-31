Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E19943A61
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175D110E731;
	Thu,  1 Aug 2024 00:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ka1dhn+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C75F10E731;
 Thu,  1 Aug 2024 00:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C832F6130B;
 Thu,  1 Aug 2024 00:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D97C116B1;
 Thu,  1 Aug 2024 00:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471236;
 bh=R9OVsiwIBGuWRjh/v9KWxRWmZi2hM8JdzCHLJI7sh4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ka1dhn+6HGvXJD9TaAI7F6UQMEGADe3aRfSeEFSxFmT12TXIu5TAsf6pd4PL/c8gj
 wwQAPOCgK6byPcyjbRDc/2za7/2Dc8Zv6dX7/OEVxHOo6kYeUin6hq0oX5sLu1emCa
 IN+My7H+fEdsfJoVRDnAW8BDl4qTVQbDKpzjqR6PlhIGUKbf/E3mlz36Cd+xGWOmz3
 2jinNGZRn239YRMnbD0VOVLxP+LgnT+VE1J+REBXrPz2d/manv/jv3Ddsco9nN5oD/
 gF0+Pb8PDa0b/5SED8qyUqUGYGS5XeMYYux232LYoGpHeLWdL249rUTIyGSOR7qzoq
 39kITJ3RJIkUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, tao.zhou1@amd.com,
 Hawking.Zhang@amd.com, felix.kuehling@amd.com, lijo.lazar@amd.com,
 candice.li@amd.com, kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 047/121] drm/amdgpu: the warning dereferencing
 obj for nbio_v7_4
Date: Wed, 31 Jul 2024 19:59:45 -0400
Message-ID: <20240801000834.3930818-47-sashal@kernel.org>
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

From: Jesse Zhang <jesse.zhang@amd.com>

[ Upstream commit d190b459b2a4304307c3468ed97477b808381011 ]

if ras_manager obj null, don't print NBIO err data

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Suggested-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
index 19986ff6a48d7..750ce281b97bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -387,7 +387,7 @@ static void nbio_v7_4_handle_ras_controller_intr_no_bifring(struct amdgpu_device
 		else
 			WREG32_SOC15(NBIO, 0, mmBIF_DOORBELL_INT_CNTL, bif_doorbell_intr_cntl);
 
-		if (!ras->disable_ras_err_cnt_harvest) {
+		if (ras && !ras->disable_ras_err_cnt_harvest && obj) {
 			/*
 			 * clear error status after ras_controller_intr
 			 * according to hw team and count ue number
-- 
2.43.0

