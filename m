Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB37364DF5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 00:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01F06E453;
	Mon, 19 Apr 2021 22:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD0F6E453
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618872981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gXQksC4Vn7UiMIO1YOE5ew9eXhmdtYYbXkyZK0tt5c=;
 b=Q5Wx0WQc59gpp8M1uo6HhQSFiac8rQanlADzrqu9+WGY/R3HfnGukTyhPh6+doINLAIWTg
 d/qsBHn/11VDhaSpTtmQ7N3TgWFcEujFkJPT+WwlkIE2BuOTusO44Ll5wZ57hmPdCmKWyp
 /6hTluJNxDEkGW2kksaSEcuqlq6dyCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-lVccxBXPPlKzXbG2FbjVzw-1; Mon, 19 Apr 2021 18:56:18 -0400
X-MC-Unique: lVccxBXPPlKzXbG2FbjVzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B488801814;
 Mon, 19 Apr 2021 22:56:13 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA40E5C1C4;
 Mon, 19 Apr 2021 22:56:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init,
 add __must_check and fini
Date: Mon, 19 Apr 2021 18:55:05 -0400
Message-Id: <20210419225523.184856-4-lyude@redhat.com>
In-Reply-To: <20210419225523.184856-1-lyude@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, Tanmay Shah <tanmay@codeaurora.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Chandan Uddaraju <chandanu@codeaurora.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Thierry Reding <treding@nvidia.com>,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Joe Perches <joe@perches.com>, Yuti Amonkar <yamonkar@cadence.com>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Mikita Lipski <mikita.lipski@amd.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Navid Emamdoost <navid.emamdoost@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When moving around drm_dp_aux_register() calls, it turned out we
accidentally managed to cause issues with the Tegra driver due to the fact
the Tegra driver would attempt to retrieve a reference to the AUX channel's
i2c adapter - which wouldn't be initialized until drm_dp_aux_register() is
called.

This doesn't actually make a whole ton of sense, as it's not unexpected for
a driver to need to be able to use an AUX adapter before it's been
registered. Likewise-it's not unexpected for a driver to try using the i2c
adapter for said AUX channel before it's been registered as well. In fact,
the current documentation for drm_dp_aux_init() even seems to imply that
drm_dp_aux_init() is supposed to be handling i2c adapter creation for this
precise reason - not drm_dp_aux_register().

Since the i2c adapter doesn't need to be linked to the DRM device in any
way, we can just fix this problem by moving i2c adapter creation out of
drm_dp_aux_register() and into drm_dp_aux_init(). Additionally, since this
means that drm_dp_aux_init() can fail we go ahead and add a __must_check
attribute to it so that drivers don't ignore its return status on failures.
And finally, we add a drm_dp_aux_fini() and hook it up in all DRM drivers
across the kernel to take care of cleaning up the i2c adapter once it's no
longer needed.

