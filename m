Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C346F78402B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639A10E328;
	Tue, 22 Aug 2023 11:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065AB10E328;
 Tue, 22 Aug 2023 11:55:06 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7FC72660720C;
 Tue, 22 Aug 2023 12:55:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692705304;
 bh=rc4RZeWeRenqX67jr1ytBFPmAwa003ttuhCagDublUE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iAc84DiVtMtOtOr5hOeMBL52YF4J0od97uHsOwbyNwNVzqOwk82CH+i/V5pn8od3c
 f4163qNDohHI3aJ8TL34sQ9LuI2OlBIin6x7RolaeDIgRS7h7Vm9JvEcivEDSBd7nc
 kegBzMbJFqfKrqx65U9DbqrmQmAR05d3434mzDuE3yQkLntGPcXEOefdxor33j74WB
 S10qpnJ1uDTEdQT9kvFWyF8qvMHDKF+5xutoYwIRimN3nQEfs322S6OtRJVtNV0eMG
 YrrTtej2qfFKJUyNYQNqERacm+bgW2jhDw4I7aDSzpNxTMhGLd8ENzjQ4rJMeSyox7
 cElNUmZeaFXvQ==
Date: Tue, 22 Aug 2023 14:54:59 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 09/34] drm/amd/display: add plane HDR multiplier
 driver-specific property
Message-ID: <20230822145459.66b986ef.pekka.paalanen@collabora.com>
In-Reply-To: <20230810160314.48225-10-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-10-mwen@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Aug 2023 15:02:49 -0100
Melissa Wen <mwen@igalia.com> wrote:

> From: Joshua Ashton <joshua@froggi.es>
> 
> Multiplier to 'gain' the plane. When PQ is decoded using the fixed func
> transfer function to the internal FP16 fb, 1.0 -> 80 nits (on AMD at
> least) When sRGB is decoded, 1.0 -> 1.0.  Therefore, 1.0 multiplier = 80
> nits for SDR content. So if you want, 203 nits for SDR content, pass in
> (203.0 / 80.0).

Does this mean that the fixed-function PQ EOTF is
actually [0, 128] -> [0, 10000]?

How do you decode an integer pixel format into [0, 128] so it can be
fed through PQ EOTF?

And how do blocks after the PQ EOTF deal with the [0, 10000] domain,
when any other EOTF would produce [0, 1]?


Thanks,
pq

> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Co-developed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |  4 ++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  | 14 ++++++++++++++
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  6 ++++++
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 13 +++++++++++++
>  4 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 6ef958a14e16..66bae0eed80c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -359,6 +359,10 @@ struct amdgpu_mode_info {
>  	 * to go from scanout/encoded values to linear values.
>  	 */
>  	struct drm_property *plane_degamma_tf_property;
> +	/**
> +	 * @plane_hdr_mult_property:
> +	 */
> +	struct drm_property *plane_hdr_mult_property;
>  };
>  
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index f6251ed89684..44f17ac11a5f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -54,6 +54,9 @@
>  #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_IEEE_REGISTRATION_ID 0x00001A
>  #define AMD_VSDB_VERSION_3_FEATURECAP_REPLAYMODE 0x40
>  #define HDMI_AMD_VENDOR_SPECIFIC_DATA_BLOCK_VERSION_3 0x3
> +
> +#define AMDGPU_HDR_MULT_DEFAULT (0x100000000LL)
> +
>  /*
>  #include "include/amdgpu_dal_power_if.h"
>  #include "amdgpu_dm_irq.h"
> @@ -755,6 +758,17 @@ struct dm_plane_state {
>  	 * linearize.
>  	 */
>  	enum amdgpu_transfer_function degamma_tf;
> +	/**
> +	 * @hdr_mult:
> +	 *
> +	 * Multiplier to 'gain' the plane.  When PQ is decoded using the fixed
> +	 * func transfer function to the internal FP16 fb, 1.0 -> 80 nits (on
> +	 * AMD at least). When sRGB is decoded, 1.0 -> 1.0, obviously.
> +	 * Therefore, 1.0 multiplier = 80 nits for SDR content.  So if you
> +	 * want, 203 nits for SDR content, pass in (203.0 / 80.0).  Format is
> +	 * S31.32 sign-magnitude.
> +	 */
> +	__u64 hdr_mult;
>  };
>  
>  struct dm_crtc_state {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 7f13bcdaf016..b891aaf5f7c1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -203,6 +203,12 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_tf_property = prop;
>  
> +	prop = drm_property_create_range(adev_to_drm(adev),
> +					 0, "AMD_PLANE_HDR_MULT", 0, U64_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +	adev->mode_info.plane_hdr_mult_property = prop;
> +
>  	return 0;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 0a955abb1abf..ab7f0332c431 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1331,6 +1331,7 @@ static void dm_drm_plane_reset(struct drm_plane *plane)
>  
>  	__drm_atomic_helper_plane_reset(plane, &amdgpu_state->base);
>  	amdgpu_state->degamma_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
> +	amdgpu_state->hdr_mult = AMDGPU_HDR_MULT_DEFAULT;
>  }
>  
>  static struct drm_plane_state *
> @@ -1354,6 +1355,7 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>  		drm_property_blob_get(dm_plane_state->degamma_lut);
>  
>  	dm_plane_state->degamma_tf = old_dm_plane_state->degamma_tf;
> +	dm_plane_state->hdr_mult = old_dm_plane_state->hdr_mult;
>  
>  	return &dm_plane_state->base;
>  }
> @@ -1450,6 +1452,10 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>  					   dm->adev->mode_info.plane_degamma_tf_property,
>  					   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
>  	}
> +	/* HDR MULT is always available */
> +	drm_object_attach_property(&plane->base,
> +				   dm->adev->mode_info.plane_hdr_mult_property,
> +				   AMDGPU_HDR_MULT_DEFAULT);
>  }
>  
>  static int
> @@ -1476,6 +1482,11 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>  			dm_plane_state->degamma_tf = val;
>  			dm_plane_state->base.color_mgmt_changed = 1;
>  		}
> +	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> +		if (dm_plane_state->hdr_mult != val) {
> +			dm_plane_state->hdr_mult = val;
> +			dm_plane_state->base.color_mgmt_changed = 1;
> +		}
>  	} else {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -1501,6 +1512,8 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>  			dm_plane_state->degamma_lut->base.id : 0;
>  	} else if (property == adev->mode_info.plane_degamma_tf_property) {
>  		*val = dm_plane_state->degamma_tf;
> +	} else if (property == adev->mode_info.plane_hdr_mult_property) {
> +		*val = dm_plane_state->hdr_mult;
>  	} else {
>  		return -EINVAL;
>  	}

