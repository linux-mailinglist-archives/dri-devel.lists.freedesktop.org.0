Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82459927B12
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 18:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE48810E116;
	Thu,  4 Jul 2024 16:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="NjPL3mHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237910E116
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1720110318; x=1720715118; i=wahrenst@gmx.net;
 bh=G8nXDKhDWAf5zwXbHzmWPr4KvRFncauKrb4vRKEg3ko=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NjPL3mHLpGoKd4mDJddhb//xKf4YmbApwL8JkLoLRCnRMtpSpLV29Ur5nCqGJ0I0
 EP+z7x0d4oAsN312Gi/JuIMZLux73x7C0W/sFQiLb0Srlio0HCAJy2xPH4QdA02y/
 c06o2DVCgcQL1x8NIXYTkX+0CllFtVq/wes/TZChkxv2feRI530v7Pu56u/PoGX/c
 KjtPtgF8nAeIO5LJTcluJPRJ1d1XZOdWKGTDq/P0QxUeDTY24h5NPbu0blu45iItQ
 TtjHnHu/E/vNljG4m4kA8IuxfdX9+X+1uuf9ZYYy2yRSc5w59ae+TSmo5jnhFt8vM
 5FYiEu96Vf8jhvgmwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXUD-1sfYoD0zHr-00I3GP; Thu, 04
 Jul 2024 18:25:18 +0200
Message-ID: <4d48bbdb-91fb-46f2-b101-112f45c81cdd@gmx.net>
Date: Thu, 4 Jul 2024 18:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] drm/vc4: hdmi: Disable connector status polling
 during suspend
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-8-wahrenst@gmx.net>
 <CALeDE9OpdUntjW61i=Ge2b9uOyPKWRmeP+2ybxoNA2CR4DHWXg@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CALeDE9OpdUntjW61i=Ge2b9uOyPKWRmeP+2ybxoNA2CR4DHWXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e9DVrq5jG1tQYjou4M48Ieq6c+HG2N8PKRsDwhcsvlXjmcfHMEm
 5YgHnadFU/xlL1Bysj7N+xe+d1+LrvYXLxNNbLe5ueCdX+uJpIcbDAySg9Yu3QvHoJT03rH
 /CKZ/eYfoLstRyaKhkrZvKrTJg4H0jTt1qc2XHg19ULmAbwSIYIeo8cQ5K6/epGLpRxhg77
 hkFTF9VEg3w9zHkcBLceQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4z4MiHBYFqM=;VeOJKcvLWARNmwRjqx6xlU/V35H
 0amzJL09fb4TJD7p7usMBUW+PvbKHHHhBbtI/DMStmffuefLsHdbm4jSOFWBYN6Wn0LC8dNle
 qjJbeyh07dW1yy9uVlT9mDTerf+E5spIO8D/izpdvQdg7ZMbof9K0ION5QKNvsmeDw0kAA/Kf
 DYQIleNZkNY5c+3d3OmBQ81W6jX6MrnrLq+CyhY257AHvfiYQUSN8czl7y8q9RKXj0NVJuX3Q
 IWn0C80/cIcVQOM6yAVVfB+eRkIQzX/UcXqh6N+RIzbRZec0khkwKaMRfIIigwilECO3GXjbG
 Nlvs7g+s6bxzE9xilKE8zwyix1hsMvISlFQIRWHPT4EQ4u9WkyUSMR24BFqveNsojtIs8kQGp
 cekVd855UyIJSNmOSpBLd4wDLamAynH4pj++60eBFYsgiWuxlwdSC8Pf33NSJIueYjSEwK99M
 2bPs6higbl8WeU/BGtXt8clemiaycV5XMvsRT8ulSk8MLKJwejaml0GZpTIyfg50kBm7AKRDn
 prMsxN98XsAx45PJ5rRx5KzVQf+9WmtLXnc4UiHTMk+HqhSnZF1jgjpQFMCgAMtaAiKpt4IAj
 8uLYGD4QBNYhLXuddgt++vN6gOZZbI2eWw3JnIrLIZeIOghlGf/bG5GpHLX6LMoHHl+QxKVZf
 g9Os0+BbQunqBg8OwG5IpgGTlyorBhhO4ojgRgNL+cmV22XKQ2DzyvNEQ/KR/SmeCqEpZnAgZ
 pGlC9+OCCiuCicv+uXYBC8EiajhIGJ50VWGCat+Nztab3t8aa1nsHoMh/eV37t80GxNPVQQ+0
 2YtM56sbhygAeFhWHO2AOD9OgvfG5ZnpWi1CiwzrV49QI=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

Am 02.07.24 um 22:02 schrieb Peter Robinson:
> Hi Stefan,
>
>> Suspend of VC4 HDMI will likely triggers a warning from
>> vc4_hdmi_connector_detect_ctx() during poll of connector status.
>> The power management will prevent the resume and keep the relevant
>> power domain disabled.
>>
>> Since there is no reason to poll the connector status during
>> suspend, the polling should be disabled during this.
> What about HDMI-CEC? I don't know well enough how CEC integrates at
> this level but CEC can wake up the device over HDMI from a TV display
> for example so if this affects that, while it's maybe not required for
> first pass, I know the rpi is used in a lot of media use cases so the
> ability to wake up via CEC would certainly be welcomed.
unfortunately i don't know much about HDMI-CEC, too. The only thing I
noticed was that I currently cannot configure vc4 as a wakeup source.
