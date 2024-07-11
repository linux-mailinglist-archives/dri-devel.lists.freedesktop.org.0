Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49592E0E6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 09:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C7E10E97A;
	Thu, 11 Jul 2024 07:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="wsKvu1bG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4881510E072
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 07:33:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46B7WkZq089292;
 Thu, 11 Jul 2024 02:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1720683166;
 bh=Ng8XKnovtXFklkr3TyyDo448pMN83xKpdeoGmUbuvEc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=wsKvu1bGbN3ctKYKBu+xy2UoxX4ZZ5R0nmrBM89zs6vP5SJXpTLb0s+vIHfKRGuHm
 hYAj5uNZYcWx4rMk5mQoYsEYO739euQnIGlQCsPnf7o/kJ0IWHchruhnOolIB1n5ic
 M5tCkjKFO/V0eiVG8ouhy0k4YWXESj376mebIBqM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46B7WkiP075028
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Jul 2024 02:32:46 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Jul 2024 02:32:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Jul 2024 02:32:46 -0500
Received: from [172.24.227.31] (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46B7WcFH018814;
 Thu, 11 Jul 2024 02:32:39 -0500
Message-ID: <e6a54c84-e9cb-4396-b873-8bbcc72ea8a2@ti.com>
Date: Thu, 11 Jul 2024 13:02:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Maxime Ripard <mripard@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jyri Sarha <jyri.sarha@iki.fi>, Thomas
 Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, DRI Development List
 <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Dominik Haller <d.haller@phytec.de>, Sam
 Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, Devarsh Thakkar
 <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra
 <j-luthra@ti.com>
References: <20240622110929.3115714-1-a-bhatia1@ti.com>
 <20240622110929.3115714-11-a-bhatia1@ti.com>
 <e7dde09d-ceb0-4fb0-a23e-6aaba8f1beb3@ideasonboard.com>
 <20240626-tremendous-fantastic-rhino-ab73fc@houat>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240626-tremendous-fantastic-rhino-ab73fc@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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



On 26/06/24 18:37, Maxime Ripard wrote:
> On Wed, Jun 26, 2024 at 02:28:57PM GMT, Tomi Valkeinen wrote:
>> On 22/06/2024 14:09, Aradhya Bhatia wrote:
>>> Move the bridge pre_enable call before crtc enable, and the bridge
>>> post_disable call after the crtc disable.
>>>
>>> The sequence of enable after this patch will look like:
>>>
>>> 	bridge[n]_pre_enable
>>> 	...
>>> 	bridge[1]_pre_enable
>>>
>>> 	crtc_enable
>>> 	encoder_enable
>>>
>>> 	bridge[1]_enable
>>> 	...
>>> 	bridge[n]__enable
>>>
>>> and vice-versa for the bridge chain disable sequence.
>>>
>>> The definition of bridge pre_enable hook says that,
>>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
>>> will not yet be running when this callback is called".
>>>
>>> Since CRTC is also a source feeding the bridge, it should not be enabled
>>> before the bridges in the pipeline are pre_enabled. Fix that by
>>> re-ordering the sequence of bridge pre_enable and bridge post_disable.
>>>
>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>> ---
>>>   drivers/gpu/drm/drm_atomic_helper.c | 165 ++++++++++++++++++----------
>>>   include/drm/drm_atomic_helper.h     |   7 ++
>>>   2 files changed, 114 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>>> index fb97b51b38f1..e8ad08634f58 100644
>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>> @@ -74,6 +74,7 @@
>>>    * also shares the &struct drm_plane_helper_funcs function table with the plane
>>>    * helpers.
>>>    */
>>> +
>>
>> Extra change.
>>
>>>   static void
>>>   drm_atomic_helper_plane_changed(struct drm_atomic_state *state,
>>>   				struct drm_plane_state *old_plane_state,
>>> @@ -1122,11 +1123,11 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>>>   }
>>>   static void
>>> -disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>>> +disable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_state *old_state,
>>> +			    enum bridge_chain_operation_type op_type)
>>>   {
>>>   	struct drm_connector *connector;
>>>   	struct drm_connector_state *old_conn_state, *new_conn_state;
>>> -	struct drm_crtc *crtc;
>>>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>>   	int i;
>>> @@ -1163,32 +1164,55 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>>>   		if (WARN_ON(!encoder))
>>>   			continue;
>>> -		funcs = encoder->helper_private;
>>> -
>>> -		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
>>> -			       encoder->base.id, encoder->name);
>>> -
>>>   		/*
>>>   		 * Each encoder has at most one connector (since we always steal
>>>   		 * it away), so we won't call disable hooks twice.
>>>   		 */
>>>   		bridge = drm_bridge_chain_get_first_bridge(encoder);
>>> -		drm_atomic_bridge_chain_disable(bridge, old_state);
>>> -		/* Right function depends upon target state. */
>>> -		if (funcs) {
>>> -			if (funcs->atomic_disable)
>>> -				funcs->atomic_disable(encoder, old_state);
>>> -			else if (new_conn_state->crtc && funcs->prepare)
>>> -				funcs->prepare(encoder);
>>> -			else if (funcs->disable)
>>> -				funcs->disable(encoder);
>>> -			else if (funcs->dpms)
>>> -				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
>>> -		}
>>> +		switch (op_type) {
>>> +		case DRM_ENCODER_BRIDGE_DISABLE:
>>> +			funcs = encoder->helper_private;
>>> +
>>> +			drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
>>> +				       encoder->base.id, encoder->name);
>>> +
>>> +			drm_atomic_bridge_chain_disable(bridge, old_state);
>>> +
>>> +			/* Right function depends upon target state. */
>>> +			if (funcs) {
>>> +				if (funcs->atomic_disable)
>>> +					funcs->atomic_disable(encoder, old_state);
>>> +				else if (new_conn_state->crtc && funcs->prepare)
>>> +					funcs->prepare(encoder);
>>> +				else if (funcs->disable)
>>> +					funcs->disable(encoder);
>>> +				else if (funcs->dpms)
>>> +					funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
>>> +			}
>>> +
>>> +			break;
>>> +
>>> +		case DRM_BRIDGE_POST_DISABLE:
>>> +			drm_atomic_bridge_chain_post_disable(bridge, old_state);
>>> -		drm_atomic_bridge_chain_post_disable(bridge, old_state);
>>> +			break;
>>> +
>>> +		default:
>>> +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
>>> +			break;
>>> +		}
>>>   	}
>>> +}
>>> +
>>> +static void
>>> +disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>>> +{
>>> +	struct drm_crtc *crtc;
>>> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>> +	int i;
>>> +
>>> +	disable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_DISABLE);
>>>   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>>>   		const struct drm_crtc_helper_funcs *funcs;
>>> @@ -1234,6 +1258,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>>>   		if (ret == 0)
>>>   			drm_crtc_vblank_put(crtc);
>>>   	}
>>> +
>>> +	disable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_POST_DISABLE);
>>>   }
>>>   /**
>>> @@ -1445,6 +1471,64 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>>>   	}
>>>   }
>>> +static void
>>> +enable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_state *old_state,
>>> +			   enum bridge_chain_operation_type op_type)
>>> +{
>>> +	struct drm_connector *connector;
>>> +	struct drm_connector_state *new_conn_state;
>>> +	int i;
>>> +
>>> +	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
>>> +		const struct drm_encoder_helper_funcs *funcs;
>>> +		struct drm_encoder *encoder;
>>> +		struct drm_bridge *bridge;
>>> +
>>> +		if (!new_conn_state->best_encoder)
>>> +			continue;
>>> +
>>> +		if (!new_conn_state->crtc->state->active ||
>>> +		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
>>> +			continue;
>>> +
>>> +		encoder = new_conn_state->best_encoder;
>>> +
>>> +		/*
>>> +		 * Each encoder has at most one connector (since we always steal
>>> +		 * it away), so we won't call enable hooks twice.
>>> +		 */
>>> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
>>> +
>>> +		switch (op_type) {
>>> +		case DRM_BRIDGE_PRE_ENABLE:
>>> +			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
>>> +			break;
>>> +
>>> +		case DRM_ENCODER_BRIDGE_ENABLE:
>>> +			funcs = encoder->helper_private;
>>> +
>>> +			drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
>>> +				       encoder->base.id, encoder->name);
>>> +
>>> +			if (funcs) {
>>> +				if (funcs->atomic_enable)
>>> +					funcs->atomic_enable(encoder, old_state);
>>> +				else if (funcs->enable)
>>> +					funcs->enable(encoder);
>>> +				else if (funcs->commit)
>>> +					funcs->commit(encoder);
>>> +			}
>>> +
>>> +			drm_atomic_bridge_chain_enable(bridge, old_state);
>>> +			break;
>>> +
>>> +		default:
>>> +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
>>> +			break;
>>> +		}
>>> +	}
>>> +}
>>> +
>>>   /**
>>>    * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
>>>    * @dev: DRM device
>>> @@ -1465,10 +1549,10 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>>>   	struct drm_crtc *crtc;
>>>   	struct drm_crtc_state *old_crtc_state;
>>>   	struct drm_crtc_state *new_crtc_state;
>>> -	struct drm_connector *connector;
>>> -	struct drm_connector_state *new_conn_state;
>>>   	int i;
>>> +	enable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_PRE_ENABLE);
>>> +
>>>   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>>>   		const struct drm_crtc_helper_funcs *funcs;
>>> @@ -1491,42 +1575,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>>>   		}
>>>   	}
>>> -	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
>>> -		const struct drm_encoder_helper_funcs *funcs;
>>> -		struct drm_encoder *encoder;
>>> -		struct drm_bridge *bridge;
>>> -
>>> -		if (!new_conn_state->best_encoder)
>>> -			continue;
>>> -
>>> -		if (!new_conn_state->crtc->state->active ||
>>> -		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
>>> -			continue;
>>> -
>>> -		encoder = new_conn_state->best_encoder;
>>> -		funcs = encoder->helper_private;
>>> -
>>> -		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
>>> -			       encoder->base.id, encoder->name);
>>> -
>>> -		/*
>>> -		 * Each encoder has at most one connector (since we always steal
>>> -		 * it away), so we won't call enable hooks twice.
>>> -		 */
>>> -		bridge = drm_bridge_chain_get_first_bridge(encoder);
>>> -		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
>>> -
>>> -		if (funcs) {
>>> -			if (funcs->atomic_enable)
>>> -				funcs->atomic_enable(encoder, old_state);
>>> -			else if (funcs->enable)
>>> -				funcs->enable(encoder);
>>> -			else if (funcs->commit)
>>> -				funcs->commit(encoder);
>>> -		}
>>> -
>>> -		drm_atomic_bridge_chain_enable(bridge, old_state);
>>> -	}
>>> +	enable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_ENABLE);
>>>   	drm_atomic_helper_commit_writebacks(dev, old_state);
>>>   }
>>> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
>>> index 9aa0a05aa072..b45a175a9f8a 100644
>>> --- a/include/drm/drm_atomic_helper.h
>>> +++ b/include/drm/drm_atomic_helper.h
>>> @@ -43,6 +43,13 @@
>>>    */
>>>   #define DRM_PLANE_NO_SCALING (1<<16)
>>> +enum bridge_chain_operation_type {
>>> +	DRM_BRIDGE_PRE_ENABLE,
>>> +	DRM_BRIDGE_POST_DISABLE,
>>> +	DRM_ENCODER_BRIDGE_ENABLE,
>>> +	DRM_ENCODER_BRIDGE_DISABLE,
>>> +};
>>
>> Why are the last two "DRM_ENCODER"?

I do agree that the naming is odd. It's supposed to mean both, encoder
and bridge.

When we are enabling/disabling bridges, the encoders are also getting
enabled/disabled right before/after.

But in case of pre_enable/post_disable its only the bridges that are
being operated on.

>>
>> I don't like the enum... Having "enum bridge_chain_operation_type" as a
>> parameter to a function looks like one can pass any of the enum's values,
>> which is not the case.
>>
>> How about an enum with just two values:
>>
>> DRM_BRIDGE_PRE_ENABLE_POST_DISABLE
>> DRM_BRIDGE_ENABLE_DISABLE

Yes, I can combine them like this.

> 
> I think I'd go a step further and ask why do we need that rework in the
> first place. We had a discussion about changing the time the CRTC is
> enabled compared to bridges, but it's not clear, nor explained, why we
> need to do that rework in the first place.
> 

We did discuss this, which resulted in a bunch of duplicated code in
v2[0]. The same block of code was required before the CRTC enable, as
well as after. Hence this patch.

Maybe all of this should have been explained better. =)

> It should even be two patches imo.
> 

Yeah, I can split this in 2 patches.


Regards
Aradhya

[0]:
https://lore.kernel.org/all/20240530093621.1925863-9-a-bhatia1@ti.com/
