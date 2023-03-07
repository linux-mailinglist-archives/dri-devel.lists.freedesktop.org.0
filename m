Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95A6ADECD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 13:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBAE10E111;
	Tue,  7 Mar 2023 12:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5448710E111
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678192468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKnr0DUp/m2+BwAmLNBkIvjqUTFOrVYFFcfsOrK3Ipk=;
 b=LZjaafEIu4SaIUAEAn9bvra9Wv+4uMxPa3i3d6znwOCHUcY5Oq9qXdoC1z/eG3kircQ8mB
 VLnz5G+eM4zcTDSaI961ncWf5k0LGRRJIeZT2pa1Q8UlUYZEcggENiQzlR90f2EGAGMhl0
 jf2RBepQ11T/FwE9ZO+KrDAqC+vGjtk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-LsFB9sn5N6KtJVkl7sR8cg-1; Tue, 07 Mar 2023 07:34:26 -0500
X-MC-Unique: LsFB9sn5N6KtJVkl7sR8cg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so18912123ede.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 04:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678192465;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKnr0DUp/m2+BwAmLNBkIvjqUTFOrVYFFcfsOrK3Ipk=;
 b=VjfeOsAfDRXkigat1nelhIe5+GZuLT8DGXNOe2V3iCO/DFZ4CIlWVx+JfqtepnESfq
 nchgQqSSYnseR9aXHqaC7md7F3j6DvayJ+KZcqAPwOZobBy48U5AcVAm3ygm91ST5nNS
 7OvQTT1jOxwho5GH6cPY3j+O6fftlCUsWl2Q03fit0SGX8Xri9QIrJFbJRaxznpiooM/
 YhLoFh1J1qcIJ4OtruxDP4koImNgjcIYSlzrUQD1RD+pZ3+mQjEvOy3j9nOJqEDcghM1
 Ii1q/9KZSe2maZBHMRW/Yq/6JIn7kUqyP6iLjJ//HK65XbklaJGcRlceqTgSRg2Lf7k+
 YIzQ==
X-Gm-Message-State: AO0yUKVsE106LM4gqocmW0qZue4dlF9i+6uhqSVf+/UCV59aQUqTIHKl
 Zb/20dsn0x1E4Vv+hUEpMUG/iP5BSqtH4Ek2lxm44bC40Pnu/jDwagBy158q88rC74idsGWJK8E
 +aEk+pH9Se4e8QkurrCU5uJqp1GwW
X-Received: by 2002:a17:906:fe0c:b0:8b3:b74:aeb5 with SMTP id
 wy12-20020a170906fe0c00b008b30b74aeb5mr18325980ejb.30.1678192465825; 
 Tue, 07 Mar 2023 04:34:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8iX49b4+qtmGhtc9D6W+y2btz3BJ60OCfbE03rLGSf8RexIl8hvboRPNJlCF415awJ/SJcmQ==
X-Received: by 2002:a17:906:fe0c:b0:8b3:b74:aeb5 with SMTP id
 wy12-20020a170906fe0c00b008b30b74aeb5mr18325953ejb.30.1678192465488; 
 Tue, 07 Mar 2023 04:34:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 bl15-20020a170906c24f00b008d83ad86fe8sm6048770ejb.59.2023.03.07.04.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 04:34:24 -0800 (PST)
Message-ID: <d3a285c6-2c0b-99e8-5d98-b5eb8d44d54a@redhat.com>
Date: Tue, 7 Mar 2023 13:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] backlight: apple_bl: Use acpi_video_get_backlight_type()
To: Andy Shevchenko <andy@kernel.org>
References: <20230307120540.389920-1-hdegoede@redhat.com>
 <ZActl7YN+u7Yz58m@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZActl7YN+u7Yz58m@smile.fi.intel.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 Aditya Garg <gargaditya08@live.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/7/23 13:27, Andy Shevchenko wrote:
> On Tue, Mar 07, 2023 at 01:05:40PM +0100, Hans de Goede wrote:
>> On some MacBooks both the apple_bl and the apple-gmux backlight drivers
>> may be able to export a /sys/class/backlight device.
>>
>> To avoid having 2 backlight devices for one LCD panel until now
>> the apple-gmux driver has been calling apple_bl_unregister() to move
>> the apple_bl backlight device out of the way when it loads.
>>
>> Similar problems exist on other x86 laptops and all backlight drivers
>> which may be used on x86 laptops have moved to using
>> acpi_video_get_backlight_type() to determine whether they should load
>> or not.
>>
>> Switch apple_bl to this model too, so that it is consistent with all
>> the other x86 backlight drivers.
>>
>> Besides code-simplification and consistency this has 2 other benefits:
>>
>> 1) It removes a race during boot where userspace will briefly see
>>    an apple_bl backlight and then have it disappear again, leading to e.g.:
>>    https://bbs.archlinux.org/viewtopic.php?id=269920
>>
>> 2) This allows user to switch between the drivers by passing
>>    acpi_backlight=apple_gmux or acpi_backlight=vendor on the kernel
>>    commandline.
> 
> ...
> 
>> +	depends on ACPI_VIDEO=n || ACPI_VIDEO
> 
> I'm wondering if "imply ACPI_VIDEO" (i.o.w. weak dependency) is what suitable
> here.

No, because then if apple_bl is builtin and acpi_video is a module
we will get unresolved dependencies.

The quoted bit of Kconfig magic is exactly to avoid that scenario,
other combinations are fine (due to stubs in acpi/video.h when
disabled).

Regards,

Hans


