Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03148B53A70
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 19:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371610E3DE;
	Thu, 11 Sep 2025 17:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="coUJkSYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F6F10E3DE;
 Thu, 11 Sep 2025 17:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26n9lvvSYlWMqqmSC/rnZ7hs25WEL/9yPvBSKXN0v1U=; b=coUJkSYeyDAia/mpiIoSuykysE
 +oJw9bmcBqu0gPAzyPBdKTug+uWoFDJ8QT6h2qU0dwOCY/GF05IVDn87mFZef9CEVVmm9L+kwi/dJ
 McWivSTRXzyUms8hffWL0kmsMcT4aUj327WPAhom5HV6YjlDImqaa+puYoAVGIRT2y3zfcqeQrxGU
 MBbIw3UcmnsetDBF5eBYp1m9xqMCJO9hjQ+/hpI4TOfAa+ZZ1cIS7QB7kurmrpxRIA+eiStpT2Rvx
 dRtA4QhuoMF/TYolYlTKZd1OQ+0ROEjMgZgMl6TIWjhhiNcIy8YuI+mVF2jlRSfQvcLA/vIzXFJji
 RBux3abA==;
Received: from [189.6.16.239] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uwlB3-009uHT-B8; Thu, 11 Sep 2025 19:33:45 +0200
Message-ID: <7e677e50-334e-41f7-8511-d859d0620385@igalia.com>
Date: Thu, 11 Sep 2025 14:33:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amd/display: change dc stream color settings
 only in atomic commit
To: Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Xaver Hugl <xaver.hugl@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Christopher Snowhill <kode54@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250901214413.12675-1-mwen@igalia.com>
 <20250901214413.12675-3-mwen@igalia.com>
 <d3bc5c52-345a-420a-bf92-dc4b56c5cc97@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <d3bc5c52-345a-420a-bf92-dc4b56c5cc97@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/09/2025 12:00, Harry Wentland wrote:
