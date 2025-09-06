Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F36B471D0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 17:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1917910E112;
	Sat,  6 Sep 2025 15:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="Y+5UByfQ";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="d3Fv8eFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65C10E110
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757171904; bh=TjvPDMNFqr3mJzkVZWlb/lpwhAbg89Dl7cWx3KLOEs0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Y+5UByfQnSWetgzLZOZBjNhjBCuSNUVrtfgyoW2wlorhQAyRGq0EPRK49X6WwduTg
 OR+WuHrVSLfs5lEXY5cXaEE0exrd+0rhISk/SRLYciaX9d/Y8s78uRjxwKwMipbg0H
 0T9+h2DhGWp/X8cpTCPStfgUKJAjVKZPjcybCQHrDK4zO0UG5+PPmfC0gHbXwn8Nz6
 QfK6hq79/LH2AaaI8yzw/CQinoZEZqv7RMtTDVvscKh7Hvg5MnF5FYwRWBMPHsM5x3
 aHiV0MTDXcejWgshdfLP7tGq6JI219jnzIar987S86jO0xlx8wX1tyyTL9jyWaRL2E
 FmJXvZNuiVteQ==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 9BE88FB04;
 Sat,  6 Sep 2025 17:18:24 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ilgenz7tOuwi; Sat,  6 Sep 2025 17:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757171900; bh=TjvPDMNFqr3mJzkVZWlb/lpwhAbg89Dl7cWx3KLOEs0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=d3Fv8eFjdSGzHeo9V5d0LC7S6BYUudTHqbU06us0ev8C2jSKqaM3HMslvL+REBDmT
 cKxEjDzvhSEaqYV4OJzn1uoV8eI6CkOu4LqZyKZaG0baKxWdMyi/OehdonF87BQOy9
 CLKJS50w6NQVtQcH2uPdxPuTnhiggLsw9g5YOg+KUpZtFQqeGQ+k/jopSglGPOZiU+
 b3qCYMN3tDn04lX6YhE5BnfwMo2k2kmnpjLp4UvPmIsY/h1NjPLHokd6Qvj12mhU2Y
 DVl/1C6OqRLybDgzGfL0a/rtP6qfVirHKRls1z1ARslOWy8Rs7TsPOITDKQA3kQdxZ
 ZDjbjOlHIoT/g==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Sat, 06 Sep 2025 17:17:26 +0200
Subject: [PATCH v2 2/3] drm/panel: visionox-rm69299: Don't clear all mode flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250906-shift6mq-panel-v2-2-aa5e585d8717@sigxcpu.org>
References: <20250906-shift6mq-panel-v2-0-aa5e585d8717@sigxcpu.org>
In-Reply-To: <20250906-shift6mq-panel-v2-0-aa5e585d8717@sigxcpu.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=TjvPDMNFqr3mJzkVZWlb/lpwhAbg89Dl7cWx3KLOEs0=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm92RkN1eGdkL25iTmp3TWNwODhkMTladCtVeDlMCktudjc5RjMrWWZVMmtRMEda
 MStKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYUx4UXJnQUt
 DUkFsdjRaU1N2ekI0K0NKRUFDekFXMGRrWk1sRjRSOXMwc0Y4cWppMzhXVDkzU01BZXFhSkV6Uw
 pyMmpnazN0eSs3SnFuaitFdHZGTFE4VEQ2QlZidFZBUGNaYmhLSEo1VDVBdTUvSDhONU5yU3JXS
 FNxbHJYZ1hRCngyYkgvcWFIK3JuaTJOS2RQalMvUVY5dGNSZUNVWGlXU3BxYm5iak9WNS9HcFN6
 SkJqV2x6N1h0N2NscXpueXQKTzdWRXp3TVFVaXoyV291WWp0TzBxa3M2eFlmK0tKejY1YWxxYnV
 NVjBKc1FHQ0N6V21COGZEaTFORWR6UWh2bQpWaFJ6OXpaOGl1cU9aZ0dMQmxCek53OXJDSHpmNm
 VOcVFaTTdoUVgzeUtIQUZ6ZGIvcUNkbVQyazQvSzJyaFF0Ck5BM1Z4cUgvL1pSMUZIY05yOUt4b
 HkvTmZkeGVSbU9XR0hEOEJMeDBndDRZUU9zanpTbUhld2ZVVSt0NFAvaUkKbjZDMWlUQVcxSjF1
 NWVZYjhOQi9YMHZkTFhwUFBDSzVsNW45Ris5UUpydjcxd0tNenRsYXhwbHAzSndNUTcyRgoxTUl
 1NGFDSFlOVWhMdFBWWEoyZVlpNzZ1K0tqOTcyUjc4dWZkT1Vrb3g1aUU4dEpEQlpGczl3KzZaWm
 JvWVFwCnJLUkM1RHpUVERQTnh5NExUNVl2TWRYSTV6dExPK1VPSGJVbFRJZ1FMVkp5OHgzSGxJT
 XdLUmZmSTZZU09ZZW8KUUUyTVF6UmxkbE9tL25uTDBFdmhNUEg1bGErbUY5WVQ3MDJSbDMya0RY
 UjlSeUdTNWRSempWQy9DdXRTTHYzSgpNaTdCbnpjWk1yY1JmaFp6eUg2aklWVkZZWkhUakdQTHF
 4cjBQNUJiT1pjUi9COCtqNXdNalJMWHUxbEowMmQwCmVqWStwQT09Cj01d2NRCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3
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

Don't clear all mode flags. We only want to maek sure we use HS mode
during unprepare.

Fixes: c7f66d32dd431 ("drm/panel: add support for rm69299 visionox panel")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index e65697ce6f51c7d64b786da18cf44b16de5d6919..2216d38366ea37368d15480f9d8a8ccbfe77ba3b 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -192,7 +192,7 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	ctx->dsi->mode_flags = 0;
+	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 

-- 
2.51.0

