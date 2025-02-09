Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF2AA2DDB5
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 13:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B7F10E09C;
	Sun,  9 Feb 2025 12:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="WBW56qIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7502010E09C
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 12:31:19 +0000 (UTC)
Message-ID: <0f5908be-5dca-4590-b931-2a9fc8963f93@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1739104271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hj8yRacrhH1r703EyX/0lu752h/2MTjSzcrNHk6uG3I=;
 b=WBW56qISRHqj/5ye+T4ZUFJdGG+T/6+7fBm1V1Vxet8SsSfjxWKNRCLkHhPVOFwZWfEAlC
 hfJ5e/eNWOV3KiUVTPq9pC8QSvQ+qb7YnW7cAORnFPoebLJzGWUWrbFdyUqwpHMNvqybJf
 QoCljZ2+G9V8TszbntszIudVOmaD2uc=
Date: Sun, 9 Feb 2025 18:00:19 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v8 11/13] drm/atomic-helper: Separate out bridge
 pre_enable/post_disable from enable/disable
To: Jayesh Choudhary <j-choudhary@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250126191551.741957-1-aradhya.bhatia@linux.dev>
 <20250126191551.741957-12-aradhya.bhatia@linux.dev>
 <1b9aae38-1097-4036-abe6-2490f5dc6a62@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <1b9aae38-1097-4036-abe6-2490f5dc6a62@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi Jayesh,

Thank you for testing this out, and reporting the error I had
overlooked.