This should also fix the regressions noted in the Tegra driver.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 39c17ae60ea9 ("drm/tegra: Don't register DP AUX channels before connectors")
Cc: Thierry Reding <treding@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  7 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      | 10 ++-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.h      |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  6 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |  2 +
 .../drm/bridge/analogix/analogix-anx78xx.c    |  2 +
 .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 14 ++-
 drivers/gpu/drm/bridge/tc358767.c             |  5 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 16 ++--
 drivers/gpu/drm/drm_dp_helper.c               | 88 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp_aux.c   | 10 ++-
 drivers/gpu/drm/i915/display/intel_dp_aux.h   |  2 +-
 drivers/gpu/drm/msm/dp/dp_aux.c               |  1 +
 drivers/gpu/drm/msm/edp/edp_aux.c             |  1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  1 +
 drivers/gpu/drm/radeon/radeon_connectors.c    |  1 +
 drivers/gpu/drm/tegra/dpaux.c                 | 14 ++-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |  1 +
 include/drm/drm_dp_helper.h                   |  3 +-
 20 files changed, 140 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index b9c11c2b2885..23b2134a651b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -1963,8 +1963,11 @@ amdgpu_connector_add(struct amdgpu_device *adev,
 
 	connector->display_info.subpixel_order = subpixel_order;
 
-	if (has_aux)
-		amdgpu_atombios_dp_aux_init(amdgpu_connector);
+	if (has_aux) {
+		int ret = amdgpu_atombios_dp_aux_init(amdgpu_connector);
+		if (ret)
+			goto failed;
+	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector_type == DRM_MODE_CONNECTOR_eDP) {
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
index a3ba9ca11e98..54c209ab8c9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
@@ -184,12 +184,18 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
 	return ret;
 }
 
-void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
+int amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
 {
+	int ret;
+
 	amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
 	amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
-	drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
+	ret = drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
+	if (ret)
+		return ret;
+
 	amdgpu_connector->ddc_bus->has_aux = true;
+	return ret;
 }
 
 /***** general DP utility functions *****/
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.h b/drivers/gpu/drm/amd/amdgpu/atombios_dp.h
index f59d85eaddf0..6b65cbf009fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.h
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.h
@@ -24,7 +24,7 @@
 #ifndef __ATOMBIOS_DP_H__
 #define __ATOMBIOS_DP_H__
 
-void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector);
+int amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector);
 u8 amdgpu_atombios_dp_get_sinktype(struct amdgpu_connector *amdgpu_connector);
 int amdgpu_atombios_dp_get_dpcd(struct amdgpu_connector *amdgpu_connector);
 int amdgpu_atombios_dp_get_panel_mode(struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 3dee9cce9c9e..51fbbf3ef59b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -439,7 +439,10 @@ int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	dm_aux->aux.transfer = dm_dp_aux_transfer;
 	dm_aux->ddc_service = aconnector->dc_link->ddc;
 
-	drm_dp_aux_init(&dm_aux->aux);
+	ret = drm_dp_aux_init(&dm_aux->aux);
+	if (ret)
+		goto free_name;
+
 	drm_dp_cec_register_connector(&dm_aux->aux, &aconnector->base);
 
 	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
@@ -456,6 +459,7 @@ int amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	return 0;
 unreg_cec:
 	drm_dp_cec_unregister_connector(&dm_aux->aux);
+free_name:
 	kfree(dm_aux->aux.name);
 	return ret;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index aa6cda458eb9..c105dcb79c37 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -794,6 +794,8 @@ static int anx6345_i2c_remove(struct i2c_client *client)
 
 	unregister_i2c_dummy_clients(anx6345);
 
+	drm_dp_aux_fini(&anx6345->aux);
+
 	kfree(anx6345->edid);
 
 	mutex_destroy(&anx6345->lock);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index f20558618220..0778458e81be 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -1364,6 +1364,8 @@ static int anx78xx_i2c_remove(struct i2c_client *client)
 
 	unregister_i2c_dummy_clients(anx78xx);
 
+	drm_dp_aux_fini(&anx78xx->aux);
+
 	kfree(anx78xx->edid);
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f115233b1cb9..f82e193d32ae 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1806,6 +1806,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 void analogix_dp_remove(struct analogix_dp_device *dp)
 {
 	clk_disable_unprepare(dp->clock);
+	drm_dp_aux_fini(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_remove);
 
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 01e95466502a..c5e2bc75b226 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2436,14 +2436,17 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mutex_init(&mhdp->link_mutex);
 	spin_lock_init(&mhdp->start_lock);
 
-	drm_dp_aux_init(&mhdp->aux);
 	mhdp->aux.dev = dev;
 	mhdp->aux.transfer = cdns_mhdp_transfer;
+	ret = drm_dp_aux_init(&mhdp->aux);
+	if (ret)
+		return ret;
 
 	mhdp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mhdp->regs)) {
 		dev_err(dev, "Failed to get memory resource\n");
-		return PTR_ERR(mhdp->regs);
+		ret = PTR_ERR(mhdp->regs);
+		goto aux_fini;
 	}
 
 	mhdp->sapb_regs = devm_platform_ioremap_resource_byname(pdev, "mhdptx-sapb");
@@ -2458,7 +2461,8 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node, 0);
 	if (IS_ERR(mhdp->phy)) {
 		dev_err(dev, "no PHY configured\n");
-		return PTR_ERR(mhdp->phy);
+		ret = PTR_ERR(mhdp->phy);
+		goto aux_fini;
 	}
 
 	platform_set_drvdata(pdev, mhdp);
@@ -2555,6 +2559,8 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 clk_disable:
 	clk_disable_unprepare(mhdp->clk);
+aux_fini:
+	drm_dp_aux_fini(&mhdp->aux);
 
 	return ret;
 }
@@ -2597,6 +2603,8 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(mhdp->clk);
 
