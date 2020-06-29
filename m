Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5120CCA5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDB76E029;
	Mon, 29 Jun 2020 06:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8306E029
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 06:00:48 +0000 (UTC)
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 720452312E;
 Mon, 29 Jun 2020 06:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593410447;
 bh=69KAXq7nSrNne8dVE7YVsV2/lDTgQzzsUVum5KwNVZc=;
 h=From:To:Cc:Subject:Date:From;
 b=GRSZFxsRZTWvOaiuzo8KJuHhWg6fv0kcWT84LyI53REIlQNAFJBgWtSDfy0UeBZrb
 zDuzXx4213NUAaSuiH3mKzaSCcQNusd1UXAOiWVQZ6qcnUZF9DMNA9p/WftCz9AdGk
 0cjZOAuZXSdbSxPfzzuRm+wEa09MV4SsfP8A07Dk=
Received: by wens.tw (Postfix, from userid 1000)
 id 13E895FCA9; Mon, 29 Jun 2020 14:00:45 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: sun4i: hdmi: Remove extra HPD polling
Date: Mon, 29 Jun 2020 14:00:32 +0800
Message-Id: <20200629060032.24134-1-wens@kernel.org>
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

The HPD sense mechanism in Allwinner's old HDMI encoder hardware is more
or less an input-only GPIO. Other GPIO-based HPD implementations
directly return the current state, instead of polling for a specific
state and returning the other if that times out.

Remove the I/O polling from sun4i_hdmi_connector_detect() and directly
return a known state based on the current reading. This also gets rid
of excessive CPU usage by kworker as reported on Stack Exchange [1] and
Armbian forums [2].

 [1] https://superuser.com/questions/1515001/debian-10-buster-on-cubietruck-with-bug-in-sun4i-drm-hdmi
 [2] https://forum.armbian.com/topic/14282-headless-systems-and-sun4i_drm_hdmi-a10a20/

Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ce07ddc3e058..557cbe5ab35f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -259,9 +259,8 @@ sun4i_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	unsigned long reg;
 
-	if (readl_poll_timeout(hdmi->base + SUN4I_HDMI_HPD_REG, reg,
-			       reg & SUN4I_HDMI_HPD_HIGH,
-			       0, 500000)) {
+	reg = readl(hdmi->base + SUN4I_HDMI_HPD_REG);
+	if (reg & SUN4I_HDMI_HPD_HIGH) {
 		cec_phys_addr_invalidate(hdmi->cec_adap);
 		return connector_status_disconnected;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
