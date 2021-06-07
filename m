Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20EF39D556
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 08:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AA56E1E6;
	Mon,  7 Jun 2021 06:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4FC6E1E6;
 Mon,  7 Jun 2021 06:47:57 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 671CDC800E1;
 Mon,  7 Jun 2021 08:47:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id PWdw0pNodT0v; Mon,  7 Jun 2021 08:47:56 +0200 (CEST)
Received: from [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770]
 (p200300E37F4f6000F5F44cDd80159770.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 09E4FC800DF;
 Mon,  7 Jun 2021 08:47:56 +0200 (CEST)
Subject: Re: [PATCH 4/4] drm/i915/display: Add handling for new "active bpc"
 property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-5-wse@tuxedocomputers.com> <YLpjTMegcjT22vQE@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <bd6a27e7-3ae5-ecb1-2fef-e5f8c1b6a2ac@tuxedocomputers.com>
Date: Mon, 7 Jun 2021 08:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLpjTMegcjT22vQE@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 04.06.21 um 19:30 schrieb Ville Syrjälä:
> On Fri, Jun 04, 2021 at 07:17:23PM +0200, Werner Sembach wrote:
>> This commits implements the "active bpc" drm property for the Intel GPU driver.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>>   drivers/gpu/drm/i915/display/intel_dp.c      |  8 ++++++--
>>   drivers/gpu/drm/i915/display/intel_dp_mst.c  |  4 +++-
>>   drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 +++-
>>   4 files changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 64e9107d70f7..f7898d9d7438 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -10164,6 +10164,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>>   	struct drm_i915_private *dev_priv = to_i915(dev);
>>   	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>>   	struct intel_crtc *crtc;
>> +	struct drm_connector *connector;
>> +	struct drm_connector_state *new_conn_state;
>>   	u64 put_domains[I915_MAX_PIPES] = {};
>>   	intel_wakeref_t wakeref = 0;
>>   	int i;
>> @@ -10324,6 +10326,17 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>>   	}
>>   	intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
>>   
>> +	/* Extract information from crtc to communicate it to userspace as connector properties */
>> +	for_each_new_connector_in_state(&state->base, connector, new_conn_state, i) {
>> +		struct drm_crtc *crtc = new_conn_state->crtc;
>> +		if (crtc) {
>> +			new_crtc_state = to_intel_crtc_state(drm_atomic_get_new_crtc_state(&state->base, crtc));
> intel_atomic_get_new_crtc_state()
Thanks, will use that.
>
>> +			new_conn_state->active_bpc = new_crtc_state->pipe_bpp / 3;
>> +		}
>> +		else
>> +			new_conn_state->active_bpc = 0;
>> +	}
> This also seems too late. I think the whole thing should be
> done somewhere around the normal swap_state() stuff.
Ok, will look into it.
>
>> +
>>   	/*
>>   	 * Defer the cleanup of the old state to a separate worker to not
>>   	 * impede the current task (userspace for blocking modesets) that
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 642c60f3d9b1..67826ba976ed 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4671,10 +4671,14 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
>>   		intel_attach_force_audio_property(connector);
>>   
>>   	intel_attach_broadcast_rgb_property(connector);
>> -	if (HAS_GMCH(dev_priv))
>> +	if (HAS_GMCH(dev_priv)) {
>>   		drm_connector_attach_max_bpc_property(connector, 6, 10);
>> -	else if (DISPLAY_VER(dev_priv) >= 5)
>> +		drm_connector_attach_active_bpc_property(connector, 6, 10);
>> +	}
>> +	else if (DISPLAY_VER(dev_priv) >= 5) {
>>   		drm_connector_attach_max_bpc_property(connector, 6, 12);
>> +		drm_connector_attach_active_bpc_property(connector, 6, 12);
>> +	}
>>   
>>   	/* Register HDMI colorspace for case of lspcon */
>>   	if (intel_bios_is_lspcon_present(dev_priv, port)) {
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> index 2daa3f67791e..5a1869dc2210 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -844,8 +844,10 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>>   	 */
>>   	connector->max_bpc_property =
>>   		intel_dp->attached_connector->base.max_bpc_property;
>> -	if (connector->max_bpc_property)
>> +	if (connector->max_bpc_property) {
>>   		drm_connector_attach_max_bpc_property(connector, 6, 12);
>> +		drm_connector_attach_active_bpc_property(connector, 6, 12);
>> +	}
>>   
>>   	return connector;
>>   
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index d69f0a6dc26d..8af78b27b6ce 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -2463,8 +2463,10 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
>>   		drm_object_attach_property(&connector->base,
>>   			connector->dev->mode_config.hdr_output_metadata_property, 0);
>>   
>> -	if (!HAS_GMCH(dev_priv))
>> +	if (!HAS_GMCH(dev_priv)) {
>>   		drm_connector_attach_max_bpc_property(connector, 8, 12);
>> +		drm_connector_attach_active_bpc_property(connector, 8, 12);
>> +	}
>>   }
>>   
>>   /*
>> -- 
>> 2.25.1
