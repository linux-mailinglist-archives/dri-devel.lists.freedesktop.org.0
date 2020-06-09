Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E31F3CFC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 15:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FCA6E2B2;
	Tue,  9 Jun 2020 13:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6706E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591710329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fvpsAccmwpkGhYKxsT7pHl6ms2pXYRlDnYwLyHWCq1I=;
 b=Io5n4XJzgoTSxy7iVtt/WQjmVNDM6fgPuta/94gtwoVpV0OinNtyi1XfYJtG5b2+iyp5yp
 n/8RmmImTVnRv4QYwoGE3XZO7tfXBc5lPZSCVrkIbI+3SwNXEVQZ3Qd1B1LG7PiuUGS4LG
 46exTZ+Vrfg9XaMyZRjkici/Er/ZPFI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-jHV2HUuzMlyTLlff7l0Egw-1; Tue, 09 Jun 2020 09:45:28 -0400
X-MC-Unique: jHV2HUuzMlyTLlff7l0Egw-1
Received: by mail-ej1-f72.google.com with SMTP id ch1so7150643ejb.18
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvpsAccmwpkGhYKxsT7pHl6ms2pXYRlDnYwLyHWCq1I=;
 b=Gnv4vt93g39fhwlIyR1GzF+E3s4E4NUwnyanPpM/2a48C2WWWggsKoV7T34T89hYis
 F3LIWk92e5btBlBUdkRJTZqAo0yaz3JHMqx+HJQ1wZFBdOK/Riro86tmUp0o0Nk34T3w
 3Lpl0ZQprxhx61ZmNm19I6O1eARLZqBT2UqRxIdHFrM1n8QGeKYO2ZyLGyn02HzjTFW1
 3+F7e/dM43sU+8LYW4V7siX/0X2vrmukbtqGjuZU3dlXY0mjYPg+ADjICyridSpWrcuF
 8cEGYwphJexZFBfewQwVBXE8B0e8HPFv4F18fSO88pUvKN60RD4kN+i/elZ77MtNVJq8
 UtHw==
X-Gm-Message-State: AOAM531kBrtP1TA5O4Z3F5NqBuLoHzgu+vm6q7sF8ZUUGBV+GNDFDn1C
 R1SaxNRoEArxF2+Dlj7WsaFxhX+L+bWMULfFUk0tf8cbIX8u9xsSYXZEoXkukbeLO6JCFnoWPKt
 jjyadYipPyuQJ+yBEg2nxhlaAPyYt
X-Received: by 2002:a17:906:344c:: with SMTP id
 d12mr23943641ejb.130.1591710326725; 
 Tue, 09 Jun 2020 06:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxunOyD5XPkDfbblW74CXvBtjgUGkZRw2EP+zRYxbRvuH44U47dy20JU3ob/DBn+LIrrsRQOQ==
X-Received: by 2002:a17:906:344c:: with SMTP id
 d12mr23943614ejb.130.1591710326418; 
 Tue, 09 Jun 2020 06:45:26 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id rp21sm13345743ejb.97.2020.06.09.06.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:45:25 -0700 (PDT)
Subject: Re: [PATCH v2 06/15] pwm: crc: Fix period / duty_cycle times being
 off by a factor of 256
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-7-hdegoede@redhat.com>
 <20200609112905.GK2428291@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fd839acc-9e25-14aa-d1ac-dbc262c7860e@redhat.com>
Date: Tue, 9 Jun 2020 15:45:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609112905.GK2428291@smile.fi.intel.com>
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

On 6/9/20 1:29 PM, Andy Shevchenko wrote:
> On Sun, Jun 07, 2020 at 08:18:31PM +0200, Hans de Goede wrote:
>> While looking into adding atomic-pwm support to the pwm-crc driver I
>> noticed something odd, there is a PWM_BASE_CLK define of 6 MHz and
>> there is a clock-divider which divides this with a value between 1-128,
>> and there are 256 duty-cycle steps.
>>
>> The pwm-crc code before this commit assumed that a clock-divider
>> setting of 1 means that the PWM output is running at 6 MHZ, if that
>> is true, where do these 256 duty-cycle steps come from?
>>
>> This would require an internal frequency of 256 * 6 MHz = 1.5 GHz, that
>> seems unlikely for a PMIC which is using a silicon process optimized for
>> power-switching transistors. It is way more likely that there is an 8
>> bit counter for the duty cycle which acts as an extra fixed divider
>> wrt the PWM output frequency.
>>
>> The main user of the pwm-crc driver is the i915 GPU driver which uses it
>> for backlight control. Lets compare the PWM register values set by the
>> video-BIOS (the GOP), assuming the extra fixed divider is present versus
>> the PWM frequency specified in the Video-BIOS-Tables:
>>
>> Device:		PWM Hz set by BIOS	PWM Hz specified in VBT
>> Asus T100TA 	200			200
>> Asus T100HA 	200			200
>> Lenovo Miix 2 8	23437			20000
>> Toshiba WT8-A	23437			20000
>>
>> So as we can see if we assume the extra division by 256 then the register
>> values set by the GOP are an exact match for the VBT values, where as
>> otherwise the values would be of by a factor of 256.
>>
>> This commit fixes the period / duty_cycle calculations to take the
>> extra division by 256 into account.
> 
> ...
> 
>> +#define NSEC_PER_MHZ		1000
> 
> This is against physics. What this cryptic name means actually?
> Existing NSEC_PER_USEC ?

Yes, using existing NSEC_PER_USEC is better I will use that for the
next version.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
