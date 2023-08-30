Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E308078D518
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 12:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5309710E4E8;
	Wed, 30 Aug 2023 10:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6810E0C6;
 Wed, 30 Aug 2023 10:26:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86F3C60E86;
 Wed, 30 Aug 2023 10:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1D5C433C7;
 Wed, 30 Aug 2023 10:26:04 +0000 (UTC)
Message-ID: <bdebe804-139e-f3d4-f77a-1ede7e6ac02c@xs4all.nl>
Date: Wed, 30 Aug 2023 12:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/cec: add drm_dp_cec_attach() as the non-edid
 version of set edid
Content-Language: en-US, nl
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <f8ed9b38fd2ebcd8344a1889a6c0f288969454ea.1692884619.git.jani.nikula@intel.com>
 <20230825130120.1250089-1-jani.nikula@intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230825130120.1250089-1-jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

Sorry, I missed the v2.

On 25/08/2023 15:01, Jani Nikula wrote:
> Connectors have source physical address available in display
> info. There's no need to parse the EDID again for this. Add
> drm_dp_cec_attach() to do this.
> 
> Seems like the set_edid/unset_edid naming is a bit specific now that
> there's no need to pass the EDID at all, so aim for attach/detach going
> forward.
> 
> v2: Fix the embarrashing build failures
> 
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/gpu/drm/display/drm_dp_cec.c | 23 ++++++++++++++++++++---
>  include/drm/display/drm_dp_helper.h  |  6 ++++++
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
> index ae39dc794190..007ceb281d00 100644
> --- a/drivers/gpu/drm/display/drm_dp_cec.c
> +++ b/drivers/gpu/drm/display/drm_dp_cec.c
> @@ -14,6 +14,7 @@
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_edid.h>
>  
>  /*
>   * Unfortunately it turns out that we have a chicken-and-egg situation
> @@ -297,7 +298,7 @@ static void drm_dp_cec_unregister_work(struct work_struct *work)
>   * were unchanged and just update the CEC physical address. Otherwise
>   * unregister the old CEC adapter and create a new one.
>   */
> -void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> +void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address)
>  {
>  	struct drm_connector *connector = aux->cec.connector;
>  	u32 cec_caps = CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD |
> @@ -339,7 +340,7 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  		if (aux->cec.adap->capabilities == cec_caps &&
>  		    aux->cec.adap->available_log_addrs == num_las) {
>  			/* Unchanged, so just set the phys addr */
> -			cec_s_phys_addr_from_edid(aux->cec.adap, edid);
> +			cec_s_phys_addr(aux->cec.adap, source_physical_address, false);
>  			goto unlock;
>  		}
>  		/*
> @@ -370,11 +371,27 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
>  		 * from drm_dp_cec_register_connector() edid == NULL, so in
>  		 * that case the phys addr is just invalidated.
>  		 */
> -		cec_s_phys_addr_from_edid(aux->cec.adap, edid);
> +		cec_s_phys_addr(aux->cec.adap, source_physical_address, false);
>  	}
>  unlock:
>  	mutex_unlock(&aux->cec.lock);
>  }
> +EXPORT_SYMBOL(drm_dp_cec_attach);
> +
> +/*
> + * Note: Prefer calling drm_dp_cec_attach() with
> + * connector->display_info.source_physical_address if possible.
> + */
> +void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
> +{
> +	u16 pa = CEC_PHYS_ADDR_INVALID;
> +
> +	if (edid && edid->extensions)
> +		pa = cec_get_edid_phys_addr((const u8 *)edid,
> +					    EDID_LENGTH * (edid->extensions + 1), NULL);
> +
> +	drm_dp_cec_attach(aux, pa);
> +}
>  EXPORT_SYMBOL(drm_dp_cec_set_edid);
>  
>  /*
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 86f24a759268..3369104e2d25 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -699,6 +699,7 @@ void drm_dp_cec_irq(struct drm_dp_aux *aux);
>  void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
>  				   struct drm_connector *connector);
>  void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
> +void drm_dp_cec_attach(struct drm_dp_aux *aux, u16 source_physical_address);
>  void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
>  void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
>  #else
> @@ -716,6 +717,11 @@ static inline void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux)
>  {
>  }
>  
> +static inline void drm_dp_cec_attach(struct drm_dp_aux *aux,
> +				     u16 source_physical_address)
> +{
> +}
> +
>  static inline void drm_dp_cec_set_edid(struct drm_dp_aux *aux,
>  				       const struct edid *edid)
>  {

