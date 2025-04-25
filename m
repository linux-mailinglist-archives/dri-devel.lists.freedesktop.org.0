Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F6A9CBFD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 16:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E639810E00F;
	Fri, 25 Apr 2025 14:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMXo1Cbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8532E10E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745592457; x=1777128457;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZR86yygcf1BYbCaNkN/G4IrxJeupsrmFAwDjwL4KmC8=;
 b=QMXo1CbjLjBC93JIDQ6VagjLfjwme7y7CUuphMN0o22ZKwsiluhyVTYo
 49YRP1aOnVC7EAwvT4U5VJcvWLV/wX/IIzGTGfbsKjLz3aPnOaBYKe3GZ
 qRzfyWG/d4ovh97OANMojbIwtvutZNHRGKC0u37guTXoqkCcKX92UVIoy
 xlqIAmw91FLFg8ZlS0BZn7bB4YGPqRiLyKJrEuTlJHyIzi34ouTl+typG
 6zdZ3zidJ8lujIbAvUU82L7TwM5PWsorUkxx4i726ak7XAUCle3D+zIM1
 RAsE9vZRtwbpxhHHWzdRNc83fIHPo3dF5scDR0D3KkqWIshhAuPWMVev9 Q==;
X-CSE-ConnectionGUID: 4UcCRn6RTWSf8VvJaOjPkg==
X-CSE-MsgGUID: zTK8n1O7SjmPDKN4wdPHHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47391192"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47391192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:47:37 -0700
X-CSE-ConnectionGUID: 0leyk7/gTlGda2lM2s1Sag==
X-CSE-MsgGUID: Uo8nGHryTz+xJLQRUjQfvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="138086775"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 25 Apr 2025 07:47:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Apr 2025 17:47:33 +0300
Date: Fri, 25 Apr 2025 17:47:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 mario.limonciello@amd.com, harry.wentland@amd.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/dp: Correct Write_Status_Update_Request handling
Message-ID: <aAughd9lynkGlydF@intel.com>
References: <20250424030734.873693-1-Wayne.Lin@amd.com>
 <20250424030734.873693-2-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424030734.873693-2-Wayne.Lin@amd.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 24, 2025 at 11:07:33AM +0800, Wayne Lin wrote:
> [Why]
> Notice few problems under I2C-write-over-Aux with
> Write_Status_Update_Request flag set cases:
> 
> - I2C-write-over-Aux request with
>   Write_Status_Update_Request flag set won't get sent
>   upon the reply of I2C_ACK|AUX_ACK followed by “M”
>   Value. Now just set the flag but won't send out

drm_dp_i2c_drain_msg() should keep going until an error
or the full message got transferred.

> 
> - The I2C-over-Aux request command with
>   Write_Status_Update_Request flag set is incorrect.
>   Should be "SYNC->COM3:0 (= 0110)|0000-> 0000|0000->
>   0|7-bit I2C address (the same as the last)-> STOP->".
>   Address only transaction without length and data.

This looks like a real issue.

> 
> - Upon I2C_DEFER|AUX_ACK Reply for I2C-read-over-Aux,
>   soure should repeat the identical I2C-read-over-AUX
>   transaction with the same LEN value. Not with
>   Write_Status_Update_Request set.

drm_dp_i2c_msg_write_status_update() already
checks the request type.

> 
> [How]
> Refer to DP v2.1: 2.11.7.1.5.3 & 2.11.7.1.5.4
> - Clean aux msg buffer and size when constructing
>   write status update request.
> 
> - Send out Write_Status_Update_Request upon reply of
>   I2C_ACK|AUX_ACK followed by “M”
> 
> - Send Write_Status_Update_Request upon I2C_DEFER|AUX_ACK
>   reply only when the request is I2C-write-over-Aux.
> 
> Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 27 +++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 6ee51003de3c..28f0708c3b27 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -1631,6 +1631,12 @@ static void drm_dp_i2c_msg_write_status_update(struct drm_dp_aux_msg *msg)
>  		msg->request &= DP_AUX_I2C_MOT;
>  		msg->request |= DP_AUX_I2C_WRITE_STATUS_UPDATE;
>  	}
> +
> +	/*
> +	 * Address only transaction
> +	 */
> +	msg->buffer = NULL;
> +	msg->size = 0;
>  }
>  
>  #define AUX_PRECHARGE_LEN 10 /* 10 to 16 */
> @@ -1797,10 +1803,22 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>  		case DP_AUX_I2C_REPLY_ACK:
>  			/*
>  			 * Both native ACK and I2C ACK replies received. We
> -			 * can assume the transfer was successful.
> +			 * can't assume the transfer was completed. Both I2C
> +			 * WRITE/READ request may get I2C ack reply with partially
> +			 * completion. We have to continue to poll for the
> +			 * completion of the request.
>  			 */
> -			if (ret != msg->size)
> -				drm_dp_i2c_msg_write_status_update(msg);
> +			if (ret != msg->size) {
> +				drm_dbg_kms(aux->drm_dev,
> +					    "%s: I2C partially ack (result=%d, size=%zu)\n",
> +					    aux->name, ret, msg->size);
> +				if (!(msg->request & DP_AUX_I2C_READ)) {
> +					usleep_range(AUX_RETRY_INTERVAL, AUX_RETRY_INTERVAL + 100);
> +					drm_dp_i2c_msg_write_status_update(msg);
> +				}
> +
> +				continue;
> +			}
>  			return ret;
>  
>  		case DP_AUX_I2C_REPLY_NACK:
> @@ -1819,7 +1837,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>  			if (defer_i2c < 7)
>  				defer_i2c++;
>  			usleep_range(AUX_RETRY_INTERVAL, AUX_RETRY_INTERVAL + 100);
> -			drm_dp_i2c_msg_write_status_update(msg);
> +			if (!(msg->request & DP_AUX_I2C_READ))
> +				drm_dp_i2c_msg_write_status_update(msg);
>  
>  			continue;
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
