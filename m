Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A053FB3E6ED
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FF210E46D;
	Mon,  1 Sep 2025 14:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="lHYqxptS";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="TvvRcH+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F6D10E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756736566; bh=XzP2oIYHCCNvXv897N+EIJB1bCuQBdP71SLZnhgZr94=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lHYqxptS6PBpb57vKPnnuhDE4Gfm9i8QelJuEAVg/3m9NILhievRTGRhhcb+gBOG4
 u4cX2RXaonwmEh/rZMa2KF60uz1FotVIdoJ7nWbNvBH0EDh6cC/59+/qoftSSVMtlN
 OVwTfsqmcI8n0n+BBdylAabgoM3CctGLc5WUkPT350PWgwR0/M1DIlmmsfqKHi6qAH
 aYxXMPm6EMvsvEEAV5preNP60oS1l33pYs3e4T7x1VuVhL3KcOvAegXRtNrfa7GKiQ
 OVIOl74dylBcVNby2ybzoZSbr2b8BTMFvx5ySnYahZ7VkSIcbl3kUfVIPF4fhdPQt6
 jwdzp3aYxnlSw==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id CB6EDFB03;
 Mon,  1 Sep 2025 16:22:46 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9AggP_bAkQe; Mon,  1 Sep 2025 16:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1756736561; bh=XzP2oIYHCCNvXv897N+EIJB1bCuQBdP71SLZnhgZr94=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TvvRcH+8AEsFhIa5PXDIJy2kJP2r2kwcezC/P5QyeO0Ym5nmiFJZCkY7VHzF8NgYd
 rd1I1Yn22zfi6xA+Ua+826Tv1oOrGw0m4/J005fXNe6M6GF+3iArxL90S10LugiwAd
 XH/qqvoRawVxhYE4JSdrkTSw0IrslZ0ZUGB7gw941+VANoZ9I+dyaoaX/APHvYh9bU
 1BZs9urtxrSsgTxor9l+aeFWQPt0HUlY8jgNkIO2uUTpyGYydnKpp9cYYjOugjIe2D
 yP7WRnnIgrGJ48C9P3iGgdNUW35Qm/3doCswFOUZciRMC1gDWknuS6Uo/9AB3YYea4
 WOYX1Cc19XBwA==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Mon, 01 Sep 2025 16:22:07 +0200
Subject: [PATCH 2/3] drm/panel: visionox-rm69299: Don't clear all mode
 flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250901-shift6mq-panel-v1-2-444b4abbfaea@sigxcpu.org>
References: <20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org>
In-Reply-To: <20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=XzP2oIYHCCNvXv897N+EIJB1bCuQBdP71SLZnhgZr94=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm90YXdsQUVOMXJSL0VzeXRxT3ZyQVZxdkJ1RkVKCkJjZUtZdHFUbUlSdXNkWXdG
 ckNKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYUxXc0pRQUt
 DUkFsdjRaU1N2ekI0d2M2RC85d2ZCMWJhV2ZUYUEwbnl6YVREb3VTcEd6b1RqbElZaTF2RG05Tw
 pBYTFmcEZ3OTlrUFlhYnV4bXgxeXV0NVpYN2N3K01TQW9Dc05NdVpJY0JPNEN1UEQ2UzZ2bDdGZ
 ktQNnlmT3JkCnBFMjBkNFdPaVk5ZFY0ajNqYzcxeG01ZG9zZ0s0MDNydUhxRjdhVExOdUNjWGtO
 UHh0S2JmVkJBZ1RlaG93TDAKWHpTaUxnMU5UWE1uQURiU2JGSGVTVE05cUNkT1FNSHFVRmhtUmF
 EMy9XWnAzbVN6RGJWamR3STJCdjVvUXhaNApSc1BLWURZM09Ic0ZIMUdId0dOak9jOXBRY0k0bl
 UzY3NoNVMzY3NROUVRdHAveWl5SEMyQmx6Mjh3MEdpNjFOCkNjSkRFOFY1T0VpNUo2SzJLc2VJQ
 VA3THgrUEladVNJRmY2bDk3UGp0MEZDWE14ak05WWhma1BHTllDanRLQ2QKNGtsK3lmWGVROXJj
 bWJBS2Y4QmtwSjIvK0dPOVRKMm4rcnFmN2h6cFRFVnhhQjVZN1Vuc2ZuSXJNazl6ZGhabApsNXB
 DQkxmdUZ5elRoMEhWeVQvdkh4NThPNlR0NkVsRmM0SGY5cGJ6SE01QTJ1Y0FtWERzditQRllkUF
 VMYkoxCm15enpIb0ZzckZjOXBwUVV0dmx4eEI2R0h0T0dFR3YvUllFVjBzSmJkNjRCM3hmTWY5c
 zRCZHhKRnJxcVBpZGIKY3NRaUI2cFM1VUdHelBmNHZxdWhjNktmZG1RRkJpeU1DZ1RJWHNhZ0Ru
 S0piRXVvdlBNQ0xZRDJ3K3RkNnR6agpDbm5HNzFGd1FkNlhPS2ZJSFdrWCsra3FCK1FrZml3VlF
 4NmxOTHdmYXNTREpsYUh1K29lM2oyWnJuVCtEVmxKCmZaSUdIdz09Cj13MEhvCi0tLS0tRU5EIF
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

