Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F75D21781A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 21:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B3E6E0FC;
	Tue,  7 Jul 2020 19:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB8F6E0FC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 19:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594150900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/fUzOvC+NbUGXp81JEXBngmtuUuiFL6Cj49pFYlubY=;
 b=SvqV5nEXElvgEu/44/sX6GzHT36DxelmKk/zxP3qarBTU4qt9oIGGerivM/HAn6utO3KQb
 IybmHsYCqysUAsKkF9JLqSgDFEkNZy4b8GLNE6Uy7aqgLTwhVYqn4qHcmxvtBHCkMs8M8v
 ospVZZFu7zP+6YItE9ki9BB6wu9undg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-bUjXnc-bOu20Pfsf9Rxjcw-1; Tue, 07 Jul 2020 15:41:38 -0400
X-MC-Unique: bUjXnc-bOu20Pfsf9Rxjcw-1
Received: by mail-ed1-f70.google.com with SMTP id w19so55618420edx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 12:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u6LSVtn4v8gZHllzz2UNn3EgKUqKY14zb/jR9VXFi0I=;
 b=X9hN7swkzoqSG5dz5ytX7gytMwXGNy07gaHhRfsjn2P9DV0fKY6Aa6+Ql3KftdY/GN
 BkoKZFaBU0l3659T0dRa8BEunMHohSxWjfdY5A1cUeF74KbWdOJDXdZmSsYfIlokvLAV
 7Z0+XAlJb3e6GR5R+vRefnCFU9+R1Rzo1Yy1Weoz5wirmY5IzdH4gy9XLEn4l7OjWbnX
 pG8EwUoD21+sATTdzuWwHSM7TdtWNpr1hQjf5dEiIMseE2YZoatUpAIDofP7ypKfiMgW
 b5shWu/uAeahasIyI0cCziYtRbmAUorRg66oiDXN/oNSkySwCivAK3/n/79+fmgaK21V
 NAtg==
X-Gm-Message-State: AOAM531NZJNdl4RLlcUutGLRS2HWoRvURTxubMOmb5LmRaTub2zDFye8
 F7Q74Q9gKlom9iF2IGQbVYA5XZ25fbEsc2o+Koj+Iq2KYo8bhcTB/8FiAiRUC89nK/btwOigTit
 vtDdT7SkCVyunEbVQldAe2xYHvXu4
X-Received: by 2002:a17:906:410a:: with SMTP id
 j10mr37321730ejk.201.1594150897366; 
 Tue, 07 Jul 2020 12:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXnVXEx7nXmWizq3WBrz1vcGCOHcpBwHufxNZFJvl6CfoS1RtIACGSwq90uZ4QNzldiNsZ3g==
X-Received: by 2002:a17:906:410a:: with SMTP id
 j10mr37321708ejk.201.1594150897067; 
 Tue, 07 Jul 2020 12:41:37 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d16sm787486ejo.31.2020.07.07.12.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 12:41:36 -0700 (PDT)
Subject: Re: [PATCH v3 04/15] pwm: lpss: Add range limit check for the
 base_unit register value
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-5-hdegoede@redhat.com>
 <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
 <e07a7dd6-c361-32b8-c4e7-91e022f9c21d@redhat.com>
 <20200707073424.w6vd6e4bhl56kosd@pengutronix.de>
 <1496178b-ce39-9285-ff75-cd39bc0e9aa7@redhat.com>
 <20200707190955.e7wzmphdgi5reeyg@pengutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e79b176-7e58-7ecb-0f82-ebfd0c777af3@redhat.com>
Date: Tue, 7 Jul 2020 21:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707190955.e7wzmphdgi5reeyg@pengutronix.de>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
 kernel@pengutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/7/20 9:09 PM, Uwe Kleine-K=C3=B6nig wrote:
> Hello Hans,
> =

> On Tue, Jul 07, 2020 at 07:31:29PM +0200, Hans de Goede wrote:
>> On 7/7/20 9:34 AM, Uwe Kleine-K=C3=B6nig wrote:
>>> On Mon, Jul 06, 2020 at 10:53:08PM +0200, Hans de Goede wrote:
>>>> But if we do then I think closest to the truth would be:
>>>>
>>>> state->period     =3D UINT_MAX;
>>>> state->duty_cycle =3D 0;
>>>
>>> I'd say state->period =3D 1 & state->duty_cycle =3D 0 is a better
>>> representation.
>>
>> But that would suggest the output is configured for an
>> infinitely high output frequency, but the frequency is
>> actually 0, the reason why get_state needs to treat a
>> base_unit val of 0 special at all is to avoid a division
>> by 0, and in math dividing by 0 gives infinite, isn't
>> UINT_MAX a better way to represent infinity ?
> =

> Given that duty_cycle is 0, how can to tell anything about the period
> when only seeing the signal (=3D a constant low)?
> =

> Given that (ideally) a period is completed when pwm_apply_state() is
> called, a short period is much more sensible.

Ok, I will add a patch to v4 of the patch-set to adjust the pwm-lpss
driver's get_state method accordingly.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
