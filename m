Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07680C79256
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A5510E2B9;
	Fri, 21 Nov 2025 13:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mackizri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8A910E2B9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:12:19 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD60C66B;
 Fri, 21 Nov 2025 14:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763730611;
 bh=oaCB+A28ZlRnk7Q6v7uO0GygSpbYUS8yI43OlWTQz24=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=MackizridEycMXCsPAHckHJ1GLOBJleA4aVKQEhkRnoI+8RlrOcsrfrDqiz+qDGpO
 XHKhQWx1OTdvhy/R5IED/sguQTHDp9NhtczZ9OTJA0mo7rJK/BOfQX/oSiNXW2NCs5
 HZ61WC4JG0BMf6FG7driPUackQNa9TqzMf7gXkrM=
Message-ID: <6a696e33-b855-4fc7-8325-304a009ed001@ideasonboard.com>
Date: Fri, 21 Nov 2025 15:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 1/6] drm/bridge: cadence: cdns-mhdp8546-core:
 Set the mhdp connector earlier in atomic_enable()
To: Harikrishna Shenoy <h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
 <20251120121416.660781-2-h-shenoy@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, aradhya.bhatia@linux.dev,
 devarsht@ti.com, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, linux@treblig.org, luca.ceresoli@bootlin.com,
 lumag@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mordan@ispras.ru, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, s-jain1@ti.com, simona@ffwll.ch, tzimmermann@suse.de,
 u-kumar1@ti.com
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20251120121416.660781-2-h-shenoy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 20/11/2025 14:14, Harikrishna Shenoy wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
> in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
> NULL pointer while trying to access the mutex. We need the connector to
> be set before that. Unlike in legacy cases with flag
> !DRM_BRIDGE_ATTACH_NO_CONNECTOR, we do not have connector initialised
> in bridge_attach(), so add the mhdp->connector_ptr in device structure
> to handle both cases with DRM_BRIDGE_ATTACH_NO_CONNECTOR and
> !DRM_BRIDGE_ATTACH_NO_CONNECTOR, set it in atomic_enable() earlier to
> avoid possible NULL pointer dereference in recovery paths like
> modeset_retry_fn() with the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set.
> 
> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 ++++++++++---------
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 26 ++++++++++++-----
>  3 files changed, 34 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 38726ae1bf150..f3076e9cdabbe 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -740,7 +740,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
>  	bridge_attached = mhdp->bridge_attached;
>  	spin_unlock(&mhdp->start_lock);
>  	if (bridge_attached) {
> -		if (mhdp->connector.dev)
> +		if (mhdp->connector_ptr && mhdp->connector_ptr->dev)
>  			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
>  		else
>  			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));

This code looks odd, and there are a few other similar if-elses too.
What does this do?

Correct me if I'm wrong but:

With DRM_BRIDGE_ATTACH_NO_CONNECTOR, connector_ptr is set at
cdns_mhdp_atomic_enable(). If connector_ptr is set, I assume we also
always have dev there.

Without DRM_BRIDGE_ATTACH_NO_CONNECTOR, connector_ptr is set at
cdns_mhdp_connector_init(). If it is set, we have called
drm_connector_init(), and dev is valid.

So... If we have connector_ptr, connector_ptr->dev is always set? So no
need to check for the dev.

But overall I'm confused about the 'else' block. Why do we have these
code blocks that (in the current upstream code) check for
'mhdp->connector.dev' (I think that's checking if the
cdns_mhdp_connector_init() has been called), and then, e.g. here, call
either drm_kms_helper_hotplug_event() or drm_bridge_hpd_notify(). I
don't understand what is the idea here.

Also, in the above case, the code checks for 'bridge_attached'. It is
set in cdns_mhdp_attach(), after calling cdns_mhdp_connector_init().
So... If bridge_attached is true, we always have a connector if
DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set. And if
DRM_BRIDGE_ATTACH_NO_CONNECTOR is set, we never have a connector,
because it's set only in atomic enable.

So the 'if' is effectively checking for DRM_BRIDGE_ATTACH_NO_CONNECTOR
flag? It still doesn't explain why we need to check it here.

 Tomi

