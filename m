Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953ED3B7112
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868346E842;
	Tue, 29 Jun 2021 11:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A4A6E842;
 Tue, 29 Jun 2021 11:02:08 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 1F7E8C80062;
 Tue, 29 Jun 2021 13:02:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id c6i2xe2oxy6M; Tue, 29 Jun 2021 13:02:06 +0200 (CEST)
Received: from [IPv6:2003:e3:7f39:4900:84eb:1779:dd70:1696]
 (p200300e37f39490084eB1779Dd701696.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:84eb:1779:dd70:1696])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id E2958C80042;
 Tue, 29 Jun 2021 13:02:05 +0200 (CEST)
Subject: Re: [PATCH v4 03/17] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-4-wse@tuxedocomputers.com>
 <18bbd0cf-4c37-ce9d-eb63-de4131a201e1@tuxedocomputers.com>
Message-ID: <11cd3340-46a1-9a6a-88f5-95c225863509@tuxedocomputers.com>
Date: Tue, 29 Jun 2021 13:02:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <18bbd0cf-4c37-ce9d-eb63-de4131a201e1@tuxedocomputers.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.06.21 um 19:03 schrieb Werner Sembach:
> Am 18.06.21 um 11:11 schrieb Werner Sembach:
>> Add a new general drm property "active bpc" which can be used by graphic
>> drivers to report the applied bit depth per pixel back to userspace.
>>
>> While "max bpc" can be used to change the color depth, there was no way to
>> check which one actually got used. While in theory the driver chooses the
>> best/highest color depth within the max bpc setting a user might not be
>> fully aware what his hardware is or isn't capable off. This is meant as a
>> quick way to double check the setup.
>>
>> In the future, automatic color calibration for screens might also depend on
>> this information being available.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>  drivers/gpu/drm/drm_connector.c | 51 +++++++++++++++++++++++++++++++++
>>  include/drm/drm_connector.h     |  8 ++++++
>>  2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index da39e7ff6965..943f6b61053b 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1197,6 +1197,14 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>   *	drm_connector_attach_max_bpc_property() to create and attach the
>>   *	property to the connector during initialization.
>>   *
>> + * active bpc:
>> + *	This read-only range property tells userspace the pixel color bit depth
>> + *	actually used by the hardware display engine on "the cable" on a
>> + *	connector. The chosen value depends on hardware capabilities, both
>> + *	display engine and connected monitor, and the "max bpc" property.
>> + *	Drivers shall use drm_connector_attach_active_bpc_property() to install
>> + *	this property.
>> + *
> Regarding "on the cable" and dithering: As far as I can tell, what the dithering option does, is setting a hardware
> register here:
>
> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/display/intel_display.c#L4534
>
> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/display/intel_display.c#L4571
>
> So dithering seems to be calculated by fixed purpose hardware/firmware outside of the driver?
>
> The Intel driver does not seem to set a target bpc/bpp for this hardware so I guess it defaults to 6 or 8 bpc?

Never mind it does. This switch-case does affect the dithering output:
https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/display/intel_display.c#L4537

As found in this documentation p.548:
https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc-lkf-vol02c-commandreference-registers-part2.pdf

So max bpc and active bpc are affecting/affected by the bpc after dithering.

>
> Similar things happen on amd. Here the output dither depth seems to be written to a fixed value however:
>
> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c#L828
>
> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c#L769
>
> Does anyone know about a resource where I can read up on the used registers and what this hardware actually does?
Searching now for a similar register reference for AMD GPUs.
>
> My proposal for now: "max bpc" affects what happens before dither, so I would keep "active bpc" the same and add another
> drm property "dither active: true/false". No additional property to control dither, as amdgpu does have one already
> (which isn't always active?) and Intel driver does only seem prepared for dithering at 6bpc (albeit I don't know why to
> dither at 6bpc and what depth to dither to?).
>
>>   * Connectors also have one standardized atomic property:
>>   *
>>   * CRTC_ID:
>> @@ -2152,6 +2160,49 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>  }
>>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
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
>> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max)
>> +{
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_property *prop;
>> +
>> +	if (!connector->active_bpc_property) {
>> +		prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "active bpc",
>> +						 min, max);
>> +		if (!prop)
>> +			return -ENOMEM;
>> +
>> +		connector->active_bpc_property = prop;
>> +		drm_object_attach_property(&connector->base, prop, 0);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
>> +
>> +/**
>> + * drm_connector_set_active_bpc_property - sets the active bits per color property for a connector
>> + * @connector: drm connector
>> + * @active_bpc: bits per color for the connector currently active on "the cable"
>> + *
>> + * Should be used by atomic drivers to update the active bits per color over a connector.
>> + */
>> +void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc)
>> +{
>> +	drm_object_property_set_value(&connector->base, connector->active_bpc_property, active_bpc);
>> +}
>> +EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
>> +
>>  /**
>>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OUTPUT_METADA" property
>>   * @connector: connector to attach the property on.
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 714d1a01c065..eee86de62a5f 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1380,6 +1380,12 @@ struct drm_connector {
>>  	 */
>>  	struct drm_property *max_bpc_property;
>>  
>> +	/**
>> +	 * @active_bpc_property: Default connector property for the active bpc
>> +	 * to be driven out of the connector.
>> +	 */
>> +	struct drm_property *active_bpc_property;
>> +
>>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
>> @@ -1702,6 +1708,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>>  	int width, int height);
>>  int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>  					  int min, int max);
>> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector, int min, int max);
>> +void drm_connector_set_active_bpc_property(struct drm_connector *connector, int active_bpc);
>>  
>>  /**
>>   * struct drm_tile_group - Tile group metadata
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
