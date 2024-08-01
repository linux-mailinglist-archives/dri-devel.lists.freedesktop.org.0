Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E375943C65
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051AC10E84B;
	Thu,  1 Aug 2024 00:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NIfmde+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB35710E84B;
 Thu,  1 Aug 2024 00:37:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1F6DDCE17AC;
 Thu,  1 Aug 2024 00:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAACEC32786;
 Thu,  1 Aug 2024 00:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722472659;
 bh=3RbiJGro6g0WQhZesVXepLZ0myZ851L/loTBg/yGXgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NIfmde+LiUwNoXwQqupTyfGzwK6ReAEr0dGaZLsp9Bmb84ynZVyRv/C4UmQVXxvVa
 10Y4u6IRNgbHIyFRGgqFoTUEf2cWWKN+ZHZd7wCehe/lJKCEZ38l32Un9SLZRNUFJp
 8aUuZNFoHSSI09QpBursRGjgQp5NSpCzEqT+3PU3i7I8r4DD7+/TbESZG4XPXalEf1
 H4JhD+D8OAtOan+93WKUTMJEjW+8ekNo5i43KNwq3g8sOB1R6lIMt9pEGkuYjSK11F
 Hao7QIiqs/dSsSp0ADKqPWtHkhaJIAQBWBn8GrKnUv/LktWZ43VdD5HMhQcX9Wzp+4
 lex1MQBzCa5ZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ma Jun <Jun.Ma2@amd.com>, Tim Huang <Tim.Huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 12/38] drm/amdgpu: Fix out-of-bounds read of
 df_v1_7_channel_number
Date: Wed, 31 Jul 2024 20:35:18 -0400
Message-ID: <20240801003643.3938534-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801003643.3938534-1-sashal@kernel.org>
References: <20240801003643.3938534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
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

From: Ma Jun <Jun.Ma2@amd.com>

[ Upstream commit d768394fa99467bcf2703bde74ddc96eeb0b71fa ]

Check the fb_channel_number range to avoid the array out-of-bounds
read error

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c b/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
index d6aca1c080687..9587e8672a01c 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v1_7.c
@@ -70,6 +70,8 @@ static u32 df_v1_7_get_hbm_channel_number(struct amdgpu_device *adev)
 	int fb_channel_number;
 
 	fb_channel_number = adev->df.funcs->get_fb_channel_number(adev);
+	if (fb_channel_number >= ARRAY_SIZE(df_v1_7_channel_number))
+		fb_channel_number = 0;
 
 	return df_v1_7_channel_number[fb_channel_number];
 }
-- 
2.43.0

