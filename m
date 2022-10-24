Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E7160A9D1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE58F10E6E3;
	Mon, 24 Oct 2022 13:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07E410E703
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666617843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm5HJkjYWeeX/qs3JDehVtgKORU0AuoMo2twQDux5eA=;
 b=QvuTAiZVFixqbJ9gwNFoP9sAfSIoneqpSNpmGv1Ar7w/4k9V/iG9AhwdmW/veoq8LBlRSJ
 9nwhfeKT+/mVnIsNARZvjjIGGizZ0fLDLtiD37Fhg+OYHmubCfHbsw+VxidcbjGnt6ixRz
 k7bbQmi4o2ZGATU+HqlCO94nHsVmVjI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-sZHEk_sJNUaUvny8n0GPhA-1; Mon, 24 Oct 2022 09:24:01 -0400
X-MC-Unique: sZHEk_sJNUaUvny8n0GPhA-1
Received: by mail-ed1-f70.google.com with SMTP id
 f16-20020a056402355000b00461cf923fdcso2434680edd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 06:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm5HJkjYWeeX/qs3JDehVtgKORU0AuoMo2twQDux5eA=;
 b=Bqb8VFbEsUwTSnrEcgf6eGbydFKkj3VrpHTdxJwSszgLdTBx9FbsvubGypUFilik9A
 CgJQd4FNmhbdLoZo+yyemqFjtxNdkKQaiYROqNqcH+ZWBwSrweLAFYs6UK7SPpNzDg9c
 YGSkbkBPCtOxl/ULhvLcJP28ZO3E2oF6DdrSAqWiRVEgC7PUXuYzHiMvSzVDBUx52VTI
 OVJRhxu5HLbmig6u3I+OHBRkKbTjukWgczwgsyDW3Ky8N7AYYkE3JBIknQgSl/28Tn+2
 HDrU6l/2qE3yRk3nCpr+/6iaILtF/nLYtx7jF/V/YJ67h1kNrjZJAT6ugb9rWzxdlzXu
 xWyQ==
X-Gm-Message-State: ACrzQf2785ykMJRh7usPNalpkhrpINCg4bAEUxqvICCg86Z9Zs+ok2A8
 QxndVGuIycLaMda/NNY61h3he+8PnuWhtGW7QnO5cIHqHVT/p4jUijZA4zqQqTAwBoNJHls9xDm
 lhlMo0DD1OJy53FDgDoFCAydwiyA/
X-Received: by 2002:a17:907:701:b0:780:2c44:e4dd with SMTP id
 xb1-20020a170907070100b007802c44e4ddmr28326838ejb.589.1666617840088; 
 Mon, 24 Oct 2022 06:24:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nRpfOUd7fXfaQxZAoL/YNjVZG4I1hOQtgleKwhNKXvtlVx02RUh+6naoowPVHW1NVhRqxQg==
X-Received: by 2002:a17:906:8a6a:b0:79e:2efe:e0 with SMTP id
 hy10-20020a1709068a6a00b0079e2efe00e0mr12680099ejc.401.1666617828842; 
 Mon, 24 Oct 2022 06:23:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a17090630db00b0073dbaeb50f6sm15619252ejb.169.2022.10.24.06.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:23:48 -0700 (PDT)
Message-ID: <84d86b61-7694-2e22-3593-b11b3ce33cf8@redhat.com>
Date: Mon, 24 Oct 2022 15:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 00/22] Fallback to native backlight
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <746e5cc6-516f-8f69-9d4b-8fe237de8fd6@redhat.com>
 <edec5950-cec8-b647-ccb1-ba48f9b3bbb0@daynix.com>
 <20221024131451.lvkesdg3kvyvbi7n@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221024131451.lvkesdg3kvyvbi7n@pali>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, platform-driver-x86@vger.kernel.org,
 devel@acpica.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/24/22 15:14, Pali Rohár wrote:
> On Monday 24 October 2022 21:58:57 Akihiko Odaki wrote:
>> Regarding the second limitation, I don't even understand the difference
>> between vendor and native. My guess is that a vendor backlight device uses
>> vendor-specific ACPI interface, and a native one directly uses hardware
>> registers. If my guess is correct, the difference between vendor and native
>> does not imply that both of them are likely to exist at the same time. As
>> the conclusion, there is no more motivation to try to de-duplicate the
>> vendor/native combination than to try to de-duplicate combination of devices
>> with a single type.
> 
> Hello! I just want to point one thing. On some Dell laptops there are
> 3 different ways (= 3 different APIs) how to control display backlight.
> There is ACPI driver (uses ACPI), GPU/DRM driver (i915.ko; uses directly
> HW) and platform vendor driver (dell-laptop.ko; uses vendor BIOS or
> firmware API).

Right and that is just one example of laptops which can register both
vendor + native backlight devices, which is why this whole series is
a bad idea.

Regards,

Hans



> Just every driver has different pre-calculated scaling
> values. So sometimes user wants to choose different driver just because
> it allows to set backlight level with "better" granularity. Registering
> all 3 device drivers is bad as user does not want to see 3 display
> panels and forcing registration of specific one without runtime option
> is also bad (some of those drivers do not have to be suitable or has
> worse granularity as other).

