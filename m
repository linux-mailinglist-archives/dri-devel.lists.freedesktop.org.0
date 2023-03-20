Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBDD6C2153
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B6110E2EA;
	Mon, 20 Mar 2023 19:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2937E10E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1679340345; i=deller@gmx.de;
 bh=xWW/WTFhVKKGNWk5U6QoFA+CATJoBZI64QDbG8LzlZY=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=UWtFM3xkXXVjwslnmwtbtGcioAVvus0tPvGI/laJgNJwPcWRjqbSEN0awSr6WE4qk
 iJ15ba3D6XOYTWrXBC4JdhWzcHuyN+Slf6qFwnQZzshlc+JktJJRt7Gb6N2hMIgm50
 PqrhHPbjdS1PadCbw3PPBbsXEmgrDt2SndjWpYBzpA5fLgF6v6ke++xLMqWkhBvAQw
 GYf3k+lN78TrXw6HkAbkTXcCfDuv0JlOYnRf8BzaIdAxY2REs6J2yR1uj3FBU2g8kj
 kRuJww6PVyWd+vcQBJx5W4Ko9Xdei04cXSr2gAwDkKyBb4wDaSYn9eTkNUUFb+vMRE
 SmRUSuw955UgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.156.27]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Bk-1qJOuM3Lte-00oEJb; Mon, 20
 Mar 2023 20:25:44 +0100
Message-ID: <6cc3d747-94ed-d494-1cda-fd054747c62b@gmx.de>
Date: Mon, 20 Mar 2023 20:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, geert+renesas@glider.be,
 timur@kernel.org, rdunlap@infradead.org, paulus@samba.org,
 benh@kernel.crashing.org, linux@armlinux.org.uk, pjones@redhat.com,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com, corbet@lwn.net
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <2d278ea0-287c-dbaf-f0c0-cd1fb5a9bc31@suse.de>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 000/101] fbdev: Fix memory leak in option parsing
In-Reply-To: <2d278ea0-287c-dbaf-f0c0-cd1fb5a9bc31@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bHMxN4mVzdPCgWdsx7xrWWNFncIulKmhCjvdTpNQcfkOUxRg8cw
 hiO568DeslCHMR08YodclmkxV4sBJNi77nzr/06nrmNvR6cXmlcfZhTYcKjj5L/CxrAZP+s
 D4TnNER/KW93WoVpuLXmYbUTRFHwZgXLqBSTfMyx3SkwIQ7ph3aWYrSGERRkTtIiQf3IxDA
 oR5ztzU71wg/ogtCfwaFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DojqT4mx8HE=;cwu4pdgDkwH/6HngqV8xbljlIxo
 jOncHtdRLWGpFwH6IIuKl6up0EJ9MD6w4S4Thu5XcVHd6RCClQIzAUWTn9QBq+5qUx5rwjsyP
 zHP2lP+Up3puXak3QsrzBSoL2z3+RAXom2WMoOgjWWfg2iSw1ZTfOEGOyEbTzxQ1GWdU0Ju3j
 g6ZaGiFTkUkMWq4Uiw/ZkVAieDJnPNLOVMWvSYhzsLO3ua0qNL89H3EuRYdsgVaF/djjD26YN
 H9+tpZoZNiD1KF4j4VE9heHjxyvi9rsHE4fHNBukFZwnL/isfd7m7owo5umIWrdx530YypqtB
 A2htJkDJsjJ6ni8BQLR42rMq+LLuPvxkyIGY7mNTKat1q59mkZBAUOW0ot8EQdYmcC5nt4eSy
 xBp1tn3JLQ/7P970iTns3IZo42GPT+rHPtqDa8LVj5cZvPnA9tRWDk5thi0e637h5AjcDNagG
 cnoT7mUHy/aQ+xGYsrqI+cxcllT/KRMT7AfuT9dplPBqTe4+555fvwpv/3/XFQRTmhLfyl2u7
 kR1tZtrFOspoKd7i34tDx4wn67iDK4TU3sclnmMaUMMhFLBd15tm4q7ismq+BeQv9y+obQWbI
 j9Kv4FtGMiILOPwz/A1yjZzhtwhjNBxZh9TG986KTfl+mkXwnOVNdDnxdCuEivYna9y3kw0gD
 cxr5bmFkBlDhZEcu+m2Lzvj4WfaAo2w004g5KGciBFfzyHDF0F1ALVAyhzOGN475jtkSbImfL
 exMX5SqyrLuFIg6EYeShGGJtuPyeokQ+z2g87g1Axhx3qDvR5ZOEWyar2yaT1/fB2GZMZRqaB
 5WDTVwWaeVAChT89bmAtUEHWK8v1LY/W9rg1LtcV5U9aqnKNr/RdHcyfkyeQQMWcZeadPkjWm
 K/SHzKqr59Vi7JISlrYLlqO9W1WAUumGaxWovZOWS3bmUpOvnIP81h+vxPSyBq/tbXtS8ImTg
 LAScYNHOyTPhzquUj2JcRXX4f1s=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 3/20/23 11:07, Thomas Zimmermann wrote:
