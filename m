Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E21A1C8DB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9164310E39A;
	Sun, 26 Jan 2025 14:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="coe40f6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385B210E3A0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 14:54:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 653995C5EF3;
 Sun, 26 Jan 2025 14:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B60BC4CEE4;
 Sun, 26 Jan 2025 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903242;
 bh=n+zT/91wQRIjD4biaVx54GDDMTbZ0O75vA1N+LQ7aqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=coe40f6BTuhhGwWec/RcCHJnEDfBUhol1o9nWtPqJcLdCW1295ngrE2AVADXJLoCf
 duV6K/7YXBMwJ/nVALr15HNUxysXPeUAz0wQA95r3lxLEUtGTwGx5DgjP6I9DrZzud
 8KXnEVbN1GppEcsrEGPO0VvB2Nnyy6UXWZjV630l4+ODkwscpJP2mXUd+lIBd9vStF
 xjF60JN7BEVydiqpJAjZqT+qP3RqepA9jlI3ZsTYx1caRgFYBv0nN99CxIdGPmDR6b
 KTxryb3SOorfsSHG/OJd7BDkEgj7sd5w8NUgFttI/MfX7t9eSGrFIxjtlJOBlkqtaf
 hw7v0e3gkN4Ww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Sasha Levin <sashal@kernel.org>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dianders@chromium.org, laurent.pinchart@ideasonboard.com,
 jani.nikula@intel.com, sui.jingfeng@linux.dev, treapking@chromium.org,
 u.kleine-koenig@baylibre.com, xji@analogixsemi.com,
 yuanhsinte@chromium.org, robh@kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.13 15/34] drm/bridge: anx7625: use eld_mutex to
 protect access to connector->eld
Date: Sun, 26 Jan 2025 09:52:51 -0500
Message-Id: <20250126145310.926311-15-sashal@kernel.org>
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

[ Upstream commit e72bf423a60afd744d13e40ab2194044a3af5217 ]

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20241206-drm-connector-eld-mutex-v2-2-c9bce1ee8bea@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe44..c036bbc92ba96 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2002,8 +2002,10 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 
 	return 0;
-- 
2.39.5

