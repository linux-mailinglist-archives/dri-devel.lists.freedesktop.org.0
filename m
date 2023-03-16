Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DCB6BD2E4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 16:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744FD10E0BE;
	Thu, 16 Mar 2023 15:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B789710E216
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678978973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jY8tzGQNjdwb5AV1ogYiu/Q7DYs826VwBy6MyVJ9bVQ=;
 b=R8FOlTxoeVKSkWPMAbNH0o9CVJf7tAFaMsHO6p3Bs+ZQbmxfVo9IJakc5rWqKwE9xZZFSg
 HEgXXBXiXVoJYX2kxsmVG7xqw4Ixo8voPOpIjuy97YsF+7ANHNhesgYgrTLP0R0CnfTSVy
 BtRcMWABiWE2PumEPaaSVHjDJCexkRI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-8QgbGt_mMoWHJdnARsncrA-1; Thu, 16 Mar 2023 11:02:51 -0400
X-MC-Unique: 8QgbGt_mMoWHJdnARsncrA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so3460916eda.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 08:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678978970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jY8tzGQNjdwb5AV1ogYiu/Q7DYs826VwBy6MyVJ9bVQ=;
 b=rtW85oM3lkJ1TiMvNDRvg1/rnehFhMoBRecLvR7lJe5DtdzrI5EESjWYS/Z4OP06Kn
 ZiREXI/ItEvj/3RzLyiQ/VPgc02r819GfVkXAqswx9qHdzuWmkTyzEtXywcGL5B5hk/8
 JfAnmYGn9YcAdRA614/VYDhjSdo/BuGEo6sjlcRRGgn6fjwCqNpxT3QS/VpvpXx7vfIF
 3sNME13m1YDNM4bCRL3Bcdk4wmy2jnCwW/lDZIe3QffrDAPRwkwMCQrm82G27OZ3DboX
 r5i7Q/e9MpDCmtNSCBa7r0IdwHTNKFztYElgGevLPGewGXXdikrIRLVwsLkFQPnHKCL4
 18Mw==
X-Gm-Message-State: AO0yUKWnB8IY/8eGmZDs6ZIK7zIFtwW9nOVwxt3Ex7UO25uCiGtCr3p8
 3zXNW+GZ/nfQFAsp+/E4/yTN9X6bQ+L22kGDdd1/NrFJHpxWg9z+i5ggJLntYlIA98AO35OWXvf
 hhUkbcFKbOlLow9bAzKmqmZxAffuR
X-Received: by 2002:a05:6402:1650:b0:4ac:d34b:c2a9 with SMTP id
 s16-20020a056402165000b004acd34bc2a9mr6897122edx.14.1678978970816; 
 Thu, 16 Mar 2023 08:02:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set8YIksd4HCeq7ROKhIXx9rVRRqIRT5xMR2tx6p6M225OXzzg0V8axX03pMoite5dmf9wPYmkA==
X-Received: by 2002:a05:6402:1650:b0:4ac:d34b:c2a9 with SMTP id
 s16-20020a056402165000b004acd34bc2a9mr6897101edx.14.1678978970573; 
 Thu, 16 Mar 2023 08:02:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a509b42000000b004e48f8df7e2sm3914730edj.72.2023.03.16.08.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 08:02:50 -0700 (PDT)
Message-ID: <2251e54e-5524-ba99-690a-9e8324cf112b@redhat.com>
Date: Thu, 16 Mar 2023 16:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/6] drm/amd/display: Pass proper parent for DM
 backlight device v3
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
References: <20230312191751.183450-1-hdegoede@redhat.com>
 <9e79184f-8894-8773-3a30-d35d0cf36b13@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9e79184f-8894-8773-3a30-d35d0cf36b13@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/16/23 15:57, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 3/12/23 13:17, Hans de Goede wrote:
>> Hi All,
>>
>> Here is version 3 of my patch series to pass the proper parent device
>> to backlight_device_register().
>>
>> Changes in v3:
>> - Make amdgpu_dm_register_backlight_device() check bl_idx != 1 before
>>    registering the backlight since amdgpu_dm_connector_late_register()
>>    now calls it for _all_ connectors.
>>
>> Changes in v2:
>> - Patches 1 - 5 are new, reworking the code a bit to allow delaying
>>    the registering, so this has turned from a single patch into
>>    a 6 patch set.
>> - Patch 6 now delays the registering of the backlight_dev till
>>    after the drm_connector is registered by doing it from
>>    drm_connector_funcs.late_register.
>>
>> Note this no longer is RFC since this has been successfully
>> tested on 3 laptops which hit the affected code path.
>>
>> Version 3 has also been tested on my personal AMD Ryzen 7 5700G APU
>> desktop machine and now no longer tries to register a backlight
>> device for each connector there.
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
>>    drm/amd/display/amdgpu_dm: Pass proper parent for backlight device
>>      registration v3
>>
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 100 ++++++++----------
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
>>   2 files changed, 46 insertions(+), 55 deletions(-)
>>
> 
> Hi,
> 
> First of all, thanks a lot for this patchset.
> 
> I run your series in our CI (IGT-based), and I also conducted some manual tests in my ASICs. Everything looks fine.
> 
> I also reviewed this series, and it LGTM:
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> Finally, I pushed it to amd-staging-drm-next.

Great, thank you.

Regards,

Hans