>
> On 2025-09-01 17:33, Melissa Wen wrote:
>> Don't update DC stream color components during atomic check. The driver
>> will continue validating the new CRTC color state but will not change DC
>> stream color components. The DC stream color state will only be
>> programmed at commit time in the `atomic_setup_commit` stage.
>>
>> It fixes gamma LUT loss reported by KDE users when changing brightness
>> quickly or changing Display settings (such as overscan) with nightlight
>> on and HDR. As KWin can do a test commit with color settings different
>> from those that should be applied in a non-test-only commit, if the
>> driver changes DC stream color state in atomic check, this state can be
>> eventually HW programmed in commit tail, instead of the respective state
>> set by the non-blocking commit.
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
>> Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 105 +++++++++++++++++-
>>   3 files changed, 104 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 9bd82e04fe5c..ba40346eaf95 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -11125,7 +11125,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>>   	if (dm_new_crtc_state->base.color_mgmt_changed ||
>>   	    dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
>>   	    drm_atomic_crtc_needs_modeset(new_crtc_state)) {
>> -		ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
>> +		ret = amdgpu_dm_check_crtc_color_mgmt(dm_new_crtc_state);
>>   		if (ret)
>>   			goto fail;
>>   	}
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> index ce74125c713e..1cc3d83e377a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> @@ -1041,6 +1041,7 @@ void amdgpu_dm_init_color_mod(void);
>>   int amdgpu_dm_create_color_properties(struct amdgpu_device *adev);
>>   int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
>>   int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
>> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc);
>>   int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>   				      struct drm_plane_state *plane_state,
>>   				      struct dc_plane_state *dc_plane_state);
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> index c7387af725d6..a7cfcdba1fc9 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>> @@ -566,12 +566,11 @@ static int __set_output_tf(struct dc_transfer_func *func,
>>   	return res ? 0 : -ENOMEM;
>>   }
>>   
>> -static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>> +static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
>>   					const struct drm_color_lut *regamma_lut,
>>   					uint32_t regamma_size, bool has_rom,
>>   					enum dc_transfer_func_predefined tf)
>>   {
>> -	struct dc_transfer_func *out_tf = &stream->out_transfer_func;
>>   	int ret = 0;
>>   
>>   	if (regamma_size || tf != TRANSFER_FUNCTION_LINEAR) {
>> @@ -969,7 +968,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>   			return r;
>>   	} else {
>>   		regamma_size = has_regamma ? regamma_size : 0;
>> -		r = amdgpu_dm_set_atomic_regamma(stream, regamma_lut,
>> +		r = amdgpu_dm_set_atomic_regamma(&stream->out_transfer_func, regamma_lut,
>>   						 regamma_size, has_rom, tf);
>>   		if (r)
>>   			return r;
>> @@ -1008,6 +1007,106 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * amdgpu_dm_check_crtc_color_mgmt: Check if DRM color props are programmable by DC.
>> + * @crtc: amdgpu_dm crtc state
>> + *
>> + * This function just verifies CRTC LUT sizes, if there is enough space for
>> + * output transfer function and if its parameters can be calculated by AMD
>> + * color module. It also adjusts some settings for programming CRTC degamma at
>> + * plane stage, using plane DGM block.
>> + *
>> + * The RGM block is typically more fully featured and accurate across
>> + * all ASICs - DCE can't support a custom non-linear CRTC DGM.
>> + *
>> + * For supporting both plane level color management and CRTC level color
>> + * management at once we have to either restrict the usage of some CRTC
>> + * properties or blend adjustments together.
>> + *
>> + * Returns:
>> + * 0 on success. Error code if validation fails.
>> + */
>> +
>> +int amdgpu_dm_check_crtc_color_mgmt(struct dm_crtc_state *crtc)
> This function is almost a duplicate of amdgpu_dm_update_crtc_color_mgmt,
> without the part that sets the stream->out_transfer_func and without
> the "Setup CRTC CTM" bits. I wonder whether it would make sense to
> combine them in a way where the "update" function would look like:
>
> int amdgpu_dm_update_crtc_color_mgmt(...)
> {
>      amdgpu_dm_check_crtc_color_mgmt(...);
>
>      update stream->out_transfer_func based on out_tf computed in check
>
>      do the "Setup CRTC CTM bits
> }
Makes sense. I just sent a v3 implementing this proposal and fixing some 
issues in v2.
Can you double check?

https://lore.kernel.org/amd-gfx/20250911173101.1960156-1-mwen@igalia.com

Thanks for reviewing!

Melissa
> Either way, great find, and really good change. The series is
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
>> +{
>> +	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
>> +	bool has_rom = adev->asic_type <= CHIP_RAVEN;
>> +	const struct drm_color_lut *degamma_lut, *regamma_lut;
>> +	uint32_t degamma_size, regamma_size;
>> +	bool has_regamma, has_degamma;
>> +	struct dc_transfer_func *out_tf;
>> +	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_LINEAR;
>> +	bool is_legacy;
>> +	int r;
>> +
>> +	tf = amdgpu_tf_to_dc_tf(crtc->regamma_tf);
>> +
>> +	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
>> +	if (r)
>> +		return r;
>> +
>> +	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
>> +	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
>> +
>> +	has_degamma =
>> +		degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
>> +
>> +	has_regamma =
>> +		regamma_lut && !__is_lut_linear(regamma_lut, regamma_size);
>> +
>> +	is_legacy = regamma_size == MAX_COLOR_LEGACY_LUT_ENTRIES;
>> +
>> +	/* Reset all adjustments. */
>> +	crtc->cm_has_degamma = false;
>> +	crtc->cm_is_degamma_srgb = false;
>> +
>> +	out_tf = kzalloc(sizeof(*out_tf), GFP_KERNEL);
>> +	if (!out_tf)
>> +		return -ENOMEM;
>> +
>> +	/* Setup regamma and degamma. */
>> +	if (is_legacy) {
>> +		/*
>> +		 * Legacy regamma forces us to use the sRGB RGM as a base.
>> +		 * This also means we can't use linear DGM since DGM needs
>> +		 * to use sRGB as a base as well, resulting in incorrect CRTC
>> +		 * DGM and CRTC CTM.
>> +		 *
>> +		 * TODO: Just map this to the standard regamma interface
>> +		 * instead since this isn't really right. One of the cases
>> +		 * where this setup currently fails is trying to do an
>> +		 * inverse color ramp in legacy userspace.
>> +		 */
>> +		crtc->cm_is_degamma_srgb = true;
>> +		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
>> +		out_tf->tf = TRANSFER_FUNCTION_SRGB;
>> +		/*
>> +		 * Note: although we pass has_rom as parameter here, we never
>> +		 * actually use ROM because the color module only takes the ROM
>> +		 * path if transfer_func->type == PREDEFINED.
>> +		 *
>> +		 * See more in mod_color_calculate_regamma_params()
>> +		 */
>> +		r = __set_legacy_tf(out_tf, regamma_lut,
>> +				    regamma_size, has_rom);
>> +	} else {
>> +		regamma_size = has_regamma ? regamma_size : 0;
>> +		r = amdgpu_dm_set_atomic_regamma(out_tf, regamma_lut,
>> +						 regamma_size, has_rom, tf);
>> +	}
>> +
>> +	/*
>> +	 * CRTC DGM goes into DGM LUT. It would be nice to place it
>> +	 * into the RGM since it's a more featured block but we'd
>> +	 * have to place the CTM in the OCSC in that case.
>> +	 */
>> +	crtc->cm_has_degamma = has_degamma;
>> +	dc_transfer_func_release(out_tf);
>> +
>> +	return r;
>> +}
>> +
>> +
>>   static int
>>   map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>>   			     struct dc_plane_state *dc_plane_state,

