Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D3A4B6445
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9385310E398;
	Tue, 15 Feb 2022 07:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F16810E14D;
 Tue, 15 Feb 2022 04:03:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id A6AEC1F43572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644897824;
 bh=VG0gC/LlBYOoQhn5utxIdgmPSt7IfHbptUv0GV7NTBo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Ub6dmZitRz45cR9qIKXjTsVXU7KmUgK7H9oGw3VoIqMVy2lNgKyINSxJJ4Mxa9LeQ
 OSnaNgDQeenPnKVsHAu7FJW2ksmbmmFKxFZ9DhHBEOytGwf5+mTHiU3/rYyeYKZgAI
 353erPgVFDlsdFJrWkpczRGLtWgrEDwEWidKsuTfjbzacs2ubqbjvCv53HpQkQgTDO
 sveWRuEs68cTQpVqRLx8QCaXWu0m6E77IzTClO5SoAIoZgIg7biB2Noa4C7YbpiD3/
 +EhnyHcdKXZg/HDB7nczR4ihB2+cz0qN/2Cx4c4omJOGZErQyt9d55dDNGrym2WOmM
 PBwrKU+TudUGg==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v8 1/3] gpu: drm: separate panel orientation property
 creating and value setting
Organization: Collabora
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <87leydhqt3.fsf@collabora.com>
 <CAJMQK-igpiYj-pkgG9amrQuVzf1Mc9BDDOwOdKLUbceKr=CHiQ@mail.gmail.com>
Date: Mon, 14 Feb 2022 23:03:39 -0500
In-Reply-To: <CAJMQK-igpiYj-pkgG9amrQuVzf1Mc9BDDOwOdKLUbceKr=CHiQ@mail.gmail.com>
 (Hsin-Yi Wang's message of "Tue, 15 Feb 2022 11:15:02 +0800")
Message-ID: <87czjoixno.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 15 Feb 2022 07:25:06 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hsin-Yi Wang <hsinyi@chromium.org> writes:

> On Tue, Feb 15, 2022 at 9:17 AM Gabriel Krisman Bertazi
> <krisman@collabora.com> wrote:
>>
>> Hsin-Yi Wang <hsinyi@chromium.org> writes:
>>
>> > drm_dev_register() sets connector->registration_state to
>> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
>> > drm_connector_set_panel_orientation() is first called after
>> > drm_dev_register(), it will fail several checks and results in following
>> > warning.
>>
>> Hi,
>>
>> I stumbled upon this when investigating the same WARN_ON on amdgpu.
>> Thanks for the patch :)
>>
>> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> > index a50c82bc2b2fec..572ead7ac10690 100644
>> > --- a/drivers/gpu/drm/drm_connector.c
>> > +++ b/drivers/gpu/drm/drm_connector.c
>> > @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>> >   *   INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
>> >   *   coordinates, so if userspace rotates the picture to adjust for
>> >   *   the orientation it must also apply the same transformation to the
>> > - *   touchscreen input coordinates. This property is initialized by calling
>> > + *   touchscreen input coordinates. This property value is set by calling
>> >   *   drm_connector_set_panel_orientation() or
>> >   *   drm_connector_set_panel_orientation_with_quirk()
>> >   *
>> > @@ -2341,8 +2341,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>> >   * @connector: connector for which to set the panel-orientation property.
>> >   * @panel_orientation: drm_panel_orientation value to set
>> >   *
>> > - * This function sets the connector's panel_orientation and attaches
>> > - * a "panel orientation" property to the connector.
>> > + * This function sets the connector's panel_orientation value. If the property
>> > + * doesn't exist, it will try to create one.
>> >   *
>> >   * Calling this function on a connector where the panel_orientation has
>> >   * already been set is a no-op (e.g. the orientation has been overridden with
>> > @@ -2373,19 +2373,12 @@ int drm_connector_set_panel_orientation(
>> >       info->panel_orientation = panel_orientation;
>> >
>> >       prop = dev->mode_config.panel_orientation_property;
>> > -     if (!prop) {
>> > -             prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
>> > -                             "panel orientation",
>> > -                             drm_panel_orientation_enum_list,
>> > -                             ARRAY_SIZE(drm_panel_orientation_enum_list));
>> > -             if (!prop)
>> > -                     return -ENOMEM;
>> > -
>> > -             dev->mode_config.panel_orientation_property = prop;
>> > -     }
>> > +     if (!prop &&
>> > +         drm_connector_init_panel_orientation_property(connector) < 0)
>> > +             return -ENOMEM;
>> >
>>
>> In the case where the property has not been created beforehand, you
>> forgot to reinitialize prop here, after calling
>> drm_connector_init_panel_orientation_property().  This means
> hi Gabriel,
>
> drm_connector_init_panel_orientation_property() will create prop if
> it's null. If prop fails to be created there, it will return -ENOMEM.

Yes.  But *after the property is successfully created*, the prop variable is still
NULL.  And then you call the following, using prop, which is still NULL:

>> > +     drm_object_property_set_value(&connector->base, prop,
>> > +                                   info->panel_orientation);

This will do property->dev right on the first line of code, and dereference the
null prop pointer.

You must do

  prop = dev->mode_config.panel_orientation_property;

again after drm_connector_init_panel_orientation_property successfully
returns, or call drm_object_property_set_value using
dev->mode_config.panel_orientation_property directly:

  drm_object_property_set_value(&connector->base,
			dev->mode_config.panel_orientation_property
		        info->panel_orientation);

-- 
Gabriel Krisman Bertazi