> Geert, Helge?=C2=A0 Do you have further comments?=C2=A0 There's not real=
ly much for a v3 yet.

I understand the motivation and I see you invested a lot of work on it,
which is really appreciated.
But I have mixed feelings about that patch itself.

Nevertheless, it mixes multiple things.
Regarding the possible memory leak (for the parameter) you added in variou=
s
places a kfree(), but this doesn't make it easier for the driver author to=
 know
when to free and when not.
I wonder if it would be possible to store the kstrdup() value in the
"struct module" (or somewhere module related) instead add kfree it at a ce=
ntral place when the
module is unloaded (instead inside the driver itself). That way no driver =
needs
to be touched and there are less changes necessary.
And it would change it back to globally-owned strings.

With such a change I think the new command parsing functions wouldn't be n=
eeded
either, and ideally, where possible, a conversion to module_param() in var=
ious
places would be better.

I'm sure I haven't overlooked everything yet, but I think if we can reduce
the necessary changes by fixing things globally it makes more sense.

Helge

>
> Best regards
> Thomas
>
> Am 09.03.23 um 17:00 schrieb Thomas Zimmermann:
>> Introduce struct option_iter and helpers to parse command-line
>> options with comma-separated key-value pairs. Then convert fbdev
>> drivers to the new interface. Fixes a memory leak in the parsing of
>> the video=3D option.
>>
>> Before commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings to
>> caller; clarify ownership"), a call to fb_get_options() either
>> returned an internal string or a duplicated string; hence ownership of
>> the string's memory buffer was not well defined, but depended on how
>> users specified the video=3D option on the kernel command line. For
>> global settings, the caller owned the returned memory and for per-drive=
r
>> settings, fb_get_options() owned the memory. As calling drivers were
>> unable to detect the case, they had no option but to leak the the memor=
y.
>>
>> Commit 73ce73c30ba9 ("fbdev: Transfer video=3D option strings to caller=
;
>> clarify ownership") changed semantics to caller-owned strings. Drivers
>> still leaked the memory, but at least ownership was clear.
>>
>> This patchset fixes the memory leak and changes string ownership back
>> to fb_get_options(). Patch 1 introduces struct option_iter and a few
>> helpers. The interface takes an option string, such as video=3D, in the
>> common form value1,key2:value2,value3 etc and returns the individual
>> comma-separated pairs. Various modules use this pattern, so the code
>> is located under lib/.
>>
>> Patches 2 to 100 go through fbdev drivers and convert them to the new
>> interface. This often requires a number of cleanups. A driver would
>> typically refer to the option string's video mode. Such strings are now
>> copied to driver-allocated memory so that drivers don't refer directly
>> to the option string's memory. The option iterator then replaces manual
>> parsing loops based on strsep(","). All driver-allocated memory is
>> released by removing the device or unloading the module.
>>
>> Patch 101 finally changes the ownership of the option string to be
>> internal to fb_get_option(); thereby fixing the memory leak. The option
>> iterator holds its own copy of the string and is not affected by the
>> change.
>>
>> Most fbdev drivers only support to parse option strings if they are
>> built-in. I assume that's because of the original fuzzy semantics of
>> fb_get_options(). A later patchset could change the driver to respect
>> video=3D settings in any configuration.
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* use kstrdup()/kfree() for video strings (Geer=
t, Timur)
>> =C2=A0=C2=A0=C2=A0=C2=A0* fix iterator docs (Randy)
>> =C2=A0=C2=A0=C2=A0=C2=A0* update iterator interface
>>
>> Thomas Zimmermann (101):
>> =C2=A0=C2=A0 lib: Add option iterator
>> =C2=A0=C2=A0 fbdev/68328fb: Remove trailing whitespaces
>> =C2=A0=C2=A0 fbdev/68328fb: Remove unused option string
>> =C2=A0=C2=A0 fbdev/acornfb: Only init fb_info once
>> =C2=A0=C2=A0 fbdev/acornfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/amifb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/amifb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/arkfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/atafb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/atafb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/aty: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/aty: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/au1100fb: Parse option string with struct option_ite=
r
>> =C2=A0=C2=A0 fbdev/au1200fb: Parse option string with struct option_ite=
r
>> =C2=A0=C2=A0 fbdev/cirrusfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/cirrusfb: Parse option string with struct option_ite=
r
>> =C2=A0=C2=A0 fbdev/controlfb: Remove trailing whitespaces
>> =C2=A0=C2=A0 fbdev/controlfb: Parse option string with struct option_it=
er
>> =C2=A0=C2=A0 fbdev/cyber2000fb: Parse option string with struct option_=
iter
>> =C2=A0=C2=A0 fbdev/efifb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/fm2fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/fsl-diu-fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/fsl-diu-fb: Parse option string with struct option_i=
ter
>> =C2=A0=C2=A0 fbdev/gbefb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/gbefb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/geode: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/geode: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/grvga: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/grvga: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/gxt4500: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/hyperv_fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/i740fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/i740fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/i810: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/i810: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/imsttfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/intelfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/intelfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/imxfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/imxfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/kyrofb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/kyrofb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/macfb: Remove trailing whitespaces
>> =C2=A0=C2=A0 fbdev/macfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/matroxfb: Parse option string with struct option_ite=
r
>> =C2=A0=C2=A0 fbdev/mx3fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/mx3fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/neofb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/neofb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/nvidiafb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/nvidiafb: Parse option string with struct option_ite=
r
>> =C2=A0=C2=A0 fbdev/ocfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/ocfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/omapfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/platinumfb: Remove trailing whitespaces
>> =C2=A0=C2=A0 fbdev/platinumfb: Parse option string with struct option_i=
ter
>> =C2=A0=C2=A0 fbdev/pm2fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/pm2fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/pm3fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/pm3fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/ps3fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/ps3fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/pvr2fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/pvr2fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/pxafb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/rivafb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/rivafb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/s3fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/s3fb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/savagefb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/savagefb: Parse option string with struct option_ite=
r
>> =C2=A0=C2=A0 fbdev/sisfb: Constify mode string
>> =C2=A0=C2=A0 fbdev/sisfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/skeletonfb: Parse option string with struct option_i=
ter
>> =C2=A0=C2=A0 fbdev/sm712fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/sstfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/sstfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/stifb: Remove trailing whitespaces
>> =C2=A0=C2=A0 fbdev/stifb: Constify option string
>> =C2=A0=C2=A0 fbdev/tdfxfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/tdfxfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/tgafb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/tgafb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/tmiofb: Remove unused option string
>> =C2=A0=C2=A0 fbdev/tridentfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/tridentfb: Parse option string with struct option_it=
er
>> =C2=A0=C2=A0 fbdev/uvesafb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/uvesafb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/valkyriefb: Remove trailing whitespaces
>> =C2=A0=C2=A0 fbdev/valkyriefb: Parse option string with struct option_i=
ter
>> =C2=A0=C2=A0 fbdev/vermilion: Remove unused option string
>> =C2=A0=C2=A0 fbdev/vesafb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/vfb: Remove trailing whitespaces
>> =C2=A0=C2=A0 fbdev/vfb: Duplicate video-mode option string
>> =C2=A0=C2=A0 fbdev/vfb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/viafb: Parse option string with struct option_iter
>> =C2=A0=C2=A0 fbdev/vt8623fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 staging/sm750fb: Release g_settings in module-exit functio=
n
>> =C2=A0=C2=A0 staging/sm750fb: Duplicate video-mode option string
>> =C2=A0=C2=A0 staging/sm750fb: Parse option string with struct option_it=
er
>> =C2=A0=C2=A0 fbdev: Constify option strings
>>
>> =C2=A0 Documentation/core-api/kernel-api.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 ++
>> =C2=A0 drivers/staging/sm750fb/sm750.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 63 ++++----
>> =C2=A0 drivers/video/fbdev/68328fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +--
>> =C2=A0 drivers/video/fbdev/acornfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23 ++-
>> =C2=A0 drivers/video/fbdev/amifb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 +--
>> =C2=A0 drivers/video/fbdev/arkfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 10 +-
>> =C2=A0 drivers/video/fbdev/atafb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 21 +--
>> =C2=A0 drivers/video/fbdev/aty/aty128fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 ++-
>> =C2=A0 drivers/video/fbdev/aty/atyfb_base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23 ++-
>> =C2=A0 drivers/video/fbdev/aty/radeon_base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 26 +--
>> =C2=A0 drivers/video/fbdev/au1100fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 +-
>> =C2=A0 drivers/video/fbdev/au1200fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +-
>> =C2=A0 drivers/video/fbdev/cirrusfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 ++--
>> =C2=A0 drivers/video/fbdev/controlfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 +++---
>> =C2=A0 drivers/video/fbdev/core/fb_cmdline.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 13 +-
>> =C2=A0 drivers/video/fbdev/core/modedb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
>> =C2=A0 drivers/video/fbdev/cyber2000fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +-
>> =C2=A0 drivers/video/fbdev/efifb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 44 ++---
>> =C2=A0 drivers/video/fbdev/ep93xx-fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 drivers/video/fbdev/fm2fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 14 +-
>> =C2=A0 drivers/video/fbdev/fsl-diu-fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +--
>> =C2=A0 drivers/video/fbdev/gbefb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 +--
>> =C2=A0 drivers/video/fbdev/geode/gx1fb_core.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 16 +-
>> =C2=A0 drivers/video/fbdev/geode/gxfb_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 23 +--
>> =C2=A0 drivers/video/fbdev/geode/lxfb_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 25 +--
>> =C2=A0 drivers/video/fbdev/grvga.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 18 ++-
>> =C2=A0 drivers/video/fbdev/gxt4500.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 +-
>> =C2=A0 drivers/video/fbdev/hyperv_fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 ++-
>> =C2=A0 drivers/video/fbdev/i740fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +-=
-
>> =C2=A0 drivers/video/fbdev/i810/i810_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++-
>> =C2=A0 drivers/video/fbdev/imsttfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
>> =C2=A0 drivers/video/fbdev/imxfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 21 +--
>> =C2=A0 drivers/video/fbdev/intelfb/intelfbdrv.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 23 ++-
>> =C2=A0 drivers/video/fbdev/kyro/fbdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 ++-
>> =C2=A0 drivers/video/fbdev/macfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 26 +--
>> =C2=A0 drivers/video/fbdev/matrox/matroxfb_base.c=C2=A0=C2=A0 |=C2=A0 1=
9 +--
>> =C2=A0 drivers/video/fbdev/mx3fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 ++-
>> =C2=A0 drivers/video/fbdev/neofb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 26 +--
>> =C2=A0 drivers/video/fbdev/nvidia/nvidia.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++-
>> =C2=A0 drivers/video/fbdev/ocfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 21 ++-
>> =C2=A0 drivers/video/fbdev/omap/omapfb_main.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 15 +-
>> =C2=A0 drivers/video/fbdev/platinumfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 44 ++---
>> =C2=A0 drivers/video/fbdev/pm2fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 25 +--
>> =C2=A0 drivers/video/fbdev/pm3fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 27 ++--
>> =C2=A0 drivers/video/fbdev/ps3fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 28 ++--
>> =C2=A0 drivers/video/fbdev/pvr2fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 32 ++=
--
>> =C2=A0 drivers/video/fbdev/pxafb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 18 ++-
>> =C2=A0 drivers/video/fbdev/riva/fbdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++-
>> =C2=A0 drivers/video/fbdev/s3fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 27 ++--
>> =C2=A0 drivers/video/fbdev/savage/savagefb_driver.c |=C2=A0 20 ++-
>> =C2=A0 drivers/video/fbdev/sis/sis_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +--
>> =C2=A0 drivers/video/fbdev/skeletonfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +-
>> =C2=A0 drivers/video/fbdev/sm712fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +-
>> =C2=A0 drivers/video/fbdev/sstfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 25 +--
>> =C2=A0 drivers/video/fbdev/stifb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 162 +=
++++++++----------
>> =C2=A0 drivers/video/fbdev/tdfxfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 ++=
-
>> =C2=A0 drivers/video/fbdev/tgafb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 30 ++--
>> =C2=A0 drivers/video/fbdev/tmiofb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 +-=
-
>> =C2=A0 drivers/video/fbdev/tridentfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 27 ++--
>> =C2=A0 drivers/video/fbdev/uvesafb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 ++-
>> =C2=A0 drivers/video/fbdev/valkyriefb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 ++--
>> =C2=A0 drivers/video/fbdev/vermilion/vermilion.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 7 +-
>> =C2=A0 drivers/video/fbdev/vesafb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
>> =C2=A0 drivers/video/fbdev/vfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 35 ++--
>> =C2=A0 drivers/video/fbdev/via/viafbdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +-
>> =C2=A0 drivers/video/fbdev/vt8623fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
>> =C2=A0 include/linux/cmdline.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 36 +++++
>> =C2=A0 include/linux/fb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 lib/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
>> =C2=A0 lib/cmdline_iter.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 109 +++++++++++++
>> =C2=A0 70 files changed, 1087 insertions(+), 682 deletions(-)
>> =C2=A0 create mode 100644 include/linux/cmdline.h
>> =C2=A0 create mode 100644 lib/cmdline_iter.c
>>
>

