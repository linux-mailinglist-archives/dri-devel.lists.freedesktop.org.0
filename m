Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890084986B9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 18:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8310E3E7;
	Mon, 24 Jan 2022 17:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E51D10E3E7;
 Mon, 24 Jan 2022 17:27:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9541D6E;
 Mon, 24 Jan 2022 09:27:26 -0800 (PST)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3F493F766;
 Mon, 24 Jan 2022 09:27:25 -0800 (PST)
Message-ID: <89905c4f-4d7b-4cd4-cfb8-07c2d5648c50@foss.arm.com>
Date: Mon, 24 Jan 2022 17:27:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] drm/arm/komeda : change driver to use
 drm_writeback_connector.base pointer
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
 <20220111101801.28310-2-suraj.kandpal@intel.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <20220111101801.28310-2-suraj.kandpal@intel.com>
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
Cc: jani.nikula@intel.com, Kandpal@freedesktop.org, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes sense given the other patches in your series, but it seems as 
yet no one has anything to say about this. I don't have anything 
specific to comment on other than it seems to make the correct changes 
to komeda given the rest.

Reviewed-by: Carsten Haitzler <carsten.haitzler@arm.com>

On 1/11/22 10:18, Kandpal, Suraj wrote:
> Making changes to komeda driver because we had to change
> drm_writeback_connector.base into a pointer the reason for which is
> expained in the Patch (drm: add writeback pointers to drm_connector).
> 
> Signed-off-by: Kandpal, Suraj <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c         | 2 +-
>   drivers/gpu/drm/arm/display/komeda/komeda_kms.h          | 3 ++-
>   drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 9 +++++----
>   3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 59172acb9738..eb37f41c1790 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -265,7 +265,7 @@ komeda_crtc_do_flush(struct drm_crtc *crtc,
>   	if (slave && has_bit(slave->id, kcrtc_st->affected_pipes))
>   		komeda_pipeline_update(slave, old->state);
>   
> -	conn_st = wb_conn ? wb_conn->base.base.state : NULL;
> +	conn_st = wb_conn ? wb_conn->base.base->state : NULL;
>   	if (conn_st && conn_st->writeback_job)
>   		drm_writeback_queue_job(&wb_conn->base, conn_st);
>   
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> index 456f3c435719..8d83883a1d99 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
> @@ -53,6 +53,7 @@ struct komeda_plane_state {
>    * struct komeda_wb_connector
>    */
>   struct komeda_wb_connector {
> +	struct drm_connector conn;
>   	/** @base: &drm_writeback_connector */
>   	struct drm_writeback_connector base;
>   
> @@ -136,7 +137,7 @@ struct komeda_kms_dev {
>   static inline bool is_writeback_only(struct drm_crtc_state *st)
>   {
>   	struct komeda_wb_connector *wb_conn = to_kcrtc(st->crtc)->wb_conn;
> -	struct drm_connector *conn = wb_conn ? &wb_conn->base.base : NULL;
> +	struct drm_connector *conn = wb_conn ? wb_conn->base.base : NULL;
>   
>   	return conn && (st->connector_mask == BIT(drm_connector_index(conn)));
>   }
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index e465cc4879c9..0caaf483276d 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -51,7 +51,7 @@ komeda_wb_encoder_atomic_check(struct drm_encoder *encoder,
>   		return -EINVAL;
>   	}
>   
> -	wb_layer = to_kconn(to_wb_conn(conn_st->connector))->wb_layer;
> +	wb_layer = to_kconn(drm_connector_to_writeback(conn_st->connector))->wb_layer;
>   
>   	/*
>   	 * No need for a full modested when the only connector changed is the
> @@ -123,7 +123,7 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
>   static void komeda_wb_connector_destroy(struct drm_connector *connector)
>   {
>   	drm_connector_cleanup(connector);
> -	kfree(to_kconn(to_wb_conn(connector)));
> +	kfree(to_kconn(drm_connector_to_writeback(connector)));
>   }
>   
>   static const struct drm_connector_funcs komeda_wb_connector_funcs = {
> @@ -155,6 +155,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>   	kwb_conn->wb_layer = kcrtc->master->wb_layer;
>   
>   	wb_conn = &kwb_conn->base;
> +	wb_conn->base = &kwb_conn->conn;
>   	wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
>   
>   	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
> @@ -171,9 +172,9 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>   		return err;
>   	}
>   
> -	drm_connector_helper_add(&wb_conn->base, &komeda_wb_conn_helper_funcs);
> +	drm_connector_helper_add(wb_conn->base, &komeda_wb_conn_helper_funcs);
>   
> -	info = &kwb_conn->base.base.display_info;
> +	info = &kwb_conn->base.base->display_info;
>   	info->bpc = __fls(kcrtc->master->improc->supported_color_depths);
>   	info->color_formats = kcrtc->master->improc->supported_color_formats;
>   
