Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58905D37A35
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B1610E918;
	Fri, 16 Jan 2026 17:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="A9nNee/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E92110E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 17:33:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 39F281A28A2;
 Fri, 16 Jan 2026 17:33:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0EF58606F9;
 Fri, 16 Jan 2026 17:33:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32EFE10B686C1; Fri, 16 Jan 2026 18:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768584800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JT9tt5+vYn3tFfsnu8u8PU5Tm0hiFHW/bTFd3Um4N54=;
 b=A9nNee/qOpnUVD2WtdF3s+ntVaBnalIdxUrWhBAOVWYK8A9JkH8SGy9jJyEZISOfp/xNBi
 aJAgRnBAeiSypskHt48RCbtHRZ3LuYnwhXw2H0DlzgLIlXy1Vo5tiKNBrn9i1nTn6P5DK+
 X6qPQpTn0cGxo1COQrpOoBPrmektQEQVyKjCYu2ruemb56iS9CNBIaPsfApeBkFR1e9lfx
 3lbdZTh+aD+BE62caxX363CQD7SlnZ682uZP4EW7m/TLzDjXtmRGCcDh+6PlGYkC1x3Kd/
 3g97XosijAtgCfvN4PN0ZOmcOtNP6BcMiWuvr1P6dJQ9S/zeMgSPav0h6zvmLQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 16 Jan 2026 18:32:38 +0100
Subject: [PATCH 3/6] drm/mcde: dsi: warn in case of multiple subnodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-3-e34b38f50d27@bootlin.com>
References: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
In-Reply-To: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

mcde_dsi_bind() has a loop over all subnodes looking for a panel, but does
not exit when a match is found and only stores the last match. However this
will be problematic when introducing refcounting on the struct drm_device
pointer in a following commit, because of_drm_find_and_get_bridge() would
get a reference to multiple bridges.

Assuming there is no real reason for looking for multiple panels, add a
warning so it gets noticed in case the assumption is wrong.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

I think the correct thing to do would be adding a break statement when
there is a match. However I don't have knowledge of this driver and the
hardware, thus this patch is a prudential alternative, not changing the
behaviour.
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index a3423459dd7a..3faebe571fc2 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1103,6 +1103,9 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 
 	/* Look for a panel as a child to this node */
 	for_each_available_child_of_node(dev->of_node, child) {
+		/* There should be only one panel subnode */
+		WARN_ON(panel || bridge);
+
 		panel = of_drm_find_panel(child);
 		if (IS_ERR(panel)) {
 			dev_err(dev, "failed to find panel try bridge (%ld)\n",

-- 
2.52.0

