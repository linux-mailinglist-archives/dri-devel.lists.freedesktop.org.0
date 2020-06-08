Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8001F1758
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 13:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE0589C0A;
	Mon,  8 Jun 2020 11:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBCB89C56
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591614788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhgJTWJr6h9G9PmHmPph9dyAvRbYjMyPRPIHK6pK8vc=;
 b=IXsyb6vDupZzkGm6LflWZ8XhumvDDm7xqftGdmZ5iENp8ASovOmJlGfgcUImnfHarOnQFa
 BUo/2wkwhuZfepiNUd+Tq+0/JXm7OhskkDC0nCfWK5HG2j8uhVKTjt9Eedo8UbdaCdP+GD
 79LpljUh8H+gyNpvB7Vm+QOSCbhVPEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-dzYNScdJMmOhAu2Ars0UOQ-1; Mon, 08 Jun 2020 07:13:04 -0400
X-MC-Unique: dzYNScdJMmOhAu2Ars0UOQ-1
Received: by mail-wr1-f69.google.com with SMTP id c14so7003906wrm.15
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 04:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UhgJTWJr6h9G9PmHmPph9dyAvRbYjMyPRPIHK6pK8vc=;
 b=P0w09d4TzqD2TozLHd8z1rYpIixdJ1ZGIdZnIJQ41Zn2r3cv4DchVYI9C5k6zJjeHx
 Zp9QwHUuYID56VLLNHs/E5Jw0WnS8olSAJP7g6rdq85+x5X4fjIYCGASgSbQuhrJUfhF
 FYrg0Mhrm7b6mvs9VB4s5A0L6PBFSeLQCS0FbK/0NqL4C11WvnAwAYsI47CnQxC4Qpnc
 BamBLzrRzNtXg6E+PBkUXLfmaYp9bVwvP/4N8f1tEz+GDAs4CF9i/oOwN8uWmzoPfO5A
 6DoW+jYYHtYUulBOGf2ueDmU0Fs2LrMo7GNG/VYmr1ep81CpX/adqRTZv6vuiDvVHj2m
 zSrQ==
X-Gm-Message-State: AOAM532gIpP6mxpvslFAQXm97t48HJmEY/TpCTVFzey4L3pK2blaTL1c
 8Md9Pr7IGIkxI6MlTrd0+ppNkupKXh18Xu66o73YrROxlnSt2MdFdJ3Na2+MoBQoNFVJiLZXZfW
 9kc0pXb54Vh7gVQ7Q71lGs+UtRQFB
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr22474424wrx.214.1591614783649; 
 Mon, 08 Jun 2020 04:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsVhaPysSkuHY7OnSe0IptFhwBN2fdZnKtM5beXPetYqOZNC7m8APlsFf+Xeln1lc8xR47Kg==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr22474396wrx.214.1591614783396; 
 Mon, 08 Jun 2020 04:13:03 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id v19sm21737311wml.26.2020.06.08.04.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 04:13:02 -0700 (PDT)
Subject: Re: [PATCH v2 04/15] pwm: lpss: Fix off by one error in base_unit
 math in pwm_lpss_prepare()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-5-hdegoede@redhat.com>
 <20200608035512.GA2428291@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c8a8d466-9b4a-9021-ca74-01d315e99117@redhat.com>
Date: Mon, 8 Jun 2020 13:13:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608035512.GA2428291@smile.fi.intel.com>
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
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/8/20 5:55 AM, Andy Shevchenko wrote:
> On Sun, Jun 07, 2020 at 08:18:29PM +0200, Hans de Goede wrote:
>> According to the data-sheet the way the PWM controller works is that
>> each input clock-cycle the base_unit gets added to a N bit counter and
>> that counter overflowing determines the PWM output frequency.
>>
>> So assuming e.g. a 16 bit counter this means that if base_unit is set to 1,
>> after 65535 input clock-cycles the counter has been increased from 0 to
>> 65535 and it will overflow on the next cycle, so it will overflow after
>> every 65536 clock cycles and thus the calculations done in
>> pwm_lpss_prepare() should use 65536 and not 65535.
>>
>> This commit fixes this. Note this also aligns the calculations in
>> pwm_lpss_prepare() with those in pwm_lpss_get_state().
> 
> This one sounds like a bug which I have noticed on Broxton (but thought as a
> hardware issue). In any case it has to be tested on various platforms to see
> how it affects on them.

If you like at the datasheet / read my commit description then it
becomes obvious that because of the way the PWM controller works that
it takes the full 2^(base-unit-bits) for the counter to overflow,
not 2^(base-unit-bits) - 1. This will make a difference of a factor
65535/65536 in the output frequency which will be tricky to measure.

IOW I'm not sure we can really test if this helps, but it is
obviously the right thing to do and it aligns the pwm_apply code
with the pwm_get_state code which already does not have the - 1.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
