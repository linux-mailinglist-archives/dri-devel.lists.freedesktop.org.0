Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E43F3C8AB5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 20:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DB989C83;
	Wed, 14 Jul 2021 18:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B34C89C83;
 Wed, 14 Jul 2021 18:20:55 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 4ED02C8007F;
 Wed, 14 Jul 2021 20:20:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 2zIN8GVCgxDm; Wed, 14 Jul 2021 20:20:54 +0200 (CEST)
Received: from [IPv6:2003:e3:7f13:3500:839f:11f6:c93a:c68b]
 (p200300E37F133500839f11f6c93ac68b.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f13:3500:839f:11f6:c93a:c68b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id E2C1EC8007C;
 Wed, 14 Jul 2021 20:20:52 +0200 (CEST)
Subject: Re: [PATCH v5 17/17] drm/amd/display: Add handling for new "Broadcast
 RGB" property
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com
References: <20210630151018.330354-1-wse@tuxedocomputers.com>
 <20210630151018.330354-18-wse@tuxedocomputers.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <206d45be-86d9-9cc3-0b4a-317342221988@tuxedocomputers.com>
Date: Wed, 14 Jul 2021 20:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630151018.330354-18-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

Am 30.06.21 um 17:10 schrieb Werner Sembach:
> This commit implements the "Broadcast RGB" drm property for the AMD GPU
> driver.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 14 +++++++++++---
>   .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  4 ++++
>   2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 02a5809d4993..80d5a11fb0c5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5247,7 +5247,8 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
>   }
>   
>   static enum dc_color_space
> -get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
> +get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
> +		       enum drm_mode_color_range preferred_color_range)
>   {
>   	enum dc_color_space color_space = COLOR_SPACE_SRGB;
>   
> @@ -5278,7 +5279,10 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
>   	}
>   	break;
>   	case PIXEL_ENCODING_RGB:
> -		color_space = COLOR_SPACE_SRGB;
> +		if (preferred_color_range == DRM_MODE_COLOR_RANGE_LIMITED_16_235)
> +			color_space = COLOR_SPACE_SRGB_LIMITED;
> +		else
> +			color_space = COLOR_SPACE_SRGB;
>   		break;

After some testing I found out, that what I did here, was useless.

amdgpu actually never sets the quantization_range range in the 
hdmi_avi_infoframe and from that I guess any quantization range, besides 
the default one, is not implemented in multiple places

Until limited RGB is properly implemented in amdgpu there kind of is no 
purpose of generalizing the Broadcast RGB switch.

>   
>   	default:
> @@ -5424,7 +5428,10 @@ static void fill_stream_properties_from_drm_display_mode(
>   
>   	timing_out->aspect_ratio = get_aspect_ratio(mode_in);
>   
> -	stream->output_color_space = get_output_color_space(timing_out);
> +	stream->output_color_space = get_output_color_space(timing_out,
> +							    connector_state ?
> +							    connector_state->preferred_color_range :
> +							    DRM_MODE_COLOR_RANGE_UNSET);
>   
>   	stream->out_transfer_func->type = TF_TYPE_PREDEFINED;
>   	stream->out_transfer_func->tf = TRANSFER_FUNCTION_SRGB;
> @@ -7775,6 +7782,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>   		drm_connector_attach_active_bpc_property(&aconnector->base, 8, 16);
>   		drm_connector_attach_preferred_color_format_property(&aconnector->base);
>   		drm_connector_attach_active_color_format_property(&aconnector->base);
> +		drm_connector_attach_preferred_color_range_property(&aconnector->base);
>   		drm_connector_attach_active_color_range_property(&aconnector->base);
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 2563788ba95a..80e1389fd0ec 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -421,6 +421,10 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>   	if (connector->active_color_format_property)
>   		drm_connector_attach_active_color_format_property(&aconnector->base);
>   
> +	connector->preferred_color_range_property = master->base.preferred_color_range_property;
> +	if (connector->preferred_color_range_property)
> +		drm_connector_attach_preferred_color_range_property(&aconnector->base);
> +
>   	connector->active_color_range_property = master->base.active_color_range_property;
>   	if (connector->active_color_range_property)
>   		drm_connector_attach_active_color_range_property(&aconnector->base);
