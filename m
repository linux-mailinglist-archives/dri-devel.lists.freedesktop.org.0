Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956E339D552
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 08:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3406E1D3;
	Mon,  7 Jun 2021 06:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7646E198;
 Mon,  7 Jun 2021 06:46:49 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 0C3B8C800E1;
 Mon,  7 Jun 2021 08:46:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id CcSs6_Du4AyO; Mon,  7 Jun 2021 08:46:47 +0200 (CEST)
Received: from [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770]
 (p200300E37F4f6000F5F44cDd80159770.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 71043C800DF;
 Mon,  7 Jun 2021 08:46:47 +0200 (CEST)
Subject: Re: [PATCH 2/4] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-3-wse@tuxedocomputers.com> <YLpiVFiBrgH29rki@intel.com>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <bef099db-f662-9005-6e36-ce056257f537@tuxedocomputers.com>
Date: Mon, 7 Jun 2021 08:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YLpiVFiBrgH29rki@intel.com>
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


Am 04.06.21 um 19:26 schrieb Ville Syrjälä:
> On Fri, Jun 04, 2021 at 07:17:21PM +0200, Werner Sembach wrote:
>> Add a new general drm property "active bpc" which can be used by graphic drivers
>> to report the applied bit depth per pixel back to userspace.
>>
>> While "max bpc" can be used to change the color depth, there was no way to check
>> which one actually got used. While in theory the driver chooses the best/highest
>> color depth within the max bpc setting a user might not be fully aware what his
>> hardware is or isn't capable off. This is meant as a quick way to double check
>> the setup.
>>
>> In the future, automatic color calibration for screens might also depend on this
>> information available.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
>>   drivers/gpu/drm/drm_connector.c   | 40 +++++++++++++++++++++++++++++++
>>   include/drm/drm_connector.h       | 15 ++++++++++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 268bb69c2e2f..7ae4e40936b5 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>>   		*val = 0;
>>   	} else if (property == connector->max_bpc_property) {
>>   		*val = state->max_requested_bpc;
>> +	} else if (property == connector->active_bpc_property) {
>> +		*val = state->active_bpc;
>>   	} else if (connector->funcs->atomic_get_property) {
>>   		return connector->funcs->atomic_get_property(connector,
>>   				state, property, val);
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 7631f76e7f34..5f42a5be5822 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1195,6 +1195,13 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>    *	drm_connector_attach_max_bpc_property() to create and attach the
>>    *	property to the connector during initialization.
>>    *
>> + * active bpc:
>> + *	This read-only range property is used by userspace check the bit depth
>> + *	actually applied by the GPU driver after evaluation all hardware
>> + *	capabilities and max bpc. Drivers to use the function
>> + *	drm_connector_attach_active_bpc_property() to create and attach the
>> + *	property to the connector during initialization.
>> + *
>>    * Connectors also have one standardized atomic property:
>>    *
>>    * CRTC_ID:
>> @@ -2150,6 +2157,39 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>   }
>>   EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>>   
>> +/**
>> + * drm_connector_attach_active_bpc_property - attach "active bpc" property
>> + * @connector: connector to attach active bpc property on.
>> + * @min: The minimum bit depth supported by the connector.
>> + * @max: The maximum bit depth supported by the connector.
>> + *
>> + * This is used to check the applied bit depth on a connector.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
>> +					  int min, int max)
>> +{
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_property *prop;
>> +
>> +	prop = connector->active_bpc_property;
>> +	if (!prop) {
>> +		prop = drm_property_create_range(dev, 0, "active bpc", min, max);
> Should be immutable.
Yes. I didn't know if there is a way to do this (or just don't define a 
set-function), but I think I found the define for this.
>
> Also wondering what the semantics of this should be when eg. DSC
> is active?
I'm unfamiliar how the inner workings of DSC (I guess Display Stream 
Compression?) are. But doesn't it also have color depth?

The active bpc should be what the GPU tells the display to actually show 
the user when he looks at just one pixel.

So dithering computed on the host should not be included (aka when the 
gpu sends a premade picture to the screen and tells it the lesser pbc), 
while FRC dithering computed in the display firmware should be included 
(since the GPU can't really tell the difference between FRC displays and 
True 10-Bit displays, can't it?)
>
>> +		if (!prop)
>> +			return -ENOMEM;
>> +
>> +		connector->active_bpc_property = prop;
>> +	}
>> +
>> +	drm_object_attach_property(&connector->base, prop, 0);
>> +	connector->state->active_bpc = 0;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
>> +
>>   /**
>>    * drm_connector_set_vrr_capable_property - sets the variable refresh rate
>>    * capable property for a connector
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 1922b278ffad..c58cba2b6afe 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -781,6 +781,13 @@ struct drm_connector_state {
>>   	 */
>>   	u8 max_bpc;
>>   
>> +	/**
>> +	 * @active_bpc: Read only property set by the GPU driver to the actually
>> +	 * applied bit depth of the pixels after evaluating all hardware
>> +	 * limitations.
>> +	 */
>> +	u8 active_bpc;
>> +
>>   	/**
>>   	 * @hdr_output_metadata:
>>   	 * DRM blob property for HDR output metadata
>> @@ -1380,6 +1387,12 @@ struct drm_connector {
>>   	 */
>>   	struct drm_property *max_bpc_property;
>>   
>> +	/**
>> +	 * @active_bpc_property: Default connector property for the active bpc
>> +	 * to be driven out of the connector.
>> +	 */
>> +	struct drm_property *active_bpc_property;
>> +
>>   #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>>   #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>>   #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
>> @@ -1698,6 +1711,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>>   	int width, int height);
>>   int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>   					  int min, int max);
>> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
>> +					  int min, int max);
>>   
>>   /**
>>    * struct drm_tile_group - Tile group metadata
>> -- 
>> 2.25.1
