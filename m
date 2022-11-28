Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDE663B2DB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 21:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E8F10E244;
	Mon, 28 Nov 2022 20:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6528910E244
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vX2ocme+hZX+NjcZX8O3c1XHJ5V+wwKS4fNwe5R5UdY=; b=rxsHLnx+h1SMG8JejTEY8iGuqe
 JCT40++sS2UnuzQpE56kIg4U9YFOKBXOwSCt+1BBQGeiAqgTY7JKzFz0ZCbLI1dRMUcr+DiZDgzXP
 s163fDKm4A+ML8Dof+fz8DeOsnTHJF4DWa+SUJI90ucPviQwDCCwssU0z42v6BCO/bglNBNa+L0w4
 IV0gHFrqKYq6WWfoBZEFMfxs/+brKXYSWILBMVXnbzM5332BmLxe95ElE6UuqbF5gA/Ao6bCf7orX
 qiM8q4sL0YcwY9lB5PIm/g6cMBjA8z5MwmngoM+q8tEXS3L4d1SxKrK1ljLVnpmrUj73dLO2U7dyi
 s+y6Ty4g==;
Received: from [177.34.169.227] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ozkYq-00AcMt-79; Mon, 28 Nov 2022 21:17:04 +0100
Message-ID: <ad9d7004-ca7b-abdd-82b5-bdf14ee8e067@igalia.com>
Date: Mon, 28 Nov 2022 17:16:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 11/17] drm/vc4: Move HVS state to main header
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-11-efe5ed518b63@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-11-efe5ed518b63@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kselftest@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, linux-media@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 11:53, Maxime Ripard wrote:
> In order to introduce unit tests for the HVS state computation, we'll
> need access to the vc4_hvs_state struct definition and its associated
> helpers.
> 
> Let's move them in our driver header.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/vc4/vc4_drv.h | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_kms.c | 25 +++----------------------
>  2 files changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 6af615c2eb65..051c2e3b6d43 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -355,6 +355,29 @@ struct vc4_hvs {
>  	bool vc5_hdmi_enable_4096by2160;
>  };
>  
> +#define HVS_NUM_CHANNELS 3
> +
> +struct vc4_hvs_state {
> +	struct drm_private_state base;
> +	unsigned long core_clock_rate;
> +
> +	struct {
> +		unsigned in_use: 1;
> +		unsigned long fifo_load;
> +		struct drm_crtc_commit *pending_commit;
> +	} fifo_state[HVS_NUM_CHANNELS];
> +};
> +
> +static inline struct vc4_hvs_state *
> +to_vc4_hvs_state(const struct drm_private_state *priv)
> +{
> +	return container_of(priv, struct vc4_hvs_state, base);
> +}
> +
> +struct vc4_hvs_state *vc4_hvs_get_global_state(struct drm_atomic_state *state);
> +struct vc4_hvs_state *vc4_hvs_get_old_global_state(const struct drm_atomic_state *state);
> +struct vc4_hvs_state *vc4_hvs_get_new_global_state(const struct drm_atomic_state *state);
> +
>  struct vc4_plane {
>  	struct drm_plane base;
>  };
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 7282545c54a1..53d9f30460cf 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -25,8 +25,6 @@
>  #include "vc4_drv.h"
>  #include "vc4_regs.h"
>  
> -#define HVS_NUM_CHANNELS 3
> -
>  struct vc4_ctm_state {
>  	struct drm_private_state base;
>  	struct drm_color_ctm *ctm;
> @@ -39,23 +37,6 @@ to_vc4_ctm_state(const struct drm_private_state *priv)
>  	return container_of(priv, struct vc4_ctm_state, base);
>  }
>  
> -struct vc4_hvs_state {
> -	struct drm_private_state base;
> -	unsigned long core_clock_rate;
> -
> -	struct {
> -		unsigned in_use: 1;
> -		unsigned long fifo_load;
> -		struct drm_crtc_commit *pending_commit;
> -	} fifo_state[HVS_NUM_CHANNELS];
> -};
> -
> -static struct vc4_hvs_state *
> -to_vc4_hvs_state(const struct drm_private_state *priv)
> -{
> -	return container_of(priv, struct vc4_hvs_state, base);
> -}
> -
>  struct vc4_load_tracker_state {
>  	struct drm_private_state base;
>  	u64 hvs_load;
> @@ -191,7 +172,7 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
>  		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
>  }
>  
> -static struct vc4_hvs_state *
> +struct vc4_hvs_state *
>  vc4_hvs_get_new_global_state(const struct drm_atomic_state *state)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
> @@ -204,7 +185,7 @@ vc4_hvs_get_new_global_state(const struct drm_atomic_state *state)
>  	return to_vc4_hvs_state(priv_state);
>  }
>  
> -static struct vc4_hvs_state *
> +struct vc4_hvs_state *
>  vc4_hvs_get_old_global_state(const struct drm_atomic_state *state)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
> @@ -217,7 +198,7 @@ vc4_hvs_get_old_global_state(const struct drm_atomic_state *state)
>  	return to_vc4_hvs_state(priv_state);
>  }
>  
> -static struct vc4_hvs_state *
> +struct vc4_hvs_state *
>  vc4_hvs_get_global_state(struct drm_atomic_state *state)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(state->dev);
> 
