Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB17E647D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA6210E1CA;
	Thu,  9 Nov 2023 07:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947F310E1C6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:50 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E774E1BA7;
 Thu,  9 Nov 2023 08:38:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515507;
 bh=VyQFOHUX27qoYp+sEZHLrOOnAGthD9ucCI4/pfyGBgw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BwTNgUW6HHSjGvrI/xQoVOgNcJJSymBeJ1IwQYT3VnMqE3zMJ28jh6WegKgj48+q0
 bA8KGaYB2vUFhpfeBfBiaPrXrjZOuarBHjnkS/PCzE9OO5Pq4CBJW9QvmuOowoJncY
 FhE6xEDT05EBQTT4BnjG0rXjPtkeiEXAlg1ev4Vg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:38:01 +0200
Subject: [PATCH v2 08/11] drm/tidss: Fix dss reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-8-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=VyQFOHUX27qoYp+sEZHLrOOnAGthD9ucCI4/pfyGBgw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIyA7lAsXjoKndhmceZLoKWYp42ow/HZpdLXl
 v4dYGJXejyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMgAAKCRD6PaqMvJYe
 9VK0EACmedDicf6gu2jeCVhtFxLC9E7UeAPCWk8iDpU8txnM2UKnf/2Go7QKMtArXh7urR+JczJ
 lPIcEj+cKoKoelW+JOkyhfKtMHFknHr+0G+yMV9G0aVG6CPrN8jXKnUyUr9Rf6j0LJGYM3svaxw
 gUTPMrQXlwjH510BZra9/VwGvOdYT6DZK1eBfqQwVufSrIAw//M8JDnXhuBNgLNxOIoMO//SbUH
 0zQwWL7Au8mypN65+rf9hoZuvJs2D6T2nenjZ/lQ26eJcvIsWefgzWjJKq3HJUdRWdHzriIlkQD
 Pr4MiGGXTvMlZxmXWP/jK3sHUpFm7+IjeI40nVdZ1Jg+PrzlrhrX0TfzMJpAj3XvGg3yKfeAPFE
 mMHfvUwDI3UL8MxSdwtjgMSd3GjFAQX2Oe9NHY0RDAiQL/SeryP9GxHM+/+VZzcV/a5u3aschyA
 645hz2iFhRKX+lom9GWv5ZVe2zHl5WBI/aw0ExkpSriVkiX+usBZzBDuSlcT3GsSC8Rh2cVKQDR
 TK6F5pv3ddLcvg2zoqHdiLxnovgQavANTbXML4TIpZ35iqGA0MZ/iE2XGJxWcsRsd/QuFw67m0y
 OLfH9hQuOOxpWdB1EMpiarxQ3CWJxY/lJKuRx2KIrYVxqGzXY1ZJvv2PqoPMDW/vEspDmy843wJ
 8nEq+2DvwXOJN5Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The probe function calls dispc_softreset() before runtime PM is enabled
and without enabling any of the DSS clocks. This happens to work by
luck, and we need to make sure the DSS HW is active and the fclk is
enabled.

To fix the above, add a new function, dispc_init_hw(), which does:

- pm_runtime_set_active()
- clk_prepare_enable(fclk)
- dispc_softreset().

This ensures that the reset can be successfully accomplished.

Note that we use pm_runtime_set_active(), not the normal
pm_runtime_get(). The reason for this is that at this point we haven't
enabled the runtime PM yet and also we don't want the normal resume
callback to be called: the dispc resume callback does some initial HW
setup, and it expects that the HW was off (no video ports are
streaming). If the bootloader has enabled the DSS and has set up a
boot time splash-screen, the DSS would be enabled and streaming which
might lead to issues with the normal resume callback.

Fixes: c9b2d923befd ("drm/tidss: Soft Reset DISPC on startup")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 45 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index a5c0b72596e8..8d6ac618c539 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2738,6 +2738,49 @@ static int dispc_softreset(struct dispc_device *dispc)
 	return 0;
 }
 
+static int dispc_init_hw(struct dispc_device *dispc)
+{
+	struct device *dev = dispc->dev;
+	int ret;
+
+	ret = pm_runtime_set_active(dev);
+	if (ret) {
+		dev_err(dev, "Failed to set DSS PM to active\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dispc->fclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable DSS fclk\n");
+		goto err_runtime_suspend;
+	}
+
+	ret = dispc_softreset(dispc);
+	if (ret)
+		goto err_clk_disable;
+
+	clk_disable_unprepare(dispc->fclk);
+	ret = pm_runtime_set_suspended(dev);
+	if (ret) {
+		dev_err(dev, "Failed to set DSS PM to suspended\n");
+		return ret;
+	}
+
+	return 0;
+
+err_clk_disable:
+	clk_disable_unprepare(dispc->fclk);
+
+err_runtime_suspend:
+	ret = pm_runtime_set_suspended(dev);
+	if (ret) {
+		dev_err(dev, "Failed to set DSS PM to suspended\n");
+		return ret;
+	}
+
+	return ret;
+}
+
 int dispc_init(struct tidss_device *tidss)
 {
 	struct device *dev = tidss->dev;
@@ -2847,7 +2890,7 @@ int dispc_init(struct tidss_device *tidss)
 	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
 			     &dispc->memory_bandwidth_limit);
 
-	r = dispc_softreset(dispc);
+	r = dispc_init_hw(dispc);
 	if (r)
 		return r;
 

-- 
2.34.1

