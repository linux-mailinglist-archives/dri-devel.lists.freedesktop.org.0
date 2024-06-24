Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBD9145EA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43B010E3C3;
	Mon, 24 Jun 2024 09:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HiQVpa3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D249910E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719220304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErgW8/xgdLyfmI5cJrGORyHP2zU+pAlRQp1PB0ZkxTk=;
 b=HiQVpa3rK8mqC23q+TsrjdLOOKVZzUk1Mqga6DgJsuDGv2DtjiBCuMYNW+9eZvhDTr14rM
 lUQ1B5ttiTHpaTvoyAOrWVFUv4MF5FaJhipswRj/Nk4Kn752/4j3GRug0Hohhw6gf0Fo8z
 d/PgVjJFQUmjdOxA2/D7mfYxwTD1xG0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-P4EeieGjOcufdrjL44xfuQ-1; Mon, 24 Jun 2024 05:11:43 -0400
X-MC-Unique: P4EeieGjOcufdrjL44xfuQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a725c45ab1dso26869666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719220302; x=1719825102;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ErgW8/xgdLyfmI5cJrGORyHP2zU+pAlRQp1PB0ZkxTk=;
 b=ejPKuGmwkdRemAk+9iXA6L8UfgU2fE558u8wyFzO9rpXiunlyUNHS0R0Mtz8GQj2PJ
 MeOssZ5aEpMPXgVNvOR/g8SjsTDrmrbyYCO/LT8TxH/VnBiJmFgOSZLdv633gQXvWJ/v
 6e1qyTTWWOe94h6VpPs1j6clUyZDnvA4/mmv/ln/Z541B9nLsKg/GhK3HRih+PN/4eyz
 41/w1Hm7lpjLyO2XnMqg7OaVGeWodRjYi6mXHz35Ofl9u6TVFc1P5lXABe+z2z9OKPkq
 i33Fv44qi4ssshe0aCpz/VKXhYMcHik4ZClPLxAy4b9BDRkMX+RXXcSzrEtUx0xSjnOA
 TOxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo50JWjopENReZTz18ilg6On4IJa2CMCF54kIePjh+lCGimaSpyd6DbClNGJRWX7M7Tz+0QfJ9MYbBkV14UI1yK+PqA3pPLEdaXIw2Pf5B
X-Gm-Message-State: AOJu0YxNHO2bh+YNuZaWkaoA/GK6KhjdJw+mmu2LBdpkay1V7VPY1Dqv
 kBzCFk97BX5E0Cvd8mNN2/CW7p6jfzNHQLdjqDG2DJqAW1HUcFCKuTvkL7RU2ql1U15J2DmwHg2
 C0ZuXaLfjER+jVjbltuHNrz9vI21v2EU7+WA5cuwXLTZMjhzxmDq1MgUXvJNTcLdARw==
X-Received: by 2002:a17:907:a4c7:b0:a6f:e529:adb5 with SMTP id
 a640c23a62f3a-a7242cda444mr308028466b.59.1719220302088; 
 Mon, 24 Jun 2024 02:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpXhX65y/eEgnqmxmhrILCZeKBPWwjJ3mqC0cJrNbEb9IYgalqCzN12PcHySrt/9UUtCFQLQ==
X-Received: by 2002:a17:907:a4c7:b0:a6f:e529:adb5 with SMTP id
 a640c23a62f3a-a7242cda444mr308025766b.59.1719220301659; 
 Mon, 24 Jun 2024 02:11:41 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7261f7ffa1sm3818666b.67.2024.06.24.02.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:11:41 -0700 (PDT)
Message-ID: <e61010e4-cb49-44d6-8f0d-044a193d29b2@redhat.com>
Date: Mon, 24 Jun 2024 11:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm: backlight quirk infrastructure and lower
 minimum for Framework AMD 13
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Thomas,

On 6/23/24 10:51 AM, Thomas Weißschuh wrote:
> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> is "12". This leads to a fairly bright minimum display backlight.
> 
> Add a generic quirk infrastructure for backlight configuration to
> override the settings provided by the firmware.
> Also add amdgpu as a user of that infrastructure and a quirk for the
> Framework 13 matte panel.
> Most likely this will also work for the glossy panel, but I can't test
> that.
> 
> One solution would be a fixed firmware version, but given that the
> problem exists since the release of the hardware, it has been known for
> a month that the hardware can go lower and there was no acknowledgment
> from Framework in any way, I'd like to explore this alternative
> way forward.

There are many panels where the brightness can go lower then the advertised
minimum brightness by the firmware (e.g. VBT for i915). For most users
the minimum brightness is fine, especially since going lower often may lead
to an unreadable screen when indoors (not in the full sun) during daylight
hours. And some users get confused by the unreadable screen and find it
hard to recover things from this state.

So IMHO we should not be overriding the minimum brightness from the firmware
using quirks because:

a) This is going to be an endless game of whack-a-mole
b) The new value may be too low for certain users / use-cases

With that said I realize that there are also many users who want to have
a lower minimum brightness value for use in the evening, since they find
the available minimum value still too bright. I know some people want this
for e.g. various ThinkPad models too.

So rather then quirking this, with the above mentioned disadvantages I believe
that it would be better to extend the existing video=eDP-1:.... kernel
commandline parsing to allow overriding the minimum brightness in a driver
agnostic way.

The minimum brightness override set this way will still need hooking up
in each driver separately but by using the video=eDP-1:... mechanism
we can document how to do this in driver independent manner. since
I know there have been multiple requests for something like this in
the past I believe that having a single uniform way for users to do this
will be good.

Alternatively we could have each driver have a driver specific module-
parameter for this. Either way I think we need some way for users to
override this as a config/setting tweak rather then use quirks for this.

Regards,

Hans






> 
> Notes:
> 
> * Should the quirk infrastructure be part of drm_edid.c?
> * The current allocation of struct drm_edid in amdgpu is bad.
>   But it is done the same way in other parts of amdgpu.
>   I do have patches migrating amdgpu to proper usage of struct drm_edid [0]
> 
> Mario:
> 
> I intentionally left out the consideration of the firmware version.
> The quirk will stay correct even if the firmware starts reporting
> correct values.
> If there are strong opinions it would be easy to add, though.
> 
> Based on amdgpu/drm-next.
> 
> [0] https://lore.kernel.org/lkml/20240616-amdgpu-edid-bios-v1-1-2874f212b365@weissschuh.net/
> 
> ---
> Changes in v2:
> - Introduce proper drm backlight quirk infrastructure
> - Quirk by EDID and DMI instead of only DMI
> - Limit quirk to only single Framework 13 matte panel
> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> 
> ---
> Thomas Weißschuh (3):
>       drm: Add panel backlight quirks
>       drm: panel-backlight-quirks: Add Framework 13 matte panel
>       drm/amd/display: Add support backlight quirks
> 
>  Documentation/gpu/drm-kms-helpers.rst             |  3 +
>  drivers/gpu/drm/Kconfig                           |  4 ++
>  drivers/gpu/drm/Makefile                          |  1 +
>  drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++
>  drivers/gpu/drm/drm_panel_backlight_quirks.c      | 76 +++++++++++++++++++++++
>  include/drm/drm_utils.h                           | 11 ++++
>  7 files changed, 124 insertions(+)
> ---
> base-commit: 1ecef5589320fd56af599b624d59c355d162ac7b
> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> 
> Best regards,

