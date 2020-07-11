Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9A21C186
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 03:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63526E1CF;
	Sat, 11 Jul 2020 01:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20CF6E1CF
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 01:10:37 +0000 (UTC)
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B3AD2076A;
 Sat, 11 Jul 2020 01:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594429835;
 bh=obkdWl2N6bzEnN0PanxeRIISOXyw6TIbMvNwfoNiaXM=;
 h=From:To:Cc:Subject:Date:From;
 b=Ua2kf3VZjIIkFbHCUgHFuh6yEuyDq5Lg1907l3oLg1B2S8kTEbM8GNOlOIsLFNru8
 HdjWhP+w9zVzIBZ+9qkky5iZIkotwCgwlSBdtUBbC5HydTgN4D7mlAhGpFhQE01Pp1
 OSl41PWKckZCFAY6zBd+K1hmuLU8d1VSM+Y5kg14=
Received: by wens.tw (Postfix, from userid 1000)
 id 3B2A85FCD1; Sat, 11 Jul 2020 09:10:31 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: sun4i: hdmi: Fix inverted HPD result
Date: Sat, 11 Jul 2020 09:10:30 +0800
Message-Id: <20200711011030.21997-1-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

When the extra HPD polling in sun4i_hdmi was removed, the result of
HPD was accidentally inverted.

Fix this by inverting the check.

Fixes: bda8eaa6dee7 ("drm: sun4i: hdmi: Remove extra HPD polling")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Sorry for the screw-up.

---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 557cbe5ab35f..2f2c9f0a1071 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -260,7 +260,7 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	unsigned long reg;
 
 	reg = readl(hdmi->base + SUN4I_HDMI_HPD_REG);
-	if (reg & SUN4I_HDMI_HPD_HIGH) {
+	if (!(reg & SUN4I_HDMI_HPD_HIGH)) {
 		cec_phys_addr_invalidate(hdmi->cec_adap);
 		return connector_status_disconnected;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
