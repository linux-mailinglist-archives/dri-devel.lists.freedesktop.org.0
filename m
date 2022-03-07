Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A24CF221
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 07:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD7710E081;
	Mon,  7 Mar 2022 06:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B2010E12F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 06:45:30 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nR77V-0004Cx-NX; Mon, 07 Mar 2022 07:45:25 +0100
Message-ID: <782a683e-c625-8e68-899b-ce56939afece@leemhuis.info>
Date: Mon, 7 Mar 2022 07:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Doug Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220203093922.20754-1-tzimmermann@suse.de>
 <CAMuHMdWykWR4oKahC2GYF5jG4przRQ+MxNNm1BK7o62OhhGYwA@mail.gmail.com>
 <CAMuHMdXcRRgn4EMXn9qonnjTTp7EEfwP4F8FeVpLkQMNvB-6mg@mail.gmail.com>
 <CAD=FV=UbiXx4RBQNFp1htCYsM1YzAgES+mcA6KOJ7ZmydkHnBg@mail.gmail.com>
 <f9768b09-90a7-1908-0f5b-6474bbb00208@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <f9768b09-90a7-1908-0f5b-6474bbb00208@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1646635530;
 073516c8; 
X-HE-SMSGID: 1nR77V-0004Cx-NX
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
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[CCing Dave and Daniel]

Hi, this is your Linux kernel regression tracker.

On 23.02.22 20:06, Thomas Zimmermann wrote:
> Am 23.02.22 um 17:11 schrieb Doug Anderson:
>> On Tue, Feb 22, 2022 at 1:31 AM Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> On Tue, Feb 8, 2022 at 10:39 AM Geert Uytterhoeven
>>> <geert@linux-m68k.org> wrote:
>>>> On Mon, Feb 7, 2022 at 12:31 PM Thomas Zimmermann
>>>> <tzimmermann@suse.de> wrote:
>>>>> As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
>>>>> the option to fix the build failure. The error message is shown
>>>>> below.
>>>>>
>>>>>    arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in
>>>>> function
>>>>>      `panel_edp_probe': panel-edp.c:(.text+0xb74): undefined
>>>>> reference to
>>>>>      `drm_panel_dp_aux_backlight'
>>>>>    make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1
>>>>>
>>>>> The issue has been reported before, when DisplayPort helpers were
>>>>> hidden behind the option CONFIG_DRM_KMS_HELPER. [2]
>>>>>
>>>>> v2:
>>>>>          * fix and expand commit description (Arnd)
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>
>>>> Thanks for your patch!
>>>>
>>>> This fixes the build errors I'm seeing, so
>>>> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> Is this planned to be queued? This is still failing in drm-next.
>>> Thanks!
>>
>> Looks like this has been in drm-misc-next since Feb 4:
>>
>> ---
>>
>> commit eea89dff4c39a106f98d1cb5e4d626f8c63908b9
>> Author:     Thomas Zimmermann <tzimmermann@suse.de>
>> AuthorDate: Thu Feb 3 10:39:22 2022 +0100
>> Commit:     Thomas Zimmermann <tzimmermann@suse.de>
>> CommitDate: Fri Feb 4 09:38:47 2022 +0100
>>
>>      drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
>>
>> ---
>>
>> Maybe it needed to land elsewhere, though?
> 
> Sorry about the mess. We had some confusion with this cycle's
> drm-misc-next pull request, which got delayed significantly. There's
> been a PR today, which should be merged into drm-next any time now. The
> patch will be part of that.

The patch for this regression late last week finally showed up in
linux-next, great. But:

I noticed the patch is not in drm-fixes but in drm-next -- and thus
afaics seems to be on tack to only get merged in the next merge window
(or am I wrong with that?). That seems wrong to me, as this fixes a
regression (albeit from the previous cycle, not from the current one)
and it already took quite a while to get this relative simple fix
finally on track -- but it's still far away from getting fixed in 5.16
and thus will make it into 5.17, too. That seems wrong to me, at least
if the risk is low (which is the case here afaics).

FWIW, this is not the only time where I noticed something like that,
that's why I wrote documentation that covers this which is on track to
get merged in the next merge window, unless Linus objects:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/process/handling-regressions.rst#n131

To quote one of the sections relevant in this particular case:

>  * Aim to fix regressions within one week after the culprit was identified, if
>    the issue was introduced in either:
> 
>     * a recent stable/longterm release
> 
>     * the development cycle of the latest proper mainline release

Ciao, Thorsten