+	drm_dp_aux_fini(&mhdp->aux);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index da89922721ed..6a56acf36a9a 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1693,7 +1693,9 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	tc->aux.name = "TC358767 AUX i2c adapter";
 	tc->aux.dev = tc->dev;
 	tc->aux.transfer = tc_aux_transfer;
-	drm_dp_aux_init(&tc->aux);
+	ret = drm_dp_aux_init(&tc->aux);
+	if (ret)
+		return ret;
 
 	tc->bridge.funcs = &tc_bridge_funcs;
 	if (tc->hpd_pin >= 0)
@@ -1713,6 +1715,7 @@ static int tc_remove(struct i2c_client *client)
 	struct tc_data *tc = i2c_get_clientdata(client);
 
 	drm_bridge_remove(&tc->bridge);
+	drm_dp_aux_fini(&tc->aux);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 88df4dd0f39d..6190451c9195 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1291,17 +1291,16 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 	pm_runtime_enable(pdata->dev);
 
 	ret = ti_sn_setup_gpio_controller(pdata);
-	if (ret) {
-		pm_runtime_disable(pdata->dev);
-		return ret;
-	}
-
+	if (ret)
+		goto fail_pm;
 	i2c_set_clientdata(client, pdata);
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
 	pdata->aux.dev = pdata->dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
-	drm_dp_aux_init(&pdata->aux);
+	ret = drm_dp_aux_init(&pdata->aux);
+	if (ret)
+		goto fail_pm;
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = client->dev.of_node;
@@ -1311,6 +1310,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 	ti_sn_debugfs_init(pdata);
 
 	return 0;
+fail_pm:
+	pm_runtime_disable(pdata->dev);
+	return ret;
 }
 
 static int ti_sn_bridge_remove(struct i2c_client *client)
@@ -1332,6 +1334,8 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 		mipi_dsi_device_unregister(pdata->dsi);
 	}
 
+	drm_dp_aux_fini(&pdata->aux);
+
 	drm_bridge_remove(&pdata->bridge);
 
 	return 0;
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index cb2f53e56685..6c9e552233fd 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1731,10 +1731,18 @@ EXPORT_SYMBOL(drm_dp_remote_aux_init);
  * If you need to use the drm_dp_aux's i2c adapter prior to registering it
  * with the outside world, call drm_dp_aux_init() first. You must still
  * call drm_dp_aux_register() once the connector has been registered to
- * allow userspace access to the auxiliary DP channel.
+ * allow userspace access to the auxiliary DP channel. Once the AUX channel is
+ * no longer being used and has been unregistered with
+ * drm_dp_aux_unregister(), the driver must clean up any resources it's
+ * allocated with drm_dp_aux_fini().
+ *
+ * Returns:
+ * %0 on success, negative error code on failure
  */
