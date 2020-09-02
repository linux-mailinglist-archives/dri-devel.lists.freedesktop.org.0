Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6991725A617
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102A26E90C;
	Wed,  2 Sep 2020 07:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1726E0AD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 00:39:16 +0000 (UTC)
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kDGnz-0002Gb-2q
 for dri-devel@lists.freedesktop.org; Wed, 02 Sep 2020 00:39:15 +0000
Received: by mail-pl1-f199.google.com with SMTP id 95so1481100pla.14
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 17:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=HapSh6J4ipleysnVKYsirTF50PzRq3WDVc1GsW3eoRw=;
 b=PvKt4MITqAe+x6YFvC1rngCxJsZ3ZAwBXUwW6JGSj546yJI4CRXAnrUuS30VEVVSok
 TF6Oftv5kPA+MZnSHE1+fphZ29tBN0DFF65ssl5NEeE/yU8RcGuOI0Nnv627NA8LiJjH
 vbnETZ+Rsc84f39mezUi6kUrwcRMjWxpP5DOZ9u5BHVn2xZbvHZvKbCtNz+1/FeyfG3h
 CM7AH5TQMYIyu9yOD2mFGcAfyyvfNL1b1JiRArdWDqfkAQpM26ikeKFPROrgSp6BYTKH
 Dy82VvlxpfGGHy9hGY7uivO9CBUP5/iLlWcnLmRZ6J7wUwFcBXAJztdGidDQQyjDbWWD
 +hTw==
X-Gm-Message-State: AOAM531uH7UIYRxP2SeUvzi5bUwWI+vu8s/559Z5BunvRqagmFKP4K0X
 otR4UbdVMsQy0LsWsLKD8/QD4n7pVEePiUCL8P5+4pcxtbOJXv3s8udRKO5b3qnbY4ifwxOoPtv
 5ZUx0KkbKBzEZscbT4v9SrZlQx+E55kz+mZCN4o3snFiVsQ==
X-Received: by 2002:a62:7c09:: with SMTP id x9mr760352pfc.229.1599007153388;
 Tue, 01 Sep 2020 17:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm3QapIMxS3NYIcgVW1Am2hXnQMWOVnVHjfdLckz4kXMEDFeOvPUT3ZkAuRXJdaw8qsl4Zgg==
X-Received: by 2002:a62:7c09:: with SMTP id x9mr760316pfc.229.1599007153014;
 Tue, 01 Sep 2020 17:39:13 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id u5sm3152827pfm.149.2020.09.01.17.39.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 17:39:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] drm/radeon: Reset ASIC if suspend is not managed by
 platform firmware
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CADnq5_PMLoL0Zkw8uB+noPJ0buO5aUavDrFGBhBp_GEz8+xBDA@mail.gmail.com>
Date: Wed, 2 Sep 2020 08:39:09 +0800
Message-Id: <D7166B38-F8AE-4603-9C7E-11620E1E8B60@canonical.com>
References: <20200901063227.6057-1-kai.heng.feng@canonical.com>
 <CADnq5_MXs-=BpMrYVudhHPjTpgs1XUE=GEujpp5AeYy5vWS=YA@mail.gmail.com>
 <3269C99F-2349-4004-8B5F-31A2297A5043@canonical.com>
 <CADnq5_PMLoL0Zkw8uB+noPJ0buO5aUavDrFGBhBp_GEz8+xBDA@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Sep 2, 2020, at 00:30, Alex Deucher <alexdeucher@gmail.com> wrote:
> 
> On Tue, Sep 1, 2020 at 12:21 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
>> 
>> 
>> 
>>> On Sep 1, 2020, at 22:19, Alex Deucher <alexdeucher@gmail.com> wrote:
>>> 
>>> On Tue, Sep 1, 2020 at 3:32 AM Kai-Heng Feng
>>> <kai.heng.feng@canonical.com> wrote:
>>>> 
>>>> Suspend with s2idle or by the following steps cause screen frozen:
>>>> # echo devices > /sys/power/pm_test
>>>> # echo freeze > /sys/power/mem
>>>> 
>>>> [  289.625461] [drm:uvd_v1_0_ib_test [radeon]] *ERROR* radeon: fence wait timed out.
>>>> [  289.625494] [drm:radeon_ib_ring_tests [radeon]] *ERROR* radeon: failed testing IB on ring 5 (-110).
>>>> 
>>>> The issue doesn't happen on traditional S3, probably because firmware or
>>>> hardware provides extra power management.
>>>> 
>>>> Inspired by Daniel Drake's patch [1] on amdgpu, using a similar approach
>>>> can fix the issue.
>>> 
>>> It doesn't actually fix the issue.  The device is never powered down
>>> so you are using more power than you would if you did not suspend in
>>> the first place.  The reset just works around the fact that the device
>>> is never powered down.
>> 
>> So how do we properly suspend/resume the device without help from platform firmware?
> 
> I guess you don't?

Unfortunate but I guess we need to accept reality and use the default suspend method.

Kai-Heng

> 
> Alex
> 
> 
>> 
>> Kai-Heng
>> 
>>> 
>>> Alex
>>> 
>>>> 
>>>> [1] https://patchwork.freedesktop.org/patch/335839/
>>>> 
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>> ---
>>>> drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>>>> 1 file changed, 3 insertions(+)
>>>> 
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
>>>> index 266e3cbbd09b..df823b9ad79f 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>>>> @@ -33,6 +33,7 @@
>>>> #include <linux/slab.h>
>>>> #include <linux/vga_switcheroo.h>
>>>> #include <linux/vgaarb.h>
>>>> +#include <linux/suspend.h>
>>>> 
>>>> #include <drm/drm_cache.h>
>>>> #include <drm/drm_crtc_helper.h>
>>>> @@ -1643,6 +1644,8 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>>>>               rdev->asic->asic_reset(rdev, true);
>>>>               pci_restore_state(dev->pdev);
>>>>       } else if (suspend) {
>>>> +               if (pm_suspend_no_platform())
>>>> +                       rdev->asic->asic_reset(rdev, true);
>>>>               /* Shut down the device */
>>>>               pci_disable_device(dev->pdev);
>>>>               pci_set_power_state(dev->pdev, PCI_D3hot);
>>>> --
>>>> 2.17.1
>>>> 
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
