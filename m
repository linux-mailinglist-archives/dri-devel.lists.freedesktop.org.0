Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028CC7DDE45
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DD110E658;
	Wed,  1 Nov 2023 09:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D353010E00C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:40 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4C6F1BAE;
 Wed,  1 Nov 2023 10:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830303;
 bh=dkl3jtDooC1JFtaD0YoyJ131w9qjC5vo5eQl2h7Sweo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X28UD5BsxO8OYz1iBNC/hEargVmbvL7kBwjtoMi4DnBqAbZdZszrGVIWyp4s7IAbd
 1AVMmwshLM8JHaJF9zrLfFeCQiw9mP3h8QvHnB7ZqeYqMGPxhnBQd1qdX8h6NcqhVh
 dXK95kbx1eUUPcBu2f0noTr9DHcB7CGyqUs9AbLc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Nov 2023 11:17:44 +0200
Subject: [PATCH 07/10] drm/tidss: Fix dss reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-tidss-probe-v1-7-45149e0f9415@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
In-Reply-To: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dkl3jtDooC1JFtaD0YoyJ131w9qjC5vo5eQl2h7Sweo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhfnclbJel7gQ5GXPPWj5UOUtsFOinZZ0pugH
 /NxyVI+gV+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX5wAKCRD6PaqMvJYe
 9XdDD/9FXC7yP4L2ixb760gH7/wVpJyGAsTsAlYaoBTFTw5xeGwhs8RjwMtFnhLBbF5zmmMqyNF
 OxZnojctXWY/mBYxSHUjx/a9PELtelP094ZjhLD9EG4Ng4GiPRst8TMeE8DhioLT+b0E66EevUf
 /FObJE4gO2GA1AXutg7+AHqAXIoFXS5E67u4rJuRbOzbfTyOW5R/NhVp2IcCQGxMAMFcINI1/gW
 kKlX7uos1wVdGxsWnQkezqPjrLodBtph11X+URZvvnUlKtJDXc8+UwtJHx06axtrPHZd88NL6U/
 EMmY6NQ5GHscG/6GmskW2ojmPIF1M1VyfFzFwkxt5pi95dhfOn02C8IOmyGY/tOBPWDZa237Yk7
 G9xRRjuJ6jJTO/Cu6WKL0fW5HDkIA0kg3i93lvSOBHleAcvqBTo9FnvviNEPdlw+BJMbsMErdPH
 RFnvCGWdgEk/6F/JulnQ1UW5E9ObYsQ0RjmbmC1mO68zShNkdQ34cE+gJ9SRBRAr9QSBfF5XKHZ
 IbEr5z0JPIapFTgVYGFCxjXDS2rWq974WtIk/f1KBKKr7i10KU+cp/lY1omCsH1hjeGpMwWYVuL
 j01zWpoSgc3ciZJVzOOM3aNlZo3gABubkDqOPk2VKmhXhDJ9sC8pyCNZIvHRWWnJfHRayHKAQ2y
 3uSypv0sboLvj8Q==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 45 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index f204a0701e9f..13db062892e3 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2724,6 +2724,49 @@ static int dispc_softreset(struct dispc_device *dispc)
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
@@ -2835,7 +2878,7 @@ int dispc_init(struct tidss_device *tidss)
 
 	tidss->dispc = dispc;
 
-	r = dispc_softreset(dispc);
+	r = dispc_init_hw(dispc);
 	if (r)
 		return r;
 

-- 
2.34.1

