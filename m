Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA15B82C8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 10:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD50010E8AF;
	Wed, 14 Sep 2022 08:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8653910E8AF
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663143422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nIbDEKcysogIWpOx1lfZ6/Qc293HWu8+Z6pMzsW7/E=;
 b=ArWfDbN5IXI7UuLDtcr4DUj46WvJ8axa1+tejfXBrpdj2S64yI+N0vnbwzsTqCLK1bSkuH
 Syyru91shYRlZTw623R0f6V9rmCqO4Ib2Bd5Gz39fipNcJ9xAQe4Oa6bxniMsAeTmI0ztV
 AKdSnipR1IjMOjyYVXHpVXQeetvH4Fo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-14-hTkGJ36-N66QxXxZ6h_XVg-1; Wed, 14 Sep 2022 04:17:00 -0400
X-MC-Unique: hTkGJ36-N66QxXxZ6h_XVg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h133-20020a1c218b000000b003b3263d477eso7681575wmh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 01:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4nIbDEKcysogIWpOx1lfZ6/Qc293HWu8+Z6pMzsW7/E=;
 b=qY89p+25RECAX8QDpnB88tj2Xk23Yj0bp0P6xHecCToOeupbzpOzr/3VJAjWGq55kx
 i1WWCjF/GBjrjuYHk3E2vqtq92FY8Gxlf1kI1nCrOlY0oF/zTAIHqrTbpj+hTEul7mcR
 gXfoyR4X2zzvqySirMYX6j7iIZ41Hi0Nf/yn9136nzAQ26EpuDGOpMC5Y5i7EoD0Z4P1
 IOpfFBtxVm1Jo6HIlt5tZ7/HPN03rpLZ1BFQxeF3B0WWD7DhQ+F0PNl6q9TuvEAW7Sjo
 C4HOu4bZzgtciYGQEU+5Ghj1Y1XBPHXcqS/5WSAJI4fsUxishkjT9Uf0/rgBVt3mROfy
 YhFA==
X-Gm-Message-State: ACgBeo2SrI0LJx273sinqKkfMnetP+geh+PjAZw3TEQk+FeydMKUz5UG
 wE3XyZOW6DaQCAclzOzcjrgH1t0PHc8H8nHnEzItpmleGUow0GlRqTdKhO+jcl6XLxdSuiLGuWp
 bEgtqB6R1HjLAxuWtR7L6jliElIkX
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id
 v1-20020a7bcb41000000b003b334d6189fmr2151817wmj.6.1663143419594; 
 Wed, 14 Sep 2022 01:16:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5fMfDEKtZz6KE9yfH72fAcFuCMPlqc4xWZT4am6JbT75JIBlxQIj8MylCApsFJiLIsyQwnrg==
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id
 v1-20020a7bcb41000000b003b334d6189fmr2151810wmj.6.1663143419375; 
 Wed, 14 Sep 2022 01:16:59 -0700 (PDT)
Received: from [172.16.38.152] ([185.122.133.20])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a5d654c000000b00228e1e90822sm12597031wrv.112.2022.09.14.01.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 01:16:58 -0700 (PDT)
Message-ID: <6686c397-747a-3b10-8215-2808b8881b3b@redhat.com>
Date: Wed, 14 Sep 2022 09:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/6] drm/gma500: 1 fix + further cleanups
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
 <CAMeQTsaAoz2XHrOy9-s1nUh4Pa27E8=Ted+8vQ+HRzA=1O2ojg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMeQTsaAoz2XHrOy9-s1nUh4Pa27E8=Ted+8vQ+HRzA=1O2ojg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/14/22 08:50, Patrik Jakobsson wrote:
> On Fri, Sep 9, 2022 at 1:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Patrik,
>>
>> Here is another gma500 patch-series with one more bugfix and a bunch
>> of other cleanups of stuff which I noticed while doing the previous
>> set of bugfixes.
>>
> 
> Hi Hans, nice cleanups!
> 
> I'm rather busy at the moment so you can commit these yourself to
> drm-misc-next if you like.

Ok, I'm at Linux Plumbers atm, so I will take care of this in a couple
of days.

> "drm/gma500: Wait longer for the GPU to power-down" can go through
> drm-misc-fixes if you prefer. It fixed the timeout message on two of
> my CDV machines but I never saw an actual problem from the timeouts.
> 
> For the entire series:
> Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Thanks.

Regards,

Hans



>> Hans de Goede (6):
>>   drm/gma500: Wait longer for the GPU to power-down
>>   drm/gma500: Remove runtime_allowed dead code in psb_unlocked_ioctl()
>>   drm/gma500: Remove never set dev_priv->rpm_enabled flag
>>   drm/gma500: Remove a couple of not useful function wrappers
>>   drm/gma500: Rewrite power management code
>>   drm/gma500: Remove unnecessary suspend/resume wrappers
>>
>>  drivers/gpu/drm/gma500/cdv_device.c    |   2 +-
>>  drivers/gpu/drm/gma500/gma_display.c   |  19 +--
>>  drivers/gpu/drm/gma500/gma_display.h   |   2 -
>>  drivers/gpu/drm/gma500/oaktrail_lvds.c |   1 -
>>  drivers/gpu/drm/gma500/power.c         | 156 +++++--------------------
>>  drivers/gpu/drm/gma500/power.h         |  18 ---
>>  drivers/gpu/drm/gma500/psb_drv.c       |  35 +-----
>>  drivers/gpu/drm/gma500/psb_drv.h       |   7 +-
>>  drivers/gpu/drm/gma500/psb_irq.c       |  15 ++-
>>  9 files changed, 41 insertions(+), 214 deletions(-)
>>
>> --
>> 2.37.2
>>
> 

