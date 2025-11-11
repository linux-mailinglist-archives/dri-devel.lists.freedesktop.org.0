Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7764C4EB74
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 16:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D11010E314;
	Tue, 11 Nov 2025 15:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dKOrlzau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498C410E314
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 15:14:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A92C91A19E0;
 Tue, 11 Nov 2025 15:14:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E0F9606FB;
 Tue, 11 Nov 2025 15:14:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92F4F102F24BC; Tue, 11 Nov 2025 16:14:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762874064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7R5SuVHot9CpoTkFcfHq9Yksdnr2wM0VbRyDn5Qi10s=;
 b=dKOrlzauhoCSJVUKuaP9oTCZn7a/MbZ2YlAMNvicAOTuUkcvvFhCxjLV+bx9T1URMFX9KD
 Xv0onrlrf4j+WXvPuJI65WpdzhDi9F7tNHHVCXx0I93YgctmEO807WWW6869g4FZ+Ptvtw
 KPo8GugnqzYO6yONmOELShTim5/a0xN+uAVWe82MhZ185fsCPlzyX3yaECJWYx+O5v1WJe
 zBiYw+Ry4+/Um2fMV7bWNqIO4F9pMfjJkICfM1An54gPdE9T6KJNLMtgiJJa+RPW1F5ZDo
 llG8ee1T2LOVJ9ZudBWCv3C/RK73b1m+u+qdGUOusNITg3cZ1M7nnnM6LYvWRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Nov 2025 16:14:11 +0100
Message-Id: <DE5YP3AVGOG3.OHP68Z0F6KBU@bootlin.com>
Subject: Re: [PATCH v9 08/10] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
To: "Chaoyi Chen" <kernel@airkyi.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Peter Chen" <hzpeterchen@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Sandy Huang" <hjc@rock-chips.com>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Yubing Zhang" <yubing.zhang@rock-chips.com>,
 "Frank Wang" <frank.wang@rock-chips.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Amit Sunil Dhamne"
 <amitsd@google.com>, "Chaoyi Chen" <chaoyi.chen@rock-chips.com>, "Dragan
 Simic" <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>, "Diederik
 de Haas" <didi.debian@cknow.org>, "Peter Robinson" <pbrobinson@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-9-kernel@airkyi.com>
In-Reply-To: <20251111105040.94-9-kernel@airkyi.com>
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

Hello Chaoyi,

On Tue Nov 11, 2025 at 11:50 AM CET, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs. If both ports
> are plugged into DP, DP will select the first port for output.
>
> This patch adds support for multiple bridges, enabling users to flexibly
> select the output port. For each PHY port, a separate encoder and bridge
> are registered.
>
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the first bridge in bridge chain and DP
> controller. For example, the bridge chain may be like this:
>
> PHY aux birdge -> fsa4480 analog audio switch bridge ->
> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
>
> In this case, the connection relationships among the PHY aux bridge
> and the DP contorller need to be described in DT.
>
> In addition, the cdn_dp_parse_next_bridge_dt() will parses it and
> determines whether to register one or two bridges.
>
> Since there is only one DP controller, only one of the PHY ports can
> output at a time. The key is how to switch between different PHYs,
> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>
> There are two cases:
>
> 1. Neither bridge is enabled. In this case, both bridges can
> independently read the EDID, and the PHY port may switch before
> reading the EDID.
>
> 2. One bridge is already enabled. In this case, other bridges are not
> allowed to read the EDID. So we will try to return the cached EDID.
>
> Since the scenario of two ports plug in at the same time is rare,
> I don't have a board which support two TypeC connector to test this.
> Therefore, I tested forced switching on a single PHY port, as well as
> output using a fake PHY port alongside a real PHY port.
>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

[...]

