Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51E76B1EB9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A1F10E167;
	Thu,  9 Mar 2023 08:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C3810E7AE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iz+YxaxbQLLfNssBhmL+3wl9ODU3eDTosuVxq/5D9Ek=;
 b=i68iO4lITRj0DDYeeP5nfP6ONGPFGG8tJo10B3GGfKQaxfta8e95ApG7WxmSXuCpjZfb6L
 7BI+AEw2E61uLYL1NnTPEWaAyOqt7d/2sxkuG4yPg8uQCSu8iATCmfRD9m0KvAzRB5dX+l
 GfHCoAyXl3rpBl2US0yyEkTYqidl8E0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-0OOHbcSxMkOzU9gQblKIpg-1; Thu, 09 Mar 2023 03:51:47 -0500
X-MC-Unique: 0OOHbcSxMkOzU9gQblKIpg-1
Received: by mail-ed1-f71.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so1900902edb.21
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 00:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351906;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iz+YxaxbQLLfNssBhmL+3wl9ODU3eDTosuVxq/5D9Ek=;
 b=7W3TtwBUPD8UtcondP5Vqleiifup1OV6iOTQRVB0MZdwBppSk+n8C3Xya69TCOXTbJ
 +YWfQSd6xnFPzPCA8/YoCSBF7SnsD9bAs5Lmt4wxnLAafpZdaB7XQlzGXq/oAtNUoVDR
 mJ6xujb9uoipNJwVX2IC9sYhbmSBNDSWSVMFBaZj8YYQKPsh0tbJe2uMbDfrLyT7NIUH
 gRqTJqM2IeePwJVKtdb5TaR9mxgl3JAyv0Ney4P7mSqzv3UOQpHF8UfOv1mG+8GLhrWG
 a0Ac9IC2rP6qtMdgLW/GjUPAWM05klEwFn4SL/Xsesp7EhgKnV3fTE8cGPkifGlZMruM
 NCcg==
X-Gm-Message-State: AO0yUKWgRSh9PQ5tgNZOlcvtSIYsr9/7gqEOi0EQKwbkRa1Ohy2qCFAO
 ABBi8uQPUtre5esedsWZFeKXO3HZmp09B8SGepAd860bHRjEpGhFSy3dichpmpdk9tb+ntPUlvB
 qBdnrNZ0nbzgn2HMueIaLVhdrNPyAQM+AcgF4
X-Received: by 2002:a17:907:3f18:b0:8f6:5a70:cccc with SMTP id
 hq24-20020a1709073f1800b008f65a70ccccmr27296548ejc.66.1678351906376; 
 Thu, 09 Mar 2023 00:51:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8ZJlKmr7LwwY7HzE4thVVJydV0N08hZGQJFDfZIGiK/yyptwohH0nXi/zVnjrQOmaW2x/LmQ==
X-Received: by 2002:a17:907:3f18:b0:8f6:5a70:cccc with SMTP id
 hq24-20020a1709073f1800b008f65a70ccccmr27296534ejc.66.1678351906128; 
 Thu, 09 Mar 2023 00:51:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a1709063c4900b008d427df3245sm8596552ejg.58.2023.03.09.00.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 00:51:45 -0800 (PST)
Message-ID: <40b30b48-9d5c-f223-c31c-b3e094b224b3@redhat.com>
Date: Thu, 9 Mar 2023 09:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 0/6] drm/amd/display: Pass proper parent for DM backlight
 device v2
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230308215831.782266-1-hdegoede@redhat.com>
 <08364719-3ae7-7213-2e90-a0aa1c5fee48@redhat.com>
In-Reply-To: <08364719-3ae7-7213-2e90-a0aa1c5fee48@redhat.com>
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

Hi all,

On 3/8/23 23:10, Hans de Goede wrote:
> Hi,
> 
> On 3/8/23 22:58, Hans de Goede wrote:
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
> 
> p.s.
> 
> Like last time this series is marked as RFC because I don't have hw
> to test the fix myself. The previous version was tested by 2 reporters
> of: https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730
> 
> I hope to get test results from them for this new version soon.

I just heard back from one of the reporters that this fixes gnome-settings-daemon
picking the wrong backlight device on a hybrid gfx laptop where both GPU-s
register a native backlight control.

So this series no longer is RFC, but is ready for merging (from my pov) now.

Regards,

Hans





>> Hans de Goede (6):
>>   drm/amd/display/amdgpu_dm: Fix backlight_device_register() error
>>     handling
>>   drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
>>   drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
>>   drm/amd/display/amdgpu_dm: Move most backlight setup into
>>     setup_backlight_device()
>>   drm/amd/display/amdgpu_dm: Make amdgpu_dm_register_backlight_device()
>>     take an amdgpu_dm_connector
>>   drm/amd/display: Pass proper parent for DM backlight device
>>     registration v2
>>
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 99 ++++++++-----------
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>>  2 files changed, 44 insertions(+), 56 deletions(-)
>>
> 

