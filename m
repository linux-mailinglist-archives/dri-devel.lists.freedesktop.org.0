Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2940F3B00D8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C19A6E462;
	Tue, 22 Jun 2021 09:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3256E0DD;
 Tue, 22 Jun 2021 09:57:59 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 96BC1C8009D;
 Tue, 22 Jun 2021 11:57:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0amXZ27R54Tn; Tue, 22 Jun 2021 11:57:57 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:4900:2847:eb91:7f60:5216]
 (p200300E37F3949002847eb917F605216.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:2847:eb91:7f60:5216])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id BC5F8C8009B;
 Tue, 22 Jun 2021 11:57:54 +0200 (CEST)
Subject: Re: [PATCH v4 15/17] drm/uAPI: Move "Broadcast RGB" property from
 driver specific to general context
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-16-wse@tuxedocomputers.com>
 <20210622102529.5266e87b@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <70d89fe2-4e45-7ea9-2509-15257ef222f8@tuxedocomputers.com>
Date: Tue, 22 Jun 2021 11:57:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622102529.5266e87b@eldfell>
Content-Type: text/plain; charset=windows-1252
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 09:25 schrieb Pekka Paalanen:
> On Fri, 18 Jun 2021 11:11:14 +0200
> Werner Sembach <wse@tuxedocomputers.com> wrote:
>
>> Add "Broadcast RGB" to general drm context so that more drivers besides
>> i915 and gma500 can implement it without duplicating code.
>>
>> Userspace can use this property to tell the graphic driver to use full or
>> limited color range for a given connector, overwriting the default
>> behaviour/automatic detection.
>>
>> Possible options are:
>>     - Automatic (default/current behaviour)
>>     - Full
>>     - Limited 16:235
>>
>> In theory the driver should be able to automatically detect the monitors
>> capabilities, but because of flawed standard implementations in Monitors,
>> this might fail. In this case a manual overwrite is required to not have
>> washed out colors or lose details in very dark or bright scenes.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
>>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
>>  drivers/gpu/drm/drm_connector.c     | 43 +++++++++++++++++++++++++++++
>>  include/drm/drm_connector.h         | 16 +++++++++++
>>  4 files changed, 67 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 90d62f305257..0c89d32efbd0 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -691,6 +691,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>>  			if (old_connector_state->preferred_color_format !=
>>  			    new_connector_state->preferred_color_format)
>>  				new_crtc_state->connectors_changed = true;
>> +
>> +			if (old_connector_state->preferred_color_range !=
>> +			    new_connector_state->preferred_color_range)
>> +				new_crtc_state->connectors_changed = true;
>>  		}
>>  
>>  		if (funcs->atomic_check)
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index c536f5e22016..c589bb1a8163 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>>  		state->max_requested_bpc = val;
>>  	} else if (property == connector->preferred_color_format_property) {
>>  		state->preferred_color_format = val;
>> +	} else if (property == connector->preferred_color_range_property) {
>> +		state->preferred_color_range = val;
>>  	} else if (connector->funcs->atomic_set_property) {
>>  		return connector->funcs->atomic_set_property(connector,
>>  				state, property, val);
>> @@ -877,6 +879,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>>  		*val = state->max_requested_bpc;
>>  	} else if (property == connector->preferred_color_format_property) {
>>  		*val = state->preferred_color_format;
>> +	} else if (property == connector->preferred_color_range_property) {
>> +		*val = state->preferred_color_range;
>>  	} else if (connector->funcs->atomic_get_property) {
>>  		return connector->funcs->atomic_get_property(connector,
>>  				state, property, val);
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index aea03dd02e33..9bc596638613 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -905,6 +905,12 @@ static const struct drm_prop_enum_list drm_active_color_format_enum_list[] = {
>>  	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
>>  };
>>  
>> +static const struct drm_prop_enum_list drm_preferred_color_range_enum_list[] = {
>> +	{ DRM_MODE_COLOR_RANGE_UNSET, "Automatic" },
>> +	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
>> +	{ DRM_MODE_COLOR_RANGE_LIMITED_16_235, "Limited 16:235" },
> Hi,
>
> the same question here about these numbers as I asked on the "active
> color range" property.
>
>> +};
>> +
>>  static const struct drm_prop_enum_list drm_active_color_range_enum_list[] = {
>>  	{ DRM_MODE_COLOR_RANGE_UNSET, "Unknown" },
>>  	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
>> @@ -1243,6 +1249,13 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>   *	drm_connector_attach_active_color_format_property() to install this
>>   *	property.
>>   *
>> + * Broadcast RGB:
>> + *	This property is used by userspace to change the used color range. When
>> + *	used the driver will use the selected range if valid for the current
>> + *	color format. Drivers to use the function
>> + *	drm_connector_attach_preferred_color_format_property() to create and
>> + *	attach the property to the connector during initialization.
> An important detail to document here is: does userspace need to
> take care that pixel data at the connector will already match the set
> range, or will the driver program the hardware to produce the set range?
Since until now, the userspace didn't even know for sure if RGB or YCbCr and therefore which full/limited format was
used I guess it's all kernel space conversion.
>
> If the former, then I'm afraid the preference/active property pair
> design does not work. Userspace needs to make sure the content is in
> the right range, so the driver cannot second-guess that afterwards.
>
> If the latter, then what does the driver assume about color range just
> before the automatic conversion to the final color range, and does the
> range conversion happen as the final step in the color pipeline?
>
> If I remember the discussion about Intel right, then the driver does
> the latter and assume that userspace programs KMS to always produce
> full range pixels. There is no provision for userspace to produce
> limited range pixels, IIRC.
I think I remember this too from an answer to one of the revisions of this patchset.
>
>
> Thanks,
> pq
>
>> + *
>>   * active color range:
>>   *	This read-only property tells userspace the color range actually used by
>>   *	the hardware display engine on "the cable" on a connector. The chosen
>> @@ -2324,6 +2337,36 @@ void drm_connector_set_active_color_format_property(struct drm_connector *connec
>>  }
>>  EXPORT_SYMBOL(drm_connector_set_active_color_format_property);
>>  
>> +/**
>> + * drm_connector_attach_preferred_color_range_property - attach "Broadcast RGB" property
>> + * @connector: connector to attach preferred color range property on.
>> + *
>> + * This is used to add support for selecting a color range on a connector.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_connector_attach_preferred_color_range_property(struct drm_connector *connector)
>> +{
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_property *prop;
>> +
>> +	if (!connector->preferred_color_range_property) {
>> +		prop = drm_property_create_enum(dev, 0, "Broadcast RGB",
>> +						drm_preferred_color_range_enum_list,
>> +						ARRAY_SIZE(drm_preferred_color_range_enum_list));
>> +		if (!prop)
>> +			return -ENOMEM;
>> +
>> +		connector->preferred_color_range_property = prop;
>> +		drm_object_attach_property(&connector->base, prop, DRM_MODE_COLOR_RANGE_UNSET);
>> +		connector->state->preferred_color_range = DRM_MODE_COLOR_RANGE_UNSET;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_preferred_color_range_property);
>> +
>>  /**
>>   * drm_connector_attach_active_color_range_property - attach "active color range" property
>>   * @connector: connector to attach active color range property on.
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 7b85407ba45c..b319760d4a8c 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -809,6 +809,15 @@ struct drm_connector_state {
>>  	 */
>>  	u32 preferred_color_format;
>>  
>> +	/**
>> +	 * preferred_color_range: Property set by userspace via "Broadcast RGB"
>> +	 * property to tell the GPU driver which color range to use. It
>> +	 * overwrites existing automatic detection mechanisms, if set and valid
>> +	 * for the current color format. Userspace can check for (un-)successful
>> +	 * application via the "active color range" property.
>> +	 */
>> +	enum drm_mode_color_range preferred_color_range;
>> +
>>  	/**
>>  	 * @hdr_output_metadata:
>>  	 * DRM blob property for HDR output metadata
>> @@ -1426,6 +1435,12 @@ struct drm_connector {
>>  	 */
>>  	struct drm_property *active_color_format_property;
>>  
>> +	/**
>> +	 * @preferred_color_range_property: Default connector property for the
>> +	 * preferred color range to be driven out of the connector.
>> +	 */
>> +	struct drm_property *preferred_color_range_property;
>> +
>>  	/**
>>  	 * @active_color_range_property: Default connector property for the
>>  	 * active color range to be driven out of the connector.
>> @@ -1760,6 +1775,7 @@ int drm_connector_attach_preferred_color_format_property(struct drm_connector *c
>>  int drm_connector_attach_active_color_format_property(struct drm_connector *connector);
>>  void drm_connector_set_active_color_format_property(struct drm_connector *connector,
>>  						    u32 active_color_format);
>> +int drm_connector_attach_preferred_color_range_property(struct drm_connector *connector);
>>  int drm_connector_attach_active_color_range_property(struct drm_connector *connector);
>>  void drm_connector_set_active_color_range_property(struct drm_connector *connector,
>>  						   enum drm_mode_color_range active_color_range);
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
