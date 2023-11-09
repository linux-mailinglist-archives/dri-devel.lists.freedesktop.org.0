Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F637E6470
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81510E1C4;
	Thu,  9 Nov 2023 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E85310E1C4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:45 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA643E0C;
 Thu,  9 Nov 2023 08:38:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515502;
 bh=xt5MBUgnI/jgAIonK42bagqQqpKSKcbUYBa+PmKHG8E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sajfIXcHt8KHj1UJYdggbsMVkUc6GHdsfbn+OLXb9IHJBnAWQVnY6PaJLtcpqKlEG
 47lGzk9Hc5c4naZLFuOvXLQNqEfUHHeJm+V77Ae2ex8xhUY8BMzyex+sgAEBrAXt1E
 tkDEo8g7o1jEhD472nfGt8vg9um6lrTQkb0FZdyU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:37:55 +0200
Subject: [PATCH v2 02/11] drm/tidss: Use PM autosuspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-2-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=xt5MBUgnI/jgAIonK42bagqQqpKSKcbUYBa+PmKHG8E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx+fN+ubO5HJG9gxPYBA5D9PTIkfRNffzkxn
 gQ0MtheLoeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMfgAKCRD6PaqMvJYe
 9f5lD/97VxLqRK0F2PM6yui/5XVHYoti9Upp/CtctMV6KxkJ3rdFISUaPcTNRa6PRxwl1PKqZT0
 8NO9huwa0ImfdO4dINDszCfjKOzDl1UpnEpW5zfymJWrBd2dy2Bx5OUdG65UxhVzL0MZ7G0/j57
 PR0gocj56G/msXDxhTxars+m8ZY5C9LzM6UZftzETmNoGDJgbz1QhTbj3ne6EkUV8ThJmpxFmkU
 hBctuObo/1j6qYrBBODTfjb9iStzmkvRgh88psTUzHqe+C6jpZ039HGrTYM5iSrhazWXeV3B5ad
 ndJctMhkjh6e0sRLozWFxDUzdCC4NdpAk05T6+s/A9ZueVBdyPA1BTdGi1h4WL83zlswLNjoG66
 lqPLRlmqkr0r2JJho16EHb4kk12ietXWyIh0oadAmDCwZnyk5OZOgkglwArGTV7/To3wL0RRthg
 tzgUpOxSVjttychgvCunCnfyFeRwM/YTBZEyk7LpNkajGkxT10sDlaX6Hpi6nNPIOHlVXverLM2
 9Zfs7sS7FVG/modDQYXZjsBRPbEtW6zOsk9igZFVKscbVEO4V0W/OVMfIwyAChY8YZ2vnYB/FaO
 GmWAtAJBZ+G3LGjYRktzVuYLRDTd6HazMu5dTIKpv47RJEloY4nsVqzTaJjqEWYFTsFK/9aUOX2
 +1NBEbm4t0KWDqg==
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

Use runtime PM autosuspend feature, with 1s timeout, to avoid
unnecessary suspend-resume cycles when, e.g. the userspace temporarily
turns off the crtcs when configuring the outputs.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index f403db11b846..f51c87e26e10 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -43,7 +43,9 @@ void tidss_runtime_put(struct tidss_device *tidss)
 
 	dev_dbg(tidss->dev, "%s\n", __func__);
 
-	r = pm_runtime_put_sync(tidss->dev);
+	pm_runtime_mark_last_busy(tidss->dev);
+
+	r = pm_runtime_put_autosuspend(tidss->dev);
 	WARN_ON(r < 0);
 }
 
@@ -144,6 +146,9 @@ static int tidss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
 #ifndef CONFIG_PM
 	/* If we don't have PM, we need to call resume manually */
 	dispc_runtime_resume(tidss->dispc);
@@ -192,6 +197,7 @@ static int tidss_probe(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	dispc_runtime_suspend(tidss->dispc);
 #endif
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -215,6 +221,7 @@ static void tidss_remove(struct platform_device *pdev)
 	/* If we don't have PM, we need to call suspend manually */
 	dispc_runtime_suspend(tidss->dispc);
 #endif
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
 	/* devm allocated dispc goes away with the dev so mark it NULL */

-- 
2.34.1

