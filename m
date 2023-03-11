Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF16B5A92
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 11:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7846910E09E;
	Sat, 11 Mar 2023 10:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E3110E09E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678531201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMVyit9KoTVwnZdvsgo8VYbd90GtcYARP5wwOTF3/G4=;
 b=XIQRbQ0CIWKgAv/Z6KyBGMCaVfTAwlZ74TmsPlrcW5+CjGdWU1CidRiSNey56i8qiAe8B7
 /RPWbjqXWXzPKa5F3WFY3U0MeLrRUijYZfFSE6SU4fjOQ1BqMUeYyOhH478vBqpTEZGlqq
 OJl47FW1Gk232/cp6O4TUchPqj5B8X0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-utolzaLoOOOb3h3trf75AA-1; Sat, 11 Mar 2023 05:40:00 -0500
X-MC-Unique: utolzaLoOOOb3h3trf75AA-1
Received: by mail-ed1-f70.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso10929576edb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 02:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678531199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nMVyit9KoTVwnZdvsgo8VYbd90GtcYARP5wwOTF3/G4=;
 b=nyxBcaF0I5sqWuG5DJQP7yAqN7cNmJvNU3WR6RG+NR/tjZG2PJMsom86eH4yiVCdGE
 VkUc+NZCtx3Dg1WnwgKT1zN84H4F0BXY3LhapDxeQLdO7vqmDyto3hETAoHizri6a2B+
 O+NZWqNZHXAT9+ZiYmfFtvH1CTsc4U57QgYomlogXHlPpIZ5sERJlW5gaYp7cVZiH+a4
 2T+WrYupoGLJvIMGqcjFUTu31rWAjF3S/YBOrQV4y4Kj4WO4IDzt0XLawAvUJbrv/gBZ
 Q41uy7TPMmqwsth9vBrRGRD0o7Neh+F0aNr4yvE5J7T1pp75wmmwU4jgV2oF97VwZPwy
 iN1A==
X-Gm-Message-State: AO0yUKVMpo2BEkYwJm3vzmIDbgEf5bRZ0y5f94s6d5JIZWv4yRm/vjHP
 07QW7sx0JF0LHR/F5cRBTH0jfnRUomz7soYjwnuw24I4gu1F55nIQZDZhrL58nrBBha+vWAYWhv
 XsNkEFHDBlZUvx5gKTnq1cRs28sEg
X-Received: by 2002:a17:906:1481:b0:8b1:7ae8:ba6f with SMTP id
 x1-20020a170906148100b008b17ae8ba6fmr27001884ejc.16.1678531199076; 
 Sat, 11 Mar 2023 02:39:59 -0800 (PST)
X-Google-Smtp-Source: AK7set910RS+EXo716Ddx3LyA/RnltmgjANkhTbuK3TVY0iwKhD3ubwTYgFFgCFRquhY4jeR2NJZZw==
X-Received: by 2002:a17:906:1481:b0:8b1:7ae8:ba6f with SMTP id
 x1-20020a170906148100b008b17ae8ba6fmr27001869ejc.16.1678531198815; 
 Sat, 11 Mar 2023 02:39:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a17090674ca00b008c327bef167sm980894ejl.7.2023.03.11.02.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Mar 2023 02:39:58 -0800 (PST)
Message-ID: <95d4a9f4-9389-f1ee-44e7-44fd6571cb2c@redhat.com>
Date: Sat, 11 Mar 2023 11:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 0/6] drm/amd/display: Pass proper parent for DM backlight
 device v2
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
References: <20230308215831.782266-1-hdegoede@redhat.com>
 <6fd35bd4-4edf-575c-8875-1cb256f414d5@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6fd35bd4-4edf-575c-8875-1cb256f414d5@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 3/10/23 23:12, Rodrigo Siqueira Jordao wrote:
> Hi Hans,
> 
> Which AMD device do you have available for testing this series?

As mentioned in a reply to the cover-letter (should have been
in the cover-letter itself but I forgot, sorry. I don't have
any hw to test this which is why this was marked as a RFC.

In the mean time 2 reporters of:

https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730

who have affected hw hitting the changed code paths have
confirmed that this series works and that the correct
parent now gets set.

So as I also already mentioned in a reply to the cover-letter (1):

this series no longer is RFC, but is ready for merging (from my pov) now.

> P.s.: If you have a new version of this series, could you also Cc me?

Sure, although atm I see no need to do a new version, please consider
this a non RFC submission now and review it. If the review leads to
changes being requested then I'll prepare a new version and Cc you.

Regards,

Hans



1) Next time mayvw read the entire thread before replying ?








> On 3/8/23 14:58, Hans de Goede wrote:
>> Hi All,
>>
>> Here is version 2 of my patch series to pass the proper parent device
>> to backlight_device_register().
>>
>> New in version 2 is delaying the registering of the backlight_dev till
>> after the drm_connector is registered by doing it from
>> drm_connector_funcs.late_register.
>>
>> This involves first reworking the code a bit to allow delaying
>> the registering, so this has turned from a single patch into
>> a 6 patch set.
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (6):
>>    drm/amd/display/amdgpu_dm: Fix backlight_device_register() error
>>      handling
>>    drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
>>    drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
>>    drm/amd/display/amdgpu_dm: Move most backlight setup into
>>      setup_backlight_device()
>>    drm/amd/display/amdgpu_dm: Make amdgpu_dm_register_backlight_device()
>>      take an amdgpu_dm_connector
>>    drm/amd/display: Pass proper parent for DM backlight device
>>      registration v2
>>
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 99 ++++++++-----------
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>>   2 files changed, 44 insertions(+), 56 deletions(-)
>>
> 

