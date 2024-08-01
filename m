Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0A944715
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 10:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EC210E8BE;
	Thu,  1 Aug 2024 08:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ljqf24vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AD910E8BE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722502382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23VtBrMdg+e86oIyAKkk0gIRsQUKPk9UYAypqYqSedk=;
 b=Ljqf24vxjPQof20deHOgFN12wTz2Hq17rSXZGNgSvp5CsUx4FLshZVOA+SsxaoPCQM18li
 x+W+chWZuuIdnWniTK9qmSg4YEpS4tltHRbAviXJzMD2sRQfw1jj3vVhv+FOXoElmckCla
 srb8eYsLf/6N74b9lpgSc8ItKzqNDV8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-3GOrauS6Pg-Xk2YC_xnAbg-1; Thu, 01 Aug 2024 04:52:59 -0400
X-MC-Unique: 3GOrauS6Pg-Xk2YC_xnAbg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ef3157ae4cso70722431fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 01:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722502378; x=1723107178;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=23VtBrMdg+e86oIyAKkk0gIRsQUKPk9UYAypqYqSedk=;
 b=ROkM6TOTw5jUBiNX4lGBu6sRkW2Fjk0PAw4WJkqKH8+xtwMm73cc5aqkugJghwixWH
 7CutaLAcMa3KXB4ByLmEsMQBfiEPEL8vh3NkDH/W1PBbn+Fnbw/WnACyUrnje9CSyCDU
 uJQ+uqsia5Mz+/EckshQaYTaqBQlziDmQIs1N9hWkoyVPq0Cx0LQ9qdT3F3wx5kSwojQ
 C9tWwhzkANf9aJFkd8LkWcza1L6HFWMSoE8nvhyMj1ZCmbeBtY3cJNkWTD97KsSodQMG
 BjfpsB/3G7DAOUHyUnwCdofp4/1fycGboAE6bsSD4iqlNSpung57ZTOru6MSawjjyGYy
 ohYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGIs314yoxlvLETlWnk0Imr5qz74vayZwwR2Dp7ikajz+43kFzKdyCwAefbi9/ecgNzOTa8tjJxtHnOgoKUDbLOMSIBvVrA/zxhPfZ1P0M
X-Gm-Message-State: AOJu0YykXoUYlrE/W9FJGe2B9SpZ+At3OalRQ6T02HHKLtoRf2DhuA1w
 Gl5EX2JvEDqedC7sFyYGk0LDYp718zg/rqH4J4d6BAYrdBKT61Yei5qD4njiD9jeHHBdFyIZRpU
 eTydmLOPJo3RTYpzGnMg6wABL5MGrD5KTAaxImU5YmjCAA9mrhusna3kU81N++dnHhw==
X-Received: by 2002:ac2:418b:0:b0:52f:cd03:a84a with SMTP id
 2adb3069b0e04-530b61fe66cmr1079616e87.39.1722502377727; 
 Thu, 01 Aug 2024 01:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+DWDFB+/d/kjlinqEN/i6kFpt+27w9S7EzOyAXbtiCJaTdardj0Qe5rVEEOq7V/Tw17rWNA==
X-Received: by 2002:ac2:418b:0:b0:52f:cd03:a84a with SMTP id
 2adb3069b0e04-530b61fe66cmr1079590e87.39.1722502377087; 
 Thu, 01 Aug 2024 01:52:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb8278sm861717666b.202.2024.08.01.01.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 01:52:56 -0700 (PDT)
Message-ID: <1b4bfb81-339d-4582-873c-c720c82c8ba7@redhat.com>
Date: Thu, 1 Aug 2024 10:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm: minimum backlight overrides and
 implementation for amdgpu
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>
References: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
 <87v80lwjcz.fsf@intel.com> <Zqqku_zS7CpPGbzW@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zqqku_zS7CpPGbzW@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi,

On 7/31/24 10:55 PM, Daniel Vetter wrote:
> On Wed, Jul 31, 2024 at 08:40:12PM +0300, Jani Nikula wrote:
>> On Wed, 31 Jul 2024, Thomas Weißschuh <linux@weissschuh.net> wrote:
>>> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
>>> is "12". This leads to a fairly bright minimum display backlight.
>>>
>>> Add a generic override helper for the user to override the settings
>>> provided by the firmware through the kernel cmdline.
>>> Also add amdgpu as a user of that helper.
>>>
>>> One solution would be a fixed firmware version, which was announced but
>>> has no timeline.
>>
>> The flip side is that if we add this now, it pretty much has a timeline:
>> We'll have to carry and support it forever.
>>
>> It's not a great prospect for something so specific. Not to mention that
>> the limits are generally there for electrical minimums that should not
>> be overridden. And before you know it, we'll have bug reports about
>> flickering screens...
> 
> Yeah I think for this specific case where a fixed firmware is already
> kinda promised, a quirk is the right fix. Otherwise we open up a can of
> worms here ... so personally I like v2 a lot more.
> -Sima

Ok, with both Jani and Sima preferring the quirk approach from v2,
I withdraw my objection against v2. So lets go with that version.

Thomas, sorry about this.

I see that other then a remark from Jeff Johnson about a missing
MODULE_DESCRIPTION() v2 does not have any reviews yet though.

So we will need to review that version now. Might be best for
visibility of the patches in people's review queue to repost
v2 as v4 with the MODULE_DESCRIPTION() fixed ?

Regards,

Hans



>>> This helper does conflict with the mode override via the cmdline.
>>> Only one can be specified.
>>> IMO the mode override can be extended to also handle "min-brightness"
>>> when that becomes necessary.
>>>
>>> ---
>>> Changes in v3:
>>> - Switch to cmdline override parameter
>>> - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net
>>>
>>> Changes in v2:
>>> - Introduce proper drm backlight quirk infrastructure
>>> - Quirk by EDID and DMI instead of only DMI
>>> - Limit quirk to only single Framework 13 matte panel
>>> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
>>>
>>> ---
>>> Thomas Weißschuh (2):
>>>       drm/connector: add drm_connector_get_cmdline_min_brightness_override()
>>>       drm/amd/display: implement minimum brightness override
>>>
>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++++
>>>  drivers/gpu/drm/drm_connector.c                   | 34 +++++++++++++++++++++++
>>>  include/drm/drm_connector.h                       |  2 ++
>>>  3 files changed, 42 insertions(+)
>>> ---
>>> base-commit: 36821612eb3091a21f7f4a907b497064725080c3
>>> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
>>>
>>> Best regards,
>>
>> -- 
>> Jani Nikula, Intel
> 

