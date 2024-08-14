Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7492E9524EA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 23:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8024310E21D;
	Wed, 14 Aug 2024 21:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Pg+Onfel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDBA10E21D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1723672090; x=1724276890; i=wahrenst@gmx.net;
 bh=a4cwnQHKiu5urDRMftjd63h+pvYkzJCZA4nobLiw/Lg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Pg+OnfelHGEfkqnKy6TAobor8t6PaCjZ3il4jk7ebYU8+53PRaoJzFEuuC9s6bbU
 3a4hfccjmxENbuSpJnUMEbcTNr8XMlqdZAH892QDvgrcaaRFcp1yB2vFcXin8RANJ
 gMzZoC5WMrlyZKVScls9C7HEsO4z0TNRz3Zlw8fRz4m4SSo3whNrl7BC+W3Vc7ixP
 4pwHfVEUMnLb0I4tjnKED9c60839RL9gsE2mra0ntDEq4KgbXLZ3q/7epdRYrVym3
 Jig93HmJ6crocaZs/ZGLpjpzf3yEAXNSlPsEjq7GgrCo22Dw2jwGXEFOydtXOR739
 1Cjz6WUpqjBRSO+iGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zBb-1sA1852k9T-015yGh; Wed, 14
 Aug 2024 23:48:10 +0200
Message-ID: <51b63ea5-808e-41e4-92a9-50e20afd155b@gmx.net>
Date: Wed, 14 Aug 2024 23:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Ulf Hansson <ulf.hansson@linaro.org>, Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net>
 <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
 <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
 <CAPDyKFpj0C1Bifmx=4zH3r8YooOrNfn_iDB+1sfRb0gTaKnT2Q@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPDyKFpj0C1Bifmx=4zH3r8YooOrNfn_iDB+1sfRb0gTaKnT2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Neb90NJDGr022IsDGyukxUd/QvYbRXQYuQNwJx8OVxVcCNc0sL6
 ZLBkxVMm7gvC293Oy+VeB8xuAM+5LI+Zwg7Vwswer8QGyNfxbHur9N2mA3eJ/liRgEStIqf
 35hfSYTyr4AvqXj8wrD/icF+XsXs8xQyRV8NxawG4fSGtgwLShC3XAf+6+GivK3d2Auiirr
 vev0GzbQspidwZ/qhqFEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0ECwtENLL7U=;lNFcMDLmmp7vmvfrbe5CVPs28Er
 Z5RhmLPdSi1ythPp+YGnnrM5sajQK6y+TNsGlxpJf5yWrOBcBfNwPpgQDG1niL2WbQZCj6D/S
 bWop5Dx8iDrIMscCTnpIPZkuzMGbprK4Emd8NQEAr9ZU12gFRuV6eUDnSCOC1dHy0XTMEkmhm
 vWxab0ac8TE1L306pCSMpLHdD9k72OHAN9Puj8K8eWt96oLCPjfLXDzbAv01FHwETgMqgywnB
 Q6QbZNbMbGVp85inx7y0SE1tWnUW+jlqu+Whj4809i5DSF1irkxU4trgmejIR1GqFbZ1brThI
 u2mDZbS6ID9LL+HnQSksDO1MaOLEJLw32VhT+GpSxz0GbFlXM6APg5myTvUSsrpTWDas+ebT4
 WzOe33mnF2HFNf7rUxzt4/vurPxPKXj9Jaa/PRHig4a+JorbprB95R7oV1Eunwv3ufqVKt6sp
 sPEVnE1xWmE27tax7gWyLjdHkxEmRfk27Esz8BN1sUuMpHsi/fB+vlPbK8N3Js3dl87lGHFSV
 F7LfZx8lEYivx3Eaf/FIwZUce2qqKg9hYe2JulU51OeH5MMUd2vSzzr8ZGKwBDPgEg8KOTp89
 WqFT4iPtFwItmXo/2kTDSHLWM3846xrpGNvSVHX0kzyXc30q1nViXwZL2v8yzgUfVfPLBvxV3
 r6POlvhicFYJAYQu3G2JyqowEJ20RR+yk7BnsrHQcIyntSj4lR/UMBUxbpSZGAEGtJP91RHTq
 GpfcEWhP2YtgFATBAQDPq+NOA/lwchNf9TDHXHpt8RvoFzK+AXiR1DblNtw2npBgGX+r4AYwZ
 0OFSm18/a+22vvuvgxMX7fuA==
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