> @@ -966,28 +1084,16 @@ static int cdn_dp_pd_event(struct notifier_block *=
nb,
>  	return NOTIFY_DONE;
>  }
>
> -static int cdn_dp_bind(struct device *dev, struct device *master, void *=
data)
> +static int cdn_bridge_add(struct device *dev,
> +			  struct drm_bridge *bridge,
> +			  struct drm_bridge *next_bridge,
> +			  struct drm_encoder *encoder)
>  {
>  	struct cdn_dp_device *dp =3D dev_get_drvdata(dev);
> -	struct drm_encoder *encoder;
> +	struct drm_device *drm_dev =3D dp->drm_dev;
> +	struct drm_bridge *last_bridge =3D NULL;
>  	struct drm_connector *connector;
> -	struct cdn_dp_port *port;
> -	struct drm_device *drm_dev =3D data;
> -	int ret, i;

[...]

> +	if (next_bridge) {
> +		ret =3D drm_bridge_attach(encoder, next_bridge, bridge,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (ret)
> +			return ret;
> +
> +		last_bridge =3D next_bridge;
> +		while (drm_bridge_get_next_bridge(last_bridge))
> +			last_bridge =3D drm_bridge_get_next_bridge(last_bridge);

DRM bridges are now refcounted, and you are not calling drm_bridge_get()
and drm_bridge_put() here. But here you can use
drm_bridge_chain_get_last_bridge() which will simplify your job.

Don't forget to call drm_bridge_put() on the returned bridge when the
bridge is not referenced anymore. This should be as easy as adding a
cleanup action on the variable declaration above:

-	struct drm_bridge *last_bridge =3D NULL;
+	struct drm_bridge *last_bridge __free(drm_bridge_put) =3D NULL;

> @@ -1029,8 +1147,102 @@ static int cdn_dp_bind(struct device *dev, struct=
 device *master, void *data)
>  		return ret;
>  	}
>
> +	if (last_bridge)
> +		connector->fwnode =3D fwnode_handle_get(of_fwnode_handle(last_bridge->=
of_node));
> +
>  	drm_connector_attach_encoder(connector, encoder);
>
> +	return 0;
> +}
> +
> +static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
> +{
> +	struct device_node *np =3D dp->dev->of_node;
> +	struct device_node *port __free(device_node) =3D of_graph_get_port_by_i=
d(np, 1);
> +	struct drm_bridge *bridge;
> +	int count =3D 0;
> +	int ret =3D 0;
> +	int i;
> +
> +	/* If device use extcon, do not use hpd bridge */
> +	for (i =3D 0; i < dp->ports; i++) {
> +		if (dp->port[i]->extcon) {
> +			dp->bridge_count =3D 1;
> +			return 0;
> +		}
> +	}
> +
> +
> +	/* One endpoint may correspond to one next bridge. */
> +	for_each_of_graph_port_endpoint(port, dp_ep) {
> +		struct device_node *next_bridge_node __free(device_node) =3D
> +			of_graph_get_remote_port_parent(dp_ep);
> +
> +		bridge =3D of_drm_find_bridge(next_bridge_node);
> +		if (!bridge) {
> +			ret =3D -EPROBE_DEFER;
> +			goto out;
> +		}
> +
> +		dp->next_bridge_valid =3D true;
> +		dp->next_bridge_list[count].bridge =3D bridge;

You are storing a reference to a drm_bridge, so have to increment the
refcount:

		dp->next_bridge_list[count].bridge =3D drm_bridge_get(bridge);
		                                     ^^^^^^^^^^^^^^

FYI there is a plan to replace of_drm_find_bridge() with a function that
increases the bridge refcount before returning the bridge, but it's not
there yet. When that will happen, the explicit drm_bridge_get() won't be
needed anymore and this code can be updated accordingly.

Also you have to call drm_bridge_put() to release that reference when the
pointer goes away. I guess that should happen in cdn_dp_unbind().

> +static int cdn_dp_bind(struct device *dev, struct device *master, void *=
data)
> +{

In this function you do:
...(see below)...

> +	struct cdn_dp_device *dp =3D dev_get_drvdata(dev);
> +	struct drm_bridge *bridge, *next_bridge;
> +	struct drm_encoder *encoder;
> +	struct cdn_dp_port *port;
> +	struct drm_device *drm_dev =3D data;
> +	struct cdn_dp_bridge *dp_bridge;
> +	int ret, i;
> +
> +	ret =3D cdn_dp_parse_dt(dp);
> +	if (ret < 0)
.> +		return ret;
> +
> +	ret =3D cdn_dp_parse_next_bridge_dt(dp);

1. compute the next bridges and store them in dp->next_bridge_list[]
...

> +	if (ret)
> +		return ret;
> +
> +	dp->drm_dev =3D drm_dev;
> +	dp->connected =3D false;
> +	dp->active =3D false;
> +	dp->active_port =3D -1;
> +	dp->fw_loaded =3D false;
> +
> +	for (i =3D 0; i < dp->bridge_count; i++) {
> +		dp_bridge =3D devm_drm_bridge_alloc(dev, struct cdn_dp_bridge, bridge,
> +						    &cdn_dp_bridge_funcs);
> +		if (IS_ERR(dp_bridge))
> +			return PTR_ERR(dp_bridge);
> +		dp_bridge->id =3D i;
> +		dp_bridge->parent =3D dp;
> +		if (!dp->next_bridge_valid)
> +			dp_bridge->connected =3D true;
> +		dp->bridge_list[i] =3D dp_bridge;
> +	}
> +
> +	for (i =3D 0; i < dp->bridge_count; i++) {
> +		encoder =3D &dp->bridge_list[i]->encoder.encoder;
> +		bridge =3D &dp->bridge_list[i]->bridge;
> +		next_bridge =3D dp->next_bridge_list[i].bridge;
> +		ret =3D cdn_bridge_add(dev, bridge, next_bridge, encoder);

...
2. pass the dp->next_bridge_list[i].bridge to cdn_bridge_add
3. not use  dp->next_bridge_list[i] elsewhere

So you may want to change this function to parse into a local array, with
function scope. If you do this, the drm_bridge_get/put() I mentioned above
should still exist, but would be localized to this function, thus even
easier to handle.

Even better, you can parse the DT one bridge at a time inside the for loop,
so you don't need to store any next_bridge pointer array. This will need a
bit of rework of cdn_dp_parse_next_bridge_dt() though, and I haven't
checked in detail so it might be not worth.

[...]

> +struct cdn_dp_bridge {
> +	struct cdn_dp_device *parent;
> +	struct drm_bridge bridge;
> +	struct rockchip_encoder encoder;
> +	bool connected;
> +	bool enabled;
> +	int id;
> +};
> +
> +struct cdn_dp_next_bridge {
> +	struct cdn_dp_device *parent;
> +	struct drm_bridge *bridge;
> +	int id;

The @parent and @id fields are unused if I'm not mistaken.

If it is the case then you can... (see below)

>  struct cdn_dp_device {
>  	struct device *dev;
>  	struct drm_device *drm_dev;
> -	struct drm_bridge bridge;
> -	struct rockchip_encoder encoder;
> +	int bridge_count;
> +	struct cdn_dp_bridge *bridge_list[MAX_PHY];
> +	struct cdn_dp_next_bridge next_bridge_list[MAX_PHY];

...replace this line with:
	struct drm_bridge *next_bridge[MAX_PHY];

Unless of course you just don't store the next_bridge at all, as I
suggested above, and which looks way easier and more efficient.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