On 04/02/25 17:59, Jayesh Choudhary wrote:
> Hello Aradhya,
> 
> On 27/01/25 00:45, Aradhya Bhatia wrote:
>> The encoder-bridge ops occur by looping over the new connector states of
>> the display pipelines. The enable sequence runs as follows -
>>
>>     - pre_enable(bridge),
>>     - enable(encoder),
>>     - enable(bridge),
>>
>> while the disable sequnce runs as follows -
>>
>>     - disable(bridge),
>>     - disable(encoder),
>>     - post_disable(bridge).
>>
>> Separate out the pre_enable(bridge), and the post_disable(bridge)
>> operations into separate functions each.
>>
>> This patch keeps the sequence same for any singular disaplay pipe, but
>> changes the sequence across multiple display pipelines.
>>
>> This patch is meant to be an interim patch, to cleanly pave the way for
>> the sequence re-ordering patch, and maintain bisectability in the
>> process.
>>
>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c | 92 +++++++++++++++++++++++++++--
>>   1 file changed, 88 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/
>> drm_atomic_helper.c
>> index e805fd0a54c5..f5532e3646e1 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -1185,8 +1185,6 @@ encoder_bridge_disable(struct drm_device *dev,
>> struct drm_atomic_state *old_stat
>>               else if (funcs->dpms)
>>                   funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
>>           }
>> -
>> -        drm_atomic_bridge_chain_post_disable(bridge, old_state);
>>       }
>>   }
>>   @@ -1243,11 +1241,65 @@ crtc_disable(struct drm_device *dev, struct
>> drm_atomic_state *old_state)
>>       }
>>   }
>>   +static void
>> +encoder_bridge_post_disable(struct drm_device *dev, struct
>> drm_atomic_state *old_state)
>> +{
>> +    struct drm_connector *connector;
>> +    struct drm_connector_state *old_conn_state, *new_conn_state;
>> +    struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>> +    int i;
>> +
>> +    for_each_oldnew_connector_in_state(old_state, connector,
>> old_conn_state, new_conn_state, i) {
>> +        struct drm_encoder *encoder;
>> +        struct drm_bridge *bridge;
>> +
>> +        /*
>> +         * Shut down everything that's in the changeset and currently
>> +         * still on. So need to check the old, saved state.
>> +         */
>> +        if (!old_conn_state->crtc)
>> +            continue;
>> +
>> +        old_crtc_state = drm_atomic_get_old_crtc_state(old_state,
>> old_conn_state->crtc);
>> +
>> +        if (new_conn_state->crtc)
>> +            new_crtc_state = drm_atomic_get_new_crtc_state(
>> +                        old_state,
>> +                        new_conn_state->crtc);
>> +        else
>> +            new_crtc_state = NULL;
>> +
>> +        if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
>> +            !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
>> +            continue;
>> +
>> +        encoder = old_conn_state->best_encoder;
>> +
>> +        /* We shouldn't get this far if we didn't previously have
>> +         * an encoder.. but WARN_ON() rather than explode.
>> +         */
>> +        if (WARN_ON(!encoder))
>> +            continue;
>> +
>> +        drm_dbg_atomic(dev, "post-disabling bridges [ENCODER:%d:%s]\n",
>> +                   encoder->base.id, encoder->name);
>> +
>> +        /*
>> +         * Each encoder has at most one connector (since we always steal
>> +         * it away), so we won't call disable hooks twice.
>> +         */
>> +        bridge = drm_bridge_chain_get_first_bridge(encoder);
>> +        drm_atomic_bridge_chain_post_disable(bridge, old_state);
>> +    }
>> +}
>> +
>>   static void
>>   disable_outputs(struct drm_device *dev, struct drm_atomic_state
>> *old_state)
>>   {
>>       encoder_bridge_disable(dev, old_state);
>>   +    encoder_bridge_post_disable(dev, old_state);
>> +
>>       crtc_disable(dev, old_state);
>>   }
>>   @@ -1460,6 +1512,38 @@ static void
>> drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>>       }
>>   }
>>   +static void
>> +encoder_bridge_pre_enable(struct drm_device *dev, struct
>> drm_atomic_state *old_state)
>> +{
>> +    struct drm_connector *connector;
>> +    struct drm_connector_state *new_conn_state;
>> +    int i;
>> +
>> +    for_each_new_connector_in_state(old_state, connector,
>> new_conn_state, i) {
>> +        struct drm_encoder *encoder;
>> +        struct drm_bridge *bridge;
>> +
>> +        if (!new_conn_state->best_encoder)
>> +            continue;
>> +
>> +        if (!new_conn_state->crtc->state->active ||
>> +            !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
>> +            continue;
>> +
>> +        encoder = new_conn_state->best_encoder;
>> +
>> +        drm_dbg_atomic(dev, "pre-enabling bridges [ENCODER:%d:%s]\n",
>> +                   encoder->base.id, encoder->name);
>> +
>> +        /*
>> +         * Each encoder has at most one connector (since we always steal
>> +         * it away), so we won't call enable hooks twice.
>> +         */
>> +        bridge = drm_bridge_chain_get_first_bridge(encoder);
>> +        drm_atomic_bridge_chain_pre_enable(bridge, old_state);
>> +    }
>> +}
>> +
>>   static void
>>   crtc_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
>>   {
>> @@ -1531,8 +1615,6 @@ encoder_bridge_enable(struct drm_device *dev,
>> struct drm_atomic_state *old_state
>>               else if (funcs->commit)
>>                   funcs->commit(encoder);
>>           }
>> -
>> -        drm_atomic_bridge_chain_enable(bridge, old_state);
>>       }
>>   }
>>   @@ -1555,6 +1637,8 @@ void
>> drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>>   {
>>       crtc_enable(dev, old_state);
>>   +    encoder_bridge_pre_enable(dev, old_state);
>> +
>>       encoder_bridge_enable(dev, old_state);
>>   
> 
> After separating enable and pre_enable, bridge_chain_enable hook is not
> called. This breaks display.

That is true.

> 
> In encoder_bridge_enable call, you need to call
> bridge_chain_enable call instead of bridge_chain_pre_enable.

Yes, the encoder_bridge_enable() is supposed to call
bridge_chain_enable() instead of bridge_chain_pre_enable().


> 
> 
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/
> drm_atomic_helper.c
> index d2f19df9f418..1b580dc068bf 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1605,7 +1605,7 @@ encoder_bridge_enable(struct drm_device *dev,
> struct drm_atomic_state *old_state
>                  * it away), so we won't call enable hooks twice.
>                  */
>                 bridge = drm_bridge_chain_get_first_bridge(encoder);
> -               drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> +               drm_atomic_bridge_chain_enable(bridge, old_state);

While your report is right, I couldn't take this diff as is. The
bridge_chain_enable has to still happen _after_ all the encoders are
enabled inside this function (unlike the bridge_chain_pre_enable that
would happen before the encoder_enable).

> 
>                 if (funcs) {
>                         if (funcs->atomic_enable)
> 
> I have tested display on J784S4-EVM for MHDP and DSI with this diff on
> top of your series.
> 
> With the above change addressed,
> 
> Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>

Thank you!

I have posted the patch[0], and I have taken the liberty to accept the
tag despite the change in the way I have fixed the error. If that is
unacceptable, please do let me know and I will remove it in a newer
revision.


-- 
Regards
Aradhya

[0]: [PATCH v9 11/13] drm/atomic-helper: Separate out bridge pre_enable/
post_disable from enable/disable
https://lore.kernel.org/all/20250209121621.34677-4-aradhya.bhatia@linux.dev/
