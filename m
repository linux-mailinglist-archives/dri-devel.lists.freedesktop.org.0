Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354FE60A346
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 13:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95A110E399;
	Mon, 24 Oct 2022 11:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0F110E3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666612389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sa227/HWN+mg/M9GF8z0s+pXLCfMWbPNsK+iHgKq07I=;
 b=HQEOtsfDJqdXysxURlrTr+Duqg+eAbg7Mym7exmsdXBZbzpIhV+4KT41EmEZdUcboJr3q5
 wOOpG9NxL+/AkxrxP3RHMrgKBQfcEkUpxtpTFOddj/415mQK68GZDpkyySAYduf5yHzRcO
 Ec/4p2kgN7U0FcL5pq/RnFDv1tp8bdM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-wtItS2-5NQO-8_pt1OZfQQ-1; Mon, 24 Oct 2022 07:53:08 -0400
X-MC-Unique: wtItS2-5NQO-8_pt1OZfQQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z11-20020a056402274b00b00461dba91468so1839169edd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 04:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sa227/HWN+mg/M9GF8z0s+pXLCfMWbPNsK+iHgKq07I=;
 b=oG1jcAFTBMQNxXOCn1aseggdThxtx85mhrfmUIMA3Mm4mUQX7H2RPMEb+OgsfNYreh
 KTjet6DPNCV7lAaaIQE7bckbiKJ7PL93IIqq3J9mfRlXH52GpnI74e3uwHKoYmo2jUm9
 PjZoAHvMafbW+m2bDsgPh4CCVufYcSbNTa41gVBK5eiRsXyFWz4OKf08lpBBrXVi118c
 gragDgRttsO4lb9kdJeiQTn9W30L6EyRcKo6H1jlcLZyo07PhyxuJUzBGIwIs0t5nCAS
 RO+36cz+EyCkA0fLTAAKftBy085jFdT4p3qxf/MbuybgYZGo47A7dtfjuUz+sFDb94hG
 OtLw==
X-Gm-Message-State: ACrzQf0nxRGNNZ941/CsTelU9pawKi7OfGNdsFSmzaxC+T+j0bDpBCVA
 xxNR+syOtQsg/Vnk9Gwv1FTDRkmw0gqY15MHYZ8BhjzrwMn2gv9Xkj3dx1wAY1lTOZa2iNfw80/
 +9VybwiPWHm675DMcERJvyHDBQJjo
X-Received: by 2002:a17:907:608f:b0:78e:1b60:60e2 with SMTP id
 ht15-20020a170907608f00b0078e1b6060e2mr27603525ejc.382.1666612387371; 
 Mon, 24 Oct 2022 04:53:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rKjf9vFNIG71zIVFmhWoGUssYXpRCR0TKoudwiSS8QTCTafqY38Nm8/FfK1Fy5krk9VAMgg==
X-Received: by 2002:a17:907:608f:b0:78e:1b60:60e2 with SMTP id
 ht15-20020a170907608f00b0078e1b6060e2mr27603473ejc.382.1666612387069; 
 Mon, 24 Oct 2022 04:53:07 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a1709070b0300b007ab2d744801sm17394ejl.190.2022.10.24.04.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 04:53:06 -0700 (PDT)
Message-ID: <746e5cc6-516f-8f69-9d4b-8fe237de8fd6@redhat.com>
Date: Mon, 24 Oct 2022 13:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 00/22] Fallback to native backlight
To: Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
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

Hi Akihiko,

On 10/24/22 13:34, Akihiko Odaki wrote:
> Commit 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native()
> helper") and following commits made native backlight unavailable if
> CONFIG_ACPI_VIDEO is set and the backlight feature of ACPI video is
> unavailable, which broke the backlight functionality on Lenovo ThinkPad
> C13 Yoga Chromebook. Allow to fall back to native backlight in such
> cases.

I appreciate your work on this, but what this in essence does is
it allows 2 backlight drivers (vendor + native) to get registered
for the same panel again. While the whole goal of the backlight refactor
series landing in 6.1 was to make it so that there always is only
*1* backlight device registered instead of (possibly) registering
multiple and letting userspace figure it out. It is also important
to only always have 1 backlight device per panel for further
upcoming changes.

So nack for this solution, sorry.

I am aware that this breaks backlight control on some Chromebooks,
this was already reported and I wrote a long reply explaining why
things are done the way they are done now and also suggesting
2 possible (much simpler) fixes, see:
https://lore.kernel.org/linux-acpi/42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com/

Unfortunately the reported has not followed-up on this and
I don't have the hardware to test this myself.

Can you please try implementing 1 of the fixes suggested there
and then submit that upstream ?

Regards,

Hans









> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> Akihiko Odaki (22):
>   drm/i915/opregion: Improve backlight request condition
>   ACPI: video: Introduce acpi_video_get_backlight_types()
>   LoongArch: Use acpi_video_get_backlight_types()
>   platform/x86: acer-wmi: Use acpi_video_get_backlight_types()
>   platform/x86: asus-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: asus-wmi: Use acpi_video_get_backlight_types()
>   platform/x86: compal-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: eeepc-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: fujitsu-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: ideapad-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: msi-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: msi-wmi: Use acpi_video_get_backlight_types()
>   platform/x86: nvidia-wmi-ec-backlight: Use
>     acpi_video_get_backlight_types()
>   platform/x86: panasonic-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: samsung-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: sony-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: thinkpad_acpi: Use acpi_video_get_backlight_types()
>   platform/x86: toshiba_acpi: Use acpi_video_get_backlight_types()
>   platform/x86: dell-laptop: Use acpi_video_get_backlight_types()
>   platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
>   ACPI: video: Remove acpi_video_get_backlight_type()
>   ACPI: video: Fallback to native backlight
> 
>  Documentation/gpu/todo.rst                    |  8 +--
>  drivers/acpi/acpi_video.c                     |  2 +-
>  drivers/acpi/video_detect.c                   | 54 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_opregion.c |  3 +-
>  drivers/platform/loongarch/loongson-laptop.c  |  4 +-
>  drivers/platform/x86/acer-wmi.c               |  2 +-
>  drivers/platform/x86/asus-laptop.c            |  2 +-
>  drivers/platform/x86/asus-wmi.c               |  4 +-
>  drivers/platform/x86/compal-laptop.c          |  2 +-
>  drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>  drivers/platform/x86/eeepc-laptop.c           |  2 +-
>  drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>  drivers/platform/x86/ideapad-laptop.c         |  2 +-
>  drivers/platform/x86/intel/oaktrail.c         |  2 +-
>  drivers/platform/x86/msi-laptop.c             |  2 +-
>  drivers/platform/x86/msi-wmi.c                |  2 +-
>  .../platform/x86/nvidia-wmi-ec-backlight.c    |  2 +-
>  drivers/platform/x86/panasonic-laptop.c       |  2 +-
>  drivers/platform/x86/samsung-laptop.c         |  2 +-
>  drivers/platform/x86/sony-laptop.c            |  2 +-
>  drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>  drivers/platform/x86/toshiba_acpi.c           |  2 +-
>  drivers/video/backlight/backlight.c           | 18 +++++++
>  include/acpi/video.h                          | 21 ++++----
>  include/linux/backlight.h                     |  1 +
>  25 files changed, 85 insertions(+), 66 deletions(-)
> 

