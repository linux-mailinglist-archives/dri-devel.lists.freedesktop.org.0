Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD75F9451
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4A910E5B4;
	Sun,  9 Oct 2022 23:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495CA10E5B1
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:54:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEF78B80DED;
 Sun,  9 Oct 2022 23:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8E4C433C1;
 Sun,  9 Oct 2022 23:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359675;
 bh=/NdS3g71STJA3Pftdp1Yvvm9X41utaI30ce2S5p5+E4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g6s4z6F66o2CB3+NSB+qeGCGwQd0uCQTXFyUPvIRUIPLQn823ri8LuP538HGlGqBV
 OsVs79MZ3OAcNz+w5cCEvyZ0PBdwVhM6GVU5uY/qFa8TUm/39NfWRvnjqd6KdwNalY
 47B+dQlFY337Ip54DrOqpORwE7DYSfAxHVR4G0TRgShtcYVc2AScmP99HeTC6ETGme
 MaK99VsyPACr8qhtxizcyhA6R1NeVqd4xB5TW0lplnHoH8O0IDtvr9DeNYKXLzQ8Tq
 5Rr1ioT64sCrulUDULigWLlGPgW48hxIrr/9l0KUMpS9aUaunidSUTuHMYRqhX+liV
 KIqZ3rCkbETQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 05/25] gpu: lontium-lt9611: Fix NULL pointer
 dereference in lt9611_connector_init()
Date: Sun,  9 Oct 2022 19:54:05 -0400
Message-Id: <20221009235426.1231313-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235426.1231313-1-sashal@kernel.org>
References: <20221009235426.1231313-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, neil.armstrong@linaro.org,
 Zeng Jingxiang <linuszeng@tencent.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zeng Jingxiang <linuszeng@tencent.com>

[ Upstream commit ef8886f321c5dab8124b9153d25afa2a71d05323 ]

A NULL check for bridge->encoder shows that it may be NULL, but it
already been dereferenced on all paths leading to the check.
812	if (!bridge->encoder) {

Dereference the pointer bridge->encoder.
810	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);

Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20220727073119.1578972-1-zengjx95@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 29b1ce2140ab..1dcc28a4d853 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -816,13 +816,14 @@ static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt961
 
 	drm_connector_helper_add(&lt9611->connector,
 				 &lt9611_bridge_connector_helper_funcs);
-	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
 	}
 
+	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
+
 	return 0;
 }
 
-- 
2.35.1

