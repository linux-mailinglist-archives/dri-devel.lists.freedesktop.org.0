Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C17A1C936
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E83110E410;
	Sun, 26 Jan 2025 14:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U/FM24as";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B0E10E410
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 14:56:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D77DF5C5A04;
 Sun, 26 Jan 2025 14:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64928C4CED3;
 Sun, 26 Jan 2025 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903383;
 bh=8F4QJ1WVnzs5ANYh3Hp5Fu5kYNIAs2i1oIvPnzWUJLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U/FM24asPCFsonWGIQIMqvDehy2YYl6EzOsYRYwbHsA/6fzBoNUu7wDQLQbuVom9j
 sdQ9kLkIAwzLM5hC6gorgitR/XB3F6X7tBVwqnttPx7Mf4GTva9Zzu+8t1UC1CalZ7
 2OaL4QKAwuVWVtPiBdGz50cmE7uxCt1PB1JHdFfIPff6oMyJDOSVYC71+3iBZY1V6O
 uvJ6WhYoIZ4RYwJtyxSTbZ+3BEx68/c4616F6kCweM73XrkgYpu6S8X2mZD/CqVWwP
 dcIIwBBQR+8ZvRtAHLdE+ILFZX9Zr3cBrBLgbc1nTzRhWcLbH5J16UwIIbBsaoyI7U
 5ZJVwoSZVqOXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Sasha Levin <sashal@kernel.org>,
 ple@baylibre.com, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 05/17] drm/bridge: ite-it66121: use eld_mutex to
 protect access to connector->eld
Date: Sun, 26 Jan 2025 09:56:00 -0500
Message-Id: <20250126145612.937679-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145612.937679-1-sashal@kernel.org>
References: <20250126145612.937679-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
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

[ Upstream commit 39ead6e02ea7d19b421e9d42299d4293fed3064e ]

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20241206-drm-connector-eld-mutex-v2-3-c9bce1ee8bea@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 8f5846b76d594..2381cd1cba879 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1452,8 +1452,10 @@ static int it66121_audio_get_eld(struct device *dev, void *data,
 		dev_dbg(dev, "No connector present, passing empty EDID data");
 		memset(buf, 0, len);
 	} else {
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 	mutex_unlock(&ctx->lock);
 
-- 
2.39.5

