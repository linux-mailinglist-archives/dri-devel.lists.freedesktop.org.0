Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A93444740
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 18:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FA773927;
	Wed,  3 Nov 2021 17:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D23D73927
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yb/swhvZa5qb9s8IEKE3d1iS1AZRSbuUJkJPEO8CTz8=;
 b=LHnGDeG2uBiNlwMCAjoooXt9wc7LB5vf+n9V2T+QVViGEM3IPy3+cdrv2ofSygGrZpTJSH
 QTHPanHzjUOFBbJRlYyy4O2BxtAJ2TbCjIK14uyDx2hF76y15iooaBWu76kgjYnVPQbLHp
 WtFej1iats6cUwQiDRZKRZ1SnPYfl3g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-8wLb4A8OOVmkQ89NRWHlFA-1; Wed, 03 Nov 2021 13:34:58 -0400
X-MC-Unique: 8wLb4A8OOVmkQ89NRWHlFA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w26-20020a056402071a00b003e28a389d04so3236844edx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 10:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yb/swhvZa5qb9s8IEKE3d1iS1AZRSbuUJkJPEO8CTz8=;
 b=73MYPNetb6sDzaQ6nBdfRCPRQerADSeydf1Uqr1P1YneSZa42SkN9wuF90ZVf8QKhj
 uNGud7cGfE9Xl5pJGuR8ERK0U3RL8SxyERHw1gci9yefzsxLiHrgQHZ9DTuQjSEWSurn
 Bxavw8nVjy4mkkgFU9oek4I1pMLxK0fLABYrwg0tn7QefjBsPG+NKpLxGeCsjzJexLYt
 Ae+5v+iUbl9v03ycUq15PfjYlC0XPHCpVXch6cPkxDoh2cIhEfKSW+ciAgiGlFNajYRA
 vBGeZY3UdmP5/LdKjBaBAN/GZtwpFgVcSwsyHEGILfeDlhWrq2yQGQMDnkfC/SH/IXA7
 TyKA==
X-Gm-Message-State: AOAM53290rEfGybeENN8QXa07UwDV4ixtx/EkYqZvXuUSd+SsOhda8kP
 54GycT2z3LxHcqibrwkrbOgVaBltAjtb2CC8Fds/DsWzOkHGJ4UyGxxZtbA8qmXlaJAWBnEh2Li
 XoXRvZv5D2Sr5BMlJGCJ4KfnXTlJR
X-Received: by 2002:a05:6402:3592:: with SMTP id
 y18mr14975570edc.343.1635960897586; 
 Wed, 03 Nov 2021 10:34:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo2pD5E2wICooHHebQM64IuMPntJs+qg93HEHJGKODzPl9A5pA3BTvXoSpk9JFSezgjDKPSQ==
X-Received: by 2002:a05:6402:3592:: with SMTP id
 y18mr14975549edc.343.1635960897438; 
 Wed, 03 Nov 2021 10:34:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id de36sm1449430ejc.54.2021.11.03.10.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 10:34:57 -0700 (PDT)
Message-ID: <25338ce1-c663-3a3d-550f-5c8f74270615@redhat.com>
Date: Wed, 3 Nov 2021 18:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] backlight: lp855x: Add support ACPI enumeration
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-3-hdegoede@redhat.com>
 <20211103171756.wxthncse2f4syeiz@maple.lan>
 <5d431db5-30dc-b51c-7abb-ab57a3de2f8f@redhat.com>
 <20211103173107.xlchsysme5xzpn24@maple.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211103173107.xlchsysme5xzpn24@maple.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/3/21 18:31, Daniel Thompson wrote:
> On Wed, Nov 03, 2021 at 06:28:15PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/3/21 18:17, Daniel Thompson wrote:
>>> On Tue, Nov 02, 2021 at 11:55:04PM +0100, Hans de Goede wrote:
>>>> The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
>>>> controller for its LCD-panel, with a Xiaomi specific ACPI HID of
>>>> "XMCC0001", add support for this.
>>>>
>>>> Note the new "if (id)" check also fixes a NULL pointer deref when a user
>>>> tries to manually bind the driver from sysfs.
>>>>
>>>> When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
>>>> so the lp855x_parse_acpi() call will get optimized away.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>>
>> Thank you.
>>
>> So what is the process for upstreaming backlight patches,
>> do these go through drm-misc-next (in that case I can push
>> the series myself), or will you pick these up ?
> 
> Lee Jones gathers up the backlight patches and sends a PR (but, except
> in exceptional cases, treats my R-b as a pre-requisite before doing so).

Ok, thanks.

Regards,

Hans

