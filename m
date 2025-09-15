Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C068B5756A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F9C10E0ED;
	Mon, 15 Sep 2025 10:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KMvVKbhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F9110E0ED
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:01:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cQLCC66y1z9tJm;
 Mon, 15 Sep 2025 12:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757930472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2gCX4X9LIM3oThobK3ZWV9X7zXjDK51+g0HaJDQDAk=;
 b=KMvVKbhveKVCSmcB1NVsv39XEDboGCBXEheqadFFEjXtASKbfUgdOjl2n6ARcen9xux1DK
 MRAB5GyrI/FYy8n9IOhbZiCuud/ouuGDXy+4dXA2OiWcLdU8ns6uoRjsJjl9pj1b7NYVNv
 6pLIRnEoqT5ZW3yW35sCG4jCaKJUVS0ktBMhjKai4nRrvxIsk8aU3eh6YU9htOGSUeHGhd
 p8qpVphz1k53dhMtYVBO+HBBIO8eDaNYfgPryvk0VX7PCE29NDuPbqD+OcYazTV6ZdDQsa
 v6vEAXiCUFA4/0lEHbS6noyayoyFHsBmInxG4/HvWvuodi3YYoQl1PSX66EWKg==
Message-ID: <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
Date: Mon, 15 Sep 2025 12:01:09 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: Derek Foreman <derek.foreman@collabora.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>
Cc: harry.wentland@amd.com, Mario.Limonciello@amd.com, xaver.hugl@gmail.com,
 victoria@system76.com, seanpaul@google.com, Sunpeng.Li@amd.com,
 dri-devel@lists.freedesktop.org
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5ae71bdbdfbd5bd6bba
X-MBO-RS-META: nut53bytyhpzt9ysxk3u7pbx9is45ror
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

On 12.09.25 15:45, Derek Foreman wrote:
> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>> Introduce a DRM interface for DRM clients to further restrict the
>> VRR Range within the panel supported VRR range on a per-commit
>> basis.
>>
>> The goal is to give DRM client the ability to do frame-doubling/
>> ramping themselves, or to set lower static refresh rates for power
>> savings.
> 
> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
> 
> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
> 
> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?

I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.


>> This is done through 2 new CRTC properties, along with a client
>> cap. See the docstrings in patch for details.

Not sure why a client cap would be needed for this. Not sure even a DRM_CAP is needed, the properties could simply be added only if the driver supports them.


>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 272d6254ea47..dc4b50ff5fe0 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -2866,6 +2866,31 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>>   }
>>   EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
>>   +/**
>> + * drm_connector_attach_vrr_range_control_property - attach "VRR_RANGE_CONTROL_MIN" and
>> + * "VRR_RANGE_CONTROL_MAX" property
>> + *
>> + * @connector: connector to attach the property on.
>> + *
>> + * This is used to allow the userspace to send VRR range control min and max value to the
>> + * driver.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_connector_attach_vrr_range_control_property(struct drm_connector *connector)
>> +{
>> +    struct drm_device *dev = connector->dev;
>> +    struct drm_property *prop_min = dev->mode_config.prop_vrr_range_control_min;
>> +    struct drm_property *prop_max = dev->mode_config.prop_vrr_range_control_max;
>> +
>> +    drm_object_attach_property(&connector->base, prop_min, 0);
>> +    drm_object_attach_property(&connector->base, prop_max, 0);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_vrr_range_control_property);

To me it would make more sense for these to be CRTC properties, same as VRR_ENABLED.


>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 25f376869b3a..1f74284208c6 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -340,6 +340,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>>           return -ENOMEM;
>>       dev->mode_config.prop_vrr_enabled = prop;
>>   +    prop = drm_property_create_range(dev,
>> +            DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
>> +            "VRR-RANGE-CONTROL-MIN", 0, UINT_MAX);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +    dev->mode_config.prop_vrr_range_control_min = prop;
>> +
>> +    prop = drm_property_create_range(dev,
>> +            DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
>> +            "VRR-RANGE-CONTROL-MAX", 0, UINT_MAX);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +    dev->mode_config.prop_vrr_range_control_max = prop;

Property names use underscores, not dashes.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
