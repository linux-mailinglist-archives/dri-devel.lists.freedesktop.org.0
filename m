Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B166C39FD70
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6FF6E241;
	Tue,  8 Jun 2021 17:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFAB6E21D;
 Tue,  8 Jun 2021 17:19:33 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 1DBD7C800B9;
 Tue,  8 Jun 2021 19:19:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id roLp7kKPlQRV; Tue,  8 Jun 2021 19:19:31 +0200 (CEST)
Received: from [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770]
 (p200300E37F4F6000f5f44CDd80159770.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id A68A3C800B3;
 Tue,  8 Jun 2021 19:19:31 +0200 (CEST)
Subject: Re: [PATCH 4/4] drm/i915/display: Add handling for new "active bpc"
 property
From: Werner Sembach <wse@tuxedocomputers.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-5-wse@tuxedocomputers.com> <YLpjTMegcjT22vQE@intel.com>
 <bd6a27e7-3ae5-ecb1-2fef-e5f8c1b6a2ac@tuxedocomputers.com>
 <96d10ed0-f8a2-1d0b-62dd-9d6173722506@tuxedocomputers.com>
Message-ID: <210b4108-74a7-bf42-eab8-b98239ce3f1a@tuxedocomputers.com>
Date: Tue, 8 Jun 2021 19:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <96d10ed0-f8a2-1d0b-62dd-9d6173722506@tuxedocomputers.com>
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 07.06.21 um 22:33 schrieb Werner Sembach:
> Am 07.06.21 um 08:47 schrieb Werner Sembach:
>>
>> Am 04.06.21 um 19:30 schrieb Ville Syrjälä:
>>> On Fri, Jun 04, 2021 at 07:17:23PM +0200, Werner Sembach wrote:
>>>> This commits implements the "active bpc" drm property for the Intel 
>>>> GPU driver.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
>>>>   drivers/gpu/drm/i915/display/intel_dp.c      |  8 ++++++--
>>>>   drivers/gpu/drm/i915/display/intel_dp_mst.c  |  4 +++-
>>>>   drivers/gpu/drm/i915/display/intel_hdmi.c    |  4 +++-
>>>>   4 files changed, 25 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c 
>>>> b/drivers/gpu/drm/i915/display/intel_display.c
>>>> index 64e9107d70f7..f7898d9d7438 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>>> @@ -10164,6 +10164,8 @@ static void intel_atomic_commit_tail(struct 
>>>> intel_atomic_state *state)
>>>>       struct drm_i915_private *dev_priv = to_i915(dev);
>>>>       struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>>>>       struct intel_crtc *crtc;
>>>> +    struct drm_connector *connector;
>>>> +    struct drm_connector_state *new_conn_state;
>>>>       u64 put_domains[I915_MAX_PIPES] = {};
>>>>       intel_wakeref_t wakeref = 0;
>>>>       int i;
>>>> @@ -10324,6 +10326,17 @@ static void 
>>>> intel_atomic_commit_tail(struct intel_atomic_state *state)
>>>>       }
>>>>       intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
>>>>   +    /* Extract information from crtc to communicate it to 
>>>> userspace as connector properties */
>>>> +    for_each_new_connector_in_state(&state->base, connector, 
>>>> new_conn_state, i) {
>>>> +        struct drm_crtc *crtc = new_conn_state->crtc;
>>>> +        if (crtc) {
>>>> +            new_crtc_state = 
>>>> to_intel_crtc_state(drm_atomic_get_new_crtc_state(&state->base, 
>>>> crtc));
>>> intel_atomic_get_new_crtc_state()
>> Thanks, will use that.
>>>
>>>> + new_conn_state->active_bpc = new_crtc_state->pipe_bpp / 3;
>>>> +        }
>>>> +        else
>>>> +            new_conn_state->active_bpc = 0;
>>>> +    }
>>> This also seems too late. I think the whole thing should be
>>> done somewhere around the normal swap_state() stuff.
>> Ok, will look into it.
> So I tried to put it in intel_atomic_commit() after 
> drm_atomic_helper_swap_state() and before 
> INIT_WORK(&state->base.commit_work, intel_atomic_commit_work) (which 
> creates a worker for intel_atomic_commit_tail), but somewhere in 
> between, the connector_state seems to change: The bpc written with the 
> for_each_new_connector_in_state() loop, gets discarded.

This was not the problem. Setting the drm property immutable made it 
(also?) immutable from the driver context, which I didn't test separately.

Removed the immutable again and moved the loop.

>>>
>>>> +
>>>>       /*
>>>>        * Defer the cleanup of the old state to a separate worker to 
>>>> not
>>>>        * impede the current task (userspace for blocking modesets) 
>>>> that
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c 
>>>> b/drivers/gpu/drm/i915/display/intel_dp.c
>>>> index 642c60f3d9b1..67826ba976ed 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>>> @@ -4671,10 +4671,14 @@ intel_dp_add_properties(struct intel_dp 
>>>> *intel_dp, struct drm_connector *connect
>>>>           intel_attach_force_audio_property(connector);
>>>>         intel_attach_broadcast_rgb_property(connector);
>>>> -    if (HAS_GMCH(dev_priv))
>>>> +    if (HAS_GMCH(dev_priv)) {
>>>>           drm_connector_attach_max_bpc_property(connector, 6, 10);
>>>> -    else if (DISPLAY_VER(dev_priv) >= 5)
>>>> +        drm_connector_attach_active_bpc_property(connector, 6, 10);
>>>> +    }
>>>> +    else if (DISPLAY_VER(dev_priv) >= 5) {
>>>>           drm_connector_attach_max_bpc_property(connector, 6, 12);
>>>> +        drm_connector_attach_active_bpc_property(connector, 6, 12);
>>>> +    }
>>>>         /* Register HDMI colorspace for case of lspcon */
>>>>       if (intel_bios_is_lspcon_present(dev_priv, port)) {
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c 
>>>> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>>> index 2daa3f67791e..5a1869dc2210 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>>>> @@ -844,8 +844,10 @@ static struct drm_connector 
>>>> *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>>>>        */
>>>>       connector->max_bpc_property =
>>>> intel_dp->attached_connector->base.max_bpc_property;
>>>> -    if (connector->max_bpc_property)
>>>> +    if (connector->max_bpc_property) {
>>>>           drm_connector_attach_max_bpc_property(connector, 6, 12);
>>>> +        drm_connector_attach_active_bpc_property(connector, 6, 12);
>>>> +    }
>>>>         return connector;
>>>>   diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c 
>>>> b/drivers/gpu/drm/i915/display/intel_hdmi.c
>>>> index d69f0a6dc26d..8af78b27b6ce 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>>>> @@ -2463,8 +2463,10 @@ intel_hdmi_add_properties(struct intel_hdmi 
>>>> *intel_hdmi, struct drm_connector *c
>>>> drm_object_attach_property(&connector->base,
>>>> connector->dev->mode_config.hdr_output_metadata_property, 0);
>>>>   -    if (!HAS_GMCH(dev_priv))
>>>> +    if (!HAS_GMCH(dev_priv)) {
>>>>           drm_connector_attach_max_bpc_property(connector, 8, 12);
>>>> +        drm_connector_attach_active_bpc_property(connector, 8, 12);
>>>> +    }
>>>>   }
>>>>     /*
>>>> -- 
>>>> 2.25.1
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
