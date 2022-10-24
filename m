Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D460A3C1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A120D10E3CB;
	Mon, 24 Oct 2022 12:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E558910E409
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666612810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBddTd2aL3cpMShQLUMXQ70zqgPBnwYQKQRFaU3QDlI=;
 b=LLUkqdY+x5xP3ceQ+9uhgkiVRr+IP0H13sku1f1wwhqnKCTt0WuGal99lfHBGcXzEtheq8
 7LEyp/Os0Nbo/eM62jCQkdRa5D63d4iXMd+HYrVsJq+fXJTkOiserZRCwzRIZuKqZohWIC
 DHqVRiQqnK+USEK9Qitt3Z9MSoAYbU0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468--FOtbUxBM6mPuJNSPAq2TA-1; Mon, 24 Oct 2022 08:00:08 -0400
X-MC-Unique: -FOtbUxBM6mPuJNSPAq2TA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m7-20020a056402430700b0045daff6ee5dso9362744edc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 05:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBddTd2aL3cpMShQLUMXQ70zqgPBnwYQKQRFaU3QDlI=;
 b=1JBEgaroOTBVRHTYRkZ0vg7CHEStxh4D+YbGdoApUOcFaQUkgi0iYAymlIH0gfkN6q
 MAAJzJsYRiuUpkkVl0H9Y/Zih+2jpoVULbQnkh5ecjwEPEYZnoZRc4JWmSqP0XRYneTv
 VSPIL+efCmEO/qYGo+wCFsBp3bZDwGc94LuHYiPffoqrFpzYZr6sPRGlxoujy6khH02M
 TIqNF5DOJNPt+SHDSSUuT1OIyq2Zd1jWyqhwxesB2/5b4KmKuO83RWBx5hTDUpRSdPVU
 4d8jRJLmVEV4Ns+SLqQO1kGOeyBidyKdZjIYZSuzXfZU4AvpG5b4PpylUz3EUqDMeSXl
 yG2g==
X-Gm-Message-State: ACrzQf1rwJVaRibwy+rhyvm7q/6TKUIs/WMzln0gv5FWTBxLjNoNYSID
 K5a9PWs/jmq38qO1AVnunuZONicRyNfUy6fMZKPmnZ1c45Gdhs0vtGdiNCZpOEFLq2TeT8i9dlw
 MQdfQpx8WUCZ2ILY+1cjxlS7FK2Q9
X-Received: by 2002:a17:907:6e24:b0:791:905f:7881 with SMTP id
 sd36-20020a1709076e2400b00791905f7881mr27267518ejc.120.1666612806490; 
 Mon, 24 Oct 2022 05:00:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tdZDsl2pNG3Zoy+jU7SoBTHTkz51iCC/iggC9kztg6HWE+mkD8tnuNENa1Jj/GJlMZnu9qg==
X-Received: by 2002:a17:907:6e24:b0:791:905f:7881 with SMTP id
 sd36-20020a1709076e2400b00791905f7881mr27267484ejc.120.1666612806299; 
 Mon, 24 Oct 2022 05:00:06 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a17090626d400b0078907275a44sm15446126ejc.42.2022.10.24.05.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 05:00:05 -0700 (PDT)
Message-ID: <bec2bb19-392d-0a69-f8f7-66bb1f8d9495@redhat.com>
Date: Mon, 24 Oct 2022 14:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 00/22] Fallback to native backlight
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <87tu3te92n.fsf@intel.com> <18478739-625b-0c16-cd5a-e05c5372a74a@daynix.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <18478739-625b-0c16-cd5a-e05c5372a74a@daynix.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/24/22 13:56, Akihiko Odaki wrote:
> On 2022/10/24 20:48, Jani Nikula wrote:
>> On Mon, 24 Oct 2022, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>> Commit 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native()
>>> helper") and following commits made native backlight unavailable if
>>> CONFIG_ACPI_VIDEO is set and the backlight feature of ACPI video is
>>> unavailable, which broke the backlight functionality on Lenovo ThinkPad
>>> C13 Yoga Chromebook. Allow to fall back to native backlight in such
>>> cases.
>>
>> Where's the bug report with relevant logs, kconfigs, etc?
> 
> I haven't filed one. Should I? Please tell me where to report and what information you would need (to bugzilla.kernel.org with things mentioned in Documentation/admin-guide/reporting-issues.rst?)

