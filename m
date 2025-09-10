Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFBB51E01
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF9410E972;
	Wed, 10 Sep 2025 16:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="qB4Fcwzl";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="tAeyAZOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902F310E971
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757522451; bh=AmkVaPd4W0IGCcGVWPaikGijSqrf+XTEGsS9JnorjY8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qB4FcwzlNu+hX+EFrUiNyHsuOGj71VyJ0e7ZCrmCbeDhyLS3/pUujk3b7ptO/6P1f
 MXO8q2kf/10ykzplFhAuVcx1AkVe2p4ZIDbr3gabJmEL1bRZO21LsVgxYEdy0Lu2Ih
 ATLw/9w8IP09dX8MJICz7uWGlAHfQXnuBMe0XYvVnpY6ypatVTy1YMRPl26P4zRt3y
 PuLUX0tyWLMPMvMP2kCuMG9f7i62uODRRkmrU8FoqWvMToE9JKMH9YQdEhlBNS1Slt
 tqvl/FXaXjQ+tYB1VACC9vwic5Ed1SPDXM01QiOItkkdtZIcNwLtJo5bV5zvI9yse9
 +qV3FSYVigakw==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D6A27FB04;
 Wed, 10 Sep 2025 18:40:50 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtkdT_tRGf4e; Wed, 10 Sep 2025 18:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757522443; bh=AmkVaPd4W0IGCcGVWPaikGijSqrf+XTEGsS9JnorjY8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tAeyAZORJsJEaeKv1y628WYk363EI+qY+vFxgUKiYNLfkkG1Q7deEfGxuPRrEN7DG
 sbWI01HBq1VrhI7vrY6Vl5owQJ9EuzGxra+VY4z9lRF4zeNLXx37LIkmKfL6cVV5ah
 apSBAF1gZgUaVfl5BU24TsDM2GJEvpAK9IXWH8PCPg3uoRQ/qY4tda0QZhX3+dzB/I
 SxO6E1ZF4mkhw+NYbNBjxlUesjzeiKJVt0H5/GnmhnTkMuIjl3MA40gFPoaXw9pEkj
 Lhk1DobV99exxNGIpy/ELaOXmlqiVgKFIEdMHt8tJ0ZbduayQVHNMKTcklx7m0yS1s
 G8eEPafV+usuw==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Wed, 10 Sep 2025 18:39:57 +0200
Subject: [PATCH v3 2/3] drm/panel: visionox-rm69299: Don't clear all mode flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250910-shift6mq-panel-v3-2-a7729911afb9@sigxcpu.org>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
In-Reply-To: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=AmkVaPd4W0IGCcGVWPaikGijSqrf+XTEGsS9JnorjY8=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm93YW4vemRRZ3pUekdQd1RYQWRyL1Y4bmlDbnZiCnVLVFh5Vy9VTElyZkJ2Q1FJ
 bEtKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYU1HcC93QUt
 DUkFsdjRaU1N2ekI0LzBkRUFDdi9hUFcybVVJSk9zc3hDeDBEMzdFM2todXVjNG1EY2dXWndETQ
 p1WlpTVzc3ZmlldUlTSE5JeC9zUUwzMzFmbUIzeHNGdDJNVzYyMGFIV1kzZVFuUWEzZ1A0TkZLd
 GlvU0ZreTlRCkY3eVkyV0dxQnpGZnN6VmlTNDdPRGtxaDU3UWtnUkZZMnloc2xHTGordGpOVDdv
 cmVld3JqTzZGWjJCbkNuY1UKamF1MUhFZncvRkphVVhuRlhua2ZZeldYMmNPbUZJN3R0RGJUOXZ
 RVkFnZjB0SWgxdFJCeG12bGxLWHd3bkRpbgpCV0xHbWk4eVNoVU5KSU10SVVBckdKQVRZblIzb1
 lhb3Rhd090NWJMbWhlT1NHdjFQbXBrNFhDa1FNck13YVJrCktGem90U2Q1OGhqUkFBVWw5THhKY
 0VjN005S0VCSkZzZWJNd3RvY09wblZWTjg0Q3NPcFVTZXlxeWxZV3FDQ0kKN2g3TzFVcDBZN2Zr
 Z2dGalRpYWZpcW1mSHVSeDRkajBsWHBHZUNnVGE1K3RvT3ZvZFRqYzlIaEdmUkJlbUJONwovYWh
 wdlBaSEVVOVp3TzJLRnlUbVM0TjdLR05DVkF1WDdjWnBRZTNjZ092SmdpdXBzVXZWN3FzU2RKeE
 1GTVZnCkFHdERweUZxRi9UaHNjcEwwMWp3ci9COVR3VEZCNnJ2RG9Ka2d0VDZTUTJNMzdUUDhXT
 XhkMVJYYjBtczhoR3MKakVoMzBld2lnMkZqMzVPbElaU2owa0cxYkRBSk9IdFlYWFo3U2FIam9D
 UkszVFdpNFVzVlpwc2lIam1lSW16OQowUzZDTlRnUmFoSXdRa2svSGxmMFVpdWZMbXdORHAvSlJ
 EMXcrb1ppai9aMlNtdE9LNmQ0QWdFYmExdnorZVFxCnIwV05PQT09Cj1tY2k0Ci0tLS0tRU5EIF
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
index 5491d601681cff52eca1d72ad4489731d2276c30..66c30db3b73a71f23b587b6e994a22dba5e85d25 100644
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

