Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114C6B04D5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D2E10E0F1;
	Wed,  8 Mar 2023 10:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9AE10E10A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678272132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXwtob7mHiGV/HDAwC/8VbKaxcTJLMG7xjqq8FDlVMk=;
 b=EJvtgMfy1uDXtOH8Dves4jYfV9vfpTSQKR3JMUaU5RDPuBpwhWKmy7j6/d8pZvcx+FOWiG
 FKwnTMLRK5vJY9QX+pEzhAnGxXs2+2xd5BtY0neHtREeirR2lZaIe0+7uE08YAdZ9EKedL
 wRbS9ZpMD0Mi1/x9XFuXdMSPu1eA2TU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-NdUdLpDVNZunWGc2xzNH-A-1; Wed, 08 Mar 2023 05:42:11 -0500
X-MC-Unique: NdUdLpDVNZunWGc2xzNH-A-1
Received: by mail-ed1-f72.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso23265357edb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 02:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678272130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXwtob7mHiGV/HDAwC/8VbKaxcTJLMG7xjqq8FDlVMk=;
 b=EaUhb4ls8y2Ke3avZJrz9APv04dbnWvOi3dFqcOkdBV+OnqLhE6DJEt/fe3l4cBb6l
 FsrSunuvNCOXAnLrcOsNz3FWmdIaAhZgjQ/zfEBJ1idpOc+g6ZzfClYE66BLOD3RJ6u5
 sbHJ5AWpshC7yWJGKFDfv5OwOZ9YpnrAcZERUqnOtc9EbXg7zKPRS5X3fA4Czu8Zbffs
 vaxqi140Evt6bl+w4XLmp4tU1zfnwgsWKO+eNJFcjf5fWziieAY4EKY4uuPCxam7+q4l
 hj3cKcyU82bScqNAA11bgkqOGz8eOnnD7kUhi2Q602ostfBDtw41gtzbjRs7vi0AUmQt
 sogg==
X-Gm-Message-State: AO0yUKWFQhVciitjN1WQdP5xAPzs55vSaDenvI4lSzAXSC8T1wlbT/gg
 sWm4JIsLoB5pzEz7mQpuhsjO4RmrIf1iw3MTcQFFzvbBe8Brq+VHM+2BE8CHd6wOtMzpt80Bf6W
 5nU1gGzi/MCVAiu1oO5fBsJo0fAGu
X-Received: by 2002:a17:906:3002:b0:8b2:fb3d:9f22 with SMTP id
 2-20020a170906300200b008b2fb3d9f22mr16818135ejz.33.1678272123539; 
 Wed, 08 Mar 2023 02:42:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9MuC60mZ5Ycylm2kSUYIx4Veowf3DJRuxRTVdYipVCktABmp02rpAjKlcUcnC2sPx4jWcbDA==
X-Received: by 2002:a17:906:3002:b0:8b2:fb3d:9f22 with SMTP id
 2-20020a170906300200b008b2fb3d9f22mr16818121ejz.33.1678272123295; 
 Wed, 08 Mar 2023 02:42:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906309500b008b1779ba3c1sm7275516ejv.115.2023.03.08.02.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 02:42:02 -0800 (PST)
Message-ID: <b64a6aa0-bae9-71bc-7672-18481daf963f@redhat.com>
Date: Wed, 8 Mar 2023 11:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC] drm/amd/display: Pass proper parent for DM backlight device
 registration
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20230215113833.477999-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230215113833.477999-1-hdegoede@redhat.com>
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

On 2/15/23 12:38, Hans de Goede wrote:
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
> Note this is marked as a RFC because I don't have hw to test, so this
> has only been compile tested! If someone can test this on actual
> hw which hits the changed code path that would be great.
> 
> Link: https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Self NACK. This has been tested by 2 reporters of:

https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730

Now and it does not work. Instead of setting the parent device pointer correctly,
this makes the backlight device not have a parent device any more at all.
I already was afraid this might happen, since the drm_connector object is not yet
registered at the time when the amdgpu code calls backlight_device_register().

Other drivers like e.g. nouveau register the backlight later from
a drm_connector_funcs.late_register callback. I was hoping doing it
the simple way as this patch did would work, but it looks like some bigger
changes to the amdgpu code (using a drm_connector_funcs.late_register callback)
are necessary.

I'll try to make some time to prepare a new patch.

Regards,

Hans



> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 31bce529f685..33b0e1de2770 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4065,7 +4065,8 @@ static const struct backlight_ops amdgpu_dm_backlight_ops = {
>  };
>  
>  static void
> -amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
> +amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm,
> +				    struct amdgpu_dm_connector *aconnector)
>  {
>  	char bl_name[16];
>  	struct backlight_properties props = { 0 };
> @@ -4088,7 +4089,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
>  		 adev_to_drm(dm->adev)->primary->index + dm->num_of_edps);
>  
>  	dm->backlight_dev[dm->num_of_edps] = backlight_device_register(bl_name,
> -								       adev_to_drm(dm->adev)->dev,
> +								       aconnector->base.kdev,
>  								       dm,
>  								       &amdgpu_dm_backlight_ops,
>  								       &props);
> @@ -4141,6 +4142,7 @@ static int initialize_plane(struct amdgpu_display_manager *dm,
>  
>  
>  static void register_backlight_device(struct amdgpu_display_manager *dm,
> +				      struct amdgpu_dm_connector *aconnector,
>  				      struct dc_link *link)
>  {
>  	if ((link->connector_signal & (SIGNAL_TYPE_EDP | SIGNAL_TYPE_LVDS)) &&
> @@ -4151,7 +4153,7 @@ static void register_backlight_device(struct amdgpu_display_manager *dm,
>  		 * is better then a black screen.
>  		 */
>  		if (!dm->backlight_dev[dm->num_of_edps])
> -			amdgpu_dm_register_backlight_device(dm);
> +			amdgpu_dm_register_backlight_device(dm, aconnector);
>  
>  		if (dm->backlight_dev[dm->num_of_edps]) {
>  			dm->backlight_link[dm->num_of_edps] = link;
> @@ -4337,7 +4339,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>  
>  			if (ret) {
>  				amdgpu_dm_update_connector_after_detect(aconnector);
> -				register_backlight_device(dm, link);
> +				register_backlight_device(dm, aconnector, link);
>  
>  				if (dm->num_of_edps)
>  					update_connector_ext_caps(aconnector);