-void drm_dp_aux_init(struct drm_dp_aux *aux)
+int drm_dp_aux_init(struct drm_dp_aux *aux)
 {
+	int ret;
+
 	mutex_init(&aux->hw_mutex);
 	mutex_init(&aux->cec.lock);
 	INIT_WORK(&aux->crc_work, drm_dp_aux_crc_work);
@@ -1744,16 +1752,55 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
 	aux->ddc.retries = 3;
 
 	aux->ddc.lock_ops = &drm_dp_i2c_lock_ops;
+
+	aux->ddc.class = I2C_CLASS_DDC;
+	aux->ddc.owner = THIS_MODULE;
+	aux->ddc.dev.parent = aux->dev;
+
+	strlcpy(aux->ddc.name, aux->name ?: dev_name(aux->dev), sizeof(aux->ddc.name));
+
+	ret = i2c_add_adapter(&aux->ddc);
+	if (ret) {
+		aux->ddc.algo = NULL;
+		mutex_destroy(&aux->hw_mutex);
+		mutex_destroy(&aux->cec.lock);
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_dp_aux_init);
 
 /**
- * drm_dp_aux_register() - initialise and register aux channel
+ * drm_dp_aux_fini() - release resources from an aux channel
  * @aux: DisplayPort AUX channel
  *
- * Automatically calls drm_dp_aux_init() if this hasn't been done yet.
+ * Cleans up any resources associated with a DP AUX channel, along with
+ * removing it's associated i2c adapter. Must always be called once an AUX
+ * channel is being removed. Note that if drm_dp_aux_init() was not called on
+ * @aux, this function is a no-op.
+ */
+void drm_dp_aux_fini(struct drm_dp_aux *aux)
+{
+	if (!aux->ddc.algo)
+		return;
+
+	i2c_del_adapter(&aux->ddc);
+	mutex_destroy(&aux->hw_mutex);
+	mutex_destroy(&aux->cec.lock);
+}
+EXPORT_SYMBOL(drm_dp_aux_fini);
+
+/**
+ * drm_dp_aux_register() - register aux channel
+ * @aux: DisplayPort AUX channel
+ *
+ * Automatically calls drm_dp_aux_init() if this hasn't been done yet. The
+ * driver must make sure to call drm_dp_aux_unregister() to unregister the
+ * device, and drm_dp_aux_fini() to cleanup the device after it's been
+ * unregistered.
+ *
  * This should only be called when the underlying &struct drm_connector is
- * initialiazed already. Therefore the best place to call this is from
+ * initialized already. Therefore the best place to call this is from
  * &drm_connector_funcs.late_register. Not that drivers which don't follow this
  * will Oops when CONFIG_DRM_DP_AUX_CHARDEV is enabled.
  *
@@ -1766,39 +1813,32 @@ EXPORT_SYMBOL(drm_dp_aux_init);
 int drm_dp_aux_register(struct drm_dp_aux *aux)
 {
 	int ret;
+	const bool init_aux = !aux->ddc.algo;
 
-	if (!aux->ddc.algo)
-		drm_dp_aux_init(aux);
-
-	aux->ddc.class = I2C_CLASS_DDC;
-	aux->ddc.owner = THIS_MODULE;
-	aux->ddc.dev.parent = aux->dev;
-
-	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
-		sizeof(aux->ddc.name));
+	if (init_aux) {
+		ret = drm_dp_aux_init(aux);
+		if (ret)
+			return ret;
+	}
 
 	ret = drm_dp_aux_register_devnode(aux);
-	if (ret)
-		return ret;
+	if (ret && init_aux)
+		drm_dp_aux_fini(aux);
 
-	ret = i2c_add_adapter(&aux->ddc);
-	if (ret) {
-		drm_dp_aux_unregister_devnode(aux);
-		return ret;
-	}
-
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_dp_aux_register);
 
 /**
  * drm_dp_aux_unregister() - unregister an AUX adapter
  * @aux: DisplayPort AUX channel
+ *
+ * Note that this function does not take care of calling drm_dp_aux_fini(),
+ * the driver must handle this part itself.
  */
 void drm_dp_aux_unregister(struct drm_dp_aux *aux)
 {
 	drm_dp_aux_unregister_devnode(aux);
-	i2c_del_adapter(&aux->ddc);
 }
 EXPORT_SYMBOL(drm_dp_aux_unregister);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 7e83bc2cc34a..a79c6e781638 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -644,15 +644,17 @@ void intel_dp_aux_fini(struct intel_dp *intel_dp)
 	if (cpu_latency_qos_request_active(&intel_dp->pm_qos))
 		cpu_latency_qos_remove_request(&intel_dp->pm_qos);
 
+	drm_dp_aux_fini(&intel_dp->aux);
 	kfree(intel_dp->aux.name);
 }
 
