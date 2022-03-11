Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E5B4D5C50
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 08:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA110E263;
	Fri, 11 Mar 2022 07:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C57210E263;
 Fri, 11 Mar 2022 07:29:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D0A0488;
 Fri, 11 Mar 2022 08:29:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646983747;
 bh=6E4Gx+J7TWG/HZVRe5zppLC4MQtGDXQHc4H6Xxxx09c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLAr4wXtcA9EeXylHnDG+FBjvvNQ4Wz0lneo+2tPdkC8gjfR+ALwDIEqeEvb32zNm
 e++bZYRvWkQKxtkLqTsnTcfFECnhFdShgsqD/Gq0cvJryXFDIpEMfxW5bo4xfRD7D2
 JoQ0gMom+u9gfPJEIVhFoZpi7SMPYcOfhq7pRkjE=
Date: Fri, 11 Mar 2022 09:28:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: use drm_encoder pointer for
 drm_writeback_connector
Message-ID: <Yir6M150BkXPyH2b@pendragon.ideasonboard.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-6-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1646963400-25606-6-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav

Thank you for the patch.

On Thu, Mar 10, 2022 at 05:49:59PM -0800, Abhinav Kumar wrote:
> Make changes to rcar_du driver to start using drm_encoder pointer
> for drm_writeback_connector.
> 
> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> index c79d125..03930ad 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -200,7 +200,8 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  {
>  	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>  
> -	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> +	wb_conn->encoder = kzalloc(sizeof(struct drm_encoder), GFP_KERNEL);

Where is this freed ?

> +	wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>  	drm_connector_helper_add(&wb_conn->base,
>  				 &rcar_du_wb_conn_helper_funcs);
>  

-- 
Regards,

Laurent Pinchart
