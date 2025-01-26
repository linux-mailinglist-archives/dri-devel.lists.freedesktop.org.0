Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C454FA1C8E2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C14910E3B1;
	Sun, 26 Jan 2025 14:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A314vuzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1479D10E3A9;
 Sun, 26 Jan 2025 14:54:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3955DA40489;
 Sun, 26 Jan 2025 14:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B334C4CEE2;
 Sun, 26 Jan 2025 14:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903254;
 bh=4mlVLYchybKNez3qJJsuH3/DFr4KppQ7p3VC8ZQJ0rs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A314vuzrLi9kC8d2vZdNGc+1YPL9GpDsZdiYhplYiW58ifXMf+b7yIS2hq+vSSN1K
 Da0mNDkUlD8HYLd2iD0GxeW7PBu7hbs7Pz6IuXaUGZcjbvfA6kr5bIn3pnVnQ04Dbv
 AhuSZ9LOiutMwVO33q2P40zHX0xrU2BnIFOjeWo3/BMwcmQ2A0OWpsmcAGwfx9grjc
 NR8bWvaDGAr9kCkNXRbBO8OfvXaltvoWzzwIaHW87OhzWVdecIGNyoOkY+gHd4sEY9
 25K39JqCU1N5ymWM8A2Xfpg4feYpoEBykqZB3C+y6+92Hobr1HUJM2vF7CdrEn9zr7
 5fH6JRE0nWg2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 robdclark@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 swboyd@chromium.org, quic_bjorande@quicinc.com, quic_parellan@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 19/34] drm/msm/dp: use eld_mutex to protect
 access to connector->eld
Date: Sun, 26 Jan 2025 09:52:55 -0500
Message-Id: <20250126145310.926311-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145310.926311-1-sashal@kernel.org>
References: <20250126145310.926311-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 9aad030dc64f6994dc5de7bb81ceca55dbc555c3 ]

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241206-drm-connector-eld-mutex-v2-7-c9bce1ee8bea@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195..0fd5e0abaf078 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -414,8 +414,10 @@ static int msm_dp_audio_get_eld(struct device *dev,
 		return -ENODEV;
 	}
 
+	mutex_lock(&msm_dp_display->connector->eld_mutex);
 	memcpy(buf, msm_dp_display->connector->eld,
 		min(sizeof(msm_dp_display->connector->eld), len));
+	mutex_unlock(&msm_dp_display->connector->eld_mutex);
 
 	return 0;
 }
-- 
2.39.5

