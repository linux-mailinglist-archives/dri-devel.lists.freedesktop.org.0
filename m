Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A811EA61
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 19:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9116EC0C;
	Fri, 13 Dec 2019 18:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7B06EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:33:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 58BD280680;
 Fri, 13 Dec 2019 19:33:02 +0100 (CET)
Date: Fri, 13 Dec 2019 19:33:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jerry Han <jerry.han.hq@gmail.com>
Subject: Re: [PATCH] drm/panel: Add Boe Himax8279d MIPI-DSI LCD panel
Message-ID: <20191213183301.GB32650@ravnborg.org>
References: <20191212115208.3878-1-jerry.han.hq@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212115208.3878-1-jerry.han.hq@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8 a=QyXUC8HyAAAA:8 a=mpaa-ttXAAAA:8
 a=pyRKsyEBAAAA:8 a=b987VOgPowsUEI_15y4A:9 a=LmTNRY90VA9jqp7P:21
 a=VT3gn1uFOzzm1lSP:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=xmb-EsYY8bH0VWELuYED:22 a=6heAxKwa5pAsJatQ0mat:22
 a=jmCdmrpiGMLo1jCbbjXX:22
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Rock wang <rock_wang@himax.com.cn>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jerry.

Thanks!

On Thu, Dec 12, 2019 at 07:52:08PM +0800, Jerry Han wrote:
> Support Boe Himax8279d 8.0" 1200x1920 TFT LCD panel, it is a MIPI DSI
> panel.
> 
> V11:
> - Use the backlight support in drm_panel to simplify the driver (Sam)
...

> - Support Boe Himax8279d 8.0" 1200x1920 TFT LCD panel, it is a MIPI DSI
>     panel.
> 
> Signed-off-by: Jerry Han <jerry.han.hq@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Derek Basehore <dbasehore@chromium.org>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Cc: Rock wang <rock_wang@himax.com.cn>
> ---

Applied to drm-misc-next with the following changes:
- fix build in boe_panel_get_modes()
- fix backlight - drm_panel_of_backlight() must be called after
  drm_panel_init()

	Sam

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 3a6ee2069158..74d58ee7d04c 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -219,26 +219,27 @@ static int boe_panel_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int boe_panel_get_modes(struct drm_panel *panel)
+static int boe_panel_get_modes(struct drm_panel *panel,
+			       struct drm_connector *connector)
 {
 	struct panel_info *pinfo = to_panel_info(panel);
 	const struct drm_display_mode *m = pinfo->desc->display_mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(panel->drm, m);
+	mode = drm_mode_duplicate(connector->dev, m);
 	if (!mode) {
-		DRM_DEV_ERROR(panel->drm->dev, "failed to add mode %ux%u@%u\n",
+		DRM_DEV_ERROR(pinfo->base.dev, "failed to add mode %ux%u@%u\n",
 			      m->hdisplay, m->vdisplay, m->vrefresh);
 		return -ENOMEM;
 	}
 
 	drm_mode_set_name(mode);
 
-	drm_mode_probed_add(panel->connector, mode);
+	drm_mode_probed_add(connector, mode);
 
-	panel->connector->display_info.width_mm = pinfo->desc->width_mm;
-	panel->connector->display_info.height_mm = pinfo->desc->height_mm;
-	panel->connector->display_info.bpc = pinfo->desc->bpc;
+	connector->display_info.width_mm = pinfo->desc->width_mm;
+	connector->display_info.height_mm = pinfo->desc->height_mm;
+	connector->display_info.bpc = pinfo->desc->bpc;
 
 	return 1;
 }
@@ -888,13 +889,13 @@ static int panel_add(struct panel_info *pinfo)
 		return ret;
 	}
 
+	drm_panel_init(&pinfo->base, dev, &panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
 	ret = drm_panel_of_backlight(&pinfo->base);
 	if (ret)
 		return ret;
 
-	drm_panel_init(&pinfo->base, dev, &panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	return drm_panel_add(&pinfo->base);
 }
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