As mentioned in my other email this is a known issue, and your effort
to fix this is appreciated very much, but I don't believe your solution
to be the right one.

See: https://lore.kernel.org/linux-acpi/42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com/
for more details and possible solutions. Please try implementing one of
those solutions for your Chromebook. I unfortunately do not have hw to
test this myself.

Regards,

Hans



> 
> Regards,
> Akihiko Odaki
> 
>>
>> BR,
>> Jani.
>>
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>
>>> Akihiko Odaki (22):
>>>    drm/i915/opregion: Improve backlight request condition
>>>    ACPI: video: Introduce acpi_video_get_backlight_types()
>>>    LoongArch: Use acpi_video_get_backlight_types()
>>>    platform/x86: acer-wmi: Use acpi_video_get_backlight_types()
>>>    platform/x86: asus-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: asus-wmi: Use acpi_video_get_backlight_types()
>>>    platform/x86: compal-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: eeepc-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: fujitsu-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: ideapad-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: msi-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: msi-wmi: Use acpi_video_get_backlight_types()
>>>    platform/x86: nvidia-wmi-ec-backlight: Use
>>>      acpi_video_get_backlight_types()
>>>    platform/x86: panasonic-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: samsung-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: sony-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: thinkpad_acpi: Use acpi_video_get_backlight_types()
>>>    platform/x86: toshiba_acpi: Use acpi_video_get_backlight_types()
>>>    platform/x86: dell-laptop: Use acpi_video_get_backlight_types()
>>>    platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
>>>    ACPI: video: Remove acpi_video_get_backlight_type()
>>>    ACPI: video: Fallback to native backlight
>>>
>>>   Documentation/gpu/todo.rst                    |  8 +--
>>>   drivers/acpi/acpi_video.c                     |  2 +-
>>>   drivers/acpi/video_detect.c                   | 54 ++++++++++---------
>>>   drivers/gpu/drm/i915/display/intel_opregion.c |  3 +-
>>>   drivers/platform/loongarch/loongson-laptop.c  |  4 +-
>>>   drivers/platform/x86/acer-wmi.c               |  2 +-
>>>   drivers/platform/x86/asus-laptop.c            |  2 +-
>>>   drivers/platform/x86/asus-wmi.c               |  4 +-
>>>   drivers/platform/x86/compal-laptop.c          |  2 +-
>>>   drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>>>   drivers/platform/x86/eeepc-laptop.c           |  2 +-
>>>   drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>>>   drivers/platform/x86/ideapad-laptop.c         |  2 +-
>>>   drivers/platform/x86/intel/oaktrail.c         |  2 +-
>>>   drivers/platform/x86/msi-laptop.c             |  2 +-
>>>   drivers/platform/x86/msi-wmi.c                |  2 +-
>>>   .../platform/x86/nvidia-wmi-ec-backlight.c    |  2 +-
>>>   drivers/platform/x86/panasonic-laptop.c       |  2 +-
>>>   drivers/platform/x86/samsung-laptop.c         |  2 +-
>>>   drivers/platform/x86/sony-laptop.c            |  2 +-
>>>   drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>>>   drivers/platform/x86/toshiba_acpi.c           |  2 +-
>>>   drivers/video/backlight/backlight.c           | 18 +++++++
>>>   include/acpi/video.h                          | 21 ++++----
>>>   include/linux/backlight.h                     |  1 +
>>>   25 files changed, 85 insertions(+), 66 deletions(-)
>>
> 

