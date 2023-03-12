Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C06B6A60
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 20:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4810810E164;
	Sun, 12 Mar 2023 19:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA1710E14D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678647641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnQlQZuaAZ0VPlEe0X9mfBQw6c5chFwi/ctcoMwAjB4=;
 b=bY0dgjTMpxJFBWxnFjsjB2/qz+1J3iQ/KtQByexZsOQnZg4YQgv4EMp3QgpWeRHOS79zkQ
 fQGsam4Owf1xYNiTeUiS3cHZ5g/xtoQfdI8OIzlPUr4LfWB2jjsYr1dnC7uHC/SYgTuFqv
 +U24Ef/JQIm8g+Qm//c3h6lKHujjUEU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-7R8tQDpZP9aGSVPSoasJtA-1; Sun, 12 Mar 2023 15:00:40 -0400
X-MC-Unique: 7R8tQDpZP9aGSVPSoasJtA-1
Received: by mail-ed1-f69.google.com with SMTP id
 en6-20020a056402528600b004fa01232e6aso5387068edb.16
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Mar 2023 12:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678647639;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tnQlQZuaAZ0VPlEe0X9mfBQw6c5chFwi/ctcoMwAjB4=;
 b=ew9DcsoHjybkmtuBhcFvqIhXH6hv2JB38nvSy9n5UpqVY3Mz385bX3Xxn9w+3X6xje
 EK7m5JeEVxdjCGExi+/GfAIB9CKwp9LAzJ/QDj8QeVKimr9GJEzNLxtjHU5IK6bOj1bw
 G4t++6Lc6DE5LD2Pg/hVN3j8U4ijIwxI1qpqTgdDpysn2tiqDcc0AxoaGJ0CM3h+01Fw
 MbO5hlv8vGW+Tz/HYtNtzA4UcjZXjuvtXEuxWZyperG6IDvDO6xpahFgecCdw4+7nI+j
 12eecDBJcjVYg6E2gcs8oVcvZWOP3oGh/EN0IoNKbjMit6cVSFNpB9UqAQ9n4jGAV9ut
 5ITQ==
X-Gm-Message-State: AO0yUKVISv2bBEqDIchbc9pHmDQa6f7eNZluivaeS28hH5fvtriTA71Z
 JOYdX1THVkY5ATW2t56exEE2iUF1Gqfegukhp2k2nA46e6z9xNqU3gkbPjD/drTc8CSpO6RhsYL
 AT6VXKyPtO9HQ3MvrIUESNBkh9CXS
X-Received: by 2002:a17:906:175b:b0:888:db6b:5fa9 with SMTP id
 d27-20020a170906175b00b00888db6b5fa9mr32456414eje.67.1678647638912; 
 Sun, 12 Mar 2023 12:00:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set8eLY0+zp35jsU2ZlBqI+pjOm+zrWEc0KGHDZLixKmrbAPTqOfxRIc42oSmh20m9/mh7eAGAg==
X-Received: by 2002:a17:906:175b:b0:888:db6b:5fa9 with SMTP id
 d27-20020a170906175b00b00888db6b5fa9mr32456402eje.67.1678647638648; 
 Sun, 12 Mar 2023 12:00:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a1709061ec600b0091e54c001c8sm2532021ejj.148.2023.03.12.12.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 12:00:38 -0700 (PDT)
Message-ID: <67e65a32-3bb6-3f85-f868-291c3d333b59@redhat.com>
Date: Sun, 12 Mar 2023 20:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 6/6] drm/amd/display: Pass proper parent for DM backlight
 device registration v2
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230308215831.782266-1-hdegoede@redhat.com>
 <20230308215831.782266-7-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230308215831.782266-7-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/8/23 22:58, Hans de Goede wrote:
> The parent for the backlight device should be the drm-connector object,
> not the PCI device.
> 
> Userspace relies on this to be able to detect which backlight class device
> to use on hybrid gfx devices where there may be multiple native (raw)
> backlight devices registered.
> 
> Specifically gnome-settings-daemon expects the parent device to have
> an "enabled" sysfs attribute (as drm_connector devices do) and tests
> that this returns "enabled" when read.
> 
> This aligns the parent of the backlight device with i915, nouveau, radeon.
> Note that drivers/gpu/drm/amd/amdgpu/atombios_encoders.c also already
> uses the drm_connector as parent, only amdgpu_dm.c used the PCI device
> as parent before this change.
> 
> Changes in v2:
> Together with changing the parent, also move the registration to
> drm_connector_funcs.late_register() this is necessary because the parent
> device (which now is the drm_connector) must be registered before
> the backlight class device is, otherwise the backlight class device ends
> up without any parent set at all.
> 
> This brings the backlight class device registration timing inline with
> nouveau and i915 which also use drm_connector_funcs.late_register()
> for this.
> 
> Note this slightly changes backlight_device_register() error handling,
> instead of not increasing dm->num_of_edps and re-using the current
> bl_idx for a potential other backlight device, dm->backlight_dev[bl_idx]
> is now simply left NULL on failure. This is ok because all code
> looking at dm->backlight_dev[i] also checks it is not NULL.
> 
> Link: https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Self nack, the amdgpu_dm_register_backlight_device() call in
amdgpu_dm_connector_late_register() leads to the driver now
trying to register a backlight class device for each connector
(I hit this on my AMD APU based desktop machine).

I'll prepare a non RFC version with this fixed.

Regards,

Hans



> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 038bf897cc28..051074d5812f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4162,7 +4162,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
>  		 drm->primary->index + aconnector->bl_idx);
>  
>  	dm->backlight_dev[aconnector->bl_idx] =
> -		backlight_device_register(bl_name, drm->dev, dm,
> +		backlight_device_register(bl_name, aconnector->base.kdev, dm,
>  					  &amdgpu_dm_backlight_ops, &props);
>  
>  	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
> @@ -4232,13 +4232,6 @@ static void setup_backlight_device(struct amdgpu_display_manager *dm,
>  
>  	amdgpu_dm_update_backlight_caps(dm, bl_idx);
>  	dm->brightness[bl_idx] = AMDGPU_MAX_BL_LEVEL;
> -
> -	amdgpu_dm_register_backlight_device(aconnector);
> -	if (!dm->backlight_dev[bl_idx]) {
> -		aconnector->bl_idx = -1;
> -		return;
> -	}
> -
>  	dm->backlight_link[bl_idx] = link;
>  	dm->num_of_edps++;
>  
> @@ -6297,6 +6290,8 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>  		to_amdgpu_dm_connector(connector);
>  	int r;
>  
> +	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
> +
>  	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
>  	    (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
>  		amdgpu_dm_connector->dm_dp_aux.aux.dev = connector->kdev;

