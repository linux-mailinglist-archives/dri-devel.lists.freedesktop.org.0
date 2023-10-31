Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5547DD134
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009610E561;
	Tue, 31 Oct 2023 16:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B64D10E561
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698768468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thpxtjONj4QTupD90Q3EZvagp9KsKzzPeE2dqPNx7k0=;
 b=b0uya9oIfEeWmlw54McdPujJl59wc1WwsfOPcHBNoK1oi2ml4DWYW5oKjTIlPUHvqbhdsD
 ocmDmu+WIw3AotYrUGY/aWLop4bdAB7gbpVlAYPG98b4D+lOGeq0bcHOdzb7Ru47cOLbKm
 AkcbUcnBGSOxc7W/ea1tjYayM+m+I6A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-PolsXbL3M4ChqgF-F8PZmQ-1; Tue, 31 Oct 2023 12:07:43 -0400
X-MC-Unique: PolsXbL3M4ChqgF-F8PZmQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9c797b497e8so411452866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 09:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698768462; x=1699373262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thpxtjONj4QTupD90Q3EZvagp9KsKzzPeE2dqPNx7k0=;
 b=KiLNOVpVpQmZSDAWfZ/9S6kFVuYY4fcrelEYfIHpmV4qJ4zivHzE4SXzZkFHP18fCJ
 XDUrVCOyKJt47LUE150+oAy4eozKQBO1tilUyz8CYPlX1jSELD3gZPsi6JxRc+MMFosR
 3e7X6mmc7Ziz6whGP1OhuqYG51En4EftBrr5reSHziGwH31MQOotct17wyt2X34q4pnv
 igeW9PPcXyLBQCma0qns4Fwr+/N3ENgbdcaqrFF7vsvkRDZDMJgviLYTyss/ARPwZ4RD
 DtlRpnzwbFx9glUaAa27DSnhXXtAEbZtBtvhuNsF7wzkZMIQMqPmeSIPC/97KmPXy3Wv
 ga/w==
X-Gm-Message-State: AOJu0Yzaci1v3xwDufv7VBnh4h/yw7A9WXg/ii2Bs/UUIEe/hrYInaBM
 zFgBQmn+7MxCR3bJcAH/l7yATxXKyN1Js2tCDNffSVJhL0tBTJ/0LtfXm/fAaQFbOohb39dJedp
 p5VBfXVlGCbdTHu2whzYcTChQ61I8
X-Received: by 2002:a17:906:4784:b0:9ad:e180:16e3 with SMTP id
 cw4-20020a170906478400b009ade18016e3mr12240290ejc.37.1698768461850; 
 Tue, 31 Oct 2023 09:07:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDV51Onpp+gtuqKcZZe8kMiLqbF3dH6IJu74qigRPDiD5Lk35IqZsmbryB7ATZnw7t7AJDEQ==
X-Received: by 2002:a17:906:4784:b0:9ad:e180:16e3 with SMTP id
 cw4-20020a170906478400b009ade18016e3mr12240270ejc.37.1698768461497; 
 Tue, 31 Oct 2023 09:07:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029?
 (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
 by smtp.gmail.com with ESMTPSA id
 fy23-20020a170906b7d700b009b2f2451381sm1187507ejb.182.2023.10.31.09.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 09:07:40 -0700 (PDT)
Message-ID: <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
Date: Tue, 31 Oct 2023 17:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 10/24/23 18:11, Andy Shevchenko wrote:
> On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:
>> It's a dirty hack in the driver that pokes GPIO registers behind
>> the driver's back. Moreoever it might be problematic as simultaneous
>> I/O may hang the system, see the commit 0bd50d719b00 ("pinctrl:
>> cherryview: prevent concurrent access to GPIO controllers") for
>> the details. Taking all this into consideration replace the hack
>> with proper GPIO APIs being used.
> 
> Ah, just realised that this won't work if it happens to request to GPIOs with
> the same index but different communities. I will fix that in v3, but will wait
> for Hans to test VLV and it might even work in most of the cases on CHV as it
> seems quite unlikely that the above mentioned assertion is going to happen in
> real life.

I have added patches 1-5 to my personal tree + a small debug patch on top
which logs when soc_exec_opaque_gpio() actually gets called.

So these patches will now get run every time I run some tests on
one my tablets.

I'll get back to you with testing results when I've found a device where
the new soc_exec_opaque_gpio() actually gets called.

As for the CHT support, I have not added that to my tree yet, I would
prefer to directly test the correct/fixed patch.

Regards,

Hans

