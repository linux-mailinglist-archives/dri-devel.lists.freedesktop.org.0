Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07DE5BB836
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 14:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6633510E32A;
	Sat, 17 Sep 2022 12:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011CF10E32A
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663417894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Invho+h7rKsQXr/DOVKgZ8sKQ7S965JK4qf9ZOpEUj4=;
 b=Csq552n5BnO/oUqGqF/ddELp24UyOpyXm2I8JbpLm2HdF8t6ibLJ4qqR41XifOxpCCNtiX
 u5DbqN5pjy8Wjqu9f62HbY221U1dF0PokSetbEdajGOPKSpUdTolomkPVpYI0WlFeTAlNK
 5dN+aPpQWgrZhPy24agbgZCczh1uu/s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-e90lN_s_M8iurY6s2POvKw-1; Sat, 17 Sep 2022 08:31:33 -0400
X-MC-Unique: e90lN_s_M8iurY6s2POvKw-1
Received: by mail-ed1-f71.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so16767138edz.0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 05:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Invho+h7rKsQXr/DOVKgZ8sKQ7S965JK4qf9ZOpEUj4=;
 b=sHVgBba6L2o9YNVKg/5O2QRWA1rZsztSYP4wkO2++GGzH+mwBXHBPO/4oIZLSsf/Xa
 iEIIQUlVEMPjnJVEs9W3hLsJSm7M1Ij4y2Qz+Xlbwz1812GTXyb9GdnaWIjlNRFkTbQt
 7J3Gk1GDbu4k0rcq6ieblTCLl0GMS7lY0E6eMovWdv+Prl5Qxm6irkSXAizd1A2pwfB2
 4ib9Kx/eDb1W6N7E0Ebj20adVJPMDhxUo7VRD6vK0Q5nzqn/MndvaNLKxVowxYPTy8la
 Cq2YICYGnnUjUeAm/Syo9T7DAX1J+07jpC9379CyHS8qfFcvSv9uRbpgSinkT7N52ek0
 5Ogw==
X-Gm-Message-State: ACrzQf1p2BWt5SWl8hQleVBQVRPopJCt6tZ42to82CcMal3d14qDCq48
 /n/BLe/O0rZ5TYlGlXqi1CU1+4HHtYzDKnK6WePVHiC3TuBbv8T6dEW9dbRiR1rVRAGIMVEU8Gs
 0JlmhsRLfiA5ct3C9/o9WIKJmpaoy
X-Received: by 2002:a05:6402:3547:b0:451:3be6:d55b with SMTP id
 f7-20020a056402354700b004513be6d55bmr7572626edd.57.1663417891661; 
 Sat, 17 Sep 2022 05:31:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5scwhBOwLiHep1YRr0zm4jpz/T7JGYapSqIukv0j1sC3OlGU1kx9vsl9XN6Opk/FEQTIaqfg==
X-Received: by 2002:a05:6402:3547:b0:451:3be6:d55b with SMTP id
 f7-20020a056402354700b004513be6d55bmr7572614edd.57.1663417891471; 
 Sat, 17 Sep 2022 05:31:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a17090633cf00b007417041fb2bsm11911079eja.116.2022.09.17.05.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 05:31:30 -0700 (PDT)
Message-ID: <edbea55f-8ad0-e733-619f-aba81846cfb8@redhat.com>
Date: Sat, 17 Sep 2022 14:31:30 +0200
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

Hi Patrik,

On 9/14/22 09:50, Patrik Jakobsson wrote:
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
> 
> "drm/gma500: Wait longer for the GPU to power-down" can go through
> drm-misc-fixes if you prefer. It fixed the timeout message on two of
> my CDV machines but I never saw an actual problem from the timeouts.
> 
> For the entire series:
> Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

Thanks.

I'm pushing these out to drm-misc-next now, but with some small
changes:

1. I have dropped the "drm/gma500: Wait longer for the GPU to power-down"
patch I'm still seeing timeouts even if I increase the wait time to
a full seconds. I believe that the actual issue is this line:

	dev_priv->apm_base = CDV_MSG_READ32(domain, PSB_PUNIT_PORT, PSB_APMBA);

sometimes failing. When the timeout happens I see apm_base is set to 0 and
reading apm_base + cmd / sts offset returns bogus values.

I have yet to have a successful boot where the timeout does not happen
since I have been poking at this (it seems success/fail wrt the timeout
is random). But I suspect that with a successful boot apm_base will not
be 0 and that the problem is there. To be continued...


2. For the "drm/gma500: Rewrite power management code" I noticed the
following error during further testing (for the actual backlight changes):

[   12.292509] gma500 0000:00:02.0: Unbalanced pm_runtime_enable!

The problem is that pci_pm_init() which the PCI core runs for each
device already does:

        pm_runtime_forbid(&dev->dev);
        pm_runtime_set_active(&dev->dev);
        pm_runtime_enable(&dev->dev);

So the pm_runtime_enable() call in "drm/gma500: Rewrite power management code"
was a second enable call and as such was not necessary. So I'm going to
squash in the following small fix while pushing this out:

diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index 62d2cc1923f1..0080b692dc3e 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -61,10 +61,11 @@ void gma_power_init(struct drm_device *dev)
 	 * To fix this we need to call pm_runtime_get() once for each active
 	 * pipe at boot and then put() / get() for each pipe disable / enable
 	 * so that the device gets runtime suspended when no pipes are active.
+	 * Once this is in place the pm_runtime_get() below should be replaced
+	 * by a pm_runtime_allow() call to undo the pm_runtime_forbid() from
+	 * pci_pm_init().
 	 */
 	pm_runtime_get(dev->dev);
-	pm_runtime_set_active(dev->dev); /* Must be done before pm_runtime_enable()! */
-	pm_runtime_enable(dev->dev);
 
 	dev_priv->pm_initialized = true;
 }
@@ -83,7 +83,6 @@ void gma_power_uninit(struct drm_device *dev)
 	if (!dev_priv->pm_initialized)
 		return;
 
-	pm_runtime_disable(dev->dev);
 	pm_runtime_put_noidle(dev->dev);
 }
 

As you can see all the removed lines are already taken care of by the
PCI core, so this squashed in change really is a no-op (other then
that it silences the "Unbalanced pm_runtime_enable!" message).

Regards,

Hans




> 
> 
>> Regards,
>>
>> Hans
>>
>>
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

