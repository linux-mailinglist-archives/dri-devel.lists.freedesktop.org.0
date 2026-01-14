Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CFCD21B14
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 00:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232DF10E0F6;
	Wed, 14 Jan 2026 23:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MU4n/EU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51810E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768431845;
 bh=k/H84ZAimFi0KfIy/wlzQXUdUmqhcfPQQZxK4bTJAXQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MU4n/EU/pvW255gJDSpmtZtyMrfn7hgkdGIJXmWxtyvel/mZkltOC3oPVXhhkdP9y
 TDewfdrIucj9pDiXZPWubkJu8a9PkuX4+l7Gyjg3hY00nuRg+mNiO2Lok5bPKXRFs8
 JxIMo0+uocxPUiKhygD9zjgC+aHKxUwO6KQA1pfF1p/HkkPE6NV6GiW/aMpfud5Ezb
 MddmX2ejMn3sryZoDS6BPZ8n8j2CqTaFtH3PPrqs5UqodfdIQP8pA3jeMuYomiHFy6
 xAUNDzJNF3SXCExndjvCSI/8WWiLYLVgATbeNTsOxH9PWPE7uLsqsLgDr1FrrIERZv
 yHYq89K/cu3Sw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B4C1517E0699;
 Thu, 15 Jan 2026 00:04:04 +0100 (CET)
Message-ID: <301e7c8f-5a68-45c4-a18d-60e0545efdf0@collabora.com>
Date: Thu, 15 Jan 2026 01:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/bridge: Add ->detect_ctx hook and
 drm_bridge_detect_ctx()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
 <20260113-dw-hdmi-qp-scramb-v2-1-ae7b2c58d24d@collabora.com>
 <DFO89S1NDME1.1644YSMOMAAJ6@bootlin.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DFO89S1NDME1.1644YSMOMAAJ6@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luca,

On 1/14/26 12:08 PM, Luca Ceresoli wrote:
> Hello Cristian,
> 
> On Mon Jan 12, 2026 at 11:26 PM CET, Cristian Ciocaltea wrote:
>> Add an atomic variant of the ->detect callback and a new helper to call
>> the hook while passing an optional drm_modeset_acquire_ctx reference.
>>
>> When both ->detect_ctx and ->detect are defined, the latter is ignored.
>> If acquire_ctx is unset, the function takes care of the locking,
>> while also handling EDEADLK.
>>
>> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
>> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/drm/drm_bridge.h     | 30 +++++++++++++++++++++++
>>  2 files changed, 88 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 6dcf8f6d3ecf..0ef12bf98011 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -1344,6 +1344,64 @@ drm_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
>>  }
>>  EXPORT_SYMBOL_GPL(drm_bridge_detect);
>>
>> +/**
>> + * drm_bridge_detect_ctx - check if anything is attached to the bridge output
>> + * @bridge: bridge control structure
>> + * @connector: attached connector
>> + * @ctx: acquire_ctx, or NULL to let this function handle locking
>> + *
>> + * If the bridge supports output detection, as reported by the
>> + * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect_ctx
>> + * or &drm_bridge_funcs.detect for the bridge and return the connection status.
>> + * Otherwise return connector_status_unknown.
>> + *
>> + * When both @ctx and &drm_bridge_funcs.detect_ctx are not set, this helper
>> + * function is equivalent to drm_bridge_detect() above.
>> + *
>> + * RETURNS:
>> + * The detection status on success, or connector_status_unknown if the bridge
>> + * doesn't support output detection.
>> + * If @ctx is set, it might also return -EDEADLK.
>> + */
>> +int drm_bridge_detect_ctx(struct drm_bridge *bridge,
>> +			  struct drm_connector *connector,
>> +			  struct drm_modeset_acquire_ctx *ctx)
> 
> Shouldn't this new function return the same type as detect, i.e. enum
> drm_connector_status?

No, because it might also return an error, as documented in the RETURNS section.
Please also check the comments below.

> 
> Otherwise (see below)...
> 
>> +{
>> +	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
>> +		return connector_status_unknown;
>> +
>> +	if (bridge->funcs->detect_ctx) {
>> +		struct drm_modeset_acquire_ctx br_ctx;
>> +		int ret;
>> +
>> +		if (ctx)
>> +			return bridge->funcs->detect_ctx(bridge, connector, ctx);
>> +
>> +		drm_modeset_acquire_init(&br_ctx, 0);
>> +retry:
>> +		ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex,
>> +				       &br_ctx);
>> +		if (!ret)
>> +			ret = bridge->funcs->detect_ctx(bridge, connector, &br_ctx);
>> +
>> +		if (ret == -EDEADLK) {
>> +			drm_modeset_backoff(&br_ctx);
>> +			goto retry;
>> +		}
>> +
>> +		if (ret < 0)
>> +			ret = connector_status_unknown;
>> +
>> +		drm_modeset_drop_locks(&br_ctx);
>> +		drm_modeset_acquire_fini(&br_ctx);
>> +
>> +		return ret;
>> +	}
>> +
>> +	return bridge->funcs->detect(bridge, connector);
> 
> ...here you're converting an enum into an int, which is ok-isk but not
> ideal.

We already have a similar approach with drm_connector_helper_funcs.detect_ctx()
which is expected to return drm_connector_status or the error from
drm_modeset_lock().

> 
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -664,6 +664,33 @@ struct drm_bridge_funcs {
>>  	enum drm_connector_status (*detect)(struct drm_bridge *bridge,
>>  					    struct drm_connector *connector);
>>
>> +	/**
>> +	 * @detect_ctx:
>> +	 *
>> +	 * Check if anything is attached to the bridge output.
>> +	 *
>> +	 * This callback is optional, if not implemented the bridge will be
>> +	 * considered as always having a component attached to its output.
>> +	 * Bridges that implement this callback shall set the
>> +	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
>> +	 *
>> +	 * This is the atomic version of &drm_bridge_funcs.detect.
> 
> I may be missing something, but I'm a bit puzzled by the "atomic" word
> here. For other funcs in this struct there's the old non-atomic func X and
> the new atomic_X func that receives a pointer to struct drm_atomic_state.
> 
> Here I think you are using "atomic" with a more generic meaning. Maybe we'd
> better use another wording to not confuse readers?

This is once again consistent with drm_connector_helper_funcs.detect_ctx()
stating:

  "This is the atomic version of &drm_connector_funcs.detect."

I'm open for changes, but then we should probably do this across all relevant
funcs, beyond current struct scope.

>> +	 *
>> +	 * To avoid races against concurrent connector state updates, the
>> +	 * helper libraries always call this with ctx set to a valid context,
>> +	 * and &drm_mode_config.connection_mutex will always be locked with
>> +	 * the ctx parameter set to this ctx. This allows taking additional
>> +	 * locks as required.
>> +	 *
>> +	 * RETURNS:
>> +	 *
>> +	 * &drm_connector_status indicating the bridge output status,
>> +	 * or the error code returned by drm_modeset_lock(), -EDEADLK.
>> +	 */
>> +	int (*detect_ctx)(struct drm_bridge *bridge,
>> +			  struct drm_connector *connector,
>> +			  struct drm_modeset_acquire_ctx *ctx);
> 
> As above, shouldn't this new func return the same type as detect?

Nope, as explained above.

Thanks,
Cristian
