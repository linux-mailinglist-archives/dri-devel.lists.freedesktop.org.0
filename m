Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6FE802480
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 15:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BA010E273;
	Sun,  3 Dec 2023 14:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E2D10E273;
 Sun,  3 Dec 2023 14:24:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 171E525A;
 Sun,  3 Dec 2023 15:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701613436;
 bh=tHh/dUnJ5r4RBftwQVK/y6yde5Na2FuFMRERe2LbEBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YF8/ZEIUYW4zMjjqiGudkdTkM19WuEZQS+8d25SvHsQC7i2RQ88mLNEbPe2WCpeVs
 nuGOcGfylY72p+A0bmNhMeETIpVwubqqvAYAfvdLlz0eE54RmQPpW/VrkwkTTDLhzB
 xCfYCazK5QjAALujo4Hvi8Iwl9tMZd1WfZxFBlJs=
Date: Sun, 3 Dec 2023 16:24:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm: improve the documentation of connector hpd ops
Message-ID: <20231203142441.GA26644@pendragon.ideasonboard.com>
References: <20230920201358.27597-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230920201358.27597-1-quic_abhinavk@quicinc.com>
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
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

Thank you for the patch (and thank to Dmitry for pinging me on IRC, this
patch got burried in my inbox).

On Wed, Sep 20, 2023 at 01:13:58PM -0700, Abhinav Kumar wrote:
> While making the changes in [1], it was noted that the documentation
> of the enable_hpd() and disable_hpd() does not make it clear that
> these ops should not try to do hpd state maintenance and should only
> attempt to enable/disable hpd related hardware for the connector.

s/attempt to //

> 
> The state management of these calls to make sure these calls are
> balanced is handled by the DRM core and we should keep it that way
> to minimize the overhead in the drivers which implement these ops.
> 
> [1]: https://patchwork.freedesktop.org/patch/558387/
> 

You could add a

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_modeset_helper_vtables.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index e3c3ac615909..a33cf7488737 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1154,6 +1154,11 @@ struct drm_connector_helper_funcs {
>  	 * This operation is optional.
>  	 *
>  	 * This callback is used by the drm_kms_helper_poll_enable() helpers.
> +	 *
> +	 * This operation does not need to perform any hpd state tracking as
> +	 * the DRM core handles that maintenance and ensures the calls to enable
> +	 * and disable hpd are balanced.
> +	 *
>  	 */
>  	void (*enable_hpd)(struct drm_connector *connector);
>  
> @@ -1165,6 +1170,11 @@ struct drm_connector_helper_funcs {
>  	 * This operation is optional.
>  	 *
>  	 * This callback is used by the drm_kms_helper_poll_disable() helpers.
> +	 *
> +	 * This operation does not need to perform any hpd state tracking as
> +	 * the DRM core handles that maintenance and ensures the calls to enable
> +	 * and disable hpd are balanced.
> +	 *
>  	 */
>  	void (*disable_hpd)(struct drm_connector *connector);
>  };

-- 
Regards,

Laurent Pinchart
