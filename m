Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057566B14CE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 23:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BF210E732;
	Wed,  8 Mar 2023 22:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A334410E732
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 22:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678313463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tS1S9aVmOjnSIgqLViqUgc8frkOLegPaG1y9hoCBPWk=;
 b=iUOg2PVJI1v034lpBkQhcwkzLP69KXQbLPffoxR36yjbeS6b3W5CqCa5pyGWlDWOsrWkDD
 AADpc8RStU/I5s/g/3U7lfoSLlEI6eBekPidtsR77YXxv4mfCjr+4EZUZSJ3arncUta3sT
 68IXbG9JME/N0prLzOBrKpw22ZU+WJk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-pi_eIJZwP3yDEsfT3BIotA-1; Wed, 08 Mar 2023 17:11:02 -0500
X-MC-Unique: pi_eIJZwP3yDEsfT3BIotA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m8-20020a056402430800b004cdaaa4f428so23164223edc.20
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 14:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678313459;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tS1S9aVmOjnSIgqLViqUgc8frkOLegPaG1y9hoCBPWk=;
 b=WIiWY8I/DNot09gu/NHcvQIgozMMaK/xYXZmjMurgAhZxsibD5/fpR3GnxxsOmM+xe
 xwfb2q77CjVxXhRb8wEl0M6QdrF2RM9gVxIcHEDiQBm9DOrKkvFigWWNzdGvNQI10zkk
 0IBPABZuYdvlaoeWrlbMBGhgWvqpFoP7RwiaZIizOujWvdaL89GOcy+jKDgwzEt9+yo4
 EOPQe5nOwxHV3l9pCQfE+Vo0LH2FqIJ0K+bENWpwGzcRP2yiuKdBUdhqKOM1Po+QW6Rf
 97KG+mj8TIq4YU5CPfmfiLakC5UAlkRheGO7Z4Y1iQFohhhDnmkuzZKLwYVRkw08cQQ1
 zXcw==
X-Gm-Message-State: AO0yUKV2pPcGRQe7RGVPRVykiItqxIC6gZAGdifFSoAZF3TMfvJRJSMV
 uG9S/P1uIVueTtcWwBdtv/ciy1uC8beEj2YlE4aPqt2NbMR1hN1q+i7RfaCVMWzQ3gEwVHKFuI3
 uKofj4BRDIYMy7iSFkK7KB0/gwpAUvEs5zmeD
X-Received: by 2002:a17:907:d8f:b0:8b1:7ead:7d43 with SMTP id
 go15-20020a1709070d8f00b008b17ead7d43mr24491856ejc.50.1678313459596; 
 Wed, 08 Mar 2023 14:10:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+/QxZfpdhXc5OLGQ8VvX9XYJNdPShUW/pAhAP3zrh4n7u0BdIxwkzgiVpdivXgSKe8KjOfSg==
X-Received: by 2002:a17:907:d8f:b0:8b1:7ead:7d43 with SMTP id
 go15-20020a1709070d8f00b008b17ead7d43mr24491836ejc.50.1678313459252; 
 Wed, 08 Mar 2023 14:10:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a17090665cf00b008de729c8a03sm8003494ejn.38.2023.03.08.14.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 14:10:58 -0800 (PST)
Message-ID: <08364719-3ae7-7213-2e90-a0aa1c5fee48@redhat.com>
Date: Wed, 8 Mar 2023 23:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 0/6] drm/amd/display: Pass proper parent for DM backlight
 device v2
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230308215831.782266-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230308215831.782266-1-hdegoede@redhat.com>
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
> Hi All,
> 
> Here is version 2 of my patch series to pass the proper parent device
> to backlight_device_register().
> 
> New in version 2 is delaying the registering of the backlight_dev till
> after the drm_connector is registered by doing it from
> drm_connector_funcs.late_register.
> 
> This involves first reworking the code a bit to allow delaying
> the registering, so this has turned from a single patch into
> a 6 patch set.
> 
> Regards,
> 
> Hans

p.s.

Like last time this series is marked as RFC because I don't have hw
to test the fix myself. The previous version was tested by 2 reporters
of: https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/730

I hope to get test results from them for this new version soon.


> 
> 
> Hans de Goede (6):
>   drm/amd/display/amdgpu_dm: Fix backlight_device_register() error
>     handling
>   drm/amd/display/amdgpu_dm: Refactor register_backlight_device()
>   drm/amd/display/amdgpu_dm: Add a bl_idx to amdgpu_dm_connector
>   drm/amd/display/amdgpu_dm: Move most backlight setup into
>     setup_backlight_device()
>   drm/amd/display/amdgpu_dm: Make amdgpu_dm_register_backlight_device()
>     take an amdgpu_dm_connector
>   drm/amd/display: Pass proper parent for DM backlight device
>     registration v2
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 99 ++++++++-----------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>  2 files changed, 44 insertions(+), 56 deletions(-)
> 

