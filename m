Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4CE60DEDD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 12:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD8110E4A8;
	Wed, 26 Oct 2022 10:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D410E26A;
 Wed, 26 Oct 2022 10:30:12 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEF214F8;
 Wed, 26 Oct 2022 12:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1666780210;
 bh=Sfk+sY2PkQcCuOdrWM5zFeMRlAQPq29owCfvhuwKSnw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uzWSslpIUV03O4VvsgzSSuTbXe7YSsT0Oi6To9+A+lXHLQXqJDzpn7YHrEckAl+zR
 f0pnetIgMuorppSTy4aErSJ1QqgzF7wn9jedA1JyVL+En50db61QVxAMhjW9aQBbT1
 AJzL6ReMShmBMpkJCg44wDSBqDZeJb/QkNFRMMgI=
Message-ID: <3ee50202-30c5-3c24-2cda-d1ee7cff65e8@ideasonboard.com>
Date: Wed, 26 Oct 2022 13:30:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/7] drm/probe-helper: enable and disable HPD on
 connectors
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
 <20221024153926.3222225-3-dmitry.baryshkov@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221024153926.3222225-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/10/2022 18:39, Dmitry Baryshkov wrote:
> Intruct two drm_connector_helper_funcs: enable_hpd() and disable_hpd().

"Introduce"?

> They are called by drm_kms_helper_poll_enable() and
> drm_kms_helper_poll_disable() (and thus drm_kms_helper_poll_init() and
> drm_kms_helper_poll_fini()) respectively.
> 
> This allows drivers to rely on drm_kms_helper_poll for enabling and
> disabling HPD detection rather than doing that manually.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_probe_helper.c       | 19 +++++++++++++++++++
>   include/drm/drm_modeset_helper_vtables.h | 22 ++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index f97fda3b1d34..a7b4590d8ec1 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -251,6 +251,12 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
>   
>   	drm_connector_list_iter_begin(dev, &conn_iter);
>   	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->enable_hpd)
> +			funcs->enable_hpd(connector);
> +
>   		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
>   					 DRM_CONNECTOR_POLL_DISCONNECT))
>   			poll = true;
> @@ -805,12 +811,25 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>   
>   static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
>   {
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
>   	if (!dev->mode_config.poll_enabled)
>   		return;
>   
>   	if (fini)
>   		dev->mode_config.poll_enabled = false;
>   
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->disable_hpd)
> +			funcs->disable_hpd(connector);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
>   	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
>   }
>   
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index fafa70ac1337..7aa1f01223f9 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1143,6 +1143,28 @@ struct drm_connector_helper_funcs {
>   	 */
>   	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
>   				      struct drm_writeback_job *job);
> +
> +	/**
> +	 * @enable_hpd:
> +	 *
> +	 * Enable hot-plug detection for the connector.
> +	 *
> +	 * This operation is optional.
> +	 *
> +	 * This callback is used by the drm_kms_helper_poll_enable() helpers.
> +	 */
> +	void (*enable_hpd)(struct drm_connector *connector);
> +
> +	/**
> +	 * @disable_hpd:
> +	 *
> +	 * Disable hot-plug detection for the connector.
> +	 *
> +	 * This operation is optional.
> +	 *
> +	 * This callback is used by the drm_kms_helper_poll_disable() helpers.
> +	 */
> +	void (*disable_hpd)(struct drm_connector *connector);
>   };
>   
>   /**

