Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC81B7CE2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23DC6EAE6;
	Fri, 24 Apr 2020 17:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA796EAE6;
 Fri, 24 Apr 2020 17:34:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 34DA1803E8;
 Fri, 24 Apr 2020 19:34:48 +0200 (CEST)
Date: Fri, 24 Apr 2020 19:34:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 43/59] drm/arc: Embedd a drm_connector for sim case
Message-ID: <20200424173446.GB7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-44-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-44-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=Q2U7PASBGE9zqflJJX4A:9 a=CjuIK1q_8ugA:10
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:18AM +0200, Daniel Vetter wrote:
> Removes the last devm_kzalloc, which means we're now prepared to use
> drmm_mode_config_cleanup!
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/arc/arcpgu.h     |  1 +
>  drivers/gpu/drm/arc/arcpgu_sim.c | 14 +-------------
>  2 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> index 52afd638a4d2..c52cdd2274e1 100644
> --- a/drivers/gpu/drm/arc/arcpgu.h
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -15,6 +15,7 @@ struct arcpgu_drm_private {
>  	void __iomem		*regs;
>  	struct clk		*clk;
>  	struct drm_simple_display_pipe pipe;
> +	struct drm_connector	sim_conn;
>  };
>  
>  #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
> index 134afb9fa625..e42fe5d05a3d 100644
> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> @@ -18,10 +18,6 @@
>  #define YRES_MAX	8192
>  
>  
> -struct arcpgu_drm_connector {
> -	struct drm_connector connector;
> -};
> -
>  static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
>  {
>  	int count;
> @@ -57,7 +53,6 @@ static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  {
>  	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> -	struct arcpgu_drm_connector *arcpgu_connector;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	int ret;
> @@ -72,14 +67,7 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  	if (ret)
>  		return ret;
>  
> -	arcpgu_connector = devm_kzalloc(drm->dev, sizeof(*arcpgu_connector),
> -					GFP_KERNEL);
> -	if (!arcpgu_connector) {
> -		ret = -ENOMEM;
> -		goto error_encoder_cleanup;
> -	}
> -
> -	connector = &arcpgu_connector->connector;
> +	connector = &arcpgu->sim_conn;
>  	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
>  
>  	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
