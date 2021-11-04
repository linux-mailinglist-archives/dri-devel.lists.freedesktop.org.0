Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C9F44509E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0CE6ED25;
	Thu,  4 Nov 2021 08:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F546ED25
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOpf3N8k5TmP0/CI17fGHAMr/m+bk2WcpGha5PDfEpM=;
 b=C07R68LupF1O830mwJfCZXzp3vKr6yuRDVkyYkHDGF7TGVKkQSLKLb65jQZ38vNat41U9V
 ow/4wqjNQiBKh9XuQrQY4GtSSGAzmFps7vIb3uzzqD5DS1/Qm/Z+D3Dr0EzA+E4jaSZuUI
 LUvCYo0fjvz3XX1qn5Yv6w+tJkYJ/30=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-eUiXTQN1MyeLMAwL3il3Xg-1; Thu, 04 Nov 2021 04:53:20 -0400
X-MC-Unique: eUiXTQN1MyeLMAwL3il3Xg-1
Received: by mail-ed1-f69.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so5062638edv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mOpf3N8k5TmP0/CI17fGHAMr/m+bk2WcpGha5PDfEpM=;
 b=aN44uK6MWPj/i7NI9LOvk3zSSmbVMNCWIVoVm4roPGqmdjRVB9G994C58LgR3BPrM8
 QpC8tDFv9/4AaAAaaM0ExMzGdhc8pxr+1WaW1oWAvLqQqu4/1VwEmptvDo/kBjQ7CpD6
 aRS6OrX5WPVJ+BC8D3F/ocs7JzqxGtoZmeyZBlFSqMbEARrEv7dTh+VsFjl7zoKGHkz1
 65KBTu7gSw0Wf0m1r0y4ycsaCAOyZPsauE0XJfLJRrrS9BYwQPZQul6faKLNwpd4vqHL
 xt/w24RCIo966ZxQjwMrGypMCaylPioeXc0d327A8NBxiYCuAYjcHvtpis5B77g+Tca+
 eG9w==
X-Gm-Message-State: AOAM532RwZgDfO70gQ9U+WWMWBXziCQCnKqzByOgUnl8CaXv34JH6bMQ
 NIyoh3s0qQJvlQVv5iYfIwnCO7gVO/G7pEKvJAtKwPeF1duPco0JCyA11PFwoOH4xqblcjikCNw
 QHYQpYXmtfCwmt+FfHIlPln86WAbn
X-Received: by 2002:a05:6402:35c2:: with SMTP id
 z2mr4555292edc.135.1636015998822; 
 Thu, 04 Nov 2021 01:53:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgGEBlAZl//6XVnM2bnYFzF2EV8xe3d7ZYqWOwYgQkP5rn3A+uceioa6sefusXG/b67NWtGA==
X-Received: by 2002:a05:6402:35c2:: with SMTP id
 z2mr4555279edc.135.1636015998664; 
 Thu, 04 Nov 2021 01:53:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id v10sm2453854edt.24.2021.11.04.01.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 01:53:17 -0700 (PDT)
Message-ID: <a30f80e5-9969-986c-0c27-f9a391c7686c@redhat.com>
Date: Thu, 4 Nov 2021 09:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] backlight: lp855x: Add support ACPI enumeration
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
References: <20211102225504.18920-1-hdegoede@redhat.com>
 <20211102225504.18920-3-hdegoede@redhat.com>
 <20211103171756.wxthncse2f4syeiz@maple.lan>
 <5d431db5-30dc-b51c-7abb-ab57a3de2f8f@redhat.com>
 <20211103173107.xlchsysme5xzpn24@maple.lan> <YYOZ4TI29Oq6i6za@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYOZ4TI29Oq6i6za@google.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/4/21 09:29, Lee Jones wrote:
> On Wed, 03 Nov 2021, Daniel Thompson wrote:
> 
>> On Wed, Nov 03, 2021 at 06:28:15PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 11/3/21 18:17, Daniel Thompson wrote:
>>>> On Tue, Nov 02, 2021 at 11:55:04PM +0100, Hans de Goede wrote:
>>>>> The Xiaomi Mi Pad 2 tablet uses an ACPI enumerated LP8556 backlight
>>>>> controller for its LCD-panel, with a Xiaomi specific ACPI HID of
>>>>> "XMCC0001", add support for this.
>>>>>
>>>>> Note the new "if (id)" check also fixes a NULL pointer deref when a user
>>>>> tries to manually bind the driver from sysfs.
>>>>>
>>>>> When CONFIG_ACPI is disabled acpi_match_device() will always return NULL,
>>>>> so the lp855x_parse_acpi() call will get optimized away.
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>>>
>>> Thank you.
>>>
>>> So what is the process for upstreaming backlight patches,
>>> do these go through drm-misc-next (in that case I can push
>>> the series myself), or will you pick these up ?
>>
>> Lee Jones gathers up the backlight patches and sends a PR (but, except
>> in exceptional cases, treats my R-b as a pre-requisite before doing so).
> 
> Also the merge-window is open, so this is headed for v5.17.

Right, I didn't expect anything else.

Regards,

Hans