Am 14.08.24 um 14:01 schrieb Ulf Hansson:
> On Tue, 13 Aug 2024 at 21:57, Doug Anderson <dianders@chromium.org> wrot=
e:
>> Hi,
>>
>> On Mon, Aug 12, 2024 at 4:48=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net=
> wrote:
>>> Hi Doug,
>>>
>>> Am 28.07.24 um 15:00 schrieb Stefan Wahren:
>>>> DO NOT MERGE
>>>>
>>>> According to the dt-bindings there are some platforms, which have a
>>>> dedicated USB power domain for DWC2 IP core supply. If the power doma=
in
>>>> is switched off during system suspend then all USB register will lose
>>>> their settings.
>>>>
>>>> So use the power on/off notifier in order to save & restore the USB
>>>> registers during system suspend.
>>> sorry for bothering you with this DWC2 stuff, but it would great if yo=
u
>>> can gave some feedback about this patch.
>> Boy, it's been _ages_ since I looked at anything to do with dwc2, but
>> I still have some fondness in my heart for the crufty old driver :-P I
>> know I was involved with some of the patches to get
>> wakeup-from-suspend working on dwc2 host controllers in the past but,
>> if I remember correctly, I mostly shepherded / fixed patches from
>> Rockchip. Not sure I can spend the days trawling through the driver
>> and testing things with printk that really answering properly would
>> need, but let's see...
Yes, this was more a cry for help, because i didn't get much feedback
yet here [1] [2]. So i searched for the most elegant solution via trial
& error and this patch is the outcome. One reason why this is still WIP,
is that i didn't test the gadget role path yet.
>>
>>> I was working a lot to get
>>> suspend to idle working on Raspberry Pi. And this patch is the most
>>> complex part of the series.
>>>
>>> Would you agree with this approach or did i miss something?
>>>
>>> The problem is that the power domain driver acts independent from dwc2=
,
>>> so we cannot prevent the USB domain power down except declaring a USB
>>> device as wakeup source. So i decided to use the notifier approach. Th=
is
>>> has been successful tested on some older Raspberry Pi boards.
>> My genpd knowledge is probably not as good as it should be. Don't tell
>> anyone (aside from all the people and lists CCed here). ;-)
>>
>> ...so I guess you're relying on the fact that
>> dev_pm_genpd_add_notifier() will return an error if a power-domain
>> wasn't specified for dwc2 in the device tree, then you ignore that
>> error and your callback will never happen. You assume that the power
>> domain isn't specified then the dwc2 registers will be saved?
Yes, on Raspberry Pi we needed to implement the power domain driver to
enable USB at the first place.
>> I guess one thing is that I'd wonder if that's really reliable. Maybe
>> some dwc2 controllers lose their registers over system suspend but
>> _don't_ specify a power domain? Maybe the USB controller just gets its
>> power yanked as part of system suspend. Maybe that's why the functions
>> for saving / restoring registers are already there? It looks like
>> there are ways for various platforms to specify that registers are
>> lost in some cases...
Yes, the DT property "snps,need-phy-for-wake" is such a case. But the
PHY on Raspberry Pi is currently modeled as a no-op.
>> ...but I guess you can't use the existing ways to say that registers
>> are lost because you're trying to be dynamic.
Yes, before this patch the DWC2 doesn't know if the USB domain is
powered down during suspend. So the notifier seems the most elegant
solution to me.
>> You're saying that your
>> registers get saved _unless_ the power domain gets turned off, right?
On BCM2835 there is no need to store the registers because there is no
power management supported by USB core except of the power domain. So
DWC2 don't expect a register loss.
>> ...and the device core keeps power domains on for suspended devices if
>> they are wakeup sources, which makes sense.
>>
>> So with that, your patch sounds like a plausible way to do it. I guess
>> one other way to do it would be some sort of "canary" approach. You
>> could _always_ save registers and then, at resume time, you could
>> detect if some "canary" register had reset to its power-on default. If
>> you see this then you can assume power was lost and re-init all the
>> registers. This could be pretty much any register that you know won't
>> be its power on default. In some ways a "canary" approach is uglier
>> but it also might be more reliable across more configurations?
I don't have enough knowledge about DWC2 and i also don't have the
databook to figure out if there is a magic register which could be used
for the canary approach. But all these different platforms, host vs
gadget role, different low modes let me think the resulting solution
would be also fragile and ugly.
>> I guess those would be my main thoughts on the topic. Is that roughly
>> the feedback you were looking for?
Yes, thank you. This was very helpful.
> Thanks Doug for sharing your thoughts. For the record, I agree with
> these suggestions.
>
> Using the genpd on/off notifiers is certainly fine, but doing a
> save/restore unconditionally via some of the PM callbacks is usually
> preferred - if it works.

I tried the latter one before without success. Because the DWC2 is aware
that the BCM2835 IP doesn't support any power saving mode, the USB core
stays fully functional in suspend and register restoring on resume
tramples newer registers values.

Best regards

[1] -
https://lore.kernel.org/linux-usb/3fd0c2fb-4752-45b3-94eb-42352703e1fd@gmx=
.net/
[2] -
https://lore.kernel.org/linux-usb/e4532055-c5d6-4ac9-8bbb-b9df18fa178b@gmx=
.net/
>
> Kind regards
> Uffe