> @@ -1636,6 +1636,7 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
>  		return ret;
>  	}
>  
> +	mhdp->connector_ptr = conn;
>  	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
>  
>  	ret = drm_display_info_set_bus_formats(&conn->display_info,
> @@ -1915,17 +1916,25 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>  	struct cdns_mhdp_bridge_state *mhdp_state;
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_connector *connector;
>  	struct drm_connector_state *conn_state;
>  	struct drm_bridge_state *new_state;
>  	const struct drm_display_mode *mode;
>  	u32 resp;
> -	int ret;
> +	int ret = 0;
>  
>  	dev_dbg(mhdp->dev, "bridge enable\n");
>  
>  	mutex_lock(&mhdp->link_mutex);
>  
> +	mhdp->connector_ptr = drm_atomic_get_new_connector_for_encoder(state,
> +								       bridge->encoder);
> +	if (WARN_ON(!mhdp->connector_ptr))
> +		goto out;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector_ptr);
> +	if (WARN_ON(!conn_state))
> +		goto out;
> +
>  	if (mhdp->plugged && !mhdp->link_up) {
>  		ret = cdns_mhdp_link_up(mhdp);
>  		if (ret < 0)
> @@ -1945,15 +1954,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>  	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
>  			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
>  
> -	connector = drm_atomic_get_new_connector_for_encoder(state,
> -							     bridge->encoder);
> -	if (WARN_ON(!connector))
> -		goto out;
> -
> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
> -	if (WARN_ON(!conn_state))
> -		goto out;
> -
>  	if (mhdp->hdcp_supported &&
>  	    mhdp->hw_state == MHDP_HW_READY &&
>  	    conn_state->content_protection ==
> @@ -2030,6 +2030,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
>  	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
>  		mhdp->info->ops->disable(mhdp);
>  
> +	mhdp->connector_ptr = NULL;
>  	mutex_unlock(&mhdp->link_mutex);
>  }
>  
> @@ -2296,7 +2297,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
>  
>  	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
>  
> -	conn = &mhdp->connector;
> +	conn = mhdp->connector_ptr;
>  
>  	/* Grab the locks before changing connector property */
>  	mutex_lock(&conn->dev->mode_config.mutex);
> @@ -2373,7 +2374,7 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
>  	int ret;
>  
>  	ret = cdns_mhdp_update_link_status(mhdp);
> -	if (mhdp->connector.dev) {
> +	if (mhdp->connector_ptr && mhdp->connector_ptr->dev) {
>  		if (ret < 0)
>  			schedule_work(&mhdp->modeset_retry_work);
>  		else
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> index bad2fc0c73066..a76775c768956 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> @@ -376,6 +376,7 @@ struct cdns_mhdp_device {
>  	struct mutex link_mutex;
>  
>  	struct drm_connector connector;
> +	struct drm_connector *connector_ptr;
>  	struct drm_bridge bridge;
>  
>  	struct cdns_mhdp_link link;
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> index 42248f179b69d..5ac2fad2f0078 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> @@ -393,8 +393,10 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
>  {
>  	int ret;
>  
> -	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
> -		mhdp->connector.name, mhdp->connector.base.id);
> +	if (mhdp->connector_ptr) {
> +		dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
> +			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
> +	}
>  
>  	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
>  
> @@ -443,9 +445,11 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
>  	if (!ret && hdcp_port_status & HDCP_PORT_STS_AUTH)
>  		goto out;
>  
> -	dev_err(mhdp->dev,
> -		"[%s:%d] HDCP link failed, retrying authentication\n",
> -		mhdp->connector.name, mhdp->connector.base.id);
> +	if (mhdp->connector_ptr) {
> +		dev_err(mhdp->dev,
> +			"[%s:%d] HDCP link failed, retrying authentication\n",
> +			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
> +	}
>  
>  	ret = _cdns_mhdp_hdcp_disable(mhdp);
>  	if (ret) {
> @@ -487,13 +491,19 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
>  	struct cdns_mhdp_device *mhdp = container_of(hdcp,
>  						     struct cdns_mhdp_device,
>  						     hdcp);
> -	struct drm_device *dev = mhdp->connector.dev;
> +	struct drm_device *dev = NULL;
>  	struct drm_connector_state *state;
>  
> +	if (mhdp->connector_ptr)
> +		dev = mhdp->connector_ptr->dev;
> +
> +	if (!dev)
> +		return;
> +
>  	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
>  	mutex_lock(&mhdp->hdcp.mutex);
> -	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		state = mhdp->connector.state;
> +	if (mhdp->connector_ptr && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +		state = mhdp->connector_ptr->state;
>  		state->content_protection = mhdp->hdcp.value;
>  	}
>  	mutex_unlock(&mhdp->hdcp.mutex);