-void intel_dp_aux_init(struct intel_dp *intel_dp)
+int intel_dp_aux_init(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct intel_encoder *encoder = &dig_port->base;
 	enum aux_ch aux_ch = dig_port->aux_ch;
+	int ret;
 
 	if (DISPLAY_VER(dev_priv) >= 12) {
 		intel_dp->aux_ch_ctl_reg = tgl_aux_ctl_reg;
@@ -682,7 +684,9 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 	else
 		intel_dp->get_aux_send_ctl = g4x_get_aux_send_ctl;
 
-	drm_dp_aux_init(&intel_dp->aux);
+	ret = drm_dp_aux_init(&intel_dp->aux);
+	if (ret)
+		return ret;
 
 	/* Failure to allocate our preferred name is not critical */
 	if (DISPLAY_VER(dev_priv) >= 12 && aux_ch >= AUX_CH_USBC1)
@@ -696,4 +700,6 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 
 	intel_dp->aux.transfer = intel_dp_aux_transfer;
 	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	return ret;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.h b/drivers/gpu/drm/i915/display/intel_dp_aux.h
index 4afbe76217b9..321bab28eb07 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.h
@@ -13,6 +13,6 @@ struct intel_dp;
 u32 intel_dp_pack_aux(const u8 *src, int src_bytes);
 
 void intel_dp_aux_fini(struct intel_dp *intel_dp);
-void intel_dp_aux_init(struct intel_dp *intel_dp);
+int intel_dp_aux_init(struct intel_dp *intel_dp);
 
 #endif /* __INTEL_DP_AUX_H__ */
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 7c22bfe0fc7d..2ef42ca1fda5 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -494,6 +494,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
 void dp_aux_unregister(struct drm_dp_aux *dp_aux)
 {
 	drm_dp_aux_unregister(dp_aux);
+	drm_dp_aux_fini(dp_aux);
 }
 
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
diff --git a/drivers/gpu/drm/msm/edp/edp_aux.c b/drivers/gpu/drm/msm/edp/edp_aux.c
index df10a0196d94..ced3a38781ed 100644
--- a/drivers/gpu/drm/msm/edp/edp_aux.c
+++ b/drivers/gpu/drm/msm/edp/edp_aux.c
@@ -218,6 +218,7 @@ void msm_edp_aux_destroy(struct device *dev, struct edp_aux *aux)
 {
 	if (aux) {
 		drm_dp_aux_unregister(&aux->drm_aux);
+		drm_dp_aux_fini(&aux->drm_aux);
 		mutex_destroy(&aux->msg_mutex);
 	}
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 61e6d7412505..e5a93fab856e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -402,6 +402,7 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	if (nv_connector->aux.transfer) {
 		drm_dp_cec_unregister_connector(&nv_connector->aux);
 		drm_dp_aux_unregister(&nv_connector->aux);
+		drm_dp_aux_fini(&nv_connector->aux);
 		kfree(nv_connector->aux.name);
 	}
 	kfree(connector);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 607ad5620bd9..f185d3e96bf8 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -921,6 +921,7 @@ static void radeon_connector_unregister(struct drm_connector *connector)
 
 	if (radeon_connector->ddc_bus && radeon_connector->ddc_bus->has_aux) {
 		drm_dp_aux_unregister(&radeon_connector->ddc_bus->aux);
+		drm_dp_aux_fini(&radeon_connector->ddc_bus->aux);
 		radeon_connector->ddc_bus->has_aux = false;
 	}
 }
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index ea56c6ec25e4..6379f2f32d4d 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -534,7 +534,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->aux.transfer = tegra_dpaux_transfer;
 	dpaux->aux.dev = &pdev->dev;
 
-	drm_dp_aux_init(&dpaux->aux);
+	err = drm_dp_aux_init(&dpaux->aux);
+	if (err)
+		return err;
 
 	/*
 	 * Assume that by default the DPAUX/I2C pads will be used for HDMI,
@@ -546,7 +548,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	 */
 	err = tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
 	if (err < 0)
-		return err;
+		goto aux_fini;
 
 #ifdef CONFIG_GENERIC_PINCONF
 	dpaux->desc.name = dev_name(&pdev->dev);
@@ -559,7 +561,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
 	if (IS_ERR(dpaux->pinctrl)) {
 		dev_err(&pdev->dev, "failed to register pincontrol\n");
-		return PTR_ERR(dpaux->pinctrl);
+		err = PTR_ERR(dpaux->pinctrl);
+		goto aux_fini;
 	}
 #endif
 	/* enable and clear all interrupts */
@@ -573,6 +576,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	mutex_unlock(&dpaux_lock);
 
 	return 0;
+aux_fini:
+	drm_dp_aux_fini(&dpaux->aux);
+	return err;
 }
 
 static int tegra_dpaux_remove(struct platform_device *pdev)
@@ -584,6 +590,8 @@ static int tegra_dpaux_remove(struct platform_device *pdev)
 	/* make sure pads are powered down when not in use */
 	tegra_dpaux_pad_power_down(dpaux);
 
+	drm_dp_aux_fini(&dpaux->aux);
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 59d1fb017da0..5370b99aabdf 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1083,6 +1083,7 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
 static void zynqmp_dp_aux_cleanup(struct zynqmp_dp *dp)
 {
 	drm_dp_aux_unregister(&dp->aux);
+	drm_dp_aux_fini(&dp->aux);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index e44b0ee7b85e..54d13a4d819f 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -2009,7 +2009,8 @@ bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
-void drm_dp_aux_init(struct drm_dp_aux *aux);
+__must_check int drm_dp_aux_init(struct drm_dp_aux *aux);
+void drm_dp_aux_fini(struct drm_dp_aux *aux);
 __must_check int drm_dp_aux_register(struct drm_dp_aux *aux);
 void drm_dp_aux_unregister(struct drm_dp_aux *aux);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
