Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848F7BD024
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 22:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E525D10E071;
	Sun,  8 Oct 2023 20:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org
 [213.239.216.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CF3710E071
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 20:52:18 +0000 (UTC)
Received: from [192.168.1.177] (unknown [10.0.0.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 4531E140495;
 Sun,  8 Oct 2023 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=donut; t=1696798334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuxrTL7KvyJ7XN5A1fs9GWsRygHQUHM6anrrqyaRV1c=;
 b=mWrLpGfLn2FuF/iVpmJZLpN8RDuXORQZCIAURsF4EvgNSQZlt1IaRv34qweKgmzYmly9LA
 QENYN7n5YqEfjn9ou2DP0UqZtp3jOzI3bb5j7an0LEMFuSxLQs7OxPopxrgupQlE1nGSOc
 GYuf/Nfea5aBrS+X0J/XxeZtDatbiaY=
Message-ID: <c3380c97-1b8c-5a68-168e-fc6150701365@postmarketos.org>
Date: Sun, 8 Oct 2023 23:52:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to
 panel-simple
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
 <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
 <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
From: Anton Bambura <jenneron@postmarketos.org>
In-Reply-To: <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 jitao.shi@mediatek.com, Anton Bambura <jenneron@protonmail.com>,
 neil.armstrong@linaro.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, matthias.bgg@gmail.com,
 quic_jesszhan@quicinc.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/5/23 21:10, Doug Anderson wrote:
> Hi,
>
> On Tue, Sep 26, 2023 at 7:01 AM Doug Anderson <dianders@chromium.org> wrote:
>> Hi,
>>
>> On Tue, Sep 26, 2023 at 1:06 AM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>> Il 26/09/23 00:00, Douglas Anderson ha scritto:
>>>> In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
>>>> panel-simple") I moved a pile of panels out of panel-simple driver
>>>> into the newly created panel-edp driver. One of those panels, however,
>>>> shouldn't have been moved.
>>>>
>>>> As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
>>>> B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used in
>>>> exynos5250-snow and exynos5420-peach-pit where it's clear that the
>>>> panel is hooked up with LVDS. Furthermore, searching for datasheets I
>>>> found one that makes it clear that this panel is LVDS.
>>>>
>>>> As far as I can tell, I got confused because in commit 88d3457ceb82
>>>> ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
>>>> Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
>>>> downstream ChromeOS trees, it seems like some Mediatek boards are
>>>> using a panel that they call "auo,b116xw03" that's an eDP panel. The
>>>> best I can guess is that they actually have a different panel that has
>>>> similar timing. If so then the proper panel should be used or they
>>>> should switch to the generic "edp-panel" compatible.
>>>>
>>>> When moving this back to panel-edp, I wasn't sure what to use for
>>>> .bus_flags and .bus_format and whether to add the extra "enable" delay
>>>> from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
>>>> backlight when power on"). I've added formats/flags/delays based on my
>>>> (inexpert) analysis of the datasheet. These are untested.
>>>>
>>>> NOTE: if/when this is backported to stable, we might run into some
>>>> trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
>>>> jacuzzi: Move panel under aux-bus") this panel was used by
>>>> "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
>>>> know what to suggest for that other than someone making up a bogus
>>>> panel for jacuzzi that's just for the stable channel.
>>>>
>>>> Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power on")
>>>> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>> ---
>>>> I haven't had a snow or peach-pit hooked up for debugging / testing
>>>> for years. I presume that they must be broken and hope that this fixes
>>>> them.
>>> We could avoid backport breakages by avoiding to backport this to any kernel
>>> that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzzi: Move
>>> panel under aux-bus")... because creating a dummy panel to get two wrongs
>>> right is definitely not ok.
>> Sure, except that leaves us with ... a breakage. :-P
>>
>> Although I haven't tested it, I have a hard time believing that
>> exynos5250-snow and exynos5420-peach-pit will work properly with the
>> panel defined as an eDP panel. That means that they will be broken. If
>> someone cared to get those fixed in a stable backport then we'd be
>> stuck deciding who to break. If you have any brilliant ideas then I'm
>> all ears.
>>
>> ...then again, I presume this has been broken since commit
>> 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
>> on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
>> things still limp along and sorta work even though the panel is
>> defined incorrectly?
> I dug out a exynos5250-snow out of my pile and booted postmarket OS on
> it, which was shockingly easy/pleasant (kudos to those involved!). I
> found that it was booting a kernel based on 6.1.24. Digging into
> sysfs, I found that indeed it appeared to be using the "panel-edp"
> driver, so I guess it is limping along with the wrong driver and wrong
> flags...
>
> It wasn't totally clear for me how to build a new kernel and deploy it
> for postmarket OS, so I wasn't able to confirm this change. I've CCed
> the person listed on the postmarket OS wiki though to see if they have
> any insight.
Tested it on peach-pit using linux-next with this patch applied. Panel 
still works and "dmesg | grep panel" returns panel_simple instead of 
panel_edp.

Tested-by: Anton Bambura <jenneron@postmarketos.org>
>
> In any case, it sounds as if things are working well enough on older
> OSes, so maybe we can just skip trying to do any stable backport on
> this. It still seems like we should land it, though, since the current
> state of the world seems pretty broken. Anyone willing to give a
> Reviewed-by or Acked-by tag?
>
> -Doug
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
