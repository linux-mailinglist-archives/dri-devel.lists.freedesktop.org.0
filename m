Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A07A6A7E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 20:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D834710E173;
	Tue, 19 Sep 2023 18:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D14C10E173;
 Tue, 19 Sep 2023 18:12:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 889DF1257;
 Tue, 19 Sep 2023 20:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695147058;
 bh=+NEoeKyU5HhZn1rudh2DyliowN0b3u/8EuHdKEGIbf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VuilFooGHpc9vdw/DoKX6IVAOvNEHjb+QnhBb7kHFAYGopkIjGAjDl/hgWLur4imI
 ZqV5xafDxa4IQEIRfrn2iDZ8CwR7V3ufVlpjIxw1b2y4YlCSwkSeaTKAnhDLp2ADun
 RYhXtcZczSXG223nOmWQo9mn4HCnXPDH40DnXok4=
Date: Tue, 19 Sep 2023 21:12:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm: remove drm_bridge_hpd_disable() from
 drm_bridge_connector_destroy()
Message-ID: <20230919181246.GA24325@pendragon.ideasonboard.com>
References: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, quic_parellan@quicinc.com,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

Thank you for the patch.

On Tue, Sep 19, 2023 at 10:48:12AM -0700, Abhinav Kumar wrote:
> drm_bridge_hpd_enable()/drm_bridge_hpd_disable() callbacks call into
> the respective driver's hpd_enable()/hpd_disable() ops. These ops control
> the HPD enable/disable logic which in some cases like MSM can be a
> dedicate hardware block to control the HPD.
> 
> During probe_defer cases, a connector can be initialized and then later
> destroyed till the probe is retried. During connector destroy in these
> cases, the hpd_disable() callback gets called without a corresponding
> hpd_enable() leading to an unbalanced state potentially causing even
> a crash.
> 
> This can be avoided by the respective drivers maintaining their own
> state logic to ensure that a hpd_disable() without a corresponding
> hpd_enable() just returns without doing anything.
> 
> However, to have a generic fix it would be better to avoid the
> hpd_disable() callback from the connector destroy path and let
> the hpd_enable() / hpd_disable() balance be maintained by the
> corresponding drm_bridge_connector_enable_hpd() /
> drm_bridge_connector_disable_hpd() APIs which should get called by
> drm_kms_helper_disable_hpd().

The change makes sense to me, but I'm a bit worried this could introduce
a regression by leaving HPD enabled in some cases.

I agree that bridges shouldn't track the HPD state, it should be tracked
by the core and the .enable_hpd() and .disable_hpd() operations should
be balanced. Their documentation, however, doesn't clearly state this,
and the documentation of the callers of these operations is also fairly
unclear.

Could you perhaps try to improve the documentation ? With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

for this patch.

> changes in v2:
> 	- minor change in commit text (Dmitry)
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 1da93d5a1f61..c4dba39acfd8 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -187,12 +187,6 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
>  
> -	if (bridge_connector->bridge_hpd) {
> -		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
> -
> -		drm_bridge_hpd_disable(hpd);
> -	}
> -
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  

-- 
Regards,

Laurent Pinchart
