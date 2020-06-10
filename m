Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C540A1F4FEB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 10:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD0C89AD2;
	Wed, 10 Jun 2020 08:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E158589AD2;
 Wed, 10 Jun 2020 08:06:48 +0000 (UTC)
IronPort-SDR: JLH1YPHZQN/eeWvdK48YHfVUYer9OzrEZgQW/XF/B2JzVSD+pHzL6Jyig4Gz3jAO8QDvfwQ91b
 Fqu2keJ9ru9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 01:06:48 -0700
IronPort-SDR: b4Fz+9G2cOiVFyceHGvuCQ/9jCPYTP9rg6JfAwpXwTQ5sHSiXKU4IEf8/GU/moccdEQRYzm5y6
 uXtu+uf1QRIA==
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; d="scan'208";a="418674045"
Received: from unknown (HELO intel.com) ([10.237.72.89])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 01:06:45 -0700
Date: Wed, 10 Jun 2020 11:03:04 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 2/3] drm/dp_mst: Fix the DDC I2C device registration of
 an MST port
Message-ID: <20200610080304.GA10787@intel.com>
References: <20200607212522.16935-1-imre.deak@intel.com>
 <20200607212522.16935-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607212522.16935-2-imre.deak@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 12:25:21AM +0300, Imre Deak wrote:
> During the initial MST probing an MST port's I2C device will be
> registered using the kdev of the DRM device as a parent. Later after MST
> Connection Status Notifications this I2C device will be re-registered
> with the kdev of the port's connector. This will also move
> inconsistently the I2C device's sysfs entry from the DRM device's sysfs
> dir to the connector's dir.
> 
> Fix the above by keeping the DRM kdev as the parent of the I2C device.
> 
> Ideally the connector's kdev would be used as a parent, similarly to
> non-MST connectors, however that needs some more refactoring to ensure
> the connector's kdev is already available early enough. So keep the
> existing (initial) behavior for now.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 28 +++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 02c800b8199f..083255c33ee0 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -88,8 +88,8 @@ static int drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
>  static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
>  				 u8 *guid);
>  
> -static int drm_dp_mst_register_i2c_bus(struct drm_dp_aux *aux);
> -static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_aux *aux);
> +static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port);
> +static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port);
>  static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr);
>  
>  #define DBG_PREFIX "[dp_mst]"
> @@ -1993,7 +1993,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
>  			}
>  
>  			/* remove i2c over sideband */
> -			drm_dp_mst_unregister_i2c_bus(&port->aux);
> +			drm_dp_mst_unregister_i2c_bus(port);
>  		} else {
>  			mutex_lock(&mgr->lock);
>  			drm_dp_mst_topology_put_mstb(port->mstb);
> @@ -2008,7 +2008,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
>  	if (port->pdt != DP_PEER_DEVICE_NONE) {
>  		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
>  			/* add i2c over sideband */
> -			ret = drm_dp_mst_register_i2c_bus(&port->aux);
> +			ret = drm_dp_mst_register_i2c_bus(port);
>  		} else {
>  			lct = drm_dp_calculate_rad(port, rad);
>  			mstb = drm_dp_add_mst_branch_device(lct, rad);
> @@ -5375,22 +5375,26 @@ static const struct i2c_algorithm drm_dp_mst_i2c_algo = {
>  
>  /**
>   * drm_dp_mst_register_i2c_bus() - register an I2C adapter for I2C-over-AUX
> - * @aux: DisplayPort AUX channel
> + * @port: The port to add the I2C bus on
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
> -static int drm_dp_mst_register_i2c_bus(struct drm_dp_aux *aux)
> +static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
>  {
> +	struct drm_dp_aux *aux = &port->aux;
> +	struct device *parent_dev = port->mgr->dev->dev;
> +

So are we sure that this will always give us thr kdev of the drm device?
I mean could there be more complex hierarchy? Just wondering if there is 
a way to get drm device kdev in a more explicit way.
 
>  	aux->ddc.algo = &drm_dp_mst_i2c_algo;
>  	aux->ddc.algo_data = aux;
>  	aux->ddc.retries = 3;
>  
>  	aux->ddc.class = I2C_CLASS_DDC;
>  	aux->ddc.owner = THIS_MODULE;
> -	aux->ddc.dev.parent = aux->dev;
> -	aux->ddc.dev.of_node = aux->dev->of_node;
> +	/* FIXME: set the kdev of the port's connector as parent */
> +	aux->ddc.dev.parent = parent_dev;
> +	aux->ddc.dev.of_node = parent_dev->of_node;
>  
> -	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
> +	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(parent_dev),
>  		sizeof(aux->ddc.name));
>  
>  	return i2c_add_adapter(&aux->ddc);
> @@ -5398,11 +5402,11 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_aux *aux)
>  
>  /**
>   * drm_dp_mst_unregister_i2c_bus() - unregister an I2C-over-AUX adapter
> - * @aux: DisplayPort AUX channel
> + * @port: The port to remove the I2C bus from
>   */
> -static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_aux *aux)
> +static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port)
>  {
> -	i2c_del_adapter(&aux->ddc);
> +	i2c_del_adapter(&port->aux.ddc);
>  }
>  
>  /**
> -- 
> 2.23.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
