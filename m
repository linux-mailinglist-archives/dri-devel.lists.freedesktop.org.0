Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2F71F7C15
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 19:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2B36E12C;
	Fri, 12 Jun 2020 17:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9951E6E12C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591981507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9piimQ/T++1/TGsJqs3awIx/sU3KGcD6TvfJOnap6Q=;
 b=D2C28mpjXlcKAtDpzOv98inWQj66wxsqJOuMQTvn+4Dglf0E6d1FvJa9WpX0LaRlm2CSzh
 tMJlgyy0XJtYma1sJKdD0ac27iY3NTMNgLKwaCst/MY5xGfFkXBdF2FeRwNICvCu2bnnFX
 5XIi9FYHgs8/dq/VY8CAQg+R2uSzxqo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-rjv1GNDlO3mfGMngJ02Qfg-1; Fri, 12 Jun 2020 13:04:56 -0400
X-MC-Unique: rjv1GNDlO3mfGMngJ02Qfg-1
Received: by mail-ed1-f69.google.com with SMTP id t23so3180361edq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 10:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aJhsLiuB5MJfhLZW+3GQ1NI8Ulud2FZJOWodXiS4/hM=;
 b=laLko7JWBt5medCshzNbkjNw4hLbKMKep0KPI2uEiwSfn8FDUS5c7+myai9+rw1Kfy
 8qHpjnygon+2YS0ODCKEqBfyiESVeIiLsWUux4haMdTbrkNRl6gA3EcXpJ7jNRXAvrTo
 2adnDJUjM2mBRY3zkIw9mHMFVh2jFR4a0oO+Or9dnoqLYX4upzCtS4bYikF3AaMCIR6b
 omkgUeBRLLrWTrCtD22XFvjI17LdpAKnPXRixO5o5iSp5D1l0Pd2VZ8/mARp7ID1htm0
 4Y4JP9Y3iszCHbcpOIZEn+OSVFqeIGJ4YXjw05SkYeAiR/xRikjCh3W88B9BdEjhNdii
 9Ysw==
X-Gm-Message-State: AOAM532BSygGRqiIHp8Whwos5ZqYDtPrc2RTRX9H1wdPD4+Foucit8BF
 uo9PKdVNjGpCFOnp6rvh4qQu9Q5SdEQ5xtnW4kVVo2LC0L0gSZYcDZjZ8yCRDPKNTmDVPiXgQjZ
 QEG4ViTsfKWz0ITLPUj+7xpxvgDAT
X-Received: by 2002:a17:906:3041:: with SMTP id
 d1mr14497137ejd.7.1591981493678; 
 Fri, 12 Jun 2020 10:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8/X6kVaFS8fcJPbnnHMtvzqT2kk50X8Vfwy3lEhe+LE8MdjUbh7IV+C3pCB1j1LapjG6OZw==
X-Received: by 2002:a17:906:3041:: with SMTP id
 d1mr14497118ejd.7.1591981493412; 
 Fri, 12 Jun 2020 10:04:53 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id o5sm3842626eje.66.2020.06.12.10.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 10:04:52 -0700 (PDT)
Subject: Re: pwm/i915: Convert pwm-crc and i915 driver's PWM code to use the
 atomic PWM API
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200606202601.48410-1-hdegoede@redhat.com>
 <20200608143500.GX20149@phenom.ffwll.local>
 <20200611212144.i7ma7kriznidds4r@taurus.defre.kleine-koenig.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <58972efb-003d-ca87-0637-ece4c93aeeb5@redhat.com>
Date: Fri, 12 Jun 2020 19:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611212144.i7ma7kriznidds4r@taurus.defre.kleine-koenig.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/11/20 11:21 PM, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
> =

> On Mon, Jun 08, 2020 at 04:35:00PM +0200, Daniel Vetter wrote:
>> On Sat, Jun 06, 2020 at 10:25:45PM +0200, Hans de Goede wrote:
>>> Hi All,
>>>
>>> This patch series converts the i915 driver's cpde for controlling the
>>> panel's backlight with an external PWM controller to use the atomic PWM=
 API.
>>>
>>> Initially the plan was for this series to consist of 2 parts:
>>> 1. convert the pwm-crc driver to support the atomic PWM API and
>>> 2. convert the i915 driver's PWM code to use the atomic PWM API.
>>>
>>> But during testing I've found a number of bugs in the pwm-lpss and I
>>> found that the acpi_lpss code needs some special handling because of
>>> some ugliness found in most Cherry Trail DSDTs.
>>>
>>> So now this series has grown somewhat large and consists of 4 parts:
>>>
>>> 1. acpi_lpss fixes workarounds for Cherry Trail DSTD nastiness
>>> 2. various fixes to the pwm-lpss driver
>>> 3. convert the pwm-crc driver to support the atomic PWM API and
>>> 4. convert the i915 driver's PWM code to use the atomic PWM API
>>>
>>> So we need to discuss how to merge this (once it passes review).
>>> Although the inter-dependencies are only runtime I still think we should
>>> make sure that 1-3 are in the drm-intel-next-queued (dinq) tree before
>>> merging the i915 changes. Both to make sure that the intel-gfx CI system
>>> does not become unhappy and for bisecting reasons.
>>
>> Simplest is if acpi acks the acpi patches for merging through
>> drm-intel.git. Second simplest is topic branch (drm-intel maintainers can
>> do that) with the entire pile, which then acpi and drm-intel can both pu=
ll
>> in.
>>
>> Up to the two maintainer teams to figure this one out.
> =

> I'm unclear about the dependencies

There is a runtime dependency of the i915 changes on the PWM changes
and since the intel-gfx folks use a lot of CI, we this need to get the
PWM changes into the drm-intel tree before the i915 changes can land.

> , but the changes to drivers/pwm need
> an ack (or processing) by the PWM team.

Of course, I asked for an Acked-by from the PWM team
(once this passes review) for merging this through
the drm-intel tree, as the i915 driver is the main
(only AFAIK) consumer of the PWMs controlled by these
2 drivers.  Daniel <snip>-ed that bit when he replied.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
